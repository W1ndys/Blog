#!/usr/bin/env python3
import os
import sys
import argparse
import requests
import json
from datetime import datetime


class SiteUpdater:
    def __init__(self):
        # 设置输出无缓冲
        sys.stdout = os.fdopen(sys.stdout.fileno(), "w", buffering=1)
        sys.stderr = os.fdopen(sys.stderr.fileno(), "w", buffering=1)

        self.webhook = "https://oapi.dingtalk.com/robot/send?access_token=002f008b27dc5656fc58c98c60492fea21662bca977b98a75d6cc8e693af5803"
        self.timeout = 10

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
    parser = argparse.ArgumentParser()
    parser.add_argument("--status", choices=["success", "error"], required=True)
    parser.add_argument("--message", default=None)
    args = parser.parse_args()

    updater = SiteUpdater()
    updater.send_dingtalk_message(
        is_success=(args.status == "success"), error_msg=args.message
    )
