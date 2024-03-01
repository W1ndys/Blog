#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 输出提示信息
printf "${GREEN}INFO ${RESET} 正在安装主题...\n"
npm install hexo-theme-anzhiyu
printf "${GREEN}INFO ${RESET} 主题安装完成\n"

# 输出提示信息
printf "${GREEN}INFO ${RESET} 正在安装依赖...\n"
npm install hexo-renderer-pug hexo-renderer-stylus --save
printf "${GREEN}INFO ${RESET} 依赖安装完成\n"

# 提示用户停顿
printf "${GREEN}INFO ${RESET} 正在停顿，可供查看情况。无异常可按 Enter 键退出\n"

# 等待用户按下 Enter 键
read -r
