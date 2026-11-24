export function grantSlarkAgiEssenceStack(caster: CDOTA_BaseNPC, target: CDOTA_BaseNPC, stacks: number): void {
    const eAb = caster.FindAbilityByName("evo_slark_agi_e");
    if (!eAb || eAb.IsNull() || eAb.GetLevel() <= 0) return;

    const isHero = target.IsHero();
    const dur = isHero ? eAb.GetSpecialValueFor("hero_duration") : eAb.GetSpecialValueFor("creep_duration");
    const agiPerStack = isHero ? eAb.GetSpecialValueFor("agi_per_stack") : 1;

    const existing = caster.FindModifierByName("modifier_evo_slark_agi_essence_buff");
    const cur = existing ? existing.GetStackCount() : 0;
    const maxTotal = isHero ? 120 : Math.max(cur, 18);
    const next = Math.min(maxTotal, cur + stacks * agiPerStack);
    const buff = caster.AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_buff", { duration: dur });
    if (buff !== undefined) {
        buff.SetStackCount(next);
    }

    if (isHero) {
        const debuffPerStack = eAb.GetSpecialValueFor("enemy_stat_loss");
        const exDebuff = target.FindModifierByName("modifier_evo_slark_agi_essence_debuff");
        const curDebuff = exDebuff ? exDebuff.GetStackCount() : 0;
        const debuff = target.AddNewModifier(caster, eAb, "modifier_evo_slark_agi_essence_debuff", { duration: dur });
        if (debuff !== undefined) {
            debuff.SetStackCount(Math.min(40, curDebuff + stacks * debuffPerStack));
        }
    }
}
