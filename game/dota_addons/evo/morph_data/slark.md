# Dota-Evo Spec: Slark Asset Tree (T1–T4)

## 1. Asset Reuse, Vision & Rendering Rules
- **Base Entity:** `npc_dota_hero_slark` (melee attack).
- **Tier Progression:** `T0 (Amoeba)` -> `T1 (Base Slark)` -> Branch choice at `T2` -> `T3` -> `T4`.
- **Vision Rules (Day / Night):**
  - **T1 Base:** `800` Day / `1800` Night.
  - **Branch 1 (Reef Hunter, T2–T4):** `800` Day / `1800` Night.
  - **Branch 2 (Swamp Defiler, T2–T4):** `1800` Day / `800` Night.
- **Visual Differentiation:** Controlled via `SetModelScale`, `SetRenderColor(r, g, b)` (applied to hero + non-particle `dota_item_wearable` children), and slot progression (`0` -> `1` -> `2-3` -> `Full Set`).

| Stage / Branch | Scale | RGB Color | Wearables & Particles |
| :--- | :--- | :--- | :--- |
| **T1: Base** | `0.75` | Default | `0` wearables (naked model). |
| **Reef T2:** Ловец Жемчужин | `0.85` | `45, 195, 220` | Weapon: `Hydrakan Latch` (keep default particles). |
| **Reef T3:** Глубоководный Дуэлянт | `1.05` | `35, 120, 215` | T2 + Head/Back: `Sea Rake's Bridle` (keep default particles). |
| **Reef T4:** Каратель Глубин | `1.25` | `30, 65, 200` | Full `Ocean Conqueror` + `Sea Rake's Bridle` + `Hydrakan Latch` / `Barb of Skadi` + dark abyssal mist particle. |
| **Swamp T2:** Болотный Ползун | `0.85` | `135, 215, 55` | Weapon: `Pale Edge` (recolored). |
| **Swamp T3:** Чумной Жнец | `1.05` | `105, 185, 40` | T2 + Hood/Shoulders: `Silent Ripper` (recolored) + toxic drip trail. |
| **Swamp T4:** Древний Осквернитель | `1.25` | `75, 150, 30` | Full `Prisoner of the Dark Reef` + `Silent Ripper` hood + `Pale Edge` (all wearables recolored) + swamp miasma aura. |

---

## 2. Innate Ability: «Хищник глубин»
- **Base Effect (T1):** While outside enemy vision for `> 2s`, grants `+14%` MS and `2.5%` Max HP regen/sec (lingers `1.5s` after being spotted).
- **Branch 1 (`Охотник Тёмного Рифа`):**
  - **T2:** Base effect (`1.5s` linger).
  - **T3:** Linger increases to `2.5s`; first attack from ambush deals `+45 + 45%*AGI` bonus Phys Dmg.
  - **T4:** Linger increases to `3.5s`; first attack from ambush deals `+80 + 70%*AGI` bonus Phys Dmg and disables shared allied vision for the target for `2s`.
- **Branch 2 (`Осквернитель Топей`, T2–T4):**
  - **Out of enemy vision (`> 2s`):** Retains base effect (`+14%` MS, `2.5%` Max HP regen/sec, `1.5s` linger).
  - **In enemy vision:** Grants `+4` Armor and `+10%` Magic Resistance.

---

## 3. T1 Base Abilities (Replaced at T2)

| Skill | T1: Base Slark |
| :--- | :--- |
| **[Q] Короткий выпад**<br>*(Short leap + AoE)* | Range: `500` / Landing AoE: `225` / Phys Dmg: `70` / CD: `10s` / Mana: `55`<br>Small forward leap (crosses cliffs); deals AoE damage on landing and slows by `-20%` MS for `2.5s` |
| **[W] Жадный укус**<br>*(Autocast attack modifier)* | Bonus Phys Dmg: `+40` / CD: `4.5s` / Mana: `35`<br>Steals `5` HP regen/sec for `3.5s` (`7.5` HP regen/sec vs creeps via `1.5x` multiplier) |
| **[E] / [R]** | Locked |

---

## 4. Branch 1: Reef Hunter (Ассасин / Дуэлянт | Scale: AGI | Vision: 800 Day / 1800 Night)
Core keywords: **`Привязка`** (Leash) & **`Кража регена`** (HP regen steal).

| Skill | T2: Ловец Жемчужин | T3: Глубоководный Дуэлянт | T4: Каратель Глубин |
| :--- | :--- | :--- | :--- |
| **[Q] Рывок Охотника**<br>*(Leap + Leash)* | Range: `700` / Leash: `2.25s`<br>Phys Dmg: `85 + 55%*AGI`<br>CD: `12s` / Mana: `75` | Range: `825` / Leash: `2.5s`<br>Phys Dmg: `145 + 75%*AGI`<br>CD: `11s` / Mana: `80`<br>`+` Shreds `5` Armor on leashed target (`4s`) | Range: `950` / Leash: `2.75s`<br>Phys Dmg: `205 + 95%*AGI`<br>CD: `10s` / Mana: `85`<br>`+` Shreds `8` Armor<br>`+` Killing leashed target cuts Q CD by `50%` |
| **[W] Глубокий порез**<br>*(Autocast Orb Attack Modifier; `+50` range on manual cast)* | CD: `6s` / Mana: `40` / Dur: `3.5s`<br>Bonus Phys: `+45 + 35%*AGI`<br>Slow: `-20%` MS<br>Regen steal: `6`/sec (`9`/sec vs creeps, `1.5x`)<br>Single instance | CD: `2.5s` / Mana: `50` / Dur: `4.5s` (refreshes)<br>Bonus Phys: `+70 + 45%*AGI`<br>Slow: `-25%` MS<br>Regen steal: `8`/sec per stack (`12`/sec vs creeps)<br>Max `2` stacks + `-20%` heal reduction; kill refunds `20` Mana | CD: `2s` / Mana: `60` / Dur: `5s` (refreshes)<br>Bonus Phys: `+95 + 60%*AGI`<br>Slow: `-35%` MS & `-25` AS<br>Regen steal: `11`/sec per stack (`16.5`/sec vs creeps)<br>Max `3` stacks + `-30%` heal reduction; hit vs leashed (Q) or ambush applies `2` stacks; kill refunds `25` Mana |
| **[E] Хладнокровие**<br>*(Passive)* | `15%` Crit (`165%` dmg)<br>Doubled (`30%`) vs leashed or slowed targets | `18%` Crit (`190%` dmg; `36%` vs controlled)<br>`+` Each crit grants `+25` AS for `3s` (max `3` stacks) | `20%` Crit (`220%` dmg; `40%` vs controlled)<br>`+` Crits vs leashed targets slow `-25%` MS for `1.5s` |
| **[R] Тёмная Бездна**<br>*(Ink cloud)* | Locked | Locked | Dur: `4s` / CD: `55s` / Mana: `130`<br>Unrevealable invisibility (not broken by attacks); forcefully activates `Хищник глубин` bonuses in combat and grants `+45` AS |

---

## 5. Branch 2: Swamp Defiler (Токсичный брузер / Дизраптор | Scale: STR | Vision: 1800 Day / 800 Night)
Core keyword: **`Болотный токсин`** (stacking Mag DoT + AS/Armor shred).

| Skill | T2: Болотный Ползун | T3: Чумной Жнец | T4: Древний Осквернитель |
| :--- | :--- | :--- | :--- |
| **[Q] Тёмный пакт**<br>*(Dispel + AoE pulses; `1.5x` dmg vs creeps)* | Radius: `325` / Delay: `1.5s`<br>Mag Dmg: `90 + 50%*STR` (`1.5x` vs creeps)<br>Self Dmg: `50%` (non-lethal)<br>CD: `9s` / Mana: `55`<br>Applies `Strong Dispel` on detonation | Radius: `350`<br>Mag Dmg: `160 + 70%*STR` (`1.5x` vs creeps)<br>CD: `8s` / Mana: `60`<br>`+` Blinds enemies (`35%` miss, `2.5s`)<br>`+` Applies `1` stack of `Болотный токсин` | Radius: `375`<br>Mag Dmg: `230 + 90%*STR` (`1.5x` vs creeps)<br>Self Dmg reduced to `30%`<br>CD: `7s` / Mana: `65`<br>`+` Blind `45%` (`3s`)<br>`+` Applies `2` stacks of `Болотный токсин` |
| **[W] Плевок кислотой**<br>*(Projectile + poison detonation; does not consume stacks)* | Range: `600`<br>Mag Dmg: `65 + 40%*STR`<br>`+20` dmg per poison stack<br>Slow: `-22%` MS (`4s`)<br>CD: `8s` / Mana: `60` | Range: `675`<br>Mag Dmg: `115 + 55%*STR`<br>`+32` dmg per poison stack<br>Slow: `-30%` MS (`4.5s`)<br>CD: `7.5s` / Mana: `65`<br>`+` Explodes in `200` AoE & refreshes all poison stack timers | Range: `750`<br>Mag Dmg: `165 + 70%*STR`<br>`+45` dmg per poison stack<br>Slow: `-38%` MS (`5s`)<br>CD: `7s` / Mana: `70`<br>`+` Explodes in `225` AoE & refreshes all poison stack timers |
| **[E] Болотный токсин**<br>*(Passive; refreshes all stacks on hit)* | Max `4` stacks (Dur: `4.5s`)<br>Mag DoT: `12 + 8%*STR`/sec per stack<br>Shred per stack: `-6` AS, `-1` Armor | Max `5` stacks (Dur: `5s`)<br>Mag DoT: `18 + 11%*STR`/sec per stack<br>Shred per stack: `-8` AS, `-1.5` Armor<br>`+` At max stacks: `-25%` heal reduction | Max `6` stacks (Dur: `5s`)<br>Mag DoT: `25 + 14%*STR`/sec per stack<br>Shred per stack: `-10` AS, `-2` Armor<br>`+` At max stacks: `-40%` heal reduction & attacks deal `+35 + 20%*STR` bonus on-hit Mag Dmg |
| **[R] Миазмы Топей**<br>*(Contagion + poison lifesteal)* | Locked | Locked | Range: `600` / Aura: `425` / Dur: `6s`<br>CD: `55s` / Mana: `140`<br>Infects target (ignores basic dispel). Enemies in `425` AoE take `75%` of target's poison DoT & copies of `[Q]` pulses. Caster heals for `60%` of all poison damage dealt |