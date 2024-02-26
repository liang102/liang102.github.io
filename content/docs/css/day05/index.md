---
title: "5.盒模型"
externalUrl: ""
summary: ""
tags: ["css"]
showReadingTime: false
weight: 4
---


> box：盒子，每个元素在页面中都会生成一个矩形区域（盒子box）


## 盒子类型
- 行盒：display等于inline的元素。 
- 块盒：display等于block的元素。

行盒在页面中不换行，块盒独占一行。

display默认值为inline

浏览器默认样式表设置的块盒：`容器元素、h1~h6、p`

常见的行盒：`span、 a、 img、 video、 audio`


## 盒子的组成部分
- 无论是行盒、还是块盒，都由下面几个部分组成，从内到外分别是：

### 1. 内容  content
    - width  宽度
    - height 高度
    - 这两个值设置的盒子内容的宽高。
    - 内容部分通常叫做整个盒子的**内容盒 content-box**


### 2. 填充(内边距)  padding
    - 盒子的边框到盒子内容的距离
    - padding-left  左内边距
    - padding-right 由内边距
    - padding-top   上内边距
    - padding-bottom 下内边距
- padding：简写属性(速写属性)
    - padding：上 右 下 左
- 填充区+内容区域 = **填充盒 padding-box**


### 3. 边框  border
边框 = 边框样式 + 边框宽度 + 边框颜色
边框样式: border-style
边框宽度： border-width
边框颜色：border-color

边框+填充区+内容区 = **边框盒 border-box**


### 4. 外边距 margin
边框到其他盒子的距离
margin-top margin-left margin-right margin-bottom
速写属性：margin
