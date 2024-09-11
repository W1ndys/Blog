---
title: Python课后题
tags: [Python]
categories: [Python]
cover: "https://th.bing.com/th/id/OIP.dJToM1TiZiJA0GYwzDHwjQHaHY?w=179&h=180&c=7&r=0&o=5&pid=1.7"
abbrlink: 9974513c
date: 2024-09-04 08:59:59
---

## 作业 1

### 编写程序，输入本金、年利率和年数、计算复利（结果保留两位小数）

#### 代码

```py
def calculate_compound_interest(principal, rate, years):
    # 计算复利
    amount = principal * (1 + rate / 100) ** years
    # 保留两位小数
    return round(amount, 2)


# 示例用法
principal = float(input("请输入本金: "))
rate = float(input("请输入年利率: "))
years = int(input("请输入年数: "))

compound_interest = calculate_compound_interest(principal, rate, years)
print(f"本金利率和为: {compound_interest}")
```

#### 输出结果

```
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1> python -u "d:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1\2.py"
请输入本金: 2000
请输入年利率: 5.6
请输入年数: 5
本金利率和为: 2626.33
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1>
```

### 编写程序，输入球的半径，计算球的表面积和体积（结果保留两位小数）

#### 代码

```py
import math

r = float(input("请输入球的半径: "))
S = 4 * math.pi * r**2
V = 4 / 3 * math.pi * r**3
print(f"球的表面积为: {S:.2f}, 体积为: {V:.2f}")
```

#### 输出结果

```
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1> python -u "d:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1\3.py"
请输入球的半径: 2.5
球的表面积为: 78.54, 体积为: 65.45
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1>
```

### 编写程序，声明 getValue(b, r, n)，根据本金 b，年利率 r 和年数 n 计算最终收益 v，v = b(1+r)<sup> n </sup>，然后编写测试代码，提示输入本金、年利率和年数、显示最终收益（保留两位小数）

#### 代码

```python
def getValue(b, r, n):
    return b * (1 + r) ** n


# 测试代码
if __name__ == "__main__":
    b = float(input("请输入本金: "))
    r = float(input("请输入年利率(小数形式): "))
    n = int(input("请输入年数: "))
    v = getValue(b, r, n)
    print(f"最终收益为: {v:.2f}")

```

#### 运行结果

```
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1> python -u "d:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1\tempCodeRunnerFile.py"
请输入本金: 100
请输入年利率(小数形式): 2.5
请输入年数: 5
最终收益为: 52521.88
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1>
```

### 编写程序，求解一元二次方程 x² - 10x + 16 = 0

#### 代码

```Python
import math

a = 1
b = -10
c = 16

# 判别式
delta = b**2 - 4 * a * c

if delta > 0:
    root1 = (-b + math.sqrt(delta)) / (2 * a)
    root2 = (-b - math.sqrt(delta)) / (2 * a)
    print(f"方程有两个不同的实数根: {root1} 和 {root2}")
elif delta == 0:
    root = -b / (2 * a)
    print(f"方程有一个实数根: {root}")
else:
    print("方程无实数根")

```

#### 输出结果

```
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1> python -u "d:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1\tempCodeRunnerFile.py"
方程有两个不同的实数根: 8.0 和 2.0
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1>
```

### 编写程序，提示输入姓名和出生年份，输出姓名和年龄

#### 代码

```Python
# 编写程序，提示输入姓名和出生年份，输出姓名和年龄
name = input("请输入姓名: ")
year = int(input("请输入出生年份: "))
age = 2024 - year
print(f"您好！{name}。今年{age}岁")

```

#### 输出结果

```
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1> python -u "d:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1\6.py"
请输入姓名: W1ndys
请输入出生年份: 2004
您好！W1ndys。今年20岁
PS D:\Documents\StudyData\QFNU\AAA课程\Python\课程\作业1>
```

## 作业 2

### 编写程序，格式化输出杨辉三角。杨辉三角即二项式定理的系数表，各元素满足如下条件：第一列及对角线上的元素均为 1；其余每个元素等于它上一行同一列元素与前一列元素之和。

```python
杨辉三角
i = int(input("输入行数: "))
number_list = []
for j in range(1, i + 1):
    number_list.insert(0, 1)
    for k in range(1, len(number_list) - 1):
        number_list[k] = number_list[k] + number_list[k + 1]
    line = ""
    for _ in number_list:
        line += str(_) + " "
    print(line.center(i * 2))
```

### 输入直角三角形的两个直角边，求三角形的周长和面积，以及两个锐角的度数。结果均保留一位小数。其运行效果如图 44 所示。

```python
import math

i, j = int(input("请输入三角形的直角边A(>0): ")), int(
    input("请输入三角形的直角边B(>0): ")
)

print(f"直角三角形的三边分别为: a={i:.1f}, b={j:.1f}, c={math.sqrt(i**2 + j**2):.1f}")
print(f"三角形的周长 = {i + j + math.sqrt(i**2 + j**2):.1f}，面积 = {i * j / 2:.1f}")
print(
    f"三角形两个锐角的度数分别为: {round(math.asin(i / math.sqrt(i**2 + j**2)) * 180 / math.pi, 0):.1f} 和 {round(math.asin(j / math.sqrt(i**2 + j**2)) * 180 / math.pi, 0):.1f}"
)
```

### 编程产生 0~100（包含 0 和 100）的 3 个随机数 a、b 和 c,要求至少使用两种不同的方法，将 3 个数按从小到大的顺序排序。其运行效果如图 4-5 所示（其中，a、b 和 c 的值随机生成）。

```python
import random


# 直接排序
def direct_sort():
    a = random.randint(1, 100)
    b = random.randint(1, 100)
    c = random.randint(1, 100)

    print(f"直接排序前: a={a}, b={b}, c={c}")

    if a > b:
        a, b = b, a
    if a > c:
        a, c = c, a
    if b > c:
        b, c = c, b

    print(f"直接排序后: a={a}, b={b}, c={c}")


# sort()排序
def sort_sort():
    a = random.randint(1, 100)
    b = random.randint(1, 100)
    c = random.randint(1, 100)

    print(f"sort()排序前: a={a}, b={b}, c={c}")

    a, b, c = sorted([a, b, c])
    print(f"sort()排序后: a={a}, b={b}, c={c}")


if __name__ == "__main__":
    direct_sort()
    sort_sort()
```
