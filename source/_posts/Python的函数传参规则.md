---
title: "Python的函数传参规则"
tags: [Python]
categories: [Python]
date: 2025-05-15 08:59:59
---

## 1. 核心传递机制

- **按对象引用传递**
  - 传递对象的引用（非拷贝）
  - 可变对象（列表/字典）在函数内修改会影响原对象
  - 不可变对象（数字/字符串）修改会创建新对象

```python
def modify(obj):
    obj.append(1) if isinstance(obj, list) else print("不可变对象")

lst = [0]
modify(lst)  # lst变为[0, 1]
```

## 2. 参数匹配规则

### 两种传递方式

| 方式       | 匹配规则                 | 示例                        |
| ---------- | ------------------------ | --------------------------- |
| 位置参数   | 严格按定义顺序匹配       | `func(1, 2)` → a=1, b=2     |
| 关键字参数 | 按参数名匹配（顺序无关） | `func(b=2, a=1)` → a=1, b=2 |

### 关键特性

- 变量名是否相同**不影响**参数传递
- 混合使用时：位置参数必须在前

```python
func(1, b=2)  # 合法
func(a=1, 2)  # SyntaxError
```

## 3. 参数类型总结

### 四种参数类型

1. **位置参数**
   ```python
   def func(a, b): pass
   ```
2. **默认参数**
   ```python
   def func(a=1, b=2): pass
   ```
3. **可变位置参数** (`*args`)
   ```python
   def func(*args):  # 接收为元组
   ```
4. **可变关键字参数** (`**kwargs`)
   ```python
   def func(**kwargs):  # 接收为字典
   ```

## 4. 易混淆场景解析

### 场景 1：顺序影响

```python
def demo(a, b):
    print(f"a={a}, b={b}")

x, y = 10, 20
demo(y, x)  # 输出: a=20, b=10（纯位置传递）
```

### 场景 2：关键字参数无视顺序

```python
demo(b=y, a=x)  # 输出: a=10, b=20
```

### 场景 3：默认参数陷阱

```python
# 默认参数在定义时求值（仅一次）
def buggy(lst=[]):
    lst.append(1)
    return lst

buggy()  # 返回 [1]
buggy()  # 返回 [1, 1] （非预期！）
```

## 5. 最佳实践

1. 超过 3 个参数时建议使用关键字参数
2. 避免可变对象作为默认参数
3. 参数命名要有明确含义
4. 复杂函数建议添加类型注解

```python
def good_example(
    user_id: int,
    username: str,
    *,
    is_admin: bool = False,  # 强制关键字参数
    **options
) -> dict: ...
```

> **关键记忆点**：Python 参数传递只关心调用方式（位置/关键字），与变量名无关。明确传递方式比依赖顺序更可靠。
