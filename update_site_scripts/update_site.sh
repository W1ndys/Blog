#!/bin/bash

# 设置工作目录
WORK_DIR="/tmp/blog-temp"
TARGET_DIR="/opt/1panel/apps/openresty/openresty/www/sites/blog.w1ndys.top/index"
REPO_URL="https://github.com/W1ndys/Blog"
PROXY_URL="https://ghfast.top/https://github.com/W1ndys/Blog"
TIMEOUT=10 # 设置超时时间（秒）

# 获取脚本所在目录
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# 清理函数
cleanup() {
    echo "正在清理..."
    rm -rf "$WORK_DIR"

    # 发送失败通知
    if [ -n "$1" ]; then
        python3 "${SCRIPT_DIR}/notify_failure.py" "$1"
    fi

    exit 1
}

# 清理可能存在的旧临时目录
rm -rf "$WORK_DIR"

# 创建临时工作目录
mkdir -p "$WORK_DIR"

# 增强的下载函数
download_branch() {
    local url=$1
    echo "正在尝试下载分支源码: $url"

    # 调试信息
    echo "检测curl路径: $(which curl)"
    echo "curl版本: $(curl --version | head -n1)"

    # 切换到工作目录
    cd "$WORK_DIR" || return 1
    
    # 使用curl -O下载
    if ! curl --connect-timeout 15 -L -O "$url"; then
        echo "[下载失败] 请检查网络连接或代理设置"
        echo "尝试访问的URL: $url"
        return 1
    fi

    # 解压zip文件
    if ! unzip -q gh-pages.zip; then
        return 1
    fi

    # 处理解压后的目录结构（GitHub zip包会包含分支名称目录）
    extracted_dir="Blog-gh-pages"
    if [ -d "$extracted_dir" ]; then
        mv "$extracted_dir"/* ./
        rm -rf "$extracted_dir"
        rm -f gh-pages.zip
        return 0
    fi
    return 1
}

# 设置trap捕获中断信号
trap 'cleanup "脚本被中断"' INT TERM

# 修改后的克隆/下载流程
echo "正在使用直接连接下载..."
if ! download_branch "$REPO_URL/archive/refs/heads/gh-pages.zip"; then
    echo "直接下载失败，尝试使用代理..."
    if ! download_branch "$PROXY_URL/archive/refs/heads/gh-pages.zip"; then
        cleanup "下载分支源码失败"
    fi
    echo "使用代理下载成功"
else
    echo "直接下载成功"
fi

# 检查克隆是否成功
if [ ! -d "$WORK_DIR" ] || [ -z "$(ls -A $WORK_DIR)" ]; then
    cleanup "克隆成功但目录为空"
fi

# 确保目标目录存在
mkdir -p "$TARGET_DIR"

# 复制文件到目标目录
echo "正在更新网站文件..."
cp -rf "$WORK_DIR"/* "$TARGET_DIR/" || {
    cleanup "文件复制失败"
}

# 设置适当的权限
echo "正在设置权限..."
chown -R 1000:1000 "$TARGET_DIR"
chmod -R 644 "$TARGET_DIR"                       # 文件权限设为644
find "$TARGET_DIR" -type d -exec chmod 755 {} \; # 目录权限设为755

# 清理临时文件
echo "正在清理临时文件..."
rm -rf "$WORK_DIR"

# 发送成功通知
python3 "${SCRIPT_DIR}/notify_success.py"

echo "更新完成！"
