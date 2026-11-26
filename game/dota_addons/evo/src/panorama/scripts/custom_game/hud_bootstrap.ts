(() => {
    function getHudRoot(): Panel | null {
        let current: Panel | null = $.GetContextPanel();
        while (current && current.GetParent()) {
            current = current.GetParent();
        }
        return current;
    }

    const displayNameByPlayer: Record<string, string> = {};

    function refreshSelectedUnitName(): void {
        const root = getHudRoot();
        if (!root) return;

        const label = root.FindChildTraverse("UnitNameLabel") as LabelPanel | null;
        if (!label) return;

        const selected = Players.GetLocalPlayerPortraitUnit();
        if (selected === -1) return;

        const ownerId = Entities.GetPlayerOwnerID(selected);
        const customName = displayNameByPlayer[String(ownerId)];
        if (customName && customName.length > 0 && Entities.IsRealHero(selected)) {
            if (label.text !== customName) {
                label.text = customName;
            }
        }
    }

    function syncPlayerName(key: string, data: Record<string, unknown> | null | undefined): void {
        if (!data) return;
        const name = data.display_name;
        if (typeof name === "string" && name.length > 0) {
            displayNameByPlayer[key] = name;
            refreshSelectedUnitName();
        }
    }

    CustomNetTables.SubscribeNetTableListener("player_evo", (_table, key, data) => {
        syncPlayerName(String(key), data as unknown as Record<string, unknown>);
    });

    const allExisting = CustomNetTables.GetAllTableValues("player_evo");
    if (allExisting) {
        for (const entry of allExisting) {
            syncPlayerName(String(entry.key), entry.value as unknown as Record<string, unknown>);
        }
    }

    GameEvents.Subscribe("dota_player_update_selected_unit", () => refreshSelectedUnitName());
    GameEvents.Subscribe("dota_player_update_query_unit", () => refreshSelectedUnitName());
    GameEvents.Subscribe("evo_focus_camera" as never, (rawEvent: unknown) => {
        const ev = rawEvent as { x?: number; y?: number; z?: number; entindex?: EntityIndex } | null;
        if (!ev) return;
        if (ev.x !== undefined && ev.y !== undefined && ev.z !== undefined) {
            GameUI.SetCameraTargetPosition([ev.x, ev.y, ev.z], 0.05);
        }
        if (ev.entindex !== undefined) {
            GameUI.MoveCameraToEntity(ev.entindex);
        }
    });

    function periodicSync(): void {
        refreshSelectedUnitName();
        $.Schedule(0.25, periodicSync);
    }
    periodicSync();
})();
