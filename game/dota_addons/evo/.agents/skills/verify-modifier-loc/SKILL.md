---
name: verify-modifier-loc
description: Verifies that every visible TypeScript modifier has both title and description tooltips (DOTA_Tooltip_<mod> and _Description) in Russian and English localization files. Run after adding or editing modifiers.
---

# Verify Modifier Localization

Run the bundled Python checker from the `game/dota_addons/evo` root:

```powershell
python .agents/skills/verify-modifier-loc/scripts/verify_modifier_loc.py
```

- Scans `src/vscripts/` for all `@registerModifier("...")` classes.
- Skips hidden modifiers (`IsHidden()` returning `true`, `BaseTalentModifier`, `BaseCreepAuraEmitter`).
- Verifies `DOTA_Tooltip_<mod>` and `DOTA_Tooltip_<mod>_Description` exist in both `resource/addon_russian.txt` and `resource/addon_english.txt`.
- Exits `0` if clean, `1` with missing keys per modifier otherwise.
