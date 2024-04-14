#!/usr/bin/env python
import os
from datetime import datetime
import re
import subprocess


def create_markdown_file(title, tags, categories):
    try:
        # 获取脚本所在目录的绝对路径
        script_dir = os.path.dirname(os.path.abspath(__file__))

        # 设置文件路径和名称
        POSTS_DIR = os.path.join(script_dir, "source/_posts")
        # 使用正则表达式处理文件名
        file_name = re.sub(r'[\\/:*?"<>|]', "-", title) + ".md"
        file_path = os.path.join(POSTS_DIR, file_name)

        # 检查目录是否存在，如果不存在则创建
        os.makedirs(os.path.dirname(file_path), exist_ok=True)

        # 获取当前日期
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        # 生成唯一的时间戳
        unique_timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")[:-3]

        # 将输入的空格隔开的标签和分类转换为英文逗号隔开的形式
        tags = ",".join(map(str.strip, tags.split()))
        categories = ",".join(map(str.strip, categories.split()))

        # 构建front-matter
        front_matter = (
            f"---\n"
            f"title: '{title}'\n"
            f"tags: [{tags}]\n"
            f"categories: [{categories}]\n"
            f"date: {current_date}\n"
            f"cover: https://t.mwm.moe/fj?{unique_timestamp}\n"
            f"---\n\n"
        )

        # 创建Markdown文件并写入front-matter
        with open(file_path, "w", encoding="utf-8") as file:
            file.write(front_matter)

        print(f"Markdown文件 '{file_name}' 已成功创建.")

        # 打开Markdown文件
        subprocess.Popen(["start", "", file_path], shell=True)

    except Exception as e:
        print(f"创建Markdown文件时发生错误: {e}")


# 示例用法
print("Powerd by W1ndys           update:2024年4月14日")
print("该文件必须放置在与 _config.yml 相同的目录下")
print("生成的文件将保存在当前目录下的 source/_posts 文件夹中")
print("请注意文件位置")
print("——————————————————————————————————————————————————————————")

title = input("请输入标题: ")
tags = input("请输入标签（多个标签用空格隔开）: ")
categories = input("请输入分类（多个分类用空格隔开）: ")

# 调用函数创建Markdown文件
create_markdown_file(title, tags, categories)
