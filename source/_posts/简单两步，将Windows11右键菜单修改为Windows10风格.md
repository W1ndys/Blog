---
date: 2023-09-23 16:14
title: 简单两步，将Windows11右键菜单修改为Windows10风格
tags: Windows技术分享
categories:
  - Windows
  - 系统设置
abbrlink: 831f896e
---

原文链接http://t.csdn.cn/dhe9N

Windows11更新后，右键菜单很多功能隐藏起来了，使用时需要点击“显示更多选型”才能获取完整功能。为了能获得Windows10右键菜单丝滑的体验，我总结了以下方法。

修改前：

https://img-blog.csdnimg.cn/img_convert/59704c4ffbd6af9764dd5ab84c0fc7bf.gif

修改后：

https://img-blog.csdnimg.cn/img_convert/1e8911f87d020b6034f90d8b5b1a9255.gif

# 方法一：控制台操作法

按住win+R打开运行窗口


输入cmd，打开控制台
在控制泰中输入下方代码，回车，显示操作成功
开启旧版右键菜单：

```
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```

恢复windows11新版右键菜单：

```
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
```


