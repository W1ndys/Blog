---
title: Python中shutil和os库的区别
tags:
  - Python
categories:
  - Python
abbrlink: c846834c
date: 2025-05-18 20:38:15
---

在 Python 中，`shutil` 和 `os` 都是处理文件和目录操作的核心库，但它们的职责和适用场景有所不同。以下是它们的区别及应用场景的总结：

---

### **`os` 模块**

**定位**：提供与操作系统交互的低级接口，尤其是文件系统和进程管理。
**适用场景**：

- **路径操作**：
  - 使用 `os.path` 处理路径拼接（`join`）、拆分（`split`）、检查存在性（`exists`）等。
  ```python
  import os
  path = os.path.join("dir", "file.txt")  # 跨平台路径拼接
  ```
- **文件和目录的基本操作**：
  - 创建/删除目录（`mkdir`, `rmdir`）、删除文件（`remove`）、重命名（`rename`）。
  - 列出目录内容（`listdir`）、获取文件属性（`stat`）。
- **底层系统调用**：
  - 修改文件权限（`chmod`）、切换工作目录（`chdir`）、执行系统命令（`system`）。

**局限**：

- 不直接支持高级文件操作（如复制目录树）。

---

### **`shutil` 模块**

**定位**：提供高级文件操作（尤其是复制、移动和归档），是对 `os` 的补充。
**适用场景**：

- **复制/移动文件或目录**：
  - 复制文件（`copy2` 保留元数据）、复制目录树（`copytree`）。
  - 移动文件/目录（`move`，跨设备时自动处理复制+删除）。
  ```python
  import shutil
  shutil.copy2("source.txt", "dest.txt")  # 复制文件并保留元数据
  shutil.copytree("src_dir", "dst_dir")   # 递归复制目录
  ```
- **归档和压缩**：
  - 创建/解压 ZIP、TAR 等归档文件（`make_archive`, `unpack_archive`）。
- **清理目录**：
  - 递归删除目录及其内容（`rmtree`，比 `os.rmdir` 更强大）。

**局限**：

- 不处理路径操作或底层系统调用（依赖 `os` 模块）。

---

### **关键区别总结**

| **功能**                | **`os` 模块**         | **`shutil` 模块**       |
| ----------------------- | --------------------- | ----------------------- |
| 路径操作                | ✅ `os.path` 子模块   | ❌ 需依赖 `os.path`     |
| 创建/删除目录           | ✅ `mkdir`, `rmdir`   | ✅ `rmtree`（递归删除） |
| 删除文件                | ✅ `remove`           | ❌                      |
| 复制文件                | ❌                    | ✅ `copy`, `copy2`      |
| 复制目录                | ❌                    | ✅ `copytree`           |
| 移动文件/目录           | ✅ `rename`（有限）   | ✅ `move`（更安全）     |
| 归档压缩                | ❌                    | ✅ `make_archive`       |
| 系统级操作（权限/环境） | ✅ `chmod`, `environ` | ❌                      |

---

### **如何选择？**

- **用 `os` 时**：
  - 需要操作路径、处理单个文件/目录、执行底层系统调用。
- **用 `shutil` 时**：
  - 需要递归操作（如复制目录）、归档文件或简化文件移动/复制逻辑。

**常见组合**：

```python
import os
import shutil

# 示例：复制目录并过滤文件
src = "project"
dst = "backup_project"
if os.path.exists(dst):
    shutil.rmtree(dst)  # 清理目标目录
shutil.copytree(src, dst)
```

---

### **5. 总结**

- **`os`** 是基础工具库，侧重系统和路径的低级操作。
- **`shutil`** 是高级文件操作库，简化复杂任务（如递归复制）。
  根据任务复杂度选择合适的工具，二者常协同使用。
