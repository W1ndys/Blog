---
title: "Python实验报告——13周习题课"
tags: [Python]
categories: [Python]
date: 2024-11-21 17:33:13
cover: >-
  https://th.bing.com/th/id/OIP.dJToM1TiZiJA0GYwzDHwjQHaHY?w=179&h=180&c=7&r=0&o=5&pid=1.7
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
