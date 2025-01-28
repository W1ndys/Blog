#!/usr/bin/env python3
import os
import sys
import shutil
import subprocess
import requests
import json
from datetime import datetime


class SiteUpdater:
    def __init__(self):
        # 设置输出无缓冲
        sys.stdout = os.fdopen(sys.stdout.fileno(), "w", buffering=1)
        sys.stderr = os.fdopen(sys.stderr.fileno(), "w", buffering=1)

        # 基础配置
        self.work_dir = "/tmp/blog-temp"
        self.target_dir = (
            "/opt/1panel/apps/openresty/openresty/www/sites/blog.w1ndys.top/index"
        )
        self.repo_url = "git@github.com:W1ndys/Blog.git"  # 修改为 SSH URL
        self.webhook = "https://oapi.dingtalk.com/robot/send?access_token=002f008b27dc5656fc58c98c60492fea21662bca977b98a75d6cc8e693af5803"
        self.timeout = 10

    def clone_repository(self):
        """使用 SSH 克隆仓库"""
        print("正在克隆仓库...")
        try:
            # 确保工作目录存在且为空
            if os.path.exists(self.work_dir):
                shutil.rmtree(self.work_dir)
            os.makedirs(self.work_dir, exist_ok=True)

            # 克隆特定分支，使用 --depth 1 只获取最新版本
            clone_command = (
                f"git clone --depth 1 -b gh-pages {self.repo_url} {self.work_dir}"
            )
            result = subprocess.run(
                clone_command, shell=True, capture_output=True, text=True
            )

            if result.returncode != 0:
                raise Exception(f"克隆失败: {result.stderr}")

            return True

        except Exception as e:
            print(f"克隆过程出错: {str(e)}")
            return False

    def update_site(self):
        """更新网站主函数"""
        try:
            # 克隆仓库
            if not self.clone_repository():
                raise Exception("克隆仓库失败")
            print("克隆成功")

            # 检查克隆结果
            if not os.path.exists(self.work_dir) or not os.listdir(self.work_dir):
                raise Exception("克隆成功但目录为空")

            # 确保目标目录存在
            os.makedirs(self.target_dir, exist_ok=True)

            # 复制文件
            print("正在更新网站文件...")
            os.system(f"cp -rf {self.work_dir}/* {self.target_dir}/")

            # 合并权限设置命令
            print("正在设置权限...")
            os.system(
                f"""
                chown -R 1000:1000 {self.target_dir} && \\
                chmod -R 644 {self.target_dir} && \\
                find {self.target_dir} -type d -exec chmod 755 {{}} \\;
            """
            )

            # 清理
            print("正在清理临时文件...")
            shutil.rmtree(self.work_dir)

            # 发送成功通知
            self.send_dingtalk_message(True)
            print("更新完成！")

            # 正常退出
            sys.exit(0)

        except Exception as e:
            error_msg = str(e)
            print(f"错误: {error_msg}")
            self.send_dingtalk_message(False, error_msg)
            # 确保清理临时文件
            if os.path.exists(self.work_dir):
                shutil.rmtree(self.work_dir)
            # 异常退出
            sys.exit(1)

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
                self.webhook,
                data=json.dumps(message),
                headers=headers,
                timeout=self.timeout,
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


if __name__ == "__main__":
    updater = SiteUpdater()
    updater.update_site()
