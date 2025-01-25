---
title: 基于NapCatQQ和Python的QQ机器人开发——对websocket响应消息的分离处理
tags:
  - QQbot
  - QQ机器人
  - Python
  - NapCatQQ
categories:
  - QQbot
cover: "https://vip.helloimg.com/i/2024/08/05/66b06a6b8b0c2.jpg"
abbrlink: 8b45af9c
date: 2024-08-24 19:05:04
---

{% note warning %}

本文已过时，请参考最新文章：[基于 NapCatQQ 和 Python 的 QQ 机器人开发——（NapCatQQ）猫猫的传参特性](https://w1ndys.github.io/posts/基于NapCatQQ和Python的QQ机器人开发——（NapCatQQ）猫猫的传参特性/)

{% endnote %}

## 前言

一直以来 websocket 相应消息的接收都是有问题，之前想过很多办法，包括设置 sleep 等待，设置标志等的来分离 recv 来处理正确的响应，但是始终都没成功，这次改变了一下思路成功了

## 修改前

```python
发送群消息并获取消息 ID
async def send_group_msg_with_reply(websocket, group_id, content):
    try:
        message = {
            "action": "send_group_msg",
            "params": {"group_id": group_id, "message": content},
        }
        await websocket.send(json.dumps(message))
        response = json.loads(await websocket.recv())
        message_id = response.get("data", {}).get("message_id")
        logging.info(
            f"[API]已发送群消息: {content} 到群 {group_id}，消息ID: {message_id}"
        )
        return message_id
    except Exception as e:
        logging.error(f"[API]发送群消息（带回复）失败: {e}")
        return None
```

例如这个发送群消息并获取消息 ID 的函数，一开始消息处理的速度很快，几乎是毫秒级回应，所以一直没怎么处理，也不影响正常运行

今天在扩展违禁词监控的时候，新增了一个触发违禁词之后检查之后的聊天记录，如果发现有违规者发送了视频，就直接撤回。

## 修改后

```python
发送群消息并获取消息 ID
async def send_group_msg_with_reply(websocket, group_id, content):
    try:
        message = {
            "action": "send_group_msg",
            "params": {"group_id": group_id, "message": content},
            "echo": "send_group_msg_with_reply",
        }
        await websocket.send(json.dumps(message))
        while True:
            response = await websocket.recv()
            response_data = json.loads(response)
            if response_data.get("echo") == "send_group_msg_with_reply":
                message_id = response_data.get("data", {}).get("message_id")
                logging.info(f"[API]已发送群消息到群 {group_id}，消息ID: {message_id}")
                return message_id
    except Exception as e:
        logging.error(f"[API]发送群消息（带回复）失败: {e}")
        return None
```

修改后的函数添加了循环遍历，并使用 ob11 提供的 echo 字段来做标记。

这样就可以循环遍历，通过遍历收到的消息中符合 echo 对应的消息，就可以摘出想要的回应消息，以便于信息的处理
