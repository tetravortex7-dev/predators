---
name: clean-build-output
description: Runs the addon build silently and cleans all build/log output artifacts and VConsole buffers down to 0 lines after each build so tokens are not wasted re-reading verbose output.
---

# Clean Build Output

Run from `game/dota_addons/evo` root after edits or builds:

```powershell
python .agents/skills/clean-build-output/scripts/clean_build_output.py --clean-only
```

Or run a quiet build + cleanup + verify checks:

```powershell
python .agents/skills/clean-build-output/scripts/clean_build_output.py --build
```

- Truncates any project `*.log` / `*output*.txt` files (outside `node_modules/` and `reference/`) to 0 lines.
- Sends `clear` to Dota 2 VConsole2 (`127.0.0.1:29000`, `PRNT`/command packet if connected) or pair with `dota_send_console_command("clear")` after reload so buffered logs stay at 0 lines.
- On `--build`, executes `npm.cmd run build` quietly (prints lines only if a step fails).
