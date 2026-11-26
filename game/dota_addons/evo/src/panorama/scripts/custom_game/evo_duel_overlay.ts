(() => {
    const DEFAULT_BET_GOLD = 100;
    const BOSS_DUEL_BET_TEAM = 1;
    const BOSS_DUEL_BET_BOSS = -2;

    const banner = $("#EvoDuelBanner");
    const titleLabel = $("#EvoDuelTitle") as LabelPanel | null;
    const timerLabel = $("#EvoDuelTimer") as LabelPanel | null;
    const matchupLabel = $("#EvoDuelMatchup") as LabelPanel | null;
    const rewardLabel = $("#EvoDuelReward") as LabelPanel | null;
    const betRow = $("#EvoDuelBetRow");
    const betLeftBtn = $("#EvoBetLeftBtn");
    const betLeftLabel = $("#EvoBetLeftLabel") as LabelPanel | null;
    const betRightBtn = $("#EvoBetRightBtn");
    const betRightLabel = $("#EvoBetRightLabel") as LabelPanel | null;

    let betPlacedRound = -1;
    let leftTarget = -1;
    let rightTarget = -1;
    let currentRound = 0;
    let latestState: EvoDuelStateNetPayload | null = null;
    let latestResult: EvoDuelResultNetPayload | null = null;
    let resultHideToken = 0;

    if (betLeftBtn) {
        betLeftBtn.SetPanelEvent("onactivate", () => {
            if (leftTarget === -1) return;
            betPlacedRound = currentRound;
            GameEvents.SendCustomGameEventToServer("evo_duel_bet" as never, {
                backed_player_id: leftTarget,
                gold_amount: DEFAULT_BET_GOLD,
            } as never);
            if (betRow) betRow.SetHasClass("Visible", false);
        });
    }

    if (betRightBtn) {
        betRightBtn.SetPanelEvent("onactivate", () => {
            betPlacedRound = currentRound;
            GameEvents.SendCustomGameEventToServer("evo_duel_bet" as never, {
                backed_player_id: rightTarget,
                gold_amount: DEFAULT_BET_GOLD,
            } as never);
            if (betRow) betRow.SetHasClass("Visible", false);
        });
    }

    function getPlayerLabel(pid: number): string {
        if (pid < 0) return $.Localize("#evo_duel_boss_label");
        const name = Players.GetPlayerName(pid as PlayerID);
        return name && name.length > 0 ? name : `Player ${pid + 1}`;
    }

    function renderDuel(): void {
        if (!banner) return;

        const data = latestState;
        const active = data?.active === true || data?.active === 1;

        if (active && data) {
            banner.SetHasClass("Visible", true);
            banner.SetHasClass("IsResult", false);

            currentRound = data.round_index ?? 0;
            const isBoss = data.is_boss_duel === true || data.is_boss_duel === 1;
            const isTiebreaker = data.is_tiebreaker === true || data.is_tiebreaker === 1;

            if (titleLabel) {
                if (isBoss) {
                    titleLabel.text = $.Localize("#evo_boss_duel_title");
                } else if (isTiebreaker) {
                    titleLabel.text = $.Localize("#evo_tiebreaker_title");
                } else {
                    titleLabel.text = $.Localize("#evo_duel_title");
                }
            }

            if (timerLabel) {
                timerLabel.visible = true;
                timerLabel.text = `${data.time_remaining ?? 0}s`;
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
                const teamToken = `#evo_team_${data.challenging_team ?? 2}`;
                const localizedTeam = $.Localize(teamToken);
                leftName = localizedTeam !== teamToken ? localizedTeam : `Team ${data.challenging_team ?? 2}`;
                rightName = $.Localize("#evo_duel_boss_label");
                leftTarget = BOSS_DUEL_BET_TEAM;
                rightTarget = BOSS_DUEL_BET_BOSS;
                isParticipant = localTeam === data.challenging_team;
            } else {
                const pA = data.player_a ?? -1;
                const pB = data.player_b ?? -1;
                leftName = getPlayerLabel(pA);
                rightName = getPlayerLabel(pB);
                leftTarget = pA;
                rightTarget = pB;
                isParticipant = localPlayerId === pA || localPlayerId === pB;
            }

            if (matchupLabel) {
                matchupLabel.text = `${leftName}  vs  ${rightName}`;
            }

            const canBet =
                (data.bets_open === true || data.bets_open === 1) &&
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
        const showResult = res !== null && res !== undefined && (res.expires_at ?? 0) > now;

        banner.SetHasClass("Visible", showResult);
        banner.SetHasClass("IsResult", showResult);
        if (betRow) {
            betRow.SetHasClass("Visible", false);
        }

        if (!showResult || !res) return;

        if (timerLabel) {
            timerLabel.visible = false;
        }

        const isDraw = res.is_draw === true || res.is_draw === 1 || (res.winner_id ?? -1) < 0;
        if (titleLabel) {
            titleLabel.text = $.Localize(isDraw ? "#evo_duel_result_draw_title" : "#evo_duel_result_win_title");
        }

        if (matchupLabel) {
            if (isDraw) {
                matchupLabel.text = $.Localize("#evo_duel_result_draw_desc");
            } else {
                const winnerName = getPlayerLabel(res.winner_id ?? -1);
                const token = res.reason === "hp" ? "#evo_duel_result_winner_hp" : "#evo_duel_result_winner";
                matchupLabel.text = $.Localize(token).replace("{player}", winnerName);
            }
        }

        if (rewardLabel) {
            rewardLabel.SetHasClass("Visible", true);
            if (isDraw) {
                rewardLabel.text = $.Localize("#evo_duel_result_reward_draw");
            } else {
                const scoreReward = res.score_reward ?? 35;
                const goldReward = res.gold_reward ?? 0;
                const betPayout = res.bet_payout ?? 0;
                if (betPayout > 0) {
                    rewardLabel.text = $.Localize("#evo_duel_result_reward_with_bets")
                        .replace("{score}", String(scoreReward))
                        .replace("{gold}", String(goldReward))
                        .replace("{bets}", String(betPayout));
                } else {
                    rewardLabel.text = $.Localize("#evo_duel_result_reward")
                        .replace("{score}", String(scoreReward))
                        .replace("{gold}", String(goldReward));
                }
            }
        }
    }

    function scheduleResultRefresh(expiresAt: number): void {
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
            latestState = data as unknown as EvoDuelStateNetPayload;
            renderDuel();
        } else if (key === "last_result") {
            latestResult = data as unknown as EvoDuelResultNetPayload;
            if (latestResult && latestResult.expires_at !== undefined) {
                scheduleResultRefresh(latestResult.expires_at);
            }
            renderDuel();
        }
    });

    latestState = CustomNetTables.GetTableValue(
        "duel_state",
        "state"
    ) as unknown as EvoDuelStateNetPayload | null;
    latestResult = CustomNetTables.GetTableValue(
        "duel_state",
        "last_result"
    ) as unknown as EvoDuelResultNetPayload | null;
    if (latestResult && latestResult.expires_at !== undefined) {
        scheduleResultRefresh(latestResult.expires_at);
    }
    renderDuel();
})();
