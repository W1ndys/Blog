---
date: 2023-12-04 22:02
title: Python实现九宫格切割图片
tags:
  - Python小工具
  - Python脚本
categories:
  - 学习笔记
  - Python
abbrlink: 3d80d4a2
---

#### 克隆本项目

```
git clone https://github.com/W1ndys/1to9-image.git
```

然后可以看到项目文件夹

![image-20231204220532722](../img/Python/1-to-9/image-20231204220532722.png)

#### 使用方法

1. 把需要分割的图片复制进文件夹并且命名为 `input_image.jpg`
2. 在当前目录进命令行执行 `python 1.py`
3. 看到输出回显之后找 `output`文件夹就行



#### 注意

本项目适用于长宽一致的正方形图片，分割最佳效果

其余比例不适合使用本项目

非常适合朋友圈九宫格切图