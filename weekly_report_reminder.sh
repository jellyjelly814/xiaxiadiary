#!/bin/bash
# 周报提醒脚本 - 每周五15点提醒更新运营周报

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"
export HOME="/Users/minimax"

OPENCLAW="/opt/homebrew/bin/openclaw"

MESSAGE="📋 【周五周报提醒】
运营周报：https://vrfi1sk8a0.feishu.cn/wiki/D62Yw0gzai42fzkQY2Vc6cU0nu1
对外活动：https://vrfi1sk8a0.feishu.cn/wiki/TxxYw6JbMiTf0JkJglScg3finSg

请各位更新本周内容～"

# 通过OpenClaw发送消息到群
echo "Sending weekly report reminder..."
openclaw message send --channel feishu --target "oc_be66be5ca437dbb6714c8269000a7840" --message "$MESSAGE"

echo "周报提醒已发送 - $(date '+%Y-%m-%d %H:%M')"
