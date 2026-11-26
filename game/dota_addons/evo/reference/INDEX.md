# Evo Asset & Gameplay Reference (`reference/`)

Single navigation hub for Dota 2 VPK assets extracted for **Evo**.
**Rule for LLMs:** NEVER read large `.json` catalogs in full. Read this index, jump directly to the needed file, and query the hero/item/ability key with `python -c` or `Select-String`/`rg`.

## Quick Routing Table

| Need | Open / Query File | Guide |
| :--- | :--- | :--- |
| Hero base sounds (`Hero_*`, volume, duration, precache `.vsndevts`) | `reference/sounds/heroes_base.json` | [sounds/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/sounds/INDEX.md) |
| Non-base hero sounds (Arcana, Persona, Immortal, TI, Taunt, sound modifiers) | `reference/sounds/heroes_cosmetic.json` | [sounds/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/sounds/INDEX.md) |
| Item sounds (`DOTA_Item.*`) | `reference/sounds/items.json` | [sounds/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/sounds/INDEX.md) |
| Creeps, Neutrals, Roshan, General world/runes/pings/portals | `reference/sounds/creeps_and_world.json` | [sounds/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/sounds/INDEX.md) |
| UI/Shop sounds, Stingers, & Event SFX (Aghanim, Crownfall, Frostivus, etc.) | `reference/sounds/ui_stingers_and_events.json` | [sounds/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/sounds/INDEX.md) |
| Voiceover & Announcer `.vsndevts` file index (`voscripts/*`) | `reference/sounds/vo_and_announcers.json` | [sounds/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/sounds/INDEX.md) |
| Hero base root `.vpcf` particles (`particles/units/heroes/`) | `reference/particles/heroes_base.json` | [particles/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/particles/INDEX.md) |
| Hero cosmetic/Arcana/Immortal root `.vpcf` (`particles/econ/items/`) | `reference/particles/heroes_cosmetic.json` | [particles/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/particles/INDEX.md) |
| `status_fx/` shaders (`GetStatusEffectName()`), items, neutral & generic FX | `reference/particles/items_status_and_world.json` | [particles/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/particles/INDEX.md) |
| Valid `materials/particle/*.vtex` textures for custom/recolored `.vpcf` | `reference/particles/particle_textures.json` | [particles/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/particles/INDEX.md) |
| Vanilla hero/neutral abilities (`icon`, `behavior`, `dmg`, `cd`, `AbilityValues` keys) | `reference/gameplay/vanilla_abilities.json` | [gameplay/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/gameplay/INDEX.md) |
| Vanilla items (`cost`, `quality`, `icon`, `cd`, `values` keys) | `reference/gameplay/vanilla_items.json` | [gameplay/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/gameplay/INDEX.md) |
| Vanilla hero stats, `ModelScale`, `SoundSet`, `GameSoundsFile`, `abilities` | `reference/gameplay/hero_baselines.json` | [gameplay/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/gameplay/INDEX.md) |
| Valid spell icons (incl. cosmetic variants), item icons & `s2r://.../hud/reborn/*` | `reference/gameplay/ui_and_icons.json` | [gameplay/INDEX.md](file:///c:/Program%20Files%20(x86)/Steam/steamapps/common/dota%202%20beta/game/dota_addons/evo/reference/gameplay/INDEX.md) |
| Hero cosmetics, `.vmdl` slots, and ambient `.vpcf` (`10,876` wearables) | `reference/wearables_catalog.json` | Key: `by_hero["npc_dota_hero_<name>"][slot]` |
| Non-hero `.vmdl` models (`1,280` categorized + `307` `npc_units`) | `reference/unit_models_catalog.json` | Keys: `by_category`, `vanilla_units` |
| Pre-written vanilla abilities in Lua (`289` `ability_lua` + modifiers, older patches) | `reference/vanilla_lua_abilities/INDEX.md` | Port mechanics cleanly to TS (`BaseAbility`) if unchanged |

## Companion Tools (`tools/`)
- **Decompile/inspect any vanilla `.vpcf` (+ ControlPoints & children):**
  ```powershell
  python tools/extract_vpcf.py particles/units/heroes/hero_spectre/spectre_desolate.vpcf --children
  python tools/extract_vpcf.py particles/units/heroes/hero_spectre/spectre_desolate.vpcf --children --out content/dota_addons/evo/particles/my_fx
  ```
- **Regenerate all `sounds/`, `particles/`, and `gameplay/` catalogs after a major Dota 2 patch (~24s):**
  ```powershell
  python tools/generate_reference_catalogs.py
  ```

## Source 2 Integration Reminders
- Every used `.vsndevts` file MUST be precached in `src/vscripts/addon_game_mode.ts` via `PrecacheResource("soundfile", "<precache>", context)`.
- Every cross-hero or custom `.vpcf` MUST be precached via `PrecacheResource("particle", "<path.vpcf>", context)`.
- Custom `.vpcf` authored in `content/dota_addons/evo/particles/` must be compiled with `resourcecompiler.exe -i "<path.vpcf>" -f`.
