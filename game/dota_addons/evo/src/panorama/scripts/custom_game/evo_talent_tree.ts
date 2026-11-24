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
let latestData: PlayerTalentsData | undefined;
let hookedStatBranch = false;
let hookedPopupHover = false;
let lastRenderedVisible = false;
let lastRenderSignature = "";

function findHudRoot(): Panel | null {
    let cur: Panel | null = $.GetContextPanel();
    while (cur && cur.GetParent()) {
        cur = cur.GetParent();
    }
    return cur;
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

function hookNativeStatBranch(): void {
    if (hookedStatBranch) return;
    const root = findHudRoot();
    if (!root) return;
    const statBranch = root.FindChildTraverse("StatBranch");
    if (!statBranch) return;

    hookedStatBranch = true;
    statBranch.SetPanelEvent("onactivate", () => {
        isPinnedOpen = !isPinnedOpen;
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
    const heroLevel = latestData?.hero_level ?? 1;
    const abilityPoints = latestData?.ability_points ?? 0;

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
            if ((latestData?.ability_points ?? 0) <= 1) {
                isPinnedOpen = false;
            }
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
}

function periodicTick(): void {
    hookPopupHover();
    hookNativeStatBranch();
    const { nativeClickOpen, nativeHoverOpen } = getNativeStatBranchState();
    const shouldShow = isPinnedOpen || nativeClickOpen || nativeHoverOpen || isHoveringPopup;
    const tooltipOnly = !isPinnedOpen && !nativeClickOpen && (nativeHoverOpen || isHoveringPopup);

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
        if (lastRenderedVisible) {
            renderTalentRows(false);
        }
    }
});

refreshFromNetTable();
periodicTick();
