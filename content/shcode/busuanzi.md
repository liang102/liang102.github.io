---
title: "Busuanzi"
date: 2024-03-26T00:13:00+08:00
externalUrl: ""
summary: "给网站添加不蒜子访问量统计"
tags: ""
Comments:
  enable: false
showReadingTime: false
showPagination: false
showRelatedContent: false
showAuthor: false
authors:
 - "小橘子Single"
---

{{< talk >}}
  {{< entry icon="code" header="不蒜子统计" badge="code" subheader="" date="2024/3/26" time="0:16" place="深圳" >}}
  {{< text >}}
   今天更新了网站主页访客总数统计，使用不蒜子进行统计。
   - [不蒜子文档](https://ibruce.info/2015/04/04/busuanzi/) 

- 不蒜子的极简写法
```bash
本站总访问量<span id="busuanzi_value_site_pv"></span>次
本站访客数<span id="busuanzi_value_site_uv"></span>人次
本文总阅读量<span id="busuanzi_value_page_pv"></span>次
```

- 从主题 copy `head.html` 和 `footer.html` 文件到 `layouts/partials/`
```bash
cp theme/blowfish/layouts/partials/head.html  layouts/partials/
cp theme/blowfish/layouts/partials/footer.html  layouts/partials/
```
- 修改`head.html`文件
```bash
# 编辑layouts/partials/head.html文件，在 Firebase 两个 end 后边行添加以下代码
150  {{/* busuanzi */}}
151  {{ if .IsHome }}
152  {{ if .Params.busuanzi | default (.Site.Params.busuanzi.enable | default false) }}
153    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
154    <meta name="referrer" content="no-referrer-when-downgrade">
155  {{ end }}
156  {{ end }}
```
- 修改`footer.html`文件
```bash
# 编辑layouts/partials/footer.html文件，在 Copyright 代码后边一个end 大约36行添加以下代码
 38   <br>
 39  {{/* busuanzi */}}
 40  {{ if .IsHome }}
 41  {{ if .Params.busuanzi | default (.Site.Params.busuanzi.enable | default false) }}
 42     本站访客总数: <span id="busuanzi_value_site_uv"></span>
 43  {{ end }}
 44  {{ end }}
```
修改主题配置文件: config/_default/params.toml
```bash
# 在空白处添加以下代码
[busuanzi]
  enable = true
```
  {{< /text >}}
   
  {{< /entry >}}
{{< /talk >}}
