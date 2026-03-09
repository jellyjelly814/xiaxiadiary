#!/bin/bash
# AI Daily Digest 自动运行脚本 - 每天12点执行

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"
export HOME="/Users/minimax"

SKILL_DIR="/Users/minimax/.openclaw/skills/ai-daily-digest"
OUTPUT_DIR="${SKILL_DIR}/output"
DATE_STR=$(date +%Y%m%d)

# 创建输出目录
mkdir -p ${OUTPUT_DIR}

# 运行digest
cd ${SKILL_DIR} && \
export OPENAI_API_KEY="sk-cp-kxLG9iDwhTha-g188z1i69BBEfwYD5Oo1QUpKxpvkYUd1MQWanAgETrLeUZ-2k1XiuJIVS17VHHQ4C_rcMLHLTdE00sjhMj0YADL7INEYDKxxdGdC477U4k" && \
export OPENAI_API_BASE="https://api.minimax.chat/v1" && \
export OPENAI_MODEL="MiniMax-M2.5" && \
npx -y bun scripts/digest.ts --hours 48 --top-n 15 --lang zh --output ${OUTPUT_DIR}/digest-${DATE_STR}.md 2>&1

# 复制到固定位置
cp ${OUTPUT_DIR}/digest-${DATE_STR}.md /Users/minimax/.openclaw/digest-${DATE_STR}.md 2>/dev/null

echo "Digest完成 - $(date)"
echo "报告位置: /Users/minimax/.openclaw/digest-${DATE_STR}.md"
