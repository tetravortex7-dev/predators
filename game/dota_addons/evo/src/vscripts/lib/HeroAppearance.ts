export type RgbColor = readonly [number, number, number];

export interface WearableSpec {
    readonly model: string;
    readonly particles?: readonly string[];
    readonly color?: RgbColor;
}

export interface HeroAppearancePreset {
    readonly model?: string;
    readonly scale?: number;
    readonly color?: RgbColor;
    readonly alpha?: number;
    readonly hideBaseWearables?: boolean;
    readonly wearables?: readonly WearableSpec[];
    readonly displayName?: string;
    readonly labelColor?: RgbColor;
}

export interface ReplaceHeroOptions {
    readonly stripDefaultAbilities?: boolean;
    readonly preserveAbilities?: readonly string[];
    readonly appearance?: HeroAppearancePreset;
}

interface SavedAbilityState {
    readonly name: string;
    readonly level: number;
    readonly cooldown: number;
}

interface HeroAppearanceRuntime {
    color?: RgbColor;
    alpha?: number;
    customWearables: CBaseEntity[];
    customParticles: ParticleID[];
}

const EF_NODRAW = 32;

const KEEP_MAP_UTILITY_ABILITIES: ReadonlySet<string> = new Set([
    "abyssal_underlord_portal_warp",
    "twin_gate_portal_warp",
    "ability_pluck_famango",
    "ability_capture",
    "ability_lamp_use",
]);

export class HeroAppearance {
    private static readonly stateByHero: Map<EntityIndex, HeroAppearanceRuntime> = new Map();

    public static setScale(hero: CDOTA_BaseNPC, scale: number): void {
        if (!this.isValidUnit(hero)) return;
        hero.SetModelScale(Math.max(0.1, scale));
    }

    public static setColor(
        hero: CDOTA_BaseNPC,
        r: number,
        g: number,
        b: number,
        alpha?: number
    ): void {
        if (!this.isValidUnit(hero)) return;
        const clampedR = Math.max(0, Math.min(255, Math.round(r)));
        const clampedG = Math.max(0, Math.min(255, Math.round(g)));
        const clampedB = Math.max(0, Math.min(255, Math.round(b)));
        const clampedAlpha =
            alpha !== undefined ? Math.max(0, Math.min(255, Math.round(alpha))) : undefined;

        const state = this.getOrCreateState(hero.entindex());
        state.color = [clampedR, clampedG, clampedB];
        if (clampedAlpha !== undefined) {
            state.alpha = clampedAlpha;
        }

        hero.SetRenderColor(clampedR, clampedG, clampedB);
        if (clampedAlpha !== undefined) {
            hero.SetRenderAlpha(clampedAlpha);
        }

        this.applyColorToAttachedWearables(hero, state);
    }

    public static resetColor(hero: CDOTA_BaseNPC): void {
        this.setColor(hero, 255, 255, 255, 255);
    }

    public static hideBaseWearables(hero: CDOTA_BaseNPC): void {
        if (!this.isValidUnit(hero)) return;
        let child = hero.FirstMoveChild();
        while (child && !child.IsNull() && IsValidEntity(child)) {
            if (child.GetClassname() === "dota_item_wearable") {
                child.AddEffects(EF_NODRAW);
            }
            child = child.NextMovePeer();
        }
    }

    public static restoreBaseWearables(hero: CDOTA_BaseNPC): void {
        if (!this.isValidUnit(hero)) return;
        let child = hero.FirstMoveChild();
        while (child && !child.IsNull() && IsValidEntity(child)) {
            if (child.GetClassname() === "dota_item_wearable") {
                child.RemoveEffects(EF_NODRAW);
            }
            child = child.NextMovePeer();
        }
    }

    public static clearCustomWearables(hero: CDOTA_BaseNPC): void {
        if (!this.isValidUnit(hero)) return;
        const state = this.stateByHero.get(hero.entindex());
        if (!state) return;

        for (const particleId of state.customParticles) {
            ParticleManager.DestroyParticle(particleId, true);
            ParticleManager.ReleaseParticleIndex(particleId);
        }
        state.customParticles = [];

        for (const wearable of state.customWearables) {
            if (wearable && !wearable.IsNull() && IsValidEntity(wearable)) {
                UTIL_Remove(wearable);
            }
        }
        state.customWearables = [];
    }

    public static precacheWearables(
        wearables: readonly WearableSpec[],
        context: CScriptPrecacheContext
    ): void {
        for (const spec of wearables) {
            if (spec.model && spec.model.length > 0) {
                PrecacheModel(spec.model, context);
            }
            if (spec.particles) {
                for (const vpcf of spec.particles) {
                    if (vpcf && vpcf.length > 0) {
                        PrecacheResource("particle", vpcf, context);
                    }
                }
            }
        }
    }

    public static precachePreset(
        preset: HeroAppearancePreset,
        context: CScriptPrecacheContext
    ): void {
        if (preset.model && preset.model.length > 0) {
            PrecacheModel(preset.model, context);
        }
        if (preset.wearables) {
            this.precacheWearables(preset.wearables, context);
        }
    }

    public static equipWearables(hero: CDOTA_BaseNPC, wearables: readonly WearableSpec[]): void {
        if (!this.isValidUnit(hero)) return;
        this.clearCustomWearables(hero);

        const state = this.getOrCreateState(hero.entindex());

        for (const spec of wearables) {
            if (!spec.model || spec.model.length === 0) continue;

            const prop = SpawnEntityFromTableSynchronous("prop_dynamic", {
                model: spec.model,
            }) as CBaseModelEntity | undefined;

            if (!prop || prop.IsNull() || !IsValidEntity(prop)) continue;
            prop.FollowEntity(hero, true);

            const targetColor = spec.color ?? state.color;
            if (targetColor) {
                prop.SetRenderColor(targetColor[0], targetColor[1], targetColor[2]);
            }
            if (state.alpha !== undefined) {
                prop.SetRenderAlpha(state.alpha);
            }

            state.customWearables.push(prop);

            if (spec.particles) {
                for (const vpcf of spec.particles) {
                    if (!vpcf || vpcf.length === 0) continue;
                    const pid = ParticleManager.CreateParticle(
                        vpcf,
                        ParticleAttachment.ABSORIGIN_FOLLOW,
                        prop
                    );
                    state.customParticles.push(pid);
                }
            }
        }
    }

    public static setDisplayName(
        hero: CDOTA_BaseNPC,
        displayName: string,
        labelColor: RgbColor = [212, 184, 118]
    ): void {
        if (!this.isValidUnit(hero)) return;

        if (!hero.IsRealHero()) {
            hero.SetCustomHealthLabel(displayName, labelColor[0], labelColor[1], labelColor[2]);
        }

        const playerId = hero.GetPlayerOwnerID();
        if (PlayerResource.IsValidPlayerID(playerId)) {
            const key = tostring(playerId);
            const existing = (CustomNetTables.GetTableValue("player_evo" as never, key) ?? {}) as Record<
                string,
                unknown
            >;
            existing.display_name = displayName;
            CustomNetTables.SetTableValue("player_evo" as never, key, existing as never);
        }
    }

    public static applyPreset(hero: CDOTA_BaseNPC, preset: HeroAppearancePreset): void {
        if (!this.isValidUnit(hero)) return;

        if (preset.model && preset.model.length > 0) {
            hero.SetOriginalModel(preset.model);
            hero.SetModel(preset.model);
        }

        if (preset.hideBaseWearables === true) {
            this.hideBaseWearables(hero);
        } else if (preset.hideBaseWearables === false) {
            this.restoreBaseWearables(hero);
        }

        if (preset.scale !== undefined) {
            this.setScale(hero, preset.scale);
        }

        if (preset.color !== undefined) {
            this.setColor(hero, preset.color[0], preset.color[1], preset.color[2], preset.alpha);
        } else if (preset.alpha !== undefined) {
            const state = this.getOrCreateState(hero.entindex());
            const c = state.color ?? [255, 255, 255];
            this.setColor(hero, c[0], c[1], c[2], preset.alpha);
        }

        if (preset.wearables !== undefined) {
            this.equipWearables(hero, preset.wearables);
        }

        if (preset.displayName !== undefined) {
            this.setDisplayName(hero, preset.displayName, preset.labelColor);
        }
    }

    public static replaceHeroPreservingState(
        playerId: PlayerID,
        newHeroClass: string,
        options: ReplaceHeroOptions = {}
    ): CDOTA_BaseNPC_Hero | undefined {
        if (!PlayerResource.IsValidPlayerID(playerId)) return undefined;

        const oldHero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!oldHero || oldHero.IsNull() || !IsValidEntity(oldHero)) return undefined;

        if (oldHero.GetUnitName() === newHeroClass) {
            if (options.appearance) {
                this.applyPreset(oldHero, options.appearance);
            }
            return oldHero;
        }

        const savedPos = oldHero.GetAbsOrigin();
        const savedForward = oldHero.GetForwardVector();
        const savedLevel = oldHero.GetLevel();
        const savedXp = oldHero.GetCurrentXP();
        const savedGold = PlayerResource.GetGold(playerId);
        const savedHpPct = Math.max(0.05, oldHero.GetHealthPercent() / 100);
        const savedMpPct = Math.max(0, oldHero.GetManaPercent() / 100);

        const peaceMod = oldHero.FindModifierByName("modifier_evo_peace_time");
        const savedPeaceRemaining = peaceMod ? Math.max(0, peaceMod.GetRemainingTime()) : 0;

        const savedAbilities: SavedAbilityState[] = [];
        if (options.preserveAbilities) {
            for (const abilityName of options.preserveAbilities) {
                const ability = oldHero.FindAbilityByName(abilityName);
                if (!ability || ability.IsNull()) continue;
                savedAbilities.push({
                    name: abilityName,
                    level: ability.GetLevel(),
                    cooldown: ability.GetCooldownTimeRemaining(),
                });
            }
        }

        this.clearCustomWearables(oldHero);
        this.stateByHero.delete(oldHero.entindex());

        const newHero = PlayerResource.ReplaceHeroWith(playerId, newHeroClass, savedGold, savedXp);
        if (!newHero || newHero.IsNull() || !IsValidEntity(newHero)) {
            return undefined;
        }

        if (oldHero !== newHero && !oldHero.IsNull() && IsValidEntity(oldHero)) {
            GameRules.GetGameModeEntity().SetContextThink(
                DoUniqueString("EvoRemoveOldHero"),
                () => {
                    if (!oldHero.IsNull() && IsValidEntity(oldHero)) {
                        UTIL_Remove(oldHero);
                    }
                    return undefined;
                },
                0.05
            );
        }

        while (newHero.GetLevel() < savedLevel) {
            newHero.HeroLevelUp(false);
        }

        if (options.stripDefaultAbilities === true) {
            for (let i = 0; i < newHero.GetAbilityCount(); i++) {
                const ability = newHero.GetAbilityByIndex(i);
                if (!ability || ability.IsNull()) continue;
                const name = ability.GetAbilityName();
                if (
                    name.startsWith("special_bonus_") ||
                    name.startsWith("evo_empty_slot_") ||
                    name === "generic_hidden" ||
                    KEEP_MAP_UTILITY_ABILITIES.has(name)
                ) {
                    continue;
                }
                newHero.RemoveAbilityByHandle(ability);
            }
        }

        for (const saved of savedAbilities) {
            const ability = newHero.FindAbilityByName(saved.name) ?? newHero.AddAbility(saved.name);
            if (!ability || ability.IsNull()) continue;
            if (saved.level > 0) {
                ability.SetLevel(Math.min(ability.GetMaxLevel(), saved.level));
            }
            if (saved.cooldown > 0) {
                ability.StartCooldown(saved.cooldown);
            }
        }

        FindClearSpaceForUnit(newHero, savedPos, true);
        newHero.SetForwardVector(savedForward);
        newHero.SetHealth(Math.max(1, Math.floor(newHero.GetMaxHealth() * savedHpPct)));
        newHero.SetMana(Math.floor(newHero.GetMaxMana() * savedMpPct));

        if (savedPeaceRemaining > 0) {
            newHero.AddNewModifier(newHero, undefined, "modifier_evo_peace_time", {
                duration: savedPeaceRemaining,
            });
        }

        if (options.appearance) {
            this.applyPreset(newHero, options.appearance);
        }

        return newHero;
    }

    private static applyColorToAttachedWearables(
        hero: CDOTA_BaseNPC,
        state: HeroAppearanceRuntime
    ): void {
        const color = state.color;
        if (!color) return;

        let child = hero.FirstMoveChild();
        while (child && !child.IsNull() && IsValidEntity(child)) {
            const cls = child.GetClassname();
            if (cls === "dota_item_wearable" || cls === "prop_dynamic") {
                const modelEnt = child as CBaseModelEntity;
                modelEnt.SetRenderColor(color[0], color[1], color[2]);
                if (state.alpha !== undefined) {
                    modelEnt.SetRenderAlpha(state.alpha);
                }
            }
            child = child.NextMovePeer();
        }

        for (const wearable of state.customWearables) {
            if (!wearable || wearable.IsNull() || !IsValidEntity(wearable)) continue;
            const modelEnt = wearable as CBaseModelEntity;
            modelEnt.SetRenderColor(color[0], color[1], color[2]);
            if (state.alpha !== undefined) {
                modelEnt.SetRenderAlpha(state.alpha);
            }
        }
    }

    private static getOrCreateState(entIndex: EntityIndex): HeroAppearanceRuntime {
        let state = this.stateByHero.get(entIndex);
        if (!state) {
            state = {
                customWearables: [],
                customParticles: [],
            };
            this.stateByHero.set(entIndex, state);
        }
        return state;
    }

    private static isValidUnit(unit: CDOTA_BaseNPC | undefined): unit is CDOTA_BaseNPC {
        return unit !== undefined && !unit.IsNull() && IsValidEntity(unit);
    }
}
