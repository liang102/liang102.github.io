---
title: "2.常见的样式声明"
externalUrl: ""
summary: ""
tags: ["css"]
showReadingTime: false
weight: 7
---

### color（文字颜色）
- 元素内部的文字颜色.

**预设值**：定义好的单词
**三原色，色值**：光学三原色（红、绿、蓝），每个颜色可以0-255之间的数字来表达。
- rgb表示法: `rgb(0,0,0)`
```css
# rgb 表示法：
color: rgb(0,255,0)
## rgb 代表红绿蓝，数值越大颜色越深。当三个数为0时，则黑色，当三个数为255时，则白色。
```
- hex(16进制)表示法: `#000000  可简写为: #000`
```css
#红绿蓝
color: #008c8c

淘宝红：#ff4400,#f40
黑色: #000000, #000
白色：#ffffff, #fff
红：#ff0000, #f00
绿：#00ff00, #0f0
蓝：#0000ff, #00f
紫：#ff00ff,#f0f
青：#00ffff,#0ff
黄：#ffff00,#ff0
灰色：#cccccc ,#ccc
```


### background-color（背景颜色）
- 元素背景颜色


### font-size（字体大小）
- 元素内部文字的尺寸大小
    1. px: 像素，简单的理解为文字的高度占多少个像素
    2. em: 相对单位。相对于父元素的字体大小。3em,表示父元素字体大小的3倍像素。
    每个元素必须有字体大小，如果没有声明，则直接使用父元素的字体大小，如果没有父元素（HTML），则使用基准字号。
    基准字号可以从浏览器设置中查询。computed中查找font-zise。

> user agent, UA, 用户代理（浏览器 有默认的样式）


### font-weight（字体粗细）
- 文字粗细程度，可以取值数字，可以取值为预设值（单词）
- strong元素，默认加粗。表示重要、不可忽略的内容。
```css
font-weight: bold  # 加粗 700
font-weight: normal  # 默认值
```


### font-family（字体种类）
- 文字类型：字体类型，例如：宋体，微软雅黑
- 必须用户计算机中存在的字体才会有效果。
- 使用多个字体，以匹配不同环境的

```css
sans-serif: 非衬线字体。字体的边缘没有修饰。通用字体，用于兼容老的计算机字体。
font-family: arial,console,宋体，微软雅黑,sans-seif
```


### font-style（字体倾斜）
- 字体样式，通常用它设置斜体
- i 元素（影响语音阅读）：默认样式，是倾斜字体；实际使用中，通常用它表示一个图标（icon）
- em元素：表示强调的内容
```css
font-style: italic
```


### text-decoration（文本修饰）
- 文本修饰，给文本加线。
- del元素：错误的内容。
- s元素：过期的内容。

```css
text-decoration: line-through

line-through：在字体中间穿过一条线。穿过文字
underline: 在字体下方加一条线。
overline: 在字体上方加一条线.
none: 表示没有
```

### text-indent（文本缩进）
- 首行文本缩进
    - px: 适用于英文
    - em: 适用于中文，2em 缩进2个字


### line-height（行高）
- 每行文本的高度，该值越大，每行文本的距离越大。
- 设置行高为容器的高度可以让单行文本垂直居中。
- 行高设置为纯数字，表示相对于当前元素的字体大小。

```html
<style>
    p {
        background: #008c8c;
        color: #fff;
        height: 50px;
        line-height: 50px;
    }
</style>

<p>
    Lorem ipsum dolor sit.
<p>
```

### width（元素容器宽度）
- 宽度
- px
- em

### height（元素容器高度）
- 高度
- px
- em

### letter-space（文字间隙）
- 文字之间的间隙隙
- px
- em


### text-align（文本排列方式）
- 元素内部文字的水平排列方式
- left：水平靠左排列
- center：水平居中排列
- right：水平靠右排列
