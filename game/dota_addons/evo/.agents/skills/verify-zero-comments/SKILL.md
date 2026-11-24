---
name: verify-zero-comments
description: Verifies that TypeScript, Panorama, and custom NPC KeyValues files contain zero comments using a fast Python script. Run after edits or builds instead of manually inspecting files.
---

# Verify Zero Comments

Run the bundled Python checker from the `game/dota_addons/evo` root:

```powershell
python .agents/skills/verify-zero-comments/scripts/verify_zero_comments.py
```

- Scans `src/` (`.ts`, `.css`) and `scripts/npc/` (`.txt`).
- Ignores `//` inside string literals and Source 2 `<!-- kv3 ... -->` headers.
- Exits `0` if clean, `1` with `path:line` hits if any comments exist.
