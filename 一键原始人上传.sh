#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 输出提示信息
printf "${GREEN}INFO ${RESET} 正在清理本地缓存...\n"

# 执行 hexo clean
hexo clean

# 输出提示信息
printf "${GREEN}INFO ${RESET} 清理本地缓存完成\n"

# 输出提示信息
printf "${GREEN}INFO ${RESET} 正在重新编译静态页面...\n"

# 执行 hexo generate
hexo generate

# 输出提示信息
printf "${GREEN}INFO ${RESET} 重新编译静态页面完成\n"

# 输出提示信息
printf "${GREEN}INFO ${RESET} 正在准备将最新修改部署至 Hexo...\n"

# 执行 hexo deploy
hexo deploy

# 输出提示信息
printf "${GREEN}INFO ${RESET} 部署完成，您的网站已经是最新版本！\n"

# 输出提示信息
printf "${GREEN}INFO ${RESET} 按 Enter 键退出\n"

# 等待用户按下 Enter 键
read -r
