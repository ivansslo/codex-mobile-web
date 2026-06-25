#!/data/data/com.termux/files/usr/bin/bash
# Codex Mobile Web - Linux Android ARM64 Launcher (Termux CPH1823)
# Optimized for ARM64 devices like CPH1823 (Oppo/Realme)

set -e

echo "=== Codex Mobile Web - Linux Android ARM64 (CPH1823) ==="

# Prevent device sleep
termux-wake-lock 2>/dev/null || true

# Setup storage if needed
if [ ! -d "$HOME/storage" ]; then
    echo "Setting up storage access..."
    termux-setup-storage || true
fi

# Install required packages for ARM64 Termux
if ! command -v node >/dev/null 2>&1; then
    echo "Installing Node.js (ARM64)..."
    pkg update -y
    pkg install -y nodejs git curl
fi

PROJECT_DIR="${PROJECT_DIR:-$HOME/codex-mobile-web}"

if [ ! -d "$PROJECT_DIR" ]; then
    echo "Cloning Codex Mobile Web..."
    git clone https://github.com/ivansslo/codex-mobile-web.git "$PROJECT_DIR"
fi

cd "$PROJECT_DIR"

echo "Installing dependencies..."
npm install --no-audit --no-fund --prefer-offline 2>/dev/null || npm install

# Default port for Termux (avoid conflicts)
PORT=${PORT:-8080}

echo ""
echo "🚀 Starting Codex Mobile Web"
echo "   Local:   http://localhost:$PORT"
echo "   Network: http://$(ip -4 addr show wlan0 2>/dev/null | grep inet | awk '{print $2}' | cut -d/ -f1 || echo 'your-ip'):$PORT"
echo ""
echo "   Press Ctrl+C to stop"
echo "   Use: termux-wake-lock (to keep running in background)"
echo ""

exec node server.js
