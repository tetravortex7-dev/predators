(() => {
    function getHudRoot(): Panel | null {
        let current: Panel | null = $.GetContextPanel();
        while (current && current.GetParent()) {
            current = current.GetParent();
        }
        return current;
    }

    let currentScoreLabel: LabelPanel | null = null;
    let targetScoreLabel: LabelPanel | null = null;
    let escalationLabel: LabelPanel | null = null;
    let mounted = false;

    let cachedScore = 0;
    let cachedTarget = 1000;
    let cachedEscalation = 1.0;

    function applyValues(): void {
        if (currentScoreLabel && currentScoreLabel.IsValid()) {
            currentScoreLabel.text = String(cachedScore);
        }
        if (targetScoreLabel && targetScoreLabel.IsValid()) {
            targetScoreLabel.text = String(cachedTarget);
        }
        if (escalationLabel && escalationLabel.IsValid()) {
            const active = cachedEscalation > 1.05;
            escalationLabel.visible = active;
            if (active) {
                escalationLabel.text = ` x${cachedEscalation.toFixed(1)}`;
            }
        }
    }

    function tryMountIntoQuickStats(): void {
        if (mounted && currentScoreLabel && currentScoreLabel.IsValid()) {
            return;
        }

        const root = getHudRoot();
        if (!root) {
            $.Schedule(0.25, tryMountIntoQuickStats);
            return;
        }

        const quickStats = root.FindChildTraverse("quickstats");
        const headerCol = quickStats?.FindChildTraverse("HeaderColumn") ?? null;
        const currentCol = quickStats?.FindChildTraverse("CurrentStatColumn") ?? null;

        if (!headerCol || !currentCol) {
            $.Schedule(0.25, tryMountIntoQuickStats);
            return;
        }

        const oldHeader = headerCol.FindChild("EvoQuickScoreHeader");
        if (oldHeader) oldHeader.DeleteAsync(0);
        const oldRow = currentCol.FindChild("EvoQuickScoreRow");
        if (oldRow) oldRow.DeleteAsync(0);

        const headerLabel = $.CreatePanel("Label", headerCol, "EvoQuickScoreHeader") as LabelPanel;
        headerLabel.AddClass("QuickStatLabel");
        headerLabel.AddClass("QuickStatLabelHeader");
        headerLabel.text = $.Localize("#evo_hud_score_short");

        const valueRow = $.CreatePanel("Panel", currentCol, "EvoQuickScoreRow");
        valueRow.AddClass("QuickStatContainerMargin");
        valueRow.style.flowChildren = "right";

        currentScoreLabel = $.CreatePanel("Label", valueRow, "EvoScoreCurrent") as LabelPanel;
        currentScoreLabel.AddClass("QuickStatValue");
        currentScoreLabel.text = "0";

        const slash = $.CreatePanel("Label", valueRow, "EvoScoreSlash") as LabelPanel;
        slash.AddClass("SlashLabel");
        slash.text = "/";

        targetScoreLabel = $.CreatePanel("Label", valueRow, "EvoScoreTarget") as LabelPanel;
        targetScoreLabel.AddClass("QuickStatValue");
        targetScoreLabel.style.marginLeft = "2px";
        targetScoreLabel.text = "1000";

        escalationLabel = $.CreatePanel("Label", valueRow, "EvoScoreEsc") as LabelPanel;
        escalationLabel.AddClass("QuickStatValue");
        escalationLabel.style.marginLeft = "4px";
        escalationLabel.style.color = "#c9b074";
        escalationLabel.visible = false;
        escalationLabel.text = "";

        mounted = true;
        applyValues();
    }

    function onScoresUpdate(scoresData: EvoScoresNetPayload | null | undefined): void {
        if (!scoresData) return;
        cachedTarget = Math.max(1, scoresData.target_score ?? 1000);
        cachedEscalation = scoresData.escalation_mult ?? cachedEscalation;

        const localTeam = Players.GetTeam(Players.GetLocalPlayer());
        const rawTeams = scoresData.teams ?? {};
        const teamEntry = rawTeams[String(localTeam)];
        cachedScore = teamEntry ? teamEntry.score : 0;

        applyValues();
    }

    CustomNetTables.SubscribeNetTableListener("match_state", (_table, key, data) => {
        if (key === "scores") {
            onScoresUpdate(data as unknown as EvoScoresNetPayload);
        } else if (key === "state") {
            const state = data as unknown as EvoMatchStateNetPayload | null | undefined;
            if (state && state.escalation_mult !== undefined) {
                cachedEscalation = state.escalation_mult;
                applyValues();
            }
        }
    });

    const initialState = CustomNetTables.GetTableValue("match_state", "state");
    if (initialState && initialState.escalation_mult !== undefined) {
        cachedEscalation = initialState.escalation_mult;
    }
    onScoresUpdate(CustomNetTables.GetTableValue("match_state", "scores"));
    tryMountIntoQuickStats();
})();
