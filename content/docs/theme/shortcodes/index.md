---
title: "自定义简码功能"
externalUrl: ""
summary: "添加说说、网易云音乐简码功能"
tags: ["shuortcode","artitalk","music"]
showReadingTime: false
comment: true
series: ["主题相关文档"]
series_order: 7
weight: 1
---


## 自定义简码
- 实现简码说说功能
- 实现简码网易云音乐功能



###  Artitalk 说说简码
- 请仔细阅读 [官方文档](https://artitalk.js.org/) 并创建一个说说应用。
- 在博客目录`layouts/shortcodes`下创建`artitalk.html`文件

```bash
mkdir layouts/shortcode

<script type="text/javascript" src="https://unpkg.com/artitalk"></script>
<!-- 存放说说的容器 -->
<div id="artitalk_main"></div>

<script>
new Artitalk({
    appId: "{{ .Get "appId" }}", 
    appKey: "{{ .Get "appKey" }}", 
    atEmoji: {
        weibo: "https://cdn.jsdelivr.net/gh/walinejs/emojis@1.0.0/weibo",
        bilibili: "https://cdn.jsdelivr.net/gh/walinejs/emojis@1.0.0/bilibili",
        qq: "https://cdn.jsdelivr.net/gh/walinejs/emojis@1.0.0/qq",
        baiyan: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/baiyan.png",
        bishi: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/bishi.png",
        bizui: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/bizui.png",
        chan: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/chan.png",
        daku: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/daku.png",
        dalao: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/dalao.png",
        dalian: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/dalian.png",
        dianzan: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/dianzan.png",
        doge: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/doge.png",
        facai: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/facai.png",
        fadai: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/fadai.png",
        fanu: "https://cdn.jsdelivr.net/gh/Artitalk/Artitalk-emoji/fanu.png",
        },
})
</script>
```


### 网易云音乐简码
- 在博客目录`layouts/shortcodes`下创建`music.html`文件

```bash
<div id="music">
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id={{ .Get 0 }}&auto=0&height=66"></iframe>
</div>
```


### 简码调用
```bash
{{</* artitalk appId="Your LeanCloud appId" appKey="Your LeanCloud appKey" */>}}
{{</* music "网易云音乐id号" */>}}
```
