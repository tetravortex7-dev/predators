import { DamageFilterModule } from "./damage_filter_types";

const DAGGER_AGI_RATIO: readonly number[] = [0.55, 0.65, 0.75, 0.85, 0.95];

export const DMG_FILTER_SPECTRE: DamageFilterModule = {
    rules: {
        spectre_spectral_dagger: {
            mode: "MULTIPLIER",
            multiplier: 1,
            creepMultiplier: 1.4,
            customModify: (ctx) => {
                if (!ctx.attacker.IsRealHero()) return undefined;
                if (!ctx.attacker.HasAbility("evo_spectre_phantom_w")) return undefined;
                const agi = (ctx.attacker as CDOTA_BaseNPC_Hero).GetAgility();
                const idx = Math.max(0, Math.min(DAGGER_AGI_RATIO.length - 1, ctx.level - 1));
                const ratio = DAGGER_AGI_RATIO[idx] ?? 0.55;
                if (agi <= 0 || ratio <= 0) return undefined;
                return { rawBonus: agi * ratio };
            },
        },
    },
};
