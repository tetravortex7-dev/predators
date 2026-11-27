(() => {
    interface ShardUpgradeInfo {
        readonly abilityName: string;
        readonly title: string;
        readonly description: string;
    }

    const noShardTokens = new Set<string>();

    function getHudRoot(): Panel | null {
        let cur: Panel | null = $.GetContextPanel();
        while (cur && cur.GetParent()) {
            cur = cur.GetParent();
        }
        return cur;
    }

    function getTargetHero(): EntityIndex {
        const portrait = Players.GetLocalPlayerPortraitUnit();
        if (portrait !== -1 && Entities.IsValidEntity(portrait) && Entities.IsRealHero(portrait)) {
            return portrait;
        }
        return Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
    }

    function resolveShardDescription(ability: AbilityEntityIndex, rawDesc: string): string {
        const levelIdx = Math.max(0, Abilities.GetLevel(ability) - 1);
        return rawDesc.replace(/%([a-zA-Z0-9_]+)%/g, (full, varName: string) => {
            const val = Abilities.GetLevelSpecialValueFor(ability, varName, levelIdx);
            if (val !== undefined && !isNaN(val) && val !== 0) {
                return Number.isInteger(val) ? String(val) : val.toFixed(1).replace(/\.0$/, "");
            }
            return full;
        });
    }

    function getHeroShardUpgrades(hero: EntityIndex): ShardUpgradeInfo[] {
        const result: ShardUpgradeInfo[] = [];
        if (hero === -1 || !Entities.IsValidEntity(hero)) return result;

        const seen = new Set<string>();
        const count = Entities.GetAbilityCount(hero);
        for (let i = 0; i < count; i++) {
            const ab = Entities.GetAbility(hero, i);
            if (ab === -1) continue;
            const abName = Abilities.GetAbilityName(ab);
            if (!abName || abName.startsWith("evo_empty_slot_") || abName.startsWith("special_bonus_")) continue;
            if (seen.has(abName) || noShardTokens.has(abName)) continue;
            seen.add(abName);

            const shardToken = `#DOTA_Tooltip_ability_${abName}_Shard_Description`;
            const rawDesc = $.Localize(shardToken);
            if (!rawDesc || rawDesc === shardToken) {
                noShardTokens.add(abName);
                continue;
            }

            const nameToken = `#DOTA_Tooltip_ability_${abName}`;
            const rawTitle = $.Localize(nameToken);
            const title = rawTitle && rawTitle !== nameToken ? rawTitle : abName;
            result.push({
                abilityName: abName,
                title,
                description: resolveShardDescription(ab, rawDesc),
            });
        }
        return result;
    }

    function collectMatchingLabels(panel: Panel | null, targetText: string, out: LabelPanel[] = []): LabelPanel[] {
        if (!panel || !panel.IsValid()) return out;
        if (panel.paneltype === "Label") {
            const lbl = panel as LabelPanel;
            if (lbl.text === targetText || panel.id === "NoChildrenLabel") {
                out.push(lbl);
            }
        }
        const count = panel.GetChildCount();
        for (let i = 0; i < count; i++) {
            collectMatchingLabels(panel.GetChild(i), targetText, out);
        }
        return out;
    }

    function collectPanelsWithClass(panel: Panel | null, className: string, out: Panel[] = []): Panel[] {
        if (!panel || !panel.IsValid()) return out;
        if (panel.BHasClass(className)) {
            out.push(panel);
        }
        const count = panel.GetChildCount();
        for (let i = 0; i < count; i++) {
            collectPanelsWithClass(panel.GetChild(i), className, out);
        }
        return out;
    }

    function heroOwnsShard(hero: EntityIndex): boolean {
        if (hero === -1 || !Entities.IsValidEntity(hero)) return false;
        const n = Entities.GetNumBuffs(hero);
        for (let i = 0; i < n; i++) {
            const buff = Entities.GetBuff(hero, i);
            if (Buffs.GetName(hero, buff) === "modifier_item_aghanims_shard") {
                return true;
            }
        }
        return false;
    }

    function renderShardCards(host: Panel, upgrades: readonly ShardUpgradeInfo[], owned: boolean): void {
        let box = host.FindChild("EvoCustomShardList");
        if (!box) {
            box = $.CreatePanel("Panel", host, "EvoCustomShardList");
        }
        box.style.flowChildren = "down";
        box.style.width = "330px";
        box.style.padding = "4px 8px 8px 8px";
        box.style.visibility = "visible";

        const badgeTok = "#evo_shard_ability_upgrade";
        const badgeLoc = $.Localize(badgeTok);
        const badgeText = badgeLoc && badgeLoc !== badgeTok ? badgeLoc : "ABILITY UPGRADE";
        const sig = `${owned ? 1 : 0}|${upgrades.map((u) => `${u.abilityName}:${u.description}`).join("|")}`;
        if (box.GetAttributeString("evo_sig", "") === sig) return;
        box.SetAttributeString("evo_sig", sig);
        box.RemoveAndDeleteChildren();

        for (const up of upgrades) {
            const card = $.CreatePanel("Panel", box, "");
            card.style.flowChildren = "right";
            card.style.width = "100%";
            card.style.marginBottom = "4px";
            card.style.padding = "4px";
            card.style.backgroundColor = "#152027";
            card.style.borderRadius = "3px";

            const img = $.CreatePanel("DOTAAbilityImage", card, "") as AbilityImage;
            img.abilityname = up.abilityName;
            img.style.width = "36px";
            img.style.height = "36px";
            img.style.borderRadius = "3px";
            img.style.border = "1px solid #000000";
            img.style.marginRight = "8px";
            img.style.marginTop = "2px";

            const info = $.CreatePanel("Panel", card, "");
            info.style.flowChildren = "down";
            info.style.width = "fill-parent-flow(1.0)";

            const topRow = $.CreatePanel("Panel", info, "");
            topRow.style.flowChildren = "right";
            topRow.style.width = "100%";
            topRow.style.marginBottom = "2px";

            const titleLbl = $.CreatePanel("Label", topRow, "") as LabelPanel;
            titleLbl.text = up.title.toUpperCase();
            titleLbl.style.color = owned ? "#ffffff" : "#c7c7c7";
            titleLbl.style.fontSize = "15px";
            titleLbl.style.fontWeight = "bold";
            titleLbl.style.letterSpacing = "0.5px";
            titleLbl.style.verticalAlign = "center";

            const tagLbl = $.CreatePanel("Label", topRow, "") as LabelPanel;
            tagLbl.text = badgeText.toUpperCase();
            tagLbl.style.color = "#9ab0cd";
            tagLbl.style.backgroundColor = "#4160b630";
            tagLbl.style.borderRadius = "3px";
            tagLbl.style.fontSize = "11px";
            tagLbl.style.padding = "1px 5px";
            tagLbl.style.marginLeft = "6px";
            tagLbl.style.verticalAlign = "center";

            const descLbl = $.CreatePanel("Label", info, "") as LabelPanel;
            descLbl.html = true;
            descLbl.text = up.description;
            descLbl.style.color = "#9ab0cd";
            descLbl.style.fontSize = "15px";
            descLbl.style.width = "100%";
        }
    }

    function clearPanelById(scope: Panel | null, childId: string): void {
        if (!scope || !scope.IsValid()) return;
        const existing = scope.FindChildTraverse(childId);
        if (existing && existing.IsValid()) {
            existing.style.visibility = "collapse";
        }
    }

    function isAghsShardAbilityTooltip(tooltip: Panel): boolean {
        const abNameLbl = tooltip.FindChildTraverse("AbilityName") as LabelPanel | null;
        if (!abNameLbl) return false;
        const txt = (abNameLbl.text ?? "").toLowerCase();
        if (!txt) return false;
        const shardLoc = $.Localize("#DOTA_Tooltip_Ability_item_aghanims_shard").toLowerCase();
        const roshanLoc = $.Localize("#DOTA_Tooltip_Ability_item_aghanims_shard_roshan").toLowerCase();
        return txt === shardLoc || txt === roshanLoc || txt.includes("aghanim's shard");
    }

    function patchAghsSection(section: Panel, upgrades: readonly ShardUpgradeInfo[], owned: boolean): void {
        const noUpgradeText = $.Localize("#DOTA_AbilityTooltip_No_Aghs_Upgrade_Found");
        if (upgrades.length === 0) {
            clearPanelById(section, "EvoCustomShardList");
            for (const lbl of collectMatchingLabels(section, noUpgradeText)) {
                lbl.style.visibility = null;
            }
            return;
        }

        const noUpPanels = collectPanelsWithClass(section, "NoUpgrade");
        for (const p of noUpPanels) {
            p.RemoveClass("NoUpgrade");
        }
        const noLabels = collectMatchingLabels(section, noUpgradeText);
        let host: Panel | null = null;
        for (const lbl of noLabels) {
            lbl.style.visibility = "collapse";
            if (!host && lbl.GetParent()) {
                const p = lbl.GetParent()!;
                host = p.BHasClass("NoChildrenLabel") && p.GetParent() ? p.GetParent()! : p;
                if (p.BHasClass("NoChildrenLabel")) {
                    p.style.visibility = "collapse";
                }
            }
        }
        if (!host) {
            host =
                section.FindChildTraverse("AghsShardContainer1") ??
                section.FindChildTraverse("InsetContainer") ??
                section;
        }
        renderShardCards(host, upgrades, owned);
    }

    function patchAbilityShardBanner(abilityTip: Panel, upgrades: readonly ShardUpgradeInfo[], owned: boolean): void {
        if (upgrades.length === 0) {
            clearPanelById(abilityTip, "EvoAbilityShardBanner");
            return;
        }

        const abNameLbl = abilityTip.FindChildTraverse("AbilityName") as LabelPanel | null;
        const shownTitle = (abNameLbl?.text ?? "").trim().toLowerCase();
        const match = upgrades.find((u) => u.title.toLowerCase() === shownTitle);
        if (!match) {
            clearPanelById(abilityTip, "EvoAbilityShardBanner");
            return;
        }

        const inlineShard = abilityTip.FindChildTraverse("InlineShardDescription");
        if (inlineShard && inlineShard.IsValid() && inlineShard.visible && inlineShard.actuallayoutheight > 6) {
            clearPanelById(abilityTip, "EvoAbilityShardBanner");
            return;
        }

        const descCont = abilityTip.FindChildTraverse("AbilityDescriptionContainer");
        const host = descCont && descCont.GetParent() ? descCont.GetParent()! : abilityTip;

        let banner = host.FindChild("EvoAbilityShardBanner");
        if (!banner) {
            banner = $.CreatePanel("Panel", host, "EvoAbilityShardBanner");
        }
        if (descCont && descCont.IsValid() && descCont.GetParent() === host) {
            host.MoveChildAfter(banner, descCont);
        }

        banner.style.flowChildren = "down";
        banner.style.width = "330px";
        banner.style.margin = "2px 2px 8px 2px";
        banner.style.padding = "7px 10px 9px 10px";
        banner.style.borderRadius = "2px";
        banner.style.backgroundColor = owned ? "#193247" : "#152431";
        banner.style.border = "1px solid #3c78b466";
        banner.style.visibility = "visible";

        const headerTok = "#evo_ability_shard_upgrade_header";
        const headerLoc = $.Localize(headerTok);
        const headerText = headerLoc && headerLoc !== headerTok ? headerLoc : "Aghanim's Shard Upgrade";
        const sig = `${owned ? 1 : 0}|${match.abilityName}|${match.description}`;
        if (banner.GetAttributeString("evo_sig", "") === sig) return;
        banner.SetAttributeString("evo_sig", sig);
        banner.RemoveAndDeleteChildren();

        const headerRow = $.CreatePanel("Panel", banner, "");
        headerRow.style.flowChildren = "right";
        headerRow.style.width = "100%";
        headerRow.style.marginBottom = "4px";

        const icon = $.CreatePanel("Panel", headerRow, "");
        icon.style.width = "18px";
        icon.style.height = "18px";
        icon.style.backgroundImage = owned
            ? 'url("s2r://panorama/images/hud/reborn/aghsstatus_shard_on_psd.vtex")'
            : 'url("s2r://panorama/images/hud/reborn/aghsstatus_shard_marker_psd.vtex")';
        icon.style.backgroundSize = "contain";
        icon.style.backgroundPosition = "center";
        icon.style.backgroundRepeat = "no-repeat";
        icon.style.marginRight = "8px";
        icon.style.verticalAlign = "center";

        const titleLbl = $.CreatePanel("Label", headerRow, "") as LabelPanel;
        titleLbl.text = headerText;
        titleLbl.style.color = "#7ad5ff";
        titleLbl.style.fontSize = "14px";
        titleLbl.style.fontWeight = "bold";
        titleLbl.style.verticalAlign = "center";

        const descLbl = $.CreatePanel("Label", banner, "") as LabelPanel;
        descLbl.html = true;
        descLbl.text = match.description;
        descLbl.style.color = "#9eb6c5";
        descLbl.style.fontSize = "15px";
        descLbl.style.width = "100%";
    }

    function syncShardTooltips(): void {
        const root = getHudRoot();
        if (!root) return;

        const hero = getTargetHero();
        const upgrades = getHeroShardUpgrades(hero);
        const owned = heroOwnsShard(hero);

        const aghsStatusTip = root.FindChildTraverse("DOTAHUDAghsStatusTooltip");
        if (aghsStatusTip && aghsStatusTip.IsValid() && aghsStatusTip.visible) {
            const shardSection = aghsStatusTip.FindChildTraverse("BottomSection");
            if (shardSection && shardSection.IsValid()) {
                patchAghsSection(shardSection, upgrades, owned);
            }
        }

        const abilityTip = root.FindChildTraverse("DOTAAbilityTooltip");
        if (abilityTip && abilityTip.IsValid() && abilityTip.visible) {
            if (isAghsShardAbilityTooltip(abilityTip)) {
                clearPanelById(abilityTip, "EvoAbilityShardBanner");
                patchAghsSection(abilityTip, upgrades, owned);
            } else {
                clearPanelById(abilityTip, "EvoCustomShardList");
                patchAbilityShardBanner(abilityTip, upgrades, owned);
            }
        }
    }

    function loop(): void {
        syncShardTooltips();
        $.Schedule(0.05, loop);
    }

    loop();
})();
