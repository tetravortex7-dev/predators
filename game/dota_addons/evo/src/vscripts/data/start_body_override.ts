import { EVO_DEFAULT_START_BODY_ID, getBodyDefinition } from "./bodies_catalog";
import { BodyDefinition } from "./data_schemas";
import { EVO_CONSTANTS } from "./game_constants";

export function getInitialStartBody(): BodyDefinition | undefined {
    const overrideId = EVO_CONSTANTS.DEV_START_BODY_ID;
    if (IsInToolsMode() && overrideId.length > 0) {
        const overrideBody = getBodyDefinition(overrideId);
        if (overrideBody) {
            return overrideBody;
        }
    }
    return getBodyDefinition(EVO_DEFAULT_START_BODY_ID);
}
