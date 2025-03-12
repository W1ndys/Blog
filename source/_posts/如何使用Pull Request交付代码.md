---
title: '如何使用Pull Request交付代码'
tags: []
categories: []
date: 2025-03-12 15:22:21
---

# 如何使用 Pull Request 交付代码

## 前排提醒

国内环境对 Github 的连接稳定性比较差，能否连上比较看运气，推荐开魔法进行连接

可自行使用 [watt toolkit](https://steampp.net/download#/)（免费） 进行加速或使用 [机场](https://sakura-cat3.com/register?code=Fo7cS2WA)（付费）

## 准备工作

> 这里以 [W1ndys/QFNUCyberWiki: QFNUCyberWiki](https://github.com/W1ndys/QFNUCyberWiki) 为例，放在其他仓库或以后工作，自己写项目，参与项目都适用
>

### 进入目标页面

fork 仓库

![image-20250312145457645](https://pica.zhimg.com/80/v2-91204b6e51b1db7dc8d2affb818dbfe2.png)

选择一个 owner（所有者），仓库名称和描述默认即可，也可以自定义，点击 `create fork` 进行创建

![image-20250312145529182](https://pica.zhimg.com/80/v2-ee8b6e675dfcf0774b70de81926b6fb7.png)

稍等片刻将会创建一个 fork 副本

![image-20250312145708403](https://pica.zhimg.com/80/v2-1a346ce5dd416700a77f70c977c112be.png)

![image-20250312145713449](https://pica.zhimg.com/80/v2-5ec596374dd50eb6b1952bfcd57b4782.png)

### 同步仓库

很多时候，主仓库一般会有我们 fork 之后的推送内容，这时候需要先同步一下主仓库的提交记录，才能进行修改，否则容易导致代码冲突，造成比较麻烦的后果

点击 sync fork 之后会出现一个下拉菜单，点击绿色的更新分支按钮即可同步仓库

**注意：此处更新分支，如果本地修改内容和原来的内容无合并冲突的话是无任何提醒的，如果合并失败，则需要放弃你的本地修改，同步为主仓库的提交记录，为了避免数据丢失，请一定要备份好你的修改内容，便于后面同步后的修改**

![image-20250312150659348](https://pica.zhimg.com/80/v2-ac673a9d0ba8ac49f528f547e5f9be8d.png)

### 修改内容

> 这里以修改 README 文件为例讲解，修改其他文件同理

进入到目标文件的页面，点编辑按钮进行编辑，如果需要进行大批量操作或借助其它工具可以下载到本地编辑，编辑好之后再复制到这里进行修改



![image-20250312145925284](https://pica.zhimg.com/80/v2-07ad17c95f86ad403fc22f17dea73128.png)

下面进行修改内容

![image-20250312150047951](https://pica.zhimg.com/80/v2-82866d60596ac46a6366770a45799ebc.png)

修改完内容之后，点击右上角绿色按钮（commit changes）（此处使用快捷键 Ctrl+S 具有同样的效果）

![image-20250312150220289](https://pica.zhimg.com/80/v2-cd82ceba28b257cf3a0848ee27e530c8.png)

他会让你填写一些内容

上面是你的提交信息，用于说明你修改了什么

下面是额外的描述，用于详细说明修改了什么，如果修改内容较少，此处可以省略不填

填完之后再次点击绿色按钮进行保存

![image-20250312150333683](https://pica.zhimg.com/80/v2-6fb79460c7a97c2b527e31ee2489676d.png)

如下图已保存成功

![image-20250312150343742](https://pica.zhimg.com/80/v2-6a1ecafe15db9e2c4af5fee8dd7fa35f.png)

## 进行 Pull Request

经过上面操作之后，我们已经把我们自己 fork 的内容进行了修改，下面进行提交 Pull Request，即把我们修改的内容发给仓库所有者，让所有者进行合并代码

点击 contribute，点击 open Pull Request 打开拉取请求

![image-20250312150913689](https://pica.zhimg.com/80/v2-a327f13172f151db446da63d65ffa4f9.png)

接下来将填写修改的内容，和之前的修改内容一样，上面是修改了什么，下面是详细的描述，这么写的目的是告诉仓库的所有者你做了什么修改，title 必填，描述选填，填完之后点击下方绿色的按钮创建一个 Pull Request

![image-20250312150949666](https://pica.zhimg.com/80/v2-2f0123f36b1a2a3d3a12d355d2a15901.png)

至此，你已经成功创建了一个 Pull Request，等待仓库所有者检查代码并合并即可

![image-20250312151158033](https://pica.zhimg.com/80/v2-b18c954bcc210514b12c587049fc185f.png)
