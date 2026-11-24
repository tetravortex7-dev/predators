(() => {
    interface DuelStateNetPayload {
        active?: boolean;
        round_index?: number;
        time_remaining?: number;
        bets_open?: boolean;
        is_tiebreaker?: boolean;
        is_boss_duel?: boolean;
        boss_id?: string;
        challenging_team?: number;
        player_a?: number;
        player_b?: number;
    }

    const DEFAULT_BET_GOLD = 100;
    const BOSS_DUEL_BET_TEAM = 1;
    const BOSS_DUEL_BET_BOSS = -2;

    const banner = $("#EvoDuelBanner");
    const titleLabel = $("#EvoDuelTitle") as LabelPanel | null;
    const timerLabel = $("#EvoDuelTimer") as LabelPanel | null;
    const matchupLabel = $("#EvoDuelMatchup") as LabelPanel | null;
    const betRow = $("#EvoDuelBetRow");
    const betLeftBtn = $("#EvoBetLeftBtn");
    const betLeftLabel = $("#EvoBetLeftLabel") as LabelPanel | null;
    const betRightBtn = $("#EvoBetRightBtn");
    const betRightLabel = $("#EvoBetRightLabel") as LabelPanel | null;

    let betPlacedRound = -1;
    let leftTarget = -1;
    let rightTarget = -1;
    let currentRound = 0;

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

    function renderDuel(data: DuelStateNetPayload | null | undefined): void {
        if (!banner) return;
        const active = data?.active === true;
        banner.SetHasClass("Visible", active);
        if (!active || !data) return;

        currentRound = data.round_index ?? 0;
        const isBoss = data.is_boss_duel === true;
        const isTiebreaker = data.is_tiebreaker === true;

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
            timerLabel.text = `${data.time_remaining ?? 0}s`;
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
            data.bets_open === true && !isParticipant && betPlacedRound !== currentRound;
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
            renderDuel(data as unknown as DuelStateNetPayload);
        }
    });

    renderDuel(
        CustomNetTables.GetTableValue("duel_state", "state") as unknown as DuelStateNetPayload | null
    );
})();
