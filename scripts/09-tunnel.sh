#!/bin/bash
# Step 9 (LAST): public URL tunnel - KEEP THIS RUNNING while you use Forge.
# Copy the https://....trycloudflare.com URL from the output.
set -e
echo "Starting tunnel - your URL will appear below (keep this running)..."
exec cloudflared tunnel --url http://127.0.0.1:11434 --http-host-header localhost:11434
