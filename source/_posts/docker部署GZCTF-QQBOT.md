---
title: docker部署GZCTF-QQBOT
tags:
  - QQbot
  - QQ机器人
  - Python
  - Onebot11
  - NapCatQQ
  - nonebot2
categories:
  - QQbot
cover: "https://github.com/GZTimeWalker/GZCTF/raw/develop/assets/banner.light.svg"
abbrlink: 542f29fd
date: 2024-08-09 19:49:04
---

## 环境要求

1. Linux 服务器
2. docker
3. docker compose

## 开始部署

相关链接：[MoRan23/GZCTF-BOT-QQ: GZCTF 对接的 qq 机器人，基于 NapCat+Nonebot 框架 (github.com)](https://github.com/MoRan23/GZCTF-BOT-QQ)

进入 GZBOTGithub 地址，由于服务器对于 Github 的网络连接会偶然连不上，这里使用 docker-compose 部署，Github 的 README 写的很详细了，这里多说几点易错点。

1. 下方监听的赛事名是 GZCTF 的赛事名，**不是赛事序号或赛事 ID**，赛事名叫什么就写什么，比如下图中的赛事名就是 `W1ndys的bot测试`

   ![image-20240809195548593](./../images/QQbot/GZCTF-BOT/image-20240809195548593.png)

2. 把下面代码参数改好后保存为 `docker-compose.yml`

   ```
   version: "3.7"
   services:
     napcat:
       image: mlikiowa/napcat-docker:latest
       restart: always
       ports:
         - "6099:6099"    # 如果端口占用换一个就行
       environment:
         - "ACCOUNT=your_account"  #机器人的qq号
         - "WSR_ENABLE=true"
         - 'WS_URLS="ws://bot:8988/onebot/v11/ws/"'
       volumes:
         - "./napcat/app:/usr/src/app/napcat"
         - "./napcat/config:/usr/src/app/napcat/config"
       depends_on:
         - bot

     bot:
       image: registry.cn-hangzhou.aliyuncs.com/moran233/nn:GZBOT
       restart: always
       environment:
         - "SEND_LIST=xxxxxxx" #监听qq群号
         - 'GAME_LIST="xxxxx"' #监听赛事名
         - "GZCTF_URL=xxxxxx" #GZCTF网址
         - "GZ_USER=xxxxxx" #GZCTF管理员用户名
         - "GZ_PASS=xxxxxxx" #GZCTF管理员密码
         - 'SUPER="xxxxxxx"' #机器人管理员qq号
   ```

3. 在当前目录执行（如果你是旧版 docker，可能需要加个短线 `docker-compose up -d`）

   ```
   docker compose up -d
   ```

4. 查看 `NapCatQQ` 的 docker 日志，如果 **查不到**，先看一下自己的容器名称，以你自己实际容器名称为准，扫二维码登录 QQ 账号

   ```
   docker logs napcat
   ```


> 测试发现，两个容器有主从关系，我打算直接引入现有的 NapCatQQ 没成功，有师傅成功了可以借鉴一下

## 查看日志测试

这是 `赛事机器人` 的日志

![image-20240809204053173](./../images/QQbot/GZCTF-BOT/image-20240809204053173.png)

这是 `NapCatQQ` 的日志

![image-20240809204210787](./../images/QQbot/GZCTF-BOT/image-20240809204210787.png)
