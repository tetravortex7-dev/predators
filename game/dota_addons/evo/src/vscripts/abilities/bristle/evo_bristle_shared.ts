import { isEvoCreepUnit } from "../../lib/unit_helpers";

const pushCooldownByEnt: Map<EntityIndex, number> = new Map();
export const activeReactorZones: Set<CDOTA_BaseNPC> = new Set();

export function applyReactorCatalystStacks(
    caster: CDOTA_BaseNPC,
    target: CDOTA_BaseNPC,
    ability: CDOTABaseAbility,
    count: number
): void {
    const eAb = caster.FindAbilityByName("evo_bristle_react_e");
    const lvl = eAb && !eAb.IsNull() ? eAb.GetLevel() : ability.GetLevel();
    const maxStacks = lvl >= 3 ? 6 : lvl >= 2 ? 5 : 4;
    const ex = target.FindModifierByName("modifier_evo_bristle_react_catalyst");
    const next = Math.min(maxStacks, (ex ? ex.GetStackCount() : 0) + count);
    const mod = target.AddNewModifier(caster, ability, "modifier_evo_bristle_react_catalyst", { duration: 5.0 });
    if (mod !== undefined) {
        mod.SetStackCount(next);
    }
}

export function getAllAttributesSum(unit: CDOTA_BaseNPC): number {
    if (!unit.IsRealHero()) return 0;
    const hero = unit as CDOTA_BaseNPC_Hero;
    return hero.GetStrength() + hero.GetAgility() + hero.GetIntellect(false);
}

export function grantBristleAdrenalineStacks(hero: CDOTA_BaseNPC, count: number): void {
    const ab = hero.FindAbilityByName("evo_bristle_adrenaline");
    if (!ab || ab.IsNull()) return;
    const dreadE = hero.FindAbilityByName("evo_bristle_dread_e");
    const baseMax = ab.GetSpecialValueFor("max_stacks");
    const maxStacks = dreadE && !dreadE.IsNull() && dreadE.GetLevel() >= 2 ? 7 : baseMax;
    const duration = ab.GetSpecialValueFor("stack_duration");
    const existing = hero.FindModifierByName("modifier_evo_bristle_adrenaline_stack");
    const current = existing ? existing.GetStackCount() : 0;
    const next = Math.min(maxStacks, current + count);
    const mod = hero.AddNewModifier(hero, ab, "modifier_evo_bristle_adrenaline_stack", { duration });
    if (mod !== undefined) {
        mod.SetStackCount(next);
    }
}

export function fireDreadnoughtQuillFan(caster: CDOTA_BaseNPC, ability: CDOTABaseAbility): void {
    const level = ability.GetLevel();
    const radius = ability.GetSpecialValueFor("radius");
    const baseDmg = ability.GetSpecialValueFor("base_damage");
    const strPct = ability.GetSpecialValueFor("str_pct") / 100;
    const perStackBonus = ability.GetSpecialValueFor("stack_damage");
    const maxStacks = ability.GetSpecialValueFor("max_stacks");
    const str = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetStrength() : 0;
    const rawBase = baseDmg + str * strPct;
    const now = GameRules.GetDOTATime(false, false);

    caster.EmitSound("Hero_Bristleback.QuillSpray.Cast");
    const pfx = ParticleManager.CreateParticle(
        "particles/units/heroes/hero_bristleback/bristleback_quill_spray.vpcf",
        ParticleAttachment.ABSORIGIN_FOLLOW,
        caster
    );
    ParticleManager.ReleaseParticleIndex(pfx);

    const enemies = FindUnitsInRadius(
        caster.GetTeamNumber(),
        caster.GetAbsOrigin(),
        undefined,
        radius,
        UnitTargetTeam.ENEMY,
        (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
        UnitTargetFlags.NONE,
        FindOrder.ANY,
        false
    );

    const casterOrigin = caster.GetAbsOrigin();
    for (const enemy of enemies) {
        if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
        const ex = enemy.FindModifierByName("modifier_evo_bristle_dread_w_quill");
        const curStacks = ex ? ex.GetStackCount() : 0;
        let dmg = rawBase + curStacks * perStackBonus;
        if (isEvoCreepUnit(enemy)) {
            dmg *= 1.3;
        }
        ApplyDamage({
            victim: enemy,
            attacker: caster,
            ability,
            damage: dmg,
            damage_type: DamageTypes.PHYSICAL,
            damage_flags: level >= 2 ? DamageFlag.BYPASSES_ALL_BLOCK : DamageFlag.NONE,
        });

        const nextStacks = Math.min(maxStacks, curStacks + 1);
        const mod = enemy.AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_quill", { duration: 5.0 });
        if (mod !== undefined) {
            mod.SetStackCount(nextStacks);
        }

        if (level >= 2 && nextStacks >= 3) {
            enemy.AddNewModifier(caster, ability, "modifier_evo_bristle_dread_w_dmg", { duration: 3.0 });
        }

        if (level >= 3) {
            const dist = ((enemy.GetAbsOrigin() - casterOrigin) as Vector).Length2D();
            const eid = enemy.entindex();
            const lastPush = pushCooldownByEnt.get(eid) ?? -999;
            if (dist <= 225 && now - lastPush >= 4.0) {
                pushCooldownByEnt.set(eid, now);
                const pushDir =
                    dist > 1
                        ? Vector(
                              enemy.GetAbsOrigin().x - casterOrigin.x,
                              enemy.GetAbsOrigin().y - casterOrigin.y,
                              0
                          ).Normalized()
                        : caster.GetForwardVector();
                const targetPos = Vector(
                    enemy.GetAbsOrigin().x + pushDir.x * 110,
                    enemy.GetAbsOrigin().y + pushDir.y * 110,
                    enemy.GetAbsOrigin().z
                );
                FindClearSpaceForUnit(enemy, targetPos, true);
                enemy.Interrupt();
            }
        }
    }
}
