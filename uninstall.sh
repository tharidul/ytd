#!/usr/bin/env bash
set -e

INSTALL_PATH="$HOME/.local/bin/ytd"

echo "Uninstalling ytd…"

if [ -f "$INSTALL_PATH" ]; then
  rm "$INSTALL_PATH"
  echo "✔ Removed $INSTALL_PATH"
else
  echo "ytd is not installed in $INSTALL_PATH"
fi

echo
echo "ytd has been uninstalled."
echo "Dependencies (yt-dlp, ffmpeg, gum) were NOT removed."
