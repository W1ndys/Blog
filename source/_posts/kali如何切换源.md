---
date: 2023-10-01 15:03
title: kali如何切换源
tags: Linux
categories:
  - Linux
  - kali
  - 切换源
abbrlink: 3073af94
---

转载  

https://blog.csdn.net/fingue/article/details/127096363



# 1、进入vim模式

sudo su进入root 模式
vim /etc/apt/sources.list编辑软件源配置文件

随后进入vim模式

# 2、国内源

```
官方源
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
#根据需要自己选一个，中科大的还可以
#中科大
deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
#阿里云
#deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
#deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
#清华大学
#deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free
#deb-src https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free
#浙大
#deb http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free
#deb-src http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free
#东软大学
#deb http://mirrors.neusoft.edu.cn/kali kali-rolling/main non-free contrib
#deb-src http://mirrors.neusoft.edu.cn/kali kali-rolling/main non-free contrib
#重庆大学
#deb http://http.kali.org/kali kali-rolling main non-free contrib
#deb-src http://http.kali.org/kali kali-rolling main non-free contrib
```

# 3、换源

按“i”进行编辑

将源插入后，点击“Esc”退出编辑，输入“：wq”回车保存退出，此处插入的是清华大学的源。

注：“#”有注释本行的用途，可以先将原来的源进行注释，再插入新源

# 4、随后输入下列命令行进行更新

更新软件列表(非root权限在命令行前加“sudo”)

apt-get update 更新索引

apt-get upgrade 更新软件

apt-get dist-upgrade 升级

apt-get clean 删除缓存包

apt-get autoclean 删除未安装的deb包
————————————————
版权声明：本文为CSDN博主「不过教资不改名111」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/fingue/article/details/127096363