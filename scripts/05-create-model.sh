#!/bin/bash
# Step 5: register the GGUF in Ollama as 'hauhau-27b' and prove 100% GPU
set -e
cat > Modelfile << 'EOF'
FROM ./Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-Q4_K_P.gguf
PARAMETER num_ctx 4096
PARAMETER temperature 0.8
EOF
ollama create hauhau-27b -f Modelfile
echo ""
echo "--- ollama ps (expect GPU split across both T4s) ---"
ollama ps
echo ""
echo "--- nvidia-smi (memory.used must be > 0 on both) ---"
nvidia-smi --query-gpu=index,name,memory.used,memory.total --format=csv
