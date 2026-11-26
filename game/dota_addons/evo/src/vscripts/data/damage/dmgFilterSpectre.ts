import { DamageFilterModule } from "./damage_filter_types";

export const DMG_FILTER_SPECTRE: DamageFilterModule = {
    rules: {
        spectre_spectral_dagger: {
            mode: "MULTIPLIER",
            multiplier: 1,
            creepMultiplier: 1.4,
        },
    },
};
