#!/usr/bin/env sh
# 推送到gitee
# 注意 项目的  config.js 中参数 base: '/JaminXie/'  要改成对于的gitee上的项目名字
# 确保脚本抛出遇到的错误
set -e
# 生成静态文件
npm run build
# 进入生成的文件夹
cd docs/.vuepress/dist
# deploy to gitee
msg='deploy'
# 设置gitee的用户名
git config --global user.name "JaminXie"
git config --global user.email "389098898@qq.com"
githeeUrl=https://gitee.com/JaminXie/JaminXie.git  # gitee项目地址
git init
git add -A
git commit -m "${msg}"
git push -f $githeeUrl master # 推送到gitee

cd - # 退回开始所在目录
rm -rf docs/.vuepress/dist

# 依赖puppeteer
# 可以用 cnpm install puppeteer 安装
node deploy-gitee.js