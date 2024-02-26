---
title: "4.层叠"
externalUrl: ""
summary: ""
tags: ["css"]
showReadingTime: false
weight: 5
---

> 声明冲突：同一个样式，多次应用到同一个元素。</br>
> 层叠：解决声明冲突的过程，浏览器自动处理。(权重计算)


## 比较重要性
- 重要性从高到低：
    
    - 作者样式表中的 !important 样式
        - 作者样式表：开发者书写的样式
    - 作者样式表中的普通样式
    - 浏览器默认样式表中的样式。


## 比较特殊性
- 总体规划：看选择器，选择器选中的范围越小，越特殊
- 具体规则：通过选择器，计算出一个4位数（xxxx）
    - 千位：如果是内联样式，记1，否则记0
    - 百位：等于选择器中所有ID选择器的数量。
    - 十位：等于选择器中所有类选择器、属性选择器、伪类选择器的数量。
    - 个位：等于选择器中所有元素选择器，伪元素选择器的数量。

元素选择器、伪类选择器>类选择器class、属性选择器、伪类选择器>id选择器>元素内联样式

#### 案例1
```html
<style>
    a {
        /* color: red !important; */
        color: red;
        text-decoration: none;
        font-style: italic;
    }

    #mylink {
        /* 没有内联: 0  id：1  类|属性|伪类：0  元素：0  */
        /* 0100  书写靠后则应用靠后的样式 */
        color: #000;
    }

    #id {
        /* 0100 */
        color: aqua;
    }

    .selected {
        color: #fff;
        background-color: red;
    }

    .active {
        /* 0010 */
        color: blue;
    }
</style>

<body>
   <a href="">Lorem.</a>
   <a href="">Tempora?</a>
   <a href="" >Beatae.</a>
   <a href="" id="mylink" class="selected" style="color: chocolate;">Quam.</a>
   <a href="" id="id" class="active">Doloribus.</a>
   <a href="">Fugiat!</a>
   <a href="">Molestiae.</a>
   <a href="">Est.</a>
   <a href="">Animi.</a>
   <a href="">Quidem.</a>
</body>
```
#### 案例2
```html
<style>
   a {
        /* 没有内联：0 没有ID：0 没有类，属性，伪类：0 1个元素：a */
        /* 0001 */
        color: red;
    }
   div ul a {
        /* 没有内联：0 没有ID：0 没有类，属性，伪类：0 3个元素：div ul a  */
        /* 所以是 0003 */
        color: aqua;
    }

   #mydiv #myul a{
        /* 0201 */
        /* 没有内联：0 */
        color: blueviolet;
    }

   #mydiv #myul .mylink {
        /* 没有内联：0 两个ID：2 1个类：.mylink 没有元素也没有伪元素：0 */
        /* 所以是 0210 */
        color: green;
    }

   #mydiv #myul a:link {
        /* 没有内联：0  两个ID：2  1个伪类 :link 1个元素 a */
        /* 所以是 0211 */
        color: chocolate;
    }

</style>

<body>
    <div id="mydiv">
        <ul id="myul">
            <li id="myli">
                <a href="https://163.com" class="mylink">举个例子</a>
            </li>
        </ul>
    </div>
</body>
```

## 比较源次序
- 代码书写靠后的胜出。


## 应用
### 重置样式表
- 重置样式表：书写一些作者样式，覆盖浏览器的默认样式。
- 重置样式表 -》 浏览器的默认样式
- 常见的重置样式表：normalize.css、 reset.css、 meyer.css

#### 重置样式表`reset.css`
```css
/* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/


dy, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
        display: block;
}
body {
        line-height: 1;
}
ol, ul {
        list-style: none;
}
blockquote, q {
        quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
        content: '';
        content: none;
}
table {
        border-collapse: collapse;
        border-spacing: 0;
}
```

### 爱恨法则
link > visited > hover > active
