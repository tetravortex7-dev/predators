"use strict";
let isPopupOpen = false;
let latestData;
let hookedStatBranch = false;
function findHudRoot() {
    let cur = $.GetContextPanel();
    while (cur && cur.GetParent()) {
        cur = cur.GetParent();
    }
    return cur;
}
function hideNativeStatBranchDialog() {
    const root = findHudRoot();
    if (!root)
        return;
    const nativeDialog = root.FindChildTraverse("statbranchdialog");
    if (nativeDialog) {
        nativeDialog.visible = false;
        nativeDialog.hittest = false;
    }
    const statBranchPopup = root.FindChildTraverse("StatBranchDrawer");
    if (statBranchPopup) {
        statBranchPopup.visible = false;
    }
}
function hookNativeStatBranch() {
    if (hookedStatBranch)
        return;
    const root = findHudRoot();
    if (!root)
        return;
    const statBranch = root.FindChildTraverse("StatBranch");
    if (!statBranch)
        return;
    hookedStatBranch = true;
    statBranch.SetPanelEvent("onactivate", () => {
        hideNativeStatBranchDialog();
        togglePopup();
    });
    statBranch.SetPanelEvent("onmouseover", () => {
        hideNativeStatBranchDialog();
    });
}
function togglePopup() {
    isPopupOpen = !isPopupOpen;
    const popup = $("#EvoTalentPopup");
    if (!popup)
        return;
    popup.SetHasClass("Hidden", !isPopupOpen);
    if (isPopupOpen) {
        renderTalentRows();
    }
}
function renderTalentRows() {
    var _a, _b;
    const container = $("#EvoTalentRows");
    if (!container)
        return;
    container.RemoveAndDeleteChildren();
    const data = latestData;
    const rows = data === null || data === void 0 ? void 0 : data.rows;
    if (!rows)
        return;
    const heroLevel = (_a = data === null || data === void 0 ? void 0 : data.hero_level) !== null && _a !== void 0 ? _a : 1;
    const abilityPoints = (_b = data === null || data === void 0 ? void 0 : data.ability_points) !== null && _b !== void 0 ? _b : 0;
    const indices = Object.keys(rows)
        .map((k) => parseInt(k, 10))
        .filter((n) => !isNaN(n))
        .sort((a, b) => b - a);
    for (const rowIdx of indices) {
        const row = rows[String(rowIdx)];
        if (!row)
            continue;
        const rowPanel = $.CreatePanel("Panel", container, `EvoTalentRow_${rowIdx}`);
        rowPanel.AddClass("EvoTalentRow");
        const leftLearned = row.left_learned === 1;
        const rightLearned = row.right_learned === 1;
        const rowUnlocked = heroLevel >= row.level;
        const canLearnMore = heroLevel >= 30 || (!leftLearned && !rightLearned);
        const leftAvail = rowUnlocked && abilityPoints > 0 && !leftLearned && canLearnMore;
        const rightAvail = rowUnlocked && abilityPoints > 0 && !rightLearned && canLearnMore;
        createBranchButton(rowPanel, rowIdx, "left", row.left_ability, leftLearned, leftAvail);
        const circle = $.CreatePanel("Panel", rowPanel, "");
        circle.AddClass("EvoTalentLevelCircle");
        circle.SetHasClass("Unlocked", rowUnlocked);
        const lvlLabel = $.CreatePanel("Label", circle, "");
        lvlLabel.AddClass("EvoTalentLevelLabel");
        lvlLabel.text = String(row.level);
        createBranchButton(rowPanel, rowIdx, "right", row.right_ability, rightLearned, rightAvail);
    }
}
function createBranchButton(parent, rowIdx, side, abilityName, learned, available) {
    const btn = $.CreatePanel("Panel", parent, `EvoTalent_${rowIdx}_${side}`);
    btn.AddClass("EvoTalentBranch");
    btn.SetHasClass("Learned", learned);
    btn.SetHasClass("Available", available);
    btn.SetHasClass("Locked", !learned && !available);
    const lbl = $.CreatePanel("Label", btn, "");
    lbl.AddClass("EvoTalentBranchLabel");
    lbl.text = $.Localize(`#DOTA_Tooltip_ability_${abilityName}`);
    if (available) {
        btn.SetPanelEvent("onactivate", () => {
            GameEvents.SendCustomGameEventToServer("evo_learn_talent", {
                row: rowIdx,
                side,
            });
        });
    }
}
function refreshFromNetTable() {
    const localId = Players.GetLocalPlayer();
    const raw = CustomNetTables.GetTableValue("player_talents", String(localId));
    if (raw) {
        latestData = raw;
        if (isPopupOpen) {
            renderTalentRows();
        }
    }
}
function periodicTick() {
    hookNativeStatBranch();
    hideNativeStatBranchDialog();
    $.Schedule(0.25, periodicTick);
}
CustomNetTables.SubscribeNetTableListener("player_talents", (_table, key, value) => {
    if (key === String(Players.GetLocalPlayer()) && value) {
        latestData = value;
        if (isPopupOpen) {
            renderTalentRows();
        }
    }
});
refreshFromNetTable();
periodicTick();
