const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// 获取当前分支
const branch = execSync('git branch --show-current', { encoding: 'utf-8' }).trim();
console.log(`当前分支: ${branch}`);

if (branch !== 'master') {
  console.log('⏹️ 当前分支不是 test，终止执行！');
  process.exit(0);
  
}
function getTimestamp() {
  const now = new Date();

  const pad = (num, len = 2) => num.toString().padStart(len, '0');

  const year = now.getFullYear();
  const month = pad(now.getMonth() + 1);
  const day = pad(now.getDate());
  const hour = pad(now.getHours());
  const minute = pad(now.getMinutes());
  const second = pad(now.getSeconds());
  const millisecond = pad(now.getMilliseconds(), 3); // 保证 3 位数

  return `${year}${month}${day}${hour}${minute}${second}${millisecond}`;
}

const VERSION = getTimestamp()
const VERSION_FILE = 'public/js/version.js';
// 确保目录存在
fs.mkdirSync(path.dirname(VERSION_FILE), { recursive: true });
// 写入 JS 版本文件
fs.writeFileSync(VERSION_FILE, `console.log('version: ${VERSION}');`);

console.log(`✅ 版本号已更新: ${VERSION}`);

