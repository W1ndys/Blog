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

explorer.exe public

# 定义要复制的路径
path_to_copy="/opt/1panel/apps/openresty/openresty/www/sites/easy-qfnu.top/index"

printf "\n\n已复制路径到剪贴板： $path_to_copy\n"

# 使用PowerShell将路径复制到剪贴板
powershell.exe "Set-Clipboard -Value '$path_to_copy'"

# 退出脚本
exit
