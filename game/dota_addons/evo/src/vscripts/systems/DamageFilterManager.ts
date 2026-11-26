import { DamageScaleRule, getDamageRule } from "../data/damage_rules";
import { computeModifiedDamage } from "./damage/damage_mitigation";

export type DamageGuardHook = (event: DamageFilterEvent) => boolean;

export class DamageFilterManager {
    private readonly guards: DamageGuardHook[] = [];
    private readonly runtimeRules: Map<string, DamageScaleRule> = new Map();

    public init(): void {
        const gameMode = GameRules.GetGameModeEntity();
        gameMode.SetDamageFilter((event) => this.onDamageFilter(event), this);
    }

    public registerGuard(guard: DamageGuardHook): void {
        this.guards.push(guard);
    }

    public registerRule(inflictorName: string, rule: DamageScaleRule): void {
        this.runtimeRules.set(inflictorName, rule);
    }

    public unregisterRule(inflictorName: string): void {
        this.runtimeRules.delete(inflictorName);
    }

    private resolveInflictor(
        inflictorIndex: EntityIndex | undefined
    ): { inflictor?: CDOTABaseAbility; abilityName?: string; isItem: boolean } {
        if (inflictorIndex === undefined) {
            return { isItem: false };
        }
        const scriptEnt = EntIndexToHScript(inflictorIndex);
        if (!scriptEnt || scriptEnt.IsNull() || !IsValidEntity(scriptEnt)) {
            return { isItem: false };
        }
        const candidate = scriptEnt as unknown as {
            GetAbilityName?: () => string;
            IsItem?: () => boolean;
        };
        if (candidate.GetAbilityName === undefined) {
            return { isItem: false };
        }
        const inflictor = scriptEnt as unknown as CDOTABaseAbility;
        const abilityName = candidate.GetAbilityName();
        const isItem = candidate.IsItem !== undefined ? candidate.IsItem() : false;
        return { inflictor, abilityName, isItem };
    }

    private onDamageFilter(event: DamageFilterEvent): boolean {
        for (const guard of this.guards) {
            if (!guard(event)) {
                return false;
            }
        }

        if (event.entindex_attacker_const === undefined || event.entindex_victim_const === undefined) {
            return true;
        }

        const attacker = EntIndexToHScript(event.entindex_attacker_const);
        const victim = EntIndexToHScript(event.entindex_victim_const);
        if (!attacker || attacker.IsNull() || !IsValidEntity(attacker) || !attacker.IsBaseNPC()) {
            return true;
        }
        if (!victim || victim.IsNull() || !IsValidEntity(victim) || !victim.IsBaseNPC()) {
            return true;
        }

        const { inflictor, abilityName, isItem } = this.resolveInflictor(event.entindex_inflictor_const);
        if (!abilityName) {
            return true;
        }

        const rule = this.runtimeRules.get(abilityName) ?? getDamageRule(abilityName);
        if (!rule) {
            return true;
        }

        const level = inflictor ? Math.max(1, inflictor.GetLevel()) : 1;
        event.damage = computeModifiedDamage(
            {
                attacker,
                victim,
                inflictor,
                abilityName,
                isItem,
                damageType: event.damagetype_const as DamageTypes,
                damage: event.damage,
                level,
            },
            rule
        );

        return true;
    }
}
