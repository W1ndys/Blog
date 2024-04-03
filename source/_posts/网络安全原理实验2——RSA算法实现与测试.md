---
title: 网络安全原理实验2——RSA算法实现与测试
tags:
  - 网络安全原理实验报告
  - RSA
categories:
  - 网络安全
  - 实验报告
date: 2024-04-03 10:15:00
---

# 网络安全原理实验 2——RSA 算法实现与测试

## 【目的】

让学员通过该实验的练习主要掌握：

- 实现 RSA 密码算法

## 【环境】

操作机：Ubuntu18.04

## 【工具】

编辑软件：gedit - Version 3.36.2

编译器：gcc (Ubuntu 9.3.0-17ubuntu1~18.04) 9.3.0

> 我用 Python 写的，开虚拟机，开 C 语言环境太慢了

## 【源码】

```Python

def f(r, x, n):
    """
    计算 x 的 r 次方模 n
    """
    a = x
    b = r
    c = 1
    while b != 0:
        while b % 2 == 0:
            b = b // 2
            a = (a * a) % n
        if b % 2 != 0:
            b = b - 1
            c = (c * a) % n
    return c


def Enclid(n, d):
    """
    计算模逆运算
    """
    a = n
    b = d
    t = 0
    v = 1
    w = 0
    while True:
        r = a % b
        if r != 0:
            q = (a - r) // b
            a = b
            b = r
            w = v
            v = t - q * v
            t = w
        else:
            break
    if b == 1:
        if v >= 0:
            return v
        else:
            return n + v
    else:
        return 0


def gcd(a, b):
    """
    计算最大公约数
    """
    r = a % b
    while True:
        r = a % b
        if r != 0:
            a = b
            b = r
        else:
            break
    if b == 1:
        return 1
    else:
        return b


def rsa():
    """
    RSA 加密算法
    """
    # 输入两个素数 p、q
    p = int(input("输入两个素数:(p、q)\n"))
    q = int(input())
    n = p * q  # 计算 n
    fn = (p - 1) * (q - 1)  # 计算 φ(n)

    # 输入 e，并确保 gcd(fn, e) = 1
    e = int(input("输入e:\n"))
    while True:
        if gcd(fn, e) == 1:
            break
        else:
            e = int(input("必须满足gcd(fn,e)=1\n"))

    # 计算 d
    d = Enclid(fn, e)

    # 输出公钥和私钥
    if d == 0:
        print("出错了!\n")
    else:
        print("公钥(%d,%d)\n" % (e, fn))
        print("私钥:(%d,%d)\n" % (d, fn))

        # 输入明文 m，并确保 m < p * q
        m = int(input("Enc: 输入明文:\n"))
        while m >= p * q:
            print("错误！明文需要小于p*q=%d!\n" % (p * q))
            m = int(input())

        # 加密并输出密文
        print("密文:%d\n" % f(e, m, n))

        # 解密并输出明文
        print("解密:m=%d\n" % f(d, f(e, m, n), n))


print("RSA加密算法\n")
print("姓名: W1ndys\n")
print("学号: 10000001\n")

rsa()

input("按Ctrl+C退出")


```

## 【运行截图】

![image-20240403103313875](../img/CyberSecurity/2-RSA/image-20240403103313875.png)
