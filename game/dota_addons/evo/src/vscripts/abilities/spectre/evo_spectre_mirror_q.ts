import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";
import {
    applySpectreCreepDamage,
    findMirrorQAbility,
    findSpectreEnemies,
    getSpectreBranchMaxLevel,
    getSpectreInt,
    getSpectreTier,
} from "./evo_spectre_shared";
import "./evo_spectre_debuffs";

const SCRIPT_PATH = "abilities/spectre/evo_spectre_mirror_q";

LinkLuaModifier("modifier_evo_spectre_mirror_q_trail", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_q_hero_trail", SCRIPT_PATH, LuaModifierMotionType.NONE);
LinkLuaModifier("modifier_evo_spectre_mirror_q_phase", SCRIPT_PATH, LuaModifierMotionType.NONE);

interface TrailNode {
    pos: Vector;
    expireTime: number;
}

interface TrailRibbon {
    pfx: ParticleID;
    expireTime: number;
}

function getTrailController(
    caster: CDOTA_BaseNPC,
    ability: CDOTABaseAbility
): modifier_evo_spectre_mirror_q_trail | undefined {
    let ctrl = caster.FindModifierByName("modifier_evo_spectre_mirror_q_trail") as
        | modifier_evo_spectre_mirror_q_trail
        | undefined;
    if (!ctrl || ctrl.IsNull()) {
        ctrl = caster.AddNewModifier(caster, ability, "modifier_evo_spectre_mirror_q_trail", {}) as
            | modifier_evo_spectre_mirror_q_trail
            | undefined;
    }
    return ctrl && !ctrl.IsNull() ? ctrl : undefined;
}

@registerAbility("evo_spectre_mirror_q")
export class evo_spectre_mirror_q extends BaseAbility {
    private hitSets: Record<number, Set<EntityIndex>> = {};
    private lastTrailPos: Record<number, Vector> = {};
    private isTrackingProj: Record<number, boolean> = {};
    private ribbonByProj: Record<number, ParticleID> = {};

    private ensureProjState(): void {
        if (this.hitSets === undefined) this.hitSets = {};
        if (this.lastTrailPos === undefined) this.lastTrailPos = {};
        if (this.isTrackingProj === undefined) this.isTrackingProj = {};
        if (this.ribbonByProj === undefined) this.ribbonByProj = {};
    }

    GetMaxLevel(): number {
        return getSpectreBranchMaxLevel(this.GetCaster());
    }

    OnSpellStart(): void {
        if (!IsServer()) return;
        this.ensureProjState();
        const caster = this.GetCaster();
        const origin = caster.GetAbsOrigin();
        const groundOrigin = GetGroundPosition(origin, caster);
        const target = this.GetCursorTarget();
        const range = Math.max(400, this.GetCastRange(origin, undefined));
        const width = this.GetSpecialValueFor("dagger_radius");
        const speed = this.GetSpecialValueFor("speed");
        const pathDur = this.GetSpecialValueFor("dagger_path_duration");

        caster.EmitSound("Hero_Spectre.DaggerCast");

        const trailPfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_spectre/spectre_shadow_path.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(trailPfx, 3, groundOrigin);
        ParticleManager.SetParticleControl(trailPfx, 5, Vector(pathDur + 0.4, 0, 0));
        ParticleManager.SetParticleControl(trailPfx, 6, Vector(1, 0, 0));

        const ctrl = getTrailController(caster, this);
        if (ctrl) {
            ctrl.registerRibbon(trailPfx, pathDur + 0.5);
            ctrl.pushNode(groundOrigin, pathDur);
        }

        if (target && !target.IsNull() && IsValidEntity(target) && target.IsAlive()) {
            const projId = ProjectileManager.CreateTrackingProjectile({
                Target: target,
                Source: caster,
                Ability: this,
                EffectName: "particles/units/heroes/hero_spectre/spectre_spectral_dagger_tracking.vpcf",
                iMoveSpeed: speed,
                bDodgeable: false,
                bVisibleToEnemies: true,
                bProvidesVision: true,
                iVisionRadius: 200,
                iVisionTeamNumber: caster.GetTeamNumber(),
            });
            this.hitSets[projId] = new Set<EntityIndex>();
            this.lastTrailPos[projId] = groundOrigin;
            this.isTrackingProj[projId] = true;
            this.ribbonByProj[projId] = trailPfx;
            return;
        }

        let dir = (this.GetCursorPosition() - origin) as Vector;
        dir.z = 0;
        dir = dir.Length2D() > 1 ? dir.Normalized() : caster.GetForwardVector();
        const projId = ProjectileManager.CreateLinearProjectile({
            Ability: this,
            EffectName: "particles/units/heroes/hero_spectre/spectre_spectral_dagger.vpcf",
            vSpawnOrigin: origin,
            fDistance: range,
            fStartRadius: width,
            fEndRadius: width,
            Source: caster,
            bHasFrontalCone: false,
            iUnitTargetTeam: UnitTargetTeam.ENEMY,
            iUnitTargetFlags: UnitTargetFlags.NONE,
            iUnitTargetType: (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            vVelocity: (dir * speed) as Vector,
            bProvidesVision: true,
            iVisionRadius: 200,
            iVisionTeamNumber: caster.GetTeamNumber(),
        });
        this.hitSets[projId] = new Set<EntityIndex>();
        this.lastTrailPos[projId] = groundOrigin;
        this.isTrackingProj[projId] = false;
        this.ribbonByProj[projId] = trailPfx;
    }

    private applyDaggerHit(caster: CDOTA_BaseNPC, target: CDOTA_BaseNPC, set: Set<EntityIndex> | undefined): void {
        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive() || target.IsBuilding()) return;
        const idx = target.GetEntityIndex();
        if (set !== undefined) {
            if (set.has(idx)) return;
            set.add(idx);
        }

        const dmg =
            this.GetSpecialValueFor("damage") + (getSpectreInt(caster) * this.GetSpecialValueFor("int_pct")) / 100;
        const creepMult = this.GetSpecialValueFor("creep_mult");
        const pathDur = this.GetSpecialValueFor("dagger_path_duration");
        const heroPathDur = this.GetSpecialValueFor("hero_path_duration");

        target.EmitSound("Hero_Spectre.DaggerImpact");
        applySpectreCreepDamage(caster, target, this, dmg, DamageTypes.MAGICAL, creepMult);
        target.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_q_slow", { duration: pathDur });
        if (target.IsRealHero()) {
            target.AddNewModifier(caster, this, "modifier_evo_spectre_mirror_q_hero_trail", { duration: heroPathDur });
        }
    }

    private clearProjectileData(projId: ProjectileID): void {
        delete this.hitSets[projId];
        delete this.lastTrailPos[projId];
        delete this.isTrackingProj[projId];
        delete this.ribbonByProj[projId];
    }

    OnProjectileThinkHandle(projectileHandle: ProjectileID): void {
        if (!IsServer()) return;
        this.ensureProjState();
        const caster = this.GetCaster();
        if (!caster || caster.IsNull()) return;
        const location = this.isTrackingProj[projectileHandle]
            ? ProjectileManager.GetTrackingProjectileLocation(projectileHandle)
            : ProjectileManager.GetLinearProjectileLocation(projectileHandle);
        if (!location) return;

        const ground = GetGroundPosition(location, caster);
        const ribbon = this.ribbonByProj[projectileHandle];
        if (ribbon !== undefined) {
            ParticleManager.SetParticleControl(ribbon, 3, ground);
        }

        const prev = this.lastTrailPos[projectileHandle];
        if (prev === undefined || ((ground - prev) as Vector).Length2D() >= 65) {
            this.lastTrailPos[projectileHandle] = ground;
            const ctrl = getTrailController(caster, this);
            if (ctrl) {
                ctrl.pushNode(ground, this.GetSpecialValueFor("dagger_path_duration"));
            }
        }

        if (this.isTrackingProj[projectileHandle]) {
            const set = this.hitSets[projectileHandle];
            const width = this.GetSpecialValueFor("dagger_radius");
            for (const enemy of findSpectreEnemies(caster, ground, width)) {
                this.applyDaggerHit(caster, enemy, set);
            }
        }
    }

    OnProjectileHitHandle(
        target: CDOTA_BaseNPC | undefined,
        location: Vector,
        projectileHandle: ProjectileID
    ): boolean {
        if (!IsServer()) return false;
        this.ensureProjState();
        const caster = this.GetCaster();
        const isTracking = this.isTrackingProj[projectileHandle] === true;
        if (!caster || caster.IsNull()) {
            this.clearProjectileData(projectileHandle);
            return isTracking;
        }

        const ribbon = this.ribbonByProj[projectileHandle];
        const ground = GetGroundPosition(location, caster);
        if (ribbon !== undefined) {
            ParticleManager.SetParticleControl(ribbon, 3, ground);
        }

        if (!target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) {
            const ctrl = getTrailController(caster, this);
            if (ctrl) {
                ctrl.pushNode(ground, this.GetSpecialValueFor("dagger_path_duration"));
            }
            this.clearProjectileData(projectileHandle);
            return isTracking;
        }

        const ctrl = getTrailController(caster, this);
        if (ctrl) {
            ctrl.pushNode(ground, this.GetSpecialValueFor("dagger_path_duration"));
        }
        this.applyDaggerHit(caster, target, this.hitSets[projectileHandle]);

        if (isTracking) {
            this.clearProjectileData(projectileHandle);
            return true;
        }
        return false;
    }
}

@registerAbility("evo_spectre_mirror_q_t3")
export class evo_spectre_mirror_q_t3 extends evo_spectre_mirror_q {}

@registerAbility("evo_spectre_mirror_q_t4")
export class evo_spectre_mirror_q_t4 extends evo_spectre_mirror_q {}

@registerModifier("modifier_evo_spectre_mirror_q_trail")
export class modifier_evo_spectre_mirror_q_trail extends BaseModifier {
    private nodes: TrailNode[] = [];
    private ribbons: TrailRibbon[] = [];
    private pathRadius = 175;
    private gracePeriod = 1.0;
    private dotAccum = 0;

    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    RemoveOnDeath(): boolean {
        return false;
    }
    OnCreated(): void {
        this.nodes = [];
        this.ribbons = [];
        this.pathRadius = 175;
        this.gracePeriod = 1.0;
        this.dotAccum = 0;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const pr = ab.GetSpecialValueFor("path_radius");
            const gp = ab.GetSpecialValueFor("dagger_grace_period");
            if (pr > 0) this.pathRadius = pr;
            if (gp > 0) this.gracePeriod = gp;
        }
        if (IsServer()) {
            this.StartIntervalThink(0.15);
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        for (const r of this.ribbons) {
            ParticleManager.DestroyParticle(r.pfx, false);
            ParticleManager.ReleaseParticleIndex(r.pfx);
        }
        this.ribbons = [];
        this.nodes = [];
    }
    public registerRibbon(pfx: ParticleID, duration: number): void {
        if (!IsServer()) return;
        this.ribbons.push({ pfx, expireTime: GameRules.GetGameTime() + duration });
    }
    public pushNode(pos: Vector, duration: number): void {
        if (!IsServer()) return;
        const now = GameRules.GetGameTime();
        const len = this.nodes.length;
        if (len > 0) {
            const last = this.nodes[len - 1];
            if (((pos - last.pos) as Vector).Length2D() < 55 && last.expireTime - now > duration - 0.35) {
                return;
            }
        }
        if (len >= 120) {
            this.nodes.shift();
        }
        this.nodes.push({ pos, expireTime: now + duration });
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull()) return;

        const now = GameRules.GetGameTime();
        const aliveRibbons: TrailRibbon[] = [];
        for (const r of this.ribbons) {
            if (now >= r.expireTime) {
                ParticleManager.DestroyParticle(r.pfx, false);
                ParticleManager.ReleaseParticleIndex(r.pfx);
            } else {
                aliveRibbons.push(r);
            }
        }
        this.ribbons = aliveRibbons;

        const aliveNodes: TrailNode[] = [];
        for (const node of this.nodes) {
            if (now < node.expireTime) {
                aliveNodes.push(node);
            }
        }
        this.nodes = aliveNodes;

        if (this.nodes.length === 0 && this.ribbons.length === 0) {
            this.Destroy();
            return;
        }

        const qAb = findMirrorQAbility(parent);
        if (!qAb || qAb.IsNull()) return;

        if (parent.IsAlive()) {
            const pPos = parent.GetAbsOrigin();
            for (const node of this.nodes) {
                if (((pPos - node.pos) as Vector).Length2D() <= this.pathRadius) {
                    const phase = parent.AddNewModifier(parent, qAb, "modifier_evo_spectre_mirror_q_phase", {
                        duration: Math.max(0.4, this.gracePeriod),
                    });
                    if (phase && !phase.IsNull()) {
                        phase.SetStackCount(Math.round(qAb.GetSpecialValueFor("trail_reflect_pct")));
                    }
                    break;
                }
            }
        }

        this.dotAccum += 0.15;
        const doDot = getSpectreTier(parent) >= 4 && this.dotAccum >= 0.5;
        if (doDot) {
            this.dotAccum -= 0.5;
        }
        const halfDps = doDot
            ? (qAb.GetSpecialValueFor("rift_dps") + (getSpectreInt(parent) * qAb.GetSpecialValueFor("rift_int_pct")) / 100) *
              0.5
            : 0;
        const seenEnemies = new Set<EntityIndex>();

        for (const node of this.nodes) {
            for (const enemy of findSpectreEnemies(parent, node.pos, this.pathRadius)) {
                if (!enemy || enemy.IsNull() || !enemy.IsAlive() || enemy.IsBuilding()) continue;
                const idx = enemy.GetEntityIndex();
                if (seenEnemies.has(idx)) continue;
                seenEnemies.add(idx);
                const slow = enemy.FindModifierByName("modifier_evo_spectre_mirror_q_slow");
                if (!slow || slow.GetRemainingTime() < 0.35) {
                    enemy.AddNewModifier(parent, qAb, "modifier_evo_spectre_mirror_q_slow", { duration: 0.35 });
                }
                if (halfDps > 0) {
                    ApplyDamage({
                        victim: enemy,
                        attacker: parent,
                        ability: qAb,
                        damage: halfDps,
                        damage_type: DamageTypes.MAGICAL,
                    });
                }
            }
        }
    }
}

@registerModifier("modifier_evo_spectre_mirror_q_hero_trail")
export class modifier_evo_spectre_mirror_q_hero_trail extends BaseModifier {
    private lastPos = Vector(0, 0, 0);

    IsHidden(): boolean {
        return true;
    }
    IsDebuff(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return true;
    }
    OnCreated(): void {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        this.lastPos = parent && !parent.IsNull() ? GetGroundPosition(parent.GetAbsOrigin(), parent) : Vector(0, 0, 0);
        if (!IsServer()) return;
        if (parent && !parent.IsNull() && ab && !ab.IsNull()) {
            const heroDur = Math.max(1.0, ab.GetSpecialValueFor("hero_path_duration"));
            const pfx = ParticleManager.CreateParticle(
                "particles/units/heroes/hero_spectre/spectre_shadow_path_owner.vpcf",
                ParticleAttachment.ABSORIGIN_FOLLOW,
                parent
            );
            ParticleManager.SetParticleControl(pfx, 5, Vector(heroDur, 0, 0));
            ParticleManager.SetParticleControl(pfx, 6, Vector(1, 0, 0));
            this.AddParticle(pfx, false, false, -1, false, false);
        }
        this.StartIntervalThink(0.15);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !parent.IsAlive() || !caster || caster.IsNull() || !ab || ab.IsNull()) return;
        const cur = GetGroundPosition(parent.GetAbsOrigin(), parent);
        if (((cur - this.lastPos) as Vector).Length2D() >= 65) {
            this.lastPos = cur;
            const ctrl = getTrailController(caster, ab);
            if (ctrl) {
                ctrl.pushNode(cur, ab.GetSpecialValueFor("dagger_path_duration"));
            }
        }
    }
}

@registerModifier("modifier_evo_spectre_mirror_q_phase")
export class modifier_evo_spectre_mirror_q_phase extends BaseModifier {
    private msPct = 14;
    private reflectBonus = 10;

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
        return "evo_spectre_mirror_q";
    }
    OnCreated(): void {
        this.msPct = 14;
        this.reflectBonus = 10;
        const ab = this.GetAbility();
        if (ab && !ab.IsNull()) {
            const ms = ab.GetSpecialValueFor("bonus_movespeed");
            const rb = ab.GetSpecialValueFor("trail_reflect_pct");
            if (ms > 0) this.msPct = ms;
            if (rb > 0) this.reflectBonus = rb;
        }
        if (IsServer()) {
            this.SetStackCount(Math.round(this.reflectBonus));
        }
    }
    OnRefresh(): void {
        this.OnCreated();
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY")]: true,
            [dotaModifierState("MODIFIER_STATE_NO_UNIT_COLLISION")]: true,
        };
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return this.msPct;
    }
}
