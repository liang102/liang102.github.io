---
title: "3.选择器"
externalUrl: ""
summary: ""
tags: ["css"]
showReadingTime: false
weight: 6
---


> 选择器: 帮助你精准的选中想要的元素

## 简单选择器
### ID选择器  
-id对应的值: `#id值{}`
```css
#str{
color: red;
}

<p id="str">Lorem ipsum dolor sit amet.</p>
```

### 元素选择器
- 元素: `元素{}`
```css
p {
color: blue;
}


<p>Lorem ipsum dolor sit amet.</p>
```

### 类选择器
- 类对应的值: `.class{}`
```css
.left {
  background: coral;
  color: #fff;
}



<div class="left">Lorem.</div>
```


### 通配符选择器 
- `*: 表示选中所有元素  *{}`
```css
*{
    color: red;
}

<div>Lorem.</div>
<p>Lorem.</p>
<h1>Lorem.</h1>
```


### 属性选择器
- 匹配元素的属性: `[属性=""]{}`
```css
[href="https://www.baidu.com"]{
    color: green;
}

<a href="https://www.baidu.com">百度</a>
```

### 伪类选择器: 选中某些元素的某种状态
- 必须要按照顺序进行排列。
- 爱恨法则：love hate
    - link: 超链接未访问时的状态。
    - visited： 超链接访问过后的状态。
    - hover： 鼠标悬停状态。
    - active: 激活状态，鼠标按下状态。

```css
a:link{
    color: cadetblue;
}

a:visited{
    color: fuchsia;
}

a:hover{
    color: red;
}

a:active{
    color: chocolate;
}


# a 表示要给a元素添加
```
    
### 伪元素选择器: 可以生成子元素
- before
- after
```css
span::before{   /* 选中span元素会生成一个子元素，可以理解为生成一个before元素 */
    content: "《";  /*  子元素中的内容  */
    color: red;     /*   颜色  */
}
span::after{
    content: "》";
    color: red;
}

<p>
    快来和我一起学习<span>HTML和CSS</span>吧!
</p>
```


## 选择器的组合
### 并且 -- . 
- 使用`.`链接元素和属性
```css
p.red{
    color: red;
}

    <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores, facere velit. Nihil voluptates eum, earum ad dolor provident iure sit reprehenderit aliquid quis dolorem dolore veniam impedit quos explicabo id!
    </p>

    <p class="red">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Adipisci quaerat minima, aspernatur natus eius nam debitis voluptates nesciunt possimus provident reprehenderit suscipit eaque quisquam consectetur illo quod vero molestias temporibus.
    </p>
```


### 后代元素 -- 空格  
- 使用`空格`连接父元素class属性和后代元素
```css
.red li{
    color: #008c8c;
}


<div class="red">
    <p>
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Adipisci quaerat minima, aspernatur natus eius nam debitis voluptates nesciunt possimus provident reprehenderit suscipit eaque quisquam consectetur illo quod vero molestias temporibus.
    </p>
    <ul>
        <li>Lorem.</li>
        <li>Earum!</li>
        <li>Quas.</li>
        <li>Nobis.</li>
        <li>Accusamus.</li>
    </ul>
</div>

-------------------------------------------------

.abc .bcd{
    color: red;
}


<div class="abc">
    <p>Lorem.</p>
    <p class="bcd">Nam.</p>
    <p>Eius.</p>
</div>
```

### 子元素 -- >
- 使用`>`链接子元素
```css
div>ul>li{
    color: red;
}

div>ul li {
    color: red;
}

div li{
    color: red;
}


<div>
    <ul>
        <li>Lorem.</li>
        <li>Nisi!</li>
        <li>In!</li>
    </ul>
</div>

```


### 相邻兄弟元素 -- +
- 使用`+`链接相邻的兄弟元素
```css
.special{
    color: red;
}

.special+li{
    color: greenyellow;
}


<div>
    <ul>
        <li>Lorem.</li>
        <li>Consequuntur!</li>
        <li>Officia.</li>
        <li class="special">Reiciendis!</li>
        <li>Ipsum!</li>
        <li>Tempore.</li>
        <li>Consequuntur?</li>
        <li>Voluptatibus?</li>
        <li>Totam?</li>
        <li>Explicabo.</li>
    </ul>

    <ul>
        <li>Lorem.</li>
        <li>Consequuntur!</li>
        <li>Officia.</li>
        <li class="special">Reiciendis!</li>
        <li>Ipsum!</li>
        <li>Tempore.</li>
        <li>Consequuntur?</li>
        <li>Voluptatibus?</li>
        <li>Totam?</li>
        <li>Explicabo.</li>
    </ul>
</div>
```


### 兄弟元素 -- ~
- 使用`~`链接兄弟元素
```css
.special{
    color: red;
}

.special~li{
    color: aqua;
}


    <div>
        <ul>
            <li>Lorem.</li>
            <li>Minima.</li>
            <li>Animi.</li>
            <li class="special">Modi.</li>
            <li>Laudantium.</li>
            <li>Aliquam?</li>
            <li>Eligendi.</li>
            <li>Fuga.</li>
            <li>Iusto.</li>
            <li>Blanditiis!</li>
        </ul>
        <ul>
            <li>Lorem.</li>
            <li>Labore?</li>
            <li>Distinctio.</li>
            <li class="special">Libero!</li>
            <li>Rerum.</li>
            <li>Necessitatibus?</li>
            <li>Magnam!</li>
            <li>Quo.</li>
            <li>Incidunt.</li>
            <li>Rerum.</li>
        </ul>
    </div>
```


## 选择器的并列
### 多个选择器,用逗号`,`分隔
```css
.special{
    color: red;
}

.special~li,p{
    color: blueviolet;
}


<div>
    <ul>
        <li>Lorem.</li>
        <li>Minima.</li>
        <li>Animi.</li>
        <li class="special">Modi.</li>
        <li>Laudantium.</li>
        <li>Aliquam?</li>
        <li>Eligendi.</li>
        <li>Fuga.</li>
        <li>Iusto.</li>
        <li>Blanditiis!</li>
    </ul>
    <ul>
        <li>Lorem.</li>
        <li>Labore?</li>
        <li>Distinctio.</li>
        <li class="special">Libero!</li>
        <li>Rerum.</li>
        <li>Necessitatibus?</li>
        <li>Magnam!</li>
        <li>Quo.</li>
        <li>Incidunt.</li>
        <li>Rerum.</li>
    </ul>
</div>

<p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
<p>Provident ullam voluptatem amet molestias cupiditate dolore?</p>
<p>Laboriosam eaque cum necessitatibus, iure explicabo hic.</p>
```
