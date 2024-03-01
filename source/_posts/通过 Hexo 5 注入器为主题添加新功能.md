---
date: 2023-09-13 23:35
title: 通过 Hexo 5 注入器为主题添加新功能
tags: hexo
categories:
  - hexo
  - 用法
abbrlink: de3182ad
---

## Hexo 注入器

[Hexo 注入器](https://hexo.io/zh-cn/api/injector.html)是 Hexo 5 版本自身加入的一项新功能，所以在所有 Hexo 主题都是支持这个功能的。

该注入器可以将 HTML 片段注入生成页面的 `<head>` 和 `<body>` 节点中。

编写注入代码，需要在博客的根目录下创建 `scripts` 文件夹，然后在里面任意命名创建一个 js 文件即可。

例如创建一个 `/blog/scripts/example.js`，内容为：

```
hexo.extend.injector.register('body_end', '<script src="/jquery.js"></script>', 'default');
```

上述代码会在生成的页面 `</body>` 注入加载 `jquery.js` 的代码。

`register` 函数可接受三个参数，第一个参数是代码片段注入的位置，接受以下值：
\- `head_begin`: 注入在 `<head>` 之后（默认）
\- `head_end`: 注入在 `</head>` 之前
\- `body_begin`: 注入在 `<body>` 之后
\- `body_end`: 注入在 `</body>` 之前

第二个参数是注入的片段，可以是字符串，也可以是一个返回值为字符串的函数。

第三个参数是注入的页面类型，接受以下值：
\- `default`: 注入到每个页面（默认值）
\- `home`: 只注入到主页（`is_home()` 为 `true` 的页面）
\- `post`: 只注入到文章页面（`is_post()` 为 `true` 的页面）
\- `page`: 只注入到独立页面（`is_page()` 为 `true` 的页面）
\- `archive`: 只注入到归档页面（`is_archive()` 为 `true` 的页面）
\- `category`: 只注入到分类页面（`is_category()` 为 `true` 的页面）
\- `tag`: 只注入到标签页面（`is_tag()` 为 `true` 的页面）
\- 或是其他自定义 layout 名称，例如在Fluid 主题中 `about` 对应关于页、`links` 对应友联页

## 实际案例

在实际使用中，建议将 js 代码独立成为 js 文件，存放在博客的 `source` 目录下，然后在 `scripts` 里通过一个包含 injector 的 js 文件统一引入。

例如创建一个 `/source/js/custom.js`，里面包含初始化的代码，然后在 `/scripts/injector.js` 里写入：

```
hexo.extend.injector.register('body_end', `
  <script src="/js/custom.js"></script>
`)
```

以下案例都采用类似的形式，不再赘述。

### APlayer 音乐播放器

```
hexo.extend.injector.register('body_end', `
  <div id="aplayer"></div>
  <link defer rel="stylesheet" href="https://cdn.staticfile.org/aplayer/1.10.1/APlayer.min.css" />
  <script src="https://cdn.staticfile.org/aplayer/1.10.1/APlayer.min.js"></script>
  <script defer src="/js/aplayer.js"></script>
`);
```

```
!(function() {
  var oldLoadAp = window.onload;
  window.onload = function () {
    oldLoadAp && oldLoadAp();

    new APlayer({
      container: document.getElementById('aplayer'),
      fixed: true,
      autoplay: false,
      loop: 'all',
      order: 'random',
      theme: '#b7daff',
      preload: 'none',
      audio: [
        {
          name: 'song1',
          artist: 'artist1',
          url: '/songs/song1.mp3',
          cover: '/img/cover.jpg'
        }
      ]
    });
  }
})();
```

更多参数详见 [Aplayer 文档](https://aplayer.js.org/#/zh-Hans/?id=参数)。

### DaoVoice 聊天插件

先在 [https://daovoice.io](https://daovoice.io/) 注册一个账号，按其中的引导获得 appId，然后添加如下代码：

```
hexo.extend.injector.register('body_end', `
  <script defer src="/js/daovoice.js"></script>
`);
```

```
!(function() {
  var appId = '这里填上注册后账号的 appId';

  (function (i, s, o, g, r, a, m) {  
    i['DaoVoiceObject'] = r;
    i[r] = i[r] ||
      function () {
        (i[r].q = i[r].q || []).push(arguments);
      };
    i[r].l = 1 * new Date();
    a = s.createElement(o);
    m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    a.charset = 'utf-8';
    m.parentNode.insertBefore(a, m);
  })(window, document, 'script', ('https:' === document.location.protocol ? 'https:' : 'http:') + '//widget.daovoice.io/widget/' + appId + '.js', 'daovoice');
  daovoice('init', {
    app_id: appId,
  });
  daovoice('update');
})();
```



### 文章时效性提示

技术性文章往往存在时效性的问题，比如某些文章会介绍一些临时解决方案，但随着时间推移可能已经失效了。我们可以通过判断发布时间（即文章设置的 `date`）与当前时间的间隔，来为文章开头插入一条提示。

代码效果如下所示：

> 文章时效性提示
>
> 这是一篇发布于 263 天前的文章，部分信息可能已发生改变，请注意甄别。



```
(function() {
  var times = document.getElementsByTagName('time');
  if (times.length === 0) { return; }
  var posts = document.getElementsByClassName('post-content');
  if (posts.length === 0) { return; }

  var pubTime = new Date(times[0].dateTime);  /* 文章发布时间戳 */
  var now = Date.now()  /* 当前时间戳 */
  var interval = parseInt(now - pubTime)
  /* 发布时间超过指定时间（毫秒） */
  if (interval > 3600*24*30*1000){
    var days = parseInt(interval / 86400000)
    posts[0].innerHTML = '<div class="note note-warning" style="font-size:0.9rem"><p>' +
      '<div class="h6">文章时效性提示</div><p>这是一篇发布于 ' + days + ' 天前的文章，部分信息可能已发生改变，请注意甄别。' +
      '</p></p></div>' + posts[0].innerHTML;
  }
})();
```