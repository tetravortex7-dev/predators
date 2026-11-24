import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/morph/evo_morph_water_er";

const WATER_ER_MODS: readonly string[] = [
    "modifier_evo_morph_water_e_buff",
    "modifier_evo_morph_water_e_passive",
    "modifier_evo_morph_water_r_thinker",
];

for (const modName of WATER_ER_MODS) {
    LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
}

@registerAbility("evo_morph_water_e")
export class evo_morph_water_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_morph_water_e_passive";
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const dur = this.GetSpecialValueFor("duration");
        if (this.GetLevel() >= 2) {
            caster.Purge(false, true, false, false, false);
        }
        caster.EmitSound("Hero_Morphling.MorphAgi");
        caster.AddNewModifier(caster, this, "modifier_evo_morph_water_e_buff", { duration: dur });
    }
}

@registerModifier("modifier_evo_morph_water_e_buff")
export class modifier_evo_morph_water_e_buff extends BaseModifier {
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
        return "morphling_morph_str";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        const ab = this.GetAbility();
        if (ab && ab.GetLevel() >= 2) {
            return { [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true };
        }
        return {};
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_EVASION_CONSTANT"),
            dotaModifierFunction("MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return 18;
    }
    GetModifierEvasion_Constant(): number {
        return 25;
    }
    GetModifierStatusResistanceStacking(): number {
        const ab = this.GetAbility();
        return ab && ab.GetLevel() >= 3 ? 25 : 0;
    }
}

@registerModifier("modifier_evo_morph_water_e_passive")
export class modifier_evo_morph_water_e_passive extends BaseModifier {
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
            dotaModifierFunction("MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT"),
        ];
    }
    private isOnCooldownT4(): boolean {
        const ab = this.GetAbility();
        return ab !== undefined && !ab.IsNull() && ab.GetLevel() >= 3 && !ab.IsCooldownReady();
    }
    GetModifierPhysicalArmorBonus(): number {
        return this.isOnCooldownT4() ? 6 : 0;
    }
    GetModifierConstantHealthRegen(): number {
        return this.isOnCooldownT4() ? 5 : 0;
    }
}

@registerAbility("evo_morph_water_r")
export class evo_morph_water_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;
        const pos = this.GetCursorPosition();
        const dur = this.GetSpecialValueFor("duration");
        caster.EmitSound("Hero_Slardar.Amplify_Damage");
        CreateModifierThinker(
            caster,
            this,
            "modifier_evo_morph_water_r_thinker",
            { duration: dur },
            pos,
            caster.GetTeamNumber(),
            false
        );
    }
}

@registerModifier("modifier_evo_morph_water_r_thinker")
export class modifier_evo_morph_water_r_thinker extends BaseModifier {
    private radius = 500;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        const ab = this.GetAbility();
        this.radius = ab ? ab.GetSpecialValueFor("radius") : 500;
        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
                ParticleAttachment.WORLDORIGIN,
                undefined
            );
            ParticleManager.SetParticleControl(pfx, 0, parent.GetAbsOrigin());
            ParticleManager.SetParticleControl(pfx, 1, Vector(this.radius, this.radius, this.radius));
            ParticleManager.ReleaseParticleIndex(pfx);
        }
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        if (!caster || caster.IsNull() || !parent || parent.IsNull()) return;
        const origin = parent.GetAbsOrigin();

        if (caster.IsAlive()) {
            const dist = ((caster.GetAbsOrigin() - origin) as Vector).Length2D();
            if (dist <= this.radius) {
                const q = caster.FindAbilityByName("evo_morph_water_q");
                if (q && !q.IsNull()) {
                    const rem = q.GetCooldownTimeRemaining();
                    if (rem > 0.3) {
                        q.EndCooldown();
                        q.StartCooldown(Math.max(0.05, rem - 0.25));
                    }
                }
            }
        }

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
            enemy.AddNewModifier(caster, this.GetAbility(), "modifier_evo_morph_wet", { duration: 1.0 });
        }
    }
}
