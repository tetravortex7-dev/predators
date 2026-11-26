"use strict";
(() => {
    const button = $("#EvoFountainTeleportBtn");
    let latestMap = null;
    function updateVisibility() {
        if (!button)
            return;
        const localPlayer = Players.GetLocalPlayer();
        const entry = latestMap ? latestMap[String(localPlayer)] : undefined;
        const heroEnt = Players.GetPlayerHeroEntityIndex(localPlayer);
        const heroAlive = heroEnt !== -1 && Entities.IsAlive(heroEnt);
        const show = (entry === null || entry === void 0 ? void 0 : entry.on_fountain) === true && heroAlive;
        button.SetHasClass("Visible", show);
    }
    if (button) {
        button.SetPanelEvent("onactivate", () => {
            GameEvents.SendCustomGameEventToServer("evo_fountain_teleport", {});
        });
        button.SetPanelEvent("onmouseover", () => {
            if (!button.IsValid())
                return;
            const title = $.Localize("#evo_fountain_teleport_tooltip_title");
            const body = $.Localize("#evo_fountain_teleport_tooltip_body");
            $.DispatchEvent("DOTAShowTitleTextTooltip", button, title, body);
        });
        button.SetPanelEvent("onmouseout", () => {
            if (!button.IsValid())
                return;
            $.DispatchEvent("DOTAHideTitleTextTooltip", button);
        });
    }
    CustomNetTables.SubscribeNetTableListener("match_state", (_table, key, data) => {
        if (key === "fountains") {
            latestMap = data;
            updateVisibility();
        }
    });
    latestMap = CustomNetTables.GetTableValue("match_state", "fountains");
    updateVisibility();
})();
