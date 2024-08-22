---
title: 基于 Python 和 Onebot11 的QQ机器人开发——JSON消息的发送（消息段数组的运用）
tags:
  - QQbot
  - QQ机器人
  - Python
  - Onebot11
  - NapCatQQ
categories:
  - QQbot
cover: 'https://vip.helloimg.com/i/2024/08/05/66b06a6b8b0c2.jpg'
abbrlink: 9bd67233
date: 2024-08-15 00:18:29
---

## 什么是消息段数组

请看 onebot11 官方文档 [onebot-11/message/array.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/message/array.md#消息段数组)

以前我都是直接发的 CQ 码（什么是 CQ 码？[onebot-11/message/string.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/message/string.md#cq-码格式)）

今天突发奇想的想试试直接发推荐卡片，当我尝试发 CQ 码的时候失败了，然后我去找 NapCatQQ 开发者拾雪问了一下，大佬是这么说的，不能直接用 CQ 码，因为涉及到签名等东西，需要用扩展接口，让我去看文档。

去文档找了一下，确实找到了，我本以为能顺理成章的解决问题，但是不出意外的话出意外了。

下面内容基于 Python 和正向 Websocket 连接实现

> 说句题外话，小白的一个大误区，向别人提问题，尤其是计算机相关的问题，一定要一次性的把问题说全，可以分好几条发，被提问者一般不会因此嫌弃厌烦，反而会很喜欢，因为你把尽可能用到的信息全都提供出来了，有助于问题的解决
>
> 新手要学会的几件事，提问的时候要尽可能多的提供
>
> 1. 相关的运行日志，报错日志
> 2. 相关的源代码
> 3. 相关的必要的截图
> 4. 做好敏感数据的处理

## 如何发消息

再 Onebot11 标准文档里给出了发送消息的 API，详情可见如下

发送私聊消息：[onebot-11/api/public.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/api/public.md#send_private_msg-发送私聊消息)

发送群消息：[onebot-11/api/public.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/api/public.md#send_group_msg-发送群消息)

发送消息：[onebot-11/api/public.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/api/public.md#send_msg-发送消息)

### 如何通信

NapCatQQ 基于 Onebot11 协议进行通信，这里我只以正向 Websocket 通信协议为例描述。通过 WebSocket 消息发送的数据全部使用 JSON 格式。

 具体的文档详情可见：[onebot-11/communication/ws.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/communication/ws.md#正向-websocket)

API 的运用：[onebot-11/communication/ws.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/communication/ws.md#api-接口)

例如利用 API 发送一条私聊消息

```json
{
    "action": "send_private_msg",
    "params": {
        "user_id": 10001000,
        "message": "你好"
    },
    "echo": "123"
}
```

连接后向 Onebot 发送此 JSON 消息，就可以实现向 10001000 发送“你好”这条消息，其它参数可以去 Onebot11 文档查看，这里不过多描述，经测试，这里的 **user_id 可以是字符串型也可以是整形**。

消息是 OneBot 标准中一个重要的数据类型，在发送消息的 API 和接收消息的事件中都有相关字段。目前消息的格式分为两种：字符串（string）和数组（array）。

`message` 的值，可以是字符串也可以是数组，具体的文档请看 [onebot-11/message/README.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/message/README.md)

字符串格式可以包括 CQ 码，例如 `[CQ:face,id=178]看看我刚拍的照片[CQ:image,file=123.jpg]`

数组格式请看 [onebot-11/message/array.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/message/array.md)

消息段是 CQ 码在数组格式中的表示形式，基本格式如下：

```json
{
    "type": "image",
    "data": {
        "file": "123.jpg"
    }
}
```

## 如何发 JSON 消息

有关于 Onebot11 的 JSON 消息格式文档可以看 [onebot-11/message/segment.md at master · botuniverse/onebot-11 (github.com)](https://github.com/botuniverse/onebot-11/blob/master/message/segment.md#JSON-消息)

如何发 JSON 消息，就是在用 API 发送消息的基础上，把 `message` 的值，传入 JSON 就可以

例如下面 JSON，把这段 JSON 消息传入就可以发送

```json
{
    "type": "json",
    "data": {
        "data": "{\"app\": ..."
    }
}
```

## 发 JSON 消息的实践

利用 JSON 消息发送推荐群/好友卡片

```json
# 发送群消息
async def send_group_msg(websocket, group_id, content):
    message = {
        "action": "send_group_msg",
        "params": {"group_id": group_id, "message": content},
    }
    await websocket.send(json.dumps(message))
    logging.info(f"已发送群消息: {message}")


# 给群分享加群卡片
async def send_ArkShareGroupEx_group(websocket, group_id, target_group_id):
    try:
        message = {
            "action": "ArkShareGroupEx",
            "params": {"group_id": str(group_id)},
        }
        await websocket.send(json.dumps(message))
        response = json.loads(await websocket.recv())
        data = response.get("data")
        await send_json_msg_group(websocket, target_group_id, data)
    except Exception as e:
        logging.error(f"发送加群卡片失败: {e}")


# 向群发送JSON消息
async def send_json_msg_group(websocket, group_id, data):
    try:
        message = {
            "type": "json",
            "data": {"data": data},
        }  # 注意这边两层data，详情可见https://github.com/botuniverse/onebot-11/blob/master/message/segment.md#json-%E6%B6%88%E6%81%AF
        await send_group_msg(websocket, group_id, message)
    except Exception as e:
        logging.error(f"发送JSON消息失败: {e}")
```



1. 首先在 `send_ArkShareGroupEx_group` 函数里提取处 JSON 信息
2. 在 `send_json_msg_group` 把 JSON 封装成 `message`
3. 在 `send_group_msg` 通过 API 发出去

~~这里其实如果是要发 JSON 消息的话，除了数组形式，还有一种方法前面也提到了，就是 CQ 码~~

试过了，CQ 码不可以，会被解析成 CQ 码字符串直接发 JSON 源码而不是卡片

