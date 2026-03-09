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

### 唱歌
- **当主人说"唱首歌"时，必须使用 `~/.openclaw/scripts/send_voice.py` 脚本**
- 用法: `python3 ~/.openclaw/scripts/send_voice.py "歌词" "音乐风格"`
- 这个脚本会生成音乐并发送到飞书作为**真正的语音消息**（不是文件！）
- 禁止使用 OpenClaw message 工具发送音频文件

---

## Relationships & People

### [Person Name]
[Who they are, relationship to human, relevant context]

---

*Review and update periodically. Daily notes are raw; this is curated.*
