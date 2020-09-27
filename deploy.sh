#!/usr/bin/env sh
# 推送到github.io上
# 注意 项目的  config.js 中参数 base: '/Jamin2018.github.io/'  要改成对于的github上的项目名字
# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github
# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME
if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=https://github.com/Jamin2018/Jamin2018.github.io.git
else
  msg='来自github actions的自动部署'
  githubUrl=https://jamin2018:${GITHUB_TOKEN}@github.com/Jamin2018/vuepress-theme-vdoing.git
  git config --global user.name "Jamin2018"
  git config --global user.email "389098898@qq.com"
fi
git init
git add .
git commit -m "${msg}"
git push -f $githubUrl master # 推送到github


cd - # 退回开始所在目录
rm -rf docs/.vuepress/dist