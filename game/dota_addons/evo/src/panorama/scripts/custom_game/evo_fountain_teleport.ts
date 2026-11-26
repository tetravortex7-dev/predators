(() => {
    const button = $("#EvoFountainTeleportBtn") as Button | null;
    let latestMap: Record<string, EvoFountainPlayerState> | null = null;

    function updateVisibility(): void {
        if (!button) return;
        const localPlayer = Players.GetLocalPlayer();
        const entry = latestMap ? latestMap[String(localPlayer)] : undefined;
        const heroEnt = Players.GetPlayerHeroEntityIndex(localPlayer);
        const heroAlive = heroEnt !== -1 && Entities.IsAlive(heroEnt);
        const show = entry?.on_fountain === true && heroAlive;
        button.SetHasClass("Visible", show);
    }

    if (button) {
        button.SetPanelEvent("onactivate", () => {
            GameEvents.SendCustomGameEventToServer("evo_fountain_teleport" as never, {} as never);
        });
        button.SetPanelEvent("onmouseover", () => {
            if (!button.IsValid()) return;
            const title = $.Localize("#evo_fountain_teleport_tooltip_title");
            const body = $.Localize("#evo_fountain_teleport_tooltip_body");
            $.DispatchEvent("DOTAShowTitleTextTooltip", button, title, body);
        });
        button.SetPanelEvent("onmouseout", () => {
            if (!button.IsValid()) return;
            $.DispatchEvent("DOTAHideTitleTextTooltip", button);
        });
    }

    CustomNetTables.SubscribeNetTableListener("match_state", (_table, key, data) => {
        if (key === "fountains") {
            latestMap = data as unknown as Record<string, EvoFountainPlayerState>;
            updateVisibility();
        }
    });

    latestMap = CustomNetTables.GetTableValue(
        "match_state",
        "fountains"
    ) as unknown as Record<string, EvoFountainPlayerState> | null;
    updateVisibility();
})();
