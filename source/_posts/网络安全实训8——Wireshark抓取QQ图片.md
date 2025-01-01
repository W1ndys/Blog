---
title: 网络安全实训8——Wireshark抓取QQ图片
tags:
  - 网络安全实训
  - Wireshark
categories:
  - 网络安全
  - 实训
  - 实验报告
cover: >-
  https://img-blog.csdnimg.cn/20201101000954631.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xsc25iNjY2,size_16,color_FFFFFF,t_70#pic_center
abbrlink: 16b47dd5
date: 2024-07-14 07:54:25
---

## 抓包

1. 我是 png 文件，搜索 8950
2. 找到十六进制字符
3. 继续跟进

![image-20240714082228870](../images/zuolao/8/image-20240714082228870.png)

## 删除多余数据

![image-20240714083056445](../images/zuolao/8/image-20240714083056445.png)

## 查看图片

可以看到已经抓取成功了，由于 QQ 压缩机制导致图片丢失内容过多

![image-20240714083115199](../images/zuolao/8/image-20240714083115199.png)

## 原因与纠错

测试发现从本机向其他人发送的图片会被切割，现在从手机端发给我的电脑

![image-20240714085530677](../images/zuolao/8/image-20240714085530677.png)

再次抓包发现得到了全部的内容没有被切割。

![image-20240714085836724](../images/zuolao/8/image-20240714085836724.png)

删除多余数据

保存查看

![image-20240714085857692](../images/zuolao/8/image-20240714085857692.png)
