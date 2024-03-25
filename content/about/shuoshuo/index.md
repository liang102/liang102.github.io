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
![img](images/baojie.jpg)
```bash
hello world
```
 {{< /text >}}
  {{< /timelineItem >}}

  {{< timelineItem icon="user-solid" header="测试3" badge="shortcode" subheader="嵌套简码测试" >}}
{{< carousel images="images/*" >}}
<br>
{{< alert >}}
**提示！** 这是一条测试
{{< /alert >}}
<br>
{{< github repo="liang102/liang102.github.io" >}}
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
