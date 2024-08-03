---
title: 基于Python + OneBot 11的QQ机器人模块加载器的实现
tags:
  - QQbot
  - QQ机器人
  - Python
  - NapCatQQ
categories:
  - QQbot
cover: >-
  data:image/jpeg;base64,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
abbrlink: e35cbf79
date: 2024-08-03 20:55:07
---

源代码请看：[W1ndys-bot/Module-Loader: 对接 OneBot 的 Python 模块加载器 (github.com)](https://github.com/W1ndys-bot/Module-Loader?tab=readme-ov-file#/)

对接 OneBot 的 Python 模块加载器

## 介绍及背景

Python 编写的模块加载器，使用 WebSocket 客户端模式对接上游服务，支持 OneBot 协议，如遇到问题请提 issue

本加载器不以插件的形式进行加载，而是以模块的形式进行加载。

这也就意味着，本加载器的功能增加，直接写代码即可，无需配置相关插件信息。

> 写这个加载器的原因是，了解到了 mf 师傅的插件式加载器，但我本人并不习惯这种方法，于是就写了这个模块式加载器，整个加载器的配置全部采用 Python 模块化编程，功能的开发模式完全基于原生 Onebot11。
>
> 有关插件式加载器的文档请参考：[School-Robot/Plugin-Loader: 用于对接 OneBot 的 Python 插件加载器 (github.com)](https://github.com/School-Robot/Plugin-Loader)

## 加载器特色

- 模块化编程，易于维护
- 支持断线重连，无需手动重启
- 支持上线提醒（QQ），掉线提醒（钉钉）
- 支持 OneBot 11 标准，采用原生的 OneBot 11 标准进行开发

### API 文档

OneBot 11 标准 [botuniverse /onebot-11: OneBot 11 标准 (github.com)](https://github.com/botuniverse/onebot-11#/)

go-cqhttp [API | go-cqhttp 帮助中心](https://docs.go-cqhttp.org/api/)

> 备注：本机器人实现基于 **Python** 做核心开发，使用 **NapCatQQ** 作为消息平台，**OneBot 11** 作为 QQ 机器人 API 实现。

## 使用方法

### 安装依赖

```bash
pip install -r requirements.txt
```

### 配置基本信息

#### 配置 ws 连接和管理员

打开 `app/config.py`

```python
owner_id = [123]  # 机器人 root 管理员 QQ 号

ws_url = "xxx"  # napcatQQ 监听的 WebSocket API 地址

token = "xxx"  # 如果需要认证，请填写认证 token
```

#### 配置钉钉通知

打开 `app/config.py`

```python
这里替换为你自己的 TOKEN，不要直接用我的，我的有 IP 验证，用我的也没用
DD_BOT_TOKEN = "xxx"
# 这里替换为你自己的 SECRET，不要直接用我的，我的有 IP 验证，用我的也没用
DD_BOT_SECRET = "xxx"
```

## 开发文档

开发功能请参考：[dev.md](dev.md)
