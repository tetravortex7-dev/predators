---
name: prep-prod
description: Completely strips DevCheats (`src/vscripts/dev/DevCheats.ts`, compiled `scripts/vscripts/dev/DevCheats.lua`, and all `GameMode.ts` wiring/requires), rebuilds vscripts, and verifies zero cheat listeners remain before pushing to prod / Steam Workshop. Also supports `--restore` to bring dev cheats back locally. Activate whenever the user says "пуш в прод", "подготовь к проду", "вырежи читы", or "prod release".
---

# Prep Prod (Strip Dev Cheats)

Run from `game/dota_addons/evo` root before committing/pushing a production release:

```powershell
python .agents/skills/prep-prod/scripts/prep_prod.py
```

Flags:
- Default (no flags): backs up `DevCheats.ts` & `GameMode.ts` to gitignored `.prod_cheat_backup/`, strips all `DevCheats` imports/wiring from `GameMode.ts`, deletes `src/vscripts/dev/` and `scripts/vscripts/dev/`, runs `npm.cmd run build:vscripts` + static verifiers, and verifies `"DevCheats"` is completely absent from `src/` and `scripts/vscripts/`.
- `--restore`: restores `DevCheats.ts` and `GameMode.ts` from `.prod_cheat_backup/` and rebuilds `vscripts` for local development.
- `--dry-run`: checks target references without modifying files.
