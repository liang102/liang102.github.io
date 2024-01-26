---
title: "网站图标设置"
externalUrl: ""
summary: "浏览器图标以及站点图标和作者图标教程"
categories: ["document"]
tags: ["hugo","blowfish","theme"]
showReadingTime: false
weight: 3
---

> 默认是独立的配置文件: `languages.en.toml`，确保该文件命名与站点配置中`defaultContentLanguage` 的语言代码相同。
> 若`defaultContentLanguage = zh-cn`, 则文件名为：`languages.zh-cn.toml`

## 网站标题图标设置
- 仅支持图片, 图片路径可以是自定义。
```bash
[params]
  logo = "img/logo.png"   # 网站标题logo
```

## 作者图标设置
- 仅支持图片, 图片路径可以是自定义。
```bash
[author]
  image = "img/avatar.png"  # 作者头像设置
```

## 浏览器图标设置
- 将主题下`theme/blowfish/static/`的静态文件夹中`favicon.ico site.webmanifest` 拷贝到`static` 文件夹中。
- 需要5张相同的图片，分辨率大小分别为`512x512、192x192、180x180、32x32、16x16` 放到`static` 文件夹里.
- 按照分辨率依次重命名为: `android-chrome-192x192.png  android-chrome-512x512.png  apple-touch-icon.png  favicon-16x16.png  favicon-32x32.png`
- `180x180` 的分辨率图片对应为: `apple-touch-icon.png`
```bash
cp theme/blowfish/static/favicon.ico  static/
cp theme/blowfish/static/site.webmanifest  static/

ls static/
android-chrome-192x192.png  android-chrome-512x512.png  apple-touch-icon.png  favicon-16x16.png  favicon-32x32.png  favicon.ico  site.webmanifest
```
