"use strict";
(() => {
    const plusBtn = $("#EvoSpellPlusBtn");
    const strip = $("#EvoSpellStrip");
    const offeredRow = $("#EvoSpellOfferedRow");
    let isOpen = false;
    let lastData = null;
    if (plusBtn) {
        plusBtn.SetPanelEvent("onactivate", () => {
            isOpen = !isOpen;
            refreshVisibility();
        });
    }
    function getAvailableOffers(data) {
        var _a, _b, _c;
        if (!data)
            return { offers: [], freeSlots: 0 };
        const maxSlots = (_a = data.max_slots) !== null && _a !== void 0 ? _a : 3;
        const ownedMap = (_b = data.owned_spells) !== null && _b !== void 0 ? _b : {};
        const ownedList = [];
        for (const k of Object.keys(ownedMap)) {
            const val = ownedMap[k];
            if (typeof val === "string" && val.length > 0) {
                ownedList.push(val);
            }
        }
        const freeSlots = Math.max(0, maxSlots - ownedList.length);
        if (freeSlots <= 0) {
            return { offers: [], freeSlots: 0 };
        }
        const offersMap = (_c = data.offered_spells) !== null && _c !== void 0 ? _c : {};
        const keys = Object.keys(offersMap).sort((a, b) => Number(a) - Number(b));
        const offers = [];
        for (const k of keys) {
            const name = offersMap[k];
            if (typeof name === "string" && name.length > 0 && !ownedList.includes(name)) {
                offers.push(name);
            }
        }
        return { offers, freeSlots };
    }
    function refreshVisibility() {
        const { offers, freeSlots } = getAvailableOffers(lastData);
        const canPick = freeSlots > 0 && offers.length > 0;
        if (!canPick) {
            isOpen = false;
        }
        if (plusBtn) {
            plusBtn.SetHasClass("Visible", canPick);
        }
        if (strip) {
            strip.SetHasClass("Visible", canPick && isOpen);
        }
    }
    function renderShop(data) {
        lastData = data !== null && data !== void 0 ? data : null;
        if (!offeredRow)
            return;
        offeredRow.RemoveAndDeleteChildren();
        const { offers, freeSlots } = getAvailableOffers(lastData);
        if (freeSlots <= 0 || offers.length === 0) {
            refreshVisibility();
            return;
        }
        for (const abilityName of offers) {
            const card = $.CreatePanel("Button", offeredRow, "");
            card.AddClass("EvoSpellOfferCard");
            const icon = $.CreatePanel("DOTAAbilityImage", card, "");
            icon.AddClass("EvoSpellIcon");
            icon.abilityname = abilityName;
            card.SetPanelEvent("onmouseover", () => {
                $.DispatchEvent("DOTAShowAbilityTooltip", card, abilityName);
            });
            card.SetPanelEvent("onmouseout", () => {
                $.DispatchEvent("DOTAHideAbilityTooltip", card);
            });
            card.SetPanelEvent("onactivate", () => {
                GameEvents.SendCustomGameEventToServer("evo_spell_buy", {
                    ability_name: abilityName,
                });
            });
        }
        refreshVisibility();
    }
    const localKey = String(Players.GetLocalPlayer());
    CustomNetTables.SubscribeNetTableListener("spell_shop", (_table, key, data) => {
        if (key === localKey) {
            renderShop(data);
        }
    });
    renderShop(CustomNetTables.GetTableValue("spell_shop", localKey));
})();
