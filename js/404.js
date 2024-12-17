document.addEventListener('DOMContentLoaded', function () {
    var errorInfo = document.querySelector('.error-info');

    if (errorInfo) {
        var homepageLink = document.createElement('a');
        homepageLink.href = '/'; // 设置首页链接
        homepageLink.textContent = '返回首页'; // 设置链接文字

        errorInfo.appendChild(homepageLink);
    }
});
