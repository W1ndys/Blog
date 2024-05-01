---
title: 记一次Github actions的学习
tags:
  - ChatGPT
  - Github
categories:
  - 技术教程
  - Github
cover: "https://miro.medium.com/v2/resize:fit:720/format:webp/0*YheSSavGXXmi-Md0.png"
abbrlink: dce14753
date: 2024-04-29 17:34:12
---

## 前言

事情是怎么一回事呢，一直以来，我的 Easy-QFNU 的日期更新因为插件不适配，导致日期我一直没用，就自己手搓的日期编辑，硬解码，一开始是手动编辑，后来感觉效率太低了，就搓了个 Python 脚本来实现批量更新，但是后来又觉得不够灵活，就想着用 Github actions 来实现自动化执行脚本来更新，正好看到了探姬师傅的 Hello-CTF 的 Github 仓库里也用了 Github actions，就想着也试试。

前前后后搞了十多天吧，在这期间，遇到了各种各样的奇奇怪怪的 bug，最终解决，能正常运行的时候，我欣喜若狂，我都不知道我有多高兴，从来没这么高兴过。

## 结局

虽然最后给社区分享了一下，社区维护人员给了我一种更好的解决办法，可以说是更加完美平替了，采用了他的方法，这十天也就是说白白浪费了

其实也不能算白白浪费吧，毕竟对 Github actions 更加熟悉了一些，学到了一些东西，也算是对自己能力的一种考验吧。

这份脚本我也留档了，有需要的可以参考一下，希望能帮到你。

## 脚本及其教程

脚本及其教程在这里：[关于 Mkdocs-material 日期显示不准确的一种平替方法](https://blog.w1ndys.top/posts/512a6b20)
