(() => {
    interface SpellShopNetPayload {
        offered_spells?: Record<string, string>;
        owned_spells?: Record<string, string>;
        max_slots?: number;
    }

    const plusBtn = $("#EvoSpellPlusBtn");
    const strip = $("#EvoSpellStrip");
    const offeredRow = $("#EvoSpellOfferedRow");

    let isOpen = false;
    let lastData: SpellShopNetPayload | null = null;

    if (plusBtn) {
        plusBtn.SetPanelEvent("onactivate", () => {
            isOpen = !isOpen;
            refreshVisibility();
        });
    }

    function getAvailableOffers(data: SpellShopNetPayload | null): {
        offers: string[];
        freeSlots: number;
    } {
        if (!data) return { offers: [], freeSlots: 0 };

        const maxSlots = data.max_slots ?? 3;
        const ownedMap = data.owned_spells ?? {};
        const ownedList: string[] = [];
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

        const offersMap = data.offered_spells ?? {};
        const keys = Object.keys(offersMap).sort((a, b) => Number(a) - Number(b));
        const offers: string[] = [];
        for (const k of keys) {
            const name = offersMap[k];
            if (typeof name === "string" && name.length > 0 && !ownedList.includes(name)) {
                offers.push(name);
            }
        }
        return { offers, freeSlots };
    }

    function refreshVisibility(): void {
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

    function renderShop(data: SpellShopNetPayload | null | undefined): void {
        lastData = data ?? null;
        if (!offeredRow) return;

        offeredRow.RemoveAndDeleteChildren();

        const { offers, freeSlots } = getAvailableOffers(lastData);
        if (freeSlots <= 0 || offers.length === 0) {
            refreshVisibility();
            return;
        }

        for (const abilityName of offers) {
            const card = $.CreatePanel("Button", offeredRow, "");
            card.AddClass("EvoSpellOfferCard");

            const icon = $.CreatePanel("DOTAAbilityImage", card, "") as AbilityImage;
            icon.AddClass("EvoSpellIcon");
            icon.abilityname = abilityName;

            card.SetPanelEvent("onmouseover", () => {
                $.DispatchEvent("DOTAShowAbilityTooltip", card, abilityName);
            });
            card.SetPanelEvent("onmouseout", () => {
                $.DispatchEvent("DOTAHideAbilityTooltip", card);
            });
            card.SetPanelEvent("onactivate", () => {
                GameEvents.SendCustomGameEventToServer("evo_spell_buy" as never, {
                    ability_name: abilityName,
                } as never);
            });
        }

        refreshVisibility();
    }

    const localKey = String(Players.GetLocalPlayer());

    CustomNetTables.SubscribeNetTableListener("spell_shop", (_table, key, data) => {
        if (key === localKey) {
            renderShop(data as unknown as SpellShopNetPayload);
        }
    });

    renderShop(
        CustomNetTables.GetTableValue("spell_shop", localKey) as unknown as SpellShopNetPayload | null
    );
})();
