---
title: "6.继承"
externalUrl: ""
summary: ""
tags: ["css"]
showReadingTime: false
weight: 3
---


- 子元素会继承父元素的某些CSS属性。
    - 若父元素没有设置该属性，则会再找父元素的父元素，直到`html元素`
    - 若`html元素`也没有设置，则会根据浏览器设置，例如: `font-size 属性`
- 通常，跟文字内容相关的属性都能被继承。
- 通常都在body设置字体类型。
- Inherited from div.container  继承 div 的样式 
- Inherited from body  继承 body 的样式
- Inherited from html  继承 html 的样式

```html
<style>
    .container{
        color: red;
        font-size: 2em;
        line-height: 2.5;
        background-color: bisque;
        text-align: center;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
    }
</style>

<body>
    <div class="container">
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero, laboriosam aut, reprehenderit laudantium earum atque provident quasi optio doloremque nam ipsam repellat harum odit in eos quia. Assumenda, eveniet nihil!
        </p>
        <ul>
            <li>Lorem.</li>
            <li>Id.</li>
            <li>Repudiandae.</li>
            <li>Molestiae!</li>
            <li>Impedit!</li>
            <li>Facere.</li>
            <li>Maxime.</li>
            <li>Eveniet?</li>
            <li>Harum!</li>
            <li>Facere!</li>
        </ul>
        <div>
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Vero quos veritatis necessitatibus ea excepturi. Eaque totam dolorum laborum enim mollitia tempora ex, molestias sapiente, illo vel error in impedit porro?
        </div>
    </div>
</body>
```
