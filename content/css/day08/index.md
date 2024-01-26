---
title: "8.盒模型应用"
externalUrl: ""
summary: ""
tags: ["css"]
showReadingTime: false
weight: 1
---

## 改变宽高范围
默认情况下，width 和 height 设置的是内容盒宽高。
> 页面重构师：将psd文件（设计稿）制作为静态页面

衡量设计稿尺寸时，往往使用的是边框盒，但设置width和height，则设置的是内容盒

1. 精确计算
2. CSS3: box-sizing


## 改变背景覆盖范围
默认情况下，背景覆盖边框盒
可以通过 background-clip 进行修改

## 溢出处理
overflow, 控制内容溢出边框盒后的处理方式

## 断词规则
- word-bread，会影响文字在什么位置被截断换行。

- normal：普通，CJK字符（文字位置截断），非CJK字符（单词位置截断）
    - C：中国 J：日本 K：韩国
- break-all：截断所有，所有字符都在文字处截断。
- keep-all: 保持所有，所有文字都在单词之间截断。

## 空白处理
white-space: nowrap
