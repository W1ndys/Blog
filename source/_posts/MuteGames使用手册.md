---
date: 2023-12-06 21:09
title: MuteGames使用手册
tags: QQbot
categories:
  - QQbot
abbrlink: 7183a269
---

# MuteGames

一个以 [Mirai-Console](https://github.com/mamoe/mirai) 为基础开发并为了满足群友PVP需求和抖M需求开发的禁言游戏集合

## 开始使用

插件需要以 [Mirai-Console](https://github.com/mamoe/mirai)

为基础，你可以下载 [MCL](https://github.com/iTXTech/mirai-console-loader/releases) 作为你的Mirai插件载入器

与此同时，本插件需要 Mirai 官方插件 

使用之前请先用参考[权限节点](#权限节点)来开启插件权限

**请注意：当用户权限大于等于机器人所在权限时（如机器人是管理员用户为群主），机器人不会对游戏请求做任何回复**

## 权限节点

```
 |- com.evolvedghost.mutegames:*                      The base permission
 |  |- com.evolvedghost.mutegames:command.banme       自裁指令
 |  |- com.evolvedghost.mutegames:command.blackjack   21点（Blackjack）指令
 |  |- com.evolvedghost.mutegames:command.duel        决斗指令
 |  |- com.evolvedghost.mutegames:command.mg          MuteGams管理指令
 |  |- com.evolvedghost.mutegames:command.roulette    俄罗斯轮盘指令
```

插件调用的是Mirai自带的权限管理系统，你可以在控制台输入`?`来获取帮助，通常权限的添加方式为：

```
#permission add <被许可人 ID> <权限 ID>    # 授权一个权限
```

<被许可人 ID> 可以为QQ号或者通配符`*`来代表所有用户

<权限 ID> 即上述权限名称，可按照需求添加

一个例子为：`#permission add * com.evolvedghost.mutegames:*`，即为所有用户添加本插件所有权限

## 插件命令

插件分为两种命令，一种为普通命令一种为管理员命令

默认别名为插件预设置的alias，普通命令的别名你可以在Config中更改

### 普通命令

| 指令                      | 默认别名              | 功能                                     |
| ------------------------- | --------------------- | ---------------------------------------- |
| `(#)banMe`                | `自裁`                | 自裁（直接获得一个禁言）                 |
| `(#)banMe [seconds]<Int>` | `自裁 [seconds]<Int>` | 自定义秒数禁言                           |
| `(#)duel`                 | `决斗`                | 决斗指令（两位群友以决斗的方式赢取禁言） |
| `(#)roulette`             | `轮盘,俄罗斯轮盘`     | 俄罗斯轮盘赌（以轮盘赌的方式赢取禁言）   |
| `(#)blackjack`            | `21点`                | 发起#加入一轮21点                        |
| `(#)blackjack start`      | `21点 开始`           | 开启一轮21点                             |
| `(#)blackjack add`        | `21点 拿牌`           | 在21点中拿牌                             |
| `(#)blackjack stop`       | `21点 停牌`           | 在21点中停牌                             |
| `(#)blackjack giveup`     | `21点 投降`           | 在21点中投降                             |
| `(#)blackjack check`      | `21点 看牌`           | 在21点中看牌                             |
| `(#)blackjack help`       | `21点 帮助`           | 获取21点帮助                             |

### 管理命令

| 指令               | 默认别名（不可更改） | 功能                 |
| ------------------ | -------------------- | -------------------- |
| `#mg dualStop`     | `#mg 停止决斗`       | 停止本群的决斗       |
| `#mg reload`       | `#mg 重载`           | 重载本插件的配置项   |
| `#mg rouletteStop` | `#mg 停止轮盘`       | 停止本群的俄罗斯轮盘 |
| `#mg bjStop`       | `#mg 停止21点`       | 停止本群的停止21点   |

## 插件配置

插件的配置项储存在`config\com.evolvedghost.mutegames`目录下，有以下文件

| 文件名          | 作用                         |
| --------------- | ---------------------------- |
| `admin.yml`     | 配置管理员命令和插件基础设置 |
| `banMe.yml`     | 配置自裁设置                 |
| `duel.yml`      | 配置决斗设置                 |
| `roulette.yml`  | 配置轮盘赌设置               |
| `blackjack.yml` | 配置21点设置                 |

相应的设置在文件中应有详细注明

## 编译

如果您需要自行编译，使用在文件目录使用以下命令即可

Windows：`.#gradlew.bat buildPlugin`

Linux：`.#gradlew buildPlugin`

Mirai版本在2.12以下的用户需要向下兼容包，本项目Release并不会提供此类包，请自行编译，编译指令为：`.#gradlew buildPluginLegacy`

编译好的jar文件可以在`#build#mirai`下找到

## 特别感谢

[Mirai](https://github.com/mamoe/mirai) 提供QQ机器人