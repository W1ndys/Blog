---
title: 基于 Python 和 Onebot11 的QQ机器人开发—— Python常用语法
tags:
  - QQbot
  - QQ机器人
  - Python
  - Onebot11
  - NapCatQQ
categories:
  - QQbot
cover: "https://vip.helloimg.com/i/2024/08/05/66b06a6b8b0c2.jpg"
abbrlink: d5fe3115
date: 2024-08-07 10:24:36
---

## 背景

在写机器人的过程中不可避免的碰到语法的学习，本页梳理了常用的语法，以及记录开发机器人以来遇到的各种问题，需要注意的点。
。

### 异常处理

每个函数中尽量都要有异常处理，好处一个是方便快速调试报错点，第二个就是不会因为异常导致程序退出。

更详细的内容可以看 [Python 异常处理 | 菜鸟教程 (runoob.com)](https://www.runoob.com/python/python-exceptions.html#/)

```python
try:
<语句>        #运行别的代码
except <名字>：
<语句>        #如果在try部份引发了'name'异常
except <名字>，<数据>:
<语句>        #如果引发了'name'异常，获得附加的数据
else:
<语句>        #如果没有异常发生
```

| 异常名称                  | 描述                                               |
| :------------------------ | :------------------------------------------------- |
|                           |                                                    |
| BaseException             | 所有异常的基类                                     |
| SystemExit                | 解释器请求退出                                     |
| KeyboardInterrupt         | 用户中断执行(通常是输入^C)                         |
| Exception                 | 常规错误的基类                                     |
| StopIteration             | 迭代器没有更多的值                                 |
| GeneratorExit             | 生成器(generator)发生异常来通知退出                |
| StandardError             | 所有的内建标准异常的基类                           |
| ArithmeticError           | 所有数值计算错误的基类                             |
| FloatingPointError        | 浮点计算错误                                       |
| OverflowError             | 数值运算超出最大限制                               |
| ZeroDivisionError         | 除(或取模)零 (所有数据类型)                        |
| AssertionError            | 断言语句失败                                       |
| AttributeError            | 对象没有这个属性                                   |
| EOFError                  | 没有内建输入, 到达 EOF 标记                        |
| EnvironmentError          | 操作系统错误的基类                                 |
| IOError                   | 输入/输出操作失败                                  |
| OSError                   | 操作系统错误                                       |
| WindowsError              | 系统调用失败                                       |
| ImportError               | 导入模块/对象失败                                  |
| LookupError               | 无效数据查询的基类                                 |
| IndexError                | 序列中没有此索引(index)                            |
| KeyError                  | 映射中没有这个键                                   |
| MemoryError               | 内存溢出错误(对于 Python 解释器不是致命的)         |
| NameError                 | 未声明/初始化对象 (没有属性)                       |
| UnboundLocalError         | 访问未初始化的本地变量                             |
| ReferenceError            | 弱引用(Weak reference)试图访问已经垃圾回收了的对象 |
| RuntimeError              | 一般的运行时错误                                   |
| NotImplementedError       | 尚未实现的方法                                     |
| SyntaxError               | Python 语法错误                                    |
| IndentationError          | 缩进错误                                           |
| TabError                  | Tab 和空格混用                                     |
| SystemError               | 一般的解释器系统错误                               |
| TypeError                 | 对类型无效的操作                                   |
| ValueError                | 传入无效的参数                                     |
| UnicodeError              | Unicode 相关的错误                                 |
| UnicodeDecodeError        | Unicode 解码时的错误                               |
| UnicodeEncodeError        | Unicode 编码时错误                                 |
| UnicodeTranslateError     | Unicode 转换时错误                                 |
| Warning                   | 警告的基类                                         |
| DeprecationWarning        | 关于被弃用的特征的警告                             |
| FutureWarning             | 关于构造将来语义会有改变的警告                     |
| OverflowWarning           | 旧的关于自动提升为长整型(long)的警告               |
| PendingDeprecationWarning | 关于特性将会被废弃的警告                           |
| RuntimeWarning            | 可疑的运行时行为(runtime behavior)的警告           |
| SyntaxWarning             | 可疑的语法的警告                                   |
| UserWarning               | 用户代码生成的警告                                 |

### 文件读写

专有名词叫做 Python File(文件) 方法

#### open() 方法

完整的语法格式为：

```python
open(file, mode='r', buffering=-1, encoding=None, errors=None, newline=None, closefd=True, opener=None)
```

参数说明:

- file: 必需，文件路径（相对或者绝对路径）。
- mode: 可选，文件打开模式
- buffering: 设置缓冲
- encoding: 一般使用 utf8
- errors: 报错级别
- newline: 区分换行符
- closefd: 传入的 file 参数类型
- opener: 设置自定义开启器，开启器的返回值必须是一个打开的文件描述符。

| 模式  | 描述                                                                                                                                                               |
| :---- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| t     | 文本模式 (默认)。                                                                                                                                                  |
| x     | 写模式，新建一个文件，如果该文件已存在则会报错。                                                                                                                   |
| b     | 二进制模式。                                                                                                                                                       |
| +     | 打开一个文件进行更新(可读可写)。                                                                                                                                   |
| U     | 通用换行模式（不推荐）。                                                                                                                                           |
| r     | 以只读方式打开文件。文件的指针将会放在文件的开头。这是默认模式。                                                                                                   |
| rb    | 以二进制格式打开一个文件用于只读。文件指针将会放在文件的开头。这是默认模式。一般用于非文本文件如图片等。                                                           |
| r+    | 打开一个文件用于读写。文件指针将会放在文件的开头。                                                                                                                 |
| rb+   | 以二进制格式打开一个文件用于读写。文件指针将会放在文件的开头。一般用于非文本文件如图片等。                                                                         |
| **w** | **打开一个文件只用于写入。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。**                                       |
| wb    | 以二进制格式打开一个文件只用于写入。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。一般用于非文本文件如图片等。   |
| w+    | 打开一个文件用于读写。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。                                             |
| wb+   | 以二进制格式打开一个文件用于读写。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。一般用于非文本文件如图片等。     |
| a     | 打开一个文件用于追加。如果该文件已存在，文件指针将会放在文件的结尾。也就是说，新的内容将会被写入到已有内容之后。如果该文件不存在，创建新文件进行写入。             |
| ab    | 以二进制格式打开一个文件用于追加。如果该文件已存在，文件指针将会放在文件的结尾。也就是说，新的内容将会被写入到已有内容之后。如果该文件不存在，创建新文件进行写入。 |
| a+    | 打开一个文件用于读写。如果该文件已存在，文件指针将会放在文件的结尾。文件打开时会是追加模式。如果该文件不存在，创建新文件用于读写。                                 |
| ab+   | 以二进制格式打开一个文件用于追加。如果该文件已存在，文件指针将会放在文件的结尾。如果该文件不存在，创建新文件用于读写。                                             |

#### file 对象

file 对象使用 open 函数来创建，下表列出了 file 对象常用的函数：

| 序号 | 方法及描述                                                                                                                                                               |
| :--- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1    | [file.close()](https://www.runoob.com/python/file-close.html) 关闭文件。关闭后文件不能再进行读写操作。                                                                   |
| 2    | [file.flush()](https://www.runoob.com/python/file-flush.html) 刷新文件内部缓冲，直接把内部缓冲区的数据立刻写入文件, 而不是被动的等待输出缓冲区写入。                     |
| 3    | [file.fileno()](https://www.runoob.com/python/file-fileno.html) 返回一个整型的文件描述符(file descriptor FD 整型), 可以用在如 os 模块的 read 方法等一些底层操作上。      |
| 4    | [file.isatty()](https://www.runoob.com/python/file-isatty.html) 如果文件连接到一个终端设备返回 True，否则返回 False。                                                    |
| 5    | [file.next()](https://www.runoob.com/python/file-next.html) 返回文件下一行。                                                                                             |
| 6    | [file.read([size\])](https://www.runoob.com/python/python-file-read.html) 从文件读取指定的字节数，如果未给定或为负则读取所有。                                           |
| 7    | [file.readline([size\])](https://www.runoob.com/python/file-readline.html) 读取整行，包括 "\n" 字符。                                                                    |
| 8    | [file.readlines([sizeint\])](https://www.runoob.com/python/file-readlines.html) 读取所有行并返回列表，若给定 sizeint > 0，则是设置一次读多少字节，这是为了减轻读取压力。 |
| 9    | [file.seek(offset[, whence\])](https://www.runoob.com/python/file-seek.html) 设置文件当前位置                                                                            |
| 10   | [file.tell()](https://www.runoob.com/python/file-tell.html) 返回文件当前位置。                                                                                           |
| 11   | [file.truncate([size\])](https://www.runoob.com/python/file-truncate.html) 截取文件，截取的字节通过 size 指定，默认为当前文件位置。                                      |
| 12   | [file.write(str)](https://www.runoob.com/python/python-file-write.html) 将字符串写入文件，返回的是写入的字符长度。                                                       |
| 13   | [file.writelines(sequence)](https://www.runoob.com/python/file-writelines.html) 向文件写入一个序列字符串列表，如果需要换行则要自己加入每行的换行符。                     |

### 函数处理

#### 函数阻断

在执行过程中，不免要进行一些函数阻断，以防满足两个条件，导致运行两次。

在要执行的函数下面写个`return`，就可以阻断函数继续执行。

#### 函数并发

函数并发可以用 `async` 和 `await` 来实现，`async` 用于定义一个异步函数，`await` 用于等待一个异步函数执行完成。

当然如果你想让函数并发，那么可以使用 `asyncio` 模块来实现，`asyncio` 模块提供了一些函数来实现异步编程。

下面是一个具体例子

```python
async def Example_main(websocket, msg):

    # 确保数据目录存在
    os.makedirs(DATA_DIR, exist_ok=True)

    # 并发执行任务
    await asyncio.gather(
        handle_Example_group_message(websocket, msg),
        handle_Example_group_notice(websocket, msg),
        handle_Example_private_message(websocket, msg),
    )
```

### 变量的使用

1. 在获取群号的时候，通常涉及到数据存储，为了方便做处理，一般以 str 类型保存群号，因为 msg 参数给出的是 int 类型，需要注意转换一下

### 数据的存储和交互

在机器人的开发过程中，不可避免的会遇到数据存储的问题，通常会使用 json 文件进行存储，在 Python 中，可以使用 `json` 模块来处理 JSON 数据。

并且不免要进行数据的交互，比如从数据库中获取数据，或者将数据存储到本地，或者从本地获取数据，我习惯使用 `json` 文件进行存储，因为比较简单，并且容易理解。如果你知道如何使用数据库，那么你可以使用数据库进行存储，这样会更加安全可靠。

在数据交互的开发过程中，通常会先读取本地文件，然后进行数据处理，最后将数据存储到本地文件中，如此反复。

可能这个过程看起来比较繁琐耗时间，但实际上这个过程的处理几乎是毫秒级的，所以不用担心时间问题。

### 常用函数或库

#### 日期的处理

在 Python 中，可以使用 `datetime` 模块来处理日期，`datetime` 模块提供了一些函数来处理日期。用`datetime.now()` 获取当前时间，用 `datetime.now().strftime('%Y-%m-%d %H:%M:%S')` 获取当前时间的字符串格式。

此方法可以用在检测日期或时间是否满足某个条件，比如检测是否是某个时间点，或者检测是否是某个时间段。实现**定时任务等功能**

[Python 日期和时间教程](https://blog.csdn.net/cmzsteven/article/details/64906245#)
