#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 提示性语句
printf "${GREEN}INFO ${RESET} 正在执行 Hexo Clean...\n"

# 执行 hexo clean
hexo clean

# 提示性语句
printf "${GREEN}INFO ${RESET} Hexo Clean 完成\n"

# 提示性语句
printf "${GREEN}INFO ${RESET} 正在执行 Hexo Generate...\n"

# 执行 hexo generate
hexo generate

# 提示性语句
printf "${GREEN}INFO ${RESET} Hexo Generate 完成\n"

# 提示性语句
printf "${GREEN}INFO ${RESET} 正在执行 Hexo Server...\n"

# 执行 hexo s
hexo s

# 提示性语句
printf "${GREEN}INFO ${RESET} Hexo Server 已启动\n"

# 浏览器打开
if command -v xdg-open > /dev/null; then
    xdg-open http://localhost:4000 &
elif command -v open > /dev/null; then
    open http://localhost:4000 &
elif command -v start > /dev/null; then
    start http://localhost:4000 &
else
    printf "${GREEN}INFO ${RESET} 请手动打开浏览器访问: http://localhost:4000\n"
fi

printf "${GREEN}INFO ${RESET} 已尝试在浏览器中打开 http://localhost:4000\n"
