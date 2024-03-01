---
date: 2023-10-03 21:08
title: 利用Kali中的工具John破解压缩包密码（弱密码
tags: Linux
categories:
  - Linux
  - kali
  - john
abbrlink: b63d2e4e
---

推荐一篇文章

[kali中binwalk/foremost/zip2john工具的配合使用](https://blog.csdn.net/mengmeng0510/article/details/120812017)

### 第一步拿到hash文件

```
zip2john  [压缩包文件]  >>  [名字.txt]
```

### 第二步解析hash文件

```
john  [名字.txt]
```

另外此处可以指定加密方式

在Kali系统中我们只需要添加--format=[xxx]参数，即可指定John使用指定算法破解密码：

```
john --format=crypt passwd.txt
```

破解结束后无需再次对相同密文进行破解通常会提示：

> Loaded [number] password hashes with [number] different salts (crypt, generic crypt([number]) [?/64])
> No password hashes left to crack (see FAQ)

如果我们需要再次查看破解后的密码只需执行如下命令：

```
john --show passwd.txt
```



```
john --format=[加密方式] --wordlist=[字典路径] [待解密密文文件]
```

