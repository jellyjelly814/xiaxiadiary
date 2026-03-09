#!/bin/bash
# Skill Scout - 每天检索ClawHub有趣Skill

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"
export HOME="/Users/minimax"

OPENCLAW="/opt/homebrew/bin/openclaw"
DATE_STR=$(date '+%Y-%m-%d')

# 消息内容
MESSAGE="🦞 每日Skill精选 - ${DATE_STR}

🔥 Top 5 热门Skill

🧠 self-improving-agent
   自我进化，记录错误持续改进
   下载: 107k ⭐1.3k

✨ Humanizer
   去除AI写作痕迹，更像人写的
   下载: 32k ⭐287

🚀 Proactive Agent
   主动式AI，预测你的需求
   下载: 55k ⭐369

📝 Summarize
   总结网页/视频/YouTube内容
   下载: 75k ⭐348

🔍 Tavily Web Search
   AI优化网页搜索
   下载: 90k ⭐433

👉 查看更多: https://clawhub.ai/skills"

# 发送飞书消息
$OPENCLAW message send \
  --channel feishu \
  --target ou_a27da8238e62e25bb88fbb44541d483a \
  --message "$MESSAGE" 2>&1 | tail -1 >> /tmp/skill_scout.log

echo "$(date): Skill report sent" >> /tmp/skill_scout.log
