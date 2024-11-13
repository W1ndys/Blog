---
title: Python实验——数据分析之matplotlib
tags:
  - Python
categories:
  - Python
cover: >-
  https://th.bing.com/th/id/OIP.dJToM1TiZiJA0GYwzDHwjQHaHY?w=179&h=180&c=7&r=0&o=5&pid=1.7
abbrlink: f73f64dd
date: 2024-11-13 08:49:32
---

## 代码

```py
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import warnings

warnings.filterwarnings("ignore")
plt.rcParams["font.sans-serif"] = ["SimHei"]
plt.rcParams["axes.unicode_minus"] = False

# 绘制 y = x^2 + 2x + 1 的图像
x = np.linspace(-5, 3, 100)
y = x**2 + 2 * x + 1
plt.plot(x, y, "b--", label="$y=x^{2}+2x+1$")
plt.axvline(x=-1, color="r", linestyle="--", linewidth=2.5)
plt.xlabel("x")
plt.ylabel("y")
plt.legend()
plt.show()

# 绘制 sin(x) 和 cos(x) 的子图
x = np.linspace(-3.14, 3.14, 100)
y1 = np.sin(x)
y2 = np.cos(x)
plt.subplot(2, 1, 1)
plt.plot(x, y1, "b", linewidth=2.5)
plt.title("$sinx$")
plt.subplot(2, 1, 2)
plt.plot(x, y2, "r--", linewidth=2.5)
plt.title("$cosx$")
plt.tight_layout()
plt.show()

# 读取酒店数据并绘制柱状图
df = pd.read_excel("酒店数据2.xlsx", index_col=0)
data = df["地区"].value_counts()
x = data.index
y = data.values
plt.figure(figsize=(10, 6))
plt.bar(x, y, color="g")
plt.title("每个地区酒店数量", fontsize=20)
plt.xlabel("地区", fontsize=18)
plt.ylabel("酒店数量", fontsize=18)
plt.xticks(rotation=45)
for a, b in zip(x, y):
    plt.text(a, b + 3, b, ha="center", va="bottom", fontsize=10)
plt.show()

# 价格等级的柱状图和饼图
data2 = df["等级"].value_counts()
x = data2.index
y = data2.values
plt.figure(figsize=(10, 6))
plt.bar(x, y, color="g")
plt.title("各个价格等级占比", fontsize=20)
plt.xlabel("价格等级", fontsize=18)
plt.ylabel("酒店数量", fontsize=18)
plt.xticks(rotation=45)
plt.show()
plt.pie(y, labels=x, autopct="%1.1f%%")
plt.show()

# 酒店评分的直方图
plt.hist(df["评分"], bins=10, edgecolor="black")
plt.title("酒店评分直方图")
plt.xlabel("评分")
plt.ylabel("频数")
plt.show()

# 确保使用正确的列名来计算评分均值
df["评分均值"] = df.groupby("等级")["评分"].transform("mean")

# 按照评分均值排序
sorted_df = df[["等级", "评分均值"]].drop_duplicates().sort_values(by="评分均值")

plt.figure(figsize=(10, 6))  # 设置图片大小
plt.bar(sorted_df["等级"], sorted_df["评分均值"], color="b")  # 绘制柱状图

plt.title("每个价格等级酒店评分均值", fontsize=20)  # 设置标题
plt.xlabel("等级", fontsize=18)
plt.ylabel("评分均值", fontsize=18)  # 对横纵轴进行说明
plt.xticks(rotation=45)  # 标签转90度

plt.show()

```

## 截图

![img](https://picx.zhimg.com/80/v2-a415d2f26f7bdda9ea7a41bca004184b.png)

![img](https://picx.zhimg.com/80/v2-eae1c71d796e8557db45c8561a6eeb20.png)

![img](https://pic1.zhimg.com/80/v2-a9f33eeddfb238d4dc982c29914ebb2b.png)

![img](https://picx.zhimg.com/80/v2-26289929eb484776239311a94288eff8.png)

![img](https://pica.zhimg.com/80/v2-a73b87205f95efbed50c34dfa546cbcb.png)

![img](https://picx.zhimg.com/80/v2-6b8548cb121f8c0cbf0dfbdc194d33e5.png)

![img](https://pic1.zhimg.com/80/v2-8374954247c4328c04362909b15d02b0.png)
