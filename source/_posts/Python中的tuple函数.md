---
title: Python中的tuple函数
tags:
  - Python
categories:
  - Python
  - 语法
abbrlink: 249dac9b
date: 2024-02-18 21:33:42
---

# Python中的tuple函数

在Python中，`tuple()` 函数是一个内置函数，用于将序列或可迭代对象转换为元组。它的语法是：

```python
tuple(iterable)
```

其中 `iterable` 可以是一个序列（如列表或字符串）或者任何可迭代对象（如另一个元组）。`tuple()` 函数会将提供的可迭代对象中的元素按照其顺序转换为一个新的元组。

以下是一些示例说明 `tuple()` 函数的使用：

```python
# 将列表转换为元组
list1 = [1, 2, 3, 4, 5]
tuple1 = tuple(list1)
print(tuple1)  # 输出: (1, 2, 3, 4, 5)

# 将字符串转换为元组
string = "hello"
tuple2 = tuple(string)
print(tuple2)  # 输出: ('h', 'e', 'l', 'l', 'o')

# 将另一个元组转换为元组（实际上是创建了一个新的元组）
tuple3 = tuple((7, 8, 9))
print(tuple3)  # 输出: (7, 8, 9)
```

`tuple()` 函数的作用是不可变序列的创建。元组是一种不可变的数据结构，一旦创建就无法修改。因此，当你需要一个不可变的数据结构来存储一组元素时，可以使用元组，并且 `tuple()` 函数提供了一种方便的方法来创建元组。
