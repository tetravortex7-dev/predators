"use strict";
(() => {
    function getHudRoot() {
        let current = $.GetContextPanel();
        while (current && current.GetParent()) {
            current = current.GetParent();
        }
        return current;
    }
    const displayNameByPlayer = {};
    function refreshSelectedUnitName() {
        const root = getHudRoot();
        if (!root)
            return;
        const label = root.FindChildTraverse("UnitNameLabel");
        if (!label)
            return;
        const selected = Players.GetLocalPlayerPortraitUnit();
        if (selected === -1)
            return;
        const ownerId = Entities.GetPlayerOwnerID(selected);
        const customName = displayNameByPlayer[String(ownerId)];
        if (customName && customName.length > 0 && Entities.IsRealHero(selected)) {
            if (label.text !== customName) {
                label.text = customName;
            }
        }
    }
    function syncPlayerName(key, data) {
        if (!data)
            return;
        const name = data.display_name;
        if (typeof name === "string" && name.length > 0) {
            displayNameByPlayer[key] = name;
            refreshSelectedUnitName();
        }
    }
    CustomNetTables.SubscribeNetTableListener("player_evo", (_table, key, data) => {
        syncPlayerName(String(key), data);
    });
    const allExisting = CustomNetTables.GetAllTableValues("player_evo");
    if (allExisting) {
        for (const entry of allExisting) {
            syncPlayerName(String(entry.key), entry.value);
        }
    }
    GameEvents.Subscribe("dota_player_update_selected_unit", () => refreshSelectedUnitName());
    GameEvents.Subscribe("dota_player_update_query_unit", () => refreshSelectedUnitName());
    function periodicSync() {
        refreshSelectedUnitName();
        $.Schedule(0.25, periodicSync);
    }
    periodicSync();
})();
