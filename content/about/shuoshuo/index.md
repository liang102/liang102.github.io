---
title: "说说"
summary: "畅所欲言"
tags: ["talk"]
showPagination: false
showRelatedContent: false
Comments:
  provider: 'twikoo'
---

{{< timeline >}}
  {{< timelineItem icon="user-solid" header="测试1" badge="text" subheader="纯文本测试" >}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non magna ex. Donec sollicitudin ut lorem quis lobortis. Nam ac ipsum libero. Sed a ex eget ipsum tincidunt venenatis quis sed nisl. Pellentesque sed urna vel odio consequat tincidunt id ut purus. Nam sollicitudin est sed dui interdum rhoncus. 

  {{< /timelineItem >}}

  {{< timelineItem icon="user-solid" header="测试2" badge="markdown" subheader="markdown格式测试" >}}
  {{< text >}}
![img](https://t11.baidu.com/it/u=685650719,156415639&fm=30&app=106&f=JPEG?w=601&h=330&s=F110139DD4621D095C10B5C90300B0B1)
```bash
hello world
```
 {{< /text >}}
{{< gallery >}}
  <img src="https://img2.baidu.com/it/u=490181481,148438425&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=500" class="grid-w33" />
  <img src="https://img0.baidu.com/it/u=650818383,2065890300&fm=253&fmt=auto&app=138&f=PNG?w=400&h=376" class="grid-w33" />
  <img src="https://img2.baidu.com/it/u=3732367417,1898758912&fm=253&fmt=auto&app=138&f=JPEG?w=640&h=366" class="grid-w33" />
  <img src="https://vthumb.ykimg.com/054101015E671A4D0F954C9811014D9B" class="grid-w33" />
  <img src="https://n.sinaimg.cn/sinacn20/155/w640h315/20180804/2541-hhhczfa5011909.jpg" class="grid-w33" />
  <img src="https://img2.baidu.com/it/u=3693708795,1691966965&fm=253&fmt=auto&app=138&f=JPEG?w=720&h=405" class="grid-w33" />
  <img src="https://5b0988e595225.cdn.sohucs.com/images/20200320/09d98ac93fa14bcf9833ee2ef4a7d1a6.jpeg" class="grid-w33" />
{{< /gallery >}}
  {{< /timelineItem >}}

  {{< timelineItem icon="user-solid" header="测试3" badge="shortcode" subheader="嵌套简码测试" >}}
{{< carousel images="images/*" >}}
<br>
{{< alert >}}
**提示！** 这是一条测试
{{< /alert >}}
<br>
{{< icon comment >}}{{< keyword >}} talk {{< /keyword >}}
{{< /timelineItem >}}

{{< timelineItem icon="user-solid" header="Alert" badge="alert" subheader="" >}}
   参考了FixIt 主题的类似alert简码的风格。
{{< article link="/shcode/shortcode/" >}}
<br>
  2024/03/24 · 06:14 · 深圳
  {{< /timelineItem >}}

{{< timelineItem icon="user-solid" header="不蒜子" badge="busuanzi" subheader="" >}}
今天更新了网站主页的访问量统计，采用不蒜子组件。
{{< article link="/shcode/busuanzi/" >}}
<br>
  2024/03/26 · 0:14 · 深圳
{{< /timelineItem >}}


{{< /timeline >}}



## 关于说说
- 原本是使用[Artitalk](https://artitalk.js.org/) 来作为本站的说说，但是加载特别慢，有时甚至加载不出来，无意间看到:backhand_index_pointing_right: [金圣皓博主](https://www.karlukle.site/)的说说，觉得很不错。感兴趣的可以看看博主的
{{< button href="https://www.karlukle.site/shuoshuo/" target="_self" >}}
说说
{{< /button >}}
- 本站的说说是从主题作者提供的简码模板基础上修改的，去掉了左边的线条，添加了一点博主的代码。
- 但是对css知识懂得甚少，需要先学习一段时间再优化说说的样式，暂时还是用主题的时间线作为本站的说说。
