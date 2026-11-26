"use strict";
function getRootHud() {
    let cur = $.GetContextPanel();
    while (cur && cur.GetParent()) {
        cur = cur.GetParent();
    }
    return cur;
}
function collectPanelTexts(panel, out) {
    if (panel.paneltype === "Label") {
        const lbl = panel;
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
function rewriteDireKillLabels(panel, bossLabel) {
    if (panel.paneltype === "Label") {
        const lbl = panel;
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
function suppressDireKillToast(playerName) {
    const root = getRootHud();
    if (!root)
        return;
    const bossLabel = $.Localize("#evo_duel_boss_label");
    for (const id of ["KillCam", "DeathPanel", "KillMessage"]) {
        const panel = root.FindChildTraverse(id);
        if (panel) {
            rewriteDireKillLabels(panel, bossLabel);
        }
    }
    const toastMgr = root.FindChildTraverse("ToastManager");
    if (!toastMgr)
        return;
    const lowerPlayer = playerName.toLowerCase();
    const count = toastMgr.GetChildCount();
    for (let i = 0; i < count; i++) {
        const row = toastMgr.GetChild(i);
        if (!row || row.BHasClass("EvoBossKillRow"))
            continue;
        const texts = [];
        collectPanelTexts(row, texts);
        const joined = texts.join(" ");
        const isDireKill = joined.includes("силы тьмы") ||
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
function createToastRow(parent, message, victimHero) {
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
        if (!row || !row.IsValid())
            return;
        row.RemoveClass("ToastVisible");
        row.style.opacity = "0";
        row.DeleteAsync(0.25);
    });
}
function onBossKilledHero(raw) {
    var _a, _b;
    const data = raw;
    const pid = data.victim_player_id;
    const victimHero = (_a = data.victim_hero) !== null && _a !== void 0 ? _a : "";
    const playerName = pid !== undefined && pid >= 0
        ? Players.GetPlayerName(pid)
        : $.Localize(`#${victimHero}`);
    const safeName = playerName && playerName.length > 0 ? playerName : $.Localize(`#${victimHero}`);
    const gold = (_b = data.gold) !== null && _b !== void 0 ? _b : 350;
    const template = $.Localize("#evo_boss_killed_hero");
    const message = template
        .replace("{player}", safeName)
        .replace("{gold}", String(gold));
    suppressDireKillToast(safeName);
    for (const delay of [0.05, 0.15, 0.35, 0.7, 1.1]) {
        $.Schedule(delay, () => suppressDireKillToast(safeName));
    }
    const feed = $("#EvoBossKillFeed");
    if (feed) {
        createToastRow(feed, message, victimHero);
    }
}
GameEvents.Subscribe("evo_boss_killed_hero", onBossKilledHero);
