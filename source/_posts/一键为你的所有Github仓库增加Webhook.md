---
title: 一键为你的所有Github仓库增加/删除指定Webhook
tags:
  - GitHub
  - Webhook
  - Python脚本
  - 自动化
  - 开发工具
categories:
  - 技术教程
  - Github
abbrlink: "697195e9"
date: 2024-04-14 20:10:38
---

GitHub 提供了 Webhooks 功能，允许开发者在仓库发生特定事件时接收 HTTP 请求通知。如果你有大量的 GitHub 仓库，并希望为它们统一添加 Webhook，手动操作将是一项繁琐的任务。本文介绍了如何利用 Python 脚本实现一键为所有 GitHub 仓库添加 Webhook，以及如何一键删除这些 Webhook。

### 1. 准备工作

在开始之前，你需要确保以下准备工作已完成：

- **获取 GitHub Access Token**：你需要拥有一个具有足够权限的 GitHub 帐户，并生成一个 Access Token，用于通过 API 访问你的仓库。注意保管好你的 Access Token，不要泄露给他人。
- **准备 Webhook 地址**：你需要准备一个用于接收 Webhook 通知的 URL 地址，可以是你自己搭建的服务器或者第三方服务。

### 2. 添加 Webhook 的 Python 脚本

下面是一个 Python 脚本，可以一键为你的所有 GitHub 仓库添加 Webhook：

```python
import requests
import json

def create_webhook(repo_name, webhook_url, access_token):
    # 构建请求头
    headers = {
        "Authorization": f"token {access_token}",
        "Accept": "application/vnd.github.v3+json",
    }
    # 构建 Webhook 数据
    data = {
        "name": "web",
        "active": True,
        "events": ["*"],
        "config": {"url": webhook_url, "content_type": "json"},
    }
    # 发送 POST 请求创建 Webhook
    response = requests.post(
        f"https://api.github.com/repos/{repo_name}/hooks",
        headers=headers,
        data=json.dumps(data),
    )
    # 处理响应
    if response.status_code == 201:
        print(f"成功为 {repo_name} 创建 Webhook")
    else:
        print(f"无法为 {repo_name} 创建 Webhook。状态码: {response.status_code}")
        print(response.text)

def main():
    # 填写你的 Access Token 和 Webhook 地址
    access_token = "你的access_token"
    webhook_url = "你的Webhook地址"

    # 初始化分页参数
    page = 1
    per_page = 30  # 每页多少个仓库，根据实际情况调整

    while True:
        # 获取当前页的仓库信息
        response = requests.get(
            "https://api.github.com/user/repos",
            headers={"Authorization": f"token {access_token}"},
            params={"per_page": per_page, "page": page},
        )
        if response.status_code == 200:
            repos = response.json()
            if not repos:  # 如果当前页没有仓库信息，说明已经获取完所有仓库
                break
            for repo in repos:
                repo_name = repo["full_name"]
                create_webhook(repo_name, webhook_url, access_token)
            page += 1
        else:
            print(f"无法获取仓库列表。状态码: {response.status_code}")
            print(response.text)
            break

if __name__ == "__main__":
    main()
```

### 3. 删除 Webhook 的 Python 脚本

如果需要删除已添加的 Webhook，可以使用以下 Python 脚本：

```python
import requests
import json
import time  # 导入时间模块

def delete_webhook(repo_name, webhook_url, access_token):
    headers = {
        "Authorization": f"token {access_token}",
        "Accept": "application/vnd.github.v3+json",
    }

    # 获取指定仓库的 Webhooks
    response = requests.get(
        f"https://api.github.com/repos/{repo_name}/hooks",
        headers=headers,
    )
    if response.status_code == 200:
        webhooks = response.json()
        for webhook in webhooks:
            if webhook["config"]["url"] == webhook_url:
                # 删除指定 Webhook
                response_delete = requests.delete(
                    f"https://api.github.com/repos/{repo_name}/hooks/{webhook['id']}",
                    headers=headers,
                )
                if response_delete.status_code == 204:
                    print(f"成功删除 {repo_name} 的指定 Webhook")
                else:
                    print(
                        f"无法删除 {repo_name} 的指定 Webhook。状态码: {response_delete.status_code}"
                    )
                    print(response_delete.text)
                break
        else:
            print(f"{repo_name} 中未找到指定的 Webhook")
    else:
        print(f"无法获取 {repo_name} 的 Webhooks。状态码: {response.status_code}")
        print(response.text)

    # 添加延迟，以减慢请求频率
    time.sleep(2)  # 等待2秒钟，防止请求过于频繁

def delete_all_webhooks(webhook_url, access_token):
    page = 1
    per_page = 30  # 根据实际情况调整每页的数量

    while True:
        # 获取当前页的仓库信息
        response = requests.get(
            "https://api.github.com/user/repos",
            headers={"Authorization": f"token {access_token}"},
            params={"per_page": per_page, "page": page},
        )
        if response.status_code == 200:
            repos = response.json()
            if not repos:  # 如果当前页没有仓库信息，说明已经获取完所有仓库
                break

            for repo in repos:
                repo_name = repo["full_name"]
                delete_webhook(repo_name, webhook_url, access_token)
            page += 1
        else:
            print(f"无法获取仓库列表。状态码: {response.status_code}")
            print(response.text)
            break

if __name__ == "__main__":
    # 填写你的 Access Token 和 Webhook 地址
    access_token = "你的access_token"
    webhook_url = "你的Webhook地址"

    delete_all_webhooks(webhook_url, access_token)
```

### 注意事项和使用须知

- **Access Token 安全性**：请妥善保管你的 Access Token，不要泄露给他人，因为它具有对你的 GitHub 仓库进行操作的权限。
- **网络请求频率**：GitHub 的 API 有请求频率限制，过

于频繁的请求可能会被拒绝。为了避免这种情况，建议在脚本中添加适当的延迟，以减缓请求频率。

- **脚本参数修改**：在使用脚本之前，你需要根据自己的情况修改脚本中的 Access Token 和 Webhook 地址参数。
- **异常处理**：脚本中包含了部分异常处理，但仍有可能因为网络或其他原因导致请求失败，建议在实际使用中注意查看日志，及时处理异常情况。

### 免责声明

本文所提供的脚本仅供参考和学习之用，使用者应对其在实际生产环境中可能产生的任何后果负全部责任。在使用之前，请务必仔细阅读并理解 GitHub 的 API 使用条款和隐私政策。
