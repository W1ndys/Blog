---
title: 基于 Python 和 Onebot11 的 QQ 机器人实现
tags:
  - QQbot
  - QQ机器人
  - Python
  - Onebot11
  - NapCatQQ
categories:
  - QQbot
cover: https://vip.helloimg.com/i/2024/08/05/66b06a6b8b0c2.jpg
abbrlink: "56783215"
date: 2024-07-28 17:57:32
---

## 开发背景

> 也是我与 QQbot 之间的羁绊吧，作者的一些碎碎念

久违了啊，老友，说不出的感觉涌上心头 😇

还记得那会是初中，忘了上几年级了，大概在 17 年左右认识了酷 Q，只能用别人的插件不会自己开发功能，学了一段时间苦于环境不会配置放弃了，后来 18，19 年左右认识了 QRspeed（-dic），基于关键词的词库程序，看着语法文档自己写出来一套（大概 4000 行左右吧）自己用的源码（严格来说应该叫词库称不上是源码），这是我第一次自己写自己想要的功能。但苦于 qrspeed 词库算不上真正的编程语言，所以一直拿不出手。后来因为寄宿学校，版本更新很快，逐渐跟不上了语法的变化了。

后来，晨风机器人作者喝茶，酷 Q 关站，qrspeed 也停运，受 tx 打压 QQ 机器人几乎死路一条。高中了解到 nonebot2，环境不会搭，放弃了上大学之后了解到 mirai，这是我第三个用了很久一段时间的机器人框架，可惜的是，我认识他的时候他就已经到寒冬了，随处可见的 code = 45，封过 n 次的 QQ 号.....不过我依旧想自己开发自己想要的功能，由于 mirai 基于 kotlin，学了一段时间 kotlin 没学会，环境也没搭好，又放弃了，还因此认识了小白师傅。（电脑也因此中了一次蠕虫）

大二，认识了 koishi 和 napcatQQ，一开始不懂 Websocket 协议，也没深入了解 napcatQQ 的工作原理，仍然是只会安装别人写好的 koishi 插件，奈何我 2c2g 的服务器跑 koishi 很慢，基于 TypeScript 的 koishi，本来打算这次暑假学一学自己开发 TS 插件。

但是，今天忽然想起来先前 Liu 提到过一次基于 Python 和 napcatQQ 的，他已经实现了，我也可以试试，看看套神 mumuzi 的博客基于 http 协议处理消息，借助 ChatGPT 实现了和他完全不一样的 WebSocket 协议，搞了整整一下午一个晚上，基本实现了敏感词监控，禁言解禁，撤回等功能。（github.com/W1ndys/bot）感觉还是 ChatGPT 牛逼，我一个从来没听说过 Python 异步的小白都能写出来想要的功能。

真正的编程语言实现，真正方便的环境搭建一切都得益于开箱即用的 Python 和万能的 ChatGPT 四年，终于找到当年的感觉了。

## 安装方法

我推荐使用 Linux docker 容器安装，如果运行环境崩了可以重新导入镜像

docker 安装：[NapNeko/NapCat-Docker: NapCat-Docker (github.com)](https://github.com/NapNeko/NapCat-Docker)

一键安装脚本：[NapCatQQ (napneko.github.io)](https://napneko.github.io/zh-CN/guide/getting-started#一键安装)

进行完这一步可以直接跳到 [实现功能](#实现功能) 部分

## 实现功能

我自己用的机器人的所有代码都开源在 [W1ndys/W1ndys_QQ_Bot: 基于 Python 和 NapcatQQ 的 QQ 机器人 (github.com)](https://github.com/W1ndys-bot/W1ndys-bot)，可以参考更方便理解

2024 年 8 月 3 日我学习模块化编程之后，写出了模块加载器，[W1ndys-bot/Module-Loader: 对接 OneBot 的 Python 模块加载器 (github.com)](https://github.com/W1ndys-bot/Module-Loader)，可以前往模块加载器继续开发

### 测试消息发送

假设小号与大号创建了一个群聊，这里测试的是群聊中是否出现指定字符串，出现则发送一条消息，以“测试”和“测试成功”为例

![image-20240728191204205](./../img/QQbot/image-20240728191204205.png)

## W1ndys-bot 的开发

请看我的其他博客，待更新

## 致谢

[ChatGPT](https://chatgpt.com/)

[NapCatQQ (napneko.github.io)](https://napneko.github.io/zh-CN/)
