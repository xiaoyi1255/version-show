#!/bin/sh
echo "🚀 正在执行 update-version.sh ..."

# 1️⃣  判断当前分支为 test 分支; 不是跳过
# 2️⃣ 判断是否为更新版本号，是跳过
# 3️⃣ 判断结束，生成版本号
CURRENT_BRANCH=$(git branch --show-current)
echo "当前分支: $CURRENT_BRANCH"
latest_commit_msg=$(git log -1 --pretty=%B)
echo "最新提交信息: $latest_commit_msg"
if [ "$CURRENT_BRANCH" == "master" ] && ! echo "$latest_commit_msg" | grep -q "UPDAT_VERSION"; then
  TIMESTAMP=$(date "+%Y%m%d%H%M%S")
  mkdir -p public/js

  echo "console.log('version:', '$TIMESTAMP');" > public/js/version.js
  echo "✅ 版本号已更新: $TIMESTAMP"

  git add public/js/version.js
  git commit -m "UPDAT_VERSION: $TIMESTAMP"
  git push

  # exit 0
fi
echo "⏹️ "





