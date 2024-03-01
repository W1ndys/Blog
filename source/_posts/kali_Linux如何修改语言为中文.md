---
date: 2023-10-10 22:35
title: kali_Linux如何修改语言为中文
tags: Linux
categories:
  - Linux
  - kali
  - 语言设置
abbrlink: 4c6d962f
---

### 友情提示

修改前快照一下，避免修改操作错误带来的问题！

1. 打开终端

2. 打开设置

   输入

   ```
   dpkg-reconfigure locales
   ```

3. 修改设置

   `en_US.UTF-8 UTF-8`改为不勾选

   - 下面这种有个`*`属于已经勾选了
   - 通过上下箭头按键我们把红点（表示当前选中的选项）移动到`en_US.UTF-8 UTF-8`，按下空格表示不勾选/勾选
   - 使用空格勾选`[ ]zh_CN.GBK_GBK` 和`[ ] zh-CN.UTF-8.UTF-8`两个选项，这里有部分虚拟机会找不到`[ ]zh_CN.GBK_GBK`，这两个选项是紧跟着的，找不到就算了，问题不大。
   - 按下`enter` 表示`ok`，选择语言`zh_CN.UTF-8`

4. 重启生效设置

   重启后会有个提示，建议你选择`保留旧名称`，以后路径敲代码敲英文肯定比敲中文方便很多！

   ```
   reboot
   ```

   



---

原文：https://blog.csdn.net/u011027547/article/details/123344249