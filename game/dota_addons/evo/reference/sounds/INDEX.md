# Sound Catalogs (`reference/sounds/`)

All soundevents extracted & decompiled directly from `pak01_dir.vpk` via `resourceinfo.exe`.

## Files
- **`heroes_base.json`** (`127` heroes, `2,528` events, `717 KB`)
  - Schema: `by_hero.<hero_slug>.{precache, count, events.<EventName>.{type, vol, dur, lvl, pitch?, layer2?, files}}`
  - Note: Check `vol` (`volume`) before picking a sound! Sounds with `vol < 0.6` (e.g. `Hero_Spectre.Desolate` `0.5`) can sound too soft for active skills — pair or swap with `vol: 1.0` (`dota_update_default` or `dota_src1_3d`).
- **`heroes_cosmetic.json`** (`108` heroes w/ cosmetic events, `63` w/ `items_game` sound overrides, `359 KB`)
  - `soundevents_by_hero.<hero_slug>` — `.Arcana`, `.Persona`, `.Immortal`, `.Taunt`, `.ti*`, `.Alt` variants + their exact `precache` `.vsndevts`.
  - `special_packs` — `muerta_release_event`, `cny_year_beast`, `terrorblade_arcana_stingers`.
  - `items_game_overrides.npc_dota_hero_<name>` — exact mapping `{item, rarity, replaces, modifier}` from `items_game.txt`.
- **`items.json`** (`211` events, `44 KB`)
  - All `DOTA_Item.*` sounds in `soundevents/game_sounds_items.vsndevts`.
- **`creeps_and_world.json`** (`223 KB`)
  - `packs.game_sounds_creeps` — lane creeps, siege creeps, neutrals, ancient/Roshan hits.
  - `packs.game_sounds` — shared combat, portals, runes, pings, fountain, footsteps (`General.*`, `BaseEntity.*`, `Portal.*`).
  - `packs.game_sounds_ambient`, `game_sounds_roshan_halloween`, `game_sounds_greevils`.
- **`ui_stingers_and_events.json`** (`765 KB`)
  - `ui_and_pick`: `game_sounds_ui_imported` (shop, gold, select, buy), `soundevents_dota_ui`, `soundevents_dota`, `game_sounds_hero_pick` (`Hero_*.Pick`).
  - `stingers`: `game_sounds_stingers_main`, `game_sounds_stingers_diretide`, music pack stingers (great for duel/boss banners!).
  - `event_sfx_packs`: `aghanim`, `conquest`, `crownfall`, `dark_carnival`, `fighting_game`, `frostivus`, `monster_hunter`, `quartero`, `survivors`, `techiemen`. Great source of boss slams, portals, shields, explosions, and hits.
- **`vo_and_announcers.json`** (`206` files, `111 KB`)
  - File paths, key counts, and sample keys for `hero_vo`, `econ_vo` (Arcana/Persona VO), `announcers`, and `events_vo`.

## Fast Lookup (1-liner)
```powershell
python -c "import json; d=json.load(open('reference/sounds/heroes_base.json',encoding='utf-8'))['by_hero']['spectre']; print(d['precache']); print(list(d['events'].items())[:10])"
```
