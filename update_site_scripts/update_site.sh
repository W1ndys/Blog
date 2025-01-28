#!/bin/bash

WORK_DIR="/tmp/blog-temp"
TARGET_DIR="/opt/1panel/apps/openresty/openresty/www/sites/blog.w1ndys.top/index"
REPO_URL="git@github.com:W1ndys/Blog.git"

# 执行部署操作并捕获错误
{
    # 清理并创建工作目录
    rm -rf "$WORK_DIR" && \
    mkdir -p "$WORK_DIR" && \
    
    # 克隆仓库
    git clone --depth 1 -b gh-pages "$REPO_URL" "$WORK_DIR" && \
    
    # 复制文件
    cp -rf "$WORK_DIR"/* "$TARGET_DIR"/ && \
    
    # 设置权限
    chown -R 1000:1000 "$TARGET_DIR" && \
    chmod -R 644 "$TARGET_DIR" && \
    find "$TARGET_DIR" -type d -exec chmod 755 {} \; && \
    
    # 清理
    rm -rf "$WORK_DIR"

    # 如果所有命令成功执行，调用Python脚本报告成功
    python3 update_site.py --status success
} || {
    # 如果有任何命令失败，调用Python脚本报告错误
    python3 update_site.py --status error --message "部署过程出错"
} 