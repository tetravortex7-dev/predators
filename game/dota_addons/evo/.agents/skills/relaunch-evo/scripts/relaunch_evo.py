import argparse
import pathlib
import socket
import struct
import subprocess
import sys
import time

GAME_ROOT = pathlib.Path(__file__).resolve().parents[4]
STEAM_EXE = r"C:\Program Files (x86)\Steam\steam.exe"
VCON_HOST = "127.0.0.1"
VCON_PORT = 29000
VCON_VERSION = 0x00D40000
HEADER_STRUCT = struct.Struct(">4sIHH")


def send_vcon_command(sock: socket.socket, cmd: str) -> None:
    payload = cmd.encode("utf-8") + b"\x00"
    pkt = HEADER_STRUCT.pack(b"CMND", VCON_VERSION, 12 + len(payload), 0) + payload
    sock.sendall(pkt)


def can_connect_vcon(timeout: float = 0.8) -> bool:
    try:
        with socket.create_connection((VCON_HOST, VCON_PORT), timeout=timeout):
            return True
    except OSError:
        return False


def wait_for_vcon(timeout_sec: float) -> socket.socket:
    deadline = time.monotonic() + timeout_sec
    while time.monotonic() < deadline:
        try:
            sock = socket.create_connection((VCON_HOST, VCON_PORT), timeout=2.0)
            sock.settimeout(0.8)
            return sock
        except OSError:
            time.sleep(1.0)
    raise TimeoutError(f"VConsole port {VCON_PORT} did not open within {int(timeout_sec)}s")


def wait_for_pattern(
    sock: socket.socket,
    pattern: str,
    timeout_sec: float,
    errors_out: list[str],
    check_errors: bool = True,
) -> tuple[bool, socket.socket]:
    deadline = time.monotonic() + timeout_sec
    buf = b""
    target = pattern.encode("utf-8")
    while time.monotonic() < deadline:
        while len(buf) >= 12:
            ptype, _ver, total_len, _pipe = HEADER_STRUCT.unpack_from(buf, 0)
            if total_len < 12:
                buf = buf[1:]
                continue
            if len(buf) < total_len:
                break
            body = buf[12:total_len]
            buf = buf[total_len:]
            if ptype == b"PRNT":
                if check_errors:
                    text = body.decode("utf-8", "ignore")
                    for line in text.splitlines():
                        if "Script Runtime Error" in line or "Syntax Error" in line:
                            errors_out.append(line.strip())
                if target in body:
                    return True, sock
        try:
            chunk = sock.recv(8192)
            if not chunk:
                time.sleep(0.1)
                continue
            buf += chunk
        except socket.timeout:
            continue
        except OSError:
            try:
                sock.close()
            except OSError:
                pass
            remaining = max(1.0, deadline - time.monotonic())
            sock = wait_for_vcon(min(15.0, remaining))
    return False, sock


def flush_vcon_backlog(sock: socket.socket) -> socket.socket:
    sentinel = f"__EVO_SYNC_{int(time.time() * 1000)}__"
    send_vcon_command(sock, f"echo {sentinel}")
    _, sock = wait_for_pattern(sock, sentinel, 5.0, [], check_errors=False)
    return sock


def run_build(full_build: bool) -> int:
    if full_build:
        clean_script = GAME_ROOT / ".agents" / "skills" / "clean-build-output" / "scripts" / "clean_build_output.py"
        return subprocess.run([sys.executable, str(clean_script), "--build"], cwd=str(GAME_ROOT)).returncode
    proc = subprocess.run(
        ["npm.cmd", "run", "build:vscripts", "--silent"],
        cwd=str(GAME_ROOT),
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
    )
    if proc.returncode != 0:
        if proc.stdout:
            sys.stdout.write(proc.stdout)
        if proc.stderr:
            sys.stderr.write(proc.stderr)
    return proc.returncode


def clean_logs() -> None:
    clean_script = GAME_ROOT / ".agents" / "skills" / "clean-build-output" / "scripts" / "clean_build_output.py"
    if clean_script.exists():
        subprocess.run([sys.executable, str(clean_script), "--clean-only"], cwd=str(GAME_ROOT))


def main() -> int:
    parser = argparse.ArgumentParser(description="Relaunch or cold-start evo zxc cleanly.")
    parser.add_argument("--build-vscripts", action="store_true")
    parser.add_argument("--full-build", action="store_true")
    parser.add_argument("--pregame", action="store_true")
    parser.add_argument("--hot", action="store_true")
    parser.add_argument("--map", default="zxc")
    args = parser.parse_args()

    if not args.hot:
        subprocess.run(["taskkill", "/F", "/IM", "dota2.exe"], capture_output=True)
        time.sleep(2.0)

    if args.full_build or args.build_vscripts:
        rc = run_build(args.full_build)
        if rc != 0:
            return rc

    if args.hot and can_connect_vcon():
        sock = wait_for_vcon(5.0)
        try:
            send_vcon_command(sock, "script_reload")
            send_vcon_command(sock, "clear")
        finally:
            sock.close()
        clean_logs()
        print("OK (hot-reload): script_reload sent")
        return 0

    target_state = "DOTA_GAMERULES_STATE_PRE_GAME" if args.pregame else "DOTA_GAMERULES_STATE_GAME_IN_PROGRESS"
    errors: list[str] = []

    subprocess.Popen([
        STEAM_EXE,
        "-applaunch", "570",
        "-novid",
        "-tools",
        "-addon", "evo",
        "-console",
        "-vconport", str(VCON_PORT),
    ])
    sock = wait_for_vcon(60.0)
    try:
        _, sock = wait_for_pattern(sock, "Finished requesting news data", 90.0, errors)
        sock = flush_vcon_backlog(sock)
        send_vcon_command(sock, f"dota_launch_custom_game evo {args.map}")
        ok, sock = wait_for_pattern(sock, target_state, 120.0, errors)
        send_vcon_command(sock, "clear")
    finally:
        sock.close()

    clean_logs()
    print(f"OK (relaunch): state={target_state if ok else 'TIMEOUT'}, script_errors={len(errors)}")
    for err in errors[:10]:
        print(f"  ERR: {err}")
    return 0 if ok and not errors else 1


if __name__ == "__main__":
    sys.exit(main())
