"use strict";
(() => {
    const DEFAULT_BET_GOLD = 100;
    const BOSS_DUEL_BET_TEAM = 1;
    const BOSS_DUEL_BET_BOSS = -2;
    const banner = $("#EvoDuelBanner");
    const titleLabel = $("#EvoDuelTitle");
    const timerLabel = $("#EvoDuelTimer");
    const matchupLabel = $("#EvoDuelMatchup");
    const betRow = $("#EvoDuelBetRow");
    const betLeftBtn = $("#EvoBetLeftBtn");
    const betLeftLabel = $("#EvoBetLeftLabel");
    const betRightBtn = $("#EvoBetRightBtn");
    const betRightLabel = $("#EvoBetRightLabel");
    let betPlacedRound = -1;
    let leftTarget = -1;
    let rightTarget = -1;
    let currentRound = 0;
    if (betLeftBtn) {
        betLeftBtn.SetPanelEvent("onactivate", () => {
            if (leftTarget === -1)
                return;
            betPlacedRound = currentRound;
            GameEvents.SendCustomGameEventToServer("evo_duel_bet", {
                backed_player_id: leftTarget,
                gold_amount: DEFAULT_BET_GOLD,
            });
            if (betRow)
                betRow.SetHasClass("Visible", false);
        });
    }
    if (betRightBtn) {
        betRightBtn.SetPanelEvent("onactivate", () => {
            betPlacedRound = currentRound;
            GameEvents.SendCustomGameEventToServer("evo_duel_bet", {
                backed_player_id: rightTarget,
                gold_amount: DEFAULT_BET_GOLD,
            });
            if (betRow)
                betRow.SetHasClass("Visible", false);
        });
    }
    function getPlayerLabel(pid) {
        if (pid < 0)
            return $.Localize("#evo_duel_boss_label");
        const name = Players.GetPlayerName(pid);
        return name && name.length > 0 ? name : `Player ${pid + 1}`;
    }
    function renderDuel(data) {
        var _a, _b, _c, _d, _e, _f;
        if (!banner)
            return;
        const active = (data === null || data === void 0 ? void 0 : data.active) === true;
        banner.SetHasClass("Visible", active);
        if (!active || !data)
            return;
        currentRound = (_a = data.round_index) !== null && _a !== void 0 ? _a : 0;
        const isBoss = data.is_boss_duel === true;
        const isTiebreaker = data.is_tiebreaker === true;
        if (titleLabel) {
            if (isBoss) {
                titleLabel.text = $.Localize("#evo_boss_duel_title");
            }
            else if (isTiebreaker) {
                titleLabel.text = $.Localize("#evo_tiebreaker_title");
            }
            else {
                titleLabel.text = $.Localize("#evo_duel_title");
            }
        }
        if (timerLabel) {
            timerLabel.text = `${(_b = data.time_remaining) !== null && _b !== void 0 ? _b : 0}s`;
        }
        const localPlayerId = Players.GetLocalPlayer();
        const localTeam = Players.GetTeam(localPlayerId);
        let leftName = "";
        let rightName = "";
        let isParticipant = false;
        if (isBoss) {
            const teamToken = `#evo_team_${(_c = data.challenging_team) !== null && _c !== void 0 ? _c : 2}`;
            const localizedTeam = $.Localize(teamToken);
            leftName = localizedTeam !== teamToken ? localizedTeam : `Team ${(_d = data.challenging_team) !== null && _d !== void 0 ? _d : 2}`;
            rightName = $.Localize("#evo_duel_boss_label");
            leftTarget = BOSS_DUEL_BET_TEAM;
            rightTarget = BOSS_DUEL_BET_BOSS;
            isParticipant = localTeam === data.challenging_team;
        }
        else {
            const pA = (_e = data.player_a) !== null && _e !== void 0 ? _e : -1;
            const pB = (_f = data.player_b) !== null && _f !== void 0 ? _f : -1;
            leftName = getPlayerLabel(pA);
            rightName = getPlayerLabel(pB);
            leftTarget = pA;
            rightTarget = pB;
            isParticipant = localPlayerId === pA || localPlayerId === pB;
        }
        if (matchupLabel) {
            matchupLabel.text = `${leftName}  vs  ${rightName}`;
        }
        const canBet = data.bets_open === true && !isParticipant && betPlacedRound !== currentRound;
        if (betRow) {
            betRow.SetHasClass("Visible", canBet);
        }
        if (canBet) {
            if (betLeftLabel) {
                betLeftLabel.text = `${leftName} (${DEFAULT_BET_GOLD})`;
            }
            if (betRightLabel) {
                betRightLabel.text = `${rightName} (${DEFAULT_BET_GOLD})`;
            }
        }
    }
    CustomNetTables.SubscribeNetTableListener("duel_state", (_table, key, data) => {
        if (key === "state") {
            renderDuel(data);
        }
    });
    renderDuel(CustomNetTables.GetTableValue("duel_state", "state"));
})();
