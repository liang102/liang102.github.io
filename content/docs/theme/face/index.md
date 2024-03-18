---
title: "网站图标设置"
externalUrl: ""
summary: "浏览器图标以及站点图标和作者图标教程"
tags: ["blowfish","icon"]
showReadingTime: false
series: ["主题相关文档"]
series_order: 3
weight: 2
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
- [网站图标生成器](https://realfavicongenerator.net/)
- 将生成的图标放入`static/`目录下即可

```bash
unzip -d static favicon_package_v0.16.zip

ls static/
android-chrome-192x192.png  android-chrome-512x512.png  apple-touch-icon.png  favicon-16x16.png  favicon-32x32.png  favicon.ico  site.webmanifest
```
