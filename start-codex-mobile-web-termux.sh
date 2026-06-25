#!/data/data/com.termux/files/usr/bin/bash
# Codex Mobile Web - Termux Launcher (CPH1823 / Android)
# Optimized for Termux on device CPH1823

set -e

echo "=== Codex Mobile Web - Termux (CPH1823) ==="

# Wake lock to prevent sleep
termux-wake-lock 2>/dev/null || true

# Ensure storage permission
if [ ! -d "$HOME/storage" ]; then
    echo "Requesting storage permission..."
    termux-setup-storage
fi

# Install dependencies if needed
if ! command -v node >/dev/null 2>&1; then
    echo "Installing Node.js in Termux..."
    pkg update -y && pkg install -y nodejs git
fi

# Project directory
PROJECT_DIR="$HOME/codex-mobile-web"

if [ ! -d "$PROJECT_DIR" ]; then
    echo "Cloning repository..."
    git clone https://github.com/ivansslo/codex-mobile-web.git "$PROJECT_DIR"
fi

cd "$PROJECT_DIR"

echo "Installing dependencies..."
npm install --no-audit --no-fund

# Use port 8080 for Termux (common alternative)
PORT=${PORT:-8080}

echo ""
echo "Starting Codex Mobile Web on Termux..."
echo "Access at: http://localhost:$PORT"
echo "Or from other devices: http://$(ip addr show wlan0 2>/dev/null | grep 'inet ' | awk '{print $2}' | cut -d/ -f1):$PORT"
echo ""
echo "Press Ctrl+C to stop. Use 'termux-wake-lock' to keep running in background."

node server.js --port "$PORT"
