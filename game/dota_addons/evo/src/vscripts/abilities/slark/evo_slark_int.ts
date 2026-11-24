import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    dotaModifierState,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/slark/evo_slark_int";

const SLARK_INT_MODS: readonly string[] = [
    "modifier_evo_slark_int_q_root",
    "modifier_evo_slark_int_q_mr",
    "modifier_evo_slark_int_w_slow",
    "modifier_evo_slark_int_w_wake",
    "modifier_evo_slark_int_e_passive",
    "modifier_evo_slark_int_e_lantern",
    "modifier_evo_slark_int_e_slow",
    "modifier_evo_slark_int_r_thinker",
    "modifier_evo_slark_int_r_ally",
    "modifier_evo_slark_int_r_enemy",
];

if (IsServer()) {
    for (const modName of SLARK_INT_MODS) {
        LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

@registerAbility("evo_slark_int_q")
export class evo_slark_int_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const pos = this.GetCursorPosition();
        const level = this.GetLevel();
        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const intPct = this.GetSpecialValueFor("int_pct") / 100;
        const rootDur = this.GetSpecialValueFor("root_duration");
        const intVal = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
        const totalDmg = baseDmg + intVal * intPct;

        caster.EmitSound("Hero_NagaSiren.Ensnare.Cast");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_slardar/slardar_crush.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, pos);
        ParticleManager.SetParticleControl(pfx, 1, Vector(radius, radius, radius));
        ParticleManager.ReleaseParticleIndex(pfx);

        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            pos,
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
            if (level >= 2) {
                enemy.AddNewModifier(caster, this, "modifier_evo_slark_int_q_mr", { duration: 4.0 });
            }
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: totalDmg,
                damage_type: DamageTypes.MAGICAL,
            });
            enemy.AddNewModifier(caster, this, "modifier_evo_slark_int_q_root", { duration: rootDur });
            if (level >= 3) {
                const toCenter = Vector(pos.x - enemy.GetAbsOrigin().x, pos.y - enemy.GetAbsOrigin().y, 0);
                const d = toCenter.Length2D();
                if (d > 60) {
                    const dir = toCenter.Normalized();
                    const pulled = Vector(
                        enemy.GetAbsOrigin().x + dir.x * (d * 0.65),
                        enemy.GetAbsOrigin().y + dir.y * (d * 0.65),
                        enemy.GetAbsOrigin().z
                    );
                    FindClearSpaceForUnit(enemy, pulled, true);
                }
                enemy.AddNewModifier(caster, this, "modifier_silence", { duration: 1.5 });
            }
        }
    }
}

@registerModifier("modifier_evo_slark_int_q_root")
export class modifier_evo_slark_int_q_root extends BaseModifier {
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
        return "naga_siren_ensnare";
    }
    CheckState(): Partial<Record<ModifierState, boolean>> {
        return {
            [dotaModifierState("MODIFIER_STATE_ROOTED")]: true,
        };
    }
}

@registerModifier("modifier_evo_slark_int_q_mr")
export class modifier_evo_slark_int_q_mr extends BaseModifier {
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
        return "naga_siren_ensnare";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")];
    }
    GetModifierMagicalResistanceBonus(): number {
        return -15;
    }
}

@registerAbility("evo_slark_int_w")
export class evo_slark_int_w extends BaseAbility {
    private hitHeroThisCast = false;

    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        this.hitHeroThisCast = false;
        const origin = caster.GetAbsOrigin();
        const cursor = this.GetCursorPosition();
        const delta = Vector(cursor.x - origin.x, cursor.y - origin.y, 0);
        const dir = delta.Length2D() > 1 ? delta.Normalized() : caster.GetForwardVector();
        const range = this.GetSpecialValueFor("range");

        caster.EmitSound("Hero_Tidehunter.Gush.Cast");
        ProjectileManager.CreateLinearProjectile({
            Ability: this,
            EffectName: "particles/units/heroes/hero_tidehunter/tidehunter_gush_upgrade.vpcf",
            vSpawnOrigin: origin,
            fDistance: range,
            fStartRadius: 165,
            fEndRadius: 215,
            Source: caster,
            vVelocity: Vector(dir.x * 1350, dir.y * 1350, 0),
            iUnitTargetTeam: UnitTargetTeam.ENEMY,
            iUnitTargetType: (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            iUnitTargetFlags: UnitTargetFlags.NONE,
        });

        if (this.GetLevel() >= 3) {
            for (let step = 1; step <= 3; step++) {
                const wakePos = Vector(
                    origin.x + dir.x * (range * step * 0.28),
                    origin.y + dir.y * (range * step * 0.28),
                    origin.z
                );
                CreateModifierThinker(
                    caster,
                    this,
                    "modifier_evo_slark_int_w_wake",
                    { duration: 4.0 },
                    wakePos,
                    caster.GetTeamNumber(),
                    false
                );
            }
        }
    }
    OnProjectileHit(target: CDOTA_BaseNPC | undefined): boolean | void {
        if (!IsServer() || !target || target.IsNull() || !IsValidEntity(target) || !target.IsAlive()) return false;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return false;

        const baseDmg = this.GetSpecialValueFor("base_damage");
        const intPct = this.GetSpecialValueFor("int_pct") / 100;
        const intVal = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;

        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: baseDmg + intVal * intPct,
            damage_type: DamageTypes.MAGICAL,
        });
        target.AddNewModifier(caster, this, "modifier_evo_slark_int_w_slow", { duration: 3.0 });

        if (this.GetLevel() >= 2 && target.IsHero() && !this.hitHeroThisCast) {
            this.hitHeroThisCast = true;
            caster.GiveMana(caster.GetMaxMana() * 0.12);
            const q = caster.FindAbilityByName("evo_slark_int_q");
            if (q && !q.IsNull()) {
                const rem = q.GetCooldownTimeRemaining();
                if (rem > 0) {
                    q.EndCooldown();
                    if (rem > 2.0) {
                        q.StartCooldown(rem - 2.0);
                    }
                }
            }
        }
        return false;
    }
}

@registerModifier("modifier_evo_slark_int_w_slow")
export class modifier_evo_slark_int_w_slow extends BaseModifier {
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
        return "tidehunter_gush";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE")];
    }
    GetModifierMoveSpeedBonus_Percentage(): number {
        return -25;
    }
}

@registerModifier("modifier_evo_slark_int_w_wake")
export class modifier_evo_slark_int_w_wake extends BaseModifier {
    IsHidden(): boolean {
        return true;
    }
    IsPurgable(): boolean {
        return false;
    }
    OnCreated(): void {
        if (!IsServer()) return;
        this.StartIntervalThink(0.5);
    }
    OnIntervalThink(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!caster || caster.IsNull() || !parent || parent.IsNull() || !ab) return;

        const intVal = caster.IsRealHero() ? (caster as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
        const tickDmg = (65 + intVal * 0.35) * 0.5;
        const enemies = FindUnitsInRadius(
            caster.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            210,
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
                ability: ab,
                damage: tickDmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }
    }
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
