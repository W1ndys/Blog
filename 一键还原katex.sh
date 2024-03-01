#!/bin/bash

# 输出提示信息
printf "正在卸载 hexo-renderer-markdown-it-katex...\n"

# 卸载 hexo-renderer-markdown-it-katex
npm un hexo-renderer-markdown-it-katex --save

# 输出提示信息
printf "已卸载 hexo-renderer-markdown-it-katex\n"

# 输出提示信息
printf "正在安装 hexo-renderer-marked...\n"

# 安装 hexo-renderer-marked
npm i hexo-renderer-marked --save

# 输出提示信息
printf "已安装 hexo-renderer-marked\n"

# 输出提示信息
printf "按任意键退出...\n"
read -n 1 -s -r
