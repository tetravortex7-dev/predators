import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/morph/evo_morph_void";

const VOID_MODS: readonly string[] = [
    "modifier_evo_morph_void_q_invis",
    "modifier_evo_morph_void_q_slow",
    "modifier_evo_morph_void_w_mark",
    "modifier_evo_morph_void_w_amp",
    "modifier_evo_morph_void_e_passive",
    "modifier_evo_morph_erosion",
    "modifier_evo_morph_void_exhaust",
    "modifier_evo_morph_void_r_root",
];

for (const modName of VOID_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_morph_void_q")
export class evo_morph_void_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Weaver.Shukuchi");
        caster.AddNewModifier(caster, this, "modifier_evo_morph_void_q_invis", { duration: dur });
    }
}

@registerModifier("modifier_evo_morph_void_q_invis")
export class modifier_evo_morph_void_q_invis extends BaseModifier {
    private hitSet: Set<EntityIndex> = new Set();

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
        return "weaver_shukuchi";
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.hitSet = new Set();
        this.StartIntervalThink(0.1);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive() || !ab) return;

        const passDmg = ab.GetSpecialValueFor("pass_damage");
        const level = ab.GetLevel();
        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            175,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const id = enemy.entindex();
            if (this.hitSet.has(id)) continue;
            this.hitSet.add(id);
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: passDmg,
                damage_type: DamageTypes.MAGICAL,
            });
            if (level >= 2) {
                const slowDur = level >= 3 ? 4.0 : 3.0;
                const mod = enemy.AddNewModifier(parent, ab, "modifier_evo_morph_void_q_slow", { duration: slowDur });
                if (mod !== undefined) {
                    mod.SetStackCount(level >= 3 ? 25 : 15);
                }
            }
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_INVISIBLE")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE"),
            dotaModifierFunction("MODIFIER_PROPERTY_INVISIBILITY_LEVEL"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
        ];
    }
    GetModifierMoveSpeed_Absolute(): number {
        return 550;
    }
    GetModifierInvisibilityLevel(): number {
        return 1;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.attacker !== parent) return;
        const target = event.target;
        const ab = this.GetAbility();
        if (target && !target.IsNull() && IsValidEntity(target) && ab && ab.GetLevel() >= 2) {
            const stun = ab.GetLevel() >= 3 ? 0.4 : 0.2;
            target.AddNewModifier(parent, ab, "modifier_stunned", { duration: stun });
        }
        this.Destroy();
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent) return;
        if (event.ability && event.ability.GetAbilityName() === "evo_morph_void_w") return;
        if (event.ability && event.ability.GetAbilityName() === "evo_morph_void_q") return;
        this.Destroy();
    }
}

@registerModifier("modifier_evo_morph_void_q_slow")
export class modifier_evo_morph_void_q_slow extends BaseModifier {
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
        return "weaver_shukuchi";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -this.GetStackCount();
    }
}

@registerAbility("evo_morph_void_w")
export class evo_morph_void_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Enigma.Malefice");
        target.AddNewModifier(caster, this, "modifier_evo_morph_void_w_mark", { duration: dur });
    }
}

@registerModifier("modifier_evo_morph_void_w_mark")
export class modifier_evo_morph_void_w_mark extends BaseModifier {
    private triggered = false;

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
        return "enigma_malefice";
    }
    OnCreated(): void {
        this.triggered = false;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_TAKEDAMAGE")];
    }
    OnTakeDamage(event: ModifierInstanceEvent): void {
        if (!IsServer() || this.triggered) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !caster || caster.IsNull() || !ab) return;
        if (event.unit !== parent || event.attacker !== caster) return;
        if (event.inflictor === ab) return;

        this.triggered = true;
        const level = ab.GetLevel();
        const baseDmg = ab.GetSpecialValueFor("base_damage");
        const intPct = ab.GetSpecialValueFor("int_pct") / 100;
        const intVal = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;

        parent.EmitSound("Hero_VoidSpirit.AstralStep.End");
        ApplyDamage({
            victim: parent,
            attacker: caster,
            ability: ab,
            damage: baseDmg + intVal * intPct,
            damage_type: DamageTypes.MAGICAL,
        });
        if (level >= 2) {
            parent.AddNewModifier(caster, ab, "modifier_silence", { duration: 1.5 });
        }
        if (level >= 3) {
            const burn = parent.GetMaxMana() * 0.1;
            parent.SetMana(Math.max(0, parent.GetMana() - burn));
            caster.AddNewModifier(caster, ab, "modifier_evo_morph_void_w_amp", { duration: 5.0 });
        }
        this.Destroy();
    }
}

@registerModifier("modifier_evo_morph_void_w_amp")
export class modifier_evo_morph_void_w_amp extends BaseModifier {
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
        return "enigma_malefice";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE")];
    }
    GetModifierSpellAmplify_Percentage(): number {
        return 12;
    }
}

@registerAbility("evo_morph_void_e")
export class evo_morph_void_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_morph_void_e_passive";
    }
}

@registerModifier("modifier_evo_morph_void_e_passive")
export class modifier_evo_morph_void_e_passive extends BaseModifier {
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
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED")];
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent) return;
        const target = event.target;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;

        const level = ab.GetLevel();
        const maxStacks = ab.GetSpecialValueFor("max_stacks");
        const onHitPerStack = ab.GetSpecialValueFor("on_hit_damage");
        const addStacks =
            level >= 2 && (target.IsRooted() || target.HasModifier("modifier_evo_morph_void_q_slow")) ? 2 : 1;

        const existing = target.FindModifierByName("modifier_evo_morph_erosion");
        const cur = existing ? existing.GetStackCount() : 0;
        const next = Math.min(maxStacks, cur + addStacks);
        const mod = target.AddNewModifier(parent, ab, "modifier_evo_morph_erosion", { duration: 4.0 });
        if (mod !== undefined) {
            mod.SetStackCount(next);
        }

        ApplyDamage({
            victim: target,
            attacker: parent,
            ability: ab,
            damage: next * onHitPerStack,
            damage_type: DamageTypes.MAGICAL,
        });

        if (level >= 3 && next >= maxStacks) {
            target.AddNewModifier(parent, ab, "modifier_evo_morph_void_exhaust", { duration: 4.0 });
        }
    }
}

@registerModifier("modifier_evo_morph_erosion")
export class modifier_evo_morph_erosion extends BaseModifier {
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
        return "enigma_midnight_pulse";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")];
    }
    GetModifierMagicalResistanceBonus(): number {
        const ab = this.GetAbility();
        const per = ab ? ab.GetSpecialValueFor("mr_shred_per_stack") : 3;
        return -per * this.GetStackCount();
    }
}

@registerModifier("modifier_evo_morph_void_exhaust")
export class modifier_evo_morph_void_exhaust extends BaseModifier {
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
        return "ancient_apparition_ice_blast";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET"),
            dotaModifierFunction("MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE"),
        ];
    }
    GetModifierHealAmplify_PercentageTarget(): number {
        return -40;
    }
    GetModifierHPRegenAmplify_Percentage(): number {
        return -40;
    }
}

@registerAbility("evo_morph_void_r")
export class evo_morph_void_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const rootDur = this.GetSpecialValueFor("root_duration");
        const illuDur = this.GetSpecialValueFor("illusion_duration");

        caster.EmitSound("Hero_Enigma.Black_Hole");
        target.AddNewModifier(caster, this, "modifier_evo_morph_void_r_root", { duration: rootDur });

        const illusions = CreateIllusions(
            caster,
            caster as CDOTA_BaseNPC_Hero,
            {
                outgoing_damage: -35,
                incoming_damage: 50,
            },
            1,
            100,
            false,
            true
        );
        for (const illu of illusions) {
            if (!illu || illu.IsNull() || !IsValidEntity(illu)) continue;
            illu.AddNewModifier(caster, this, "modifier_kill", { duration: illuDur });
            FindClearSpaceForUnit(illu, target.GetAbsOrigin(), true);
            illu.MoveToTargetToAttack(target);
        }
    }
}

@registerModifier("modifier_evo_morph_void_r_root")
export class modifier_evo_morph_void_r_root extends BaseModifier {
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
        return "enigma_black_hole";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}
