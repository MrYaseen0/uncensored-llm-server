# Step-by-step guide (Kaggle)

**Model:** `HauhauCS/Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-MTP-GGUF`
(`Q4_K_P` quant, ~17 GB) → Ollama alias **`hauhau-27b`**

## 0. Kaggle session setup (once)
1. Kaggle notebook open karo → right sidebar:
   - **Accelerator:** `GPU T4 x2`
   - **Internet:** `ON`
2. Agar GPU options grayed out hain: avatar → Settings → **phone number verify** karo.

## 1. GPU check
```bash
python3 scripts/01-gpu-check.py
```
`[OK] 2x Tesla T4 ready.` aana chahiye.

## 2. Install Ollama
```bash
bash scripts/02-install-ollama.sh
```
(New Ollama installer needs `zstd` — script handles it.)

## 3. Start server (background)
```bash
python3 scripts/03-start-server.py
```
`nohup` = long download ke dauraan server marta nahi. Flash-attention ON.

## 4. Download model (~17 GB, 5–10 min)
```bash
bash scripts/04-download-model.sh
```
Progress bar aayega. `-c` flag = resume supported, beech mein ruke to dobara chalao.

## 5. Register in Ollama + GPU proof
```bash
bash scripts/05-create-model.sh
```
`ollama ps` me GPU split aur `nvidia-smi` me dono GPUs par `memory.used > 0`
hona chahiye = **100% GPU, zero CPU offload**.

## 6. Warmup (3–6 min, sirf pehli dafa)
```bash
bash scripts/06-warmup.sh
```
27B pehli dafa VRAM me load hone me time leta hai — ghabrana nahi.

## 7. Speed test (asal tok/s number)
```bash
python3 scripts/07-speed-test.py
```
**20–40 tok/s** = normal for 27B on 2x T4.

## 8. Cloudflared install
```bash
bash scripts/08-install-cloudflared.sh
```

## 9. Tunnel (AAKHRI — chalne do)
```bash
bash scripts/09-tunnel.sh
```
Output me `https://....trycloudflare.com` milega — **ye copy karo**.
Cell/session band ki to URL expire → dobara chalana padega.

## 10. Forge Desktop se connect
`docs/FORGE-SETUP.md` dekho.

---
**Shortcut:** `bash scripts/run-all.sh` steps 1–9 ek saath kar deta hai.
**Notebook pasand hai?** `notebooks/kaggle-qwen38-hauhau-server.ipynb` upload karke
cell-by-cell bhi chala sakte ho — wahi steps hain.
