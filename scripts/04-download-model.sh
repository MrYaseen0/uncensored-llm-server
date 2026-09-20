#!/bin/bash
# Step 4: download Qwen3.8-27B-Uncensored (HauhauCS Aggressive, Q4_K_P) ~17 GB
set -e
GGUF="Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-Q4_K_P.gguf"
URL="https://huggingface.co/HauhauCS/Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-MTP-GGUF/resolve/main/$GGUF"

if [ -f "$GGUF" ] && [ "$(stat -c%s "$GGUF")" -gt 15000000000 ]; then
  echo "[OK] Model already present, skipping download."
  exit 0
fi
echo "Downloading ~17 GB (5-10 min on Kaggle, resumable with -c)..."
wget --show-progress -c -O "$GGUF" "$URL"
SIZE=$(stat -c%s "$GGUF")
if [ "$SIZE" -lt 15000000000 ]; then
  echo "[FAIL] Download incomplete (size=$SIZE). Re-run this script."
  exit 1
fi
echo "[OK] Downloaded ($(numfmt --to=iec "$SIZE"))"
