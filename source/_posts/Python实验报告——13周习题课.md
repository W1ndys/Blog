---
title: Python实验报告——13周习题课
tags:
  - Python
categories:
  - Python
abbrlink: 5060bab6
date: 2024-11-21 17:33:13
---

## 第一题，计算圆和矩形

```py
import math
import turtle


class Dimension:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def area(self):
        pass

    def draw(self):
        pass


class Circle(Dimension):
    def __init__(self, x, y, radius):
        super().__init__(x, y)
        self.radius = radius

    def area(self):
        return math.pi * self.radius**2

    def draw(self):
        pass  # 不需要画圆


class Rectangle(Dimension):
    def __init__(self, x, y, length, width):
        super().__init__(x, y)
        self.length = length
        self.width = width

    def area(self):
        return self.length * self.width

    def draw(self):
        turtle.penup()
        turtle.goto(self.x - self.length / 2, self.y - self.width / 2)
        turtle.pendown()
        for _ in range(2):
            turtle.forward(self.length)
            turtle.left(90)
            turtle.forward(self.width)
            turtle.left(90)


# 测试代码
circle = Circle(0, 0, 50)
print(f"圆的半径为{circle.radius}圆的面积为{circle.area()}")

rectangle = Rectangle(0, 0, 60, 40)
print(f"矩形的长为{rectangle.length}，宽为{rectangle.width}，面积为{rectangle.area()}")

# 绘制矩形
turtle.speed(1)
rectangle.draw()
turtle.done()
```

## 第二题，Student 学生类

```py
class Student:
    # 类变量，用于存储下一个可用的 id
    _next_id = 1001

    def __init__(self, name, score):
        self.id = None  # id 在 prod_id 方法中分配
        self.name = name
        self.score = score

    def prod_id(self):
        # 分配 id 并自增
        self.id = Student._next_id
        Student._next_id += 1

    def __add__(self, other):
        # 重载 + 运算符，返回两个学生成绩的和
        if isinstance(other, Student):
            return self.score + other.score
        return NotImplemented


# 测试代码
p1 = Student("张三", 67)
p1.prod_id()
print("{0}的id号{1}".format(p1.name, p1.id))

p2 = Student("李四", 78)
p2.prod_id()
print("{0}的id号{1}".format(p2.name, p2.id))

print("{0}和{1}的成绩总和为：{2}".format(p1.name, p2.name, p1 + p2))

p3 = Student("王五", 89)
p3.prod_id()
print("王五的id号", p3.id)
```

## 第三题，模拟猜数游戏

```py
import random

# 生成1到10之间的随机数
target_number = random.randint(1, 10)

# 最大尝试次数
max_attempts = 3

for attempt in range(1, max_attempts + 1):
    try:
        # 提示用户输入
        guess = int(input(f"第{attempt}次输入\n输入一个数: "))

        # 判断用户输入
        if guess < 1 or guess > 10:
            print("Must input an integer between 1 and 10")
        elif guess > target_number:
            print("Too big")
        elif guess < target_number:
            print("Too small")
        else:
            print("Congratulations!")
            print(f"The value is {target_number}")
            break
    except ValueError:
        print("Must input an integer between 1 and 10")
else:
    print("Game over")
    print(f"The correct number was {target_number}")
```

## 第四题第五题，自定义一个异常类

```py
class AgeError(Exception):
    def __init__(self, age):
        self.age = age

    def __str__(self):
        return f"{self.age}, 年龄错误！应该在 18-60 之间"


def check_age():
    age = int(input("输入一个年龄:"))
    if age < 18 or age > 60:
        raise AgeError(age)
    else:
        print("正常的年龄：", age)


try:
    check_age()
except AgeError as e:
    print(e)
```

## 第六题，补全程序

```py
class NumberError(Exception):
    def __init__(self, data):
        Exception.__init__(self, data)
        self.data = data  # 【1】将传入的数据保存到实例变量中

    def __str__(self):  # 重载__str__方法
        return f"NumberError: 非法数值 {self.data}"  # 【2】返回错误提示信息


def total(data):
    total = 0
    for i in data:
        if i < 0:
            raise NumberError(i)  # 【3】抛出自定义异常
        total += i  # 【4】累加合法的数值
    return total


# 测试代码
for i in range(3):
    try:
        data = list(map(int, input("输入整数用逗号隔开: ").split(",")))
        print("总计=", total(data))  # 【5】调用total函数计算和
    except NumberError as e:  # 【6】捕获自定义异常
        print(e)
```

## 实验总结

1. Python 异常处理 try except else 的执行流程：

   - try 块：包含可能产生异常的代码
   - except 块：当 try 块中发生异常时执行，可以捕获特定类型的异常
   - else 块：当 try 块中没有发生异常时执行
   - finally 块：无论是否发生异常都会执行的代码块

   执行顺序：

   - 正常情况：try → else → finally
   - 异常情况：try → except → finally

2. 自定义异常如何抛出：

   - 通过创建继承自 Exception 类的自定义类来定义异常
   - 使用 raise 关键字抛出异常
   - 示例：

     ```python
     class MyError(Exception):
         pass

     raise MyError("这是一个自定义错误")
     ```

3. 实验中的问题总结：
   - 异常处理可以让程序更加健壮，避免因异常而崩溃
   - 合理使用 try-except 可以优雅地处理错误情况
   - 自定义异常可以更好地表达程序特定的错误情况
   - 注意捕获具体的异常类型，避免使用过于宽泛的 except 语句
