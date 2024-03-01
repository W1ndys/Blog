---
title: Python学习日记
tags:
  - Python
categories:
  - Python
abbrlink: 7c404c2f
date: 2024-01-22 12:01:27
---

> 水个蓝桥算了

# Python 学习日记

## 变量和简单数据类型

### 变量

#### 变量的命名和使用

变量名只能包含字母、数字和下划线。变量名可以字母或下划线打头，但不能以数字打头，例如，可将变量命名为 message_1，但不能将其命名为 1_message

变量名不能包含空格，但可使用下划线来分隔其中的单词。例如，变量名 greeting_message 可行，但变量名 greeting message 会引发错误。

不要将 Python 关键字和函数名用作变量名，即不要使用 Python 保留用于特殊用途的单词，如 print（请参见附录 A.4）

变量名应既简短又具有描述性。例如，name 比 n 好，student_name 比 s_n 好，name_length 比 length_of_persons_name 好

慎用小写字母 l 和大写字母 O，因为它们可能被人错看成数字 1 和 0。

---

注意 就目前而言，应使用小写的 Python 变量名。在变量名中使用大写字母虽然不会导致错误，但避免使用大写字母是个不错的主意

#### 使用变量时避免命名错误

1. 拼写错误
2. ....其他错误

### 字符串

字符串就是一系列字符。在 Python 中，用引号括起的都是字符串，其中的引号可以是单引号，也可以是双引号

> "This is a string." 
> 'This is also a string.' 

这种灵活性让你能够在字符串中包含引号和撇号：

> 'I told my friend, "Python is my favorite language!"' 
> "The language 'Python' is named after Monty Python, not the snake." 
> " One of Python's strengths is its diverse and supportive community.

下面是一些字符串的使用方式

#### 使用方法修改字符串的大小写

name.py 

```python
name = "ada lovelace" 
print(name.title())
```

> 将这个文件保存为 name.py，再运行它。你将看到如下输出：
> Ada Lovelace 

<span style="color:#FF0000;"> title()是对句子进行首字母大写，其他字母小写的函数 </span>，适合处理姓名等的数据类型。

在 name.title()中，name 后面的句点（.）让 Python 对变量 name 执行方法 title()指定的操作。

每个方法后面都跟着一对括号，这是因为方法通常需要额外的信息来完成其工作。这种信息是在括号内提供的。函数 title()不需要额外的信息，因此它后面的括号是空的。

还有 upper()和 lower()分别是全大写和全小写的函数

测试代码

```python
name = "hELLo wOrld"
print("原始字符串：")
print(name)
print("首字母大写字符串：")
print(name.title())
print("全大写字符串：")
print(name.upper())
print("全小写字符串：")
print(name.lower())
```

#### 合并（拼接）字符串

```python
first_name = "ada" 
last_name = "lovelace" 
full_name = first_name + " " + last_name
print(full_name)
```

Python 使用加号（+）来合并字符串。在这个示例中，我们使用+来合并 first_name、空格和 last_name，以得到完整的姓名，其结果如下：

ada lovelace 

这种合并字符串的方法称为拼接。通过拼接，可使用存储在变量中的信息来创建完整的消息

可以结合上一步的三个函数进行字符处理。

#### 使用制表符或换行符来添加空白	

在编程中，空白泛指 **任何非打印字符，如空格、制表符和换行符**。你可使用空白来组织输出，以使其更易读。

\t 缩进 \n 换行

#### 删除空白

lstrip()删除开头的空白   rstrip()可以删除末尾的空白

#### 使用字符串时避免语法错误

这边是注意引号，若字符串必须包括单引号，就用双引号引这个字符串

### 数字

#### 整数

Python中整数可以直接进行加减乘除乘方的计算

Python还支持运算次序，因此你可在同一个表达式中使用多种运算。你还可以使用括号来修

---

停更了
