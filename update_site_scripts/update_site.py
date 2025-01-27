#!/usr/bin/env python3
import os
import sys
import shutil
import subprocess
import requests
import json
from datetime import datetime
import zipfile
from pathlib import Path


class SiteUpdater:
    def __init__(self):
        # 基础配置
        self.work_dir = "/tmp/blog-temp"
        self.target_dir = (
            "/opt/1panel/apps/openresty/openresty/www/sites/blog.w1ndys.top/index"
        )
        self.repo_url = "https://github.com/W1ndys/Blog"
        self.proxy_url = "https://ghfast.top/https://github.com/W1ndys/Blog"
        self.webhook = "https://oapi.dingtalk.com/robot/send?access_token=002f008b27dc5656fc58c98c60492fea21662bca977b98a75d6cc8e693af5803"

    def send_dingtalk_message(self, is_success, error_msg=None):
        """发送钉钉通知"""
        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        if is_success:
            message = {
                "msgtype": "markdown",
                "markdown": {
                    "title": "网站更新成功通知",
                    "text": (
                        f"### ✅ 网站更新成功\n\n"
                        f"- **时间**：{current_time}\n"
                        f"- **站点**：[blog.w1ndys.top](https://blog.w1ndys.top)\n"
                        f"- **状态**：部署完成\n\n"
                        "网站已完成更新！"
                    ),
                },
            }
        else:
            message = {
                "msgtype": "markdown",
                "markdown": {
                    "title": "网站更新失败通知",
                    "text": (
                        f"### ❌ 网站更新失败\n\n"
                        f"- **时间**：{current_time}\n"
                        f"- **错误信息**：{error_msg}\n"
                        f"- **站点**：[blog.w1ndys.top](https://blog.w1ndys.top)\n\n"
                        "请及时检查并处理！"
                    ),
                },
            }

        headers = {"Content-Type": "application/json"}
        try:
            response = requests.post(
                self.webhook, data=json.dumps(message), headers=headers
            )
            if response.status_code == 200:
                response_data = response.json()
                if response_data.get("errcode") == 0:
                    print("通知发送成功")
                else:
                    print(f"通知发送失败，错误: {response_data.get('errmsg')}")
            else:
                print(
                    f"HTTP错误，状态码: {response.status_code}, 响应内容: {response.text}"
                )
        except Exception as e:
            print(f"发送通知时发生错误: {str(e)}")

    def download_branch(self, url):
        """下载并解压分支代码"""
        print(f"正在尝试下载分支源码: {url}")

        try:
            # 确保工作目录存在
            os.makedirs(self.work_dir, exist_ok=True)
            zip_path = os.path.join(self.work_dir, "gh-pages.zip")

            # 下载文件
            response = requests.get(
                f"{url}/archive/refs/heads/gh-pages.zip", timeout=15
            )
            response.raise_for_status()

            with open(zip_path, "wb") as f:
                f.write(response.content)

            # 解压文件
            with zipfile.ZipFile(zip_path, "r") as zip_ref:
                zip_ref.extractall(self.work_dir)

            # 处理解压后的目录结构
            extracted_dir = os.path.join(self.work_dir, "Blog-gh-pages")
            if os.path.exists(extracted_dir):
                # 移动文件
                for item in os.listdir(extracted_dir):
                    shutil.move(os.path.join(extracted_dir, item), self.work_dir)
                # 清理
                shutil.rmtree(extracted_dir)
                os.remove(zip_path)
                return True

        except Exception as e:
            print(f"下载或解压过程出错: {str(e)}")
            return False

    def update_site(self):
        """更新网站主函数"""
        try:
            # 清理旧的临时目录
            if os.path.exists(self.work_dir):
                shutil.rmtree(self.work_dir)

            # 尝试下载
            if not self.download_branch(self.repo_url):
                print("直接下载失败，尝试使用代理...")
                if not self.download_branch(self.proxy_url):
                    raise Exception("下载分支源码失败")
                print("使用代理下载成功")
            else:
                print("直接下载成功")

            # 检查下载结果
            if not os.path.exists(self.work_dir) or not os.listdir(self.work_dir):
                raise Exception("克隆成功但目录为空")

            # 确保目标目录存在
            os.makedirs(self.target_dir, exist_ok=True)

            # 复制文件
            print("正在更新网站文件...")
            for item in os.listdir(self.work_dir):
                src_path = os.path.join(self.work_dir, item)
                dst_path = os.path.join(self.target_dir, item)
                if os.path.isdir(src_path):
                    shutil.copytree(src_path, dst_path, dirs_exist_ok=True)
                else:
                    shutil.copy2(src_path, dst_path)

            # 设置权限
            print("正在设置权限...")
            subprocess.run(["chown", "-R", "1000:1000", self.target_dir], check=True)
            subprocess.run(["chmod", "-R", "644", self.target_dir], check=True)
            subprocess.run(
                [
                    "find",
                    self.target_dir,
                    "-type",
                    "d",
                    "-exec",
                    "chmod",
                    "755",
                    "{}",
                    ";",
                ],
                check=True,
            )

            # 清理
            print("正在清理临时文件...")
            shutil.rmtree(self.work_dir)

            # 发送成功通知
            self.send_dingtalk_message(True)
            print("更新完成！")

        except Exception as e:
            error_msg = str(e)
            print(f"错误: {error_msg}")
            self.send_dingtalk_message(False, error_msg)
            # 确保清理临时文件
            if os.path.exists(self.work_dir):
                shutil.rmtree(self.work_dir)
            sys.exit(1)


if __name__ == "__main__":
    updater = SiteUpdater()
    updater.update_site()
