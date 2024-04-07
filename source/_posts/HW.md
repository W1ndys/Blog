---
title: "HW"
tags: [HW]
categories: [HW]
date: 2024-04-07 13:21:31
---

# HW

## HW

linux 系统
首先查看一下基础信息
netstat -ano/-a #查看端口情况
uname -a #系统信息
ps -aux ps -ef #进程信息
cat /etc/passwd #用户情况
ls /home/ #用户情况

查看日志文件
/var/log/nginx/ #默认 Nginx 日志目录
/var/log/apache/ #默认 Apache 日志目录
/var/log/apache2/ #默认 Apache 日志目录
/usr/local/tomcat/logs #Tomcat 日志目录

tail -f xxx.log #实时刷新滚动日志文件

通过命令查看可疑文件
find /var/www/html -name _.php -mmin -20 #查看最近 20 分钟修改文件
find ./ -name '_.php' | xargs wc -l | sort -u #寻找行数最短文件
grep -r --include=_.php '[^a-z]eval($\_POST' /var/www/html #查包含关键字的 php 文件
find /var/www/html -type f -name "_.php" | xargs grep "eval(" |more

不死马查杀命令（只是临时解决方案，彻底解决请重启服务器）

<?php system("kill -9 pid;rm -rf .shell.php"); ?>  #pid和不死马名称根据实际情况定

后门用户查杀：
UID 大于 500 的都是非系统账号，500 以下的都为系统保留的账号，使用 userdel -r username 完全删除账户

通过主机安全和态势感知发现告警，这类发现告警的话是可以定位到具体的时间的，根据发生时间来上级排查，定位该时间段内服务器上有做修改的文件，可以快速排查到是否存在 webshell 文件

windows 系统

1. 首先排查 windows 日志查看可疑时间段内的操作，查看 windows 日志方法（通过运行命令。按下“Win+R”键打开运行窗口，输入“eventvwr.msc”后按回车键），需要重点排查的内容是，在被攻击的时间段内的文件打开记录、自启动运行记录、软件运行记录，通过排查日志来清理入侵者上传的后门等文件
   [图片]

2. 排查目前的进程，按住 Ctrl+Shift+esc 可以打开任务管理器，需要观察的是占用网络比较大的进程，可以按照网络排序查看是否有占用流量比较大的的进程，右键可以定位到该文件在磁盘中的物理位置，查看可疑文件的创建时间来判断是否为攻击者上传的文件（这个时间也可以修改的，只能作为参考，并不代表创建时间较老就不是攻击者上传的文件）
   [图片]

3. 查看系统自启动项（通过运行命令。按下“Win+R”键打开运行窗口，输入“msconfig.exe”后按回车键）需要查看的是服务这里面是否有可疑的自启动项，这里面显示的是在开机的时候会自动运行的命令，如果被攻击的话可能在这里看到是否有攻击者为了维持权限添加的自启动项，从而定位到木马文件。
   [图片]

4. 查看系统用户是否存在影子用户，打开注册表查看 KEY_LOCAL_MACHINE/SAM/SAM/Domains/Account/Users/下是否存在陌生账户，及时删除。
   影子账户：通过修改注册表内用的 abc$值和已存在用户abc$的相同的手段，可以实现 net user 命令看不到用户；用户管理窗口也看不到用户；只可以通过注册表查看到该用户，攻击者可以利用该账号直接登录到系统

# 安全设备

雷池 waf https://waf-ce.chaitin.cn/

报警

绝大部分攻击流量都是 http，web 层面，看流量包研判

其他的应用绝大部分都是密码暴破 mysql，rdp，ssh，mssql，redis 等

常见协议的端口

# 简单的 payload

扫描器的 payload，sql 注入，xss，xxe，ssti，命令注入，代码注入，请求走私，反弹 shell，webshell 上传

# 复杂的 payload

反序列化 payload，编码 payload，webshell 通信

常见的绕过，{IFS}，%00，/\*\*/，0x1212123213

# 溯源

## 网络层面

安全设备的记录，态势感知，日志审计，定位源 ip

定位真实 ip：社工，攻击者工具漏洞，蜜罐

## 主机层面

### 用户

登录记录，突然多出来的用户，隐藏用户

### 进程

特权进程，隐藏进程，资源占用比较高的进程

### 网络连接

本机和其他机器建立的连接，dns 隧道

微步在线 IP 和域名是否是恶意的 https://x.threatbook.com/

### 常见的持久化手段

webshell，ssh 后门，icmp 隧道，dns 隧道等
