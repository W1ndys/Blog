---
title: Python中的map函数
tags:
  - Python
categories:
  - Python
  - 语法
abbrlink: 6bbcb18e
date: 2024-02-18 21:30:11
---

# Python中的map函数

`map()` 函数是Python中的一个内置函数，用于对可迭代对象（比如列表、元组等）中的每个元素应用一个指定的函数，然后返回一个包含所有函数返回值的迭代器。它的一般语法是：

```python
map(function, iterable, ...)
```

其中：
- `function` 是一个函数，用于对 `iterable` 中的每个元素进行操作。它可以是内置的函数，也可以是自定义的函数。
- `iterable` 是一个或多个可迭代对象，例如列表、元组等。如果提供了多个可迭代对象，`map()` 函数会以并行的方式对它们进行操作，即将每个可迭代对象中对应位置的元素作为参数传递给 `function`。
- `map()` 函数会返回一个迭代器，其中包含了 `function` 对 `iterable` 中每个元素执行操作后的结果。

下面是一个简单的例子，演示了如何使用 `map()` 函数计算列表中每个数字的平方：

```python
numbers = [1, 2, 3, 4, 5]

# 定义一个函数，用于计算平方
def square(x):
    return x ** 2

# 使用 map() 函数计算平方
squared_numbers = map(square, numbers)

# 将迭代器转换为列表并打印结果
print(list(squared_numbers))  # 输出: [1, 4, 9, 16, 25]
```

在这个例子中，`map(square, numbers)` 将 `numbers` 列表中的每个元素都传递给 `square()` 函数进行计算，最终返回一个迭代器，其中包含了每个元素的平方值。
