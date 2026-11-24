import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/morph/evo_morph_water";

const WATER_MODS: readonly string[] = [
    "modifier_evo_morph_wet",
    "modifier_evo_morph_water_q_dash",
    "modifier_evo_morph_water_q_trail",
    "modifier_evo_morph_water_w_root",
    "modifier_evo_morph_water_w_mr",
    "modifier_evo_morph_water_e_buff",
    "modifier_evo_morph_water_e_passive",
    "modifier_evo_morph_water_r_thinker",
];

if (IsServer()) {
    for (const modName of WATER_MODS) {
        LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

@registerModifier("modifier_evo_morph_wet")
export class modifier_evo_morph_wet extends BaseModifier {
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
        return -20;
    }
}

@registerAbility("evo_morph_water_q")
export class evo_morph_water_q extends BaseAbility {
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
        const speed = 1550;
        const duration = Math.max(0.14, distance / speed);

        caster.SetForwardVector(dir);
        caster.EmitSound("Hero_Morphling.Waveform");
        caster.AddNewModifier(caster, this, "modifier_evo_morph_water_q_dash", {
            duration,
            dir_x: dir.x,
            dir_y: dir.y,
            speed,
        });
    }
}

@registerModifier("modifier_evo_morph_water_q_dash")
export class modifier_evo_morph_water_q_dash extends BaseModifier {
    private dirX = 1;
    private dirY = 0;
    private speed = 1550;
    private damage = 80;
    private level = 1;
    private tickCount = 0;
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
        this.speed = params.speed ?? 1550;
        const ab = this.GetAbility();
        this.damage = ab ? ab.GetSpecialValueFor("damage") : 80;
        this.level = ab ? ab.GetLevel() : 1;
        this.tickCount = 0;
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
        this.tickCount += 1;
        const pos = parent.GetAbsOrigin();
        const step = this.speed * 0.03;
        const nextPos = Vector(pos.x + this.dirX * step, pos.y + this.dirY * step, pos.z);
        nextPos.z = GetGroundHeight(nextPos, parent);
        parent.SetAbsOrigin(nextPos);

        const ab = this.GetAbility();
        if (this.level >= 2 && this.tickCount % 3 === 0) {
            CreateModifierThinker(
                parent,
                ab,
                "modifier_evo_morph_water_q_trail",
                { duration: 3.0 },
                nextPos,
                parent.GetTeamNumber(),
                false
            );
        }

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            nextPos,
            undefined,
            185,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );

        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const id = enemy.entindex();
            if (this.hitTargets.has(id)) continue;
            this.hitTargets.add(id);
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: this.damage,
                damage_type: DamageTypes.MAGICAL,
            });
            if (this.level >= 2) {
                enemy.AddNewModifier(parent, ab, "modifier_evo_morph_wet", { duration: 2.5 });
            }
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
        if (!parent || parent.IsNull() || !IsValidEntity(parent)) return;
        const endPos = parent.GetAbsOrigin();
        FindClearSpaceForUnit(parent, endPos, true);

        if (this.level >= 3) {
            const ab = this.GetAbility();
            const enemies = FindUnitsInRadius(
                parent.GetTeamNumber(),
                parent.GetAbsOrigin(),
                undefined,
                225,
                UnitTargetTeam.ENEMY,
                (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                UnitTargetFlags.NONE,
                FindOrder.ANY,
                false
            );
            for (const enemy of enemies) {
                if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
                const toCenter = Vector(
                    parent.GetAbsOrigin().x - enemy.GetAbsOrigin().x,
                    parent.GetAbsOrigin().y - enemy.GetAbsOrigin().y,
                    0
                );
                const d = toCenter.Length2D();
                if (d > 90) {
                    const dir = toCenter.Normalized();
                    const pulled = Vector(
                        enemy.GetAbsOrigin().x + dir.x * (d - 80),
                        enemy.GetAbsOrigin().y + dir.y * (d - 80),
                        enemy.GetAbsOrigin().z
                    );
                    FindClearSpaceForUnit(enemy, pulled, true);
                }
                enemy.AddNewModifier(parent, ab, "modifier_stunned", { duration: 0.2 });
                enemy.AddNewModifier(parent, ab, "modifier_evo_morph_wet", { duration: 3.0 });
            }
        }
    }
}

@registerModifier("modifier_evo_morph_water_q_trail")
export class modifier_evo_morph_water_q_trail extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.StartIntervalThink(0.35);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        if (!caster || caster.IsNull() || !parent || parent.IsNull()) return;
        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            170,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.ANY,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            enemy.AddNewModifier(caster, this.GetAbility(), "modifier_evo_morph_wet", { duration: 1.5 });
        }
    }
}

@registerAbility("evo_morph_water_w")
export class evo_morph_water_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        caster.EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Cast");
        ProjectileManager.CreateTrackingProjectile({
            Target: target,
            Source: caster,
            Ability: this,
            EffectName: "particles/units/heroes/hero_morphling/morphling_adaptive_strike_agi_proj.vpcf",
            iMoveSpeed: 1200,
            bDodgeable: true,
            bProvidesVision: false,
            iSourceAttachment: ProjectileAttachment.ATTACK_1,
        });
    }
    OnProjectileHit(target: CDOTA_BaseNPC | undefined): boolean | void {
        if (!IsServer()) return true;
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return true;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return true;
        if (target.TriggerSpellAbsorb(this)) return true;

        const level = this.GetLevel();
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const statPct = this.GetSpecialValueFor("stat_pct") / 100;
        let statSum = 0;
        if (caster.IsRealHero()) {
            const hero = caster as CDOTA_BaseNPC_Hero;
            statSum = hero.GetStrength() + hero.GetAgility();
        }
        const totalDmg = baseDmg + statSum * statPct;
        const wasWet = target.HasModifier("modifier_evo_morph_wet");

        target.EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Target");
        if (level >= 3) {
            target.AddNewModifier(caster, this, "modifier_evo_morph_water_w_mr", { duration: 4.0 });
        }
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: totalDmg,
            damage_type: DamageTypes.MAGICAL,
        });
        target.AddNewModifier(caster, this, "modifier_evo_morph_wet", { duration: 2.0 });

        if (level >= 2 && wasWet) {
            target.AddNewModifier(caster, this, "modifier_evo_morph_water_w_root", { duration: 1.2 });
        }

        if (level >= 2) {
            const dir = Vector(
                target.GetAbsOrigin().x - caster.GetAbsOrigin().x,
                target.GetAbsOrigin().y - caster.GetAbsOrigin().y,
                0
            ).Normalized();
            const splashOrigin = Vector(
                target.GetAbsOrigin().x + dir.x * 160,
                target.GetAbsOrigin().y + dir.y * 160,
                target.GetAbsOrigin().z
            );
            const splashTargets = FindUnitsInRadius(
                caster.GetTeamNumber(),
                splashOrigin,
                undefined,
                220,
                UnitTargetTeam.ENEMY,
                (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                UnitTargetFlags.NONE,
                FindOrder.ANY,
                false
            );
            for (const enemy of splashTargets) {
                if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive() || enemy === target) continue;
                ApplyDamage({
                    victim: enemy,
                    attacker: caster,
                    ability: this,
                    damage: totalDmg * 0.5,
                    damage_type: DamageTypes.MAGICAL,
                });
                enemy.AddNewModifier(caster, this, "modifier_evo_morph_wet", { duration: 2.0 });
            }
        }
        return true;
    }
}

@registerModifier("modifier_evo_morph_water_w_root")
export class modifier_evo_morph_water_w_root extends BaseModifier {
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
        return "morphling_adaptive_strike_str";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}

@registerModifier("modifier_evo_morph_water_w_mr")
export class modifier_evo_morph_water_w_mr extends BaseModifier {
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
        return "morphling_adaptive_strike_agi";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS"),
            dotaModifierFunction("MODIFIER_EVENT_ON_DEATH"),
        ];
    }
    GetModifierMagicalResistanceBonus(): number {
        return -15;
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent) return;
        const ab = this.GetAbility();
        if (!ab || ab.IsNull()) return;
        const rem = ab.GetCooldownTimeRemaining();
        if (rem > 0) {
            ab.EndCooldown();
            ab.StartCooldown(rem * 0.5);
        }
    }
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
