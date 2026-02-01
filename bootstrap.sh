#!/bin/bash

set -e

# Gentleman.Dots Bootstrap Script
# This script clones the repository and runs the TUI installer.

REPO_URL="https://github.com/mabuabaranlc/Gentleman.Dots.git"
INSTALL_DIR="$HOME/.gentleman-dots-temp"

echo "🎩 Gentleman.Dots Bootstrap"
echo "──────────────────────────"

# Check if Go is installed
if ! command -v go >/dev/null 2>&1; then
    echo "❌ Error: Go is not installed. Please install Go 1.25+ first."
    echo "Visit: https://go.dev/doc/install"
    exit 1
fi

# Check if Git is installed
if ! command -v git >/dev/null 2>&1; then
    echo "❌ Error: Git is not installed. Please install Git first."
    exit 1
fi

# Clean up previous temp dir if exists
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
fi

# Clone the repository
echo "📥 Cloning repository..."
git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"

# Build the installer
echo "🛠️  Building installer..."
cd "$INSTALL_DIR/installer"
go build -o gentleman-installer ./cmd/gentleman-installer

# Run the installer
echo "🚀 Running installer..."
./gentleman-installer

# Note: The installer itself handles the permanent cloning to the final destination.
# This temp directory can be cleaned up after.
