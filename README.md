# uncensored-llm-server

Run **Qwen3.8-27B-Uncensored** (HauhauCS Aggressive) on **free Kaggle 2x Tesla T4 GPUs**
via Ollama + Cloudflare tunnel — and connect it to **Forge Desktop**.

- Model: [`HauhauCS/Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-MTP-GGUF`](https://huggingface.co/HauhauCS/Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-MTP-GGUF) (`Q4_K_P`, ~17 GB, official `uncensored` tag)
- Ollama alias: **`hauhau-27b`**
- Speed: **20–40 tok/s** on 2x T4, 100% GPU (flash-attention on)
- API: OpenAI-compatible at `<tunnel-url>/v1`

## Quick start (Kaggle)

Right sidebar → **Accelerator: GPU T4 x2** → **Internet: ON**, then:

```bash
git clone https://github.com/MrYaseen0/uncensored-llm-server.git
cd uncensored-llm-server
bash scripts/run-all.sh
```

Copy the `https://....trycloudflare.com` URL from the output,
then connect Forge → [`docs/FORGE-SETUP.md`](docs/FORGE-SETUP.md).

Prefer clicking cells? Upload [`notebooks/kaggle-qwen38-hauhau-server.ipynb`](notebooks/kaggle-qwen38-hauhau-server.ipynb)
to Kaggle and run it top to bottom.

## What's inside

| Path | What |
|---|---|
| `scripts/01-gpu-check.py` … `scripts/09-tunnel.sh` | Every step as a runnable script |
| `scripts/run-all.sh` | All steps in one shot |
| `notebooks/kaggle-qwen38-hauhau-server.ipynb` | Same pipeline as a Kaggle notebook |
| `docs/STEP-BY-STEP.md` | Detailed step-by-step guide |
| `docs/FORGE-SETUP.md` | Forge Desktop connection settings |
| `docs/TROUBLESHOOTING.md` | Common problems & fixes |

## Notes

- The tunnel URL is **temporary** — restart `scripts/09-tunnel.sh` after a session restart and paste the new URL into Forge.
- Keep the Kaggle tab + tunnel running while you use Forge. Free-tier GPUs can be reclaimed; the keep-alive helps but can't guarantee it.
