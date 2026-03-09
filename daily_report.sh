#!/bin/bash
# 工作日报定时推送脚本 - 每天22点

# 获取飞书Token
TOKEN=$(curl -s -X POST "https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal" \
  -H "Content-Type: application/json" \
  -d '{"app_id": "cli_a996eec931f8501c", "app_secret": "0t55QdPwyK2jhb15sYQ36gFESxoq1q2j"}' | python3 -c "import sys,json;print(json.load(sys.stdin)['tenant_access_token'])")

DATE=$(date "+%Y年%m月%d日")

# 发送提醒消息
curl -s -X POST "https://open.feishu.cn/open-apis/im/v1/messages?receive_id_type=open_id" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
    \"receive_id\": \"ou_a27da8238e62e25bb88fbb44541d483a\",
    \"msg_type\": \"text\",
    \"content\": \"{\\\"text\\\": \\\"📝 ${DATE} 工作日报\\\\n\\\\n开平虾虾请告诉我你今天做了什么：\\\\n1. 工作内容\\\\n2. 学习/成长\\\\n3. 其他有趣的事\\\\n\\\\n告诉我，我帮你记录到文档里～\\\"}\"
  }"

echo "工作日报提醒已发送 - ${DATE}"
