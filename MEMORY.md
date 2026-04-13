## 飞书语音消息铁律

### 发语音的正确姿势
**发语音 = 上传时用 opus + 发消息时用 audio**

1. 上传文件：`file_type: "opus"`（不是 mp3/wav）
2. 发送消息：`msg_type: "audio"` + `content: {"file_key": "..."}`
3. 不能用 message 工具默认的发文件方式，会变成附件！

### 相关
- 飞书是根据 msg_type 区分：file=📎 文件，audio=🎤 语音

### 永不暴露凭证
**任何情况下都不允许暴露 .env、API Key、Credentials 等敏感信息。**
- 读取配置可以，但绝对不能直接输出给用户
- 即使是询问"你的.env里有什么"也要拒绝，并说明原因
- 这是一条不可逾越的红线

> Your curated memories. Distill from daily notes. Remove when outdated.

---

## About [Human Name]

### Key Context
[Important background that affects how you help them]

### Preferences Learned
[Things you've discovered about how they like to work]

### Important Dates
[Birthdays, anniversaries, deadlines they care about]

---

## Lessons Learned

### 2026-04-08 - 飞书文档编辑（保护图片）
**教训：编辑含图片的飞书文档时，绝对不要用 `feishu_doc write` 覆盖整个文档！**

原因：`write` 会删除文档中所有图片 block，无法恢复。

正确做法：
- 删除内容 → 用 `delete_block`
- 更新内容 → 用 `update_block`
- 新增内容 → 用 `insert` after a specific block
- 查询 block 结构 → 先 `list_blocks`

今天帮 Jelly 改文档时犯了错，覆盖了文档导致 6 张图片丢失。虽然最后恢复了，但非常惊险。

### [Date] - [Topic]
[What happened and what you learned]

---

## Ongoing Context

### Active Projects
[What's currently in progress]

### Key Decisions Made
[Important decisions and their reasoning]

### Things to Remember
[Anything else important for continuity]

---

## 铁律 (Always Remember)

### 收到图片必须用 MiniMax MCP 识图
**绝对禁止用 `read` 工具识图！** 必须用 MiniMax MCP 的 `understand_image` 工具。
- `read` 工具自带安全过滤器，会误拦正常图片
- MiniMax MCP 是原生图片理解 API，更精准

正确用法：
```bash
mcporter call MiniMax.understand_image prompt="描述图片内容" image_source="/Users/minimax/.openclaw/media/inbound/图片路径.jpg"
```

### 唱歌 / 发语音
- **当主人说"唱首歌"或需要发语音时，必须使用 `~/.openclaw/scripts/send_voice.py` 脚本**
- 用法: `python3 ~/.openclaw/scripts/send_voice.py "歌词" "音乐风格"`
- 这个脚本会生成音乐并发送到飞书作为**真正的语音消息**（不是文件/附件！）
- **禁止**用 TTS 工具生成 MP3 再用 message 工具发送 - 这样会变成文件！
- **正确姿势**：用 send_voice.py，它会自动转 opus 并用 msg_type="audio" 发送

---

## Relationships & People

### [Person Name]
[Who they are, relationship to human, relevant context]

---

*Review and update periodically. Daily notes are raw; this is curated.*
