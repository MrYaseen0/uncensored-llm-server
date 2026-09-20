#!/bin/bash
# One-shot: steps 1-8, then starts the tunnel (step 9) in the foreground.
# Usage: bash scripts/run-all.sh   (run from the Kaggle working directory)
set -e
cd "$(dirname "$0")"
python3 01-gpu-check.py
bash 02-install-ollama.sh
python3 03-start-server.py
bash 04-download-model.sh
bash 05-create-model.sh
bash 06-warmup.sh
python3 07-speed-test.py
bash 08-install-cloudflared.sh
echo ""
echo "=== ALL STEPS DONE - starting tunnel (keep running) ==="
bash 09-tunnel.sh
