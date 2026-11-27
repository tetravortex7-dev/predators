export type NyxBranch = "T1" | "SCARAB" | "MANTIS" | "ARCHON" | "CICADA";

export interface NyxBranchInfo {
    branch: NyxBranch;
    tier: number;
}

function hasClientSafeAbility(unit: CDOTA_BaseNPC, name: string): boolean {
    const ab = unit.FindAbilityByName(name);
    return ab !== undefined && !ab.IsNull();
}

export function getNyxTier(unit: CDOTA_BaseNPC): number {
    if (!unit || unit.IsNull()) return 1;
    if (IsServer()) {
        const tierMod = unit.FindModifierByName("modifier_evo_hero_tier");
        if (tierMod) {
            return Math.max(1, tierMod.GetStackCount());
        }
    }
    if (
        hasClientSafeAbility(unit, "evo_nyx_scarab_r") ||
        hasClientSafeAbility(unit, "evo_nyx_mantis_r") ||
        hasClientSafeAbility(unit, "evo_nyx_archon_r") ||
        hasClientSafeAbility(unit, "evo_nyx_cicada_r")
    ) {
        return 4;
    }
    if (
        hasClientSafeAbility(unit, "evo_nyx_cicada_chitin_t3") ||
        hasClientSafeAbility(unit, "evo_nyx_scarab_chitin") ||
        hasClientSafeAbility(unit, "evo_nyx_mantis_chitin") ||
        hasClientSafeAbility(unit, "evo_nyx_archon_chitin")
    ) {
        return 3;
    }
    if (
        hasClientSafeAbility(unit, "evo_nyx_scarab_q") ||
        hasClientSafeAbility(unit, "evo_nyx_mantis_q") ||
        hasClientSafeAbility(unit, "evo_nyx_archon_w") ||
        hasClientSafeAbility(unit, "evo_nyx_cicada_q")
    ) {
        return 2;
    }
    return 1;
}

export function getNyxBranchMaxLevel(unit: CDOTA_BaseNPC | undefined): number {
    if (!unit || unit.IsNull()) return 5;
    const tier = getNyxTier(unit);
    if (tier <= 1) return 3;
    if (tier === 2) return 4;
    return 5;
}

export function detectNyxBranchAndTier(unit: CDOTA_BaseNPC): NyxBranchInfo {
    if (!unit || unit.IsNull()) {
        return { branch: "T1", tier: 1 };
    }
    const tier = getNyxTier(unit);
    if (hasClientSafeAbility(unit, "evo_nyx_scarab_q")) {
        return { branch: "SCARAB", tier };
    }
    if (hasClientSafeAbility(unit, "evo_nyx_mantis_q")) {
        return { branch: "MANTIS", tier };
    }
    if (hasClientSafeAbility(unit, "evo_nyx_archon_w")) {
        return { branch: "ARCHON", tier };
    }
    if (hasClientSafeAbility(unit, "evo_nyx_cicada_q")) {
        return { branch: "CICADA", tier };
    }
    return { branch: "T1", tier };
}

export function getNyxStr(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetStrength() : 0;
}

export function getNyxAgi(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetAgility() : 0;
}

export function getNyxInt(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
}

export function getNyxHighestAttr(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return Math.max(hero.GetStrength(), hero.GetAgility(), hero.GetIntellect(false));
}

export function getNyxAllAttrSum(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return hero.GetStrength() + hero.GetAgility() + hero.GetIntellect(false);
}

export function isNyxBurrowed(unit: CDOTA_BaseNPC): boolean {
    return unit.HasModifier("modifier_evo_nyx_scarab_w");
}

export function getLivingChitinStacks(unit: CDOTA_BaseNPC): number {
    const mod = unit.FindModifierByName("modifier_evo_nyx_living_chitin");
    return mod ? mod.GetStackCount() : 0;
}

export function findNyxInnateAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of [
        "evo_nyx_scarab_chitin_t4",
        "evo_nyx_scarab_chitin",
        "evo_nyx_mantis_chitin_t4",
        "evo_nyx_mantis_chitin",
        "evo_nyx_archon_chitin_t4",
        "evo_nyx_archon_chitin",
        "evo_nyx_cicada_chitin_t4",
        "evo_nyx_cicada_chitin_t3",
        "evo_nyx_cicada_chitin",
        "evo_nyx_living_chitin",
    ]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function addLivingChitinStacks(unit: CDOTA_BaseNPC, delta: number): number {
    const mod = unit.FindModifierByName("modifier_evo_nyx_living_chitin");
    if (!mod) return 0;
    const ability = mod.GetAbility() ?? findNyxInnateAbility(unit);
    const maxStacks = ability && !ability.IsNull() ? ability.GetSpecialValueFor("max_stacks") : 3;
    const prev = mod.GetStackCount();
    const next = Math.max(0, Math.min(maxStacks, prev + delta));
    mod.SetStackCount(next);
    return next - prev;
}

export function applyPsiResonance(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    ability: CDOTABaseAbility | undefined,
    tierLevel: number
): void {
    const srcAbility = ability ?? findNyxInnateAbility(caster);
    if (!srcAbility || srcAbility.IsNull()) return;
    const mod = target.AddNewModifier(caster, srcAbility, "modifier_evo_nyx_psi_resonance", {
        duration: 4.5,
    });
    if (mod !== undefined) {
        const clamped = Math.max(1, Math.min(3, tierLevel));
        if (clamped >= mod.GetStackCount()) {
            mod.SetStackCount(clamped);
        }
    }
}

export function applyAcousticDisruption(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    ability: CDOTABaseAbility | undefined,
    tierLevel: number
): void {
    const srcAbility = ability ?? findNyxInnateAbility(caster);
    if (!srcAbility || srcAbility.IsNull()) return;
    const mod = target.AddNewModifier(caster, srcAbility, "modifier_evo_nyx_acoustic_disruption", {
        duration: 4.5,
    });
    if (mod !== undefined) {
        const clamped = Math.max(1, Math.min(3, tierLevel));
        if (clamped >= mod.GetStackCount()) {
            mod.SetStackCount(clamped);
        }
    }
}

export function findEnemiesInRadius(
    caster: CDOTA_BaseNPC,
    origin: Vector,
    radius: number,
    pierceSpellImmunity = false
): CDOTA_BaseNPC[] {
    const flags = pierceSpellImmunity ? UnitTargetFlags.MAGIC_IMMUNE_ENEMIES : UnitTargetFlags.NONE;
    return FindUnitsInRadius(
        caster.GetTeamNumber(),
        origin,
        undefined,
        radius,
        UnitTargetTeam.ENEMY,
        (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
        flags,
        FindOrder.ANY,
        false
    ).filter((e) => e && !e.IsNull() && IsValidEntity(e) && e.IsAlive());
}

export function knockbackUnitFrom(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    center: Vector,
    distance: number,
    duration = 0.3,
    height = 60
): void {
    target.AddNewModifier(caster, undefined, "modifier_knockback", {
        center_x: center.x,
        center_y: center.y,
        center_z: center.z,
        duration,
        knockback_duration: duration,
        knockback_distance: distance,
        knockback_height: height,
        should_stun: 0,
    });
}
