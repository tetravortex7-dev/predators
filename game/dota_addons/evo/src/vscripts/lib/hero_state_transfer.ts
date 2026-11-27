interface SavedItemSnapshot {
    readonly slot: number;
    readonly item: CDOTA_Item;
    readonly name: string;
    readonly charges: number;
    readonly cooldown: number;
    readonly purchaseTime: number;
    readonly combineLocked: boolean;
}

interface SavedModifierSnapshot {
    readonly name: string;
    readonly duration: number;
}

export interface HeroTransferSnapshot {
    readonly position: Vector;
    readonly forward: Vector;
    readonly level: number;
    readonly xp: number;
    readonly reliableGold: number;
    readonly unreliableGold: number;
    readonly totalGold: number;
    readonly hpPct: number;
    readonly mpPct: number;
    readonly items: readonly SavedItemSnapshot[];
    readonly modifiers: readonly SavedModifierSnapshot[];
    readonly hasShard: boolean;
}

const PRESERVED_BUFF_MODIFIERS: readonly string[] = [
    "modifier_evo_peace_time",
    "modifier_rune_doubledamage",
    "modifier_rune_haste",
    "modifier_rune_regen",
    "modifier_rune_invis",
    "modifier_rune_arcane",
    "modifier_rune_shield",
    "modifier_bottle_regeneration",
    "modifier_clarity_potion",
    "modifier_flask_healing",
];

function getRestoreOrderPriority(slot: number): number {
    if (slot >= 9 && slot <= 14) return 0;
    if (slot >= 6 && slot <= 8) return 1;
    if (slot >= 0 && slot <= 5) return 2;
    return 3;
}

export function captureHeroTransferState(
    playerId: PlayerID,
    oldHero: CDOTA_BaseNPC_Hero,
    resetHeroLevel: boolean
): HeroTransferSnapshot {
    const items: SavedItemSnapshot[] = [];
    for (let slot = 0; slot <= 16; slot++) {
        const item = oldHero.GetItemInSlot(slot);
        if (!item || item.IsNull() || !IsValidEntity(item)) continue;
        const snapshot: SavedItemSnapshot = {
            slot,
            item,
            name: item.GetAbilityName(),
            charges: item.GetCurrentCharges(),
            cooldown: item.GetCooldownTimeRemaining(),
            purchaseTime: item.GetPurchaseTime(),
            combineLocked: item.IsCombineLocked(),
        };
        oldHero.TakeItem(item);
        items.push(snapshot);
    }

    const modifiers: SavedModifierSnapshot[] = [];
    for (const modName of PRESERVED_BUFF_MODIFIERS) {
        const mod = oldHero.FindModifierByName(modName);
        if (!mod) continue;
        const remaining = mod.GetRemainingTime();
        if (remaining > 0) {
            modifiers.push({ name: modName, duration: remaining });
        }
    }

    const reliableGold = PlayerResource.GetReliableGold(playerId);
    const unreliableGold = PlayerResource.GetUnreliableGold(playerId);

    return {
        position: oldHero.GetAbsOrigin(),
        forward: oldHero.GetForwardVector(),
        level: resetHeroLevel ? 1 : oldHero.GetLevel(),
        xp: resetHeroLevel ? 0 : oldHero.GetCurrentXP(),
        reliableGold,
        unreliableGold,
        totalGold: reliableGold + unreliableGold,
        hpPct: Math.max(0.01, Math.min(1, oldHero.GetHealthPercent() / 100)),
        mpPct: Math.max(0, Math.min(1, oldHero.GetManaPercent() / 100)),
        items,
        modifiers,
        hasShard: oldHero.HasModifier("modifier_item_aghanims_shard"),
    };
}

export function restoreHeroTransferState(
    playerId: PlayerID,
    newHero: CDOTA_BaseNPC_Hero,
    snapshot: HeroTransferSnapshot
): void {
    PlayerResource.SetGold(playerId, snapshot.reliableGold, true);
    PlayerResource.SetGold(playerId, snapshot.unreliableGold, false);

    const hasSavedTp = snapshot.items.some((entry) => entry.slot === 15);
    if (hasSavedTp) {
        const autoTp = newHero.GetItemInSlot(15);
        if (autoTp && !autoTp.IsNull() && IsValidEntity(autoTp)) {
            newHero.TakeItem(autoTp);
            UTIL_Remove(autoTp);
        }
    }

    const ordered = [...snapshot.items].sort(
        (a, b) => getRestoreOrderPriority(a.slot) - getRestoreOrderPriority(b.slot)
    );

    for (const saved of ordered) {
        let restored: CDOTA_Item | undefined;
        if (saved.item && !saved.item.IsNull() && IsValidEntity(saved.item)) {
            saved.item.SetOwner(newHero);
            saved.item.SetPurchaser(newHero);
            restored = newHero.AddItem(saved.item);
        }
        if (!restored || restored.IsNull() || !IsValidEntity(restored)) {
            restored = newHero.AddItemByName(saved.name);
        }
        if (!restored || restored.IsNull() || !IsValidEntity(restored)) continue;

        const currentSlot = restored.GetItemSlot();
        if (currentSlot >= 0 && currentSlot !== saved.slot) {
            newHero.SwapItems(currentSlot, saved.slot);
        }
        if (saved.charges > 0) {
            restored.SetCurrentCharges(saved.charges);
        }
        restored.SetCombineLocked(saved.combineLocked);
        restored.SetPurchaseTime(saved.purchaseTime);
        if (saved.cooldown > 0) {
            restored.StartCooldown(saved.cooldown);
        }
    }

    for (const mod of snapshot.modifiers) {
        newHero.AddNewModifier(newHero, undefined, mod.name, { duration: mod.duration });
    }
    if (snapshot.hasShard) {
        newHero.AddNewModifier(newHero, undefined, "modifier_item_aghanims_shard", {});
    }

    FindClearSpaceForUnit(newHero, snapshot.position, true);
    newHero.SetForwardVector(snapshot.forward);
    applyHeroResourceRatios(newHero, snapshot.hpPct, snapshot.mpPct);
}

export function applyHeroResourceRatios(
    hero: CDOTA_BaseNPC_Hero,
    hpPct: number,
    mpPct: number
): void {
    hero.CalculateStatBonus(true);
    const maxHp = Math.max(1, hero.GetMaxHealth());
    const maxMp = Math.max(0, hero.GetMaxMana());
    hero.SetHealth(Math.max(1, Math.min(maxHp, Math.floor(maxHp * hpPct))));
    hero.SetMana(Math.max(0, Math.min(maxMp, Math.floor(maxMp * mpPct))));
}
