"use strict";
(() => {
    const modal = $("#EvoDraftModal");
    const reopenBtn = $("#EvoDraftReopenBtn");
    const reopenLabel = $("#EvoDraftReopenLabel");
    const titleLabel = $("#EvoDraftTitle");
    const cardsContainer = $("#EvoDraftCards");
    const minimizeBtn = $("#EvoDraftMinimizeBtn");
    const rerollRow = $("#EvoDraftRerollRow");
    const rerollBtn = $("#EvoDraftRerollBtn");
    const rerollLabel = $("#EvoDraftRerollLabel");
    let minimized = false;
    let currentState = null;
    if (minimizeBtn) {
        minimizeBtn.SetPanelEvent("onactivate", () => {
            minimized = true;
            refreshVisibility();
        });
    }
    if (reopenBtn) {
        reopenBtn.SetPanelEvent("onactivate", () => {
            minimized = false;
            refreshVisibility();
        });
    }
    if (rerollBtn) {
        rerollBtn.SetPanelEvent("onactivate", () => {
            var _a;
            if (!currentState || currentState.pending_draft_type !== "MUTATION")
                return;
            if (((_a = currentState.mutation_rerolls) !== null && _a !== void 0 ? _a : 0) <= 0)
                return;
            GameEvents.SendCustomGameEventToServer("evo_reroll_mutation", {});
        });
    }
    function formatFallbackName(rawId) {
        return rawId
            .replace(/^evo_body_/, "")
            .replace(/^evo_mut_/, "")
            .replace(/_/g, " ")
            .toUpperCase();
    }
    function localizeOptionName(optionId, draftType) {
        if (draftType === "ABILITY") {
            const abilityToken = `#DOTA_Tooltip_ability_${optionId}`;
            const localizedAbility = $.Localize(abilityToken);
            if (localizedAbility !== abilityToken)
                return localizedAbility;
        }
        const token = `#${optionId}`;
        const localized = $.Localize(token);
        return localized !== token ? localized : formatFallbackName(optionId);
    }
    function localizeOptionDesc(optionId) {
        const token = `#${optionId}_desc`;
        const localized = $.Localize(token);
        return localized !== token ? localized : "";
    }
    function hasActiveDraft(data) {
        var _a;
        if (!data)
            return false;
        if (data.pending_draft_type !== "BODY" &&
            data.pending_draft_type !== "ABILITY" &&
            data.pending_draft_type !== "MUTATION") {
            return false;
        }
        const options = (_a = data.draft_options) !== null && _a !== void 0 ? _a : {};
        return Object.keys(options).length > 0;
    }
    function refreshVisibility() {
        const active = hasActiveDraft(currentState);
        if (modal) {
            modal.SetHasClass("Visible", active && !minimized);
        }
        if (reopenBtn) {
            reopenBtn.SetHasClass("Visible", active && minimized);
        }
    }
    function getHeaderToken(draftType) {
        if (draftType === "BODY")
            return "#evo_draft_body_title";
        if (draftType === "ABILITY")
            return "#evo_draft_ability_title";
        return "#evo_draft_mutation_title";
    }
    function renderDraft(data) {
        var _a, _b, _c, _d, _e, _f, _g;
        currentState = data !== null && data !== void 0 ? data : null;
        if (!cardsContainer)
            return;
        cardsContainer.RemoveAndDeleteChildren();
        if (!hasActiveDraft(currentState) || !currentState || !currentState.pending_draft_type) {
            minimized = false;
            refreshVisibility();
            return;
        }
        const draftType = currentState.pending_draft_type;
        const headerToken = getHeaderToken(draftType);
        if (titleLabel) {
            titleLabel.text = $.Localize(headerToken);
        }
        if (reopenLabel) {
            reopenLabel.text = $.Localize(headerToken);
        }
        const isMutationDraft = draftType === "MUTATION";
        const rerollsLeft = Math.max(0, (_a = currentState.mutation_rerolls) !== null && _a !== void 0 ? _a : 0);
        if (rerollRow) {
            rerollRow.SetHasClass("Visible", isMutationDraft);
        }
        if (rerollBtn) {
            rerollBtn.SetHasClass("Disabled", rerollsLeft <= 0);
            rerollBtn.enabled = isMutationDraft && rerollsLeft > 0;
        }
        if (rerollLabel) {
            rerollLabel.text = $.Localize("#evo_draft_reroll_btn").replace("{count}", String(rerollsLeft));
        }
        const rawOptions = (_b = currentState.draft_options) !== null && _b !== void 0 ? _b : {};
        const metaMap = (_c = currentState.draft_meta) !== null && _c !== void 0 ? _c : {};
        const sortedKeys = Object.keys(rawOptions).sort((a, b) => Number(a) - Number(b));
        const selectText = $.Localize("#DOTA_Hero_Selection_Select") !== "#DOTA_Hero_Selection_Select"
            ? $.Localize("#DOTA_Hero_Selection_Select")
            : "ВЫБРАТЬ";
        for (let i = 0; i < sortedKeys.length; i++) {
            const optionId = rawOptions[sortedKeys[i]];
            if (!optionId)
                continue;
            const optionIndex = i;
            const card = $.CreatePanel("Button", cardsContainer, "");
            card.AddClass("EvoDraftOptionCard");
            const meta = metaMap[optionId];
            if (draftType === "BODY" && meta && meta.hero_class && meta.hero_class.length > 0) {
                const banner = $.CreatePanel("Panel", card, "");
                banner.AddClass("EvoDraftHeroBanner");
                const heroImg = $.CreatePanel("DOTAHeroImage", banner, "");
                heroImg.AddClass("EvoDraftHeroImage");
                heroImg.heroimagestyle = "landscape";
                heroImg.heroname = meta.hero_class;
                const vignette = $.CreatePanel("Panel", banner, "");
                vignette.AddClass("EvoDraftHeroVignette");
                if (meta.attr === "STR" ||
                    meta.attr === "AGI" ||
                    meta.attr === "INT" ||
                    meta.attr === "ALL") {
                    const attrBadge = $.CreatePanel("Panel", banner, "");
                    attrBadge.AddClass("EvoDraftAttrBadge");
                    const attrIcon = $.CreatePanel("Panel", attrBadge, "");
                    attrIcon.AddClass("EvoDraftAttrIcon");
                    attrIcon.AddClass(meta.attr);
                }
                const bannerName = $.CreatePanel("Label", banner, "");
                bannerName.AddClass("EvoDraftBannerName");
                bannerName.text = localizeOptionName(optionId, draftType);
                const body = $.CreatePanel("Panel", card, "");
                body.AddClass("EvoDraftCardBody");
                if (meta.attr) {
                    const roleStrip = $.CreatePanel("Panel", body, "");
                    roleStrip.AddClass("EvoDraftRoleStrip");
                    const attrLocToken = `#evo_attr_${meta.attr}`;
                    const attrLoc = $.Localize(attrLocToken);
                    const attrLbl = $.CreatePanel("Label", roleStrip, "");
                    attrLbl.AddClass("EvoDraftRoleAttr");
                    attrLbl.AddClass(meta.attr);
                    attrLbl.text = attrLoc !== attrLocToken ? attrLoc : meta.attr;
                    if (meta.ms !== undefined) {
                        const msLbl = $.CreatePanel("Label", roleStrip, "");
                        msLbl.AddClass("EvoDraftRoleStats");
                        msLbl.text = `${(_d = meta.str) !== null && _d !== void 0 ? _d : 0} / ${(_e = meta.agi) !== null && _e !== void 0 ? _e : 0} / ${(_f = meta.int) !== null && _f !== void 0 ? _f : 0} · ${meta.ms} MS`;
                    }
                }
                if (meta.abilities) {
                    const abKeys = Object.keys(meta.abilities).sort((a, b) => Number(a) - Number(b));
                    if (abKeys.length > 0) {
                        const skillRow = $.CreatePanel("Panel", body, "");
                        skillRow.AddClass("EvoDraftSkillRow");
                        for (let k = 0; k < abKeys.length; k++) {
                            const abName = meta.abilities[abKeys[k]];
                            if (!abName)
                                continue;
                            const wrap = $.CreatePanel("Panel", skillRow, "");
                            wrap.AddClass("EvoDraftMiniAbilityWrap");
                            if (k === abKeys.length - 1 && abKeys.length >= 3) {
                                wrap.AddClass("Innate");
                            }
                            const abImg = $.CreatePanel("DOTAAbilityImage", wrap, "");
                            abImg.AddClass("EvoDraftMiniAbilityIcon");
                            abImg.abilityname = abName;
                            wrap.SetPanelEvent("onmouseover", () => {
                                $.DispatchEvent("DOTAShowAbilityTooltip", wrap, abName);
                            });
                            wrap.SetPanelEvent("onmouseout", () => {
                                $.DispatchEvent("DOTAHideAbilityTooltip", wrap);
                            });
                        }
                    }
                }
                const descText = localizeOptionDesc(optionId);
                if (descText.length > 0) {
                    const descBox = $.CreatePanel("Panel", body, "");
                    descBox.AddClass("EvoDraftDescBox");
                    const lines = descText
                        .split(/\r?\n|\\n/)
                        .map((s) => s.trim())
                        .filter((s) => s.length > 0);
                    for (let li = 0; li < lines.length; li++) {
                        const lineLbl = $.CreatePanel("Label", descBox, "");
                        lineLbl.AddClass(li === 0 ? "EvoDraftDescLead" : "EvoDraftDescLine");
                        lineLbl.text = lines[li];
                    }
                }
                const footer = $.CreatePanel("Panel", body, "");
                footer.AddClass("EvoDraftSelectFooter");
                const selectLbl = $.CreatePanel("Label", footer, "");
                selectLbl.AddClass("EvoDraftSelectLabel");
                selectLbl.text = selectText;
            }
            else {
                const body = $.CreatePanel("Panel", card, "");
                body.AddClass("EvoDraftCardBody");
                if (draftType === "ABILITY") {
                    const iconWrap = $.CreatePanel("Panel", body, "");
                    iconWrap.AddClass("EvoDraftAbilityIconWrap");
                    const icon = $.CreatePanel("DOTAAbilityImage", iconWrap, "");
                    icon.AddClass("EvoDraftAbilityIcon");
                    icon.abilityname = optionId;
                    card.SetPanelEvent("onmouseover", () => {
                        $.DispatchEvent("DOTAShowAbilityTooltip", card, optionId);
                    });
                    card.SetPanelEvent("onmouseout", () => {
                        $.DispatchEvent("DOTAHideAbilityTooltip", card);
                    });
                }
                else if (draftType === "MUTATION") {
                    const iconName = (meta === null || meta === void 0 ? void 0 : meta.icon) && meta.icon.length > 0 ? meta.icon : "alchemist_chemical_rage";
                    const iconWrap = $.CreatePanel("Panel", body, "");
                    iconWrap.AddClass("EvoDraftAbilityIconWrap");
                    const icon = $.CreatePanel("DOTAAbilityImage", iconWrap, "");
                    icon.AddClass("EvoDraftAbilityIcon");
                    icon.abilityname = iconName;
                }
                const nameLabel = $.CreatePanel("Label", body, "");
                nameLabel.AddClass("EvoDraftOptionName");
                nameLabel.text = localizeOptionName(optionId, draftType);
                if (draftType !== "ABILITY") {
                    const descText = localizeOptionDesc(optionId);
                    if (descText.length > 0) {
                        const descLabel = $.CreatePanel("Label", body, "");
                        descLabel.AddClass("EvoDraftOptionDesc");
                        descLabel.text = descText;
                    }
                }
                const footer = $.CreatePanel("Panel", body, "");
                footer.AddClass("EvoDraftSelectFooter");
                const selectLbl = $.CreatePanel("Label", footer, "");
                selectLbl.AddClass("EvoDraftSelectLabel");
                selectLbl.text = selectText;
            }
            const mutationSlot = (_g = currentState.pending_mutation_slot) !== null && _g !== void 0 ? _g : 0;
            card.SetPanelEvent("onactivate", () => {
                $.DispatchEvent("DOTAHideAbilityTooltip", card);
                if (draftType === "BODY") {
                    GameEvents.SendCustomGameEventToServer("evo_select_body_draft", {
                        option_index: optionIndex,
                    });
                }
                else if (draftType === "ABILITY") {
                    GameEvents.SendCustomGameEventToServer("evo_select_ability_draft", {
                        option_index: optionIndex,
                    });
                }
                else {
                    GameEvents.SendCustomGameEventToServer("evo_select_mutation", {
                        slot: mutationSlot,
                        option_index: optionIndex,
                    });
                }
            });
        }
        refreshVisibility();
    }
    const localKey = String(Players.GetLocalPlayer());
    CustomNetTables.SubscribeNetTableListener("player_evo", (_table, key, data) => {
        if (key === localKey) {
            renderDraft(data);
        }
    });
    renderDraft(CustomNetTables.GetTableValue("player_evo", localKey));
})();
