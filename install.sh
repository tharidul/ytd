#!/usr/bin/env bash
set -e

PROJECT_NAME="ytd"
REPO_RAW="https://raw.githubusercontent.com/tharidul/ytd/main"
INSTALL_DIR="$HOME/.local/bin"

echo "Installing $PROJECT_NAME…"

# -------------------------------
# Detect distro
# -------------------------------
if [ -f /etc/os-release ]; then
  . /etc/os-release
  DISTRO="$ID"
else
  echo "Cannot detect Linux distribution"
  exit 1
fi

# -------------------------------
# Install dependencies
# -------------------------------
install_deps() {
  echo "Installing dependencies for $DISTRO…"

  case "$DISTRO" in
    arch|cachyos)
      sudo pacman -S --needed --noconfirm yt-dlp ffmpeg gum
      ;;
    ubuntu|debian)
      sudo apt update
      sudo apt install -y yt-dlp ffmpeg curl gpg
      if ! command -v gum >/dev/null; then
        curl -fsSL https://repo.charm.sh/apt/gpg.key |
          sudo gpg --dearmor -o /usr/share/keyrings/charm.gpg
        echo "deb [signed-by=/usr/share/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" |
          sudo tee /etc/apt/sources.list.d/charm.list
        sudo apt update
        sudo apt install -y gum
      fi
      ;;
    fedora)
      sudo dnf install -y yt-dlp ffmpeg-free gum
      ;;
    *)
      echo "Unsupported distro: $DISTRO"
      echo "Please install yt-dlp, ffmpeg, and gum manually."
      exit 1
      ;;
  esac
}

# -------------------------------
# Check dependencies
# -------------------------------
for cmd in yt-dlp ffmpeg gum curl; do
  if ! command -v "$cmd" >/dev/null; then
    install_deps
    break
  fi
done

# -------------------------------
# Install ytd binary
# -------------------------------
mkdir -p "$INSTALL_DIR"

echo "Downloading ytd…"
curl -fsSL "$REPO_RAW/ytd" -o "$INSTALL_DIR/ytd"

chmod +x "$INSTALL_DIR/ytd"

# -------------------------------
# Ensure PATH
# -------------------------------
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
  echo "Adding $INSTALL_DIR to PATH"
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
fi

echo
echo "✅ ytd installed successfully"
echo "➡ Restart your terminal or run: source ~/.zshrc"
