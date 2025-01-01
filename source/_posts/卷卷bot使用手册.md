---
title: 卷卷bot使用手册
tags:
  - QQbot
  - QQ机器人
  - Python
  - NapCatQQ
categories:
  - QQbot
cover: "https://github.html.zone/W1ndysBot/W1ndysBot"
abbrlink: fbd9a8fd
date: 2025-01-01 19:48:25
---

## 卷卷 bot

![img](https://github.html.zone/W1ndysBot/W1ndysBot)

卷卷 bot 是一个基于 Python 和 [NapCatQQ](https://github.com/NapNeko) 的 QQ 机器人，由 [W1ndys](https://github.com/W1ndys) 开发。开源在 [W1ndysbot/W1ndysbot: 卷卷 bot (github.com)](https://github.com/W1ndysBot/W1ndysBot)

## 使用手册

### AI 大模型

- **开源地址**：[AI 大模型](https://github.com/W1ndysBot/AI)
- **使用方法**：群内发送“卷卷+内容”，或“内容+卷卷”，即可使用 AI 大模型提问，即开头或结尾有“卷卷”即可。

### 违禁词监控

- **开源地址**：[违禁词监控](https://github.com/W1ndysBot/BanWords)

#### 违禁词监控管理

- **`bwon`**：开启违禁词监控
  - **使用实例**：输入 `bwon`，系统将启用违禁词监控，所有消息中的违禁词将被自动检查。
- **`bwoff`**：关闭违禁词监控
  - **使用实例**：输入 `bwoff`，系统将关闭违禁词监控，消息不再检查违禁词。
- **`bwlist`**：查看违禁词列表
  - **使用实例**：输入 `bwlist`，系统将私发群聊当前违禁词列表。
- **`bwadd+违禁词`**：添加违禁词
  - **使用实例**：输入 `bwadd暴力`，系统将把"暴力"添加到违禁词列表。
- **`bwrm+违禁词`**：删除违禁词
  - **使用实例**：输入 `bwrm暴力`，系统将从违禁词列表中删除"暴力"。

#### 视频监控管理

- **`vcon`**：开启视频监控
  - **使用实例**：输入 `vcon`，系统将开启视频监控，禁止群聊中发送视频。
- **`vcoff`**：关闭视频监控
  - **使用实例**：输入 `vcoff`，系统将关闭视频监控，允许群聊中发送视频。

#### 违禁词系统菜单

- **`banwords`**：显示违禁词系统菜单
  - **使用实例**：输入 `banwords`，系统将显示违禁词管理功能菜单，包括所有可用命令的简要说明。

### 违禁词监控2（开发中）

#### **管理员命令**

- **`bw2add<违禁词> <权值>`**：添加违禁词到指定群的词库
  - **使用实例**：输入 `bw2add暴力 10`，将"暴力"添加到群的违禁词词库，权值为10。
- **`bw2del<违禁词>`**：删除指定群的违禁词
  - **使用实例**：输入 `bw2del暴力`，删除群中的"暴力"违禁词。
- **`bw2defaultadd<违禁词> <权值>`**：添加违禁词到默认词库
  - **使用实例**：输入 `bw2defaultadd暴力 10`，将"暴力"添加到默认违禁词词库，权值为10。
- **`bw2defaultdel<违禁词>`**：删除默认违禁词
  - **使用实例**：输入 `bw2defaultdel暴力`，删除默认违禁词中的"暴力"。
- **`bw2list`**：查看指定群的违禁词列表
  - **使用实例**：输入 `bw2list`，系统返回该群的违禁词列表。
- **`bw2defaultlist`**：查看默认违禁词列表
  - **使用实例**：输入 `bw2defaultlist`，系统返回默认违禁词列表。
