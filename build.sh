#!/usr/bin/env bash

set -e

# Use writable directories for Rust toolchain
export CARGO_HOME=$HOME/.cargo
export RUSTUP_HOME=$HOME/.rustup
export PATH="$CARGO_HOME/bin:$PATH"

echo "📦 Installing Rust (safe for Render read-only FS)..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Reload environment
source "$CARGO_HOME/env"

# Optional: Upgrade pip
pip install --upgrade pip

# Ensure binary wheels are preferred to avoid source builds where possible
export PIP_ONLY_BINARY=":all:"

echo "📦 Installing requirements..."
pip install -r requirements.txt
