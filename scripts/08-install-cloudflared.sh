#!/bin/bash
# Step 8: install Cloudflare Tunnel
set -e
wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared-linux-amd64.deb
echo "[OK] cloudflared installed"
