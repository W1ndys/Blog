---
title: "基于NapCatQQ和Python的QQ机器人开发——对websocket响应消息的回应处理2025.1.25"
tags:
  - QQbot
  - QQ机器人
  - Python
  - NapCatQQ
categories:
  - QQbot
date: 2025-01-25 16:32:41
cover: "https://vip.helloimg.com/i/2024/08/05/66b06a6b8b0c2.jpg"
---

## 前言

在之前 [基于 NapCatQQ 和 Python 的 QQ 机器人开发——对 websocket 响应消息的分离处理 | W1ndys 小屋](https://blog.w1ndys.top/posts/8b45af9c.html) 的教程中提到对于 websocket 的回复捕获作处理获取返回值，后来随着开发和使用，出现了多线程的需求，而开启多线程之后会导致 websocket 返回的时候无法判断传给哪个线程，就会报错。

## 解决办法

在示例模块中 [W1ndysBot/Example: W1ndysBot 的功能模块编写示例文件](https://github.com/W1ndysBot/Example)

已经做了处理，引入了新的回应事件处理函数，例如 [W1ndysBot/app/handler_events.py at main · W1ndysBot/W1ndysBot](https://github.com/W1ndysBot/W1ndysBot/blob/main/app/handler_events.py#L271C1-L277C1)

```py
# 回应事件处理函数
async def handle_Example_response_message(websocket, message):
    try:
        msg = json.loads(message)

        if msg.get("status") == "ok":
            echo = msg.get("echo")

            if echo and echo.startswith("xxx"):
                pass
    except Exception as e:
        logging.error(f"处理Example回应事件时发生错误: {e}")
```

该函数会被消息处理模块调用，再加一些 if 条件判断，从而只会处理返回的 JSON 消息，可以通过设置一些全局变量来暂存数据，实现延迟撤回等操作，例如 [QFNUClassRegistrationCheck/main.py at main · W1ndysBot/QFNUClassRegistrationCheck](https://github.com/W1ndysBot/QFNUClassRegistrationCheck/blob/main/main.py#L458) 中，就通过暂存变量实现了延迟撤（可能未开源）
