---
date: 2023-08-26 07:26
title: 攻防世界-Reverse-666writeup
tags: CTF
categories:
  - CTF
  - WP
  - RE
abbrlink: 117d354d
---

# 查壳

丢进去查壳

![1.png](https://img1.imgtp.com/2023/08/26/gAGTtvBK.png)

无壳

# 进入IDA

直接拉进ida

 首先看到一个比较醒目的flag

![2.png](https://img1.imgtp.com/2023/08/26/GF6BzP2T.png)

但是这怎么可能就是答案呢

# 主函数

看一下主函数

![3.png](https://img1.imgtp.com/2023/08/26/HaTlGnfa.png)

双击enflag看一下![4.png](https://img1.imgtp.com/2023/08/26/7RilNm8M.png)

 发现enflag是izwhroz""w"v.K".Ni

转化为十进制[ASCII文本，十六进制，二进制，十进制，Base64转换器 (rapidtables.org)](https://www.rapidtables.org/zh-CN/convert/number/ascii-hex-bin-dec-converter.html)

```cpp
[105,122,119,104,114,111,122,34,34,119,34,118,46,75,34,46,78,105]
```

key的长度是12h（注意是16进制），转换成十进制应该是10

# encode函数

返回主函数看一下encode是干啥的

![5.png](https://img1.imgtp.com/2023/08/26/axSEUavG.png)

 

 根据三行重点计算过程，写一下逆向代码

```cpp
#include <iostream>
#include <vector>
#include<Windows.h>
using namespace std;
 
int main()
{
    string v3=""; // [rsp+10h] [rbp-70h]
    int v4; // [rsp+78h] [rbp-8h]
    int i; // [rsp+7Ch] [rbp-4h]
    i = 0;
    v4 = 0;
    vector<int> enflag = { 105,122,119,104,114,111,122,34,34,119,34,118,46,75,34,46,78,105,0 };
    for (i = 0; i < 18; i += 3)
    {
        v3 += char((18 ^ enflag[i]) - 6);
        v3 += char((18 ^ enflag[i + 1]) + 6);
        v3 += char(18 ^ enflag[i + 2] ^ 6);
    }
    cout << v3 << endl;
    return 0;
} 
```

unctf{b66_6b6_66b}