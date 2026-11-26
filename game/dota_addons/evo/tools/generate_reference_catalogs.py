import pathlib
import sys
import time

TOOLS_DIR = pathlib.Path(__file__).resolve().parent
if str(TOOLS_DIR) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR))

from ref.build_gameplay import build_gameplay_catalogs
from ref.build_particles import build_particle_catalogs
from ref.build_sounds import build_sound_catalogs
from ref.vpk_io import parse_kv_blocks, read_entry, scan_vpk, write_json

REF_DIR = TOOLS_DIR.parent / "reference"


def main() -> int:
    t0 = time.monotonic()
    print("Scanning pak01_dir.vpk...")
    entries, lists = scan_vpk()
    items_game = parse_kv_blocks(read_entry(entries["scripts/items/items_game.txt"]).decode("utf-8", "ignore"))

    print("Building sound catalogs...")
    for name, payload in build_sound_catalogs(entries, lists["soundevents"], items_game).items():
        write_json(REF_DIR / "sounds" / f"{name}.json", payload)

    print("Building particle catalogs...")
    for name, payload in build_particle_catalogs(lists["particles"], lists["particle_textures"]).items():
        write_json(REF_DIR / "particles" / f"{name}.json", payload)

    print("Building gameplay & UI catalogs...")
    for name, payload in build_gameplay_catalogs(
        entries, lists["scripts"], lists["spellicons"], lists["itemicons"], lists["reborn_hud"]
    ).items():
        write_json(REF_DIR / "gameplay" / f"{name}.json", payload)

    print(f"Done in {time.monotonic() - t0:.2f}s!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
