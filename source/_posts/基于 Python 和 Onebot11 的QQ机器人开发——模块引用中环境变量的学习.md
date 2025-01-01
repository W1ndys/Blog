---
title: 基于 Python 和 Onebot11 的QQ机器人开发——模块引用中环境变量的学习
tags:
  - QQbot
  - QQ机器人
  - Python
  - NapCatQQ
categories:
  - QQbot
cover: https://vip.helloimg.com/i/2024/08/05/66b06a6b8b0c2.jpg
abbrlink: 55d6cfbc
date: 2024-08-04 16:47:17
---

先看一个例子

假设文件结构如下

```
project/
│
├── app/
│   ├── scripts/
│   │   ├── GroupManager/
│   │   │   ├── main.py
│   │   │   ├── banned_words.py
│   │   │   ├── group_status.py
│   │   │   ├── invite_chain.py
│   │   │   ├── welcome_farewell.py
│   │   │   ├── group_management.py
│   ├── api/
│   ├── config.py

```

代码如下

```python
# app/scripts/GroupManager/main.py
import logging
import re
import os
import sys

sys.path.append(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
)

from app.scripts.GroupManager.banned_words import *
from app.scripts.GroupManager.group_status import *
from app.scripts.GroupManager.invite_chain import *
from app.scripts.GroupManager.welcome_farewell import *
from app.scripts.GroupManager.group_management import *


from app.api import *
from app.config import owner_id


DATA_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data")
```

解释一下下面这段代码

```python
sys.path.append(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
)
```

这段代码的作用是将一个目录路径添加到 Python 的模块搜索路径中。具体来说，它通过多次调用`os.path.dirname`函数，逐级向上查找目录，最终找到项目的根目录，并将其添加到`sys.path`中。这样，Python 在导入模块时，就可以从这个根目录开始搜索，从而找到项目中的模块。

在这里是首先获取当前文件的绝对路径，然后获取其上级目录，再获取上级目录，最后获取上级目录，然后将这个目录添加到 Python 的模块搜索路径中。获取了三层路径，最后把路径`project/app`添加到 sys.path 中。如此就可以通过绝对路径导入模块。例如`from app.scripts.GroupManager.banned_words import *`

下面再解释一下下面的代码

```
DATA_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data")
```

这里是获取当前文件的绝对路径，然后获取其上级目录，然后将`data`目录添加到这个路径中，然后赋值给`DATA_DIR`。
