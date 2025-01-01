---
title: 网络安全实训9——Office宏病毒
tags:
  - 网络安全实训
  - Office宏病毒
categories:
  - 网络安全
  - 实训
  - 实验报告
cover: >-
  https://tse2-mm.cn.bing.net/th/id/OIP-C.0PTLuvy0WEE-OL68_C4RMQHaFz?rs=1&pid=ImgDetMain
abbrlink: 7432ba23
date: 2024-07-15 08:07:28
---

## 下载 CS

我这里之前网络安全协会讲座测试环境的时候装过一次汉化版，考虑到实验环境，再下个老师给的 CS

![image-20240715081157188](../images/zuolao/9/image-20240715081157188.png)

## 运行服务端

```bash
给予服务端程序 teamserver 执行权限（在 linux 中复制进来的文件默认是没有执行权限的）
chmod +x teamserver
 
# 可以查看 kali 的 IP 地址（可选）
ifconfig eth0
 
# # 运行服务端程序，192.168.0.104 是本机 IP，user   是要设置的连接密码（可改）
./teamserver 192.168.0.104 user
```

![image-20240715081739711](../images/zuolao/9/image-20240715081739711.png)

报错了，搜了一下，配置 java 环境变量：[java 安装常见问题之 Kali 永久配置环境变量_kali 环境变量-CSDN 博客](https://blog.csdn.net/woaipdd/article/details/130437412#/)

![image-20240715082550903](../images/zuolao/9/image-20240715082550903.png)

好吧还是不行，用我之前的版本的

![image-20240715084351396](../images/zuolao/9/image-20240715084351396.png)

新建配置文件，连接 CS 服务器 

```
java -Dfile.encoding=UTF-8 -javaagent:CobaltStrikeCN.jar -XX:ParallelGCThreads=4 -XX:+AggressiveHeap -XX:+UseParallelGC -jar cobaltstrike.jar
```

admin

user

![image-20240715084531021](../images/zuolao/9/image-20240715084531021.png)

![image-20240715084717182](../images/zuolao/9/image-20240715084717182.png)

创建一个新的监听器 -> 填写监听器名称（随便写，不重复就行）-> 选择有效载荷/攻击模块/攻击方式

![image-20240715085901127](../images/zuolao/9/image-20240715085901127.png)

添加 HTTP 主机

![image-20240715085926582](../images/zuolao/9/image-20240715085926582.png)

添加要在开启监听的 HTTP 端口：*0-65535*  在这个取值范围中 1023 以下的端口已经分配给了常用的一些应用程序，建议往大的填，避免端口被占用（重复）--> 最后保存即可

![image-20240715090035615](../images/zuolao/9/image-20240715090035615.png)

## 攻击目标机器

- HTML Application（生成 **hta** HTML 应用程序）

### 生成 hta 文件 （木马文件）

![image-20240715090201960](../images/zuolao/9/image-20240715090201960.png)

![image-20240715090220237](../images/zuolao/9/image-20240715090220237.png)

### 文件下载

![image-20240715090304128](../images/zuolao/9/image-20240715090304128.png)

我直接用本机测试了

![image-20240715093608095](../images/zuolao/9/image-20240715093608095.png)

![image-20240715093656314](../images/zuolao/9/image-20240715093656314.png)

### 攻击目标机器 - 操控目标机器

当有目标主机以任何方式运行了生成的被控端，出现在主机列表。

选中要操作的目标主机 **->** 鼠标右键 **->** 进入 beacon（交互命令界面），在此使用 Beacon Commands 对目标主机执行各种操作。

![image-20240715094102087](../images/zuolao/9/image-20240715094102087.png)

![image-20240715094135319](../images/zuolao/9/image-20240715094135319.png)

图形界面

![image-20240715094210812](../images/zuolao/9/image-20240715094210812.png)

查看 IP

![image-20240715094242078](../images/zuolao/9/image-20240715094242078.png)

使用文件管理

![image-20240715094309859](../images/zuolao/9/image-20240715094309859.png)

#### 获取目标的进程

![image-20240715094407929](../images/zuolao/9/image-20240715094407929.png)

### 生成后门木马 - Office 宏病毒

##### **创建** Office 宏病毒 代码

![image-20240715094926084](../images/zuolao/9/image-20240715094926084.png)

成功上线

![image-20240715095102483](../images/zuolao/9/image-20240715095102483.png)
