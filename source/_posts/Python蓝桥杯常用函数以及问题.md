---
title: Python蓝桥杯常用函数以及问题
tags:
  - Python
  - 蓝桥
categories:
  - Python
  - 蓝桥
abbrlink: 7bb4fcd
date: 2024-02-17 18:37:18
---

> 摘自 <https://blog.csdn.net/m0_46204224/article/details/109049999#/>

## Python 常用函数

### input 函数

#### 单行输入

```python
data = list(map(int,input().split()))
#输入不定量的以空格分隔的连续输入
```

```python
m,n = map(int,intput().split())
#输入定量的以空格分隔的连续输入
```

注意：若间隔号不是空格，而是其他符号，只需要在 split(“”)中定义间隔号即可，例如

```python
data = list(map(int,input().split("-")))
m,n = map(int,intput().split("-"))
#用-分割
```

#### 多行输入

一个 input 输入一个数字，列表，每次每行只能输入一个数字

```python
data1 = [int(input()) for _ in range(2)]
# 一个 input 输入一个数字，列表，每次每行只能输入一个数字
print(data1)
# [1,2]
```

一个 input 输入一串数字，列表的列表

```python
data2 = [list(map(int, input().split())) for _ in range(2)]
# 一个 input 输入一串数字，列表的列表
print(data2)
# [[1], [15]]
```

有选择的保存数据

```python
list3 = []
list4 = []
for i in range(2):
    m, n = map(int, input().split())
    if m > 0:
        list3.append(m)
    else:
        list4.append(n)
print(list3)
print(list4)
# 有选择的保存数据
# 这段代码的作用是从用户输入中获取两组数字对，并根据每对数字的第一个数字是正数还是非正数（包括负数和零），将其分别存储到两个不同的列表中。最后，打印出这两个列表中的内容。
```

#### 各种输入

- `input()` 返回的是字符串类型 `(str)`
- 一次输入多个值就用 `list(input().split())`
- 根据需求加 `map`，即 `map(int,input.split())`
- 每出现一个 `input()` 就代表了一行，加了 `map` 就代表是变量多接受输入

例如：

```python
a = input()  # 接受一个值
a, b = input().split()  # 接受两个值，空格输入，回车执行
c = input().split()  # 输入为列表
```

- 举例合集

```python
m = int(input())  # 输入一个数字

m, n = map(int, input().split())  # 输入两个数字

a, b = map(int, input().split("#"))  # 连续输入，井号间隔

str1 = list(map(int, input().split()))  # 一行输入无限多的整型数据，用 list 存储

data3 = [int(input()) for _ in range(10)]  # 多行 input 输入，存放在一个列表中

data4 = [
    list(map(int, input().split())) for i in range(2)
]  # 相同的思想生成列表，存储为列表的列表

data5 = [tuple(map(int, input().split())) for i in range(2)]
# 列表推导式

for i in range(5):
    x = input()
    # 连续输入
    
arr = input().split()  # 这里存储的是字符串型的列表
arr = list(map(int, input().split()))  # 这里存储的是整型的列表

a = 2.345
a = str(a)
print(float(a[0:4]) + 1)  # 通过变成 str，不 4 舍 5 入，再 float 成数值
print("%.2f" % (float(a)))  # %.2f 直接 4 舍 5 入
```

- 记录一下没见过的 [tuple](/posts/249dac9b) 函数的语法解释（元组）

- 记录一下 [map](/posts/6bbcb18e) 函数的语法解释（迭代器）

- 记录一下 [Python 中的列表推导式](/posts/b46ab514#/)

### 占位符

#### %占位符详解

占位符主要用于填充格式问题，通过加入格式化字符串来控制输出的格式。在 Python 中，常见的占位符及其使用方式如下：

- `%s`: 字符串的占位符，可以使用 `%s` 或者 `{}` 进行替换。例如：`'{:s}'.format('hello')`。
- `%d`: 整数的占位符，可以使用 `%d` 或者 `{}` 进行替换。例如：`'{:d}'.format(10)`。
- `%.2f`: 浮点数的占位符，控制保留小数点后两位，四舍五入。例如：`'{:.2f}'.format(3.14159)`。
- `%.2e`: 科学计数法的浮点数占位符，控制保留小数点后两位，以科学计数法表示。例如：`'{:.2e}'.format(1000)`。
- `%`：百分号占位符，用于在字符串中表示百分比。例如：`'{}%'.format(50)`。

常见用法示例：

```python
print('{} {}'.format('Hello', 'World'))  # 输出：Hello World
print('The value is %d' % 42)  # 输出：The value is 42
print('The value is {:.2f}'.format(3.14159))  # 输出：The value is 3.14
```

填充格式问题：

- `{:#x}`: 控制输出十六进制格式，`#` 表示保留进制前缀。例如：`'{:#x}'.format(18)` 输出 `'0x12'`。
- `{:0>5}`: 控制填充格式，在数字前填充指定字符，总长度为 5。例如：`'{:0>5}'.format('33')` 输出 `'00033'`。

总的来说，`format()` 方法可以将数值按照指定的格式进行格式化输出，其中格式化的方式由参数决定，常见的参数包括 `b`（二进制）、`x`（十六进制）、`o`（八进制）等。

#### 关于 format 函数

`format()` 方法可以完全代替 `%` 格式化。实际上，Python 官方已经推荐使用 `format()` 方法进行字符串格式化，因为它提供了更多的功能和选项，并且更加灵活。`format()` 方法可以在格式化字符串中指定参数的顺序、精度、对齐方式等，而 `%` 格式化相对来说功能较为简单。

另外，从 Python 3.6 版本开始，引入了 f-string，它提供了一种更加简洁、直观的字符串格式化语法，更推荐在新的 Python 项目中使用。但是，即使使用 f-string，`format()` 方法仍然是一个非常有用的备选方法，特别是对于需要动态生成格式的情况。

当使用 `format()` 方法时，可以按照需要定义格式，并在字符串中插入对应的值。下面是一些示例：

1. **基本用法**：
```python
name = "Alice"
age = 30
print("My name is {}, and I am {} years old.".format(name, age))
# 输出: My name is Alice, and I am 30 years old.
```

2. **指定参数顺序**：
```python
print("{1} is {0} years old.".format(age, name))
# 输出: Alice is 30 years old.
```

3. **指定精度**：
```python
pi = 3.14159265359
print("The value of pi is {:.2f}".format(pi))
# 输出: The value of pi is 3.14
```

4. **对齐方式**：
```python
word = "hello"
print("'{:>10}'".format(word))  # 右对齐
print("'{:<10}'".format(word))  # 左对齐
print("'{:^10}'".format(word))  # 居中对齐
# 输出: '     hello'
# 输出: 'hello     '
# 输出: '  hello   '
```

5. **使用命名参数**：
```python
print("My name is {name}, and I am {age} years old.".format(name="Bob", age=25))
# 输出: My name is Bob, and I am 25 years old.
```

6. **格式化数字**：
```python
num = 12345
print("The number is {:,}".format(num))  # 千位分隔符
print("The number is {:b}".format(num))  # 二进制
# 输出: The number is 12,345
# 输出: The number is 11000000111001
```

7. **进制转换**：

`format()` 函数可以用于进制转换，通过指定格式来将整数以不同进制的形式进行输出。下面是关于进制转换的一些知识点：

1. **基本用法**：
   使用 `format()` 函数，可以将整数按照指定的进制进行格式化输出。例如：
   ```python
   num = 18
   print("二进制：{:b}".format(num))  # 输出：二进制：10010
   print("八进制：{:o}".format(num))  # 输出：八进制：22
   print("十六进制：{:x}".format(num))  # 输出：十六进制：12
   ```

2. **保留进制前缀**：
   使用 `#` 标志可以保留进制前缀，例如 `#b` 表示二进制、`#o` 表示八进制、`#x` 表示十六进制。例如：
   ```python
   num = 18
   print("二进制（带前缀）：{:#b}".format(num))  # 输出：二进制（带前缀）：0b10010
   print("八进制（带前缀）：{:#o}".format(num))  # 输出：八进制（带前缀）：0o22
   print("十六进制（带前缀）：{:#x}".format(num))  # 输出：十六进制（带前缀）：0x12
   ```

3. **指定位数**：
   可以使用填充符和指定位数来控制输出的位数，例如：
   
   ```python
   num = 18
   print("十六进制（固定位数）：{:06x}".format(num))  # 输出：十六进制（固定位数）：000012
   ```
   
4. **整数转换为不同进制的字符串**：
   如果只是想将整数转换为不同进制的字符串，也可以使用 `format()` 函数，但是在这种情况下，可以直接使用整数对象的进制转换方法，例如 `bin()`、`oct()`、`hex()`：
   ```python
   num = 18
   binary_str = bin(num)
   octal_str = oct(num)
   hexadecimal_str = hex(num)
   print("二进制字符串：", binary_str)  # 输出：二进制字符串： 0b10010
   print("八进制字符串：", octal_str)  # 输出：八进制字符串： 0o22
   print("十六进制字符串：", hexadecimal_str)  # 输出：十六进制字符串： 0x12
   ```

### str 类型的内建函数

1. **大小写转换**：
   - `S.lower()`: 将字符串 S 中的所有字符转换为小写。
   - `S.upper()`: 将字符串 S 中的所有字符转换为大写。
   - `S.swapcase()`: 将字符串 S 中的大小写互换。
   - `S.capitalize()`: 将字符串 S 中的首字母转换为大写，其他字母转换为小写。
   - `s.title()`: 将字符串 s 中每个单词的首字母转换为大写。

   ```python
   s = "hello world"
   print(s.lower())  # 输出: hello world
   print(s.upper())  # 输出: HELLO WORLD
   print(s.swapcase())  # 输出: HELLO WORLD
   print(s.capitalize())  # 输出: Hello world
   print(s.title())  # 输出: Hello World
   ```

2. **查找和替换**：
   - `S.find(sub, start, end)`: 返回字符串 S 中子字符串 sub 第一次出现的索引，可指定搜索范围。
   - `S.rfind(sub, start, end)`: 返回字符串 S 中子字符串 sub 最后一次出现的索引。
   - `S.count(sub, start, end)`: 返回字符串 S 中子字符串 sub 出现的次数。
   - `S.replace(old, new, count)`: 将字符串 S 中的 old 子字符串替换为 new，可以指定替换次数。

   ```python
   s = "I love Python. Python is great."
   print(s.find("Python"))  # 输出: 2
   print(s.rfind("Python"))  # 输出: 14
   print(s.count("Python"))  # 输出: 2
   print(s.replace("Python", "Java"))  # 输出: I love Java. Java is great.
   ```

3. **去除空白字符**：
   - `S.strip(chars)`: 移除字符串 S 中指定的字符，默认移除空格。

   ```python
   s = "  hello  "
   print(s.strip())  # 输出: hello
   ```

4. **分割和连接**：
   - `S.split(sep, maxsplit)`: 使用分隔符 sep 将字符串 S 分割成一个列表，maxsplit 指定分割次数。
   - `S.join(iterable)`: 将可迭代对象中的字符串连接起来，以字符串 S 作为连接符。

   ```python
   s = "hello-world"
   print(s.split("-"))  # 输出: ['hello', 'world']
   
   a = '-'
   b = ['hello', 'world']
   print(a.join(b))  # 输出: hello-world
   ```

### 打印

**Print()**

```python
for i in range(10):
    print(i,end='')#打印在一行
    print(i,end='\n')#换行符结尾
```

### 切片语法

1. **切片语法**：`a[起点:终点:步长]`。它允许你从列表或字符串中获取一个子集，并且可以指定步长。

```python
从列表中获取索引为 1 到索引为 3（不包括 3）的子集，步长为 1
a = [0, 1, 2, 3, 4, 5]
print(a[1:3])  # 输出: [1, 2]

# 从字符串中获取索引为 1 到索引为 4（不包括 4）的子集，步长为 1
s = "abcdef"
print(s[1:4])  # 输出: "bcd"
```

2. **切片对象**：切片对象可以应用于列表和字符串，但不能应用于整数。例如，`a = 5`, `a[1:3]` 是无效的，但可以通过 `a = [5]` 来创建一个列表，然后进行切片操作。

```python
列表切片
a = [0, 1, 2, 3, 4, 5]
slice_obj = slice(1, 4)
print(a[slice_obj])  # 输出: [1, 2, 3]

# 字符串切片
s = "abcdef"
slice_obj = slice(1, 4)
print(s[slice_obj])  # 输出: "bcd"
```

在这里 `slice` 是 Python 内置函数，用于创建一个切片对象，该对象可以被应用于可切片对象（比如列表、字符串等）的索引或切片操作中。它接受三个参数：起点、终点和步长，用来指定切片的范围和步长。

3. **起点和终点**：切片包含起点，但不包含终点。即，`a[1:3]` 将会包含索引为 1 和 2 的元素，但不包含索引为 3 的元素。

```python
a = [0, 1, 2, 3, 4, 5]
# 从索引为 1 到索引为 4（不包括 4）的子集，步长为 1
print(a[1:4])  # 输出: [1, 2, 3]

# 从索引为 2 到索引为 5（不包括 5）的子集，步长为 1
print(a[2:5])  # 输出: [2, 3, 4]
```

4. **步长的默认值**：当未指定步长时，默认为 1。如果步长为负数，则从右向左提取元素。

```python
a = [0, 1, 2, 3, 4, 5]
# 从索引为 0 到索引为 4（不包括 4）的子集，默认步长为 1
print(a[:4])  # 输出: [0, 1, 2, 3]

# 从索引为 2 到列表末尾的子集，默认步长为 1
print(a[2:])  # 输出: [2, 3, 4, 5]
```

5. **负数索引**：负数索引表示从右往左的偏移量。例如，`a[-1]` 表示最后一个元素。

```python
a = [0, 1, 2, 3, 4, 5]
# 从倒数第二个元素到列表末尾的子集，默认步长为 1
print(a[-2:])  # 输出: [4, 5]

# 从倒数第四个元素到倒数第二个元素的子集，默认步长为 1
print(a[-4:-2])  # 输出: [2, 3]
```

### 数字运算

这些知识点主要涉及数字运算，包括取余运算、整除运算以及数字的逆序输出。以下是这些知识点的总结：

1. **取余运算**（%）：取一个数除以另一个数的余数，这里后面跟着的数字是 10，所以结果都在 0 到 9 之间。
   - 例如：a % 10 取得 a 的个位数。

2. **整除运算**（//）：取一个数除以另一个数的整数部分，相当于向下取整。
   - 例如：a // 10 取得 a 的除了个位的其他位组成的数。

3. **逆序输出**：给定一个整数，以逆序输出各个位上的数字。
   - 例如：对于数字 25165，逆序输出为 5, 6, 1, 5, 2。

根据上述知识点，代码执行如下：

- 对于输入的数字 32345：
  - 个位：32345 % 10 = 5
  - 十位：32345 // 10 % 10 = 4
  - 百位：32345 // 100 % 10 = 3
  - 千位：32345 // 1000 % 10 = 2
  - 万位：32345 // 10000 = 3
  - 所以，逆序输出为 5, 4, 3, 2, 3

- 对于输入的数字 25165：
  - 个位：25165 % 10 = 5
  - 十位：25165 // 10 % 10 = 6
  - 百位：25165 // 100 % 10 = 1
  - 千位：25165 // 1000 % 10 = 5
  - 万位：25165 // 10000 = 2
  - 所以，逆序输出为 5, 6, 1, 5, 2

下面是逆序的一个例子

```python
输入数字
number = 32345

# 计算并逆序输出每一位数字
reverse_digits = []
while number > 0:
    digit = number % 10  # 取个位数字
    reverse_digits.append(digit)
    number //= 10  # 去除个位数字

print("逆序输出每位数字:", reverse_digits)

# 使用逆序的方式输出每位数字
for digit in reversed(reverse_digits):
    print(digit, end=" ")
```

输出结果：
```
逆序输出每位数字: [5, 4, 3, 2, 3]
5 4 3 2 3 
```

同样，这个示例也适用于其他数字，只需将 `number` 变量的值更改为所需的数字即可。

### 二维列表操作

#### 创建二维列表
```python
a = [[1, 2, 3], [3, 4, 5]]
```

#### 列表拼接
```python
lista = [1, 2, 3]
listb = [4, 5, 6]
result = lista + listb
```

#### 列表扩展
```python
lista = [1, 2, 3]
lista.extend([4, 5, 6])
```

#### 插入元素
```python
lista = [1, 2, 3]
lista.insert(1, 'x')
```

#### 移除元素
```python
lista = [1, 2, 3, 4, 5]
lista.remove(3)
```

#### 查找元素索引
```python
lista = [1, 2, 3, 4, 5]
index = lista.index(3)
```

#### 字符串转换为列表
```python
string = "hello"
lst = list(string)
```

#### 使用 zip 遍历多个列表
```python
a = [1, 2, 3]
b = [4, 5, 6]
c = [7, 8, 9]

for x, y, z in zip(a, b, c):
    print(x, y, z)
```

#### 示例运行结果
```python
输出结果
1 4 7
2 5 8
3 6 9
```

以上代码提供了对二维列表的创建、拼接、扩展、插入、移除、查找、字符串转换为列表以及使用 zip 遍历多个列表的示例。

## 常见题型
