import os
import re
import hashlib
import logging

# 配置日志
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)


def calculate_md5(file_path):
    """计算文件的MD5哈希值"""
    logging.info(f"计算文件 {file_path} 的MD5哈希值")
    with open(file_path, "rb") as f:
        file_hash = hashlib.md5()
        while chunk := f.read(8192):
            file_hash.update(chunk)
    return file_hash.hexdigest()


def update_markdown_images(md_file_path):
    """更新Markdown文件中的图片链接"""
    logging.info(f"开始更新Markdown文件 {md_file_path} 中的图片链接")

    # 获取Markdown文件的目录
    md_file_dir = os.path.dirname(md_file_path)
    logging.info(f"Markdown文件目录: {md_file_dir}")

    with open(md_file_path, "r", encoding="utf-8") as file:
        content = file.read()

    # 匹配Markdown中的图片路径
    image_pattern = re.compile(r"!\[.*?\]\((.*?)\)")
    matches = image_pattern.findall(content)

    for image_path in matches:
        # 将图片路径转换为绝对路径
        absolute_image_path = os.path.join(md_file_dir, image_path)

        if os.path.exists(absolute_image_path):
            logging.info(f"找到图片路径: {absolute_image_path}")
            # 计算图片的MD5哈希值
            md5_hash = calculate_md5(absolute_image_path).lower()
            # 构造新的图片链接
            new_image_link = f"https://pica.zhimg.com/80/v2-{md5_hash}.png"
            logging.info(f"将图片链接 {image_path} 替换为 {new_image_link}")
            # 替换Markdown中的图片链接
            content = content.replace(image_path, new_image_link)
        else:
            logging.warning(f"图片路径 {absolute_image_path} 不存在")

    # 将更新后的内容写回文件
    with open(md_file_path, "w", encoding="utf-8") as file:
        file.write(content)
    logging.info(f"完成更新Markdown文件 {md_file_path}")


# 使用示例
markdown_file_path = "source/_posts/曲阜师范大学教务系统成绩监控（无需服务器）.md"
update_markdown_images(markdown_file_path)
