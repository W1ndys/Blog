---
date: 2023-10-13 00:25
title: QFNUCTF（日照）-Reverse-writeup
tags: CTF
categories:
  - CTF
  - WP
  - RE
abbrlink: 44b69183
---

# base64++

## 查壳

![查壳](https://z1.ax1x.com/2023/10/13/piSzYQ0.png)

无壳

## 反编译

![反编译查看字串](https://z1.ax1x.com/2023/10/13/piSzGzq.png)

查看字串，有两个比较特殊的字符串

联想到题目是换表base64

![换表](https://z1.ax1x.com/2023/10/13/piSz3Js.png)

## 解密

滚去https://ctf.mzy0.com/CyberChef3/    解密一下

![解密](https://z1.ax1x.com/2023/10/13/piSz8Wn.png)

## 题后工作

解密出来后面带着LQB，一开始我以为我做错了，后来我把文件拉进kali运行了一下

发现这个字符串`flag{6JOd5qGl5p2v5Yqg5rK5}LQB`是无法通过正常验证的

而去掉LQB之后`flag{6JOd5qGl5p2v5Yqg5rK5}`是正常验证的

所以我去掉之后提交，但还是没有通过

</br></br></br>

无奈之下我放弃这个题了

</br>

就在前几天我找到了出题人，问了问情况，发现程序里是有一段添加字符串`LQB`的代码的，所以输出结果带着LQB没错，我的做题思路也没错

提交失败的原因是，后台正确的flag中的1和正确答案的l混了，我联系出题人修改了bug

解题结束！



# XOR（修改）

## 查壳

等会吧，明天再写，累了

