import re
from collections import defaultdict

CHILD_PARTICLE_SUFFIXES = (
    "_b", "_c", "_d", "_e", "_f",
    "_ember", "_embers", "_glow", "_flash", "_spark", "_sparks",
    "_smoke", "_trail", "_rope", "_beam", "_debris", "_light",
    "_ring_b", "_ring_c", "_haze", "_swirl", "_steam", "_dust",
    "_flare", "_core", "_core_b", "_edge", "_blur", "_halo",
    "_absorb_dot", "_absorb_ember", "_absorb_trail",
    "_fallback_low", "_fallback_mid", "_low", "_mid",
    "_low_violence", "_aoe", "_dark", "_dark_core", "_shock", "_shock_b",
    "_streaks", "_ray_beam", "_caustic", "_motes", "_parent",
    "_pre_ad", "_pre_dark", "_pre_glow", "_pre_image", "_pre_image_ad", "_pre_light",
    "_pull_ad", "_pull_beam", "_pull_end_b", "_pull_end_c", "_pull_flare",
    "_run_ad", "_run_ember", "_run_flash", "_run_glow",
    "_dot", "_dots", "_drops", "_flecks", "_ground", "_ground_dark",
    "_bits", "_burst_b", "_impact_glow", "_impact_burst", "_impact_flash",
    "_shield_base", "_shield_beam", "_shield_deflect", "_shield_edge", "_shield_stars",
)


def is_root_particle(path: str) -> bool:
    """Heuristically exclude obvious child/fallback sub-layer .vpcf files."""
    stem = path.rsplit("/", 1)[-1][:-5]
    return not any(stem.endswith(suf) or f"{suf}_" in stem for suf in CHILD_PARTICLE_SUFFIXES)


def build_particle_catalogs(particle_paths: list[str], texture_paths: list[str]) -> dict[str, dict[str, object]]:
    """Build categorized particle and texture catalog payloads for particles/*.json."""
    hero_base_all: dict[str, list[str]] = defaultdict(list)
    hero_econ_all: dict[str, dict[str, list[str]]] = defaultdict(lambda: defaultdict(list))
    status_fx: list[str] = []
    items_fx: list[str] = []
    generic_fx: list[str] = []
    base_attacks: list[str] = []
    neutral_fx: list[str] = []
    creature_fx: list[str] = []

    for p in sorted(particle_paths):
        parts = p.split("/")
        if p.startswith("particles/units/heroes/hero_"):
            hero_base_all[parts[3]].append(p)
        elif p.startswith("particles/econ/items/") and len(parts) >= 5:
            hero_econ_all[parts[3]][parts[4]].append(p)
        elif p.startswith("particles/status_fx/"):
            status_fx.append(p)
        elif re.match(r"^particles/items\d*_fx/", p) and is_root_particle(p):
            items_fx.append(p)
        elif p.startswith("particles/generic_gameplay/") and is_root_particle(p):
            generic_fx.append(p)
        elif p.startswith("particles/base_attacks/") and is_root_particle(p):
            base_attacks.append(p)
        elif p.startswith("particles/neutral_fx/") and is_root_particle(p):
            neutral_fx.append(p)
        elif p.startswith(("particles/creatures/", "particles/world_creature_fx/")) and is_root_particle(p):
            creature_fx.append(p)

    hero_base_out: dict[str, object] = {}
    for hero_dir, plist in sorted(hero_base_all.items()):
        roots = [p for p in plist if is_root_particle(p)]
        hero_base_out[hero_dir] = {"total_vpcf": len(plist), "root_count": len(roots), "roots": roots}

    hero_econ_out: dict[str, object] = {}
    for hero_dir, sets in sorted(hero_econ_all.items()):
        by_set = {}
        total_all, total_roots = 0, 0
        for set_dir, plist in sorted(sets.items()):
            total_all += len(plist)
            roots = [p for p in plist if is_root_particle(p)]
            if roots:
                by_set[set_dir] = roots
                total_roots += len(roots)
        hero_econ_out[hero_dir] = {"total_vpcf": total_all, "root_count": total_roots, "by_set": by_set}

    tex_cats: dict[str, list[str]] = defaultdict(list)
    for t in sorted(texture_paths):
        name = t.lower()
        if any(k in name for k in ("beam", "rope", "lightning")):
            tex_cats["beams_ropes"].append(t)
        elif any(k in name for k in ("ring", "halo", "circle")):
            tex_cats["rings"].append(t)
        elif "glow" in name:
            tex_cats["glows"].append(t)
        elif any(k in name for k in ("flare", "star")):
            tex_cats["flares"].append(t)
        elif any(k in name for k in ("slash", "swipe", "blade")):
            tex_cats["slashes"].append(t)
        elif any(k in name for k in ("crack", "rune", "symbol", "sigil")):
            tex_cats["cracks_sigils"].append(t)
        elif any(k in name for k in ("smoke", "cloud", "fire", "flame")):
            tex_cats["smoke_fire"].append(t)
        elif any(k in name for k in ("spark", "ember", "fleck", "blood")):
            tex_cats["sparks_embers"].append(t)

    return {
        "heroes_base": {"meta": {"source": "pak01_dir.vpk/particles/units/heroes", "heroes": len(hero_base_out), "total_roots": sum(v["root_count"] for v in hero_base_out.values())}, "by_hero": hero_base_out},
        "heroes_cosmetic": {"meta": {"source": "pak01_dir.vpk/particles/econ/items", "heroes": len(hero_econ_out), "total_roots": sum(v["root_count"] for v in hero_econ_out.values())}, "by_hero": hero_econ_out},
        "items_status_and_world": {"meta": {"source": "pak01_dir.vpk/particles"}, "status_fx": status_fx, "items_fx_roots": items_fx, "generic_gameplay_roots": generic_fx, "base_attacks_roots": base_attacks, "neutral_fx_roots": neutral_fx, "creature_fx_roots": creature_fx},
        "particle_textures": {"meta": {"source": "pak01_dir.vpk/materials/particle", "note": "Curated sprite/beam/ring/glow .vtex resources for custom .vpcf authoring"}, "by_category": dict(sorted(tex_cats.items()))},
    }
