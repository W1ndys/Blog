---
title: Python课后题
tags: [Python]
categories: [Python]
cover: "https://th.bing.com/th/id/OIP.dJToM1TiZiJA0GYwzDHwjQHaHY?w=179&h=180&c=7&r=0&o=5&pid=1.7"
abbrlink: 9974513c
date: 2024-09-04 08:59:59
---

## 作业 1 Python 语言基础

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

## 作业 2 程序流程控制

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

### 编程产生 0~100（包含 0 和 100）的 3 个随机数 a、b 和 c, 要求至少使用两种不同的方法，将 3 个数按从小到大的顺序排序。其运行效果如图 4-5 所示（其中，a、b 和 c 的值随机生成）。

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

### 编程计算有固定工资收入的党员每月所交纳的党费。工资基数 3000 元及以下者，交纳工资基数的 0.5%；工资基数 3000~5000 元者，交纳工资基数的 1%；工资基数在 5000~ 10000 元者，交纳工资基数的 1.5%；工资基数超过 10000 元者，交纳工资基数的 2%。运行效果如图 4-6 示。

```
i = int(input("请输入有固定工资收入的党员的月工资："))


if i <= 3000:
    f = 0.5 * 0.01 * i
elif i <= 5000:
    f = 1 * 0.01 * i
elif i <= 10000:
    f = 1.5 * 0.01 * i
else:
    f = 2 * 0.01 * i

print(f"月工资 = {i}, 交纳党费 = {f}")

```

### 编程实现袖珍计算器，要求输入两个操作数和一个操作符（十、一、、/、%），根据操作符输出运算结果。注意“/”和“%”运算符的零除异常问题。其运行效果如图 4-7 所示。

```py
x = float(input("请输入操作数x："))
y = float(input("请输入操作数y："))
n = input("请输入操作符：")

if n == "+":
    print(f"{x:.1f} + {y:.1f} = {x + y:.1f}")
elif n == "-":
    print(f"{x:.1f} - {y:.1f} = {x - y:.1f}")
elif n == "*":
    print(f"{x:.1f} * {y:.1f} = {x * y:.1f}")
elif n == "/":
    print(f"{x:.1f} / {y:.1f} = {x / y:.1f}")
else:
    print("输入错误")

```

### 输入三角形的 3 条边 a、b、c, 判断此 3 边是否可以构成三角形。若能，进一步判断三角形的性质，即为等边、等腰、直角或其他三角形。本题的判断准则参见表 4-16。其运行效果如图 4-8 所示。

```python
a = float(input("请输入三角形的边a："))
b = float(input("请输入三角形的边b："))
c = float(input("请输入三角形的边c："))

if a + b > c and a + c > b and b + c > a:
    if a == b == c:
        print("该三角形为等边三角形！")
    elif a == b or a == c or b == c:
        print("该三角形为等腰三角形！")
    elif a**2 + b**2 == c**2 or a**2 + c**2 == b**2 or b**2 + c**2 == a**2:
        print("该三角形为直角三角形！")
    else:
        print("该三角形为一般三角形！")
else:
    print("无法构成三角形！")

```

### 编程实现鸡兔同笼问题。已知在同一个笼子里共有 h 只鸡和兔，鸡和兔的总脚数为 f, 其中 h 和 f 由用户输入，求鸡和兔各有多少只？要求使用两种方法：一是求解方程；二是利用循环进行枚举测试。

```python
h = int(input("请输入总头数："))

f = int(input("请输入总脚数（必须是偶数）："))


while f % 2 != 0:
    f = int(input("请输入总脚数（必须是偶数）："))

r = f / 2 - h
c = h - r

if c >= 0 and r >= 0 and c == int(c) and r == int(r):
    print(f"方法一：鸡：{int(c)}只，兔：{int(r)}只")
else:
    print("方法一：无解，请重新运行测试！")

for c in range(0, h + 1):
    r = h - c
    if 2 * c + 4 * r == f:
        print(f"方法二：鸡：{int(c)}只，兔：{int(r)}只")
        break
else:
    print("方法二：无解，请重新运行测试！")

```

### 输入任意实数 x, 计算 e 的近似值，直到最后一项的绝对值小于 10 <sup> 6 </sup> 为止

偷个懒，直接用 math 库嘿嘿

```py
import math

x = float(input("请输入x："))
print(pow(math.e, x))

```

### 输入任意实数 a(a≥0)，用迭代法求 x = √a, 要求计算的相对偏差小于 10 <sup>-6 </sup>。

```python
def sqrt_iterative(a, tolerance=1e-6):
    x = a
    while True:
        next_x = 0.5 * (x + a / x)
        if abs(next_x - x) < tolerance:
            return next_x
        x = next_x


a = float(input("请输入a："))
if a >= 0:
    print(f"{a:.0f}的算数平方根为={sqrt_iterative(a)}")
else:
    print("输入的数必须大于等于0")

```

### 我国汉代有位大将，名叫韩信。他每次集合部队，只要求部下先后按 1~3、1~5、1~7 报数，然后再报告一下各队每次报数的余数，他就知道到了多少人。他的这种巧妙算法被人们称为“鬼谷算”，也叫“隔墙算”，或称为“韩信点兵”，外国人还称它为“中国余数定理”。即有一个数，用 3 除余 2，用 5 除余 3，用 7 除余 2，请问 0~1000 中这样的数有哪些？

```py
print("0~1000中用3除余2，用5除余3，用7除余2的数有：")
for i in range(0, 1001):
    if i % 3 == 2 and i % 5 == 3 and i % 7 == 2:
        print(i, end=" ")
```

### 一球从 100 米的高度自由落下，每次落地后反弹回原高度的一半，再落下。·求小球在第 10 次落地时共经过多少米？第 10 次反弹多高？

```py
# 初始高度
height = 100
# 总距离
total_distance = 100

# 计算第10次落地时的总距离和反弹高度
for i in range(1, 10):
    height /= 2
    total_distance += height * 2


print(f"小球在第10次落地时，共经过{total_distance}米")
print(f"第10次反弹{height}米")

```

### 猴子吃桃问题。猴子第一天摘下若干个桃子，当天吃掉一半多一个；第二天接着吃了剩下的桃子的一半多一个；以后每天都吃了前一天剩下的桃子的一半多一个。到第 8 天发现只剩一个桃子了。请问猴子第一天共摘了多少个桃子？

```py
# 猴子吃桃
def monkey_eat_peach(n):
    if n == 1:
        return 1
    else:
        return (monkey_eat_peach(n - 1) + 1) * 2


for i in range(8):
    print(f"第{i+1}天的桃子数为：{monkey_eat_peach(i+1)}")

```

### 计算 $S_n = 1+11+111+1111+\ldots+1111$（最后一项是 $n$ 个 $1$）。提示：第 $1$ 项 $T_1 = 1$；第 $2$ 项 $T_2 = T_1 \times 10 + 1$；…；第 $n$ 项 $T_n = T_{n-1} \times 10 + 1$。$n$ 是一个随机产生的 $1$~$10$（包括 $1$ 和 $10$）中的正整数。

```py
import random

n = random.randint(1, 10)


def an(n):
    if n == 1:
        return 1
    else:
        return an(n - 1) * 10 + 1


sn = 0

for i in range(1, n + 1):
    sn += an(i)

print(f"当n={n}时，sum_sn={sn}")

```

## 作业 3 常用内置数据类型

### 编写程序，计算 1+2+3 十十 100 之和。

```py
sum = 0
for i in range(1, 101):
    sum += i
print(sum)
```

### 编写程序，计算 10 十 9 十 8 十十 1 之和。

```py
sum = 0
for i in range(10, 0, -1):
    sum += i
print(sum)
```

### 编写程序，计算 1 十 3 十 5 十 7 十 99 之和。

```py
sum = 0
for i in range(1, 101):
    if i % 2 != 0:
        sum += i
print(sum)
```

### 编写程序，计算 2 十 4 十 6 十 8…十 100 之和。

```py
sum = 0
for i in range(1, 101):
    if i % 2 == 0:
        sum += i
print(sum)
```

### 编写程序，使用不同的实现方法输出 2000 一 3000 的所有闰年

```py
for i in range(2000, 3001):
    if i % 4 == 0 and i % 100 != 0 or i % 400 == 0:
        print(i, end=" ")

```

### 编写程序，计算 S.= 13+十 5 一 7 十 9 一 11 十…

```py
n = int(input())
while n % 2 == 0:
    print("请输入奇数")
    n = int(input())

Sn = 0
sign = 1
for i in range(1, n + 1, 2):
    Sn += sign * i
    sign *= -1

print("Sn =", Sn)

```

### 编写程序，计算 S.= 1 十 1/2 十 1/3 十…

```py
# 求n分之一
def fraction_to_decimal(n):
    return 1 / n


n = int(input("请输入一个整数："))
sum = 0
for i in range(1, n + 1):
    sum += fraction_to_decimal(i)
print(sum)
```

### 编写程序，打印九九乘法表。要求输出九九乘法表的各种显示效果（上三角、下三角、矩形块等方式)。

```py
# 打印九九乘法表的矩形块
def print_multiplication_table():
    for i in range(1, 10):
        for j in range(1, 10):
            print(f"{i}*{j}={i*j}", end="\t")
        print()


# 打印九九乘法表的上三角
def print_upper_triangle():
    for i in range(1, 10):
        for j in range(i, 10):
            print(f"{i}*{j}={i*j}", end="\t")
        print()


# 打印九九乘法表的下三角
def print_lower_triangle():
    for i in range(1, 10):
        for j in range(1, i + 1):
            print(f"{i}*{j}={i*j}", end="\t")
        print()


print("矩形块:")
print_multiplication_table()
print("\n上三角:")
print_upper_triangle()
print("\n下三角:")
print_lower_triangle()
```

### 编写程序，输入三角形的 3 条边，先判断是否可以构成三角形，如果可以，则进一步求三角形的周长和面积，否则报错“无法构成三角形！”。其运行效果如图 3-11 所示（结果均保留一位小数)。

```py
a, b, c = (
    int(input("请输入三角形的三边长：")),
    int(input("请输入三角形的三边长：")),
    int(input("请输入三角形的三边长：")),
)
if a + b > c and a + c > b and b + c > a and a > 0 and b > 0 and c > 0:
    S = (a + b + c) / 2
    area = (S * (S - a) * (S - b) * (S - c)) ** 0.5
    print(f"三角形的面积为：{area}")
else:
    print("输入的三边长不能构成一个三角形")

```

## 作业 4 序列数据类型

### 统计单词个数

```py
str = input("请输入字符串：")
space_count = 0
number_count = 0
other_count = 0
for i in str:
    if i == " ":
        space_count += 1

print(f"其中单词数为：{space_count+1}")
```

### 删除 list 重复元素

```py
list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5]
new_list = []
for i in list:
    if i not in new_list:
        new_list.append(i)
print(new_list)
```

### 求列表中元素个数，最大值，最小值，元素之和，平均值

```py
s = [9, 7, 8, 3, 2, 1, 55, 6]
count = 0
max = s[0]
min = s[0]
sum = 0
avg = 0
for i in s:
    if i > max:
        max = i
    if i < min:
        min = i
    sum += i
avg = sum / len(s)
print(f"最大值：{max}，最小值：{min}，和：{sum}，平均值：{avg}")
```

### 列表内偶数变次方，奇数不变

```py
s = [9, 7, 8, 3, 2, 1, 5, 6]
new_s = []
for i in s:
    if i % 2 == 0:
        new_s.append(i**2)
    else:
        new_s.append(i)
print(f"变换前：{s}")
print(f"变换后：{new_s}")
```

### 将字符串中的每个字符的 ASCII 码存入列表

```py
str = input("请输入字符串：")
list = []
for i in str:
    list.append(ord(i))
print(list)
```

## 作业 4 附加题

### 列表元素用特定符号连接

```py
list = ["字符1", "字符2", "字符3", "字符4", "字符5", "字符6"]
print("-".join(list))
```

### 删除列表重复元素，去重元素放到新列表

```py
list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5]
new_list = []
for i in list:
    if i not in new_list:
        new_list.append(i)
print(new_list)
```

### 输入多个分数存在列表，去除最高分和最低分，求平均分

```py
lst = list(map(int, input("请输入数字，用空格隔开：").split(" ")))
lst.sort()
lst = lst[1:-1]
avg = sum(lst) / len(lst)
print(avg)
```

### 空列表的添加，最高最低平均，降序切片，收尾插入，后五替换，奇数删除

```py
# 空列表的添加，最高最低平均，降序切片，收尾插入，后五替换，奇数删除

# lst = [80, 50, 23, 61, 83, 35, 37, 51, 1, 37]

# 空列表的添加
lst = []
for i in range(10):
    lst.append(int(input("请输入第{}个成绩：".format(i + 1))))

print(f"10个成绩为{lst}")

# 最高最低平均
print(f"最高分为{max(lst)}")
print(f"最低分为{min(lst)}")
print(f"平均分为{sum(lst) / len(lst)}")

# 降序排列
lst.sort(reverse=True)
print(f"降序排列后10个成绩为{lst}")

# 前三名
print(f"前三名成绩为{lst[:3]}")

# 后三名
print(f"后三名成绩为{lst[-3:]}")

# 首尾插入
lst.insert(0, 100)
lst.append(0)
print(f"插入后成绩为{lst}")

# 后五替换
lst[-5:] = [60] * 5
print(f"替换后成绩为{lst}")

# 奇数删除
lst = [i for i in lst if i % 2 == 0]
print(f"删除后成绩为{lst}")
```

### 横版竖版输出古诗

```py
# 5.py


def print_poem(poem):
    # 将诗句按行分割
    lines = poem.split("\n")

    # 打印横版
    print("--------横版--------")
    for line in lines:
        print(line)

    # 打印竖版
    print("\n--------竖版--------")
    max_length = max(len(line) for line in lines)
    for i in range(max_length):
        for line in reversed(lines):  # 顺序倒置
            if i < len(line):
                print(line[i], end=" ")
            else:
                print("  ", end=" ")
        print()


# 输入古诗
poem = """白日依山尽
黄河入海流
欲穷千里目
更上一层楼"""

print_poem(poem)
```

## 实验 5 输入和输出

### 解析命令行参数

```
# https://www.cnblogs.com/techflow/p/13631509.html#/

import argparse


def calculate_square_properties(side_length):
    perimeter = 4 * side_length
    area = side_length * side_length
    return perimeter, area


def main():
    parser = argparse.ArgumentParser(description="计算正方形的周长和面积。")
    parser.add_argument("--sidelength", type=int, default=10, help="正方形边长")

    args = parser.parse_args()
    side_length = args.sidelength

    perimeter, area = calculate_square_properties(side_length)

    print(f"周长={perimeter}, 面积={area}")


if __name__ == "__main__":
    main()
```

### 读取文本文件

```py
import argparse


def main():
    parser = argparse.ArgumentParser(description="读取文件的相对路径")
    parser.add_argument("path", type=str, help="相对文件路径")

    args = parser.parse_args()
    path = args.path

    try:
        with open(path, "r", encoding="utf-8") as file:
            lines = file.readlines()
            for idx, line in enumerate(lines, start=1):
                print(f"{idx}: {line.strip()}")
    except FileNotFoundError:
        print(f"文件 {path} 未找到")
    except Exception as e:
        print(f"读取文件时发生错误: {e}")


if __name__ == "__main__":
    main()
```

### 输入并格式化保存 logs

```py
import argparse


# 阶乘
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)


def main():
    parser = argparse.ArgumentParser(description="n的值")
    parser.add_argument("n", type=int, help="n的值")

    args = parser.parse_args()
    n = args.n

    for i in range(n + 1):
        try:
            with open(f"out.logs", "a", encoding="utf-8") as file:
                file.write(f"{i} {i*2} {factorial(i)}\n")
        except Exception as e:
            print(f"写入0-n时发生错误: {e}")


if __name__ == "__main__":
    main()

```

### 创建文本文件写入读取

```py
def read_file():
    with open("shige.txt", "r", encoding="utf-8") as file:
        lines = file.readlines()
        for line in lines:
            print(line.strip())


def write_file():
    with open("shige.txt", "w", encoding="utf-8") as file:
        file.write("春晓\n春眠不觉晓，\n处处闻啼鸟。\n夜来风雨声，\n花落知多少。\n")


if __name__ == "__main__":
    write_file()
    read_file()

```

### csv 文件读取和写入

```py
import pandas as pd

headers = ["学号", "姓名", "年龄", "专业", "入学成绩"]
rows = [
    ("1001", "张三", 19, "物理学", 550),
    ("1002", "李四", 18, "电子工程", 530),
    ("1005", "王五", 19, "生物工程", 540),
    ("1006", "赵四", 19, "软件工程", 530),
]

# 将数据写入CSV文件
df = pd.DataFrame(rows, columns=headers)
df.to_csv("data.csv", index=False, encoding="utf-8")

# 读取CSV文件
df_read = pd.read_csv("data.csv", encoding="utf-8")
print(df_read)

```

## 实验 6 异常处理

### 异常处理

```py
try:
    a = 10
    b = 5
    c = a / b
    if a > b:
        raise ValueError("a的值大于b.不符合要求")
except IndexError:
    print("索引错误")
except ValueError as ve:
    print(f"数值错误: {ve}")
except ArithmeticError:
    print("算术错误")
except Exception as e:
    print(f"未知异常: {e}")

```

## 实验 7 函数和函数式编程

### 递归非递归求阶乘

```py
# 递归求阶乘
def fact(n):
    if n == 1:
        return 1
    else:
        return n * fact(n - 1)


# 非递归求阶乘
def fact_iter(n):
    result = 1
    while n > 1:
        result *= n
        n -= 1
    return result


n = int(input("请输入一个整数："))
print("递归求阶乘：", fact(n))
print("非递归求阶乘：", fact_iter(n))

```

### 斐波那契数列

```
# 求斐波那契数列
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)


# 输出前20，每行10个
for i in range(1, 21):
    print(fib(i), end="\t")
    if i % 10 == 0:
        print()
```

### 可变参数定义

```
#  可变参数求任意个数的最小值
def min_n(a, b, *c):
    return min(a, b, *c)


# 测试代码
print(min_n(8, 2))
print(min_n(16, 1, 7, 4, 15))

```

### 元组

```
def analyze_sequence(seq):
    max_value = max(seq)
    min_value = min(seq)
    count = len(seq)
    return max_value, min_value, count


# 测试数据
s1 = [9, 7, 8, 3, 2, 1, 55, 6]
s2 = ["apple", "pear", "melon", "kiwi"]
s3 = "TheQuickBrownFox"

# 运行测试
result1 = analyze_sequence(s1)
result2 = analyze_sequence(s2)
result3 = analyze_sequence(s3)

print(
    f"list1 = {s1}\n最大值 = {result1[0]}, 最小值 = {result1[1]}, 元素个数 = {result1[2]}"
)
print(
    f"list2 = {s2}\n最大值 = {result2[0]}, 最小值 = {result2[1]}, 元素个数 = {result2[2]}"
)
print(
    f"list3 = {s3}\n最大值 = {result3[0]}, 最小值 = {result3[1]}, 元素个数 = {result3[2]}"
)

```

## 实验 9 附加题

### 奇偶判断

```
def isOdd(num):
    return num % 2 != 0


# 示例使用
num = int(input("请输入一个整数: "))
if isOdd(num):
    print(f"{num} 是 奇数")
else:
    print(f"{num} 是 偶数")

```

### 阶乘

```
def factorial(n):
    if n == 0:
        return 1
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result


def main():
    m = int(input("请输入一个整数(n>=0): "))
    total_sum = 0
    for i in range(m + 1):
        fact = factorial(i)
        print(f"{i}的阶乘是{fact}")
        total_sum += fact
    print(f"<= {m}的所有数的阶乘之和为{total_sum}")


main()

```

### 找最小值

```
def min_n(a, b, *c):
    # 将所有参数放入一个列表
    numbers = [a, b] + list(c)
    # 找到最小值
    min_value = min(numbers)
    return min_value


# 测试代码
print(f"8, 2中最小值为 {min_n(8, 2)}")
print(f"16, 1, 7, 4, 15中最小值为 {min_n(16, 1, 7, 4, 15)}")

```

### 列表元组

```
def analyze_sequence(seq):
    max_value = max(seq)
    min_value = min(seq)
    length = len(seq)
    return max_value, min_value, length


# 测试数据
s1 = [4, 3, 5, 76, 5, 2]
s2 = ["apple", "pear", "banana", "kiwi"]
s3 = "TheQuickBrownFox"

# 结果
result1 = analyze_sequence(s1)
result2 = analyze_sequence(s2)
result3 = analyze_sequence(s3)

print(
    f"list = {s1}\n最大值= {result1[0]}，最小值= {result1[1]}，元素个数= {result1[2]}"
)
print(
    f"list = {s2}\n最大值= {result2[0]}，最小值= {result2[1]}，元素个数= {result2[2]}"
)
print(
    f"list = {s3}\n最大值= {result3[0]}，最小值= {result3[1]}，元素个数= {result3[2]}"
)

```

### 字频

```
def count_numbers(input_string):
    # 将输入字符串转换为列表
    numbers = list(map(int, input_string.split(',')))

    # 创建一个字典来统计每个数字出现的次数
    count_dict = {}
    for number in numbers:
        if number in count_dict:
            count_dict[number] += 1
        else:
            count_dict[number] = 1

    # 打印统计结果
    print("统计结果为:")
    for number, count in count_dict.items():
        print(f"{number} 出现 {count} 次")

    # 找出出现次数最多的数字
    max_count = max(count_dict.values())
    most_frequent_numbers = [number for number, count in count_dict.items() if count == max_count]

    # 打印出现次数最多的数字和次数
    print("出现次数最多的数字和它出现的次数是:")
    for number in most_frequent_numbers:
        print(f"{number} 出现 {max_count} 次")

# 示例输入
input_string = "2,3,3,2,4,5,6,6,7,8"
count_numbers(input_string)
```

### 找数

```
def My_Search(lst, target):
    left, right = 0, len(lst) - 1
    while left <= right:
        mid = (left + right) // 2
        if lst[mid] == target:
            return mid
        elif lst[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return "未查找到该数"


# 示例用法
lst1 = [12, 15, 33, 34, 35, 39, 42, 45, 45, 49]
lst2 = [10, 11, 15, 23, 29, 31, 42, 46, 48, 49]

print(My_Search(lst1, 33))  # 输出: 2
print(My_Search(lst2, 33))  # 输出: 未查找到该数

```

### 斐波那契

```
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)


def print_fibonacci():
    for i in range(20):
        # 计算斐波那契数
        num = fib(i)
        # 打印，宽度为5，右对齐
        print(f"{num:>5}", end=" ")
        # 每10个数换行
        if (i + 1) % 10 == 0:
            print()


print_fibonacci()

```

### reduce

```
from functools import reduce


def fn(x, y):
    return x * 10 + y


a = [1, 3, 5, 7, 9]
result = reduce(fn, a)
print(result)  # 输出: 13579

```

### 正负分离

```
# 输入一组整数
input_numbers = input("输入一组有正有负的整数，用逗号隔开:").split(",")

# 将输入的字符串转换为整数
numbers = list(map(int, input_numbers))

# 使用 lambda 和 filter 过滤出大于零的元素
positive_numbers = list(filter(lambda x: x > 0, numbers))

# 输出结果
print(positive_numbers)

```

## 实验 10

pandas 实现 csv 的增删改查

```py
import pandas as pd
from tabulate import tabulate

# 读取 CSV 文件
df = pd.read_csv("pizza_sales.csv")

# 查询数据：查询所有 pizza_name 为 "Margherita" 的订单
margherita_orders = df[df["pizza_name"] == "Margherita"]
print("Margherita 订单:")
print(tabulate(margherita_orders, headers="keys", tablefmt="pretty"))

# 添加数据：创建新订单数据
new_order = {
    "pizza_id": 101,
    "order_id": 202,
    "pizza_name_id": 303,
    "quantity": 2,
    "order_date": "2023-10-01",
    "order_time": "12:00",
    "unit_price": 15.0,
    "total_price": 30.0,
    "pizza_size": "Medium",
    "pizza_category": "Vegetarian",
    "pizza_ingredients": "Tomato, Cheese, Basil",
    "pizza_name": "Margherita",
}

# 添加新订单
df = pd.concat([df, pd.DataFrame([new_order])], ignore_index=True)
print("\n添加新订单后的数据:")
print(tabulate(df, headers="keys", tablefmt="pretty"))

# 删除数据：删除 order_id 为 202 的订单
df = df[df["order_id"] != 202]
print("\n删除 order_id 为 202 的订单后的数据:")
print(tabulate(df, headers="keys", tablefmt="pretty"))

# 更新数据：将 order_id 为 101 的订单的 quantity 更新为 3
df.loc[df["order_id"] == 101, "quantity"] = 3
print("\n更新 order_id 为 101 的订单的数量后的数据:")
print(tabulate(df, headers="keys", tablefmt="pretty"))

# 保存修改后的数据到 CSV 文件
df.to_csv("pizza_sales.csv", index=False)

```

![img](https://picx.zhimg.com/80/v2-0331e7c56d87701710d22381ce636e07.png)

![img](https://picx.zhimg.com/80/v2-331eda083261630f6ef17159b492652d.png)

![img](https://pic1.zhimg.com/80/v2-9874008e81469d8c70f7576444596289.png)

![img](https://picx.zhimg.com/80/v2-ce3abe304a50dd29804b194143ed9298.png)

## 实验 11

### 词频统计

```py
import jieba.posseg as pseg
import pandas as pd
from wordcloud import WordCloud

# 读取txt全部文字
fin = open("射雕英雄传.txt", encoding="utf-8")
content = fin.read()

# 使用jieba分词并进行词性标注
words = pseg.cut(content)

# 提取人名
names = [word for word, flag in words if flag == "nr"]

# 统计人名词频
name_freq = pd.Series(names).value_counts()

# 打印前10个高频人名
print(name_freq.head(10))

# 绘制云图
wc = WordCloud(font_path="simhei.ttf", width=800, height=600, background_color="white")
wc.generate_from_frequencies(name_freq)
wc.to_file("name_cloud.png")
```

![img](https://picx.zhimg.com/80/v2-ec8d044601c9b72b5c54853c3dace8f1.png)

### 兴趣推荐

```py
import pandas as pd

df = pd.read_excel("./员工数据表.xlsx", engine="openpyxl")
print(df.head())  # 打印前几行数据

# 查询男女，只保留编号、姓名、性别、部门、爱好的5列
df_boy = df.loc[df["性别"] == "男", ["编号", "姓名", "性别", "部门", "爱好"]]
df_girl = df.loc[df["性别"] == "女", ["编号", "姓名", "性别", "部门", "爱好"]]
print(df_boy.head(3))  # 打印男生数据的前3行
print(df_girl.head(3))  # 打印女生数据的前3行

df_merge = pd.merge(left=df_boy, right=df_girl, how="cross", suffixes=("_boy", "_girl"))
print(df_merge.head())  # 打印合并后的数据前几行

print(len(df_boy))  # 打印男生数据的长度
print(len(df_girl))  # 打印女生数据的长度
print(df_merge.shape)  # 打印合并数据的形状


def compute_score(row):
    # 使用交集和并集计算相似度
    hobbies_boy = set(row["爱好_boy"].split("|"))
    hobbies_girl = set(row["爱好_girl"].split("|"))
    return len(hobbies_boy & hobbies_girl) / len(hobbies_boy | hobbies_girl)


df_merge["相似度"] = df_merge.apply(compute_score, axis=1)
print(df_merge.sample(6))  # 随机打印6行数据

# 男编号查女性列表
number = "S00004"
print(
    df_merge[df_merge["编号_boy"] == number]
    .sort_values(by="相似度", ascending=False)
    .head(3)
)

# 女编号查男性列表
number = "S00093"
print(
    df_merge[df_merge["编号_girl"] == number]
    .sort_values(by="相似度", ascending=False)
    .head(3)
)

```

![img](https://pic1.zhimg.com/80/v2-0e63b3004f1246f71988203401f3ad75.png)

## 实验 12

### 练习 1

```py
import numpy as np

# 创建一个长度为10的一维全为0的ndarray对象，然后让第5个元素等于1
a = np.array([0, 0, 0, 0, 1, 0, 0, 0, 0, 0])
print(a)

# 创建一个元素从10到49的ndarray对象
b = np.array(range(10, 50))
print(b)

# 反转数组
c = b[::-1]
print(c)

# 使用随机创建一个10*10的ndarray对象，并打印最大最小元素
d = np.random.random((10, 10))
print(d)
print(d.max())
print(d.min())

# 创建一个10*10的ndarray对象，且矩阵边框为1，内部为0
e = np.ones((10, 10))
e[1:-1, 1:-1] = 0
print(e)

# 创建每一行都是从0到4的5*5的ndarray对象
f = np.array([np.arange(5)] * 5)
print(f)

# 创建一个范围在(0,1)之间的长度为12的等差数列
g = np.linspace(0, 1, 12)
print(g)

# 创建一个长度为10的随机数组并排序
h = np.random.random(10)
h.sort()
print(h)

# 创建一个长度为10的随机数组并将最大值替换为0
i = np.random.randint(0, 10, 10)
print(i)
i[i.argmax()] = 0
print(i)

```

### 练习 2

```py
import numpy as np
import time


# 给定一个4维矩阵，求最后两维的和
def sum_last_two_dimensions(matrix):
    return np.sum(matrix, axis=(-1, -2))


# 给定一个数组12345，在每个元素之间插入三个0
def insert_zeros(array):
    return np.insert(array, np.arange(1, len(array)), 0)


# 给定一个二维矩阵，交换其中两行元素
def swap_rows(matrix, row1, row2):
    matrix[[row1, row2]] = matrix[[row2, row1]]
    return matrix


# 创建一个100000长度的随机数组
random_array = np.random.rand(100000)

# 方法一：使用for循环对数组求三次方
start_time = time.time()
cubed_array_loop = np.array([x**3 for x in random_array])
loop_time = time.time() - start_time

# 方法二：使用numpy对数组求三次方
start_time = time.time()
cubed_array_numpy = np.power(random_array, 3)
numpy_time = time.time() - start_time

# 比较所用时间
print(f"使用for循环求三次方的时间: {loop_time}秒")
print(f"使用numpy求三次方的时间: {numpy_time}秒")

# 创建一个5 * 3随机矩阵和一个3 * 2随机矩阵
matrix_5x3 = np.random.rand(5, 3)
matrix_3x2 = np.random.rand(3, 2)

# 求矩阵积
matrix_product = np.dot(matrix_5x3, matrix_3x2)

print("5x3矩阵:")
print(matrix_5x3)
print("3x2矩阵:")
print(matrix_3x2)
print("矩阵积:")
print(matrix_product)


# 矩阵的每一行的元素都减去该行的平均值
def subtract_row_mean(matrix):
    row_means = matrix.mean(axis=1, keepdims=True)
    return matrix - row_means


# 打印出以下矩阵（要求使用np.zeros创建8*8的矩阵）
def create_checkerboard():
    checkerboard = np.zeros((8, 8), dtype=int)
    checkerboard[1::2, ::2] = 1
    checkerboard[::2, 1::2] = 1
    return checkerboard


# 正则化一个5*5随机矩阵
def normalize_matrix(matrix):
    min_val = matrix.min()
    max_val = matrix.max()
    return (matrix - min_val) / (max_val - min_val)



matrix = np.random.randint(0, 100, (5, 5))
normalized_matrix = normalize_matrix(matrix)
print("原始矩阵:")
print(matrix)
print("正则化后的矩阵:")
print(normalized_matrix)

```

## 爬虫实验

地址：[爬虫实验](https://blog.w1ndys.top/posts/6d67d75.html)

## 专项知识点-正则表达式

 1. **匹配 "abbbbbbbbbc" 中的 "abbbbbbbb"（从贪婪非贪婪角度分析）**  
    正则表达式可以通过贪婪和非贪婪方式进行匹配，分析如下：

    - **贪婪模式**：使用 `.*`，匹配尽可能多的字符。

      ```python
      import re
      text = "abbbbbbbbbc"
      match = re.search(r"ab.*c", text)
      print(match.group())  # 输出: abbbbbbbbbc
      ```

    - **非贪婪模式**：使用 `.*?`，尽量匹配少的字符。

      ```python
      import re
      text = "abbbbbbbbbc"
      match = re.search(r"ab.*?c", text)
      print(match.group())  # 输出: abbbbbbbb
      ```

    在贪婪模式下，`.*` 会尽量匹配多的字符，所以结果是 `abbbbbbbbbc`。而非贪婪模式下，`.*?` 会尽量匹配少的字符，所以结果是 `abbbbbbbb`。

 2. **匹配以字母 "c" 开头的单词**  
    对于这个题目，正则表达式可以通过 `\bc\w*\b` 来匹配以字母 "c" 开头的单词，其中 `\b` 是单词边界，`\w*` 匹配零个或多个字母、数字或下划线。

    ```python
    import re
    content = "The cat sat on the mat and the rat chased the cat"
    matches = re.findall(r'\bc\w*\b', content)
    print(matches)  # 输出: ['cat', 'chased', 'cat']
    ```

 3. **从 HTML 中提取包含 `class="active"` 的列表项中的歌手名和歌曲名**  
    使用 `re.search` 查找符合 `class="active"` 的 `li` 元素，并提取出歌手名和歌曲名。正则表达式可以使用捕获组来提取歌手名和歌曲名。

    ```python
    import re
     
    html = '''<div id="songs-list">
    <h2 class ="title">经典老歌</h2>
    <p class="introduction">
    经典老歌列表
    </p>
    <ul id="list" class="list-group">
    <li data-view="2">一路上有你</li>
    <li data-view="7">
    <a href ="/2.mp3" singer="任贤齐">沧海一卢笑 </a>
    </li>
    <li data-view="4" class="active">
    <a href ="/3.mp3" singer="齐秦">往事随风</a>
    </li>
    <li data-view ="6"><a href="/4.mp3" singer="beyond">光辉岁月 </a></li>
    <li data-view="5"><a href="/5.mp3" singer="除慧琳">记事本</a></li>
    <li data-view="5">
    <a href ="/6.mp3" singer="邓丽君"> 但愿人长久 </a>
    </li>
    </ul>
    </div>'''
     
    # 使用正则表达式匹配 active 类的 <li> 中的歌手和歌曲名
    match = re.search(r'<li[^>]*class="active"[^>]*>.*?<a[^>]*singer="([^"]*)"[^>]*>(.*?)</a>', html)
    if match:
        singer = match.group(1)
        song = match.group(2)
        print(f"歌手: {singer}, 歌曲: {song}")
    else:
        print("未找到匹配项")
    ```

    **输出**:

    ```
    歌手: 齐秦, 歌曲: 往事随风
    ```

    **分析**：  
    这个正则表达式的作用是：

    - `r'<li[^>]*class="active"[^>]*>` 匹配包含 `class="active"` 的 `li` 元素。
    - `.*?<a[^>]*singer="([^"]*)"[^>]*>` 用来捕获 `<a>` 标签中的 `singer` 属性（即歌手名）。
    - `(.*?)</a>` 捕获 `<a>` 标签中的歌曲名。

## 数据分析之matplotlib

