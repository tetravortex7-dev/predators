# AGENTS.md — Evo («Adapt. Win.»)

Stack: TSTL (`src/vscripts/` → `scripts/vscripts/`), Panorama (`src/panorama/` → `content/panorama/`), Valve KV (`scripts/npc/`). Build: `npm.cmd run build`.

## Core Rules
- **MCP first:** Use `dota2-workshop` MCP when available (KV/VScript/Panorama API, launch/reload, VConsole2). 2-step Tools launch: `addon_launch_tools` → wait `"Finished requesting news data"` → `dota_launch_custom_game evo zxc`.
- **Zero comments:** NO `//`, `/* */`, JSDoc in TS/Panorama/KV (except `<!-- kv3 ... -->`). Always verify with `verify-zero-comments` skill script.
- **File size & modularity:** Any file exceeding **500 lines** (as well as any large system) MUST be split logically into focused submodules.
- **Clean build output:** After every build, clean output logs & VConsole buffer down to 0 lines using `.agents/skills/clean-build-output/scripts/clean_build_output.py` (and `dota_send_console_command` `clear`) so tokens are never wasted re-reading bloated output.
- **No stubs / `TODO`:** Ship real systems; author owns content. Use `ARCHITECT.md` for module map. Maintain `CHANGELOG.md` ultra-compact for LLMs: logically group and merge related changes into single bullets instead of appending noisy per-edit lines.
- **Architecture:** Modular SRP + OCP + `EventBus.ts` (1 system = 1 file in `systems/`, abilities per hero in `abilities/<hero>/`, 1 UI widget = 1 file in `src/panorama/scripts/custom_game/`); `GameMode.ts` init-only; declarative data in `data/` & KV; `snake_case` `evo_` prefix; RU+EN localization (every visible modifier MUST have `DOTA_Tooltip_<mod>` + `_Description` in RU & EN; every custom ability tooltip MUST use native `%var%` / `%var%%%` inline bindings + `DOTA_Tooltip_ability_<name>_<var>` stat rows); constants in `game_constants.ts`; dev cheats `-evo_*` in `DevCheats.ts`.

## Source 2 & TSTL Invariants
- `strict: true`, minimal `any`; guard callbacks with `unit && !unit.IsNull() && IsValidEntity(unit)`; delete via `UTIL_Remove`; 1-based Lua / string keys; `if (!IsServer()) return;`; timings via `GameRules.GetDOTATime`; never hardcode `npc_dota_hero_*`.
- **CRITICAL modifier enums & linking:** NEVER use raw `ModifierFunction`/`ModifierState` `const enum`s (outdated IDs). Always use `dotaModifierFunction("MODIFIER_PROPERTY_...")` / `dotaModifierState("MODIFIER_STATE_...")` from `lib/dota_ts_adapter.ts`, explicit `@registerModifier("name")` / `@registerAbility("name")`, and `LinkLuaModifier(name, path, motionType)` for every custom Lua modifier.
- **CRITICAL hero ability slots & hotkeys (`Q/W/E/D/F/R`):** NEVER set `Ability1..6` to `""` or `"generic_hidden"` in `npc_heroes_custom.txt` — Source 2 leaves slots `0..5` as `nil`, causing `AddAbility` to append at slot `15+` and hotkeys to fail with *"Ability not learned"*. Always reserve `Ability1..6` with `evo_empty_slot_1..6` (never stripped), then `SwapAbilities` active abilities into slots `0..5`.
- **Appearance & Evolution:** Species swap via `HeroAppearance.replaceHeroPreservingState` (`ReplaceHeroWith`); same-species tiers & boss sets via `HeroAppearance.applyPreset` (wearables, scale, color, displayName). Bosses are `npc_dota_creature` (`ConsideredHero: 1`, `HasInventory: 1`).
- **Hero Innates, Scepter/Shard & Talents:** All hero innates MUST use native Innate slot (`"Innate" "1"`, `"IsBreakable" "1"`, `DOTA_ABILITY_BEHAVIOR_PASSIVE | DOTA_ABILITY_BEHAVIOR_NOT_LEARNABLE | DOTA_ABILITY_BEHAVIOR_SKIP_FOR_KEYBINDS`; strip hidden vanilla innates). Clear Aghanim's Scepter/Shard on custom heroes for now. Use shared generic talents (`special_bonus_evo_*` in `scripts/npc/abilities/evo_generic_talents.txt` + `npc_heroes_custom.txt`) for all custom heroes until per-hero talents are designed.
- **Panorama UI:** 100% native Dota 2 Reborn style (`s2r://panorama/styles/dotastyles.vcss`, `s2r://panorama/images/hud/reborn/...`). No decorative badges, glowing fonts, or inactive indicators.
- **Security:** `CustomGameEventManager` events are untrusted — validate `event.PlayerID`, `IsAlive()`, resources, distance, match state. Write `CustomNetTables` only on state change.

## Data Pipelines & Reference DBs
- `reference/wearables_catalog.json` — 127 heroes, 10,876 wearables (`.vmdl` + ambient `.vpcf`).
- `reference/unit_models_catalog.json` — 1,280 unit/creep/event/legacy `.vmdl` (15 categories) + 307 vanilla `npc_units`.
- **Major Dota 2 patch:** remind user to regenerate `reference/*.json` from fresh `pak01_dir.vpk`.
- `data/localization/*.json` (`ui`, `talents`, `bosses`, `neutrals`, `items`, `hero_*.json`) → `tools/generate_localization.py` → `resource/addon_russian.txt` & `addon_english.txt` (always edit JSONs, never raw `addon_*.txt`).
- `data/branches/*.json` → `tools/generate_branches.py` → `bodies_catalog.ts` + RU/EN loc.
- `data/neutral_creeps.json` → `tools/generate_neutrals.py` → `evo_creep_*/unit.txt`, `neutral_camps.txt`, `neutral_creeps_catalog.ts` + RU/EN loc.
