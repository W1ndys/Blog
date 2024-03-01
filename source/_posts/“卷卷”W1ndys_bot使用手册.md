---
date: 2023-11-18 10:04
title: “卷卷”W1ndys_bot使用手册
tags: QQbot
categories:
  - QQbot
abbrlink: bc040c54
---

# 主要功能

卷卷目前的功能主要有：
[关键词回复](#关键词回复)      [快捷群管理](#快捷群管理)     [违禁词监控](#违禁词监控)    [定时器](#定时器)     [奇怪图片生成](#奇怪图片生成)     [点歌](#点歌)   [猜群友小游戏](#猜群友)

[ChatLearning————学群友说话使用手册](https://w1ndys.top/posts/edeaa258.html#/)

[Mirai Administrator使用手册](https://w1ndys.top/posts/369f16e7.html#/)

[HuYanSession2——壶言会话2使用手册](https://w1ndys.top/posts/7a43906e.html#/)

[MuteGames使用手册](https://w1ndys.top/posts/7183a269.html#/)

# 关键词回复

相关指令[请看这里](https://w1ndys.top/posts/7a43906e.html#%E8%87%AA%E5%AE%9A%E4%B9%89%E5%9B%9E%E5%A4%8D)

# 快捷群管理

相关指令[请看这里](https://w1ndys.top/posts/7a43906e.html#%E7%BE%A4%E7%AE%A1%E7%90%86)

# 违禁词监控

相关指令[请看这里](https://w1ndys.top/posts/7a43906e.html#%E8%BF%9D%E7%A6%81%E8%AF%8D)

# 定时器

相关指令[请看这里](https://w1ndys.top/posts/7a43906e.html#%E5%AE%9A%E6%97%B6%E5%99%A8)

# 奇怪图片生成

发送`pet`可以查看具体指令

根据提示操作即可

# 点歌

## “#音乐 关键词”

自动搜索所有源以找出来找最佳音频来源

## “#语音 关键词”

自动搜索所有源，以语音信息的形式发出

## “#外链 关键词”

自动搜索所有源，以外链信息的形式发出

## “#QQ 关键词”

搜索QQ音乐

## “#网易 关键词”

搜索网易云音乐

## “#网易电台 关键词”

搜索网易云电台，一般来说是直接选择找到的第一个节目，但是关键词可以以 “电台名称|节目名称”的格式指定电台节目

## “#酷狗 关键词”

搜索酷狗音乐

## “#千千 关键词”

搜索千千音乐（百度音乐）

# 猜群友

命令：

`#猜群友 开始`或者`#猜群友 paly`（因为开发者打错字了所以不是play）

`#猜群友 guess@`或者`#猜群友 猜@`

# MuteGames

一个以 [Mirai_Console](https://github.com/mamoe/mirai) 为基础开发并为了满足群友PVP需求和抖M需求开发的禁言游戏集合

# [群词云生成器](https://mirai.mamoe.net/topic/959/wordcloudplugin_%E7%BE%A4%E8%AF%8D%E4%BA%91%E7%94%9F%E6%88%90%E5%99%A8)

使用方法:在群内发送 `本日词云`/`昨日词云`/`获取词云 `来使用
也可以发送 `用户本日词云`/`用户昨日词云`/`获取用户词云` +`<用户名称>` 来获取指定用户的词云
在config下timer文件可以配置定时任务
更多功能可查看配置文件

