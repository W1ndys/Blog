---
date: 2023-10-05 13:52
title: C++常用的代码模板
tags: C++
categories:
  - C++
  - 常用代码
abbrlink: b138fb0c
---

# 生成随机数

## 源代码

```c++
#include <iostream>
#include <random>
#include <chrono>

using namespace std;

int main() {
    // 使用当前时间作为随机数生成器的种子
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    
    // 创建一个随机数生成器
    default_random_engine generator(seed);
    
    // 创建一个均匀分布的随机数生成器，范围从1到100
    uniform_int_distribution<int> distribution(1,100);
    
    // 生成并打印一个随机数
    cout << "Random number: " << distribution(generator) << endl;
    
    return 0;
}

```

## 摘要

```C++
// 使用当前时间作为随机数生成器的种子
unsigned seed = chrono::system_clock::now().time_since_epoch().count();

// 创建一个随机数生成器
default_random_engine generator(seed);

// 创建一个均匀分布的随机数生成器，范围从1到100
uniform_int_distribution<int> distribution(1,100);
```
```
distribution(generator)
```

```
#include <chrono>
```

