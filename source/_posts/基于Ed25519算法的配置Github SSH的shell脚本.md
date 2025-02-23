---
title: 基于Ed25519算法的配置Github SSH的shell脚本
tags:
  - GitHub
  - SSH
  - Shell
  - Ed25519
categories:
  - 技术教程
  - Github
abbrlink: 65dfe81d
date: 2025-01-28 00:19:51
---

## 前言

在使用 GitHub 时，SSH 是一种更安全和便捷的认证方式。本文将介绍一个基于 Ed25519 算法的 GitHub SSH 配置脚本，并详细解释为什么选择 Ed25519 算法。

## 为什么选择 Ed25519？

Ed25519 是现代密码学中最受推荐的算法之一，相比传统的 RSA 算法具有以下优势：

### 1. 更高的安全性
- 基于 Edwards-curve Digital Signature Algorithm (EdDSA)
- 256 位密钥长度就能提供与 RSA-4096 相当的安全性
- 对量子计算攻击具有更好的抵抗性

### 2. 卓越的性能
- 密钥生成速度快
- 签名和验证效率高
- 资源消耗低

### 3. 简洁的密钥长度
- 公钥仅 68 字节
- 私钥仅 32 字节
- 大大简化了密钥的管理和传输

## 配置脚本

以下是一个完整的 GitHub SSH 配置脚本：

```shell
#!/bin/bash

# 设置颜色输出
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}开始配置 GitHub SSH 连接${NC}"

# 检查是否存在 SSH 密钥
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "未找到现有的 SSH 密钥，正在生成新的密钥..."
    read -p "请输入你的 GitHub 邮箱: " email
    ssh-keygen -t ed25519 -C "$email"
else
    echo "已找到现有的 SSH 密钥"
fi

# 确保 SSH 代理正在运行
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 创建或更新 SSH 配置
mkdir -p ~/.ssh
cat > ~/.ssh/config << EOL
Host github.com
    Hostname ssh.github.com
    Port 443
    User git
EOL

echo -e "${GREEN}SSH 配置已更新${NC}"

# 显示公钥
echo -e "\n${GREEN}以下是你的 SSH 公钥，请将其添加到 GitHub：${NC}"
cat ~/.ssh/id_ed25519.pub

# 测试连接
echo -e "\n${GREEN}正在测试 GitHub 连接...${NC}"
ssh -T git@github.com

echo -e "\n${GREEN}配置完成！${NC}"
echo "如果上面显示 'Hi username! You've successfully authenticated' 则表示配置成功" 
```

## 脚本功能说明

1. **密钥检查与生成**
   - 检查是否存在现有的 Ed25519 密钥
   - 如果不存在，则生成新的密钥对

2. **SSH 代理配置**
   - 启动 SSH 代理
   - 添加私钥到 SSH 代理

3. **特殊网络环境适配**
   - 使用 443 端口替代默认的 22 端口
   - 适配中国大陆网络环境

4. **自动化配置**
   - 自动创建和配置 SSH 配置文件
   - 提供即时的连接测试

## 使用方法

1. 创建脚本文件：
2. 复制上述脚本内容到文件中
3. 运行脚本：
4. 按照提示将公钥添加到 GitHub 设置中

## 注意事项

- 运行脚本前确保已安装 `ssh-keygen` 和 `ssh-agent`
- 可能需要 `sudo` 权限来修改 SSH 配置
- 确保妥善保管生成的私钥
- 如果已有其他 SSH 密钥，注意备份

## 总结

使用 Ed25519 算法配置 GitHub SSH 不仅提供了更好的安全性，还能获得更优的性能。通过这个自动化脚本，我们可以快速完成配置，避免了手动操作可能带来的错误。特别是对于中国大陆用户，脚本中的 443 端口配置可以有效解决连接问题。

## 参考资料

- [GitHub 官方文档：生成新的 SSH 密钥](https://docs.github.com/cn/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Ed25519: high-speed high-security signatures](https://ed25519.cr.yp.to/)
