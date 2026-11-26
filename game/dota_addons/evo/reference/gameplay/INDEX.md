# Gameplay, Hero Baselines & UI Catalogs (`reference/gameplay/`)

Parsed directly from `pak01_dir.vpk/scripts/npc/` and `panorama/images/`.

## Files
- **`vanilla_abilities.json`** (`1,361` abilities, `760 KB`)
  - Merged from every `scripts/npc/heroes/npc_dota_hero_*.txt` (`AbilityDefinitions`) + `scripts/npc/npc_abilities.txt`.
  - Fields per ability: `owner`, `icon` (`AbilityTextureName`), `sound`, `type`, `behavior`, `dmg`, `immunity`, `dispellable`, `cd` (or `cd_in_values`), `mana`, `range`, `anim`, `innate`, `breakable`, `maxLevel`, `values` (exact `AbilityValues` key list for `npc_abilities_override.txt` & `DamageFilter`!).
- **`vanilla_items.json`** (`566` items, `161 KB`)
  - From `scripts/npc/items.txt`. Fields: `id`, `cost`, `quality`, `behavior`, `cd`, `mana`, `range`, `values`.
- **`hero_baselines.json`** (`128` heroes, `113 KB`)
  - From `scripts/npc/heroes/npc_dota_hero_*.txt`.
  - Fields: `attr`, `attack`, `range`, `ms`, `armor`, `str`, `agi`, `int`, `vision`, `scale`, `model`, `soundset`, `sounds_file`, `voice_file`, `particle_folder`, `abilities[]`.
  - Crucial for mapping `npc_dota_hero_<x>` -> exact `sounds_file` / `particle_folder` (e.g. `nevermore`, `skeleton_king`, `wisp`, `obsidian_destroyer`).
- **`ui_and_icons.json`** (`188 KB`)
  - `spellicons_cosmetic` (`815`) — Arcana/Immortal/Persona `AbilityTextureName` / `GetTexture()` paths (e.g. `abaddon/mistral_fiend_icons/abaddon_aphotic_shield`)!
  - `spellicons_all` (`2,271`) — all valid spell icons.
  - `item_icons` (`625`) — all `panorama/images/items/` icons.
  - `reborn_hud_vtex` (`376`) — all valid `s2r://panorama/images/hud/reborn/*.vtex` assets for native Dota 2 Reborn Panorama UI.
