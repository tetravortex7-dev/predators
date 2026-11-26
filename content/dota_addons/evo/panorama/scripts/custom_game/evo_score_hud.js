"use strict";
(() => {
    function getHudRoot() {
        let current = $.GetContextPanel();
        while (current && current.GetParent()) {
            current = current.GetParent();
        }
        return current;
    }
    let scoreHeaderLabel = null;
    let scoreValueRow = null;
    let duelHeaderLabel = null;
    let duelValueRow = null;
    let duelRecordHeaderLabel = null;
    let duelRecordRowPanel = null;
    let currentScoreLabel = null;
    let targetScoreLabel = null;
    let escalationLabel = null;
    let duelValueLabel = null;
    let duelRecordLabel = null;
    let mounted = false;
    function alignQuickStatRowStep(step, retries) {
        var _a, _b;
        const pairs = [
            [scoreHeaderLabel, scoreValueRow],
            [duelHeaderLabel, duelValueRow],
            [duelRecordHeaderLabel, duelRecordRowPanel],
        ];
        if (step >= pairs.length || retries > 20) {
            return;
        }
        const [header, row] = pairs[step];
        if (!header || !row || !header.IsValid() || !row.IsValid()) {
            return;
        }
        if (!header.IsSizeValid() || !row.IsSizeValid()) {
            $.Schedule(0.1, () => alignQuickStatRowStep(step, retries + 1));
            return;
        }
        const scale = header.actualuiscale_y > 0 ? header.actualuiscale_y : 1;
        const headerPos = header.GetPositionWithinWindow();
        const rowPos = row.GetPositionWithinWindow();
        const headerCenter = headerPos.y + header.actuallayoutheight * 0.5;
        const rowCenter = rowPos.y + row.actuallayoutheight * 0.5;
        const diffLayoutPx = (rowCenter - headerCenter) / scale;
        if (diffLayoutPx > 0.5) {
            const currentMargin = parseFloat((_a = header.style.marginTop) !== null && _a !== void 0 ? _a : "2");
            const baseMargin = Number.isNaN(currentMargin) ? 2 : currentMargin;
            header.style.marginTop = `${(baseMargin + diffLayoutPx).toFixed(1)}px`;
        }
        else if (diffLayoutPx < -0.5) {
            const currentMargin = parseFloat((_b = row.style.marginTop) !== null && _b !== void 0 ? _b : "2");
            const baseMargin = Number.isNaN(currentMargin) ? 2 : currentMargin;
            row.style.marginTop = `${(baseMargin - diffLayoutPx).toFixed(1)}px`;
        }
        $.Schedule(0.03, () => alignQuickStatRowStep(step + 1, 0));
    }
    let cachedScore = 0;
    let cachedTarget = 1200;
    let cachedEscalation = 1.0;
    let duelActive = false;
    let duelRemainingSec = 0;
    let nextDuelInSec = 0;
    let candidateCountdownUntil = 0;
    let duelWins = 0;
    let duelLosses = 0;
    function formatTimer(seconds) {
        const clamped = Math.max(0, Math.floor(seconds));
        const mins = Math.floor(clamped / 60);
        const secs = clamped % 60;
        return `${mins}:${secs < 10 ? "0" : ""}${secs}`;
    }
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
        if (duelValueLabel && duelValueLabel.IsValid()) {
            const isCandidateNow = !duelActive && Game.GetDOTATime(false, false) <= candidateCountdownUntil;
            if (duelActive) {
                duelValueLabel.text = `${$.Localize("#evo_hud_duel_live")} ${formatTimer(duelRemainingSec)}`;
                duelValueLabel.style.color = "#d4b876";
            }
            else {
                duelValueLabel.text = formatTimer(nextDuelInSec);
                duelValueLabel.style.color = isCandidateNow ? "#e07a5f" : "#d6dee6";
            }
        }
        if (duelRecordLabel && duelRecordLabel.IsValid()) {
            duelRecordLabel.text = `${duelWins}/${duelLosses}`;
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
        const oldDuelHeader = headerCol.FindChild("EvoQuickDuelHeader");
        if (oldDuelHeader)
            oldDuelHeader.DeleteAsync(0);
        const oldDuelRow = currentCol.FindChild("EvoQuickDuelRow");
        if (oldDuelRow)
            oldDuelRow.DeleteAsync(0);
        const oldDuelRecordHeader = headerCol.FindChild("EvoQuickDuelRecordHeader");
        if (oldDuelRecordHeader)
            oldDuelRecordHeader.DeleteAsync(0);
        const oldDuelRecordRow = currentCol.FindChild("EvoQuickDuelRecordRow");
        if (oldDuelRecordRow)
            oldDuelRecordRow.DeleteAsync(0);
        scoreHeaderLabel = $.CreatePanel("Label", headerCol, "EvoQuickScoreHeader");
        scoreHeaderLabel.AddClass("QuickStatLabel");
        scoreHeaderLabel.AddClass("QuickStatLabelHeader");
        scoreHeaderLabel.text = $.Localize("#evo_hud_score_short");
        duelHeaderLabel = $.CreatePanel("Label", headerCol, "EvoQuickDuelHeader");
        duelHeaderLabel.AddClass("QuickStatLabel");
        duelHeaderLabel.AddClass("QuickStatLabelHeader");
        duelHeaderLabel.text = $.Localize("#evo_hud_duel_short");
        duelRecordHeaderLabel = $.CreatePanel("Label", headerCol, "EvoQuickDuelRecordHeader");
        duelRecordHeaderLabel.AddClass("QuickStatLabel");
        duelRecordHeaderLabel.AddClass("QuickStatLabelHeader");
        duelRecordHeaderLabel.text = $.Localize("#evo_hud_duel_record_short");
        scoreValueRow = $.CreatePanel("Panel", currentCol, "EvoQuickScoreRow");
        scoreValueRow.AddClass("QuickStatContainerMargin");
        scoreValueRow.style.flowChildren = "right";
        currentScoreLabel = $.CreatePanel("Label", scoreValueRow, "EvoScoreCurrent");
        currentScoreLabel.AddClass("QuickStatValue");
        currentScoreLabel.text = "0";
        const slash = $.CreatePanel("Label", scoreValueRow, "EvoScoreSlash");
        slash.AddClass("SlashLabel");
        slash.text = "/";
        targetScoreLabel = $.CreatePanel("Label", scoreValueRow, "EvoScoreTarget");
        targetScoreLabel.AddClass("QuickStatValue");
        targetScoreLabel.style.marginLeft = "2px";
        targetScoreLabel.text = "1200";
        escalationLabel = $.CreatePanel("Label", scoreValueRow, "EvoScoreEsc");
        escalationLabel.AddClass("QuickStatValue");
        escalationLabel.style.marginLeft = "4px";
        escalationLabel.style.color = "#c9b074";
        escalationLabel.hittest = true;
        escalationLabel.visible = false;
        escalationLabel.text = "";
        escalationLabel.SetPanelEvent("onmouseover", () => {
            if (!escalationLabel || !escalationLabel.IsValid() || !escalationLabel.visible)
                return;
            const mult = cachedEscalation.toFixed(1);
            const title = $.Localize("#evo_hud_esc_tooltip_title").replace("{mult}", mult);
            const body = $.Localize("#evo_hud_esc_tooltip_body");
            $.DispatchEvent("DOTAShowTitleTextTooltip", escalationLabel, title, body);
        });
        escalationLabel.SetPanelEvent("onmouseout", () => {
            if (!escalationLabel || !escalationLabel.IsValid())
                return;
            $.DispatchEvent("DOTAHideTitleTextTooltip", escalationLabel);
        });
        duelValueRow = $.CreatePanel("Panel", currentCol, "EvoQuickDuelRow");
        duelValueRow.AddClass("QuickStatContainerMargin");
        duelValueRow.style.flowChildren = "right";
        duelValueLabel = $.CreatePanel("Label", duelValueRow, "EvoDuelTimerValue");
        duelValueLabel.AddClass("QuickStatValue");
        duelValueLabel.text = "3:00";
        duelRecordRowPanel = $.CreatePanel("Panel", currentCol, "EvoQuickDuelRecordRow");
        duelRecordRowPanel.AddClass("QuickStatContainerMargin");
        duelRecordRowPanel.style.flowChildren = "right";
        duelRecordLabel = $.CreatePanel("Label", duelRecordRowPanel, "EvoDuelRecordValue");
        duelRecordLabel.AddClass("QuickStatValue");
        duelRecordLabel.hittest = true;
        duelRecordLabel.text = "0/0";
        duelRecordLabel.SetPanelEvent("onmouseover", () => {
            if (!duelRecordLabel || !duelRecordLabel.IsValid())
                return;
            const title = $.Localize("#evo_hud_duel_record_tooltip_title");
            const body = $.Localize("#evo_hud_duel_record_tooltip_body");
            $.DispatchEvent("DOTAShowTitleTextTooltip", duelRecordLabel, title, body);
        });
        duelRecordLabel.SetPanelEvent("onmouseout", () => {
            if (!duelRecordLabel || !duelRecordLabel.IsValid())
                return;
            $.DispatchEvent("DOTAHideTitleTextTooltip", duelRecordLabel);
        });
        mounted = true;
        applyValues();
        $.Schedule(0.1, () => alignQuickStatRowStep(0, 0));
    }
    function onScoresUpdate(scoresData) {
        var _a, _b, _c;
        if (!scoresData)
            return;
        cachedTarget = Math.max(1, (_a = scoresData.target_score) !== null && _a !== void 0 ? _a : 1200);
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
    function onDuelStateUpdate(duelData) {
        var _a, _b, _c, _d, _e;
        if (!duelData)
            return;
        duelActive = duelData.active === true || duelData.active === 1;
        duelRemainingSec = (_a = duelData.time_remaining) !== null && _a !== void 0 ? _a : 0;
        nextDuelInSec = (_b = duelData.next_duel_in) !== null && _b !== void 0 ? _b : 0;
        const localRecord = (_c = duelData.player_records) === null || _c === void 0 ? void 0 : _c[String(Players.GetLocalPlayer())];
        if (localRecord) {
            duelWins = (_d = localRecord.wins) !== null && _d !== void 0 ? _d : 0;
            duelLosses = (_e = localRecord.losses) !== null && _e !== void 0 ? _e : 0;
        }
        if (duelActive) {
            candidateCountdownUntil = 0;
        }
        applyValues();
    }
    CustomNetTables.SubscribeNetTableListener("duel_state", (_table, key, data) => {
        if (key === "state") {
            onDuelStateUpdate(data);
        }
    });
    GameEvents.Subscribe("evo_duel_countdown_tick", () => {
        candidateCountdownUntil = Game.GetDOTATime(false, false) + 2;
        applyValues();
    });
    const initialState = CustomNetTables.GetTableValue("match_state", "state");
    if (initialState && initialState.escalation_mult !== undefined) {
        cachedEscalation = initialState.escalation_mult;
    }
    onScoresUpdate(CustomNetTables.GetTableValue("match_state", "scores"));
    onDuelStateUpdate(CustomNetTables.GetTableValue("duel_state", "state"));
    tryMountIntoQuickStats();
})();
