---
title: Python中的re.sub() 函数详解
date: 2024-01-01 12:00:00
tags: [Python, 正则表达式]
categories: [编程]
---

`re.sub()` 函数是 Python 的 `re` 模块中用于替换字符串的函数。它功能强大，可以实现各种复杂的文本处理需求。

## 语法

``` python
re.sub(pattern, repl, string, count = 0, flags = 0)
```

## 参数

*   `pattern`: 需要被替换的正则表达式模式。
*   `repl`: 替换字符串或一个函数。
*   `string`: 需要进行替换操作的原始字符串。
*   `count` (可选): 指定最大替换次数，默认为 0，表示替换所有匹配。
*   `flags` (可选): 用于控制正则表达式的匹配方式，例如是否忽略大小写等。

## 返回值

替换后的新字符串。

## 使用示例

### 1. 使用字符串进行替换

``` python
import re

text = "The price is 123 dollars and 45 cents."
new_text = re.sub(r'\d+', 'NUM', text)
print(new_text)  # 输出: The price is NUM dollars and NUM cents.
```

### 2. 使用函数进行替换

``` python
import re

text = "this is a test sentence."

def capitalize(match):
    return match.group(0).capitalize()

new_text = re.sub(r'\b\w+\b', capitalize, text)
print(new_text)  # 输出: This Is A Test Sentence.
```

### 3. 使用捕获组进行替换

``` python
import re

text = "Contact me at 123-456-7890 or 987-654-3210."
formatted_text = re.sub(r'(\d{3})-(\d{3})-(\d{4})', r'(\1) \2-\3', text)
print(formatted_text)  # 输出: Contact me at (123) 456-7890 or (987) 654-3210.
```
### 4. 结合 flags 使用
``` python
import re

text = "Baked Beans And Spam"
new_text = re.sub(r'\sAND\s', ' & ', text, flags = re.IGNORECASE)
print(new_text)
```
