#!/bin/bash
# Step 2: install Ollama (zstd fix included - new Ollama installer needs it)
set -e
apt-get update -qq && apt-get install -y -qq zstd
rm -f /usr/local/bin/ollama
curl -L --retry 3 https://ollama.com/install.sh | sh
ollama --version
echo "[OK] Ollama installed"
