import { isEvoCreepUnit } from "../../lib/unit_helpers";

export type VenoBranch = "T1" | "NEEDLE" | "HIVE" | "SYMBIONT";

export interface VenoBranchInfo {
    branch: VenoBranch;
    tier: number;
}

function hasAbilitySafe(unit: CDOTA_BaseNPC, name: string): boolean {
    const ab = unit.FindAbilityByName(name);
    return ab !== undefined && !ab.IsNull();
}

export function getVenoTier(unit: CDOTA_BaseNPC | undefined): number {
    if (!unit || unit.IsNull()) return 1;
    if (IsServer()) {
        const tierMod = unit.FindModifierByName("modifier_evo_hero_tier");
        if (tierMod) {
            return Math.max(1, tierMod.GetStackCount());
        }
    }
    if (
        hasAbilitySafe(unit, "evo_veno_needle_r") ||
        hasAbilitySafe(unit, "evo_veno_hive_r") ||
        hasAbilitySafe(unit, "evo_veno_symbiont_r")
    ) {
        return 4;
    }
    for (const innateName of [
        "evo_veno_needle_glands",
        "evo_veno_hive_glands",
        "evo_veno_symbiont_glands",
    ]) {
        const ab = unit.FindAbilityByName(innateName);
        if (ab && !ab.IsNull()) {
            return Math.min(4, Math.max(2, ab.GetLevel() + 1));
        }
    }
    if (
        hasAbilitySafe(unit, "evo_veno_needle_q") ||
        hasAbilitySafe(unit, "evo_veno_hive_q") ||
        hasAbilitySafe(unit, "evo_veno_symbiont_q")
    ) {
        return 2;
    }
    return 1;
}

export function getVenoBranchMaxLevel(unit: CDOTA_BaseNPC | undefined): number {
    const tier = getVenoTier(unit);
    if (tier <= 1) return 3;
    if (tier === 2) return 4;
    return 5;
}

export function detectVenoBranchAndTier(unit: CDOTA_BaseNPC): VenoBranchInfo {
    if (!unit || unit.IsNull()) {
        return { branch: "T1", tier: 1 };
    }
    const tier = getVenoTier(unit);
    if (hasAbilitySafe(unit, "evo_veno_needle_q")) {
        return { branch: "NEEDLE", tier };
    }
    if (hasAbilitySafe(unit, "evo_veno_hive_q")) {
        return { branch: "HIVE", tier };
    }
    if (hasAbilitySafe(unit, "evo_veno_symbiont_q")) {
        return { branch: "SYMBIONT", tier };
    }
    return { branch: "T1", tier };
}

export function getVenoAgi(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetAgility() : 0;
}

export function getVenoInt(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
}

export function getVenoHighestAttr(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return Math.max(hero.GetStrength(), hero.GetAgility(), hero.GetIntellect(false));
}

export function getVenoAllAttrSum(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return hero.GetStrength() + hero.GetAgility() + hero.GetIntellect(false);
}

export function findVenoEnemies(caster: CDOTA_BaseNPC, origin: Vector, radius: number): CDOTA_BaseNPC[] {
    return FindUnitsInRadius(
        caster.GetTeamNumber(),
        origin,
        undefined,
        radius,
        UnitTargetTeam.ENEMY,
        (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
        UnitTargetFlags.NONE,
        FindOrder.CLOSEST,
        false
    );
}

export function findVenoAllies(caster: CDOTA_BaseNPC, origin: Vector, radius: number): CDOTA_BaseNPC[] {
    return FindUnitsInRadius(
        caster.GetTeamNumber(),
        origin,
        undefined,
        radius,
        UnitTargetTeam.FRIENDLY,
        UnitTargetType.HERO,
        UnitTargetFlags.NONE,
        FindOrder.ANY,
        false
    );
}

export function applyVenoCreepDamage(
    attacker: CDOTA_BaseNPC,
    victim: CDOTA_BaseNPC,
    ability: CDOTABaseAbility,
    damage: number,
    damageType: DamageTypes,
    creepMult: number
): void {
    const finalDmg = isEvoCreepUnit(victim) ? damage * creepMult : damage;
    ApplyDamage({
        victim,
        attacker,
        ability,
        damage: finalDmg,
        damage_type: damageType,
    });
}

const turretsByOwner = new Map<EntityIndex, CDOTA_BaseNPC[]>();

export function getVenoActiveTurrets(owner: CDOTA_BaseNPC): CDOTA_BaseNPC[] {
    const idx = owner.GetEntityIndex();
    const list = turretsByOwner.get(idx) ?? [];
    const alive = list.filter((u) => u && !u.IsNull() && IsValidEntity(u) && u.IsAlive());
    turretsByOwner.set(idx, alive);
    return alive;
}

export function registerVenoTurret(
    owner: CDOTA_BaseNPC,
    turret: CDOTA_BaseNPC,
    maxTurrets: number,
    bypassCap: boolean
): void {
    const alive = getVenoActiveTurrets(owner);
    if (!bypassCap) {
        while (alive.length >= maxTurrets) {
            const oldest = alive.shift();
            if (oldest && !oldest.IsNull() && IsValidEntity(oldest)) {
                oldest.ForceKill(false);
            }
        }
    }
    alive.push(turret);
    turretsByOwner.set(owner.GetEntityIndex(), alive);
}

export function spawnVenoBioTurret(
    owner: CDOTA_BaseNPC,
    pos: Vector,
    bypassCap: boolean
): CDOTA_BaseNPC | undefined {
    const wAb = owner.FindAbilityByName("evo_veno_hive_w");
    const lvl = wAb && !wAb.IsNull() ? wAb.GetLevel() : 0;
    const tier = getVenoTier(owner);
    const dur = wAb && lvl > 0 ? wAb.GetSpecialValueFor("duration") : 18;
    const maxTurrets = wAb && lvl > 0 ? wAb.GetSpecialValueFor("max_turrets") : 4;
    const baseHp = wAb && lvl > 0 ? wAb.GetSpecialValueFor("base_hp") : 180;
    const hpPct = wAb && lvl > 0 ? wAb.GetSpecialValueFor("hp_int_pct") : 80;
    const range = wAb && lvl > 0 ? wAb.GetSpecialValueFor("turret_range") : 550;
    const hp = Math.max(120, Math.round(baseHp + (getVenoInt(owner) * hpPct) / 100));

    const unit = CreateUnitByName("evo_veno_turret", pos, true, owner, owner, owner.GetTeamNumber());
    if (!unit || unit.IsNull()) return undefined;

    unit.SetControllableByPlayer(owner.GetPlayerOwnerID(), false);
    unit.SetBaseMaxHealth(hp);
    unit.SetMaxHealth(hp);
    unit.SetHealth(hp);
    unit.SetBaseDamageMin(28);
    unit.SetBaseDamageMax(28);
    if (tier >= 4) {
        const mr = wAb && lvl > 0 ? wAb.GetSpecialValueFor("turret_mr") : 50;
        unit.SetBaseMagicalResistanceValue(mr);
    }

    registerVenoTurret(owner, unit, maxTurrets, bypassCap);
    unit.AddNewModifier(owner, wAb && !wAb.IsNull() ? wAb : undefined, "modifier_kill", { duration: dur });
    unit.AddNewModifier(owner, wAb && !wAb.IsNull() ? wAb : undefined, "modifier_evo_veno_hive_turret", {
        duration: dur,
        range,
    });
    return unit;
}

export function findVenoInnateAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of [
        "evo_veno_needle_glands",
        "evo_veno_hive_glands",
        "evo_veno_symbiont_glands",
        "evo_veno_glands",
    ]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function triggerVenoSporePulse(
    owner: CDOTA_BaseNPC,
    primaryTarget: CDOTA_BaseNPC,
    scaleFactor: number
): void {
    const ab = findVenoInnateAbility(owner);
    if (!ab || ab.IsNull() || owner.PassivesDisabled()) return;
    const info = detectVenoBranchAndTier(owner);
    const origin = primaryTarget.GetAbsOrigin();

    const radius = ab.GetSpecialValueFor("pulse_radius");
    const baseDmg = ab.GetSpecialValueFor("pulse_base_dmg");
    const statDmg =
        info.branch === "SYMBIONT"
            ? (getVenoAllAttrSum(owner) * ab.GetSpecialValueFor("pulse_all_pct")) / 100
            : (getVenoHighestAttr(owner) * ab.GetSpecialValueFor("pulse_attr_pct")) / 100;
    const dmg = (baseDmg + statDmg) * scaleFactor;
    const slowDur = ab.GetSpecialValueFor("slow_duration");

    const pfx = ParticleManager.CreateParticle(
        "particles/units/heroes/hero_venomancer/venomancer_venomous_gale_impact.vpcf",
        ParticleAttachment.WORLDORIGIN,
        undefined
    );
    ParticleManager.SetParticleControl(pfx, 0, origin);
    ParticleManager.ReleaseParticleIndex(pfx);

    for (const enemy of findVenoEnemies(owner, origin, radius)) {
        if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
        ApplyDamage({
            victim: enemy,
            attacker: owner,
            ability: ab,
            damage: dmg,
            damage_type: DamageTypes.MAGICAL,
        });
        enemy.AddNewModifier(owner, ab, "modifier_evo_veno_glands_slow", { duration: slowDur });
    }

    if (info.branch === "NEEDLE" && info.tier >= 3) {
        const shred = ab.GetSpecialValueFor("armor_shred");
        const shredDur = ab.GetSpecialValueFor("shred_duration");
        if (shred > 0) {
            primaryTarget.AddNewModifier(owner, ab, "modifier_evo_veno_glands_shred", {
                duration: shredDur,
                shred,
            });
            primaryTarget.AddNewModifier(owner, ab, "modifier_evo_veno_needle_mark", { duration: shredDur });
        }
    }

    if (info.branch === "SYMBIONT" && info.tier >= 3) {
        const healRadius = ab.GetSpecialValueFor("heal_radius");
        const healAmt =
            (ab.GetSpecialValueFor("heal_base") +
                (getVenoAllAttrSum(owner) * ab.GetSpecialValueFor("heal_all_pct")) / 100) *
            scaleFactor;
        const buffDur = ab.GetSpecialValueFor("ally_buff_duration");
        for (const ally of findVenoAllies(owner, origin, healRadius)) {
            if (!ally || ally.IsNull() || !ally.IsAlive()) continue;
            ally.Heal(healAmt, ab);
            ally.AddNewModifier(owner, ab, "modifier_evo_veno_symbiont_glands_buff", { duration: buffDur });
        }
    }
}

export function applyVenoChitinShard(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    ability: CDOTABaseAbility
): void {
    const tier = getVenoTier(caster);
    const maxStacks = tier >= 4 ? 6 : tier >= 3 ? 5 : 4;
    const mod = target.AddNewModifier(caster, ability, "modifier_evo_veno_chitin_shard", {
        duration: 4.5,
    });
    if (mod !== undefined) {
        const next = Math.min(maxStacks, mod.GetStackCount() + 1);
        mod.SetStackCount(next);
    }
}

export function applyVenoSporeInfection(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    ability: CDOTABaseAbility
): void {
    target.AddNewModifier(caster, ability, "modifier_evo_veno_spore_infection", { duration: 5.0 });
}

export function applyVenoSymbiontPollen(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    ability: CDOTABaseAbility
): void {
    target.AddNewModifier(caster, ability, "modifier_evo_veno_symbiont_pollen", { duration: 4.5 });
}
