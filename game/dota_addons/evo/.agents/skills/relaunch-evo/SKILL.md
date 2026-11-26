---
name: relaunch-evo
description: Quietly restarts or launches Dota 2 Tools for evo zxc, waits for GAME_IN_PROGRESS, restores and focuses the SDL_app game window cleanly without hiding or minimizing, and clears VConsole and log buffers in one command. Activate whenever the user asks for "перезапуск", "relaunch", or "restart test".
---

# Relaunch Evo

Run from `game/dota_addons/evo` root to relaunch `evo zxc` in one command without burning multiple VConsole/polling turns:

```powershell
python .agents/skills/relaunch-evo/scripts/relaunch_evo.py
```

Flags:
- `--build-vscripts`: compiles `npm.cmd run build:vscripts` silently before relaunching.
- `--full-build`: kills `dota2.exe` first (releasing Panorama locks) and runs `clean_build_output.py --build`.
- `--hot`: runs `script_reload` + `clear` in-place via VConsole when only server Lua function bodies changed.
- `--pregame`: stops waiting at `DOTA_GAMERULES_STATE_PRE_GAME` instead of `DOTA_GAMERULES_STATE_GAME_IN_PROGRESS`.

Behavior:
- By default, cleanly closes any running `dota2.exe`, launches `steam.exe -applaunch 570 -novid -tools -addon evo -console -vconport 29000` (no `-dev`, never hidden/minimized), waits for `"Finished requesting news data"`, launches `evo zxc`, and waits for `GAME_IN_PROGRESS`.
- Clears VConsole (`clear`), truncates project logs via `clean-build-output`, and prints a 1-line summary (plus any `Script Runtime Error` lines).
- When `dota2-workshop` MCP is available after cold-launch, optionally follow with `dota_window("restore")` -> `dota_focus_window` and `dota_diagnose`.
