import { HeroAppearancePreset } from "../lib/HeroAppearance";

export type CreatureDiet = "CARNIVORE" | "HERBIVORE" | "HYBRID";
export type TierIndex = number;
export type PrimaryAttribute = "STR" | "AGI" | "INT" | "ALL";

export type MutationSlotType = "ACTIVE_UPGRADE" | "PASSIVE_SLOT_1" | "PASSIVE_SLOT_2";
export type MutationTriggerType = "PASSIVE" | "HP_BELOW_PERCENT" | "ON_KILL" | "ON_DAMAGE_TAKEN" | "INTERVAL";

export type ItemCategory = "OFFENSE" | "DEFENSE" | "MOBILITY" | "UTILITY" | "HYBRID";

export interface EvolutionTierConfig {
    readonly tierIndex: TierIndex;
    readonly label: string;
    readonly requiredHeroLevel: number;
    readonly requiredEvoPoints: number;
    readonly unlockTimeSeconds?: number;
    readonly statMultiplier: number;
    readonly spellShopSlots: number;
    readonly offerBasicCount: number;
    readonly offerUltimateCount: number;
}

export interface BodyDefinition {
    readonly id: string;
    readonly tierIndex: TierIndex;
    readonly diet: CreatureDiet;
    readonly tags: readonly string[];
    readonly spellPoolTags: readonly string[];
    readonly spellShopSlots?: number;
    readonly model: string;
    readonly modelScale: number;
    readonly heroClass?: string;
    readonly keepDefaultHeroAbilities?: boolean;
    readonly nextBodyIds?: readonly string[];
    readonly appearance?: HeroAppearancePreset;
    readonly primaryAttribute: PrimaryAttribute;
    readonly baseStr: number;
    readonly baseAgi: number;
    readonly baseInt: number;
    readonly strGain: number;
    readonly agiGain: number;
    readonly intGain: number;
    readonly baseMoveSpeed: number;
    readonly baseAttackDamageMin: number;
    readonly baseAttackDamageMax: number;
    readonly baseAttackRange: number;
    readonly baseArmor: number;
    readonly innateAbility: string;
    readonly signatureAbility: string;
    readonly kitAbilities?: readonly string[];
    readonly kitAbilityLevel?: number;
}

export interface SpellPoolEntry {
    readonly abilityName: string;
    readonly ownerHeroName?: string;
    readonly tags: readonly string[];
    readonly diet?: CreatureDiet;
    readonly minTierIndex: TierIndex;
    readonly maxTierIndex?: TierIndex;
    readonly isUltimate: boolean;
    readonly pointCost: number;
    readonly weight: number;
}

export interface MutationDefinition {
    readonly id: string;
    readonly slotType: MutationSlotType;
    readonly triggerType: MutationTriggerType;
    readonly modifierName: string;
    readonly bonusDamage?: number;
    readonly bonusArmor?: number;
    readonly bonusMoveSpeed?: number;
    readonly bonusAttackSpeed?: number;
    readonly bonusHealth?: number;
    readonly cooldown?: number;
    readonly thresholdPercent?: number;
    readonly intervalSeconds?: number;
    readonly targetAbilityIndex?: number;
}

export interface ItemDefinition {
    readonly id: string;
    readonly kvItemName: string;
    readonly category: ItemCategory;
    readonly goldCost: number;
    readonly isAnchor: boolean;
}

export interface PotionDefinition {
    readonly id: string;
    readonly kvItemName: string;
    readonly goldCost: number;
    readonly maxBackpackStacks: number;
    readonly durationSeconds: number;
    readonly hpPerSecond: number;
    readonly mpPerSecond: number;
}

export interface FortificationBonusOption {
    readonly id: string;
    readonly statKey: "str" | "agi" | "int" | "armor" | "hp" | "mana" | "move_speed" | "attack_speed" | "damage";
    readonly value: number;
}

export interface BossCoreDefinition {
    readonly id: string;
    readonly bossId: string;
    readonly kvItemName: string;
    readonly grantedAbilityName: string;
    readonly destroyScoreBonus: number;
}
