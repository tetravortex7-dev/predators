"use strict";
const FALLBACK_ROWS = [
    { level: 10, left_ability: "special_bonus_evo_agi_int_1", right_ability: "special_bonus_evo_int_str_1", left_learned: 0, right_learned: 0 },
    { level: 15, left_ability: "special_bonus_evo_hp_100", right_ability: "special_bonus_evo_mana_125", left_learned: 0, right_learned: 0 },
    { level: 20, left_ability: "special_bonus_evo_ms_25", right_ability: "special_bonus_evo_armor_6", left_learned: 0, right_learned: 0 },
    { level: 25, left_ability: "special_bonus_evo_all_stats_5", right_ability: "special_bonus_evo_magic_resist_15", left_learned: 0, right_learned: 0 },
    { level: 30, left_ability: "special_bonus_evo_hp_regen_15", right_ability: "special_bonus_evo_mana_regen_75", left_learned: 0, right_learned: 0 },
    { level: 35, left_ability: "special_bonus_evo_damage_75", right_ability: "special_bonus_evo_spell_amp_28", left_learned: 0, right_learned: 0 },
];
let isPinnedOpen = false;
let isHoveringPopup = false;
let latestData;
let hookedStatBranch = false;
let hookedPopupHover = false;
let lastRenderedVisible = false;
let lastRenderSignature = "";
function findHudRoot() {
    let cur = $.GetContextPanel();
    while (cur && cur.GetParent()) {
        cur = cur.GetParent();
    }
    return cur;
}
function getNativeStatBranchState() {
    const root = findHudRoot();
    if (!root)
        return { nativeClickOpen: false, nativeHoverOpen: false };
    let nativeClickOpen = false;
    let nativeHoverOpen = false;
    const dotaStatBranch = root.FindChildTraverse("DOTAStatBranch");
    if (dotaStatBranch) {
        if (dotaStatBranch.BHasClass("ShowStatBranch")) {
            nativeClickOpen = true;
        }
        if (dotaStatBranch.BHasClass("ShowStatBranchAsTooltip")) {
            nativeHoverOpen = true;
        }
        const parent = dotaStatBranch.GetParent();
        if (parent) {
            if (parent.BHasClass("ShowStatBranch"))
                nativeClickOpen = true;
            if (parent.BHasClass("ShowStatBranchAsTooltip"))
                nativeHoverOpen = true;
        }
        dotaStatBranch.style.opacity = "0";
        dotaStatBranch.hittest = false;
        dotaStatBranch.hittestchildren = false;
    }
    const hudElements = root.FindChildTraverse("HUDElements");
    if (hudElements) {
        if (hudElements.BHasClass("ShowStatBranch"))
            nativeClickOpen = true;
        if (hudElements.BHasClass("ShowStatBranchAsTooltip"))
            nativeHoverOpen = true;
    }
    const statBranchBtn = root.FindChildTraverse("StatBranch");
    if (statBranchBtn && statBranchBtn.BHasHoverStyle()) {
        nativeHoverOpen = true;
    }
    return { nativeClickOpen, nativeHoverOpen };
}
function hookPopupHover() {
    if (hookedPopupHover)
        return;
    const popup = $("#EvoTalentPopup");
    if (!popup)
        return;
    hookedPopupHover = true;
    popup.SetPanelEvent("onmouseover", () => {
        isHoveringPopup = true;
    });
    popup.SetPanelEvent("onmouseout", () => {
        isHoveringPopup = false;
    });
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
        isPinnedOpen = !isPinnedOpen;
    });
}
function getEffectiveRows() {
    const rows = latestData === null || latestData === void 0 ? void 0 : latestData.rows;
    if (!rows) {
        return [...FALLBACK_ROWS];
    }
    const indices = Object.keys(rows)
        .map((k) => parseInt(k, 10))
        .filter((n) => !isNaN(n))
        .sort((a, b) => a - b);
    if (indices.length === 0) {
        return [...FALLBACK_ROWS];
    }
    const list = [];
    for (const idx of indices) {
        const r = rows[String(idx)];
        if (r)
            list.push(r);
    }
    return list;
}
function renderTalentRows(force) {
    var _a, _b;
    const container = $("#EvoTalentRows");
    if (!container)
        return;
    const rows = getEffectiveRows();
    const heroLevel = (_a = latestData === null || latestData === void 0 ? void 0 : latestData.hero_level) !== null && _a !== void 0 ? _a : 1;
    const abilityPoints = (_b = latestData === null || latestData === void 0 ? void 0 : latestData.ability_points) !== null && _b !== void 0 ? _b : 0;
    const sig = `${heroLevel}:${abilityPoints}:${rows
        .map((r) => `${r.left_learned}${r.right_learned}`)
        .join("")}`;
    if (!force && sig === lastRenderSignature)
        return;
    lastRenderSignature = sig;
    container.RemoveAndDeleteChildren();
    for (let rowIdx = rows.length - 1; rowIdx >= 0; rowIdx--) {
        const row = rows[rowIdx];
        const leftLearned = row.left_learned === 1;
        const rightLearned = row.right_learned === 1;
        const rowUnlocked = heroLevel >= row.level;
        const canLearnMore = heroLevel >= 30 || (!leftLearned && !rightLearned);
        const leftAvail = rowUnlocked && abilityPoints > 0 && !leftLearned && canLearnMore;
        const rightAvail = rowUnlocked && abilityPoints > 0 && !rightLearned && canLearnMore;
        const rowActive = leftAvail || rightAvail;
        const rowPanel = $.CreatePanel("Panel", container, `EvoTalentRow_${rowIdx}`);
        rowPanel.AddClass("EvoTalentRow");
        rowPanel.SetHasClass("RowActive", rowActive);
        const leftDimmed = !leftLearned && rightLearned && heroLevel < 30;
        const rightDimmed = !rightLearned && leftLearned && heroLevel < 30;
        createBranchButton(rowPanel, rowIdx, "left", row.left_ability, leftLearned, leftAvail, leftDimmed);
        const circle = $.CreatePanel("Panel", rowPanel, "");
        circle.AddClass("EvoTalentLevelCircle");
        const lvlLabel = $.CreatePanel("Label", circle, "");
        lvlLabel.AddClass("EvoTalentLevelLabel");
        lvlLabel.text = String(row.level);
        createBranchButton(rowPanel, rowIdx, "right", row.right_ability, rightLearned, rightAvail, rightDimmed);
    }
}
function createBranchButton(parent, rowIdx, side, abilityName, learned, available, dimmed) {
    const btn = $.CreatePanel("Panel", parent, `EvoTalent_${rowIdx}_${side}`);
    btn.AddClass("EvoTalentBranch");
    btn.SetHasClass("Learned", learned);
    btn.SetHasClass("Available", available);
    btn.SetHasClass("Dimmed", dimmed);
    const lbl = $.CreatePanel("Label", btn, "");
    lbl.AddClass("EvoTalentBranchLabel");
    lbl.text = $.Localize(`#DOTA_Tooltip_ability_${abilityName}`);
    if (available) {
        btn.SetPanelEvent("onactivate", () => {
            var _a;
            GameEvents.SendCustomGameEventToServer("evo_learn_talent", {
                row: rowIdx,
                side,
            });
            if (((_a = latestData === null || latestData === void 0 ? void 0 : latestData.ability_points) !== null && _a !== void 0 ? _a : 0) <= 1) {
                isPinnedOpen = false;
            }
        });
    }
}
function refreshFromNetTable() {
    const localId = Players.GetLocalPlayer();
    const raw = CustomNetTables.GetTableValue("player_talents", String(localId));
    if (raw) {
        latestData = raw;
        if (lastRenderedVisible) {
            renderTalentRows(false);
        }
    }
}
function hasAvailableTalentPoint() {
    var _a, _b;
    const rows = getEffectiveRows();
    const heroLevel = (_a = latestData === null || latestData === void 0 ? void 0 : latestData.hero_level) !== null && _a !== void 0 ? _a : 1;
    const abilityPoints = (_b = latestData === null || latestData === void 0 ? void 0 : latestData.ability_points) !== null && _b !== void 0 ? _b : 0;
    if (abilityPoints <= 0)
        return false;
    for (const row of rows) {
        const leftLearned = row.left_learned === 1;
        const rightLearned = row.right_learned === 1;
        const canLearnMore = heroLevel >= 30 || (!leftLearned && !rightLearned);
        if (heroLevel >= row.level && (!leftLearned || !rightLearned) && canLearnMore) {
            return true;
        }
    }
    return false;
}
function updateStatBranchUpgradeIndicator() {
    const root = findHudRoot();
    if (!root)
        return;
    const statBranch = root.FindChildTraverse("StatBranch");
    if (!statBranch)
        return;
    const canUpgrade = hasAvailableTalentPoint();
    statBranch.SetHasClass("could_level_up", canUpgrade);
    statBranch.SetHasClass("show_level_up_tab", canUpgrade);
    statBranch.SetHasClass("show_level_up_frame", canUpgrade);
    const targets = [
        statBranch.FindChildTraverse("LevelUpTab"),
        statBranch.FindChildTraverse("LevelUpButton"),
        statBranch.FindChildTraverse("LevelUpIcon"),
        statBranch.FindChildTraverse("LevelUpLight"),
        statBranch.FindChildTraverse("UpgradeOverlay"),
        statBranch.FindChildTraverse("StatLevelUpTab"),
    ];
    const parent = statBranch.GetParent();
    if (parent && !parent.FindChildTraverse("abilities")) {
        parent.SetHasClass("could_level_up", canUpgrade);
        parent.SetHasClass("show_level_up_tab", canUpgrade);
        targets.push(parent.FindChildTraverse("LevelUpTab"), parent.FindChildTraverse("LevelUpButton"), parent.FindChildTraverse("LevelUpIcon"), parent.FindChildTraverse("LevelUpLight"), parent.FindChildTraverse("StatLevelUpTab"));
    }
    for (const panel of targets) {
        if (!panel)
            continue;
        panel.style.opacity = canUpgrade ? null : "0";
        panel.visible = canUpgrade;
    }
}
function periodicTick() {
    hookPopupHover();
    hookNativeStatBranch();
    updateStatBranchUpgradeIndicator();
    const { nativeClickOpen, nativeHoverOpen } = getNativeStatBranchState();
    const shouldShow = isPinnedOpen || nativeClickOpen || nativeHoverOpen || isHoveringPopup;
    const tooltipOnly = !isPinnedOpen && !nativeClickOpen && (nativeHoverOpen || isHoveringPopup);
    const popup = $("#EvoTalentPopup");
    if (popup) {
        popup.SetHasClass("Hidden", !shouldShow);
        popup.SetHasClass("TooltipMode", tooltipOnly);
        if (shouldShow && !lastRenderedVisible) {
            renderTalentRows(true);
        }
        else if (shouldShow) {
            renderTalentRows(false);
        }
        lastRenderedVisible = shouldShow;
    }
    $.Schedule(0.05, periodicTick);
}
CustomNetTables.SubscribeNetTableListener("player_talents", (_table, key, value) => {
    if (key === String(Players.GetLocalPlayer()) && value) {
        latestData = value;
        if (lastRenderedVisible) {
            renderTalentRows(false);
        }
    }
});
refreshFromNetTable();
periodicTick();
