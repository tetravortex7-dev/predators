import { isEvoCreepUnit } from "../../lib/unit_helpers";

export type SpectreBranch = "T1" | "PHANTOM" | "BASTION" | "MIRROR";

export interface SpectreBranchInfo {
    branch: SpectreBranch;
    tier: number;
}

function hasAbilitySafe(unit: CDOTA_BaseNPC, name: string): boolean {
    const ab = unit.FindAbilityByName(name);
    return ab !== undefined && !ab.IsNull();
}

export function getSpectreTier(unit: CDOTA_BaseNPC | undefined): number {
    if (!unit || unit.IsNull()) return 1;
    if (IsServer()) {
        const tierMod = unit.FindModifierByName("modifier_evo_hero_tier");
        if (tierMod) {
            return Math.max(1, tierMod.GetStackCount());
        }
    }
    if (
        hasAbilitySafe(unit, "evo_spectre_phantom_r") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_r") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_r")
    ) {
        return 4;
    }
    if (
        hasAbilitySafe(unit, "evo_spectre_phantom_dispersion_t3") ||
        hasAbilitySafe(unit, "evo_spectre_phantom_w_t3") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_inversion_t3") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_w_t3") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_e_t3") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_q_t3") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_w_t3") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_e_t3")
    ) {
        return 3;
    }
    if (
        hasAbilitySafe(unit, "evo_spectre_phantom_w") ||
        hasAbilitySafe(unit, "evo_spectre_phantom_w_t3") ||
        hasAbilitySafe(unit, "evo_spectre_phantom_w_t4") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_q") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_q_t3") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_q_t4") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_inversion") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_inversion_t3") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_inversion_t4") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_w") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_w_t3") ||
        hasAbilitySafe(unit, "evo_spectre_mirror_w_t4")
    ) {
        return 2;
    }
    return 1;
}

export function getSpectreBranchMaxLevel(unit: CDOTA_BaseNPC | undefined): number {
    const tier = getSpectreTier(unit);
    if (tier <= 1) return 3;
    if (tier === 2) return 4;
    return 5;
}

export function findPhantomEAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of ["evo_spectre_phantom_e_t3", "evo_spectre_phantom_e"]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function findPhantomDAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of ["evo_spectre_phantom_d_t4", "evo_spectre_phantom_d"]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function findBastionQAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of ["evo_spectre_bastion_q_t4", "evo_spectre_bastion_q_t3", "evo_spectre_bastion_q"]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function findBastionEAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of ["evo_spectre_bastion_e_t4", "evo_spectre_bastion_e_t3", "evo_spectre_bastion_e"]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function findMirrorInversionAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of [
        "evo_spectre_mirror_inversion_t4",
        "evo_spectre_mirror_inversion_t3",
        "evo_spectre_mirror_inversion",
    ]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function findMirrorQAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of ["evo_spectre_mirror_q_t4", "evo_spectre_mirror_q_t3", "evo_spectre_mirror_q"]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function findMirrorWAbility(unit: CDOTA_BaseNPC): CDOTABaseAbility | undefined {
    for (const name of ["evo_spectre_mirror_w_t4", "evo_spectre_mirror_w_t3", "evo_spectre_mirror_w"]) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return ab;
    }
    return undefined;
}

export function detectSpectreBranchAndTier(unit: CDOTA_BaseNPC): SpectreBranchInfo {
    if (!unit || unit.IsNull()) {
        return { branch: "T1", tier: 1 };
    }
    const tier = getSpectreTier(unit);
    if (
        hasAbilitySafe(unit, "evo_spectre_phantom_w") ||
        hasAbilitySafe(unit, "evo_spectre_phantom_w_t3") ||
        hasAbilitySafe(unit, "evo_spectre_phantom_w_t4")
    ) {
        return { branch: "PHANTOM", tier };
    }
    if (
        hasAbilitySafe(unit, "evo_spectre_bastion_q") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_q_t3") ||
        hasAbilitySafe(unit, "evo_spectre_bastion_q_t4")
    ) {
        return { branch: "BASTION", tier };
    }
    if (findMirrorInversionAbility(unit) !== undefined || findMirrorWAbility(unit) !== undefined) {
        return { branch: "MIRROR", tier };
    }
    return { branch: "T1", tier };
}

export function getSpectreStr(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetStrength() : 0;
}

export function getSpectreAgi(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetAgility() : 0;
}

export function getSpectreInt(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
}

export function getSpectreHighestAttr(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return Math.max(hero.GetStrength(), hero.GetAgility(), hero.GetIntellect(false));
}

export function findSpectreEnemies(
    caster: CDOTA_BaseNPC,
    origin: Vector,
    radius: number
): CDOTA_BaseNPC[] {
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

const portalsByOwner = new Map<EntityIndex, CDOTA_BaseNPC[]>();

export function cleanupSpectrePortals(owner: CDOTA_BaseNPC): CDOTA_BaseNPC[] {
    const idx = owner.GetEntityIndex();
    const list = portalsByOwner.get(idx) ?? [];
    const alive = list.filter(
        (u) => u && !u.IsNull() && IsValidEntity(u) && u.HasModifier("modifier_evo_spectre_portal_unit")
    );
    portalsByOwner.set(idx, alive);
    return alive;
}

export function registerSpectrePortal(owner: CDOTA_BaseNPC, portal: CDOTA_BaseNPC, maxCount: number): void {
    const alive = cleanupSpectrePortals(owner);
    while (alive.length >= maxCount) {
        const oldest = alive.shift();
        if (oldest && !oldest.IsNull() && IsValidEntity(oldest)) {
            UTIL_Remove(oldest);
        }
    }
    alive.push(portal);
    portalsByOwner.set(owner.GetEntityIndex(), alive);
}

export function findNearestSpectrePortal(owner: CDOTA_BaseNPC, point: Vector): CDOTA_BaseNPC | undefined {
    const alive = cleanupSpectrePortals(owner);
    let best: CDOTA_BaseNPC | undefined;
    let bestDist = 1e12;
    for (const portal of alive) {
        const dist = ((portal.GetAbsOrigin() - point) as Vector).Length2D();
        if (dist < bestDist) {
            bestDist = dist;
            best = portal;
        }
    }
    return best;
}

export function applyDispersionAroundOrigin(
    victim: CDOTA_BaseNPC,
    ability: CDOTABaseAbility,
    origin: Vector,
    blockedDamage: number,
    damageType: DamageTypes,
    minRadius: number,
    maxRadius: number,
    hitTracker: Set<EntityIndex>
): void {
    if (blockedDamage <= 0.5) return;
    const enemies = findSpectreEnemies(victim, origin, maxRadius);
    for (const enemy of enemies) {
        if (!enemy || enemy.IsNull() || !enemy.IsAlive() || enemy === victim) continue;
        const eIdx = enemy.GetEntityIndex();
        if (hitTracker.has(eIdx)) continue;
        hitTracker.add(eIdx);

        const dist = ((enemy.GetAbsOrigin() - origin) as Vector).Length2D();
        let factor = 1.0;
        if (dist > minRadius) {
            factor = Math.max(0, 1 - (dist - minRadius) / Math.max(1, maxRadius - minRadius));
        }
        const reflected = blockedDamage * factor;
        if (reflected <= 0.5) continue;

        ApplyDamage({
            victim: enemy,
            attacker: victim,
            ability,
            damage: reflected,
            damage_type: damageType,
            damage_flags: (DamageFlag.REFLECTION + DamageFlag.NO_SPELL_AMPLIFICATION) as DamageFlag,
        });
    }
}

export function getBastionTotalShields(unit: CDOTA_BaseNPC): number {
    const qMod = unit.FindModifierByName("modifier_evo_spectre_bastion_q_shield");
    const rMod = unit.FindModifierByName("modifier_evo_spectre_bastion_r_shield");
    const eMod = unit.FindModifierByName("modifier_evo_spectre_bastion_e_passive");
    return (
        (qMod ? Math.max(0, qMod.GetStackCount()) : 0) +
        (rMod ? Math.max(0, rMod.GetStackCount()) : 0) +
        (eMod ? Math.max(0, eMod.GetStackCount()) : 0)
    );
}

export function getBastionMaxPassiveShield(unit: CDOTA_BaseNPC): number {
    const eAb = findBastionEAbility(unit);
    if (!eAb || eAb.IsNull() || eAb.GetLevel() <= 0) return 0;
    const baseMax = eAb.GetSpecialValueFor("max_shield") + (getSpectreStr(unit) * eAb.GetSpecialValueFor("max_str_pct")) / 100;
    const mult = unit.HasModifier("modifier_item_aghanims_shard")
        ? Math.max(1, eAb.GetSpecialValueFor("shard_shield_mult") || 1.75)
        : 1;
    return Math.floor(baseMax * mult);
}

export function addBastionPassiveShield(unit: CDOTA_BaseNPC, amount: number): void {
    if (amount <= 0) return;
    const mod = unit.FindModifierByName("modifier_evo_spectre_bastion_e_passive");
    if (!mod || mod.IsNull()) return;
    const cap = getBastionMaxPassiveShield(unit);
    if (cap <= 0) return;
    const next = Math.min(cap, mod.GetStackCount() + Math.floor(amount));
    if (next > mod.GetStackCount()) {
        mod.SetStackCount(next);
    }
}

export function triggerBastionBreakMs(unit: CDOTA_BaseNPC): void {
    if (getSpectreTier(unit) < 3) return;
    const eAb = findBastionEAbility(unit);
    if (!eAb || eAb.IsNull() || eAb.GetLevel() <= 0) return;
    const dur = eAb.GetSpecialValueFor("break_ms_duration");
    unit.AddNewModifier(unit, eAb, "modifier_evo_spectre_bastion_break_ms", { duration: dur });
}

export function applySpectreCreepDamage(
    attacker: CDOTA_BaseNPC,
    victim: CDOTA_BaseNPC,
    ability: CDOTABaseAbility,
    damage: number,
    damageType: DamageTypes,
    creepMult: number
): number {
    const finalDmg = isEvoCreepUnit(victim) ? damage * creepMult : damage;
    ApplyDamage({
        victim,
        attacker,
        ability,
        damage: finalDmg,
        damage_type: damageType,
    });
    return finalDmg;
}

export function triggerAstralInversionReflect(
    victim: CDOTA_BaseNPC,
    spectre: CDOTA_BaseNPC,
    inversionAb: CDOTABaseAbility,
    event: ModifierInstanceEvent
): boolean {
    if (event.unit !== victim || event.damage_type !== DamageTypes.PHYSICAL) return false;
    if (bit.band(event.damage_flags, DamageFlag.REFLECTION) !== 0) return false;
    if (bit.band(event.damage_flags, DamageFlag.HPLOSS) !== 0) return false;

    const attacker = event.attacker;
    if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || !attacker.IsAlive()) return false;
    if (attacker === victim || attacker.GetTeamNumber() === spectre.GetTeamNumber()) return false;

    const rawPhys = event.original_damage > 0 ? event.original_damage : event.damage;
    if (rawPhys <= 0) return false;

    let reflectPct = inversionAb.GetSpecialValueFor("reflect_pct");
    if (victim.HasModifier("modifier_evo_spectre_mirror_q_phase")) {
        const qAb = findMirrorQAbility(spectre);
        if (qAb && !qAb.IsNull() && qAb.GetLevel() > 0) {
            reflectPct += qAb.GetSpecialValueFor("trail_reflect_pct");
        }
    }
    const flatDmg = inversionAb.GetSpecialValueFor("flat_dmg");
    const intPct = inversionAb.GetSpecialValueFor("int_pct");
    const reflectDmg = rawPhys * (reflectPct / 100) + flatDmg + (getSpectreInt(spectre) * intPct) / 100;
    if (reflectDmg <= 0.5) return false;

    ApplyDamage({
        victim: attacker,
        attacker: spectre,
        ability: inversionAb,
        damage: reflectDmg,
        damage_type: DamageTypes.MAGICAL,
        damage_flags: (DamageFlag.REFLECTION + DamageFlag.NO_SPELL_AMPLIFICATION) as DamageFlag,
    });
    return true;
}

const bastionLastBlockFxTime: Record<number, number> = {};

export function spawnBastionBlockFx(victim: CDOTA_BaseNPC, attacker: CDOTA_BaseNPC | undefined, blocked: number): void {
    if (!victim || victim.IsNull() || !IsValidEntity(victim) || blocked <= 0) return;
    const now = GameRules.GetGameTime();
    const id = victim.entindex();
    const prev = bastionLastBlockFxTime[id];
    if (prev !== undefined && now - prev < 0.18) return;
    bastionLastBlockFxTime[id] = now;

    const victimPos = victim.GetAbsOrigin();
    let dir = victim.GetForwardVector();
    if (attacker && !attacker.IsNull() && IsValidEntity(attacker)) {
        const diff = (attacker.GetAbsOrigin() - victimPos) as Vector;
        const flat = Vector(diff.x, diff.y, 0);
        if (flat.Length2D() > 1) {
            dir = flat.Normalized();
        }
    }

    const fxPath =
        blocked >= 35
            ? "particles/units/heroes/hero_mars/mars_shield_of_mars.vpcf"
            : "particles/units/heroes/hero_mars/mars_shield_of_mars_small.vpcf";
    const pfx = ParticleManager.CreateParticle(fxPath, ParticleAttachment.ABSORIGIN, victim);
    ParticleManager.SetParticleControl(pfx, 0, victimPos);
    ParticleManager.SetParticleControlForward(pfx, 0, dir);
    ParticleManager.ReleaseParticleIndex(pfx);
    victim.EmitSound("Hero_Mars.Shield.BlockSmall");
}
