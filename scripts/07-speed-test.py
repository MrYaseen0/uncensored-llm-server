#!/usr/bin/env python3
"""Step 7: real tokens/sec benchmark through the OpenAI-compatible API."""
import json, subprocess, time

payload = {"model": "hauhau-27b",
           "messages": [{"role": "user",
                         "content": "Write a Python quicksort function with a short explanation."}],
           "max_tokens": 300, "stream": False}
t0 = time.time()
r = subprocess.run(["curl", "-s", "http://127.0.0.1:11434/v1/chat/completions",
                    "-H", "Content-Type: application/json",
                    "-d", json.dumps(payload)],
                   capture_output=True, text=True, timeout=600)
dt = time.time() - t0
data = json.loads(r.stdout)
toks = data.get("usage", {}).get("completion_tokens", 0)
print(data["choices"][0]["message"]["content"][:600])
print(f"\nSPEED: {toks} tokens / {dt:.1f}s = {toks/dt:.1f} tok/s")
print("(27B on 2x T4: 20-40 tok/s is normal.)")
