#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 更新 hexo-theme-butterfly
npm update hexo-theme-butterfly

# 输出提示信息
printf "${GREEN}INFO ${RESET} hexo-theme-butterfly 更新完成\n"

# 提示用户停顿
printf "${GREEN}INFO ${RESET} 正在停顿，可供查看情况。无异常可按 Enter 键退出\n"

# 等待用户按下 Enter 键
read -r
