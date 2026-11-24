---
name: verify-file-size
description: Verifies that no TypeScript, Panorama XML/CSS, or tool Python file exceeds 500 lines using a fast Python script. Run after edits or builds alongside verify-zero-comments and verify-modifier-loc.
---

# Verify File Size

Run the bundled Python checker from the `game/dota_addons/evo` root:

```powershell
python .agents/skills/verify-file-size/scripts/verify_file_size.py
```

- Scans `src/` (`.ts`, `.css`), `tools/` (`.py`), and `content/panorama/` (`layout/**/*.xml`, `styles/**/*.css`).
- Flags any file exceeding `500` lines (`--max-lines <N>` to override).
- Exits `0` if clean, `1` with line counts sorted descending otherwise.
