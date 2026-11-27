import { DamageFilterModule } from "./damage_filter_types";

const DAGGER_AGI_RATIO: readonly number[] = [0.55, 0.65, 0.75, 0.85, 0.95];
const PHANTOM_W_ABILITIES: readonly string[] = [
    "evo_spectre_phantom_w",
    "evo_spectre_phantom_w_t3",
    "evo_spectre_phantom_w_t4",
];

function hasAnyAbility(unit: CDOTA_BaseNPC, names: readonly string[]): boolean {
    for (const name of names) {
        const ab = unit.FindAbilityByName(name);
        if (ab && !ab.IsNull()) return true;
    }
    return false;
}

export const DMG_FILTER_SPECTRE: DamageFilterModule = {
    rules: {
        spectre_spectral_dagger: {
            mode: "MULTIPLIER",
            multiplier: 1,
            creepMultiplier: 1.4,
            customModify: (ctx) => {
                if (!ctx.attacker.IsRealHero()) return undefined;
                if (!hasAnyAbility(ctx.attacker, PHANTOM_W_ABILITIES)) {
                    return undefined;
                }
                const agi = (ctx.attacker as CDOTA_BaseNPC_Hero).GetAgility();
                const idx = Math.max(0, Math.min(DAGGER_AGI_RATIO.length - 1, ctx.level - 1));
                const ratio = DAGGER_AGI_RATIO[idx] ?? 0.55;
                if (agi <= 0 || ratio <= 0) return undefined;
                return { rawBonus: agi * ratio };
            },
        },
    },
};
