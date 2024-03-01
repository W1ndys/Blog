#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 提示性语句
printf "${GREEN}INFO ${RESET} 执行 git add...\n"

# 执行 git add
git add .

# 提示性语句
printf "${GREEN}INFO ${RESET} 执行 git commit...\n"

# 执行 git commit
git commit -m "deploy from hexo-admin"

# 提示性语句
printf "${GREEN}INFO ${RESET} 执行 git push...\n"

# 执行 git push
git push

# 提示性语句
printf "${GREEN}INFO ${RESET} 操作完成，请按 Enter 键退出\n"

# 等待用户按下 Enter 键
read -r
