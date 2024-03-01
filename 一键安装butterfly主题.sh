#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 安装 butterfly 主题
printf "${GREEN}INFO ${RESET} 正在安装 butterfly 主题...\n"
npm install hexo-theme-butterfly
printf "${GREEN}INFO ${RESET} 主题安装完成\n"

# 安装必备依赖
printf "${GREEN}INFO ${RESET} 正在安装必备依赖...\n"
npm install hexo-renderer-pug hexo-renderer-stylus --save
printf "${GREEN}INFO ${RESET} 依赖安装完成\n"

# 安装搜索依赖
printf "${GREEN}INFO ${RESET} 正在安装搜索依赖...\n"
npm install hexo-generator-search --save
printf "${GREEN}INFO ${RESET} 依赖安装完成\n"

# 安装字数统计依赖
printf "${GREEN}INFO ${RESET} 正在安装字数统计依赖...\n"
npm install hexo-wordcount --save
printf "${GREEN}INFO ${RESET} 依赖安装完成\n"

# 提示用户停顿
printf "${GREEN}INFO ${RESET} 安装过程已完成。请按 Enter 键退出\n"

# 等待用户按下 Enter 键
read -r
