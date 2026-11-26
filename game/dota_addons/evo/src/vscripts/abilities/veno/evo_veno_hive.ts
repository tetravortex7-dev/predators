import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applyVenoCreepDamage,
    applyVenoSporeInfection,
    findVenoEnemies,
    getVenoActiveTurrets,
    getVenoBranchMaxLevel,
    getVenoInt,
    getVenoTier,
    spawnVenoBioTurret,
    triggerVenoSporePulse,
} from "./evo_veno_shared";
import "./evo_veno_debuffs";

const SCRIPT_PATH = "abilities/veno/evo_veno_hive";

LinkLuaModifier("modifier_evo_veno_hive_q_cloud", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_hive_q_cloud_debuff", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_hive_turret", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_veno_hive_turret_frenzy", SCRIPT_PATH, LuaModifierMotionType.NONE);

@registerAbility("evo_veno_hive_q")
export class evo_veno_hive_q extends BaseAbility {
    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    GetAOERadius(): number {
        return this.GetSpecialValueFor("radius");
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const tier = getVenoTier(caster);
        const pos = GetGroundPosition(this.GetCursorPosition(), caster);
        const radius = this.GetSpecialValueFor("radius");
        const dmg = this.GetSpecialValueFor("base_damage") + (getVenoInt(caster) * this.GetSpecialValueFor("int_pct")) / 100;
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const extendSec = this.GetSpecialValueFor("turret_extend");

        caster.EmitSound("Hero_Venomancer.NoxiousPlague.Cast");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_venomancer/venomancer_venomous_gale_impact.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, pos);
        ParticleManager.ReleaseParticleIndex(pfx);

        let hitHero = false;
        for (const enemy of findVenoEnemies(caster, pos, radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            if (enemy.IsRealHero()) hitHero = true;
            applyVenoCreepDamage(caster, enemy, this, dmg, DamageTypes.MAGICAL, creepMult);
            applyVenoSporeInfection(caster, enemy, this);
        }

        for (const turret of getVenoActiveTurrets(caster)) {
            if (((turret.GetAbsOrigin() - pos) as Vector).Length2D() <= radius) {
                turret.SetHealth(turret.GetMaxHealth());
                const killMod = turret.FindModifierByName("modifier_kill");
                if (killMod && !killMod.IsNull()) {
                    killMod.SetDuration(killMod.GetRemainingTime() + extendSec, true);
                }
                const tMod = turret.FindModifierByName("modifier_evo_veno_hive_turret");
                if (tMod && !tMod.IsNull()) {
                    tMod.SetDuration(tMod.GetRemainingTime() + extendSec, true);
                }
            }
        }

        if (tier >= 3) {
            CreateModifierThinker(
                caster,
                this,
                "modifier_evo_veno_hive_q_cloud",
                { duration: this.GetSpecialValueFor("cloud_duration") },
                pos,
                caster.GetTeamNumber(),
                false
            );
        }
        if (tier >= 4 && hitHero) {
            spawnVenoBioTurret(caster, pos, false);
        }
    }
}

@registerModifier("modifier_evo_veno_hive_q_cloud")
export class modifier_evo_veno_hive_q_cloud extends BaseModifier {
    private radius = 260;
    private accum = 0;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    IsAura(): boolean {
        return true;
    }
    GetModifierAura(): string {
        return "modifier_evo_veno_hive_q_cloud_debuff";
    }
    GetAuraRadius(): number {
        return this.radius;
    }
    GetAuraSearchTeam(): UnitTargetTeam {
        return UnitTargetTeam.ENEMY;
    }
    GetAuraSearchType(): UnitTargetType {
        return (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType;
    }
    OnCreated(): void {
        this.radius = 260;
        this.accum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            this.radius = ab.GetSpecialValueFor("radius");
        }
        if (!IsServer()) return;
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_viper/viper_nethertoxin.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            this.GetParent()
        );
        ParticleManager.SetParticleControl(pfx, 1, Vector(this.radius, 1, 1));
        this.AddParticle(pfx, false, false, -1, false, false);
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        const thinker = this.GetParent();
        if (!caster || caster.IsNull() || !ab || ab.IsNull() || !thinker || thinker.IsNull()) return;

        const halfDps =
            (ab.GetSpecialValueFor("cloud_dps") + (getVenoInt(caster) * ab.GetSpecialValueFor("cloud_int_pct")) / 100) *
            0.5;
        for (const enemy of findVenoEnemies(caster, thinker.GetAbsOrigin(), this.radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: ab,
                damage: halfDps,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
}

@registerModifier("modifier_evo_veno_hive_q_cloud_debuff")
export class modifier_evo_veno_hive_q_cloud_debuff extends BaseModifier {
    private missPct = 25;
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
        return "venomancer_noxious_plague";
    }
    OnCreated(): void {
        this.missPct = 25;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const v = ab.GetSpecialValueFor("cloud_miss_pct");
            if (v > 0) this.missPct = v;
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MISS_PERCENTAGE")];
    }
    GetModifierMiss_Percentage(): number {
        return this.missPct;
    }
}

@registerAbility("evo_veno_hive_w")
export class evo_veno_hive_w extends BaseAbility {
    GetMaxLevel(): number {
        return getVenoBranchMaxLevel(this.GetCaster());
    }
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const pos = GetGroundPosition(this.GetCursorPosition(), caster);
        caster.EmitSound("Hero_Venomancer.Plague_Ward");
        spawnVenoBioTurret(caster, pos, false);
    }
}

@registerModifier("modifier_evo_veno_hive_turret_frenzy")
export class modifier_evo_veno_hive_turret_frenzy extends BaseModifier {
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
        return "venomancer_plague_ward";
    }
}

@registerModifier("modifier_evo_veno_hive_turret")
export class modifier_evo_veno_hive_turret extends BaseModifier {
    private range = 550;
    private interval = 1.1;
    private shotAccum = 0;
    private tetherAccum = 0;
    private shotCounter = 0;
    private diedTriggered = false;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(params: { range?: number }): void {
        this.range = params?.range ?? 550;
        this.interval = 1.1;
        this.shotAccum = 0;
        this.tetherAccum = 0;
        this.shotCounter = 0;
        this.diedTriggered = false;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const r = ab.GetSpecialValueFor("turret_range");
            if (r > 0) this.range = r;
            const inv = ab.GetSpecialValueFor("attack_interval");
            if (inv > 0) this.interval = inv;
        }
        if (!IsServer()) return;
        this.StartIntervalThink(0.1);
    }
    private fireAtTarget(target: CDOTA_BaseNPC, dmgMult: number): void {
        const turret = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!turret || turret.IsNull() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;
        if (!target || target.IsNull() || !target.IsAlive()) return;

        const baseDmg = ab.GetSpecialValueFor("base_damage") + (getVenoInt(caster) * ab.GetSpecialValueFor("int_pct")) / 100;
        const creepMult = ab.GetSpecialValueFor("creep_mult");
        const tier = getVenoTier(caster);

        turret.FaceTowards(target.GetAbsOrigin());
        ProjectileManager.CreateTrackingProjectile({
            Target: target,
            Source: turret,
            Ability: ab,
            EffectName: "particles/units/heroes/hero_venomancer/venomancer_plague_ward_projectile.vpcf",
            iMoveSpeed: 1900,
            bDodgeable: true,
        });
        applyVenoCreepDamage(caster, target, ab, baseDmg * dmgMult, DamageTypes.MAGICAL, creepMult);

        if (tier >= 4) {
            const splashRadius = ab.GetSpecialValueFor("splash_radius");
            const splashDmg = baseDmg * dmgMult * (ab.GetSpecialValueFor("splash_pct") / 100);
            for (const other of findVenoEnemies(caster, target.GetAbsOrigin(), splashRadius)) {
                if (!other || other.IsNull() || !other.IsAlive() || other === target) continue;
                applyVenoCreepDamage(caster, other, ab, splashDmg, DamageTypes.MAGICAL, creepMult);
            }
        }

        if (tier >= 3) {
            this.shotCounter += 1;
            const cadence = tier >= 4 ? 3 : 4;
            if (this.shotCounter >= cadence) {
                this.shotCounter = 0;
                triggerVenoSporePulse(caster, target, 1.0);
            }
        }
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const turret = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!turret || turret.IsNull() || !turret.IsAlive() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;

        const origin = turret.GetAbsOrigin();
        const tier = getVenoTier(caster);

        const infectedCheck = findVenoEnemies(caster, origin, 650).some((e) =>
            e.HasModifier("modifier_evo_veno_spore_infection")
        );
        const frenzyMult = turret.HasModifier("modifier_evo_veno_hive_turret_frenzy") ? 1.5 : 1.0;
        const infectMult = infectedCheck ? 1.3 : 1.0;

        this.shotAccum += 0.1 * frenzyMult * infectMult;
        if (this.shotAccum >= this.interval) {
            this.shotAccum -= this.interval;
            const enemies = findVenoEnemies(caster, origin, this.range);
            if (enemies.length > 0) {
                const prioritized: CDOTA_BaseNPC[] = [];
                for (const u of enemies) {
                    if (u && !u.IsNull() && u.HasModifier("modifier_evo_veno_spore_infection")) {
                        prioritized.push(u);
                    }
                }
                for (const u of enemies) {
                    if (!prioritized.includes(u)) prioritized.push(u);
                }

                this.fireAtTarget(prioritized[0], 1.0);
                const obeliskLinked = turret.HasModifier("modifier_evo_veno_hive_obelisk_link");
                if (obeliskLinked && prioritized.length > 1) {
                    this.fireAtTarget(prioritized[1], 1.0);
                }
            }
        }

        if (tier >= 3) {
            this.tetherAccum += 0.1;
            if (this.tetherAccum >= 0.5) {
                this.tetherAccum -= 0.5;
                const tetherRange = ab.GetSpecialValueFor("tether_range");
                const halfDps =
                    (ab.GetSpecialValueFor("tether_dps") +
                        (getVenoInt(caster) * ab.GetSpecialValueFor("tether_int_pct")) / 100) *
                    0.5;
                const myIdx = turret.GetEntityIndex();
                for (const other of getVenoActiveTurrets(caster)) {
                    if (other.GetEntityIndex() <= myIdx) continue;
                    const p2 = other.GetAbsOrigin();
                    if (((p2 - origin) as Vector).Length2D() > tetherRange) continue;
                    const mid = ((origin + p2) * 0.5) as Vector;
                    const segLen = ((p2 - origin) as Vector).Length2D();
                    for (const enemy of findVenoEnemies(caster, mid, segLen * 0.5 + 80)) {
                        const ep = enemy.GetAbsOrigin();
                        const dx = p2.x - origin.x;
                        const dy = p2.y - origin.y;
                        const denom = dx * dx + dy * dy;
                        if (denom < 1) continue;
                        const t = Math.max(0, Math.min(1, ((ep.x - origin.x) * dx + (ep.y - origin.y) * dy) / denom));
                        const cx = origin.x + t * dx;
                        const cy = origin.y + t * dy;
                        const distSq = (ep.x - cx) * (ep.x - cx) + (ep.y - cy) * (ep.y - cy);
                        if (distSq <= 110 * 110) {
                            ApplyDamage({
                                victim: enemy,
                                attacker: caster,
                                ability: ab,
                                damage: halfDps,
                                damage_type: DamageTypes.MAGICAL,
                            });
                            enemy.AddNewModifier(caster, ab, "modifier_evo_veno_tether_slow", { duration: 0.7 });
                        }
                    }
                }
            }
        }
    }
    OnDestroy(): void {
        if (!IsServer() || this.diedTriggered) return;
        this.diedTriggered = true;
        const turret = this.GetParent();
        const caster = this.GetCaster();
        if (!turret || turret.IsNull() || !caster || caster.IsNull()) return;

        const eAb = caster.FindAbilityByName("evo_veno_hive_e");
        if (!eAb || eAb.IsNull() || eAb.GetLevel() <= 0) return;

        const radius = eAb.GetSpecialValueFor("death_radius");
        const dmg = eAb.GetSpecialValueFor("death_base_dmg") + (getVenoInt(caster) * eAb.GetSpecialValueFor("death_int_pct")) / 100;
        const mana = eAb.GetSpecialValueFor("mana_return");
        const origin = turret.GetAbsOrigin();

        for (const enemy of findVenoEnemies(caster, origin, radius)) {
            if (!enemy || enemy.IsNull() || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: eAb,
                damage: dmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }
        if (mana > 0 && caster.IsAlive()) {
            caster.GiveMana(mana);
        }
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}
