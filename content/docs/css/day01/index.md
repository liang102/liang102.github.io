---
title: "1.为网页添加样式"
externalUrl: ""
summary: ""
tags: ["css"]
showReadingTime: false
weight: 8
---

### 术语解释
- css规则 = 选择器 + 声明块

```html
<style>
    /* CSS规则 */
    h1{  /* 选择器  */         
        color: red;    /* 声明(属性) */
        background-color: lightblue;  /* 声明 */
        text-align: center; /* 声明(属性) */
    }
</style>

<body>
    <h1>
        现在开始添加样式
    </h1>
</body>
```

### 选择器
- 选择器：选中元素
    - ID选择器：选中的是对应ID值的元素 `#id值{}`
    - 元素选择器: `div{} a{} h1{} p{} ...`
    - 类选择器 `.class值{}`

```html
<!-- 元素选择器 -->
h1{  
    color: red;
    background-color: lightblue;
    text-align: center;
}
<!-- #ID选择器 -->
#test{
            color: blue;
        }
<!-- 类选择器 -->
.red{
    color: red;
}
<!-- 类选择器 -->
.big-center{
    font-size: 3em;
    text-align: center;
}

<h1>这是1级标题</h1>
<p class="big-center red">
    Lorem ipsum dolor sit amet.
</p>
<p id="test">Lorem ipsum dolor sit amet.</p>
<p class="red">Saepe odio cupiditate laborum a.</p>

```


### 声明块
- 出现在大括号`{}`中. 
- 声明块中包含很多声明（属性），每一个声明（属性）表达了某一方面的样式。

```css
h1 {    
    /* 声明块 */
    color: red;   
    background-color: lightblue;
    text-align: center; 
}
```

### css代码书写位置
1. 内部样式表：书写在`<style>`元素中。放到`<head>`元素中告诉浏览器最先加载样式。
2. 内联样式表，也叫元素样式表：直接书写在元素内。`<h1 style="color: red; font-size: 2em;">内联样式</h1>`
3. 外部样式表[推荐使用]：将样式书写到独立的**CSS文件**中。在`<head>`元素中使用`<link>`元素关联CSS文件的样式。
    - 外部样式表可以解决多页面样式重复的问题。
    - 有利于浏览器缓存，从而提高页面响应速度。
    - 有利于代码分离（HTML 和 CSS），更容易阅读和维护。

```html
<head>
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    <div class="red-big-center">
        Lorem ipsum dolor sit amet.
    </div>
</body>
```
- CSS文件内容: css/index.css
```css
.red-big-center {
    color: blue;
    font-size: 5em;
    text-align: center;
}
```
