import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_mantis";

const MANTIS_MODS: readonly string[] = [
    "modifier_evo_nyx_mantis_q_dash",
    "modifier_evo_nyx_mantis_bleed",
    "modifier_evo_nyx_mantis_q_mark",
    "modifier_evo_nyx_mantis_w_mark",
    "modifier_evo_nyx_mantis_e_passive",
];

if (IsServer()) {
    for (const modName of MANTIS_MODS) {
        LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

function getAgi(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetAgility() : 0;
}

function applyLaceration(caster: CDOTA_BaseNPC, target: CDOTA_BaseNPC, ability: CDOTABaseAbility, dps: number, dur: number): void {
    const mod = target.AddNewModifier(caster, ability, "modifier_evo_nyx_mantis_bleed", {
        duration: dur,
        dps,
    });
    if (mod !== undefined) {
        const next = Math.min(4, mod.GetStackCount() + 1);
        mod.SetStackCount(next);
    }
}

@registerAbility("evo_nyx_mantis_q")
export class evo_nyx_mantis_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const range = this.GetSpecialValueFor("range");
        const delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0);
        const dir = delta.Length2D() > 1 ? delta.Normalized() : caster.GetForwardVector();
        const dist = Math.min(range, Math.max(200, delta.Length2D() > 1 ? delta.Length2D() : range));
        const speed = 1900;
        const dur = Math.max(0.12, dist / speed);

        caster.EmitSound("Hero_PhantomAssassin.Strike.End");
        caster.AddNewModifier(caster, this, "modifier_evo_nyx_mantis_q_dash", {
            duration: dur,
            dir_x: dir.x,
            dir_y: dir.y,
            speed,
        });
    }
}

@registerModifier("modifier_evo_nyx_mantis_q_dash")
export class modifier_evo_nyx_mantis_q_dash extends BaseModifier {
    private dirX = 1;
    private dirY = 0;
    private speed = 1900;
    private hitSet: Set<EntityIndex> = new Set();

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
        this.dirX = params?.dir_x ?? 1;
        this.dirY = params?.dir_y ?? 0;
        this.speed = params?.speed ?? 1900;
        this.hitSet = new Set();
        if (!IsServer()) return;
        this.StartIntervalThink(0.03);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive() || !ab) {
            this.Destroy();
            return;
        }

        const pos = parent.GetAbsOrigin();
        const step = this.speed * 0.03;
        const nextPos = Vector(pos.x + this.dirX * step, pos.y + this.dirY * step, pos.z);
        nextPos.z = GetGroundHeight(nextPos, parent);
        parent.SetAbsOrigin(nextPos);

        const level = ab.GetLevel();
        const width = ab.GetSpecialValueFor("width");
        const baseDmg = ab.GetSpecialValueFor("base_damage");
        const agiPct = ab.GetSpecialValueFor("agi_pct") / 100;
        const creepMult = ab.GetSpecialValueFor("creep_mult");
        const bleedDps = ab.GetSpecialValueFor("bleed_dps");
        const bleedDur = ab.GetSpecialValueFor("bleed_duration");
        let dmg = baseDmg + getAgi(parent) * agiPct;

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            nextPos,
            undefined,
            width,
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

            let hitDmg = enemy.IsCreep() ? dmg * creepMult : dmg;
            if (level >= 2 && enemy.GetHealthPercent() <= 50) {
                hitDmg *= 1.5;
                enemy.AddNewModifier(parent, ab, "modifier_stunned", { duration: 0.5 });
            }
            if (level >= 3) {
                enemy.AddNewModifier(parent, ab, "modifier_evo_nyx_mantis_q_mark", { duration: 3.0 });
            }
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: hitDmg,
                damage_type: DamageTypes.PHYSICAL,
            });
            applyLaceration(parent, enemy, ab, bleedDps, bleedDur);
        }
    }
    OnDestroy(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        if (parent && !parent.IsNull() && IsValidEntity(parent)) {
            FindClearSpaceForUnit(parent, parent.GetAbsOrigin(), true);
        }
    }
}

@registerModifier("modifier_evo_nyx_mantis_bleed")
export class modifier_evo_nyx_mantis_bleed extends BaseModifier {
    private dps = 20;

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
        return "bloodseeker_rupture";
    }
    OnCreated(params: { dps?: number }): void {
        this.dps = params?.dps ?? 20;
        if (!IsServer()) return;
        this.StartIntervalThink(1.0);
    }
    OnRefresh(params: { dps?: number }): void {
        if (!IsServer()) return;
        if (params?.dps !== undefined && params.dps > this.dps) {
            this.dps = params.dps;
        }
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (!caster || caster.IsNull()) return;

        const stacks = Math.max(1, this.GetStackCount());
        ApplyDamage({
            victim: parent,
            attacker: caster,
            ability: this.GetAbility(),
            damage: (this.dps ?? 20) * stacks,
            damage_type: DamageTypes.PHYSICAL,
        });
    }
}

@registerModifier("modifier_evo_nyx_mantis_q_mark")
export class modifier_evo_nyx_mantis_q_mark extends BaseModifier {
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
        return "phantom_assassin_phantom_strike";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_DEATH")];
    }
    OnDeath(event: ModifierInstanceEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (!parent || parent.IsNull() || event.unit !== parent || !caster || caster.IsNull()) return;
        const qAb = caster.FindAbilityByName("evo_nyx_mantis_q");
        if (qAb && !qAb.IsNull()) {
            const rem = qAb.GetCooldownTimeRemaining();
            if (rem > 0) {
                qAb.EndCooldown();
                qAb.StartCooldown(rem * 0.3);
            }
        }
    }
}

@registerAbility("evo_nyx_mantis_w")
export class evo_nyx_mantis_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const level = this.GetLevel();
        const chitinMod = caster.FindModifierByName("modifier_evo_nyx_living_chitin");
        const plates = chitinMod ? chitinMod.GetStackCount() : 0;
        if (chitinMod && plates > 0) {
            chitinMod.SetStackCount(0);
        }

        this.performSlash(caster, level, plates, 1.0);
        if (level >= 3) {
            caster.SetContextThink(
                DoUniqueString("evo_nyx_mantis_w_second"),
                () => {
                    if (!caster || caster.IsNull() || !IsValidEntity(caster) || !caster.IsAlive()) return undefined;
                    this.performSlash(caster, level, 0, 0.5);
                    return undefined;
                },
                0.25
            );
        }
    }

    private performSlash(caster: CDOTA_BaseNPC, level: number, plates: number, mult: number): void {
        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const agiPct = this.GetSpecialValueFor("agi_pct") / 100;
        const silenceDur = this.GetSpecialValueFor("silence_duration");
        const burstPerPlate = this.GetSpecialValueFor("burst_per_plate");
        const creepMult = this.GetSpecialValueFor("creep_mult");

        caster.EmitSound("Hero_Riki.TricksOfTheTrade");
        const physDmg = (baseDmg + getAgi(caster) * agiPct) * mult;
        const plateBurst = plates * burstPerPlate;

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
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: enemy.IsCreep() ? physDmg * creepMult : physDmg,
                damage_type: DamageTypes.PHYSICAL,
            });
            if (plateBurst > 0 && enemy.IsAlive()) {
                ApplyDamage({
                    victim: enemy,
                    attacker: caster,
                    ability: this,
                    damage: plateBurst,
                    damage_type: DamageTypes.PURE,
                });
            }
            if (mult === 1.0 && enemy.IsAlive()) {
                enemy.AddNewModifier(caster, this, "modifier_silence", { duration: silenceDur });
                if (level >= 2) {
                    enemy.AddNewModifier(caster, this, "modifier_evo_nyx_mantis_w_mark", { duration: 4.0 });
                }
            }
        }
    }
}

@registerModifier("modifier_evo_nyx_mantis_w_mark")
export class modifier_evo_nyx_mantis_w_mark extends BaseModifier {
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
        return "riki_tricks_of_the_trade";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE"),
        ];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
    GetModifierIncomingDamage_Percentage(): number {
        return 12;
    }
}

@registerAbility("evo_nyx_mantis_e")
export class evo_nyx_mantis_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_mantis_e_passive";
    }
}

@registerModifier("modifier_evo_nyx_mantis_e_passive")
export class modifier_evo_nyx_mantis_e_passive extends BaseModifier {
    private critArmed = false;

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
        this.critArmed = false;
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_AGILITY_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ATTACK_LANDED"),
        ];
    }
    GetModifierBonusStats_Agility(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("bonus_agi");
    }
    GetModifierPreAttack_CriticalStrike(): number {
        if (!IsServer()) return 0;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || parent.PassivesDisabled()) return 0;
        const chance = ab.GetSpecialValueFor("crit_chance");
        if (RollPercentage(chance)) {
            this.critArmed = true;
            return ab.GetSpecialValueFor("crit_mult");
        }
        this.critArmed = false;
        return 0;
    }
    OnAttackLanded(event: ModifierAttackEvent): void {
        if (!IsServer() || !this.critArmed) return;
        this.critArmed = false;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        const target = event.target;
        if (!parent || parent.IsNull() || !ab || event.attacker !== parent) return;
        if (!target || target.IsNull() || !IsValidEntity(target) || target.IsBuilding()) return;
        applyLaceration(parent, target, ab, 28, 4.0);
    }
}
