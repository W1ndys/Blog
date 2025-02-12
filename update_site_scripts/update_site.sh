#!/bin/bash

WORK_DIR="/tmp/blog-temp"
TARGET_DIR="/opt/1panel/apps/openresty/openresty/www/sites/blog.w1ndys.top/index"
REPO_URL="git@github.com:W1ndys/Blog.git"
BACKUP_REPO_URL="https://ghfast.top/https://github.com/W1ndys/Blog.git"

# 添加日志函数
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# 执行部署操作并捕获错误
{
    log "开始部署流程..."
    
    # 清理并创建工作目录
    log "清理并创建工作目录: $WORK_DIR"
    rm -rf "$WORK_DIR" && \
    mkdir -p "$WORK_DIR" && \
    
    # 开启clash
    clashon

    # 尝试通过 SSH 克隆仓库
    log "尝试通过 SSH 克隆仓库: $REPO_URL"
    if ! git clone --depth 1 -b gh-pages "$REPO_URL" "$WORK_DIR"; then
        log "SSH 克隆失败，尝试使用备用 HTTPS 地址克隆"
        if ! git clone --depth 1 -b gh-pages "$BACKUP_REPO_URL" "$WORK_DIR"; then
            log "HTTPS 克隆也失败，退出部署"
            python3 update_site.py --status error --message "仓库克隆失败"
            exit 1
        fi
        log "使用备用 HTTPS 地址克隆成功"
    fi
    
    # 复制文件
    log "复制文件到目标目录: $TARGET_DIR"
    cp -rf "$WORK_DIR"/* "$TARGET_DIR"/ && \
    
    # 设置权限
    log "设置目标目录权限"
    chown -R 1000:1000 "$TARGET_DIR" && \
    chmod -R 644 "$TARGET_DIR" && \
    find "$TARGET_DIR" -type d -exec chmod 755 {} \; && \
    
    # 清理
    log "清理临时目录"
    rm -rf "$WORK_DIR"

    log "部署完成"
    # 如果所有命令成功执行，调用Python脚本报告成功

    # 关闭clash
    clashoff
    
    python3 update_site.py --status success
} || {
    # 如果有任何命令失败，调用Python脚本报告错误
    log "部署过程失败"
    python3 update_site.py --status error --message "部署过程出错"
} 