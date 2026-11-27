---
name: dev-start-hero
description: Switches the player's starting hero from starter Wisp to any T1 hero (or T2-T4 branch body) in Tools dev mode to save time during testing. Activate whenever the user says "тестим <hero>", "спавнь <hero>", "старт за <hero>", "верни виспа", "сбрось старт", or wants to spawn directly as a specific hero instead of Wisp.
---

# Dev Start Hero

Run from `game/dota_addons/evo` root to switch `DEV_START_BODY_ID` in `src/vscripts/data/game_constants.ts` (active ONLY in `IsInToolsMode()`, ignored in live matches):

```powershell
# Spawn directly as T1 Spectre at 0:00 instead of Wisp
python .agents/skills/dev-start-hero/scripts/set_start_hero.py spectre --build

# Spawn directly as a specific branch/tier (e.g. T2 or T4 INT Mirror Spectre)
python .agents/skills/dev-start-hero/scripts/set_start_hero.py spectre --branch mirror --tier 4 --build

# Reset back to normal T0 starter Wisp
python .agents/skills/dev-start-hero/scripts/set_start_hero.py reset --build

# List all discovered heroes, branches, and body IDs from data/branches/*.json
python .agents/skills/dev-start-hero/scripts/set_start_hero.py --list
```

Then relaunch `evo zxc` cleanly via the `relaunch-evo` skill (`python .agents/skills/relaunch-evo/scripts/relaunch_evo.py`), because `SetCustomGameForceHero` and sync precache run at map load.

Supported shortcuts (RU & EN):
- Reset / Wisp: `wisp`, `висп`, `виспа`, `amoeba`, `reset`, `default`, `сброс`, `обычный`
- Heroes: `spectre`/`спектра`, `nyx`/`никс`, `slark`/`сларк`, `morph`/`морф`, `bristle`/`бристл`, `venomancer`/`veno`/`веник`, or any `evo_body_*` ID / hero key in `data/branches/*.json`.
