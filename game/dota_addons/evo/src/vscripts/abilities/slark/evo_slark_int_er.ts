import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/slark/evo_slark_int_er";

const SLARK_INT_ER_MODS: readonly string[] = [
    "modifier_evo_slark_int_e_passive",
    "modifier_evo_slark_int_e_lantern",
    "modifier_evo_slark_int_e_slow",
    "modifier_evo_slark_int_r_thinker",
    "modifier_evo_slark_int_r_ally",
    "modifier_evo_slark_int_r_enemy",
];

for (const modName of SLARK_INT_ER_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_slark_int_e")
export class evo_slark_int_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_slark_int_e_passive";
    }
}

@registerModifier("modifier_evo_slark_int_e_passive")
export class modifier_evo_slark_int_e_passive extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.unit !== parent || parent.PassivesDisabled()) return;
        if (!event.ability || event.ability.IsItem() || event.ability.IsToggle()) return;

        const maxStacks = ab.GetSpecialValueFor("max_stacks");
        const ex = parent.FindModifierByName("modifier_evo_slark_int_e_lantern");
        const next = Math.min(maxStacks, (ex ? ex.GetStackCount() : 0) + 1);
        const mod = parent.AddNewModifier(parent, ab, "modifier_evo_slark_int_e_lantern", { duration: 8.0 });
        if (mod !== undefined) {
            mod.SetStackCount(next);
        }

        if (ab.GetLevel() >= 3 && next >= 3) {
            const enemies = FindUnitsInRadius(
                parent.GetTeamNumber(),
                parent.GetAbsOrigin(),
                undefined,
                700,
                UnitTargetTeam.ENEMY,
                UnitTargetType.HERO,
                UnitTargetFlags.FOW_VISIBLE,
                FindOrder.CLOSEST,
                false
            );
            const target = enemies[0];
            if (target && !target.IsNull() && IsValidEntity(target) && target.IsAlive()) {
                const intVal = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
                ApplyDamage({
                    victim: target,
                    attacker: parent,
                    ability: ab,
                    damage: 90 + intVal * 0.6,
                    damage_type: DamageTypes.MAGICAL,
                });
                target.EmitSound("Hero_Slark.DarkPact.Cast");
            }
        }
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent || parent.PassivesDisabled()) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;

        const lantern = parent.FindModifierByName("modifier_evo_slark_int_e_lantern");
        if (!lantern || lantern.GetStackCount() <= 0) return;

        const rem = lantern.GetStackCount() - 1;
        if (rem <= 0) {
            lantern.Destroy();
        } else {
            lantern.SetStackCount(rem);
        }

        const baseBlast = ab.GetSpecialValueFor("blast_damage");
        const intVal = parent.IsRealHero() ? (parent as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
        const dmg = baseBlast + intVal * 0.4;
        const level = ab.GetLevel();

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            target.GetAbsOrigin(),
            undefined,
            325,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
            if (level >= 2) {
                enemy.AddNewModifier(parent, ab, "modifier_evo_slark_int_e_slow", { duration: 2.5 });
                if (enemy.IsHero()) {
                    parent.Heal(parent.GetMaxHealth() * 0.04, ab);
                }
            }
        }
    }
}

@registerModifier("modifier_evo_slark_int_e_lantern")
export class modifier_evo_slark_int_e_lantern extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return false;
    }
    IsPurgable(): boolean {
        return true;
    }
    GetTexture(): string {
        return "slark_depth_shroud";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE")];
    }
    GetModifierSpellAmplify_Percentage(): number {
        return this.GetStackCount() * 4;
    }
}

@registerModifier("modifier_evo_slark_int_e_slow")
export class modifier_evo_slark_int_e_slow extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return true;
    }
    GetTexture(): string {
        return "slark_depth_shroud";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -20;
    }
}

@registerAbility("evo_slark_int_r")
export class evo_slark_int_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const pos = this.GetCursorPosition();
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Slark.ShadowDance");
        CreateModifierThinker(
            caster,
            this,
            "modifier_evo_slark_int_r_thinker",
            { duration: dur },
            pos,
            caster.GetTeamNumber(),
            false
        );
    }
}

@registerModifier("modifier_evo_slark_int_r_thinker")
export class modifier_evo_slark_int_r_thinker extends BaseModifier {
    private radius = 450;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const ab = this.GetAbility();
        this.radius = ab ? ab.GetSpecialValueFor("radius") : 450;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_slark/slark_shadow_dance.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(pfx, 0, parent.GetAbsOrigin());
            ParticleManager.ReleaseParticleIndex(pfx);
        }
        this.OnIntervalThink();
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!caster || caster.IsNull() || !parent || parent.IsNull() || !ab) return;
        const origin = parent.GetAbsOrigin();

        const allies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            origin,
            undefined,
            this.radius,
            UnitTargetTeam.FRIENDLY,
            UnitTargetType.HERO,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const ally of allies) {
            if (!ally || ally.IsNull() || !IsValidEntity(ally) || !ally.IsAlive()) continue;
            ally.AddNewModifier(caster, ab, "modifier_evo_slark_int_r_ally", { duration: 0.7 });
        }

        const baseDps = ab.GetSpecialValueFor("base_dps");
        const intPct = ab.GetSpecialValueFor("int_pct") / 100;
        const intVal = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
        const tickDmg = (baseDps + intVal * intPct) * 0.5;

        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            origin,
            undefined,
            this.radius,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            enemy.AddNewModifier(caster, ab, "modifier_evo_slark_int_r_enemy", { duration: 0.7 });
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: tickDmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
}

@registerModifier("modifier_evo_slark_int_r_ally")
export class modifier_evo_slark_int_r_ally extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return false;
    }
    IsPurgable(): boolean {
        return false;
    }
    GetTexture(): string {
        return "slark_depth_shroud";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_INVISIBLE")]: true,
            [dotaModifierState("MODIFIER_STATE_TRUESIGHT_IMMUNE")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
        ];
    }
    GetModifierInvisibilityLevel(): number {
        return 1;
    }
    GetModifierSpellAmplify_Percentage(): number {
        return 25;
    }
}

@registerModifier("modifier_evo_slark_int_r_enemy")
export class modifier_evo_slark_int_r_enemy extends BaseModifier {
    IsHidden(): boolean {
        return false;
    }
    IsDebuff(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    GetTexture(): string {
        return "slark_depth_shroud";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -30;
    }
    GetModifierMagicalResistanceBonus(): number {
        return -20;
    }
}
