(() => {
    GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_HEROES, false);
    GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_TIMEOFDAY, false);
    GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_BAR_BACKGROUND, false);

    interface HeroCardRefs {
        playerId: PlayerID;
        teamId: DOTATeam_t;
        card: Panel;
        heroImage: HeroImage;
        respawnLabel: LabelPanel;
        barsWrap: Panel;
        hpFill: Panel;
        mpFill: Panel;
    }

    const TEAM_COLORS: Record<number, string> = {
        2: "#5e9940",
        3: "#b84b39",
        6: "#4c79b8",
        7: "#bf7d3b",
        8: "#8f5ca6",
        9: "#b5a84a",
    };

    const PLAYABLE_TEAMS: readonly DOTATeam_t[] = [
        DOTATeam_t.DOTA_TEAM_GOODGUYS,
        DOTATeam_t.DOTA_TEAM_BADGUYS,
        DOTATeam_t.DOTA_TEAM_CUSTOM_1,
        DOTATeam_t.DOTA_TEAM_CUSTOM_2,
        DOTATeam_t.DOTA_TEAM_CUSTOM_3,
        DOTATeam_t.DOTA_TEAM_CUSTOM_4,
    ];

    const leftContainer = $("#EvoTopBarLeft");
    const rightContainer = $("#EvoTopBarRight");
    const clockLabel = $("#EvoClockLabel") as LabelPanel | null;
    const dayNightIcon = $("#EvoDayNightIcon");

    let lastRosterSignature = "";
    let cards: HeroCardRefs[] = [];

    function collectActiveTeams(): Array<{ teamId: DOTATeam_t; players: PlayerID[] }> {
        const result: Array<{ teamId: DOTATeam_t; players: PlayerID[] }> = [];
        for (const teamId of PLAYABLE_TEAMS) {
            const players = Game.GetPlayerIDsOnTeam(teamId);
            if (players && players.length > 0) {
                result.push({ teamId, players });
            }
        }
        return result;
    }

    function buildSignature(teams: Array<{ teamId: DOTATeam_t; players: PlayerID[] }>): string {
        return teams.map((t) => `${t.teamId}:${t.players.join(",")}`).join("|");
    }

    function createTeamGroup(
        parent: Panel,
        teamId: DOTATeam_t,
        players: PlayerID[]
    ): void {
        const group = $.CreatePanel("Panel", parent, "");
        group.AddClass("EvoTopBarTeamGroup");
        const color = TEAM_COLORS[teamId] ?? "#5e9940";

        for (const pid of players) {
            const card = $.CreatePanel("Panel", group, "");
            card.AddClass("EvoTopBarHeroCard");

            const strip = $.CreatePanel("Panel", card, "");
            strip.AddClass("EvoTopBarColorStrip");
            strip.style.backgroundColor = color;

            const portraitWrap = $.CreatePanel("Panel", card, "");
            portraitWrap.AddClass("EvoTopBarPortraitWrap");

            const heroImage = $.CreatePanel("DOTAHeroImage", portraitWrap, "") as HeroImage;
            heroImage.AddClass("EvoTopBarHeroImage");
            heroImage.heroimagestyle = "landscape";
            const heroName = Players.GetPlayerSelectedHero(pid);
            if (heroName && heroName.length > 0) {
                heroImage.heroname = heroName;
            }

            const deadOverlay = $.CreatePanel("Panel", portraitWrap, "");
            deadOverlay.AddClass("EvoTopBarDeadOverlay");

            const respawnLabel = $.CreatePanel("Label", portraitWrap, "") as LabelPanel;
            respawnLabel.AddClass("EvoTopBarRespawnLabel");
            respawnLabel.text = "";

            const barsWrap = $.CreatePanel("Panel", card, "");
            barsWrap.AddClass("EvoTopBarBars");

            const hpTrack = $.CreatePanel("Panel", barsWrap, "");
            hpTrack.AddClass("EvoTopBarHpTrack");
            const hpFill = $.CreatePanel("Panel", hpTrack, "");
            hpFill.AddClass("EvoTopBarHpFill");

            const mpTrack = $.CreatePanel("Panel", barsWrap, "");
            mpTrack.AddClass("EvoTopBarMpTrack");
            const mpFill = $.CreatePanel("Panel", mpTrack, "");
            mpFill.AddClass("EvoTopBarMpFill");

            portraitWrap.SetPanelEvent("onactivate", () => {
                Players.PlayerPortraitClicked(pid, false, false);
            });

            cards.push({
                playerId: pid,
                teamId,
                card,
                heroImage,
                respawnLabel,
                barsWrap,
                hpFill,
                mpFill,
            });
        }
    }

    function rebuildRoster(teams: Array<{ teamId: DOTATeam_t; players: PlayerID[] }>): void {
        if (!leftContainer || !rightContainer) return;
        leftContainer.RemoveAndDeleteChildren();
        rightContainer.RemoveAndDeleteChildren();
        cards = [];

        const leftCount = Math.ceil(teams.length / 2);
        for (let i = 0; i < teams.length; i++) {
            const target = i < leftCount ? leftContainer : rightContainer;
            createTeamGroup(target, teams[i].teamId, teams[i].players);
        }
    }

    function formatClock(seconds: number): string {
        const negative = seconds < 0;
        const abs = Math.floor(Math.abs(seconds));
        const mins = Math.floor(abs / 60);
        const secs = abs % 60;
        const padded = secs < 10 ? `0${secs}` : String(secs);
        return `${negative ? "-" : ""}${mins}:${padded}`;
    }

    function updateTick(): void {
        const teams = collectActiveTeams();
        const sig = buildSignature(teams);
        if (sig !== lastRosterSignature) {
            lastRosterSignature = sig;
            rebuildRoster(teams);
        }

        const localTeam = Players.GetTeam(Players.GetLocalPlayer());

        for (const ref of cards) {
            const heroName = Players.GetPlayerSelectedHero(ref.playerId);
            if (heroName && heroName.length > 0 && ref.heroImage.heroname !== heroName) {
                ref.heroImage.heroname = heroName;
            }

            const heroEnt = Players.GetPlayerHeroEntityIndex(ref.playerId);
            const respawnSecs = Players.GetRespawnSeconds(ref.playerId);
            const isDead = respawnSecs > 0 || (heroEnt !== -1 && !Entities.IsAlive(heroEnt));
            ref.card.SetHasClass("IsDead", isDead);
            if (isDead) {
                ref.respawnLabel.text = respawnSecs > 0 ? String(Math.ceil(respawnSecs)) : "";
            }

            const isAlly = ref.teamId === localTeam;
            ref.barsWrap.SetHasClass("Hidden", !isAlly);
            if (isAlly && heroEnt !== -1 && Entities.IsAlive(heroEnt)) {
                const hpPct = Math.max(0, Math.min(100, Entities.GetHealthPercent(heroEnt)));
                const maxMana = Math.max(1, Entities.GetMaxMana(heroEnt));
                const mpPct = Math.max(0, Math.min(100, Math.round((Entities.GetMana(heroEnt) / maxMana) * 100)));
                ref.hpFill.style.width = `${hpPct}%`;
                ref.mpFill.style.width = `${mpPct}%`;
            }
        }

        if (clockLabel) {
            clockLabel.text = formatClock(Game.GetDOTATime(false, true));
        }

        if (dayNightIcon) {
            const dotaTime = Math.max(0, Game.GetDOTATime(false, false));
            const cycleSec = dotaTime % 600;
            dayNightIcon.SetHasClass("IsNight", cycleSec >= 300);
        }

        $.Schedule(0.25, updateTick);
    }

    updateTick();
})();
