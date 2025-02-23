---
title: 基于NapCatQQ和Python的QQ机器人开发——连接NapCatQQ和W1ndysBot
tags:
  - QQbot
  - QQ机器人
  - Python
  - NapCatQQ
categories:
  - QQbot
abbrlink: cdcbc710
date: 2025-01-25 20:51:30
---

## 部署 NapCatQQ

### Windows 安装

{% note info %}
下面是无头非绿色版本，你也可以选择 NapCatQQ 的无头绿色版本，内置 QQ，不需要下载 QQ 本体，直接下载框架即可。由于绿色版开袋即用，启动就是登录，与非绿色版唯一的区别就是启动文件名字不同，绿色版的启动文件名字是 `napcat.bat`，非绿色版的启动文件名字是 `launcher***.bat`，这里不详细介绍。
{% endnote %}

#### 下载 QQ 本体

直接去 QQ 官网下载 QQ 本体，必须是 NT 的新版 QQ

下载地址 [QQ-轻松做自己](https://im.qq.com/index/#downloadAnchor)

#### 安装框架

去 NapCatQQ 的 release 页下载 [框架下载地址](https://github.com/NapNeko/NapCatQQ/releases/)

下载之后解压看到下面一些文件

![image-20250125121852680](https://pica.zhimg.com/80/v2-a6838b30aa5159685e4f3a404eabd906.png)

根据你的电脑系统选择启动脚本

1. 确保 QQ 版本安装且最新
2. 双击目录下 launcher.bat 即可启动 如果是 win10 则使用 launcher-win10.bat

#### 登录

运行上面所属文件之后，你将看到如下界面，你有两种方法进行登录，推荐第一种

![image-20250125122103940](https://pica.zhimg.com/80/v2-2effa5a8e0a5e1f6fac1df06e003148d.png)

> 如果你使用的绿色版本，则启动就会直接到这一步

##### 登录方法一

上方红框里有两个链接，复制到浏览器里

点击扫码登录

![image-20250125122134955](https://pica.zhimg.com/80/v2-6a251be51cd1ff14b8497f019d20bbbc.png)

手机 QQ 进行扫码登录

登录成功后将会进入首页

##### 登录方法二

直接扫描控制台里的二维码（但由于不同电脑字符不一样，有的电脑显示的二维码可能不能扫，在上方图片下面的红框里，有一个地址和一个路径，把地址转换为二维码扫描或直接打开路径的二维码文件都可以获取到可以扫的二维码）

这种方法也可以登录，但由于后续步骤还需要打开方法一的链接，所以不推荐这种登录方法

#### 配置协议连接

在上面的网页里登录成功后将看到下面内容

![image-20250125122445991](https://pica.zhimg.com/80/v2-5df097c3a9563c30f77a023197cac622.png)

点击左侧网络配置-新建-websocket 服务器，按照下面进行配置

开关打开，名称随便写（不能空着），port 改成 3001，心跳间隔改成 60000，其他设置默认即可，确认

![image-20250125122539046](https://pica.zhimg.com/80/v2-52e3f36c4dafd0fc4c5c5adf6cc6b174.png)

开启之后可以看到类似下面内容

> 01-25 13:02:25 [info] 卷卷测试服 | [Notice] [OneBot11] 配置变更后:
> [network] 配置加载
> WebSocket 服务: 0.0.0.0:3001, : 已启动

### docker 安装

> 我是比较喜欢 docker 的，因为我平时用都会在 linux 服务器上运行，docker 会更方便一些

docker 部署命令，W1ndysBot 有大量的我写好的 docker 运行脚本，可以直接参考着使用

[W1ndysBot/linux_run_napcat_docker.sh at main · W1ndysBot/W1ndysBot](https://github.com/W1ndysBot/W1ndysBot/blob/main/linux_run_napcat_docker.sh#/)

还有更新镜像的 shell 脚本：[W1ndysBot/linux_update_napcat.sh at main · W1ndysBot/W1ndysBot](https://github.com/W1ndysBot/W1ndysBot/blob/main/linux_update_napcat.sh)

```sh
# 启动 Docker 容器
docker run -d \
  --rm \
  --network host \
  -e NAPCAT_GID=$NAPCAT_GID \
  -e NAPCAT_UID=$NAPCAT_UID \
  -p 3000:3000 \
  -p 3001:3001 \
  -p 6099:6099 \
  --name napcat \
  --restart=always \
  -v ./napcat/app/.config/QQ:/app/.config/QQ \
  -v ./napcat/app/napcat:/app/napcat \
  mlikiowa/napcat-docker
```

拉完镜像剩下的就跟前面步骤一模一样了

> 其他的我就不多说了，你都会用 docker 了，其他还有什么错误是解决不了的

## 部署处理程序

W1ndysBot 开源地址 [W1ndysBot/W1ndysBot: 基于 NapCatQQ 和 Python 的 QQ 机器人实现](https://github.com/W1ndysBot/W1ndysBot)

### 解压程序到本地

解压之后看到下面文件

![image-20250125130459638](https://pica.zhimg.com/80/v2-b76350cc60c80c7a44c908d000585413.png)

这里部署好了虚拟环境，可以直接运行，如果你有 Python 基础，也可以自己改环境运行，但不推荐

### 运行程序

已经写好了批处理脚本

双击 `run_app.bat` 即可运行

连接成功后即可看到如下界面

![image-20250125130820179](https://pica.zhimg.com/80/v2-1e0a0a2eb2fe9173a107e892c5ebe3ef.png)

> 看到这里说明已经部署好环境，下面开始修改配置

## 配置数据

进入目录，找到配置文件 `app/config.py`

可以用专用的编辑器打开，也可以用记事本打开

注意！！！配置好之后，需要重启程序，否则配置不会生效

```python
# config.py

owner_id = ["<your_owner_id>"]  # 机器人 root 管理员 QQ 号，可以多个，多个用逗号分隔，例如：owner_id = ["123456", "123457"]，注意！！！这个是 QQ 号不是机器人的QQ号，是你控制机器人用的大号

report_group_id = "<your_report_group_id>"  # 上报群

# ws_url = "ws://127.0.0.1:8081"  # 本地环境的 WebSocket API 地址

ws_url = "ws://127.0.0.1:3001"  # 本地环境的 WebSocket API 地址


token = None  # 如果需要认证，请填写认证 token
```

修改上面配置，下面是一个修改好的例子

```python
# config.py

owner_id = ["123456"]  # 机器人root管理员 QQ 号

report_group_id = "123456"  # 上报群

# ws_url = "ws://127.0.0.1:8081"  # 本地环境的 WebSocket API 地址

ws_url = "ws://127.0.0.1:3001"  # 本地环境的 WebSocket API 地址


token = None  # 如果需要认证，请填写认证 token
```

owner_id 是机器人 root 管理员 QQ 号

report_group_id 是上报群

ws_url 是 WebSocket API 地址

token 是认证 token

后面两个配置取决于前面的配置，一般不需要改
