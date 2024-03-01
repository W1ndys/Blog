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
