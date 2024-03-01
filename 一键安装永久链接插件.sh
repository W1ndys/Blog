#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 输出提示信息
printf "${GREEN}INFO ${RESET} 正在安装永久链接插件...\n"

# 安装 hexo-abbrlink
npm install hexo-abbrlink --save

# 输出提示信息
printf "${GREEN}INFO ${RESET} 安装完成，请在配置文件里配置相关内容...\n"

# 输出提示信息
printf "${GREEN}INFO ${RESET} 按任意键退出\n"

# 等待用户按下任意键
read -n 1 -s -r
