---
title: HW
tags:
  - HW
categories:
  - HW
abbrlink: 8c7613a5
date: 2024-04-07 13:21:31
cover: https://ts1.cn.mm.bing.net/th/id/R-C.aa5ec1661251ce3a8a572e5372963682?rik=PQKLxnZAoj6Jdg&riu=http%3a%2f%2fimg95.699pic.com%2fphoto%2f40154%2f0058.jpg_wh300.jpg!%2ffh%2f300%2fquality%2f90&ehk=sAm6P8WHj2krqBvO0hscCiA8udGEq6UIsBGHhy9L3fE%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1
---

# HW

## HW

linux 系统

> 首先查看一下基础信息
>
> netstat -ano/-a #查看端口情况
>
> uname -a #系统信息
>
> ps -aux ps -ef #进程信息
>
> cat /etc/passwd #用户情况
>
> ls /home/ #用户情况

查看日志文件

> /var/log/nginx/ #默认 Nginx 日志目录
> /var/log/apache/ #默认 Apache 日志目录
> /var/log/apache2/ #默认 Apache 日志目录
> /usr/local/tomcat/logs #Tomcat 日志目录

`tail -f xxx.log` #实时刷新滚动日志文件

通过命令查看可疑文件

> find /var/www/html -name _.php -mmin -20 #查看最近 20 分钟修改文件
> find ./ -name '_.php' | xargs wc -l | sort -u #寻找行数最短文件
> grep -r --include=_.php '[^a-z]eval($\_POST' /var/www/html #查包含关键字的 php 文件
> find /var/www/html -type f -name "_.php" | xargs grep "eval(" |more

不死马查杀命令（只是临时解决方案，彻底解决请重启服务器）

`<?php system("kill -9 pid;rm -rf .shell.php"); ?> ` #pid和不死马名称根据实际情况定

后门用户查杀：
UID 大于 500 的都是非系统账号，500 以下的都为系统保留的账号，使用 userdel -r username 完全删除账户

通过主机安全和态势感知发现告警，这类发现告警的话是可以定位到具体的时间的，根据发生时间来上级排查，定位该时间段内服务器上有做修改的文件，可以快速排查到是否存在 webshell 文件

windows 系统

1. 首先排查 windows 日志查看可疑时间段内的操作，查看 windows 日志方法（通过运行命令。按下“Win+R”键打开运行窗口，输入“eventvwr.msc”后按回车键），需要重点排查的内容是，在被攻击的时间段内的文件打开记录. 自启动运行记录. 软件运行记录，通过排查日志来清理入侵者上传的后门等文件
   [图片]

2. 排查目前的进程，按住 Ctrl+Shift+esc 可以打开任务管理器，需要观察的是占用网络比较大的进程，可以按照网络排序查看是否有占用流量比较大的的进程，右键可以定位到该文件在磁盘中的物理位置，查看可疑文件的创建时间来判断是否为攻击者上传的文件（这个时间也可以修改的，只能作为参考，并不代表创建时间较老就不是攻击者上传的文件）
   [图片]

3. 查看系统自启动项（通过运行命令。按下“Win+R”键打开运行窗口，输入“msconfig.exe”后按回车键）需要查看的是服务这里面是否有可疑的自启动项，这里面显示的是在开机的时候会自动运行的命令，如果被攻击的话可能在这里看到是否有攻击者为了维持权限添加的自启动项，从而定位到木马文件。
   [图片]

4. 查看系统用户是否存在影子用户，打开注册表查看 KEY_LOCAL_MACHINE/SAM/SAM/Domains/Account/Users/下是否存在陌生账户，及时删除。
   影子账户：通过修改注册表内用的 abc`$值和已存在用户abc$`的相同的手段，可以实现 net user 命令看不到用户；用户管理窗口也看不到用户；只可以通过注册表查看到该用户，攻击者可以利用该账号直接登录到系统

## 安全设备

雷池 waf https://waf-ce.chaitin.cn/

报警

绝大部分攻击流量都是 http，web 层面，看流量包研判

其他的应用绝大部分都是密码暴破 mysql，rdp，ssh，mssql，redis 等

常见协议的端口

## 简单的 payload

扫描器的 payload，sql 注入，xss，xxe，ssti，命令注入，代码注入，请求走私，反弹 shell，webshell 上传

## 复杂的 payload

反序列化 payload，编码 payload，webshell 通信

常见的绕过，{IFS}，%00，`/\*\*/`，0x1212123213

## 溯源

### 网络层面

安全设备的记录，态势感知，日志审计，定位源 ip

定位真实 ip：社工，攻击者工具漏洞，蜜罐

### 主机层面

#### 用户

登录记录，突然多出来的用户，隐藏用户

#### 进程

特权进程，隐藏进程，资源占用比较高的进程

#### 网络连接

本机和其他机器建立的连接，dns 隧道

微步在线 IP 和域名是否是恶意的 https://x.threatbook.com/

#### 常见的持久化手段

webshell，ssh 后门，icmp 隧道，dns 隧道等

## 主要的 Web 漏洞

### Sql 注入

原理：网站数据过滤不严格，过分信赖用户输入的数据, 没有过滤用户输入的恶意数据，无条件的把用户输入的数据当作 SQL 语句执行，因此导致 sql 注入漏洞产生

Sql 注入分类：

1.  以有无闭合字符分类：字符型. 整数型
2.  以数据传输方式分类：post 类型. get 类型
3.  注入方式细分：联合查询注入. 报错型注入. 布尔型盲注. 时间型盲注. 宽字节注入

报错注入常用函数：`UpdateXML() `. `Floor()`. `Extractvalue()`

mysql 默认存在的哪个数据库，注入时经常用到？

> `Information_schema`

时间型盲注特点？常用函数？易受到什么影响？

1.  场景：应用于无数据回显，无报错，布尔型盲注失效后

2.  特点：时间型盲注页面没有明显的回显，只能根据页面刷新时间的长短来去判断构造语句是否正确；

3.  常用函数: sleep 函数 if 条件语句 等

4.  易受网络波动影响

布尔型盲注特点?常用函数？

1.  特点:根据页面正确和错误的两种状态，来判断构造语句是否正确

2.  常用函数：

    1.  length() #用以猜测数据返回字符串的长度
    2.  Sunstr() #截取字符串
    3.  Mid() #取出字符串的一部分值
    4.  Left() #取出字符串左边的几个数据
    5.  Ascii() #返回一个字符的 ascii 码值

sql 手注的一般步骤

1. 判断注入点

2. 判断注入类型

3. 判断注入点提交方式

4. 使用 order by 语句查询数据库有多少字段

5. 使用联合查询来查询 union select

   User（） 当前用户

   Database() 数据库

   Version() 数据库版本

6. 查询数据库中的表. 列和值

## 应急响应问题

### linux 服务器被上传 webshell，如何进行应急

1.  在网站的根目录下用下河马或者 d 盾扫下看看，看看能不能扫出 webshell

2.  查看网站的 web 日志，使用 weblshell 会在网站的 web 日志中留下 Webshell 页面的访问数据和数据提交记录，主要特征是少量 ip 对其发起访问，总的访问次数少，该页面属于孤立页面

3.  看下相关设备的告警流量，看下 web shell 的名字和路径，然后在服务器上使用 find 命令进行查找。并删除

### hw 期间的应急响应

1.  一般先封堵攻击源 IP，事件处置组人员根据攻击事件通报信息或报告，封禁攻击源 IP

2.  事件处置组人员根据攻击事件报告，处置安全事件，处置方式包括：安全设备策略调整、系统下线、服务器排查、应用排查、加固整改、系统上线

3.  上报安全事件，上报接口人根据攻击行为报告和处置报告，对攻击事件、威胁处置上报演习系统上报平台

### 除了杀进程还有什么方法可以快速找到 webshell 吗？因为有时候占用率高的不一定是木马，也可能是业务相关进程

看下相关设备的告警流量，看下 webshell 的名字和路径，然后在服务器上使用 find 命令进行查找。

或者在网站的根目录下用下河马或者 d 盾扫下看看，看看能不能扫出 webshell。

### 应急响应的流程？

### 应急响应常用的工具？

火绒剑、d 盾、河马(linux 和 windows 通用)、微步云沙箱.

### 查看进程、注册表的工具有了解吗？

火绒剑可以一键查看进程和注册表. LastActivityView

### windows 应急响应

1. 进程排查 netstat -ano 查看目前的网络连接，定位可以的 ESTABLISHED,根据 netstat 定位的 pid(进程编号)再通过 taskli st 显示运行本地或远程计算机的所有进程

2. 用户组情况判断 查看服务器中的，dos 命令 net user 查看隐藏的账户注册表 HKEY_LOCAL MACHINE\SAM\SAM\Domains\Acco unt\Users\Names

3. 服务相关判断 运行 command+R m sconfig(打开系统设置)服务

4. 系统启动项排查 msconfig 启动

5. 计划任务创建/删除检测 cmd 中 scht asks.exe

6. 注册表的排查注册表的排查，建议使用杀软去做文件排查查看最近访问的目录：recent webshell:D 盾、河马 webshell C2
   后门：360、卡巴、诺顿

7. 日志排查 windows 登录日志排查运行 eventvwr4624 账号成功登录 4625 账号登录失败

8. 中间件日志排查 不同中间件有不同日志目录看源 p 目的 ul 时间响应码可以用工具：360 星图日志结尾一般为 acess.logo

### linux 应急响应

1. 文件排查：tmp 目录文件（临时文件）Is-alt /tmp

2. 启动项排查：查看开启启动项内容 ls-alt/etc/init..d/

3. 查看命令执行记录：直接 history 或者 cat~/bash_history

4. 用户信息排查/etc/passwd

5. 计划任务排查 crontab 查看当前的计划有那些，是否有后门木马程序启动相关信息

6. 进程排查：netstat-antlp,根据 n etstat 定位出 pid,使用 ps 命令，分析进程 top

7. 系统登录日志排查：ssh 日志：/var/log/lastlog 查看最近登录的记录系统中所有用户最近一次登录信息：lastlog

8. 中间件日志查询 Apache:var/log/httpd/Ngix:var/log/nginx//

9. 后门排查使用河马 webshell/find(命令)可以用工具：GScan

### 勒索病毒的应急响应？

1. 首先了解现状、了解发病时间和系统架构，确认被感染的主机

2. 先进行临时处置，对被感染的主机进行网络隔离，禁止使用移动存储设备，对未感染的主机进行 ACL 隔离，关闭 SSH（Linux 的远控），RDP（Windows 的远控）等协议，也不能适用移动存储设。

3. 获取样本，Windows 系统进行文件排查，进程排查，系统信息排查，系统日志排查；Linux 系统排查文件、进程、日志

4. 进行进一步的处置，对已经感染的主机，进行断网隔离，等待解密进展，最后重装系统，对位感染的主机进行补丁修复，还可以使用安全软件进行防护并及时更新病毒库/规则库

5. 最后是防御，定期打补丁，部署杀软，对口令策略进行加固，部署流量监测设备。

### 挖矿应急响应

1. 判断

   1. 查看 CPU 占用率（判断 CPU 占用率是否过高）

   2. 查看天眼的流量分析，是否去别的有危险的网站下载东西，然后在本地执行了挖矿的一些命令（结合天眼设备分析，看是否去可以网站下载过东西，或在本地执行挖矿命令）

   3. 是否有外连，向远程 IP 的请求（netstat -ano 查看所有端口）

2. 事件分析（第二步分析）

   1. 登录网站服务器，查看进程是否有异常；（查看网站服务器是否有异常进程 系统命令 tasklist）

   2. 进行查看异常进程的服务项是什么…选择可疑服务项，然后停止服务，其启动类型会变为静止。（并查看它的服务项，尤其是可疑服务（系统命令 services.msc 查看服务项））
   3. 进行查看一下计划任务有没有可疑的（查看一下有没有可疑的计划任务）

3. 临时解决方案（最后解决并处置）

   1. 停止并禁用可以服务项，有时候服务项的名称会变，但描述不会变，根据描述快速找到服务项，删除服务项（然后根据描述寻找可疑服务项，停用可疑服务项）

   2. 根据实际存在木马的路径，进行删除木马（如果知道木马的路径的话，直接删除木马）

   3. 重启服务器

   4. 使用杀软全盘查杀

### Java 反序列化的 CC 链构造原理

Java 反序列化的 CC 链构造原理涉及了 Java 反序列化机制、Commons Collections 库中的 Transformer 接口以及漏洞利用的过程。以下是构造 CC 链的基本原理：

**Java 反序列化机制：**
Java 的反序列化机制允许将对象从字节流中重新构建成实例。这个过程涉及到将对象的状态信息从字节流中读取出来，并使用这些信息来构造对象的实例。Java 中的反序列化由 ObjectInputStream 类来执行。

**Commons Collections 库中的 Transformer 接口：**
Commons Collections 库提供了一组 Transformer 接口和实现，用于对对象进行转换和操作。其中，Transformer 接口定义了一个单一方法 transform，用于对输入对象进行转换并返回转换后的对象。攻击者可以构造一个 Transformer 链，将多个 Transformer 对象串联起来，形成一个 CC 链。

**漏洞利用过程：**
构造的 CC 链会利用 Commons Collections 库中的某些 Transformer 实现中的漏洞，通过反序列化触发漏洞，并最终实现攻击者预期的恶意操作。通常情况下，这些漏洞会导致在反序列化过程中执行任意代码或者执行特定的恶意操作。

具体来说，构造 CC 链的过程可能包括以下步骤：

1. 选择合适的 Transformer 实现，并组成一个 Transformer 链。
2. 构造一个带有 CC 链的序列化数据，通常使用 Java 的序列化机制实现。
3. 将序列化数据输入到目标应用程序中，通过反序列化触发漏洞，使 CC 链得以执行。

最终，CC 链中的 Transformer 将按照预期执行，并实现攻击者的目标，例如执行任意代码或者获取系统权限。

总的来说，Java 反序列化的 CC 链构造原理涉及了利用 Commons Collections 库中的 Transformer 接口和 Java 的反序列化机制，通过构造特定的 Transformer 链并利用漏洞来实现攻击目标。

## 讲一下 TOP10 有哪些？

1.失效的访问控制

2.加密机制失效

3.注入（包括跨站脚本攻击 XSS 和 SQL 注入等）

4.不安全设计

5.安全配置错误

6.自带缺陷和过时的组件

7.身份识别和身份验证错误

8.软件和数据完整性故障

9.安全日志和监控故障

10.服务端请求伪造 SSRF

## 冰蝎、菜刀、蚁剑、哥斯拉的特点

菜刀：ASP 语言编写的 Windows 远控管理软件，年代比较久，鼻祖级别的，曾经风靡一时，现已经逐渐被其他三个所取代
冰蝎：基于 Java 编写，有跨平台特性，流量动态加密（AES128 + 随机密钥）
哥斯拉：基于 C#编写，流量加密能过大部分静态查杀和 WAF（查杀和 WAF 也在更新，随时就可能不行了），自带的各种插件功能异常强大
蚁剑：基于 Java 编写跨平台远控管理工具，模块化开发，代码简单易懂，可扩展性强

## 冰蝎、菜刀、蚁剑、哥斯拉的流量特征

菜刀： 流量特征主要表现在 HTTP 协议上，使用 HTTP 协议通信，控制命令和数据都通过 POST 请求传输。因此，可以通过 HTTP 请求头中的 User-Agent、Referer 等信息进行识别
蚁剑： 流量特征主要表现在数据包的加密方式和数据类型。蚁剑使用了 AES 加密算法对数据进行加密，同时还使用了自定义的二进制协议，在通信中传输各种类型的数据
冰蝎： 流量特征主要表现在数据包中的特殊标记和传输的数据类型。冰蝎的数据包中包含了特定的标记，如”flag=0x52415631”，用于标识该数据包是冰蝎的控制命令。此外，冰蝎还使用了一种自定义的二进制协议，在通信中传输各种类型的数据。
哥斯拉： 流量特征主要表现在数据包的特殊标记和数据类型。哥斯拉的数据包中包含了特定的标记，如”XORHEAD”和”XORBODY”，用于标识该数据包是哥斯拉的控制命令。此外，哥斯拉还使用了一种自定义的二进制协议，在通信中传输各种类型的数据

## 冰蝎的通信原理

攻击者发送连接请求至服务端，建立 SSL/TLS 协议的加密通道，使用 HTTP 协议进行数据传输，并且对数据进行了加密处理，保证通信内容的机密性
服务端返回一个随机数作为密钥（目前是 16 位 MD5），存储在 $\_SESSION 中返回给客户端
客户端输入待执行命令，使用上述返回的密钥进行加密（目前是 AES 128），发送至服务端
服务端解密，执行相关命令，并加密执行结果（目前是 AES 128）
客户端对执行结果解密
固定的请求字节头（dFAXQV1LORcHRQtLRlwMAhwFTAg/M 解密后： @error_reporting;\r）和固定的响应字节头（TxcWR1NNExZAD0ZaAWMIPAZjH1BFBFtHThcJSlUXWEd 解密后： {“status”:”c3VjY2Vzcw==”,”msg”:”）
默认连接密码 rebeyond，冰蝎 4.0 有一串固定密钥 e45e329feb5d925b ，是默认连接密码的 32 位 MD5 值的前 16 位

## 冰蝎的流量特征

Accept ： Accept: application/json, text/javascript, /; q=0.01
Content-Type ：大量的 Content-type: Application/x-www-form-urlencoded
User-Agent ： 随机的
Port：端口通常在 49700 附近
代码：webshell 固定代码，不同开发语言的 webshell 代码不同。如 `$post=Decrypt(file_get_contents(“php://input”)); eval($post)`
连接：冰蝎为了减少开销，默认使用长链接，请求头和响应头中会带有 Connection: Keep-Alive

冰蝎流量特征
2.1 冰蝎 2.0
使用`AES加密 + base64编码`，AES 使用动态密钥对通信进行加密，进行请求时内置了十几个 User-Agent 头，每次请求时会随机选择其中的一个。因此当发现一个 ip 的请求头中的 user-agent 在频繁变换，就可能是冰蝎。
2.2 冰蝎 3.0
使用 AES 加密 + base64 编码,取消了 2.0 的动态获取密钥，使用固定的连接密钥，AES 加密的密钥为 webshell 连接密码的 MD5 的前 16 位，默认连接密码是"rebeyond"(即密钥是 md5('rebeyond')[0:16]=e45e329feb5d925b)。进行请求时内置了十几个 User-Agent 头，每次请求时会随机选择其中的一个。因此当发现一个 ip 的请求头中的 user-agent 在频繁变换，就可能是冰蝎。

3.0 连接 jsp 的 webshell 的请求数据包中的 content-type 字段常见为 application/octet-stream。

2.3 冰蝎 4.0
提供了传输协议自定义的功能，让用户对流量的加密和解密进行自定义，实现流量加解密协议的去中心化。v4.0 版本不再有连接密码的概念，自定义传输协议的算法就是连接密码。
Accept 字段（弱特征），通常是 Accept: application/json, text/javascript, /; q=0.01 意思是浏览器可接受任何文件，但最倾向 application/json 和 text/javascript。
Content-Type 字段（弱特征），通常是 Content-type: Application/x-www-form-urlencoded
与冰蝎的前述版本相似，进行请求时内置了十几个 User-Agent 头，每次请求时会随机选择其中的一个。
连接的端口有一定的特征，冰蝎与 webshell 建立连接的同时，java 也与目的主机建立 tcp 连接，每次连接使用本地端口在 49700 左右(就是比较大的端口)，每连接一次，每建立一次新的连接，端口就依次增加。
使用长连接，避免了频繁的握手造成的资源开销。默认情况下，请求头和响应头里会带有 Connection：Keep-Alive
有固定的请求头和响应头，请求字节头：dFAXQV1LORcHRQtLRlwMAhwFTAg/M ，响应字节头：TxcWR1NNExZAD0ZaAWMIPAZjH1BFBFtHThcJSlUXWEd
默认时，冰蝎 webshell 都有“e45e329feb5d925b” 一串密钥，与冰蝎 3.0 相同。 3. 哥斯拉流量特征
哥斯拉支持多种加密方式，采用了和冰蝎 2.0 类似的密钥交换方式。它的 webshell 需要动态生成，可以根据需求选择不同的加密方式。

3.1 哥斯拉静态特征
在默认脚本编码的情况下，jsp 会出现 xc、pass 字符和 Java 反射(ClassLoader，getClass().getClassLoader())，base64 加解码等特征。

3.2 哥斯拉动态特征
User-Agent 字段（弱特征），如果采用默认的情况，会暴露使用的 jdk 信息。不过哥斯拉支持自定义 HTTP 头部，这个默认特征是可以很容易去除的。
Accept 字段（弱特征），默认是 Accept:text/html, image/gif, image/jpeg, \*; q=.2, /; q=.2。同上，这个也可修改，只能作为辅助检测的特征。
Cookie 中有一个非常关键的特征，最后会有个分号。估计后续的版本会修复。
响应体的数据有一定特征，哥斯拉会把一个 32 位的 md5 字符串按照一半拆分，分别放在 base64 编码的数据的前后两部分。整个响应包的结构体征为：md5 前十六位+base64+md5 后十六位。

https://www.cnblogs.com/-andrea/p/17473499.html#/