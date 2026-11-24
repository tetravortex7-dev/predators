import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/morph/evo_morph_t1_water_splash";

LinkLuaModifier("modifier_evo_morph_t1_water_splash_dash", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_morph_t1_water_splash_slow", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_morph_t1_water_splash")
export class evo_morph_t1_water_splash extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const maxDist = this.GetSpecialValueFor("dash_range");
        const delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0);
        const rawDist = delta.Length2D();
        const dir = rawDist > 1 ? delta.Normalized() : caster.GetForwardVector();
        const distance = Math.min(maxDist, Math.max(150, rawDist));
        const speed = 1500;
        const duration = Math.max(0.12, distance / speed);

        caster.SetForwardVector(dir);
        caster.EmitSound("Hero_Morphling.Waveform");

        caster.AddNewModifier(caster, this, "modifier_evo_morph_t1_water_splash_dash", {
            duration,
            dir_x: dir.x,
            dir_y: dir.y,
            speed,
        });
    }
}

@registerModifier("modifier_evo_morph_t1_water_splash_dash")
export class modifier_evo_morph_t1_water_splash_dash extends BaseModifier {
    private dirX = 1;
    private dirY = 0;
    private speed = 1500;
    private width = 175;
    private damage = 75;
    private slowDuration = 2.0;
    private hitTargets: Set<EntityIndex> = new Set();
    private pfx?: ParticleID;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
            [dotaModifierState("MODIFIER_STATE_COMMAND_RESTRICTED")]: true,
        };
    }
    OnCreated(params: { dir_x?: number; dir_y?: number; speed?: number }): void {
        if (!IsServer()) return;
        this.dirX = params.dir_x ?? 1;
        this.dirY = params.dir_y ?? 0;
        this.speed = params.speed ?? 1500;
        const ability = this.GetAbility();
        this.width = ability ? ability.GetSpecialValueFor("width") : 175;
        this.damage = ability ? ability.GetSpecialValueFor("damage") : 75;
        this.slowDuration = ability ? ability.GetSpecialValueFor("slow_duration") : 2.0;
        this.hitTargets = new Set();

        const parent = this.GetParent();
        if (parent && !parent.IsNull()) {
            this.pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_morphling/morphling_waveform.vpcf",
                ParticleAttachment.ABSORIGIN_FOLLOW,
                parent
            );
        }
        this.StartIntervalThink(0.03);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) {
            this.Destroy();
            return;
        }

        const pos = parent.GetAbsOrigin();
        const step = this.speed * 0.03;
        const nextPos = Vector(pos.x + this.dirX * step, pos.y + this.dirY * step, pos.z);
        nextPos.z = GetGroundHeight(nextPos, parent);
        parent.SetAbsOrigin(nextPos);

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            nextPos,
            undefined,
            this.width,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );

        const ability = this.GetAbility();
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const id = enemy.entindex();
            if (this.hitTargets.has(id)) continue;
            this.hitTargets.add(id);

            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability,
                damage: this.damage,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(parent, ability, "modifier_evo_morph_t1_water_splash_slow", {
                duration: this.slowDuration,
            });
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        if (this.pfx !== undefined) {
            ParticleManager.DestroyParticle(this.pfx, false);
            ParticleManager.ReleaseParticleIndex(this.pfx);
            this.pfx = undefined;
        }
        const parent = this.GetParent();
        if (parent && !parent.IsNull() && IsValidEntity(parent)) {
            FindClearSpaceForUnit(parent, parent.GetAbsOrigin(), true);
        }
    }
}

@registerModifier("modifier_evo_morph_t1_water_splash_slow")
export class modifier_evo_morph_t1_water_splash_slow extends BaseModifier {
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
        return "morphling_waveform";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        const ability = this.GetAbility();
        const slow = ability ? ability.GetSpecialValueFor("slow_pct") : 15;
        return -slow;
    }
}
