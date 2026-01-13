# ytd

`ytd` is a simple, terminal-based YouTube downloader built on top of `yt-dlp`,
with a modern TUI (text user interface) powered by `gum`.

It allows you to download:
- Videos (single or playlist)
- MP3 audio (single or playlist)

All downloads go directly to your **~/Downloads** folder.

---

## Features

- Interactive terminal UI (no typing long commands)
- MP4 or WebM selection for videos
- Quality selection (Best / 1080p / 720p)
- MP3 audio extraction
- Playlist support
- Uses `yt-dlp` and `ffmpeg` internally
- No GUI, no browser, no Electron

---

## Requirements

You must have these installed on your system:

- `bash`
- `yt-dlp`
- `ffmpeg`
- `gum`

On most Linux systems, these are available via the package manager.

---

## Usage

From inside the project directory:

```bash
chmod +x ytd
./ytd
