#!/bin/bash
# 工作日报自动记录脚本 - 每天22点

# 获取飞书Token
TOKEN=$(curl -s -X POST "https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal" \
  -H "Content-Type: application/json" \
  -d '{"app_id": "cli_a996eec931f8501c", "app_secret": "0t55QdPwyK2jhb15sYQ36gFESxoq1q2j"}' | python3 -c "import sys,json;print(json.load(sys.stdin)['tenant_access_token'])")

DATE=$(date "+%Y年%m月%d日")

# 读取今天的聊天记录
TODAY=$(date "+%Y-%m-%d")

# 写入文档
python3 << EOF
import json

# 读取会话记录
try:
    with open("/Users/minimax/.openclaw/agents/main/sessions/sessions.json", "r") as f:
        sessions = json.load(f)
    
    # 提取今天的记录
    summary = "## ${DATE}\n\n### 📝 酱梨酥的工作\n\n- [自动记录]\n\n### 🤖 开平虾虾的工作\n\n- [自动记录]\n\n### 💡 备注\n\n- [无]\n"
except:
    summary = "## ${DATE}\n\n*今日记录*\n"

print(summary)
EOF

# 更新飞书文档
DOC_TOKEN="LjtYdx32KoN7bLx89atcbmUgn4d"

# 追加内容
curl -s -X POST "https://open.feishu.cn/open-apis/doc/v2/${DOC_TOKEN}/append" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
    \"doc_token\": \"${DOC_TOKEN}\",
    \"block_id\": \"\",
    \"content\": \"## ${DATE}\\n\\n### 📝 酱梨酥\\n\\n- 自动记录\\n\\n### 🤖 开平虾虾\\n\\n- 自动记录\\n\\n---\\n\"
  }"

echo "工作日报已更新 - ${DATE}"
