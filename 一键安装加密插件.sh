#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 提示性语句
printf "${GREEN}INFO ${RESET} 正在安装加密插件...\n"

# 安装 hexo-blog-encrypt
npm install --save hexo-blog-encrypt

# 提示性语句
printf "${GREEN}INFO ${RESET} 安装完成，请在配置文件里配置相关内容...\n"

# 提示性语句
printf "${GREEN}INFO ${RESET} 按任意键退出\n"

# 等待用户按下任意键
read -n 1 -s -r
