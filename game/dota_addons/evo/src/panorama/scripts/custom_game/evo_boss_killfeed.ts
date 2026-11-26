interface BossKilledHeroPayload {
    boss_id?: string;
    boss_unit?: string;
    victim_player_id?: PlayerID;
    victim_hero?: string;
    gold?: number;
}

function getRootHud(): Panel | null {
    let cur: Panel | null = $.GetContextPanel();
    while (cur && cur.GetParent()) {
        cur = cur.GetParent();
    }
    return cur;
}

function collectPanelTexts(panel: Panel, out: string[]): void {
    if (panel.paneltype === "Label") {
        const lbl = panel as LabelPanel;
        if (lbl.text && lbl.text.length > 0) {
            out.push(lbl.text.toLowerCase());
        }
    }
    const count = panel.GetChildCount();
    for (let i = 0; i < count; i++) {
        const child = panel.GetChild(i);
        if (child) {
            collectPanelTexts(child, out);
        }
    }
}

function rewriteDireKillLabels(panel: Panel, bossLabel: string): void {
    if (panel.paneltype === "Label") {
        const lbl = panel as LabelPanel;
        if (lbl.text) {
            let next = lbl.text;
            next = next.replace(/Силы Тьмы/g, bossLabel);
            next = next.replace(/Силы тьмы/g, bossLabel);
            next = next.replace(/The Dire/g, bossLabel);
            if (next !== lbl.text) {
                lbl.text = next;
            }
        }
    }
    const count = panel.GetChildCount();
    for (let i = 0; i < count; i++) {
        const child = panel.GetChild(i);
        if (child) {
            rewriteDireKillLabels(child, bossLabel);
        }
    }
}

function suppressDireKillToast(playerName: string): void {
    const root = getRootHud();
    if (!root) return;

    const bossLabel = $.Localize("#evo_duel_boss_label");
    for (const id of ["KillCam", "DeathPanel", "KillMessage"]) {
        const panel = root.FindChildTraverse(id);
        if (panel) {
            rewriteDireKillLabels(panel, bossLabel);
        }
    }

    const toastMgr = root.FindChildTraverse("ToastManager");
    if (!toastMgr) return;

    const lowerPlayer = playerName.toLowerCase();
    const count = toastMgr.GetChildCount();
    for (let i = 0; i < count; i++) {
        const row = toastMgr.GetChild(i);
        if (!row || row.BHasClass("EvoBossKillRow")) continue;
        const texts: string[] = [];
        collectPanelTexts(row, texts);
        const joined = texts.join(" ");
        const isDireKill =
            joined.includes("силы тьмы") ||
            joined.includes("the dire") ||
            joined.includes("нейтральн") ||
            joined.includes("neutral");
        if (isDireKill && (lowerPlayer.length === 0 || joined.includes(lowerPlayer))) {
            row.style.visibility = "collapse";
            row.style.opacity = "0";
            row.DeleteAsync(0.0);
        }
    }
}

function createToastRow(parent: Panel, message: string, victimHero: string): void {
    const row = $.CreatePanel("Panel", parent, "");
    row.AddClass("EvoBossKillRow");
    row.AddClass("ToastPanel");
    row.AddClass("ToastVisible");

    const slash = $.CreatePanel("Panel", row, "SlashContainer");
    const teamBar = $.CreatePanel("Panel", slash, "TeamColorBar");
    teamBar.AddClass("EvoBossKillBar");

    const content = $.CreatePanel("Panel", row, "");
    content.AddClass("EvoBossKillContent");

    const icon = $.CreatePanel("Panel", content, "");
    icon.AddClass("EvoBossKillRoshanIcon");

    const sword = $.CreatePanel("Panel", content, "");
    sword.AddClass("EvoBossKillSwordIcon");

    if (victimHero.length > 0) {
        const heroImg = $.CreatePanel("Image", content, "");
        heroImg.AddClass("EvoBossKillHeroIcon");
        heroImg.SetImage(`s2r://panorama/images/heroes/icons/${victimHero}_png.vtex`);
    }

    const lbl = $.CreatePanel("Label", content, "");
    lbl.AddClass("EvoBossKillLabel");
    lbl.text = message;

    const goldIcon = $.CreatePanel("Panel", content, "");
    goldIcon.AddClass("EvoBossKillGoldIcon");

    $.Schedule(6.0, () => {
        if (!row || !row.IsValid()) return;
        row.RemoveClass("ToastVisible");
        row.style.opacity = "0";
        row.DeleteAsync(0.25);
    });
}

function onBossKilledHero(raw: unknown): void {
    const data = raw as BossKilledHeroPayload;
    const pid = data.victim_player_id;
    const victimHero = data.victim_hero ?? "";
    const playerName =
        pid !== undefined && pid >= 0
            ? Players.GetPlayerName(pid)
            : $.Localize(`#${victimHero}`);
    const safeName = playerName && playerName.length > 0 ? playerName : $.Localize(`#${victimHero}`);
    const gold = data.gold ?? 350;

    const template = $.Localize("#evo_boss_killed_hero");
    const message = template
        .replace("{player}", safeName)
        .replace("{gold}", String(gold));

    suppressDireKillToast(safeName);
    for (const delay of [0.05, 0.15, 0.35, 0.7, 1.1]) {
        $.Schedule(delay, () => suppressDireKillToast(safeName));
    }

    const root = getRootHud();
    const toastMgr = root ? root.FindChildTraverse("ToastManager") : null;
    if (toastMgr) {
        createToastRow(toastMgr, message, victimHero);
    } else {
        const fallback = $("#EvoBossKillFeed");
        if (fallback) {
            createToastRow(fallback, message, victimHero);
        }
    }
}

GameEvents.Subscribe("evo_boss_killed_hero", onBossKilledHero);
