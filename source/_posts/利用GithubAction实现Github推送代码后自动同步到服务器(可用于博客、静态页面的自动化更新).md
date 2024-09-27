---
title: 利用GithubAction实现Github推送代码后自动同步到服务器(可用于博客、静态页面的自动化更新)
tags:
  - GithubAction
  - 自动化部署
  - Hexo
categories:
  - 技术教程
  - Github
cover: >-
  https://picx.zhimg.com/70/v2-077dc9abad692effc0db50db4309a355_1440w.avis?source=172ae18b&biz_tag=Post
abbrlink: c0fcf8f3
date: 2024-09-27 15:30:21
---

## deploy.yml

新建工作流文件 `.github/workflows/deploy.yml`，这里我以 Hexo 的自动化部署为例。

```yml
name: Hexo Deploy

on:
  push:
    branches:
      - main
env:
  TZ: Asia/Shanghai

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout source
        uses: actions/checkout@v2
        with:
          ref: main

      - name: Setup Node.js
        uses: actions/setup-node@v1
        with:
          node-version: "20"

      - name: Setup Hexo
        env:
          ACTION_DEPLOY_KEY: ${{ secrets.DEPLOY_KEY }}
        run: |
          mkdir -p ~/.ssh/
          echo "$ACTION_DEPLOY_KEY" | tr -d '\r' > ~/.ssh/id_rsa
          chmod 700 ~/.ssh
          chmod 600 ~/.ssh/id_rsa
          ssh-keyscan github.com >> ~/.ssh/known_hosts
          ssh-keyscan gitee.com >> ~/.ssh/known_hosts
          git config --global user.email "w1ndys@outlook.com"
          git config --global user.name "W1ndys"
          git config --global init.defaultBranch main
          npm install hexo-cli -g
          npm install

      - name: Deploy
        run: |
          hexo clean
          hexo generate
          hexo deploy

      - name: ECS clone # 连接服务器并克隆
        uses: cross-the-world/ssh-pipeline@master
        env:
          WELCOME: "ssh pipeline"
        with:
          host: ${{ secrets.USER_HOST }} # 服务器的 IP 地址
          user: ${{ secrets.USER_NAME }} # 服务器的用户名
          pass: ${{ secrets.USER_PASS }} # 服务器的密码
          connect_timeout: 10s
          script:
            | # 连接服务器并克隆，进入目录并删除旧的文件，移动新的文件，删除.git并修改权限
            cd ${{ secrets.ECS_SITE }}
            git clone --depth 1 -b gh-pages https://ghp.ci/https://github.com/${{ secrets.GH_USERNAME }}/${{ secrets.GH_REPO }}.git
            rm -rf index
            mv ${{ secrets.GH_REPO }} index
            cd index
            rm -rf .git
            chown -R 1000:1000 .
```

### 工作流解释

这个 GitHub Actions 工作流文件 `deploy.yml` 主要用于在代码推送到 GitHub 仓库的 `main` 分支后，自动化部署 Hexo 博客，并将更新同步到服务器。以下是各个步骤的详细解释：

1. **工作流名称和触发条件**：

   - `name: Hexo Deploy`：定义工作流的名称。
   - `on: push: branches: - main`：当代码推送到 `main` 分支时触发工作流。

2. **环境变量**：

   - `env: TZ: Asia/Shanghai`：设置时区为上海时间。

3. **工作任务**：

   - `jobs: build: runs-on: ubuntu-latest`：定义一个名为 `build` 的任务，运行在最新的 Ubuntu 环境上。

4. **步骤**：

   - `steps:`：定义一系列步骤来执行任务。

   - **Checkout 源代码**：

     - `name: Checkout source`：使用 `actions/checkout@v2` 操作从 `main` 分支检出代码。

   - **设置 Node.js**：

     - `name: Setup Node.js`：使用 `actions/setup-node@v1` 操作设置 Node.js 环境，版本为 `20`。

   - **设置 Hexo**：

     - `name: Setup Hexo`：配置 Hexo 环境。
     - `env: ACTION_DEPLOY_KEY: ${{ secrets.DEPLOY_KEY }}`：使用 GitHub Secrets 中的 `DEPLOY_KEY`。
     - `run:`：执行一系列命令来配置 SSH 密钥、全局 Git 配置和安装 Hexo 及其依赖。

   - **部署 Hexo**：

     - `name: Deploy`：运行 Hexo 部署命令。
     - `run:`：执行 `hexo clean`、`hexo generate` 和 `hexo deploy` 命令来清理、生成和部署 Hexo 博客。

   - **连接服务器并克隆**（关键步骤）：
     - `name: ECS clone`：使用 `cross-the-world/ssh-pipeline@master` 操作连接服务器并克隆代码。
     - `env: WELCOME: "ssh pipeline"`：设置环境变量。
     - `with:`：提供服务器的 IP 地址、用户名和密码等信息。
     - `script:`：执行一系列命令来连接服务器、克隆仓库、删除旧文件、移动新文件、删除 `.git` 目录并修改权限。
     - `git clone --depth 1 -b gh-pages https://ghp.ci/https://github.com/${{ secrets.GH_USERNAME }}/${{ secrets.GH_REPO }}.git` 这一行是关键，通过克隆分支 `gh-pages` 来部署静态页面，并且只进行浅层克隆，节省了时间，其中可以根据自己的实际情况进行修改。

### 配置 Secrets

![v2-27d495be4c864da8c07582d4fa2b1b17_720w.png (720×349)](https://pic1.zhimg.com/80/v2-27d495be4c864da8c07582d4fa2b1b17_720w.png)

在仓库的 `Settings` -> `Secrets` 中添加以下 Secrets：

- `USER_HOST`：服务器的 IP 地址
- `USER_NAME`：服务器的登录用户名
- `USER_PASS`：服务器的登录密码
- `ECS_SITE`：服务器上 Hexo 博客（或其他静态文件）的目录
- `GH_USERNAME`：GitHub 用户名
- `GH_REPO`：GitHub 仓库名
- `DEPLOY_KEY`：用于连接服务器的 SSH 密钥

### 特点

- 使用 SSH 密钥连接服务器，避免了每次部署时输入密码的麻烦。
- 通过 GitHub Actions 实现自动化部署，提高了效率。
- 使用 `ghp.ci` 代理克隆，解决了大陆地区访问 GitHub 慢的问题，并且不需要使用国内 Gitee 等平台进行中转。
- 支持多种静态页面部署，如 Hexo、VuePress 等。
