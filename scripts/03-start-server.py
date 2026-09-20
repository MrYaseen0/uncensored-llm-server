#!/usr/bin/env python3
"""Step 3: start Ollama server in background (survives long downloads)."""
import shutil, subprocess, time, os, urllib.request

if shutil.which("ollama") is None:
    raise SystemExit("[FAIL] ollama not installed - run 02-install-ollama.sh first.")

os.environ["OLLAMA_KEEP_ALIVE"] = "30m"      # keep model in VRAM 30 min
os.environ["OLLAMA_FLASH_ATTENTION"] = "1"   # faster inference on T4

subprocess.run(["pkill", "-f", "ollama serve"], capture_output=True)
time.sleep(2)
subprocess.Popen(["nohup", "ollama", "serve"],
                 stdout=open("/tmp/ollama.log", "w"),
                 stderr=subprocess.STDOUT, start_new_session=True,
                 env=dict(os.environ))
for i in range(30):
    try:
        urllib.request.urlopen("http://127.0.0.1:11434/", timeout=3)
        print("[OK] Ollama server is UP")
        break
    except Exception:
        print(f"waiting... ({i+1})")
        time.sleep(2)
else:
    raise SystemExit("[FAIL] server did not start. tail /tmp/ollama.log")
