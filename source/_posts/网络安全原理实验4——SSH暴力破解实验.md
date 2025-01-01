---
title: 网络安全实验报告4——SSH暴力破解实验
tags:
  - 网络安全原理实验报告
  - Wireshark
categories:
  - 网络安全
  - 实验报告
cover: 'https://t.mwm.moe/fj?20240417101810774'
abbrlink: '97781668'
date: 2024-04-17 10:18:10
---

# 实验环境

虚拟机：Kali_Linux_VMware_Workstation_16_Player_Edition
工具：FoxyProxy、BurpSuit

# 实验步骤

## 安装 docker

1. 打开 Kali Linux，在终端输入以下命令安装 docker：

   ```
   sudo apt-get update
   sudo apt-get install docker.io
   ```

2. 检查安装是否成功：

   ![docker安装成功](../images/CyberSecurity/4-DVWA/image.png)

## 部署 DVWA

1. 打开 Kali Linux，在终端输入以下命令部署 DVWA：

   ```
   docker run -d --name w1ndys_dvwa -p 8081:80 vulnerables/web-dvwa
   ```

2. 打开浏览器，输入`http://127.0.0.1:8081`访问 DVWA。

   ![启动DVWA成功](../images/CyberSecurity/4-DVWA/image-1.png)

## 登录 DVWA

1. 输入用户名`admin`和密码`password`登录 DVWA。

   ![登录DVWA成功](../images/CyberSecurity/4-DVWA/image-2.png)

2. 设置`DVWA Security`为`Low`，并点击`Start`启动 DVWA。

   ![设置DVWA Security为Low](../images/CyberSecurity/4-DVWA/image-3.png)

## FoxyProxy

1. 安装 FoxyProxy。

   ![安装FoxyProxy成功](../images/CyberSecurity/4-DVWA/image-4.png)

2. 配置代理

   ![配置成功](../images/CyberSecurity/4-DVWA/image-5.png)

   ![选择代理](../images/CyberSecurity/4-DVWA/image-6.png)

## BurpSuit

1. 设置代理

   ![设置代理](../images/CyberSecurity/4-DVWA/image-7.png)

2. 开启拦截

   ![开启拦截](../images/CyberSecurity/4-DVWA/image-8.png)

3. 回到 DVWA，点击`Login`按钮，查看请求。

   ![查看请求](../images/CyberSecurity/4-DVWA/image-9.png)

4. 抓到包信息

   ![包信息](../images/CyberSecurity/4-DVWA/image-10.png)

5. 添加单点爆破

   ![添加单点爆破](../images/CyberSecurity/4-DVWA/image-11.png)

6. 添加字典

   ![添加字典](../images/CyberSecurity/4-DVWA/image-12.png)

7. 开始爆破

   ![开始爆破](../images/CyberSecurity/4-DVWA/image-13.png)

   观察到 password 的 length 与其他不同，疑似正确密码。

8. 尝试登录

   ![尝试登录](../images/CyberSecurity/4-DVWA/image-14.png)

## 结论

通过 FoxyProxy 和 BurpSuit 的组合，成功爆破 SSH 密码。
