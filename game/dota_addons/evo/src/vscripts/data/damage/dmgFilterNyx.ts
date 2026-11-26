import { DamageFilterModule } from "./damage_filter_types";
import { isEvoCreepUnit } from "../../lib/unit_helpers";

export const DMG_FILTER_NYX: DamageFilterModule = {
    rules: {
        nyx_assassin_impale: {
            mode: "MULTIPLIER",
            multiplier: 1,
            creepMultiplier: 1.5,
        },
        lion_impale: {
            mode: "FLAT_STAT",
            stat: "INT",
            statRatio: [0.5, 0.62, 0.75, 0.87, 1.0],
            creepMultiplier: 1.3,
            customModify: (ctx) => {
                const tierMod = ctx.attacker.FindModifierByName("modifier_evo_hero_tier");
                const tier = tierMod ? tierMod.GetStackCount() : 2;
                if (tier < 3) return undefined;
                const maxMana = ctx.victim.GetMaxMana();
                if (maxMana <= 0) return undefined;
                const missingMana = Math.max(0, maxMana - ctx.victim.GetMana());
                if (missingMana <= 0) return undefined;
                const pct = tier >= 4 ? 0.55 : 0.35;
                let bonus = missingMana * pct;
                if (isEvoCreepUnit(ctx.victim)) {
                    const cap = tier >= 4 ? 250 : 150;
                    bonus = Math.min(cap, bonus) / 1.3;
                }
                return { rawBonus: bonus };
            },
        },
        evo_nyx_scarab_r: {
            mode: "FLAT_STAT",
            stat: "STR",
            statRatio: [0.35, 0.45, 0.55],
        },
        evo_nyx_mantis_r: {
            mode: "FLAT_STAT",
            stat: "AGI",
            statRatio: [0.18, 0.24, 0.3],
        },
        evo_nyx_cicada_e: {
            mode: "FLAT_STAT",
            stat: "ALL",
            statRatio: [0.08, 0.09, 0.1, 0.11, 0.12],
        },
        evo_nyx_cicada_r: {
            mode: "FLAT_STAT",
            stat: "ALL",
            statRatio: [0.18, 0.22, 0.26],
        },
    },
};
