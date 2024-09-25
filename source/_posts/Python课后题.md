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

## 作业 3

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

## 作业 4

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
