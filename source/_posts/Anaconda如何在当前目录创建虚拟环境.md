---
title: Anaconda如何在当前目录创建虚拟环境
tags:
  - Python
  - Anaconda
  - env
categories:
  - Python
  - Anaconda
  - env
abbrlink: c85e665e
date: 2024-02-25 00:00:50
---

# Anaconda如何在当前目录创建虚拟环境



要在当前文件夹中使用 Anaconda 创建虚拟环境，你需要执行以下步骤：

1. 打开命令行界面（例如，在 Windows 上使用命令提示符或在 macOS/Linux 上使用终端）。

2. 导航到你想要创建虚拟环境的文件夹。你可以使用 `cd` 命令（change directory）来实现这一点。例如：

   ```cmd
   cd path/to/your/folder
   ```

3. 一旦你在正确的文件夹中，使用以下命令创建虚拟环境：

   ```cmd
   conda create --prefix ./myenv python=3.8
   ```
   这将在当前文件夹中创建一个名为 `myenv` 的虚拟环境，并将其与 Python 3.8 关联起来。你可以将 `myenv` 替换为你想要的任何环境名称。

4. 激活虚拟环境。在 Windows 上，使用：

   ```cmd
   .\myenv\Scripts\activate
   ```
   在 macOS/Linux 上，使用：

   ```cmd
   source myenv/bin/activate
   ```

5. 当你完成工作后，可以使用 `deactivate` 命令来退出虚拟环境。

这样，你就可以在当前文件夹中成功创建并使用 Anaconda 虚拟环境了。
