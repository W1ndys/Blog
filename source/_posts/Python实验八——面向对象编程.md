---
title: Python实验八——面向对象编程
tags:
  - Python
categories:
  - Python
cover: 'https://python123.io/images/78/f5/5cd8b22e4c4bbabc81e6946002d8.png'
abbrlink: 44cb2a
date: 2024-11-20 08:07:21
---

## 创建类计算数学

```py
import math


class MyMath:
    def __init__(self, radius):
        self.radius = radius

    def circle_perimeter(self):
        # 计算圆的周长
        return round(2 * math.pi * self.radius, 2)

    def circle_area(self):
        # 计算圆的面积
        return round(math.pi * self.radius**2, 2)

    def sphere_surface_area(self):
        # 计算球的表面积
        return round(4 * math.pi * self.radius**2, 2)

    def sphere_volume(self):
        # 计算球的体积
        return round((4 / 3) * math.pi * self.radius**3, 2)


# 测试代码
radius = int(input("请输入半径："))
mymath = MyMath(radius)
print("圆的周长:", mymath.circle_perimeter())
print("圆的面积:", mymath.circle_area())
print("球的表面积:", mymath.sphere_surface_area())
print("球的体积:", mymath.sphere_volume())

```

#### 解释：

- **类定义**：`class MyMath:` 定义了一个名为 `MyMath` 的类，表示几何计算的数学工具。

- **初始化方法 `__init__`**：

  - 接收一个参数 `radius`（半径）。
  - 使用 `self.radius = radius` 将传入的 `radius` 参数绑定到实例属性 `radius` 上，供后续方法调用。
  - 这样，每个 `MyMath` 对象都可以基于特定的半径进行计算。

#### 使用示例：

```py
circle = MyMath(radius=5)  # 创建一个半径为 5 的实例
```

![img](https://pic1.zhimg.com/80/v2-eae906061079076f1cddba1f1330215b.png)

## 摄氏温度华氏温度转换

```py
class Temperature:
    def __init__(self, temperature):
        self.temperature = temperature

    def ToFahrenheit(self):
        return round((self.temperature * 1.8) + 32, 2)

    def ToCelsius(self):
        return round((self.temperature - 32) / 1.8, 2)


# 输入摄氏温度并转换为华氏温度
celsius = int(input("请输入摄氏温度："))
temperature = Temperature(celsius)
print(f"摄氏温度 = {celsius}，华氏温度 = {temperature.ToFahrenheit()}")

# 输入华氏温度并转换为摄氏温度
fahrenheit = int(input("请输入华氏温度："))
temperature = Temperature(fahrenheit)
print(f"华氏温度 = {fahrenheit}，摄氏温度 = {temperature.ToCelsius()}")
```

不多解释了，和上面一样。

![img](https://picx.zhimg.com/80/v2-e115c40defe4d7b00335ad2bedd6e63e.png)
