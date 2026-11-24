import {
    BaseAbility,
    BaseModifier,
    dotaModifierFunction,
    registerAbility,
    registerModifier,
} from "../../lib/dota_ts_adapter";

const SCRIPT_PATH = "abilities/nyx/evo_nyx_archon";

const ARCHON_MODS: readonly string[] = [
    "modifier_evo_nyx_archon_q_echo",
    "modifier_evo_nyx_archon_w_shred",
    "modifier_evo_nyx_archon_e_passive",
    "modifier_evo_nyx_archon_r_ascend",
];

if (IsServer()) {
    for (const modName of ARCHON_MODS) {
        LinkLuaModifier(modName, SCRIPT_PATH, LuaModifierMotionType.NONE);
    }
}

function getInt(unit: CDOTA_BaseNPC): number {
    return unit.IsRealHero() ? (unit as CDOTA_BaseNPC_Hero).GetIntellect(false) : 0;
}

@registerAbility("evo_nyx_archon_q")
export class evo_nyx_archon_q extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const level = this.GetLevel();
        const dmg = this.strikeTarget(caster, target, level, 1.0);

        if (level >= 2) {
            const candidates = FindUnitsInRadius(
                caster.GetTeamNumber(),
                target.GetAbsOrigin(),
                undefined,
                450,
                UnitTargetTeam.ENEMY,
                (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
                UnitTargetFlags.NONE,
                FindOrder.CLOSEST,
                false
            );
            for (const cand of candidates) {
                if (!cand || cand.IsNull() || !IsValidEntity(cand) || !cand.IsAlive() || cand === target) continue;
                this.strikeTarget(caster, cand, level, 0.65);
                break;
            }
        }

        if (level >= 3 && target.IsAlive()) {
            target.AddNewModifier(caster, this, "modifier_evo_nyx_archon_q_echo", {
                duration: 3.0,
                echo_damage: Math.round(dmg * 0.45),
            });
        }
    }

    private strikeTarget(caster: CDOTA_BaseNPC, target: CDOTA_BaseNPC, level: number, mult: number): number {
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const intPct = this.GetSpecialValueFor("int_pct") / 100;
        const burnPct = this.GetSpecialValueFor("mana_burn_pct") / 100;
        const creepMult = this.GetSpecialValueFor("creep_mult");

        target.EmitSound("Hero_NyxAssassin.ManaBurn.Target");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_nyx_assassin/nyx_assassin_mana_burn.vpcf",
            ParticleAttachment.ABSORIGIN_FOLLOW,
            target
        );
        ParticleManager.ReleaseParticleIndex(pfx);

        let burned = 0;
        if (target.GetMaxMana() > 0) {
            const wantBurn = target.GetMaxMana() * burnPct * mult;
            burned = Math.min(target.GetMana(), wantBurn);
            if (burned > 0) {
                target.Script_ReduceMana(burned, this);
            }
        }

        const rawDmg = (baseDmg + getInt(caster) * intPct) * mult + burned;
        const finalDmg = target.IsCreep() ? rawDmg * creepMult : rawDmg;
        if (level >= 2) {
            target.AddNewModifier(caster, this, "modifier_silence", { duration: 1.5 });
        }
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: finalDmg,
            damage_type: DamageTypes.MAGICAL,
        });
        return finalDmg;
    }
}

@registerModifier("modifier_evo_nyx_archon_q_echo")
export class modifier_evo_nyx_archon_q_echo extends BaseModifier {
    private echoDamage = 80;
    private detonated = false;

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
        return "nyx_assassin_mana_burn";
    }
    OnCreated(params: { echo_damage?: number }): void {
        this.echoDamage = params?.echo_damage ?? 80;
        this.detonated = false;
    }
    OnRefresh(params: { echo_damage?: number }): void {
        if (params?.echo_damage !== undefined) {
            this.echoDamage = params.echo_damage;
        }
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED")];
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer() || this.detonated) return;
        const parent = this.GetParent();
        if (!parent || parent.IsNull() || event.unit !== parent) return;
        if (!event.ability || event.ability.IsItem() || event.ability.IsToggle()) return;
        this.detonate();
        this.Destroy();
    }
    OnDestroy(): void {
        if (!IsServer() || this.detonated) return;
        this.detonate();
    }
    private detonate(): void {
        this.detonated = true;
        const parent = this.GetParent();
        const caster = this.GetCaster();
        if (!parent || parent.IsNull() || !IsValidEntity(parent) || !parent.IsAlive()) return;
        if (!caster || caster.IsNull()) return;
        parent.EmitSound("Hero_NyxAssassin.ManaBurn.Target");
        ApplyDamage({
            victim: parent,
            attacker: caster,
            ability: this.GetAbility(),
            damage: this.echoDamage ?? 80,
            damage_type: DamageTypes.MAGICAL,
        });
    }
}

@registerAbility("evo_nyx_archon_w")
export class evo_nyx_archon_w extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster)) return;

        const pos = this.GetCursorPosition();
        const level = this.GetLevel();
        const radius = this.GetSpecialValueFor("radius");
        const baseDmg = this.GetSpecialValueFor("base_damage");
        const intPct = this.GetSpecialValueFor("int_pct") / 100;
        const stunDur = this.GetSpecialValueFor("stun_duration");
        const creepMult = this.GetSpecialValueFor("creep_mult");

        caster.EmitSound("Hero_NyxAssassin.Jolt.Cast");
        const pfx = ParticleManager.CreateParticle(
            "particles/units/heroes/hero_obsidian_destroyer/obsidian_destroyer_sanity_eclipse_area.vpcf",
            ParticleAttachment.WORLDORIGIN,
            undefined
        );
        ParticleManager.SetParticleControl(pfx, 0, pos);
        ParticleManager.SetParticleControl(pfx, 1, Vector(radius, 1, 1));
        ParticleManager.ReleaseParticleIndex(pfx);

        if (level >= 2) {
            AddFOWViewer(caster.GetTeamNumber(), pos, radius + 120, 3.0, false);
        }

        const rawDmg = baseDmg + getInt(caster) * intPct;
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

        let heroesHit = 0;
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            if (enemy.IsHero()) heroesHit += 1;

            if (level >= 2) {
                const toCenter = Vector(pos.x - enemy.GetAbsOrigin().x, pos.y - enemy.GetAbsOrigin().y, 0);
                if (toCenter.Length2D() > 75) {
                    const dir = toCenter.Normalized();
                    const pulled = Vector(
                        enemy.GetAbsOrigin().x + dir.x * Math.min(120, toCenter.Length2D() - 50),
                        enemy.GetAbsOrigin().y + dir.y * Math.min(120, toCenter.Length2D() - 50),
                        enemy.GetAbsOrigin().z
                    );
                    FindClearSpaceForUnit(enemy, pulled, true);
                }
            }

            enemy.AddNewModifier(caster, this, "modifier_evo_nyx_archon_w_shred", { duration: 4.0 });
            enemy.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
            ApplyDamage({
                victim: enemy,
                attacker: caster,
                ability: this,
                damage: enemy.IsCreep() ? rawDmg * creepMult : rawDmg,
                damage_type: DamageTypes.MAGICAL,
            });
        }

        if (level >= 3 && heroesHit > 0) {
            caster.GiveMana(caster.GetMaxMana() * 0.1 * heroesHit);
            const shave = 1.5 * heroesHit;
            for (let i = 0; i < caster.GetAbilityCount(); i++) {
                const ab = caster.GetAbilityByIndex(i);
                if (!ab || ab.IsNull() || ab === this) continue;
                const rem = ab.GetCooldownTimeRemaining();
                if (rem > 0) {
                    ab.EndCooldown();
                    if (rem > shave) {
                        ab.StartCooldown(rem - shave);
                    }
                }
            }
        }
    }
}

@registerModifier("modifier_evo_nyx_archon_w_shred")
export class modifier_evo_nyx_archon_w_shred extends BaseModifier {
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
        return "nyx_assassin_jolt";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [dotaModifierFunction("MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS")];
    }
    GetModifierMagicalResistanceBonus(): number {
        const ab = this.GetAbility();
        return -(ab ? ab.GetSpecialValueFor("mr_shred") : 14);
    }
}

@registerAbility("evo_nyx_archon_e")
export class evo_nyx_archon_e extends BaseAbility {
    GetIntrinsicModifierName(): string {
        return "modifier_evo_nyx_archon_e_passive";
    }
}

@registerModifier("modifier_evo_nyx_archon_e_passive")
export class modifier_evo_nyx_archon_e_passive extends BaseModifier {
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
            dotaModifierFunction("MODIFIER_PROPERTY_STATS_INTELLECT_BONUS"),
            dotaModifierFunction("MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_EVENT_ON_ABILITY_EXECUTED"),
        ];
    }
    GetModifierBonusStats_Intellect(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("bonus_int");
    }
    GetModifierCastRangeBonusStacking(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("cast_range");
    }
    GetModifierSpellAmplify_Percentage(): number {
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || parent.PassivesDisabled()) return 0;
        return ab.GetSpecialValueFor("spell_amp");
    }
    OnAbilityExecuted(event: ModifierAbilityEvent): void {
        if (!IsServer()) return;
        const parent = this.GetParent();
        const ab = this.GetAbility();
        if (!parent || parent.IsNull() || !ab || event.unit !== parent || parent.PassivesDisabled()) return;
        if (!event.ability || event.ability.IsItem() || event.ability.IsToggle()) return;

        const enemies = FindUnitsInRadius(
            parent.GetTeamNumber(),
            parent.GetAbsOrigin(),
            undefined,
            650,
            UnitTargetTeam.ENEMY,
            (UnitTargetType.HERO + UnitTargetType.BASIC) as UnitTargetType,
            UnitTargetFlags.NONE,
            FindOrder.CLOSEST,
            false
        );
        for (const enemy of enemies) {
            if (!enemy || enemy.IsNull() || !IsValidEntity(enemy) || !enemy.IsAlive()) continue;
            const sparkDmg =
                ab.GetSpecialValueFor("spark_damage") +
                getInt(parent) * (ab.GetSpecialValueFor("spark_int_pct") / 100);
            ApplyDamage({
                victim: enemy,
                attacker: parent,
                ability: ab,
                damage: sparkDmg,
                damage_type: DamageTypes.MAGICAL,
            });
            break;
        }
    }
}

@registerAbility("evo_nyx_archon_r")
export class evo_nyx_archon_r extends BaseAbility {
    OnSpellStart(): void {
        if (!IsServer()) return;
        const caster = this.GetCaster();
        const target = this.GetCursorTarget();
        if (!caster || caster.IsNull() || !target || target.IsNull()) return;
        if (target.TriggerSpellAbsorb(this)) return;

        const baseDmg = this.GetSpecialValueFor("base_damage");
        const intPct = this.GetSpecialValueFor("int_pct") / 100;
        const burnPct = this.GetSpecialValueFor("mana_burn_pct") / 100;
        const stunDur = this.GetSpecialValueFor("stun_duration");
        const ascDur = this.GetSpecialValueFor("ascension_duration");

        caster.EmitSound("DOTA_Item.Dagon.Activate");
        target.EmitSound("DOTA_Item.Dagon5.Target");
        const pfx = ParticleManager.CreateParticle(
            "particles/items_fx/dagon.vpcf",
            ParticleAttachment.POINT_FOLLOW,
            caster
        );
        ParticleManager.SetParticleControlEnt(
            pfx,
            0,
            caster,
            ParticleAttachment.POINT_FOLLOW,
            "attach_attack1",
            caster.GetAbsOrigin(),
            true
        );
        ParticleManager.SetParticleControlEnt(
            pfx,
            1,
            target,
            ParticleAttachment.POINT_FOLLOW,
            "attach_hitloc",
            target.GetAbsOrigin(),
            true
        );
        ParticleManager.SetParticleControl(pfx, 2, Vector(800, 0, 0));
        ParticleManager.ReleaseParticleIndex(pfx);

        if (target.GetMaxMana() > 0) {
            target.Script_ReduceMana(target.GetMaxMana() * burnPct, this);
        }
        target.AddNewModifier(caster, this, "modifier_stunned", { duration: stunDur });
        ApplyDamage({
            victim: target,
            attacker: caster,
            ability: this,
            damage: baseDmg + getInt(caster) * intPct,
            damage_type: DamageTypes.MAGICAL,
        });

        caster.AddNewModifier(caster, this, "modifier_evo_nyx_archon_r_ascend", { duration: ascDur });
    }
}

@registerModifier("modifier_evo_nyx_archon_r_ascend")
export class modifier_evo_nyx_archon_r_ascend extends BaseModifier {
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
        return "tinker_laser";
    }
    DeclareFunctions(): ModifierFunction[] {
        return [
            dotaModifierFunction("MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE"),
            dotaModifierFunction("MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING"),
        ];
    }
    GetModifierPercentageCooldown(): number {
        const ab = this.GetAbility();
        return ab ? ab.GetSpecialValueFor("cdr_pct") : 35;
    }
    GetModifierSpellAmplify_Percentage(): number {
        const ab = this.GetAbility();
        return ab ? ab.GetSpecialValueFor("bonus_amp") : 20;
    }
    GetModifierCastRangeBonusStacking(): number {
        return 200;
    }
}
