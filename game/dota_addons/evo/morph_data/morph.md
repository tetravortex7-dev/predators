# Dota-Evo Spec: Morphling Asset Tree (T1–T4)

## 1. Asset Reuse & Rendering Rules
- **Base Entity:** `npc_dota_hero_morphling` (semi-ranged attack).
- **Tier Progression:** `T0 (Amoeba)` -> `T1 (Base Morphling)` -> Branch choice at `T2` -> `T3` -> `T4`.
- **Visual Differentiation:** Controlled via `SetModelScale`, `SetRenderColor(r, g, b)` (applied to hero + non-particle `dota_item_wearable` children), and slot progression (`0` -> `1-2` -> `3` -> `Full Set`).

| Stage / Branch | Scale | RGB Color | Wearables & Particles |
| :--- | :--- | :--- | :--- |
| **T1: Base** | `0.65` | Default | `0` wearables (naked model). |
| **Water T2:** Дух Источника | `0.85` | `70, 235, 255` | Arms: `Blade of Tears`; Head: `Crown of Tears` (keep default particles). |
| **Water T3:** Страж Рифа | `1.05` | `30, 175, 165` | T2 + Shoulders: `Birot's Bindings` or `Comet's Tail`. |
| **Water T4:** Владыка Пучины | `1.25` | `35, 75, 220` | Full `Dark Reef Escape` or `Ancient Armor` + `Crown/Blade of Tears` + whirlpool ground particle. |
| **Blood T2:** Сгусток Ихора | `0.85` | `220, 65, 65` | Arms: `Shards of Polymorphia` or `Radiant Crystal` (recolored). |
| **Blood T3:** Кровавый Жнец | `1.05` | `185, 20, 30` | T2 + spiky Shoulders & Head (`Shards of Polymorphia` / `Dark Reef Escape`, recolored) + blood trail. |
| **Blood T4:** Алый Потрошитель | `1.25` | `140, 10, 25` | Full `Dark Reef Escape` (all wearables recolored) + blood mist aura. |
| **Void T2:** Осколок Тени | `0.85` | `130, 60, 210` | Arms: `Ethereal Blade`. |
| **Void T3:** Ткач Разломов | `1.05` | `90, 25, 195` | T2 + Shoulders & Head from `Shard of the Lost Star`. |
| **Void T4:** Владыка Бездны | `1.25` | `55, 15, 150` | Full `Shard of the Lost Star` + `Ethereal Blade` + mini `Black Hole` ground particle. |

---

## 2. Innate Ability: «Адаптивная сущность»
- **Base Effect (T1, inherited by all tiers):** Dynamically grants bonus stats based on the hero's **highest primary attribute**:
  - **STR highest:** `+4` Armor, `+4` HP regen.
  - **AGI highest:** `+18` Attack Speed, `+5%` Move Speed.
  - **INT highest:** `+6%` Spell Amp, `+1.5` Mana regen.
- **Branch Upgrades (from T3 & T4):**
  - **Water (`Страж Рифа` / `Владыка Пучины`):** Grants **both STR and AGI** bonuses simultaneously regardless of which is higher.
  - **Blood (`Кровавый Жнец` / `Алый Потрошитель`):** STR bonus scales up to **`2x`** (`+8` Armor, `+8` HP regen) based on missing HP (reaches cap at `35%` HP).
  - **Void (`Ткач Разломов` / `Владыка Бездны`):** INT bonus additionally grants **`+12%` Debuff Amplification** (extends W silence, E stacks, and R root).

---

## 3. T1 Base Abilities (Replaced at T2)

| Skill | T1: Base Morphling |
| :--- | :--- |
| **[Q] Водяной всплеск**<br>*(Short wave dash)* | Range: `550` / Mag Dmg: `75` / CD: `11s` / Mana: `60`<br>Short directional wave dash; damages all enemies along path and slows by `-15%` MS for `2s` |
| **[W] Разъедающий поток**<br>*(Target projectile + splash)* | Range: `600` / Mag Dmg: `65 + 50%*(Highest Attribute)` / CD: `7s` / Mana: `55`<br>Damages primary target, splashes onto `2` nearest enemies (`60%` dmg), and shreds `2` Armor for `4s` on all hit |
| **[E] / [R]** | Locked |

---

## 4. Branch 1: Water (Маг-контроллер / Инициатор | Scale: STR + AGI)
Core keyword: **`Промокание`** (`-20%` MS).

| Skill | T2: Дух Источника | T3: Страж Рифа | T4: Владыка Пучины |
| :--- | :--- | :--- | :--- |
| **[Q] Рывок Прилива**<br>*(Directional dash)* | Range: `800`<br>Mag Dmg: `80`<br>CD: `13s` / Mana: `85` | Range: `1000`<br>Mag Dmg: `130`<br>CD: `12s` / Mana: `95`<br>`+` Trail (`3s`) applying `Промокание` | Range: `1200`<br>Mag Dmg: `180`<br>CD: `11s` / Mana: `105`<br>`+` Trail + Vortex at end (`225` AoE): pull & `0.2s` ministun |
| **[W] Водяное Копьё**<br>*(Target projectile)* | Range: `700`<br>Mag Dmg: `90 + 50%*(STR+AGI)`<br>CD: `7s` / Mana: `75`<br>Applies `Промокание` (`2s`) | Range: `750`<br>Mag Dmg: `180 + 70%*(STR+AGI)`<br>CD: `7s` / Mana: `85`<br>`+` `50%` cone splash behind target<br>`+` Roots `1.2s` if target has `Промокание` | Range: `800`<br>Mag Dmg: `270 + 90%*(STR+AGI)`<br>CD: `7s` / Mana: `95`<br>`+` Splash + Root on wet<br>`+` `-15%` Mag Res (`4s`); kill under debuff cuts W CD by `50%` |
| **[E] Разрежение**<br>*(Self buff)* | Dur: `10s` / CD: `20s` / Mana: `60`<br>`+18%` MS, `25%` Evasion | Dur: `10s` / CD: `20s` / Mana: `65`<br>`+18%` MS, `25%` Evasion<br>`+` `Basic Dispel` on cast + `Phase` | Dur: `10s` / CD: `20s` / Mana: `70`<br>`+18%` MS, `25%` Evasion, Dispel, Phase<br>`+` `+25%` Status Res while active<br>`+` Passive while on CD: `+6` Armor, `+5` HP regen |
| **[R] Зов Океана**<br>*(Ground AoE)* | Locked | Locked | Radius: `500` / Dur: `6s` / CD: `55s` / Mana: `150`<br>Floods zone: enemies permanently have `Промокание` (guarantees W root); caster's Q CD ticks `1.5x` faster inside |

---

## 5. Branch 2: Blood (Брузер / Вампир | Scale: STR)
Core keyword: **`Кровотечение`** (Physical/Pure DoT).

| Skill | T2: Сгусток Ихора | T3: Кровавый Жнец | T4: Алый Потрошитель |
| :--- | :--- | :--- | :--- |
| **[Q] Кровавый скачок**<br>*(Target Blink Strike)* | Range: `650`<br>Phys Dmg: `115 + 70%*STR`<br>CD: `8s` / Mana: `40`<br>Applies `Кровотечение` (`25` dps, `5s`) | Range: `775`<br>Phys Dmg: `195 + 95%*STR`<br>CD: `7s` / Mana: `45`<br>`Кровотечение`: `40` dps (`5s`)<br>`+` Moving target: `18%` slow & `+1.5s` bleed duration | Range: `900`<br>Phys Dmg: `275 + 120%*STR`<br>CD: `6s` / Mana: `50`<br>`Кровотечение`: `70` dps (`6s`) + move slow/extend<br>`+` Can blink to allied units |
| **[W] Вытягивание жизни**<br>*(Burst + Lifesteal)* | Single target, Range: `550`<br>Mag Dmg: `100 + 50%*STR`<br>CD: `8s` / Mana: `75`<br>Heals `50%` of damage dealt | Cone AoE: `600`<br>Mag Dmg: `160 + 70%*STR`<br>CD: `8s` / Mana: `85`<br>Heals `50%` vs heroes / `25%` vs creeps | Cone AoE: `650`<br>Mag Dmg: `220 + 90%*STR`<br>CD: `8s` / Mana: `95`<br>`+` Overheal converts to Blood Shield (up to `25%` Max HP, `6s`) |
| **[E] Жажда плоти**<br>*(Passive + Active)* | Passive vs bleeding targets:<br>`+15%` Lifesteal, `+20` AS | Passive: `+20%` Lifesteal, `+30` AS<br>`+` Active (`Вскипание`): costs `10%` cur HP, `0` Mana, CD `18s`, Dur `8s` — **2x** passive bonuses & `+15%` MS toward bleeding targets | Passive: `+25%` Lifesteal, `+40` AS<br>Active: Dur `8s`, CD `16s`<br>`+` Killing bleeding target resets Q CD & heals `20%` Max HP |
| **[R] Ритуал Свежевателей**<br>*(Target Tether)* | Locked | Locked | Range: `600` (break `1100`) / Dur: `6s` / CD: `55s` / Mana: `140`<br>Target permanently has `Кровотечение`; `30%` of all damage taken by caster is redirected to linked target |

---

## 6. Branch 3: Void (Ассасин / Манипулятор | Scale: INT)
Core keyword: **`Эрозия`** (stacking Mag Res shred + on-hit Mag Dmg).

| Skill | T2: Осколок Тени | T3: Ткач Разломов | T4: Владыка Бездны |
| :--- | :--- | :--- | :--- |
| **[Q] Шаг сквозь Тень**<br>*(Base: `weaver_shukuchi`)* | Dur: `4s` / MS: `550` (Phased)<br>Pass Mag Dmg: `85` (fixed)<br>CD: `10s` / Mana: `60` | Dur: `4s` / MS: `550`<br>Pass Mag Dmg: `135` (fixed)<br>CD: `9s` / Mana: `65`<br>`+` Pass slows `15%` (`3s`)<br>`+` Attack from invis: `0.2s` ministun | Dur: `4s` / MS: `550`<br>Pass Mag Dmg: `185` (fixed)<br>CD: `8s` / Mana: `70`<br>`+` Pass slows `25%` (`4s`)<br>`+` Attack from invis: `0.4s` ministun |
| **[W] Печать Пустоты**<br>*(Castable in invis)* | Range: `750` / Dur: `4s`<br>CD: `7s` / Mana: `65`<br>Mark detonates on next hit/spell for `95 + 65%*INT` Mag Dmg | Range: `800` / Dur: `4s`<br>CD: `7s` / Mana: `75`<br>Detonation: `165 + 85%*INT` Mag Dmg<br>`+` Applies `1.5s` Silence | Range: `850` / Dur: `4s`<br>CD: `7s` / Mana: `85`<br>Detonation: `235 + 105%*INT` Mag Dmg + `1.5s` Silence<br>`+` Burns `10%` Max Mana & grants `+12%` Spell Amp (`5s`) |
| **[E] Касание Бездны**<br>*(Passive)* | Attacks apply `Эрозия` (`4s`, max `4` stacks):<br>`-3%` Mag Res & `+12` on-hit Mag Dmg per stack | Max `5` stacks (`-4%` Mag Res, `+20` on-hit Mag Dmg)<br>`+` Attacks vs slowed/rooted targets apply `2` stacks | Max `6` stacks (`-5%` Mag Res, `+28` on-hit Mag Dmg) + `2` stacks vs slowed/rooted<br>`+` At max stacks: applies `Истощение` (`-40%` incoming heal/regen, `4s`) |
| **[R] Зеркало Бездны**<br>*(Target Root + Clone)* | Locked | Locked | Range: `700` / CD: `55s` / Mana: `150`<br>Roots target for `2.5s` & spawns an enemy illusion next to them (`6s`, `65%` dmg dealt, `150%` taken). Illusion attacks original and applies `[E] Касание Бездны` stacks |