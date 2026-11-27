interface TalentRowData {
    level: number;
    left_ability: string;
    right_ability: string;
    left_learned: number;
    right_learned: number;
}

interface PlayerTalentsData {
    hero_level?: number;
    ability_points?: number;
    rows?: Record<string, TalentRowData>;
}

const FALLBACK_ROWS: readonly TalentRowData[] = [
    { level: 10, left_ability: "special_bonus_evo_agi_int_1", right_ability: "special_bonus_evo_int_str_1", left_learned: 0, right_learned: 0 },
    { level: 15, left_ability: "special_bonus_evo_hp_100", right_ability: "special_bonus_evo_mana_125", left_learned: 0, right_learned: 0 },
    { level: 20, left_ability: "special_bonus_evo_ms_25", right_ability: "special_bonus_evo_armor_6", left_learned: 0, right_learned: 0 },
    { level: 25, left_ability: "special_bonus_evo_all_stats_5", right_ability: "special_bonus_evo_magic_resist_15", left_learned: 0, right_learned: 0 },
    { level: 30, left_ability: "special_bonus_evo_hp_regen_15", right_ability: "special_bonus_evo_mana_regen_75", left_learned: 0, right_learned: 0 },
    { level: 35, left_ability: "special_bonus_evo_damage_75", right_ability: "special_bonus_evo_spell_amp_28", left_learned: 0, right_learned: 0 },
];

let isPinnedOpen = false;
let isHoveringPopup = false;
let isHoveringLevelTab = false;
let latestData: PlayerTalentsData | undefined;
let hookedStatBranch = false;
let hookedPopupHover = false;
const hookedLevelTabs = new Set<Panel>();
let lastRenderedVisible = false;
let lastRenderSignature = "";

function findHudRoot(): Panel | null {
    let cur: Panel | null = $.GetContextPanel();
    while (cur && cur.GetParent()) {
        cur = cur.GetParent();
    }
    return cur;
}

function collectPanelsByType(root: Panel | null, panelType: string, out: Panel[] = []): Panel[] {
    if (!root) return out;
    if (root.paneltype === panelType) {
        out.push(root);
    }
    const children = root.Children();
    for (let i = 0; i < children.length; i++) {
        collectPanelsByType(children[i], panelType, out);
    }
    return out;
}

function findLevelStatsFrames(root: Panel): Panel[] {
    const frames: Panel[] = [];
    const seen = new Set<Panel>();
    const pushUnique = (panel: Panel | null | undefined): void => {
        if (panel && !seen.has(panel)) {
            seen.add(panel);
            frames.push(panel);
        }
    };

    pushUnique(root.FindChildTraverse("level_stats_frame"));

    const centerBlock = root.FindChildTraverse("center_block");
    if (centerBlock) {
        for (const frame of collectPanelsByType(centerBlock, "DOTAHUDLevelStatsFrame")) {
            pushUnique(frame);
        }
    }

    const queryUnit = root.FindChildTraverse("QueryUnit");
    if (queryUnit) {
        for (const frame of collectPanelsByType(queryUnit, "DOTAHUDLevelStatsFrame")) {
            pushUnique(frame);
        }
    }

    if (frames.length === 0) {
        for (const frame of collectPanelsByType(root, "DOTAHUDLevelStatsFrame")) {
            pushUnique(frame);
        }
    }

    return frames;
}

function getEffectiveHeroState(): {
    heroLevel: number;
    abilityPoints: number;
    canControlSelectedHero: boolean;
} {
    const localId = Players.GetLocalPlayer();
    const localHero = Players.GetPlayerHeroEntityIndex(localId);
    const hasValidHero = localHero !== -1 && Entities.IsValidEntity(localHero);
    const portrait = Players.GetLocalPlayerPortraitUnit();
    const isOwnHeroSelected = hasValidHero && (portrait === -1 || portrait === localHero);

    const heroLevel = hasValidHero ? Entities.GetLevel(localHero) : (latestData?.hero_level ?? 1);
    const abilityPoints = hasValidHero ? Entities.GetAbilityPoints(localHero) : (latestData?.ability_points ?? 0);
    const canControlSelectedHero = hasValidHero && isOwnHeroSelected && Entities.IsAlive(localHero);

    return { heroLevel, abilityPoints, canControlSelectedHero };
}

function getNativeStatBranchState(): { nativeClickOpen: boolean; nativeHoverOpen: boolean } {
    const root = findHudRoot();
    if (!root) return { nativeClickOpen: false, nativeHoverOpen: false };

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
            if (parent.BHasClass("ShowStatBranch")) nativeClickOpen = true;
            if (parent.BHasClass("ShowStatBranchAsTooltip")) nativeHoverOpen = true;
        }
        dotaStatBranch.style.opacity = "0";
        dotaStatBranch.hittest = false;
        dotaStatBranch.hittestchildren = false;
    }

    const hudElements = root.FindChildTraverse("HUDElements");
    if (hudElements) {
        if (hudElements.BHasClass("ShowStatBranch")) nativeClickOpen = true;
        if (hudElements.BHasClass("ShowStatBranchAsTooltip")) nativeHoverOpen = true;
    }

    const statBranchBtn = root.FindChildTraverse("StatBranch");
    if (statBranchBtn && statBranchBtn.BHasHoverStyle()) {
        nativeHoverOpen = true;
    }

    return { nativeClickOpen, nativeHoverOpen };
}

function hookPopupHover(): void {
    if (hookedPopupHover) return;
    const popup = $("#EvoTalentPopup");
    if (!popup) return;
    hookedPopupHover = true;

    popup.SetPanelEvent("onmouseover", () => {
        isHoveringPopup = true;
    });
    popup.SetPanelEvent("onmouseout", () => {
        isHoveringPopup = false;
    });
}

function closeNativeStatBranchClasses(): void {
    const root = findHudRoot();
    if (!root) return;
    const dotaStatBranch = root.FindChildTraverse("DOTAStatBranch");
    if (dotaStatBranch) {
        dotaStatBranch.RemoveClass("ShowStatBranch");
        dotaStatBranch.RemoveClass("ShowStatBranchAsTooltip");
        const parent = dotaStatBranch.GetParent();
        if (parent) {
            parent.RemoveClass("ShowStatBranch");
            parent.RemoveClass("ShowStatBranchAsTooltip");
        }
    }
    const hudElements = root.FindChildTraverse("HUDElements");
    if (hudElements) {
        hudElements.RemoveClass("ShowStatBranch");
        hudElements.RemoveClass("ShowStatBranchAsTooltip");
    }
}

function togglePopupFromButton(): void {
    const nextOpen = !lastRenderedVisible;
    isPinnedOpen = nextOpen;
    if (!nextOpen) {
        isHoveringLevelTab = false;
        isHoveringPopup = false;
        $.Schedule(0.01, closeNativeStatBranchClasses);
    }
}

function hookNativeStatBranch(): void {
    if (hookedStatBranch) return;
    const root = findHudRoot();
    if (!root) return;
    const statBranch = root.FindChildTraverse("StatBranch");
    if (!statBranch) return;

    hookedStatBranch = true;
    statBranch.SetPanelEvent("onactivate", () => {
        togglePopupFromButton();
    });
}

function getEffectiveRows(): TalentRowData[] {
    const rows = latestData?.rows;
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
    const list: TalentRowData[] = [];
    for (const idx of indices) {
        const r = rows[String(idx)];
        if (r) list.push(r);
    }
    return list;
}

function renderTalentRows(force: boolean): void {
    const container = $("#EvoTalentRows");
    if (!container) return;

    const rows = getEffectiveRows();
    const { heroLevel, abilityPoints } = getEffectiveHeroState();

    const sig = `${heroLevel}:${abilityPoints}:${rows
        .map((r) => `${r.left_learned}${r.right_learned}`)
        .join("")}`;
    if (!force && sig === lastRenderSignature) return;
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

function createBranchButton(
    parent: Panel,
    rowIdx: number,
    side: "left" | "right",
    abilityName: string,
    learned: boolean,
    available: boolean,
    dimmed: boolean
): void {
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
            GameEvents.SendCustomGameEventToServer("evo_learn_talent" as never, {
                row: rowIdx,
                side,
            } as never);
            const { abilityPoints } = getEffectiveHeroState();
            if (abilityPoints <= 1 || !hasAvailableTalentPoint(rowIdx)) {
                isPinnedOpen = false;
                isHoveringLevelTab = false;
                isHoveringPopup = false;
                closeNativeStatBranchClasses();
            }
            updateStatBranchUpgradeIndicator();
        });
    }
}

function refreshFromNetTable(): void {
    const localId = Players.GetLocalPlayer();
    const raw = CustomNetTables.GetTableValue("player_talents" as never, String(localId)) as unknown as
        | PlayerTalentsData
        | undefined;
    if (raw) {
        latestData = raw;
        if (lastRenderedVisible) {
            renderTalentRows(false);
        }
    }
    updateStatBranchUpgradeIndicator();
}

function hasAvailableTalentPoint(ignoreRowIdx?: number): boolean {
    const rows = getEffectiveRows();
    const { heroLevel, abilityPoints, canControlSelectedHero } = getEffectiveHeroState();
    const effectivePoints = ignoreRowIdx !== undefined ? abilityPoints - 1 : abilityPoints;
    if (!canControlSelectedHero || effectivePoints <= 0) return false;
    for (let i = 0; i < rows.length; i++) {
        if (i === ignoreRowIdx) continue;
        const row = rows[i];
        const leftLearned = row.left_learned === 1;
        const rightLearned = row.right_learned === 1;
        const canLearnMore = heroLevel >= 30 || (!leftLearned && !rightLearned);
        if (heroLevel >= row.level && (!leftLearned || !rightLearned) && canLearnMore) {
            return true;
        }
    }
    return false;
}

function hookLevelTabPanel(panel: Panel | null | undefined): void {
    if (!panel || hookedLevelTabs.has(panel)) return;
    hookedLevelTabs.add(panel);
    panel.SetPanelEvent("onactivate", () => {
        if (hasAvailableTalentPoint()) {
            togglePopupFromButton();
        }
    });
    panel.SetPanelEvent("onmouseover", () => {
        if (hasAvailableTalentPoint()) {
            isHoveringLevelTab = true;
        }
    });
    panel.SetPanelEvent("onmouseout", () => {
        isHoveringLevelTab = false;
    });
}

function setOverlayControlState(
    panel: Panel | null | undefined,
    shown: boolean,
    clickable: boolean,
    opacityWhenShown: string | null = "1"
): void {
    if (!panel) return;
    panel.visible = shown;
    panel.style.visibility = shown ? "visible" : "collapse";
    panel.style.opacity = shown ? opacityWhenShown : "0";
    panel.hittest = shown && clickable;
    panel.hittestchildren = shown && clickable;
}

function updateStatBranchUpgradeIndicator(): void {
    const root = findHudRoot();
    if (!root) return;
    const canUpgrade = hasAvailableTalentPoint();
    if (!canUpgrade) {
        isHoveringLevelTab = false;
    }

    const statBranch = root.FindChildTraverse("StatBranch");
    if (statBranch) {
        statBranch.SetHasClass("could_level_up", canUpgrade);
        statBranch.SetHasClass("show_level_up_tab", canUpgrade);
        statBranch.SetHasClass("show_level_up_frame", canUpgrade);
        statBranch.SetHasClass("CanLevelStats", canUpgrade);
        statBranch.SetHasClass("SkillUpgradable", canUpgrade);
        setOverlayControlState(statBranch.FindChildTraverse("LevelUpTab"), canUpgrade, true);
        setOverlayControlState(statBranch.FindChildTraverse("LevelUpButton"), canUpgrade, true);
        setOverlayControlState(statBranch.FindChildTraverse("LevelUpIcon"), canUpgrade, false);
        setOverlayControlState(statBranch.FindChildTraverse("LevelUpLight"), canUpgrade, false, null);
        setOverlayControlState(statBranch.FindChildTraverse("UpgradeOverlay"), canUpgrade, false, null);
        setOverlayControlState(statBranch.FindChildTraverse("StatLevelUpTab"), canUpgrade, true);
    }

    const frames = findLevelStatsFrames(root);
    for (const frame of frames) {
        const levelUpTab = frame.FindChildTraverse("LevelUpTab");
        const levelUpButton = frame.FindChildTraverse("LevelUpButton");
        hookLevelTabPanel(levelUpTab);
        hookLevelTabPanel(levelUpButton);

        frame.SetHasClass("CanLevelStats", canUpgrade);
        frame.SetHasClass("SkillUpgradable", canUpgrade);
        frame.SetHasClass("AbilityLearnMode", false);
        frame.visible = canUpgrade;
        frame.style.visibility = canUpgrade ? "visible" : "collapse";
        frame.style.opacity = canUpgrade ? "1" : "0";
        frame.hittest = false;
        frame.hittestchildren = canUpgrade;

        setOverlayControlState(levelUpTab, canUpgrade, true);
        setOverlayControlState(levelUpButton, canUpgrade, true);
        setOverlayControlState(frame.FindChildTraverse("LevelUpIcon"), canUpgrade, false);
        setOverlayControlState(frame.FindChildTraverse("LevelUpBurstFX"), canUpgrade, false, null);
        setOverlayControlState(frame.FindChildTraverse("LevelUpGlow"), canUpgrade, false, null);
        setOverlayControlState(frame.FindChildTraverse("ButtonWell"), canUpgrade, false, null);
        setOverlayControlState(frame.FindChildTraverse("LearnModeButton"), false, false);
        setOverlayControlState(frame.FindChildTraverse("RecommendedUpgradeOverlay"), canUpgrade, false, null);
    }
}

function periodicTick(): void {
    hookPopupHover();
    hookNativeStatBranch();
    updateStatBranchUpgradeIndicator();
    const { nativeClickOpen, nativeHoverOpen } = getNativeStatBranchState();
    const shouldShow = isPinnedOpen || nativeClickOpen || nativeHoverOpen || isHoveringPopup || isHoveringLevelTab;
    const tooltipOnly = !isPinnedOpen && !nativeClickOpen && (nativeHoverOpen || isHoveringPopup || isHoveringLevelTab);

    const popup = $("#EvoTalentPopup");
    if (popup) {
        popup.SetHasClass("Hidden", !shouldShow);
        popup.SetHasClass("TooltipMode", tooltipOnly);
        if (shouldShow && !lastRenderedVisible) {
            renderTalentRows(true);
        } else if (shouldShow) {
            renderTalentRows(false);
        }
        lastRenderedVisible = shouldShow;
    }

    $.Schedule(0.05, periodicTick);
}

CustomNetTables.SubscribeNetTableListener("player_talents" as never, (_table, key, value) => {
    if (key === String(Players.GetLocalPlayer()) && value) {
        latestData = value as PlayerTalentsData;
        updateStatBranchUpgradeIndicator();
        if (lastRenderedVisible) {
            renderTalentRows(false);
        }
    }
});

GameEvents.Subscribe("dota_player_gained_level" as never, () => {
    updateStatBranchUpgradeIndicator();
    if (lastRenderedVisible) {
        renderTalentRows(false);
    }
});

GameEvents.Subscribe("dota_player_learned_ability" as never, () => {
    updateStatBranchUpgradeIndicator();
    if (lastRenderedVisible) {
        renderTalentRows(false);
    }
});

refreshFromNetTable();
periodicTick();
