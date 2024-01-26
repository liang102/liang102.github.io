---
title: "网站主题背景图设置"
externalUrl: ""
summary: ""
categories: ["document"]
tags: ["hugo","blowfish","theme"]
showReadingTime: false
weight: 3
---

> 默认是独立的配置文件: params.toml. 该文件是使用主题`blowfish`所有配置。
> 这篇文章主要讲解如何配置网站的背景图。


## 网站主页背景图设置
```bash
[homepage]        # 找到主页的配置
homepageImage =  "/img/images.jpg"   
```

## 菜单功能里的背景图设置
```bash
defaultBackgroundImage = "/img/images.jpg"
```

## 文章背景图设置
- 当文章没有使用图片作为封面时，整个设置很有用。
```bash
defaultFeaturedImage = "/img/images.jpg"
```