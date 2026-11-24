import { EVO_BODIES_CATALOG } from "../data/bodies_catalog";
import { EVO_BOSSES_CATALOG } from "../data/bosses_catalog";

const INITIAL_DELAY_SECONDS = 0.8;
const STEP_INTERVAL_SECONDS = 1.2;

export class LazyPrecacheManager {
    private queue: string[] = [];
    private cursor = 0;

    public init(): void {
        this.queue = this.collectUniqueHeroUnits();
        this.cursor = 0;
        if (this.queue.length === 0) return;

        GameRules.GetGameModeEntity().SetContextThink(
            "EvoLazyPrecacheThink",
            () => this.onThink(),
            INITIAL_DELAY_SECONDS
        );
    }

    private collectUniqueHeroUnits(): string[] {
        const seen = new Set<string>();
        const result: string[] = [];

        for (const body of EVO_BODIES_CATALOG) {
            if (body.tierIndex === 0) continue;
            if (body.heroClass && body.heroClass.length > 0 && !seen.has(body.heroClass)) {
                seen.add(body.heroClass);
                result.push(body.heroClass);
            }
        }

        for (const boss of EVO_BOSSES_CATALOG) {
            if (
                boss.ownerHeroName &&
                boss.ownerHeroName.length > 0 &&
                boss.ownerHeroName !== boss.unitName &&
                !seen.has(boss.ownerHeroName)
            ) {
                seen.add(boss.ownerHeroName);
                result.push(boss.ownerHeroName);
            }
        }

        return result;
    }

    private onThink(): number | undefined {
        if (this.cursor >= this.queue.length) {
            return undefined;
        }
        const unitName = this.queue[this.cursor];
        this.cursor += 1;

        PrecacheUnitByNameAsync(unitName, () => {});

        if (this.cursor >= this.queue.length) {
            return undefined;
        }
        return STEP_INTERVAL_SECONDS;
    }
}
