function getIP(json) {
    var ip = json.ip;
    var br = document.createElement('br'); // 创建一个换行元素
    var footerLink = document.createElement('a');
    // footerLink.href = 'https://blog.w1ndys.top/'; // 这里可以设置链接的目标，例如："https://www.example.com"
    footerLink.innerHTML = '您的IP：' + ip + " 请规范网络行为";
    var footerElement = document.querySelector('.footer_custom_text');
    footerElement.appendChild(br); // 将换行元素添加到 .footer_custom_text 元素内
    footerElement.appendChild(footerLink);
}

var script = document.createElement('script');
script.src = 'https://api.ipify.org?format=jsonp&callback=getIP';
document.head.appendChild(script);