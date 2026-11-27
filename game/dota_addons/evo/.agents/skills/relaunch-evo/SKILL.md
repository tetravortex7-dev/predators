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
- By default, cleanly closes any running `dota2.exe`, launches `steam.exe -applaunch 570 -novid -tools -addon evo -console -vconport 29000` (NEVER `-dev`, `addon_launch_tools`, `-invisible`, `-silent`, hide, or minimize flags/commands), waits for `"Finished requesting news data"`, sends `dota_launch_custom_game evo zxc` over VConsole, and waits for `GAME_IN_PROGRESS`.
- Wait until `DOTA_GAMERULES_STATE_PRE_GAME` or `GAME_IN_PROGRESS` (after initial load and `[stall] "Stall Detected"` settle) BEFORE calling `dota_window("restore")` -> `dota_focus_window`, then verify `dota_diagnose` shows `game window` visible (`! (not visible)`).
- NEVER call `dota_window`, `dota_focus_window`, or `dota_screenshot(method="window")` if `dota_status` returns `1331x922` (Qt Asset Browser/Hammer handle, fixed in `Dota2_Workshop_MCP` `win32.ts`/`capture.ts` to prefer `SDL_app`).
- Clears VConsole (`clear`), truncates project logs via `clean-build-output`, and prints a 1-line summary (plus any `Script Runtime Error` lines).
