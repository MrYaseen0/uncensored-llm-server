#!/usr/bin/env python3
"""Step 1: verify Kaggle GPU (want 2x Tesla T4)."""
import shutil, subprocess

if shutil.which("nvidia-smi") is None:
    raise SystemExit(
        "\n[FAIL] NO GPU! In Kaggle: right sidebar -> Accelerator -> 'GPU T4 x2', "
        "Internet -> ON, then restart the session.\n"
        "(Options grayed out? Kaggle avatar -> Settings -> verify phone number.)\n")

out = subprocess.run(["nvidia-smi", "--query-gpu=name,memory.total", "--format=csv"],
                     capture_output=True, text=True)
print(out.stdout.strip())
n = out.stdout.count("Tesla T4")
print(f"\n[OK] {n}x Tesla T4 ready." if n >= 2
      else "\n[WARN] 2x T4 recommended for the 27B model!")
