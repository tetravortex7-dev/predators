import os
import re
from collections import defaultdict

from ref.vpk_io import decode_soundevents

COSMETIC_SOUND_HINTS = (
    ".Arcana", "_Arcana", ".arcana",
    ".Persona", "_Persona", ".persona",
    ".Immortal", "_Immortal", ".immortal",
    ".Taunt", "_Taunt", ".taunt",
    ".ti6", ".ti7", ".ti8", ".ti9", ".ti10", ".ti11", ".ti12", ".ti13",
    ".TI6", ".TI7", ".TI8", ".TI9", ".TI10", ".TI11", ".TI12", ".TI13",
    ".Alt", ".AltRun", ".2021", ".Frostivus", ".Diretide", ".Crownfall",
    "ProgressNormal", "ProgressComplete", "_Arc_", "_Alt",
)


def parse_vsndevts_kv3(kv_text: str) -> dict[str, dict[str, object]]:
    """Extract compact metadata for each soundevent key in decompiled KV3 text."""
    events: dict[str, dict[str, object]] = {}
    lines = kv_text.splitlines()
    n = len(lines)
    i = 0
    while i < n:
        m = re.match(r"^\t([A-Za-z0-9_.$-]+)\s*=\s*$", lines[i])
        if not m:
            i += 1
            continue
        ev_name = m.group(1)
        block_lines = []
        i += 1
        while i < n:
            line = lines[i]
            block_lines.append(line)
            if line == "\t}":
                break
            i += 1
        block = "\n".join(block_lines)
        ev_type = re.search(r'^\t\ttype\s*=\s*"([^"]+)"', block, re.MULTILINE)
        vol = re.search(r"^\t\tvolume\s*=\s*([0-9.+-]+)", block, re.MULTILINE)
        dur = re.search(r"^\t\tvsnd_duration\s*=\s*([0-9.+-]+)", block, re.MULTILINE)
        lvl = re.search(r"^\t\tsoundlevel\s*=\s*([0-9.+-]+)", block, re.MULTILINE)
        pitch = re.search(r"^\t\tpitch\s*=\s*([0-9.+-]+)", block, re.MULTILINE)
        layer2 = re.search(r'^\t\tsoundevent_layer2\s*=\s*"([^"]+)"', block, re.MULTILINE)
        files = re.findall(r'"(sounds/[^"]+\.vsnd)"', block)
        info: dict[str, object] = {}
        if ev_type:
            info["type"] = ev_type.group(1)
        if vol:
            info["vol"] = round(float(vol.group(1)), 2)
        if dur:
            info["dur"] = round(float(dur.group(1)), 2)
        if lvl:
            info["lvl"] = int(float(lvl.group(1)))
        if pitch and abs(float(pitch.group(1)) - 1.0) > 0.01:
            info["pitch"] = round(float(pitch.group(1)), 2)
        if layer2:
            info["layer2"] = layer2.group(1)
        if files:
            info["files"] = files[:3] if len(files) <= 3 else [files[0], f"+{len(files) - 1} more"]
        events[ev_name] = info
        i += 1
    return events


def collect_items_game_sound_overrides(items_game: dict[str, object]) -> tuple[dict[str, list[dict[str, str]]], set[str]]:
    """Collect cosmetic sound replacements mapped from items_game.txt visuals."""
    items_section = items_game.get("items_game", {})
    raw_items = items_section.get("items", {}) if isinstance(items_section, dict) else {}
    by_hero: dict[str, list[dict[str, str]]] = defaultdict(list)
    targets: set[str] = set()
    if not isinstance(raw_items, dict):
        return {}, targets
    for item_id, item_data in raw_items.items():
        if not isinstance(item_data, dict):
            continue
        visuals = item_data.get("visuals")
        if not isinstance(visuals, dict):
            continue
        item_name = str(item_data.get("name", f"item_{item_id}"))
        rarity = str(item_data.get("item_rarity", "common"))
        used_by = item_data.get("used_by_heroes")
        hero_key = next(iter(used_by.keys()), "shared") if isinstance(used_by, dict) and used_by else "shared"
        for vv in visuals.values():
            if not isinstance(vv, dict) or vv.get("type") != "sound":
                continue
            asset = str(vv.get("asset", ""))
            modifier = str(vv.get("modifier", ""))
            if not modifier or asset == modifier:
                continue
            targets.add(modifier)
            by_hero[hero_key].append({"item": item_name, "rarity": rarity, "replaces": asset, "modifier": modifier})
    dedup: dict[str, list[dict[str, str]]] = {}
    for hero_key, items_list in sorted(by_hero.items()):
        seen_pairs: set[tuple[str, str, str]] = set()
        clean_list = []
        for entry in items_list:
            sig = (entry["replaces"], entry["modifier"], entry["item"])
            if sig not in seen_pairs:
                seen_pairs.add(sig)
                clean_list.append(entry)
        dedup[hero_key] = clean_list
    return dedup, targets


def build_sound_catalogs(
    entries: dict[str, tuple[int, int, int, bytes]],
    sv_paths: list[str],
    items_game: dict[str, object],
) -> dict[str, dict[str, object]]:
    """Build categorized sound catalog payloads for sounds/*.json."""
    non_vo_paths = [p for p in sv_paths if not p.startswith("soundevents/voscripts/")]
    vo_paths = [p for p in sv_paths if p.startswith("soundevents/voscripts/")]

    decoded_non_vo = decode_soundevents(entries, non_vo_paths)
    decoded_vo = decode_soundevents(entries, vo_paths)
    dedup_overrides, modifier_targets = collect_items_game_sound_overrides(items_game)

    heroes_base: dict[str, object] = {}
    heroes_cosmetic_events: dict[str, object] = {}
    special_cosmetic_packs: dict[str, object] = {}
    items_events: dict[str, object] = {}
    creeps_world: dict[str, object] = {}
    ui_stingers_events: dict[str, object] = {}

    for full in sorted(non_vo_paths):
        precache = full[:-2]
        parsed = parse_vsndevts_kv3(decoded_non_vo.get(full, ""))
        if not parsed:
            continue
        if full.startswith("soundevents/game_sounds_heroes/"):
            hero_slug = os.path.basename(precache).replace("game_sounds_", "").replace(".vsndevts", "")
            if hero_slug == "muerta_release_event":
                special_cosmetic_packs[hero_slug] = {"precache": precache, "count": len(parsed), "events": parsed}
                continue
            base_map, cos_map = {}, {}
            for ev_name, ev_info in parsed.items():
                if ev_name in modifier_targets or any(h in ev_name for h in COSMETIC_SOUND_HINTS):
                    cos_map[ev_name] = ev_info
                else:
                    base_map[ev_name] = ev_info
            if base_map:
                heroes_base[hero_slug] = {"precache": precache, "count": len(base_map), "events": base_map}
            if cos_map:
                heroes_cosmetic_events[hero_slug] = {"precache": precache, "count": len(cos_map), "events": cos_map}
        elif full == "soundevents/game_sounds_items.vsndevts_c":
            items_events = {"precache": precache, "count": len(parsed), "events": parsed}
        elif full in (
            "soundevents/game_sounds.vsndevts_c",
            "soundevents/game_sounds_creeps.vsndevts_c",
            "soundevents/game_sounds_ambient.vsndevts_c",
            "soundevents/game_sounds_roshan_halloween.vsndevts_c",
            "soundevents/game_sounds_greevils.vsndevts_c",
        ):
            pack_key = os.path.basename(precache).replace(".vsndevts", "")
            creeps_world[pack_key] = {"precache": precache, "count": len(parsed), "events": parsed}
        elif full in (
            "soundevents/game_sounds_cny.vsndevts_c",
            "soundevents/music/terrorblade_arcana/soundevents_stingers.vsndevts_c",
        ):
            pack_key = "terrorblade_arcana_stingers" if "terrorblade_arcana" in full else "cny_year_beast"
            special_cosmetic_packs[pack_key] = {"precache": precache, "count": len(parsed), "events": parsed}
        elif full.startswith("soundevents/music/"):
            pack_key = full.replace("soundevents/music/", "").replace(".vsndevts_c", "").replace("/", "_")
            ui_stingers_events.setdefault("stingers", {})[pack_key] = {"precache": precache, "count": len(parsed), "events": parsed}
        elif full in (
            "soundevents/game_sounds_ui_imported.vsndevts_c",
            "soundevents/soundevents_dota_ui.vsndevts_c",
            "soundevents/soundevents_dota.vsndevts_c",
            "soundevents/game_sounds_hero_pick.vsndevts_c",
        ):
            pack_key = os.path.basename(precache).replace(".vsndevts", "")
            if pack_key == "game_sounds_hero_pick":
                picks = {k: v for k, v in parsed.items() if k.startswith("Hero_")}
                ui_stingers_events.setdefault("ui_and_pick", {})[pack_key] = {"precache": precache, "hero_pick_count": len(picks), "total_keys": len(parsed), "events": picks}
            else:
                ui_stingers_events.setdefault("ui_and_pick", {})[pack_key] = {"precache": precache, "count": len(parsed), "events": parsed}
        else:
            pack_key = os.path.basename(precache).replace("soundevents_", "").replace(".vsndevts", "")
            ui_stingers_events.setdefault("event_sfx_packs", {})[pack_key] = {"precache": precache, "count": len(parsed), "events": parsed}

    vo_index: dict[str, object] = {"hero_vo": {}, "econ_vo": {}, "announcers": {}, "events_vo": {}}
    for full in sorted(vo_paths):
        precache = full[:-2]
        keys = list(parse_vsndevts_kv3(decoded_vo.get(full, "")).keys())
        fname = os.path.basename(precache).replace(".vsndevts", "")
        summary = {"precache": precache, "count": len(keys), "sample_keys": keys[:8]}
        if "announcer" in fname:
            vo_index["announcers"][fname] = summary
        elif "econ_" in fname:
            vo_index["econ_vo"][fname] = summary
        elif any(tag in fname for tag in ("event_", "dark_carnival", "siltbreaker", "ringmaster_carnival")):
            vo_index["events_vo"][fname] = summary
        else:
            vo_index["hero_vo"][fname.replace("game_sounds_vo_", "")] = summary

    return {
        "heroes_base": {"meta": {"source": "pak01_dir.vpk/soundevents/game_sounds_heroes", "heroes": len(heroes_base), "total_events": sum(v["count"] for v in heroes_base.values())}, "by_hero": heroes_base},
        "heroes_cosmetic": {"meta": {"source": "pak01_dir.vpk soundevents + items_game.txt sound asset_modifiers", "heroes_with_cosmetic_events": len(heroes_cosmetic_events), "heroes_with_items_game_overrides": len(dedup_overrides)}, "soundevents_by_hero": heroes_cosmetic_events, "special_packs": special_cosmetic_packs, "items_game_overrides": dedup_overrides},
        "items": {"meta": {"source": "pak01_dir.vpk/soundevents/game_sounds_items.vsndevts_c"}, **items_events},
        "creeps_and_world": {"meta": {"source": "pak01_dir.vpk", "packs": list(creeps_world.keys())}, "packs": creeps_world},
        "ui_stingers_and_events": {"meta": {"source": "pak01_dir.vpk"}, **ui_stingers_events},
        "vo_and_announcers": {"meta": {"source": "pak01_dir.vpk/soundevents/voscripts", "total_files": len(vo_paths)}, **vo_index},
    }
