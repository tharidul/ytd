# ytd

**ytd** is a terminal-based YouTube downloader built on top of `yt-dlp`, with a modern TUI powered by `gum`.

Built and maintained by **LKML**  
🌐 https://lkml.live

All downloads go directly to your **~/Downloads** folder.

---

## Quick Install (Recommended)

Install `ytd` with a single command:
```bash
curl -fsSL https://raw.githubusercontent.com/tharidul/ytd/main/install.sh | bash
```

Restart your terminal, then run:
```bash
ytd
```

⚠️ If you prefer, review the script before running it: [install.sh](https://raw.githubusercontent.com/tharidul/ytd/main/install.sh)

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
```

---

## Author

**LKML**  
Full-stack developer & Linux enthusiast  
🌐 https://lkml.live

This project is developed for learning, automation, and personal productivity.

---

## License

MIT
