---
title: Python中的datatime和time库
tags:
  - Python
categories:
  - Python
abbrlink: 739a905d
date: 2025-05-18 20:57:38
---

在 Python 中，`datetime` 和 `time` 是两个用于处理日期和时间的常用模块，但它们的功能和用途有所不同。以下是它们的详细对比：

---

### `datetime` 模块

用途：提供日期和时间的组合操作（年、月、日、时、分、秒等），支持算术运算（如时间差计算）。
常用类：

- `datetime.datetime`：表示具体的日期和时间（如 `2023-10-25 14:30:00`）。
- `datetime.date`：仅表示日期（年、月、日）。
- `datetime.time`：仅表示时间（时、分、秒、微秒）。
- `datetime.timedelta`：表示时间间隔（用于时间加减）。

#### 示例代码

```python
from datetime import datetime, date, time, timedelta

# 当前时间
now = datetime.now()
print(now)  # 输出: 2023-10-25 14:30:00.123456

# 创建特定日期或时间
d = date(2023, 10, 25)
t = time(14, 30)
dt = datetime(2023, 10, 25, 14, 30)

# 时间运算（加减）
delta = timedelta(days=1)
tomorrow = now + delta
```

---

### `time` 模块

用途：主要提供与时间相关的底层函数，例如获取时间戳、休眠等，不直接处理日期。
常用功能：

- `time.time()`：返回当前时间戳（秒数，从 1970 年 1 月 1 日算起）。
- `time.sleep(seconds)`：让程序暂停指定秒数。
- `time.localtime()`：将时间戳转换为本地时间的结构化格式（`struct_time`）。
- `time.strftime()`：格式化时间输出。

#### 示例代码

```python
import time

# 获取当前时间戳（浮点数秒数）
timestamp = time.time()
print(timestamp)  # 输出: 1698233400.123

# 时间戳转为可读格式
local_time = time.localtime(timestamp)
formatted = time.strftime("%Y-%m-%d %H:%M:%S", local_time)
print(formatted)  # 输出: 2023-10-25 14:30:00

# 程序休眠
time.sleep(2)  # 暂停2秒
```

---

### 对比总结

| 特性           | `datetime` 模块              | `time` 模块                      |
| -------------- | ---------------------------- | -------------------------------- |
| 主要用途       | 处理日期和时间的组合操作     | 获取时间戳、休眠、低层时间操作   |
| 日期支持       | 是（年、月、日）             | 否                               |
| 时间精度       | 微秒级                       | 秒级                             |
| 时间运算       | 支持（如 `timedelta`）       | 不支持直接运算                   |
| 格式化输出     | 通过 `strftime` 方法         | 通过 `time.strftime` 函数        |
| 典型应用场景   | 日志记录、时间差计算、日期解析 | 性能计时、程序休眠、简单时间戳操作 |

---

### 如何选择？

- 如果需要处理日期和时间的组合（如"2023-10-25 14:30:00"），用 `datetime`。
- 如果需要高精度计时或操作时间戳（如计算代码执行时间），用 `time`。
- 实际项目中，两者经常结合使用：

  ```python
  from datetime import datetime
  import time
  
  start_time = time.time()  # 记录开始时间戳
  # ...执行代码...
  end_time = time.time()
  print(f"耗时: {end_time - start_time}秒")
  
  current_time = datetime.now()  # 获取当前完整时间
  ```
