---
title: 利用burpsuite破解iwrite的写作时间|破解iwrite的AI检测
tags:
  - 技术教程
  - iwrite
  - burpsuite
categories:
  - 技术教程
cover: "../img/iwrite/iwrite&bp.png"
abbrlink: 4d6a074b
date: 2024-04-16 22:02:30
---

## 如何把“作文很有可能是 AI 生成的”改为“作文非常不可能是由 AI 生成的”？

先说方法总结: “谷歌翻译 20 次”

这边需要注意的是,千万不要用[谷歌翻译](https://translate.google.cn/),因为谷歌翻译的能力太强了,他会很高水平的还原你的作文,导致你无法降低判断出 AI 生成的可能性。直接用[百度翻译](https://fanyi.baidu.com/)就可以了。

下面我以一篇 ChatGPT 生成的作文为例,来说明如何把“作文很有可能是 AI 生成的”改为“作文非常不可能是由 AI 生成的”。

### 原文

```
Embarking on a career journey after graduation is akin to stepping into a labyrinth of challenges. Primarily, the lack of experience poses a significant hurdle. Despite theoretical knowledge gained in academia, practical application often demands a different skill set altogether. Moreover, the competitive job market intensifies the pressure, leaving graduates grappling with self-doubt.

Financial constraints further exacerbate the situation. With student loans looming overhead and the need to establish oneself independently, the initial phase becomes financially taxing. Consequently, many find themselves compromising on their career aspirations, opting for any available opportunity to make ends meet.

Additionally, navigating the professional landscape demands adaptability and resilience. Rejections and setbacks are inevitable, testing one's perseverance and determination. Furthermore, striking a balance between personal and professional life adds to the complexity, often leading to burnout.

In conclusion, the transition from academia to the professional realm is fraught with multifaceted challenges. However, with perseverance, continuous learning, and a resilient mindset, graduates can overcome these obstacles and carve a fulfilling career path for themselves.
```

![原文](../img/iwrite/1713282497160.png)

### 翻译成日语

卒業後にプロの旅に出ると、挑戦に満ちた迷宮に足を踏み入れるようなものだ。まず、経験不足は重大な障害である。学界で理論知識を得ているにもかかわらず、実際の応用には全く異なる技能が必要になることが多い。また、競争の激しい就職市場は圧力を強め、卒業生を自己不信に陥れている。

財政規制はさらに情勢を悪化させた。学生ローンが目前に迫っていることや、独立起業の必要性に伴い、最初の段階では財政難になっている。そのため、多くの人は自分がキャリア志向に妥協し、生計を立てるために利用可能な機会を選んでいることに気づいた。

また、制御専門分野には適応性と靭性が必要です。拒否と挫折は避けられず、一人の根気と決心が試されている。また、個人生活と職業生活のバランスをとることで複雑さが増し、倦怠感を招くこともあります。

要するに、学界から専門分野への移行は多方面の挑戦に満ちている。しかし、根気と継続的な学習と強靭な心理状態によって、卒業生はこれらの障害を克服して、自分のために充実した職業の道を切り開くことができます。

### 翻译成英语

After graduating from a professional trip, it is like stepping into a challenging labyrinth. First, experience shortage is a serious obstacle. Despite theoretical knowledge in the academic world, real applications often require different skills. In addition, competitive job markets intensify pressure and undergraduate graduates.

Fiscal regulation worsened the situation. In the first stage, financial difficulties have been made as the student loan is close at hand and the need for independent entrepreneurship. So many people realized that they chose the opportunity to compromise their career orientation and make a living.

In addition, adaptability and toughness are necessary for the field of control. Refusal and failure are inevitable, and one's patience and determination are being tested. In addition, the balance of personal life and work life increases the complexity, and it sometimes causes fatigue.

In short, the transition from academic to professional is full of challenges. But with patience, continuous learning and tough psychological conditions, graduates can overcome these obstacles and open up a profitable career for themselves.

![翻译之后](../img/iwrite/PixPin_2024-04-16_23-50-49.png)

## 如何用 burpsuite 抓包破解 iwrite 的写作时间？

### 成品

![成品](../img/iwrite/image.png)

> 首先你需要两个工具
>
> 时间戳转换工具: https://tool.lu/timestamp/
>
> burpsuite: https://portswigger.net/burp/download (这里只提供正版不提供学习版)

### 步骤

1. 打开 burpsuite,点击菜单栏中的 `代理`,打开`内置浏览器`

2. 进入[iwrite 官网](https://iwrite.unipus.cn/login/),登录你的账号

3. 进入写作页面

   写上作文之后(其实可以直接复制,禁用 js 之后直接粘贴,怎么操作可以看我之前的[博客](/posts/9a26b151))

   一定要出现`自动保存`的提示,不然不会保存到服务器

   ![自动保存](../img/iwrite/PJ/image.png)

4. 打开拦截

   ![拦截](../img/iwrite/PJ/image-1.png)

5. 点提交作文

6. 查看请求包

   一开始这个不用管,都是些班级,任务,学生信息之类的东西

   ![这个不用管](../img/iwrite/PJ/image-2.png)

   把这个包`放行`

   ![放行请求包](../img/iwrite/PJ/image-3.png)

   下面这个继续放行

   ![继续放行](../img/iwrite/PJ/image-4.png)

7. 修改请求包

   到这里才是需要修改的东西,这里可以看到你写的作文题目和正文

   ![真正的请求包](../img/iwrite/PJ/image-5.png)

   我们需要修改的是时间戳,把它改成以前的时间,这样就能修改你的写作耗时

   ```json
   {
     "studentId": 908508079,
     "source": 0,
     "savePattern": 0,
     "taskId": 232395,
     "title": "你的作文题目", // 这里应该是你写的作文题目
     "article": "你的作文数据", // 这里应该是你写的作文正文
     "simpleArticle": "你的作文数据", // 这里应该是你写的作文正文
     "classId": 10155377, // 这里应该是你班级的 id
     "startTime": 1713331204412, //这可能是代表的开始写作时间，但实际测试中发现，这个数据无法被利用修改
     "words": 167, // 这里应该是你写的字数
     "autoSaveReturnStartTime": 1713331204413 // 这里是需要修改的时间戳,把他改成以前的时间
   }
   ```

   写作耗时的计算公式是：`现实的时间`-`autoSaveReturnStartTime`=`写作耗时`

   PS：这里的写作词数也可以改

   进入[时间戳转换工具](https://tool.lu/timestamp/)

   我现在的时间是 2024 年 4 月 17 日 13:30:28

   为了更明显一些我改成 2023 年 2023-04-17 13:30:00，对应的时间戳是 `1681709400000`

   单词数我改成 `999`

   修改之后放行

   ![放行修改后的请求包](../img/iwrite/PJ/image-6.png)

   继续放行

#### 二次修改

  
   ![继续提交](../img/iwrite/PJ/image-7.png)

   这里也要提交，跟之前一样，总共修改两次

   修改完之后继续发包

### 看成品

![成品](../img/iwrite/PJ/image-8.png)
