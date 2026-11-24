import { BaseItem, registerItem } from "../lib/dota_ts_adapter";
import { getBossDefinitionByCoreItem } from "../data/bosses_catalog";

class EvoBossCoreItemBase extends BaseItem {
    public OnSpellStart(): void {
        if (!IsServer()) return;

        const caster = this.GetCaster();
        if (!caster || caster.IsNull() || !IsValidEntity(caster) || !caster.IsRealHero()) return;

        const itemName = this.GetAbilityName();
        const bossDef = getBossDefinitionByCoreItem(itemName);
        if (!bossDef) return;

        const playerId = caster.GetPlayerOwnerID();
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const grantedName = bossDef.grantedAbilityName;
        const existing = caster.FindAbilityByName(grantedName);
        if (existing) {
            const maxLevel = existing.GetMaxLevel();
            if (existing.GetLevel() < maxLevel) {
                existing.SetLevel(existing.GetLevel() + 1);
            }
        } else {
            const added = caster.AddAbility(grantedName);
            if (added !== undefined) {
                added.SetLevel(1);
                PrecacheUnitByNameAsync(bossDef.ownerHeroName, () => {}, playerId);
            }
        }

        EmitSoundOn("Hero_Omniknight.GuardianAngel.Cast", caster);
        if (IsInToolsMode()) {
            GameRules.SendCustomMessage(`[Evo] Boss Core assimilated: ${grantedName}`, 0, 0);
        }

        caster.RemoveItem(this);
    }
}

@registerItem("item_evo_boss_core_alpha")
export class item_evo_boss_core_alpha extends EvoBossCoreItemBase {}

@registerItem("item_evo_boss_core_beta")
export class item_evo_boss_core_beta extends EvoBossCoreItemBase {}
