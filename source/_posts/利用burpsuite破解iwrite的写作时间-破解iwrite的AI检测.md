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

这边需要注意的是，千万不要用[谷歌翻译](https://translate.google.cn/)，因为谷歌翻译的能力太强了，他会很高水平的还原你的作文，导致你无法降低判断出 AI 生成的可能性。直接用[百度翻译](https://fanyi.baidu.com/)就可以了。

下面我以一篇ChatGPT生成的作文为例，来说明如何把“作文很有可能是 AI 生成的”改为“作文非常不可能是由 AI 生成的”。

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

### 翻译成英文

![翻译之后](../img/iwrite/PixPin_2024-04-16_23-50-49.png)

## 如何用 burpsuite 抓包破解 iwrite 的写作时间？

### 成品

![成品](../img/iwrite/image.png)

待编辑

时间戳转换工具：https://tool.lu/timestamp/
