#!/bin/sh

echo "🚀 正在执行 update-version.sh ..."

# 获取当前分支名
CURRENT_BRANCH=$(git branch --show-current)

echo "当前分支: $CURRENT_BRANCH"

# 2️⃣ 如果不是 test 分支，则终止脚本
if [ "$CURRENT_BRANCH" != "master" ]; then
  echo "⏹️ 当前分支不是 test，终止执行！"
  exit 1  # 退出码 1 表示失败
fi

# 1. 获取当前时间戳
# TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
TIMESTAMP=$(date "+%Y%m%d%H%M%S")
echo "当前版本号: $TIMESTAMP"

mkdir -p public/js

# 2. 写入到 public/js/version.js
echo "console.log('version:', '$TIMESTAMP');" > public/js/version.js

echo "✅ 版本号已更新: $TIMESTAMP"

LAST_COMMIT_MSG=$(git log -1 --pretty=%B)
echo "Last commit: $LAST_COMMIT_MSG"


