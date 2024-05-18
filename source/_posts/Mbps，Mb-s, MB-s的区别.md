---
title: "Mbps，Mb/s, MB/s的区别"
tags:
  - 学习笔记
  - 计算机网络
  - 传输速率
categories:
  - 学习笔记
  - 计算机网络
cover: "https://pic3.zhimg.com/v2-e4e9f9d71a9aa54f3730d0a39fa67a22_r.jpg"
abbrlink: 66b2f6fd
date: 2024-05-18 14:55:38
---

为了搞懂这几个单位之间的区别，我们首先需要弄懂这其中的最重要的 **B** 与 **b** 分别代表了什么

**b**，通常为 bit 的简称，中文为比特，计算机存储传输中的最小单位

**B**，通常为 Byte 的简称，中文为字节，其中 1Byte=8bit

其中，bit 这个单位太小了，通常只在数据通信形容带宽时出现

## 单位转换

**1 Byte = 8 bit**

**1 KB = 1024 B (KB, KiloByte)**

**1MB = 1024 KB (MB, MegaByte)**

**1 GB = 1024 MB (GB, GigaByte)**

**1 TB = 1024 GB (TB, TeraByte)**

这些单位通常用来指代某个文件大小，或者说存储设备的存储容量

以上通常用来指代存储大小，而如果形容传输速度或者下载速度的话

那么，很明显我们还需要结合时间单位 s，秒

加上了秒，我们就可以得到更加丰富的单位

**Mbps**, Megabits per second，兆比特每秒

**Mb/s**, Megabits per second，兆比特每秒

**MB/s**, MegaByte per second, 兆字节每秒

值得注意的是，在描述计算机网络传输速率时，它们之间的转换倍数不再是 1024 而是 1000

**1 Kb/s = 1000 b/s**

**1 Mb/s = 1000 Kb/s**

**1 Gb/s = 1000 Mb/s**

搞明白了这个基本含义，那么我们可以很轻松得到这几个常见单位之间的转换关系了

**1 MB/s = 8 Mb/s = 8 Mbps**

---

相关链接：https://zhuanlan.zhihu.com/p/682846252#/
