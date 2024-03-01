#!/bin/bash

# 颜色定义
GREEN='\033[32m'
RESET='\033[0m'

# 输出提示信息
printf "${GREEN}INFO ${RESET} 正在卸载加密插件...\n"

# 卸载 hexo-blog-encrypt
npm un --save hexo-blog-encrypt

# 输出提示信息
printf "${GREEN}INFO ${RESET} 加密插件卸载完成\n"

# 输出提示信息
printf "${GREEN}INFO ${RESET} 安装完成，请在配置文件里配置相关内容...\n"

# 输出提示信息
printf "${GREEN}INFO ${RESET} 按 Enter 键退出\n"

# 等待用户按下 Enter 键
read -r
