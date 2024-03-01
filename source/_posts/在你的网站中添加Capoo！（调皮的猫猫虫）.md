---
title: 在你的网站中添加Capoo！（调皮的猫猫虫）
tags:
  - Hexo
  - Hexo美化
  - butterfly美化
categories:
  - Hexo
  - Hexo美化
abbrlink: 3a360f71
date: 2024-02-11 21:49:37
---

> 本教程基于 https://docs.api.ecylt.top/kemomimi-jiang#/ 进行魔改

# Capoo

## 效果展示

![recording](../img/Capoo/recording.gif)

## 创建 css

复制下面代码，创建一个名为 `Capoo.css` 的文件，代码以及参数均已加注释

```css
#follow-img {
    pointer-events: none; /* 禁止图像接受鼠标事件 */
    position: absolute; /* 设置图像的定位方式为绝对定位，相对于其最近的具有定位属性的父元素进行定位 */
    transition: transform 0.5s, top 0.5s, left 0.5s; /* 定义了图像在发生变化时的过渡效果，其中 transform 表示图像的旋转效果，top 表示图像的垂直移动效果，left 表示图像的水平移动效果，0.5s 表示过渡时间为0.5秒 */
}
```

## 创建 js

复制下面代码，创建一个名为 `Capoo.js` 的文件

```js
const img = document.getElementById('follow-img'); // 获取图像元素

let mouseX = 0, mouseY = 0; // 鼠标的初始位置
let imgX = 0, imgY = 0; // 图像的初始位置
let speed = 0.05; // 图像移动的速度
let rotateDeg = 0; // 图像的旋转角度

// 缩小图片大小
img.style.width = '100px'; // 设置图像的宽度为100像素
img.style.height = 'auto'; // 保持宽高比

function animate() {
    let dx = mouseX - imgX; // 计算鼠标在水平方向上的位移
    let dy = mouseY - imgY; // 计算鼠标在垂直方向上的位移
    let angle = Math.atan2(dy, dx); // 计算鼠标相对于图像的角度
    rotateDeg = angle * (180 / Math.PI) + 90; // 将弧度转换为角度，并加上90度作为旋转角度

    imgX += dx * speed; // 更新图像的水平位置
    imgY += dy * speed; // 更新图像的垂直位置

    img.style.left = `${imgX - img.width / 2}px`; // 设置图像相对于左边界的位置
    img.style.top = `${imgY - img.height / 2}px`; // 设置图像相对于上边界的位置
    img.style.transform = `rotate(${rotateDeg}deg)`; // 应用旋转角度

    requestAnimationFrame(animate); // 循环调用动画函数，实现动画效果
}

document.addEventListener('mousemove', (e) => {
    mouseX = e.pageX; // 更新鼠标的水平位置
    mouseY = e.pageY; // 更新鼠标的垂直位置
});

// 添加对移动端的判断
function isMobile() {
    return window.innerWidth <= 768 && window.innerHeight <= 1024; // 判断是否为移动端
}

if (!isMobile()) { // 如果不是移动端
    animate(); // 调用动画函数
} else { // 如果是移动端
    img.style.display = 'none'; // 隐藏图像
}
```

## 创建 GIF

保存这个 GIF 图片到你的 source 合适的位置

此处不限类型，只要是图片都可以，jpg，png 等

![](../img/Capoo/Capoo.gif)

## 引入

在你的主题中引入这三个文件，比如我的

注意，`css` 文件一定要引入在 `head` 前面，另外两个任意都行，`head` 或者 `body` 都行

```
- <link rel="stylesheet" type="text/css" href="/css/Capoo.css">
- <img id="follow-img" src="../img/Capoo/Capoo.gif"/>
- <script src="/js/Capoo.js"></script>
```

同理你也可以把图片文件换成自己喜欢的小图片

