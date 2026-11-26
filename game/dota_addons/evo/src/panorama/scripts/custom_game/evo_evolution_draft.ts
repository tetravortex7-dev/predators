(() => {
    interface DraftBodyMeta {
        hero_class?: string;
        attr?: string;
        abilities?: Record<string, string>;
        ms?: number;
        str?: number;
        agi?: number;
        int?: number;
        tier_index?: number;
        icon?: string;
    }

    interface PlayerEvoNetPayload {
        pending_draft_type?: string;
        pending_mutation_slot?: number;
        mutation_rerolls?: number;
        draft_options?: Record<string, string>;
        draft_meta?: Record<string, DraftBodyMeta>;
    }

    const modal = $("#EvoDraftModal");
    const reopenBtn = $("#EvoDraftReopenBtn");
    const reopenLabel = $("#EvoDraftReopenLabel") as LabelPanel | null;
    const titleLabel = $("#EvoDraftTitle") as LabelPanel | null;
    const cardsContainer = $("#EvoDraftCards");
    const minimizeBtn = $("#EvoDraftMinimizeBtn");
    const rerollRow = $("#EvoDraftRerollRow");
    const rerollBtn = $("#EvoDraftRerollBtn") as Button | null;
    const rerollLabel = $("#EvoDraftRerollLabel") as LabelPanel | null;

    let minimized = false;
    let currentState: PlayerEvoNetPayload | null = null;

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
            if (!currentState || currentState.pending_draft_type !== "MUTATION") return;
            if ((currentState.mutation_rerolls ?? 0) <= 0) return;
            GameEvents.SendCustomGameEventToServer("evo_reroll_mutation" as never, {} as never);
        });
    }

    function formatFallbackName(rawId: string): string {
        return rawId
            .replace(/^evo_body_/, "")
            .replace(/^evo_mut_/, "")
            .replace(/_/g, " ")
            .toUpperCase();
    }

    function localizeOptionName(optionId: string, draftType: string): string {
        if (draftType === "ABILITY") {
            const abilityToken = `#DOTA_Tooltip_ability_${optionId}`;
            const localizedAbility = $.Localize(abilityToken);
            if (localizedAbility !== abilityToken) return localizedAbility;
        }
        const token = `#${optionId}`;
        const localized = $.Localize(token);
        return localized !== token ? localized : formatFallbackName(optionId);
    }

    function localizeOptionDesc(optionId: string): string {
        const token = `#${optionId}_desc`;
        const localized = $.Localize(token);
        return localized !== token ? localized : "";
    }

    function hasActiveDraft(data: PlayerEvoNetPayload | null): boolean {
        if (!data) return false;
        if (
            data.pending_draft_type !== "BODY" &&
            data.pending_draft_type !== "ABILITY" &&
            data.pending_draft_type !== "MUTATION"
        ) {
            return false;
        }
        const options = data.draft_options ?? {};
        return Object.keys(options).length > 0;
    }

    function refreshVisibility(): void {
        const active = hasActiveDraft(currentState);
        if (modal) {
            modal.SetHasClass("Visible", active && !minimized);
        }
        if (reopenBtn) {
            reopenBtn.SetHasClass("Visible", active && minimized);
        }
    }

    function getHeaderToken(draftType: string): string {
        if (draftType === "BODY") return "#evo_draft_body_title";
        if (draftType === "ABILITY") return "#evo_draft_ability_title";
        return "#evo_draft_mutation_title";
    }

    function renderDraft(data: PlayerEvoNetPayload | null | undefined): void {
        currentState = data ?? null;
        if (!cardsContainer) return;

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
        const rerollsLeft = Math.max(0, currentState.mutation_rerolls ?? 0);
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

        const rawOptions = currentState.draft_options ?? {};
        const metaMap = currentState.draft_meta ?? {};
        const sortedKeys = Object.keys(rawOptions).sort((a, b) => Number(a) - Number(b));
        const selectText = $.Localize("#DOTA_Hero_Selection_Select") !== "#DOTA_Hero_Selection_Select"
            ? $.Localize("#DOTA_Hero_Selection_Select")
            : "ВЫБРАТЬ";

        for (let i = 0; i < sortedKeys.length; i++) {
            const optionId = rawOptions[sortedKeys[i]];
            if (!optionId) continue;

            const optionIndex = i;
            const card = $.CreatePanel("Button", cardsContainer, "");
            card.AddClass("EvoDraftOptionCard");

            const meta = metaMap[optionId];

            if (draftType === "BODY" && meta && meta.hero_class && meta.hero_class.length > 0) {
                const banner = $.CreatePanel("Panel", card, "");
                banner.AddClass("EvoDraftHeroBanner");

                const heroImg = $.CreatePanel("DOTAHeroImage", banner, "") as HeroImage;
                heroImg.AddClass("EvoDraftHeroImage");
                heroImg.heroimagestyle = "landscape";
                heroImg.heroname = meta.hero_class;

                const vignette = $.CreatePanel("Panel", banner, "");
                vignette.AddClass("EvoDraftHeroVignette");

                if (
                    meta.attr === "STR" ||
                    meta.attr === "AGI" ||
                    meta.attr === "INT" ||
                    meta.attr === "ALL"
                ) {
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
                        msLbl.text = `${meta.str ?? 0} / ${meta.agi ?? 0} / ${meta.int ?? 0} · ${meta.ms} MS`;
                    }
                }

                if (meta.abilities) {
                    const abKeys = Object.keys(meta.abilities).sort((a, b) => Number(a) - Number(b));
                    if (abKeys.length > 0) {
                        const skillRow = $.CreatePanel("Panel", body, "");
                        skillRow.AddClass("EvoDraftSkillRow");
                        for (let k = 0; k < abKeys.length; k++) {
                            const abName = meta.abilities[abKeys[k]];
                            if (!abName) continue;
                            const wrap = $.CreatePanel("Panel", skillRow, "");
                            wrap.AddClass("EvoDraftMiniAbilityWrap");
                            if (k === abKeys.length - 1 && abKeys.length >= 3) {
                                wrap.AddClass("Innate");
                            }
                            const abImg = $.CreatePanel("DOTAAbilityImage", wrap, "") as AbilityImage;
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
            } else {
                const body = $.CreatePanel("Panel", card, "");
                body.AddClass("EvoDraftCardBody");

                if (draftType === "ABILITY") {
                    const iconWrap = $.CreatePanel("Panel", body, "");
                    iconWrap.AddClass("EvoDraftAbilityIconWrap");
                    const icon = $.CreatePanel("DOTAAbilityImage", iconWrap, "") as AbilityImage;
                    icon.AddClass("EvoDraftAbilityIcon");
                    icon.abilityname = optionId;

                    card.SetPanelEvent("onmouseover", () => {
                        $.DispatchEvent("DOTAShowAbilityTooltip", card, optionId);
                    });
                    card.SetPanelEvent("onmouseout", () => {
                        $.DispatchEvent("DOTAHideAbilityTooltip", card);
                    });
                } else if (draftType === "MUTATION") {
                    const iconName = meta?.icon && meta.icon.length > 0 ? meta.icon : "alchemist_chemical_rage";
                    const iconWrap = $.CreatePanel("Panel", body, "");
                    iconWrap.AddClass("EvoDraftAbilityIconWrap");
                    const icon = $.CreatePanel("DOTAAbilityImage", iconWrap, "") as AbilityImage;
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

            const mutationSlot = currentState.pending_mutation_slot ?? 0;
            card.SetPanelEvent("onactivate", () => {
                $.DispatchEvent("DOTAHideAbilityTooltip", card);
                if (draftType === "BODY") {
                    GameEvents.SendCustomGameEventToServer("evo_select_body_draft" as never, {
                        option_index: optionIndex,
                    } as never);
                } else if (draftType === "ABILITY") {
                    GameEvents.SendCustomGameEventToServer("evo_select_ability_draft" as never, {
                        option_index: optionIndex,
                    } as never);
                } else {
                    GameEvents.SendCustomGameEventToServer("evo_select_mutation" as never, {
                        slot: mutationSlot,
                        option_index: optionIndex,
                    } as never);
                }
            });
        }

        refreshVisibility();
    }

    const localKey = String(Players.GetLocalPlayer());

    CustomNetTables.SubscribeNetTableListener("player_evo", (_table, key, data) => {
        if (key === localKey) {
            renderDraft(data as unknown as PlayerEvoNetPayload);
        }
    });

    renderDraft(
        CustomNetTables.GetTableValue("player_evo", localKey) as unknown as PlayerEvoNetPayload | null
    );
})();
