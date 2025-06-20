const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// 获取当前分支
const branch = execSync('git branch --show-current', { encoding: 'utf-8' }).trim();
console.log(`当前分支: ${branch}`);

if (branch !== 'test') {
  console.log('⏹️ 当前分支不是 test，终止执行！');
  process.exit(0);
  
}
const now = new Date();
const year = now.getFullYear();
const month = String(now.getMonth() + 1).padStart(2, "0");
const day = String(now.getDate()).padStart(2, "0");
const hours = String(now.getHours()).padStart(2, "0");
const minutes = String(now.getMinutes()).padStart(2, "0");
const seconds = String(now.getSeconds()).padStart(2, "0");
const milliseconds = String(now.getMilliseconds());

const VERSION = `${year}${month}${day}${hours}${minutes}${seconds}${milliseconds}`;

const VERSION_FILE = 'public/js/version.js';
// 确保目录存在
fs.mkdirSync(path.dirname(VERSION_FILE), { recursive: true });
// 写入 JS 版本文件
fs.writeFileSync(VERSION_FILE, `console.log('version: ${VERSION}');`);

console.log(`✅ 版本号已更新: ${VERSION}`);

