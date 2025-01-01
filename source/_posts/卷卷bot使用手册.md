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

![卷卷 bot](https://github.html.zone/W1ndysBot/W1ndysBot)

卷卷 bot 是一个基于 Python 和 [NapCatQQ](https://github.com/NapNeko) 的 QQ 机器人，由 [W1ndys](https://github.com/W1ndys) 开发。开源在 [W1ndysbot/W1ndysbot: 卷卷 bot (github.com)](https://github.com/W1ndysBot/W1ndysBot)

## 使用手册

### AI 大模型

- **开源地址**：[AI 大模型](https://github.com/W1ndysBot/AI)
- **使用方法**：群内发送“卷卷+内容”，或“内容+卷卷”，即可使用 AI 大模型提问。

### 违禁词监控

- **开源地址**：[违禁词监控](https://github.com/W1ndysBot/BanWords)

| 命令       | 描述               | 示例        |
| ---------- | ------------------ | ----------- |
| `bwon`     | 开启违禁词监控     | `bwon`      |
| `bwoff`    | 关闭违禁词监控     | `bwoff`     |
| `bwlist`   | 查看违禁词列表     | `bwlist`    |
| `bwadd+词` | 添加违禁词         | `bwadd暴力` |
| `bwrm+词`  | 删除违禁词         | `bwrm暴力`  |
| `vcon`     | 开启视频监控       | `vcon`      |
| `vcoff`    | 关闭视频监控       | `vcoff`     |
| `banwords` | 显示违禁词系统菜单 | `banwords`  |

### 违禁词监控 2（开发中）

#### 管理员命令

| 命令                       | 描述                     | 示例                   |
| -------------------------- | ------------------------ | ---------------------- |
| `bw2add<词> <权值>`        | 添加违禁词到指定群的词库 | `bw2add暴力 10`        |
| `bw2del<词>`               | 删除指定群的违禁词       | `bw2del暴力`           |
| `bw2defaultadd<词> <权值>` | 添加违禁词到默认词库     | `bw2defaultadd暴力 10` |
| `bw2defaultdel<词>`        | 删除默认违禁词           | `bw2defaultdel暴力`    |
| `bw2list`                  | 查看指定群的违禁词列表   | `bw2list`              |
| `bw2defaultlist`           | 查看默认违禁词列表       | `bw2defaultlist`       |

### 黑名单系统使用手册

| 命令         | 描述                                            | 示例             |
| ------------ | ----------------------------------------------- | ---------------- |
| `bladd`      | 添加用户到黑名单并踢出群聊。支持使用@或 QQ 号。 | `bladd@123456`   |
| `blrm`       | 从黑名单中移除用户。支持使用@或 QQ 号。         | `blrm@123456`    |
| `bllist`     | 查看当前群的黑名单。                            | `bllist`         |
| `blcheck`    | 检查用户是否在黑名单中。支持使用@或 QQ 号。     | `blcheck@123456` |
| `blscan`     | 扫描群内成员是否在云端黑名单中。                | `blscan`         |
| `bltall`     | 踢出所有在云端黑名单中的群成员。                | `bltall`         |
| `blacklist`  | 显示黑名单系统菜单。                            | `blacklist`      |
| `黑名单系统` | 显示黑名单系统菜单。                            | `黑名单系统`     |

**注意**: 所有命令均需在群聊中使用，且用户需具备相应权限（群主或管理员）才能执行。

# ClassTable 使用手册

| 命令                                              | 描述                                                    | 示例                                                          |
| ------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------- |
| `classtable` 或 `课程表`                          | 显示课程表菜单，提供功能说明。                          | `classtable` 或 `课程表`                                      |
| `查看今日课表` 或 `今日课表` 或 `classtabletoday` | 查看并发送今日的课程表。                                | `查看今日课表` 或 `今日课表` 或 `classtabletoday`             |
| `取消课程表订阅` 或 `classtableoff`               | 取消当前群的课程表订阅，删除对应的课程表文件。          | `取消课程表订阅` 或 `classtableoff`                           |
| WakeUp 课程表分享口令                             | 导入课程表，需从 WakeUp 课程表 APP 复制分享口令并发送。 | `这是来自「WakeUp课程表」的课表分享，...分享口令为「<口令>」` |

## 使用示例

1. **查看课程表菜单**

   - 输入 `classtable` 或 `课程表`，将显示课程表功能的使用说明。

2. **查看今日课表**

   - 输入 `查看今日课表`、`今日课表` 或 `classtabletoday`，将获取并发送今日的课程表。

3. **取消课程表订阅**

   - 输入 `取消课程表订阅` 或 `classtableoff`，将取消当前群的课程表订阅并删除相关文件。

4. **导入课程表**
   - 复制 WakeUp 课程表 APP 的分享口令并发送，格式为 `这是来自「WakeUp课程表」的课表分享，...分享口令为「<口令>」`，系统将自动导入课程表。

请根据以上命令和示例进行操作。
