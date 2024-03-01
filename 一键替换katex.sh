#!/bin/bash

# 删除 hexo-renderer-marked
npm un hexo-renderer-marked --save

# 输出提示信息
printf "已删除 hexo-renderer-marked\n"

# 安装 hexo-renderer-markdown-it-katex
npm i hexo-renderer-markdown-it-katex

# 输出提示信息
printf "已安装 hexo-renderer-markdown-it-katex\n"

# 输出提示信息
printf "按 Enter 键退出...\n"
read -r
