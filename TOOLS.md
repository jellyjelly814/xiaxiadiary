# TOOLS.md - Tool Configuration & Notes

> Document tool-specific configurations, gotchas, and credentials here.

---

## Credentials Location

All credentials stored in `.env` (gitignored):
- `MINIMAX_MUSIC_API_KEY` — MiniMax Music API Key

---

## MiniMax Music API

**Status:** ✅ Working

**Configuration:**
- 存储在: `~/.openclaw/.env`
- 使用方式: `source ~/.openclaw/.env` 然后读取环境变量

---

## 🎵 唱歌脚本 (send_voice.py)

**用途：** 生成音乐并发送到飞书作为语音消息

**脚本位置：** `~/.openclaw/scripts/send_voice.py`

**用法：**
```bash
python3 ~/.openclaw/scripts/send_voice.py "歌词" "音乐风格"
```

**示例：**
```bash
python3 ~/.openclaw/scripts/send_voice.py "[Verse]\n啦噜啦噜啦\n快乐呀" "happy, cheerful, children's song"
```

**重要：** 以后主人说"唱首歌"，就用这个脚本！

---

## [Tool Name]

**Status:** ✅ Working | ⚠️ Issues | ❌ Not configured

**Configuration:**
```
Key details about how this tool is configured
```

**Gotchas:**
- Things that don't work as expected
- Workarounds discovered

**Common Operations:**
```bash
# Example command
tool-name --common-flag
```

---

## Writing Preferences

[Document any preferences about writing style, voice, etc.]

---

## What Goes Here

- Tool configurations and settings
- Credential locations (not the credentials themselves!)
- Gotchas and workarounds discovered
- Common commands and patterns
- Integration notes

## Why Separate?

Skills define *how* tools work. This file is for *your* specifics — the stuff that's unique to your setup.

---

*Add whatever helps you do your job. This is your cheat sheet.*
