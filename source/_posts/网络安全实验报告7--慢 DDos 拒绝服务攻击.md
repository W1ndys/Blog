---
title: '网络安全实验报告7--慢 DDos 拒绝服务攻击'
categories:
  - QFNU
  - 网络安全
  - 实验报告
tags:
  - 网络安全原理实验报告
  - DDoS攻击
  - Java
  - QFNU
date: 2024-05-08 10:30:32
cover: https://www.xinruiyun.cn/ms-mcms/upload/1/editor/1564027475603.png
---

## 安装 Java 环境

### 下载 Java

![Java 环境安装](../img/CyberSecurity/7-DDoS/image.png)

验证 Java 环境是否安装成功：

![验证 Java 环境是否安装成功](../img/CyberSecurity/7-DDoS/image-1.png)

### 配置环境变量

![image-20240508103905919](../img/CyberSecurity/7-DDoS/image-20240508103905919.png)

## 安装 Tomcat

### 提权

![image-20240508104037624](../img/CyberSecurity/7-DDoS/image-20240508104037624.png)

### 环境变量

![image-20240508104128275](../img/CyberSecurity/7-DDoS/image-20240508104128275.png)

### 新建系统变量

![image-20240508104255153](../img/CyberSecurity/7-DDoS/image-20240508104255153.png)

![image-20240508104456072](../img/CyberSecurity/7-DDoS/image-20240508104456072.png)

### 验证 javac

![image-20240508104534407](../img/CyberSecurity/7-DDoS/image-20240508104534407.png)

### 启动 Tomcat

![image-20240508104615873](../img/CyberSecurity/7-DDoS/image-20240508104615873.png)

![image-20240508104718611](../img/CyberSecurity/7-DDoS/image-20240508104718611.png)

## 靶机安装 MySQL

### 安装

![image-20240508105818143](../img/CyberSecurity/7-DDoS/image-20240508105818143.png)

![image-20240508110009217](../img/CyberSecurity/7-DDoS/image-20240508110009217.png)

![image-20240508110313610](../img/CyberSecurity/7-DDoS/image-20240508110313610.png)

### 安装成功，启动数据库

![image-20240508110446927](../img/CyberSecurity/7-DDoS/image-20240508110446927.png)

## Navicat 安装、激活及连接

### 安装

![image-20240508110831890](../img/CyberSecurity/7-DDoS/image-20240508110831890.png)

### 激活 Navicat

![image-20240508110857545](../img/CyberSecurity/7-DDoS/image-20240508110857545.png)

![image-20240508110909625](../img/CyberSecurity/7-DDoS/image-20240508110909625.png)

![image-20240508110930869](../img/CyberSecurity/7-DDoS/image-20240508110930869.png)

### 打开桌面的 Navicat，连接数据库，密码是 123456

![image-20240508110948725](../img/CyberSecurity/7-DDoS/image-20240508110948725.png)

![image-20240508110959411](../img/CyberSecurity/7-DDoS/image-20240508110959411.png)

### 确认连接



![image-20240508111104172](../img/CyberSecurity/7-DDoS/image-20240508111104172.png)

### 新建数据库

![image-20240508111140048](../img/CyberSecurity/7-DDoS/image-20240508111140048.png)

## 目录部署

![image-20240508111201146](../img/CyberSecurity/7-DDoS/image-20240508111201146.png)

## 运行 SQL 文件

![image-20240508111216729](../img/CyberSecurity/7-DDoS/image-20240508111216729.png)

![image-20240508111225935](../img/CyberSecurity/7-DDoS/image-20240508111225935.png)

![image-20240508111232966](../img/CyberSecurity/7-DDoS/image-20240508111232966.png)

## 重启 Tomcat

![image-20240508111248463](../img/CyberSecurity/7-DDoS/image-20240508111248463.png)

## 下载安装 AWVS

### 安装完成

![image-20240508112005567](../img/CyberSecurity/7-DDoS/image-20240508112005567.png)

### 运行激活软件	

![image-20240508112044706](../img/CyberSecurity/7-DDoS/image-20240508112044706.png)

### AWVS 登录

![image-20240508112137328](../img/CyberSecurity/7-DDoS/image-20240508112137328.png)

### 进行许可证激活

![image-20240508112157227](../img/CyberSecurity/7-DDoS/image-20240508112157227.png)

![image-20240508112204042](../img/CyberSecurity/7-DDoS/image-20240508112204042.png)

![image-20240508112227315](../img/CyberSecurity/7-DDoS/image-20240508112227315.png)

![image-20240508112234640](../img/CyberSecurity/7-DDoS/image-20240508112234640.png)

### 输入命令

以管理员身份运行 cmd，输入以下命令
`cacls“C:\AWVS\shared\license\license_info.json” /t /p everyone:r`
`cacls “C:\ProgramData\Acunetix\shared\license\wa_data.dat” /t /p everyone:r`

![image-20240508112323960](../img/CyberSecurity/7-DDoS/image-20240508112323960.png)

### 成功登录

![image-20240508112339707](../img/CyberSecurity/7-DDoS/image-20240508112339707.png)

## 打开 Acunetix，添加目标

### 查看本机地址

![image-20240508112414246](../img/CyberSecurity/7-DDoS/image-20240508112414246.png)

### 添加目标	

![image-20240508112432796](../img/CyberSecurity/7-DDoS/image-20240508112432796.png)

![image-20240508112442492](../img/CyberSecurity/7-DDoS/image-20240508112442492.png)

![image-20240508112448954](../img/CyberSecurity/7-DDoS/image-20240508112448954.png)

### 开始扫描

![image-20240508112508096](../img/CyberSecurity/7-DDoS/image-20240508112508096.png)

### 扫描结果出现威胁

![image-20240508112524274](../img/CyberSecurity/7-DDoS/image-20240508112524274.png)

![image-20240508112538830](../img/CyberSecurity/7-DDoS/image-20240508112538830.png)

### 导出漏扫报告

![image-20240508112611453](../img/CyberSecurity/7-DDoS/image-20240508112611453.png)

## 攻击机安装 Python

![image-20240508112656720](../img/CyberSecurity/7-DDoS/image-20240508112656720.png)

### 利用 Torshammer 攻击

#### 安装 Torshammer

![image-20240508113129539](../img/CyberSecurity/7-DDoS/image-20240508113129539.png)

#### 开始攻击

![image-20240508113155410](../img/CyberSecurity/7-DDoS/image-20240508113155410.png)

> 此时，在地址栏输入目标网站地址，已无法对该网站进行正常访问
>
> 停止 torshammer.py 攻击进程后，即可恢复目标网站的正常访问关闭 cmd 命令窗口后，出现界面
