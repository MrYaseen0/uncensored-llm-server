#!/bin/bash
# Step 6: warmup - first load of 27B takes 3-6 min, then it stays in VRAM
set -e
time ollama run hauhau-27b "Say 'WARMUP OK' and nothing else."
echo "[OK] Model is in VRAM - next replies will be fast."
