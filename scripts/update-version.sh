#!/bin/sh
echo "🚀 正在执行 update-version.sh ..."

CURRENT_BRANCH=$(git branch --show-current)

echo "当前分支: $CURRENT_BRANCH"

# 2️⃣ 如果不是 test 分支，则终止脚本
if [ "$CURRENT_BRANCH" != "master" ]; then
  echo "⏹️ 当前分支不是 test，终止执行！"
  exit 1  # 退出码 1 表示失败
fi

TIMESTAMP=$(date "+%Y%m%d%H%M%S")

mkdir -p public/js

echo "console.log('version:', '$TIMESTAMP');" > public/js/version.js

echo "✅ 版本号已更新: $TIMESTAMP"

git add public/js/version.js
git commit -m "更新版本号: $TIMESTAMP"




