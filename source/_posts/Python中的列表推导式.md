---
title: Python中的列表推导式
tags:
  - Python
categories:
  - Python
  - 语法
abbrlink: b46ab514
date: 2024-02-29 20:43:41
cover: https://tse3-mm.cn.bing.net/th/id/OIP-C.maHs8WCcxDYl90idsxeXGgHaDt?rs=1&pid=ImgDetMain
---

# Python 中的列表推导式

列表推导式是一种用来简洁地创建列表的方法，在 Python 中有几种写法。以下是常见的列表推导式写法：

1. **基本形式：**

   基本形式的列表推导式由一个表达式和一个可迭代对象组成。对于可迭代对象中的每个元素，表达式都会被应用，并将结果添加到新列表中。

   **例子：**

   ```python
   # 将列表中的每个元素加1生成新的列表
   original_list = [1, 2, 3, 4, 5]
   new_list = [x + 1 for x in original_list]
   print(new_list)  # 输出: [2, 3, 4, 5, 6]
   ```

2. **带有条件判断的形式：**

   带有条件判断的列表推导式在基本形式的基础上添加了一个条件表达式。只有当条件为真时，才会应用表达式并将结果添加到新列表中。

   **例子：**

   ```python
   # 将列表中大于3的元素加1生成新的列表
   original_list = [1, 2, 3, 4, 5]
   new_list = [x + 1 for x in original_list if x > 3]
   print(new_list)  # 输出: [5, 6]
   ```

3. **多重循环的形式：**

   多重循环的列表推导式包含多个 `for` 子句，用于迭代多个可迭代对象的元素，并生成新列表。

   **例子：**

   ```python
   # 生成两个列表的笛卡尔积
   list1 = ['a', 'b']
   list2 = [1, 2]
   cartesian_product = [(x, y) for x in list1 for y in list2]
   print(cartesian_product)  # 输出: [('a', 1), ('a', 2), ('b', 1), ('b', 2)]
   ```

4. **带有条件判断和多重循环的形式：**

   在多重循环的基础上，带有条件判断的列表推导式可以在每个循环中添加条件表达式，以过滤元素。

   **例子：**

   ```python
   # 生成列表中每个元素的平方，但只保留偶数的平方
   original_list = [1, 2, 3, 4, 5]
   new_list = [x ** 2 for x in original_list if x % 2 == 0]
   print(new_list)  # 输出: [4, 16]
   ```

5. **嵌套列表推导式：**

   嵌套列表推导式允许在一个列表推导式中嵌套另一个列表推导式，用于生成嵌套列表。

   **例子：**

   ```python
   # 生成一个包含两个子列表的嵌套列表
   outer_list = [[1, 2, 3], [4, 5, 6]]
   flattened_list = [x for sublist in outer_list for x in sublist]
   print(flattened_list)  # 输出: [1, 2, 3, 4, 5, 6]
   ```

