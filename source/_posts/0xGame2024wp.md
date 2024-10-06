---
title: "0xGame2024wp"
tags: [CTF, WP, 0xGame2024]
categories: [CTF, WP, 0xGame2024]
date: 2024-10-06 17:48:47
cover: https://ctf.njupt.edu.cn/wp-content/uploads/2020/09/2020092712314778.png
---

南邮的新生赛，`week1` 对于我这种老年痴呆来说还是能做一做。

## Reverse

### [Week 1] BabyBase

![img](https://picx.zhimg.com/80/v2-2f708b8cd2bf316adbb7c4f84d84f581.png)

shift+f12 看看，base64，秒了，甚至都没换表

> 0xGame{N0w_y0u_kn0w_B4se64_Enc0d1ng_w3ll!}

### [Week 1] BinaryMaster

![img](https://pic1.zhimg.com/80/v2-d82e1c6c9baab8986d330683623d0fe6.png)

flag 打开就有

> 0xGame{114514cc-a3a7-4e36-8db1-5f224b776271}

### [Week 1] SignSign

查看字符串，打开就有

![img](https://pic1.zhimg.com/80/v2-b5f0ffebdcc5866054c94e3c4f719ade.png)

> 0xGame{S1gn1n_h3r3_4nd_b3g1n_Reversing_n0w}

### [Week 1] Xor-Beginning

一个简单的异或

```py
v5 = [0] * 30
for i in range(len("~5\v*',3")):
    v5[i] = ord("~5\v*',3"[i])
v5[7] = 31
v5[8] = 118
v5[9] = 55
v5[10] = 27
v5[11] = 114
v5[12] = 49
v5[13] = 30
v5[14] = 54
v5[15] = 12
v5[16] = 76
v5[17] = 68
v5[18] = 99
v5[19] = 114
v5[20] = 87
v5[21] = 73
v5[22] = 8
v5[23] = 69
v5[24] = 66
v5[25] = 1
v5[26] = 90
v5[27] = 4
v5[28] = 19
v5[29] = 76
print(v5)
flag = ""
for i in range(len(v5)):
    flag += chr(v5[i] ^ (78 - i))
print(flag)

```

### [Week 1] Xor-Endian

这题也是异或，只不过用得到一些小端序的知识，用 ChatGPT 写的，等有时间再回来研究研究

```python
import struct

# 定义 v6 数组
v6 = [
    1363025275,
    253370901,
    1448151638,
    1415391232,
    91507463,
    139743552,
    1450318164,
    1985283101,
    1465125718,
    1934953223,
    84430593,
    0,
]

# 将 v6 转换为字节序列（小端序）
v6_bytes = b"".join(struct.pack("<I", num) for num in v6)

# 只取前 44 个字节
v6_bytes = v6_bytes[:44]

# 定义密钥
key = b"Key0xGame2024"

# 加密长度
encrypt_len = 44
key_len = len(key)  # 13

# 反向计算原始的 v7_bytes
v7_bytes = bytearray(encrypt_len)
for i in range(encrypt_len):
    v7_bytes[i] = v6_bytes[i] ^ key[i % key_len]

# 输出结果
print("需要输入的字符串为：")
print(v7_bytes.decode("ascii"))

```

## Misc

### [Week 1] 关注 DK 盾谢谢喵

签到题，不多说了

> 0xGame{W31c0m3_70_0x64m3_2024_5p0n50r3d_8y_dkdun}

### [Week 1] 加密的压缩包?

打开之后发现文件损坏，用 `bandzip` 修复也没成功

伪加密修复后可以正常解压，输入解压密码 `0xGame2024`

拿到 flag

> 0xGame{M@ybe_y0u_ar2_t4e_mAsTer_0f_Z1p}

## Web

### [Week 1] ez_login

弱口令

```
admin
admin123
```

### [Week 1] hello_web

根据提示查看源代码

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>查看源代码</title>
    <script>
      document.addEventListener("contextmenu", function (e) {
        alert("居心叵测，不许查看源代码！");
        e.preventDefault();
      });
      document.addEventListener("keydown", function (e) {
        if (e.key === "F12") {
          alert("你想干嘛？你不许F12！");
          e.preventDefault();
        }
      });
    </script>
  </head>
  <body>
    <h1>Welcome to 0xgame 2024</h1>
    <!-- 看看f14g.php -->
    <!-- 此乃flag的第一段：0xGame{ee7f2040-1987-4e0a -->
    <p>这是一个简洁的网页，web方向的题基本都会有这么一个网站</p>
    <p>零基础的同学不会的地方，可以尝试多搜索一下</p>
  </body>
</html>
```

拿到第一段

根据提示看/f14g.php

查看响应包

![img](https://pic1.zhimg.com/80/v2-1fefcec60e819ed72f95f44ee7fc8a5d.png)

> 0xGame{ee7f2040-1987-4e0a-872d-68589c4ab3d3}

### [Week 1] hello_http

考察 http 协议，用 hackerbar 打就行了，感谢哆啦 A 梦师哥的指导

![img](https://picx.zhimg.com/80/v2-884e32099bcaa4e1102268627161ac26.png)

> 0xgame{1cd6a904-725f-11ef-aafb-d4d8533ec05c}

## Crypto

### [Week 1] Caesar Cipher

```
0yHbnf{Uif_Cfhjoojoh_Pg_Dszqup}
```

凯撒密码，枚举一下

> 0xGame{The_Beginning_Of_Crypto}

### [Week 1] Code

```python
from Crypto.Util.number import long_to_bytes
from base64 import b64decode

# 已知的分块信息
m0 = b"0xGame{73d7"
m1 = 60928972245886112747629873
m2 = "3165662d393339332d3034"
m3 = b"N2YwZTdjNGRlMX0="

# 逆向解码
m1_decoded = long_to_bytes(m1)
m2_decoded = bytes.fromhex(m2)
m3_decoded = b64decode(m3)

# 组合得到完整的 flag
flag = m0 + m1_decoded + m2_decoded + m3_decoded
print(flag.decode())

```

## Pwn

### [Week 1] 0. test your nc

nc 连上拿到 flag，可能要连两次，第二次才有

> 0xGame{928bb261-0a63-4389-b629-4d1f2f449848}
