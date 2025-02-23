---
title: 扔掉你的watt toolikt！使用ssh拉取推送Github代码~
tags: []
categories: []
abbrlink: 4561bfdb
date: 2025-01-28 14:16:41
---

## 前言

作者在 Github 拉取代码推送代码的时候，一直使用的是 watt toolikt，在昨天尝试给服务器挂代理的时候，配置了 ssh 代理，可以实现仅需要代理 ssh 即可正常拉取推送 Github 代码，所以作者决定使用 ssh 拉取推送 Github 代码。

此外，作者在上一篇文章中介绍了 ssh 代理脚本，请移步[基于 Ed25519 算法的配置 Github SSH 的 shell 脚本 | W1ndys 小屋](/posts/65dfe81d.html)

### 生成秘钥

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

生成一个 `id_ed25519` 和 `id_ed25519.pub` 文件，将 `id_ed25519.pub` 文件的内容添加到 Github 的 SSH 密钥中。

### 配置 ssh 代理

在 `~/.ssh/config` 文件中添加以下内容：

```txt
Host github.com
    Hostname ssh.github.com
    Port 443
    User git
```

### 测试

```bash
ssh -T git@github.com
```

如果配置成功，会看到以下内容：

```txt
You've successfully authenticated, but GitHub does not provide shell access.
```

### 使用

之后挂上魔法就可以使用 ssh 拉取推送 Github 代码了。无需依赖 watt toolikt
