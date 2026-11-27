# Particle Catalogs (`reference/particles/`)

All verified `.vpcf` and `materials/particle/*.vtex` paths from `pak01_dir.vpk` (auto-filtered from obvious child sub-layers like `_ember`, `_glow`, `_flash`, `_fallback_*`).

## Files
- **`heroes_base.json`** (`139` hero folders, `10,819` root `.vpcf`s, `919 KB`)
  - Schema: `by_hero.<hero_dir>.{total_vpcf, root_count, roots[]}`. Use `hero_baselines.json` -> `particle_folder` if hero folder differs from hero key.
- **`heroes_cosmetic.json`** (`134` hero folders, `23,205` root `.vpcf`s, `2.49 MB`)
  - Schema: `by_hero.<hero_dir>.by_set.<set_folder>[]` — Arcana, Immortal, and set-specific ability FX roots. Ideal for high-tier T3/T4 abilities.
- **`items_status_and_world.json`** (`131 KB`)
  - `status_fx` (`199`): ready-to-use `particles/status_fx/status_effect_*.vpcf` for `BaseModifier.GetStatusEffectName()`.
  - `items_fx_roots` (`1,251`): blink, force, eul, shiva, dagon, meteor, etc.
  - `generic_gameplay_roots` (`199`), `base_attacks_roots` (`47`), `neutral_fx_roots` (`374`), `creature_fx_roots` (`145`).
- **`particle_textures.json`** (`50 KB`)
  - Curated `materials/particle/*.vtex` grouped into `beams_ropes`, `cracks_sigils`, `flares`, `glows`, `rings`, `slashes`, `smoke_fire`, `sparks_embers`.

## Inspecting ControlPoints & Recoloring
NEVER guess ControlPoints (`CP1`, `CP2`, `CP15`, etc.) or attach heights! Inspect or clone any particle into `content/dota_addons/evo/particles/...` via:
```powershell
python tools/extract_vpcf.py particles/units/heroes/hero_spectre/spectre_desolate.vpcf --children
```
- **CRITICAL when authoring custom `.vpcf` from `resourceinfo.exe` output:** `resourceinfo.exe` prints compiled `CParticleCollectionFloatInput` dicts (`{ m_nType = "PF_TYPE_LITERAL" m_flLiteralValue = ... }`), `m_vecTexturesInput`, and `m_nOutputBlendMode`. In source `.vpcf` files for `resourcecompiler.exe` (without `m_nBehaviorVersion`), ALWAYS convert inputs back to plain scalars (`m_nParticlesToEmit = 128`, `m_flInitialSpeedMin = 1850.0`, `m_hTexture = resource:"..."`, `m_bAdditive = true`) and verify with `resourceinfo.exe -b DATA -baremode` after compiling — otherwise `resourcecompiler.exe` silently compiles `m_nParticlesToEmit` to `0.0`!
