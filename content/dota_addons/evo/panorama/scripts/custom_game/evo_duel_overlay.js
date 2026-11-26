"use strict";
(() => {
    const DEFAULT_BET_GOLD = 100;
    const BOSS_DUEL_BET_TEAM = 1;
    const BOSS_DUEL_BET_BOSS = -2;
    const banner = $("#EvoDuelBanner");
    const titleLabel = $("#EvoDuelTitle");
    const timerLabel = $("#EvoDuelTimer");
    const matchupLabel = $("#EvoDuelMatchup");
    const rewardLabel = $("#EvoDuelReward");
    const betRow = $("#EvoDuelBetRow");
    const betLeftBtn = $("#EvoBetLeftBtn");
    const betLeftLabel = $("#EvoBetLeftLabel");
    const betRightBtn = $("#EvoBetRightBtn");
    const betRightLabel = $("#EvoBetRightLabel");
    let betPlacedRound = -1;
    let leftTarget = -1;
    let rightTarget = -1;
    let currentRound = 0;
    let latestState = null;
    let latestResult = null;
    let resultHideToken = 0;
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
    function renderDuel() {
        var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m;
        if (!banner)
            return;
        const data = latestState;
        const active = (data === null || data === void 0 ? void 0 : data.active) === true || (data === null || data === void 0 ? void 0 : data.active) === 1;
        if (active && data) {
            banner.SetHasClass("Visible", true);
            banner.SetHasClass("IsResult", false);
            currentRound = (_a = data.round_index) !== null && _a !== void 0 ? _a : 0;
            const isBoss = data.is_boss_duel === true || data.is_boss_duel === 1;
            const isTiebreaker = data.is_tiebreaker === true || data.is_tiebreaker === 1;
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
                timerLabel.visible = true;
                timerLabel.text = `${(_b = data.time_remaining) !== null && _b !== void 0 ? _b : 0}s`;
            }
            if (rewardLabel) {
                rewardLabel.SetHasClass("Visible", false);
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
            const canBet = (data.bets_open === true || data.bets_open === 1) &&
                !isParticipant &&
                betPlacedRound !== currentRound;
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
            return;
        }
        const res = latestResult;
        const now = Game.GetDOTATime(false, false);
        const showResult = res !== null && res !== undefined && ((_g = res.expires_at) !== null && _g !== void 0 ? _g : 0) > now;
        banner.SetHasClass("Visible", showResult);
        banner.SetHasClass("IsResult", showResult);
        if (betRow) {
            betRow.SetHasClass("Visible", false);
        }
        if (!showResult || !res)
            return;
        if (timerLabel) {
            timerLabel.visible = false;
        }
        const isDraw = res.is_draw === true || res.is_draw === 1 || ((_h = res.winner_id) !== null && _h !== void 0 ? _h : -1) < 0;
        if (titleLabel) {
            titleLabel.text = $.Localize(isDraw ? "#evo_duel_result_draw_title" : "#evo_duel_result_win_title");
        }
        if (matchupLabel) {
            if (isDraw) {
                matchupLabel.text = $.Localize("#evo_duel_result_draw_desc");
            }
            else {
                const winnerName = getPlayerLabel((_j = res.winner_id) !== null && _j !== void 0 ? _j : -1);
                const token = res.reason === "hp" ? "#evo_duel_result_winner_hp" : "#evo_duel_result_winner";
                matchupLabel.text = $.Localize(token).replace("{player}", winnerName);
            }
        }
        if (rewardLabel) {
            rewardLabel.SetHasClass("Visible", true);
            if (isDraw) {
                rewardLabel.text = $.Localize("#evo_duel_result_reward_draw");
            }
            else {
                const scoreReward = (_k = res.score_reward) !== null && _k !== void 0 ? _k : 35;
                const goldReward = (_l = res.gold_reward) !== null && _l !== void 0 ? _l : 0;
                const betPayout = (_m = res.bet_payout) !== null && _m !== void 0 ? _m : 0;
                if (betPayout > 0) {
                    rewardLabel.text = $.Localize("#evo_duel_result_reward_with_bets")
                        .replace("{score}", String(scoreReward))
                        .replace("{gold}", String(goldReward))
                        .replace("{bets}", String(betPayout));
                }
                else {
                    rewardLabel.text = $.Localize("#evo_duel_result_reward")
                        .replace("{score}", String(scoreReward))
                        .replace("{gold}", String(goldReward));
                }
            }
        }
    }
    function scheduleResultRefresh(expiresAt) {
        resultHideToken += 1;
        const myToken = resultHideToken;
        const delay = Math.max(0.1, expiresAt - Game.GetDOTATime(false, false) + 0.15);
        $.Schedule(delay, () => {
            if (myToken === resultHideToken) {
                renderDuel();
            }
        });
    }
    CustomNetTables.SubscribeNetTableListener("duel_state", (_table, key, data) => {
        if (key === "state") {
            latestState = data;
            renderDuel();
        }
        else if (key === "last_result") {
            latestResult = data;
            if (latestResult && latestResult.expires_at !== undefined) {
                scheduleResultRefresh(latestResult.expires_at);
            }
            renderDuel();
        }
    });
    latestState = CustomNetTables.GetTableValue("duel_state", "state");
    latestResult = CustomNetTables.GetTableValue("duel_state", "last_result");
    if (latestResult && latestResult.expires_at !== undefined) {
        scheduleResultRefresh(latestResult.expires_at);
    }
    renderDuel();
})();
