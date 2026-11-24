import { BodyDefinition } from "./data_schemas";
import { EVO_STARTER_BODIES } from "./branches/starter";
import { EVO_BRANCH_BRISTLE_BODIES } from "./branches/bristle";
import { EVO_BRANCH_MORPH_BODIES } from "./branches/morph";
import { EVO_BRANCH_NYX_BODIES } from "./branches/nyx";
import { EVO_BRANCH_SLARK_BODIES } from "./branches/slark";

export const EVO_DEFAULT_START_BODY_ID = "evo_body_t1_amoeba";

export const EVO_BODIES_CATALOG: readonly BodyDefinition[] = [
    ...EVO_STARTER_BODIES,
    ...EVO_BRANCH_BRISTLE_BODIES,
    ...EVO_BRANCH_MORPH_BODIES,
    ...EVO_BRANCH_NYX_BODIES,
    ...EVO_BRANCH_SLARK_BODIES,
];

export function getBodyDefinition(bodyId: string): BodyDefinition | undefined {
    for (const body of EVO_BODIES_CATALOG) {
        if (body.id === bodyId) {
            return body;
        }
    }
    return undefined;
}

export function getBodiesForTier(tierIndex: number): BodyDefinition[] {
    return EVO_BODIES_CATALOG.filter((body) => body.tierIndex === tierIndex);
}
