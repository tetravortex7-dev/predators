"use strict";
(() => {
    function getHudRoot() {
        let current = $.GetContextPanel();
        while (current && current.GetParent()) {
            current = current.GetParent();
        }
        return current;
    }
    let currentScoreLabel = null;
    let targetScoreLabel = null;
    let escalationLabel = null;
    let mounted = false;
    let cachedScore = 0;
    let cachedTarget = 1000;
    let cachedEscalation = 1.0;
    function applyValues() {
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
    function tryMountIntoQuickStats() {
        var _a, _b;
        if (mounted && currentScoreLabel && currentScoreLabel.IsValid()) {
            return;
        }
        const root = getHudRoot();
        if (!root) {
            $.Schedule(0.25, tryMountIntoQuickStats);
            return;
        }
        const quickStats = root.FindChildTraverse("quickstats");
        const headerCol = (_a = quickStats === null || quickStats === void 0 ? void 0 : quickStats.FindChildTraverse("HeaderColumn")) !== null && _a !== void 0 ? _a : null;
        const currentCol = (_b = quickStats === null || quickStats === void 0 ? void 0 : quickStats.FindChildTraverse("CurrentStatColumn")) !== null && _b !== void 0 ? _b : null;
        if (!headerCol || !currentCol) {
            $.Schedule(0.25, tryMountIntoQuickStats);
            return;
        }
        const oldHeader = headerCol.FindChild("EvoQuickScoreHeader");
        if (oldHeader)
            oldHeader.DeleteAsync(0);
        const oldRow = currentCol.FindChild("EvoQuickScoreRow");
        if (oldRow)
            oldRow.DeleteAsync(0);
        const headerLabel = $.CreatePanel("Label", headerCol, "EvoQuickScoreHeader");
        headerLabel.AddClass("QuickStatLabel");
        headerLabel.AddClass("QuickStatLabelHeader");
        headerLabel.text = $.Localize("#evo_hud_score_short");
        const valueRow = $.CreatePanel("Panel", currentCol, "EvoQuickScoreRow");
        valueRow.AddClass("QuickStatContainerMargin");
        valueRow.style.flowChildren = "right";
        currentScoreLabel = $.CreatePanel("Label", valueRow, "EvoScoreCurrent");
        currentScoreLabel.AddClass("QuickStatValue");
        currentScoreLabel.text = "0";
        const slash = $.CreatePanel("Label", valueRow, "EvoScoreSlash");
        slash.AddClass("SlashLabel");
        slash.text = "/";
        targetScoreLabel = $.CreatePanel("Label", valueRow, "EvoScoreTarget");
        targetScoreLabel.AddClass("QuickStatValue");
        targetScoreLabel.style.marginLeft = "2px";
        targetScoreLabel.text = "1000";
        escalationLabel = $.CreatePanel("Label", valueRow, "EvoScoreEsc");
        escalationLabel.AddClass("QuickStatValue");
        escalationLabel.style.marginLeft = "4px";
        escalationLabel.style.color = "#c9b074";
        escalationLabel.visible = false;
        escalationLabel.text = "";
        mounted = true;
        applyValues();
    }
    function onScoresUpdate(scoresData) {
        var _a, _b, _c;
        if (!scoresData)
            return;
        cachedTarget = Math.max(1, (_a = scoresData.target_score) !== null && _a !== void 0 ? _a : 1000);
        cachedEscalation = (_b = scoresData.escalation_mult) !== null && _b !== void 0 ? _b : cachedEscalation;
        const localTeam = Players.GetTeam(Players.GetLocalPlayer());
        const rawTeams = (_c = scoresData.teams) !== null && _c !== void 0 ? _c : {};
        const teamEntry = rawTeams[String(localTeam)];
        cachedScore = teamEntry ? teamEntry.score : 0;
        applyValues();
    }
    CustomNetTables.SubscribeNetTableListener("match_state", (_table, key, data) => {
        if (key === "scores") {
            onScoresUpdate(data);
        }
        else if (key === "state") {
            const state = data;
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
