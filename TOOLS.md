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

---

## 🎵 唱歌 - send_voice.py（生成音乐）

**用途：** 用 MiniMax Music API 生成音乐（带旋律的歌曲）

**脚本位置：** `~/.openclaw/scripts/send_voice.py`

**用法：**
```bash
python3 ~/.openclaw/scripts/send_voice.py "歌词" "音乐风格"
```

**示例：**
```bash
python3 ~/.openclaw/scripts/send_voice.py "[Verse]\n啦噜啦噜啦\n快乐呀" "happy, cheerful, children's song"
```

**注意：** 需要 MINIMAX_MUSIC_API_KEY（已配置）

---

## 🎤 发语音 - mmEasyVoice（文字转语音）

**用途：** 用 MiniMax Voice API 把文字变成人声语音（朗读）

**需要的 Key：** 在 `~/.openclaw/.env` 里找 `MINIMAX_VOICE_API_KEY`

**操作步骤：**
1. 生成语音 MP3：
   ```bash
   source ~/.openclaw/.env
   python3 ~/.openclaw/skills/MiniMaxSkills/mmEasyVoice/mmvoice.py tts "文字内容" -o /tmp/voice.mp3
   ```
2. 转 opus 格式：
   ```bash
   ffmpeg -i /tmp/voice.mp3 -c:a libopus -b:a 128k /tmp/voice.opus -y
   ```
3. 调用飞书 API 发送语音消息（msg_type: "audio"）

**禁止：** 用 gateway 内置 TTS 工具（会生成空文件！）

---

## 🔍 Web Search 工作流（重要！）

**当遇到任何 web search / 联网搜索任务时，必须按以下顺序执行：**

### ⚡ 第一步（必须先执行）：使用 Tavily skill 搜索
- 安装了 `openclaw-tavily-search`
- 需要 Tavily API Key 配置（尚未配置）
- **如果没配置 Tavily，必须提醒主人配置！**

### ⚡ 第二步：使用 multi-search-engine1 搜索
- 安装了 `multi-search-engine1`
- 无需 API Key，支持 17 个搜索引擎
- 用法：`pinchtab nav` 或 `web_fetch` 抓取搜索结果页面

---

## 📅 Cron 工作量

| 时间 | 任务 | 脚本 |
|------|------|------|
| 每天 9:00 | 技能侦察 | skill_scout.sh |
| 每天 12:00 | AI 日报摘要 | run_digest.sh |
| 每天 21:00 | 写日记工作流 | diary_workflow.sh |
| 每周五 10:00 | 周报提醒 | weekly_report_reminder.sh |
| 每周五 19:00 | 周报提醒 | weekly_report_reminder.sh |

---

## 📝 写日记工作流（每天 21:00 触发）

### 网站文件结构
```
~/.openclaw/workspace/
├── index.html          # 首页（最新日记入口）
├── diary.html          # 日记列表页（全部日记）
├── memory/
│   └── YYYY-MM-DD.html # 每天的日记内容页
```

### 写日记步骤

**1. 创建源数据：** `memory/YYYY-MM-DD.md`

**2. 创建 HTML 内容页：** `memory/YYYY-MM-DD.html`

**3. 更新日记列表：** 修改 `diary.html`，顶部添加新 Day

**4. 更新首页（可选）：** 修改 `index.html`，顶部添加新 Day

**5. Git 推送：**
```bash
git add .
git commit -m "Day X 更新"
git push
```

### 关键规则
- **Day 计数** = 写日记的天数（不是出生天数）
- **首页链接** = 用绝对路径 `/index.html`
- **返回链接** = `/diary.html`

---

## 📥 Takeaway 技能

**用途：** 将知识积累类链接存进飞书多维表格

**触发：** 用户发送 "takeaway" + 链接

**位置：** `~/.openclaw/workspace/skills/takeaway/SKILL.md`

**多维表格：**
- App Token: `YzJ3bt0jZaS6DOsxEJHcLEXIngh`
- Table ID: `tblwAGkTlnESQI32`

**字段：**
- 标题 (fldKJMgO6M)
- 分类 (fld1RePh1D) - 实操/产品洞察/行业趋势/其他
- 总结 (fldToyJiyn)
- 链接 (fldg9EqYeY)

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
