"use strict";
(() => {
    const button = $("#EvoFountainTeleportBtn");
    let latestMap = null;
    let isButtonActive = false;
    let isHovered = false;
    let positionedKey = "";
    function getHudRoot() {
        let current = $.GetContextPanel();
        while (current && current.GetParent()) {
            current = current.GetParent();
        }
        return current;
    }
    function findPanelByType(panel, panelType) {
        if (!panel || !panel.IsValid())
            return null;
        if (panel.paneltype === panelType)
            return panel;
        const count = panel.GetChildCount();
        for (let i = 0; i < count; i++) {
            const hit = findPanelByType(panel.GetChild(i), panelType);
            if (hit)
                return hit;
        }
        return null;
    }
    function findPanelByClass(panel, className) {
        if (!panel || !panel.IsValid())
            return null;
        if (panel.BHasClass(className))
            return panel;
        const count = panel.GetChildCount();
        for (let i = 0; i < count; i++) {
            const hit = findPanelByClass(panel.GetChild(i), className);
            if (hit)
                return hit;
        }
        return null;
    }
    function hasValidSize(panel) {
        return (panel !== null &&
            panel.IsValid() &&
            panel.IsSizeValid() &&
            panel.actuallayoutwidth > 8 &&
            panel.actuallayoutheight > 8);
    }
    function maskTormentorInner(tormentor, contents) {
        if (tormentor && tormentor.IsValid()) {
            tormentor.hittest = false;
            tormentor.hittestchildren = false;
            for (const id of [
                "TormentorIconBackground",
                "TormentorIcon",
                "TormentorTimerRadial",
                "RoshanTimerText",
            ]) {
                const child = tormentor.FindChildTraverse(id);
                if (child && child.IsValid()) {
                    child.style.opacity = "0";
                    child.hittest = false;
                }
            }
        }
        if (contents && contents.IsValid()) {
            contents.hittest = false;
            contents.hittestchildren = false;
            const count = contents.GetChildCount();
            for (let i = 0; i < count; i++) {
                const child = contents.GetChild(i);
                if (child && child.IsValid()) {
                    child.style.opacity = "0";
                    child.hittest = false;
                }
            }
        }
    }
    function alignToTormentorSlot() {
        var _a, _b, _c;
        if (!button || !button.IsValid() || !button.IsSizeValid())
            return;
        const root = getHudRoot();
        if (!root)
            return;
        const tormentor = (_b = (_a = findPanelByType(root, "DOTATormentorTimer")) !== null && _a !== void 0 ? _a : root.FindChildTraverse("TormentorTimer")) !== null && _b !== void 0 ? _b : root.FindChildTraverse("TormentorTimerContainer");
        const contents = tormentor ? findPanelByClass(tormentor, "TormentorTimerContents") : null;
        maskTormentorInner(tormentor, contents);
        const scaleX = button.actualuiscale_x > 0 ? button.actualuiscale_x : 1;
        const scaleY = button.actualuiscale_y > 0 ? button.actualuiscale_y : 1;
        let targetX = 0;
        let targetY = 0;
        let targetSize = 42;
        if (hasValidSize(contents)) {
            const cPos = contents.GetPositionWithinWindow();
            targetX = cPos.x / scaleX;
            targetY = cPos.y / scaleY;
            targetSize = contents.actuallayoutwidth / scaleX;
        }
        else if (hasValidSize(tormentor)) {
            const tPos = tormentor.GetPositionWithinWindow();
            targetX = tPos.x / scaleX + 6;
            targetY = tPos.y / scaleY + 4;
            targetSize = 42;
        }
        else {
            const radar = (_c = findPanelByType(root, "DOTARadarButton")) !== null && _c !== void 0 ? _c : root.FindChildTraverse("RadarButton");
            if (!hasValidSize(radar))
                return;
            const rPos = radar.GetPositionWithinWindow();
            targetX = rPos.x / scaleX;
            targetY = rPos.y / scaleY - 56;
            targetSize = 42;
        }
        const key = `${targetX.toFixed(1)}:${targetY.toFixed(1)}:${targetSize.toFixed(1)}`;
        if (key !== positionedKey) {
            positionedKey = key;
            button.style.marginLeft = `${targetX.toFixed(1)}px`;
            button.style.marginTop = `${targetY.toFixed(1)}px`;
            button.style.width = `${targetSize.toFixed(1)}px`;
            button.style.height = `${targetSize.toFixed(1)}px`;
        }
    }
    function showTooltip() {
        if (!button || !button.IsValid())
            return;
        const title = $.Localize("#evo_fountain_teleport_tooltip_title");
        const bodyToken = isButtonActive
            ? "#evo_fountain_teleport_tooltip_body_active"
            : "#evo_fountain_teleport_tooltip_body_inactive";
        const body = $.Localize(bodyToken);
        $.DispatchEvent("DOTAShowTitleTextTooltip", button, title, body);
    }
    function updateVisibility() {
        if (!button || !button.IsValid())
            return;
        const localPlayer = Players.GetLocalPlayer();
        const entry = latestMap ? latestMap[String(localPlayer)] : undefined;
        const heroEnt = Players.GetPlayerHeroEntityIndex(localPlayer);
        const heroAlive = heroEnt !== -1 && Entities.IsAlive(heroEnt);
        const onFountain = (entry === null || entry === void 0 ? void 0 : entry.on_fountain) === true || (entry === null || entry === void 0 ? void 0 : entry.on_fountain) === 1;
        const nextActive = onFountain && heroAlive;
        const changed = nextActive !== isButtonActive;
        isButtonActive = nextActive;
        button.SetHasClass("Active", isButtonActive);
        if (changed && isHovered) {
            showTooltip();
        }
    }
    if (button) {
        button.SetPanelEvent("onactivate", () => {
            if (!isButtonActive)
                return;
            GameEvents.SendCustomGameEventToServer("evo_fountain_teleport", {});
        });
        button.SetPanelEvent("onmouseover", () => {
            isHovered = true;
            showTooltip();
        });
        button.SetPanelEvent("onmouseout", () => {
            isHovered = false;
            if (!button.IsValid())
                return;
            $.DispatchEvent("DOTAHideTitleTextTooltip", button);
        });
    }
    CustomNetTables.SubscribeNetTableListener("match_state", (_table, key, data) => {
        if (key === "fountains") {
            latestMap = data;
            updateVisibility();
        }
    });
    latestMap = CustomNetTables.GetTableValue("match_state", "fountains");
    updateVisibility();
    function periodicSync() {
        if (!latestMap) {
            latestMap = CustomNetTables.GetTableValue("match_state", "fountains");
        }
        alignToTormentorSlot();
        updateVisibility();
        $.Schedule(0.25, periodicSync);
    }
    periodicSync();
})();
