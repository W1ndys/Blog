---
title: "Python中的defaultdict库"
tags: [Python]
categories: [Python]
date: 2025-05-24 21:33:30
---

`defaultdict` 是 Python 标准库 `collections` 模块中的一个类，它是内置 `dict` 类型的子类，提供了一种在字典中处理缺失键的便捷方式。

## 基本概念

`defaultdict` 与普通字典(`dict`)的主要区别在于：当你尝试访问一个不存在的键时，它会自动创建这个键并用一个默认值初始化，而不是像普通字典那样抛出 `KeyError` 异常。

## 基本用法

```python
from collections import defaultdict
```

### 初始化

`defaultdict` 需要一个可调用对象作为参数，这个可调用对象会在需要时提供默认值：

```python
dd = defaultdict(int)  # 默认值为0
dd = defaultdict(list)  # 默认值为空列表[]
dd = defaultdict(set)   # 默认值为空集合set()
dd = defaultdict(str)   # 默认值为空字符串""
```

### 示例

**示例 1：统计单词出现次数**

```python
from collections import defaultdict

word_counts = defaultdict(int)
for word in ['apple', 'banana', 'apple', 'orange']:
    word_counts[word] += 1

print(word_counts)
# 输出: defaultdict(<class 'int'>, {'apple': 2, 'banana': 1, 'orange': 1})
```

**示例 2：创建字母到单词的映射**

```python
from collections import defaultdict

words_by_letter = defaultdict(list)
words = ['apple', 'banana', 'orange', 'pear']
for word in words:
    first_letter = word[0]
    words_by_letter[first_letter].append(word)

print(words_by_letter)
# 输出: defaultdict(<class 'list'>, {'a': ['apple'], 'b': ['banana'], 'o': ['orange'], 'p': ['pear']})
```

## 自定义默认值工厂

你可以使用任何可调用对象作为默认值工厂，包括 lambda 函数：

```python
dd = defaultdict(lambda: 'unknown')
dd['name'] = 'Alice'
print(dd['name'])  # 输出: Alice
print(dd['age'])   # 输出: unknown
```

## 与普通字典的区别

1. **处理缺失键**：

   - `dict`：访问不存在的键会引发 `KeyError`
   - `defaultdict`：自动创建键并赋予默认值

2. **初始化**：
   - `dict`：不需要初始化函数
   - `defaultdict`：必须提供默认值工厂函数

## 注意事项

1. 使用 `defaultdict` 时，`KeyError` 异常会被静默处理，这有时可能掩盖程序中的逻辑问题
2. 当需要检查键是否存在时，`defaultdict` 的行为可能与预期不同
3. 序列化时，`defaultdict` 的默认工厂函数不会被保存

## 实际应用场景

1. 计数和聚合操作
2. 构建多值字典（一个键对应多个值）
3. 图算法中的邻接表表示
4. 需要避免频繁检查键是否存在的场景

`defaultdict` 是 Python 中一个非常有用的工具，可以简化许多涉及字典的常见编程模式，使代码更加简洁和高效。
