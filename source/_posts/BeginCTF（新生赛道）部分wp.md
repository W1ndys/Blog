---
title: BeginCTF（新生赛道）部分wp
tags:
  - CTF
  - WP
  - BeginCTF
categories:
  - CTF
  - WP
  - BeginCTF
abbrlink: c4767082
date: 2024-01-31 14:45:51

---

菜鸡呜呜呜，就写了两道题

# Misc

## real check in

base32 秒了

## Tupper

搜一下题目名字

可以搜到这篇文章

<https://hasegawaazusa.github.io/tupper-note.html#/>

结合题目

用脚本把文件内容拼一下

```Python
import os

# 获取当前目录
current_directory = os.getcwd()

# 创建一个新的txt文件来存储汇总内容
output_file_path = os.path.join(current_directory, '汇总文件.txt')
output_file = open(output_file_path, 'w', encoding='utf-8')

# 遍历当前目录下以4的倍数命名的txt文件
for i in range(0, 673, 4):
    file_name = f'{i}.txt'
    file_path = os.path.join(current_directory, file_name)

    # 检查文件是否存在
    if os.path.exists(file_path):
        # 读取文件内容并写入汇总文件
        with open(file_path, 'r', encoding='utf-8') as input_file:
            content = input_file.read()
            output_file.write(content)

# 关闭输出文件
output_file.close()

print(f'汇总完成，结果存储在 {output_file_path}')

```

得到字符串

> MTQyNzgxOTM0MzI3MjgwMjYwNDkyOTg1NzQ1NzU1NTc1MzQzMjEwNjIzNDkzNTI1NDM1NjI2NTY3NjY0Njk3MDQwOTI4NzQ2ODgzNTQ2NzkzNzEyMTI0NDQzODIyOTg4MjEzNDIwOTM0NTAzOTg5MDcwOTY5NzYwMDI0NTg4MDc1OTg1MzU3MzUxNzIxMjY2NTc1MDQxMzExNzE2ODQ5MDcxNzMwODY2NTk1MDUxNDM5MjAzMDAwODU4MDg4MDk2NDcyNTY3OTAzODQzNzg1NTM3ODAyODI4OTQyMzk3NTE4OTg2MjAwNDExNDMzODMzMTcwNjQ3MjcxMzY5MDM2MzQ3NzA5MzYzOTg1MTg1NDc5MDA1MTI1NDg0MTk0ODYzNjQ5MTUzOTkyNTM5NDEyNDU5MTEyMDUyNjI0OTM1OTExNTg0OTc3MDgyMTkxMjY0NTM1ODc0NTY2MzczMDI4ODg3MDEzMDMzODIyMTA3NDg2Mjk4MDAwODE4MjE2ODQyODMxODczNjg1NDM2MDE1NTk3Nzg0MzE3MzUwMDY3OTQ3NjE1NDI0MTMwMDY2MjEyMTkyMDczMjI4MDg0NDkyMzIwNTA1Nzg4NTI0MzEzNjE2Nzg3NDUzNTU3NzY5MjExMzIzNTI0MTk5MzE5MDc4MzgyMDUwMDExODQ =

base64 梭一下

> 14278193432728026049298574575557534321062349352543562656766469704092874688354679371212444382298821342093450398907096976002458807598535735172126657504131171684907173086659505143920300085808809647256790384378553780282894239751898620041143383317064727136903634770936398518547900512548419486364915399253941245911205262493591158497708219126453587456637302888701303382210748629800081821684283187368543601559778431735006794761542413006621219207322808449232050578852431361678745355776921132352419931907838205001184

放在线网站里梭一下 <https://tuppers-formula.ovh/#/>

![image-20240131144910393](../img/beginCTF/misc/image-20240131144910393.png)

> begin{T4UUPER!}

