# Troubleshooting

| Problem | Fix |
|---|---|
| `NO GPU` | Sidebar → Accelerator `GPU T4 x2`, Internet `ON`, session restart |
| GPU options grayed out | Kaggle avatar → Settings → verify phone number |
| Ollama install fails | `02-install-ollama.sh` dobara chalao (has `zstd` fix + retry) |
| Server won't start | `cat /tmp/ollama.log` dekho; `03-start-server.py` dobara |
| Download stuck/fails | `04-download-model.sh` dobara (resume supported); Internet ON check karo |
| `ollama ps` shows 0% GPU / CPU | 27B Q4 (~17 GB) needs 2x T4; single T4 par VRAM kam padega |
| Slow tok/s (< 15) | Warmup hua? `06-warmup.sh` chalao; `nvidia-smi` me memory.used check karo |
| Tunnel URL not working in Forge | `/v1` lagana na bhoolo; API key `ollama`; Model `hauhau-27b` |
| Forge "thinking" forever | Purana/expired tunnel URL — `09-tunnel.sh` se naya URL lo |
| Session died / GPU reclaimed | Kaggle free tier limit — notebook dobara run karo (model dobara download hoga) |

## Disk space
Kaggle disk ~20 GB hai. Agar pehle koi aur GGUF download ki thi to delete karo:
```bash
rm -f *.gguf   # sirf tab jab purana model nahi chahiye
```
