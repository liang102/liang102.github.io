---
title: "Blowfish主题设置多名作者"
externalUrl: ""
summary: "网站主题多个作者配置教程"
tags: ["hugo","blowfish","authors"]
showReadingTime: false
series: ["主题相关文档"]
series_order: 5
weight: 4
---

## 多名作者
如果你的网站有多个作者贡献内容，那么就需要多个作者。


### 创建作者
1. 在`data`目录下创建`authors`目录。
2. 以作者名称为文件名，在`data/authors/`目录下创建一个`作者名称.json`文件。方便后续在文章中引用。
3. 文件内容与`languages.语言代码.toml`文件里的`author`一样，只不过换成`json`的格式书写。
```shell
mkdir data/authors
touch data/authors/小橘子Single.json

# json 文件内容如下格式：
{
    "name": "小橘子Single",
    "image" : "img/avatar.png",
    "bio": "如你所见",
    "social": [
        { "github": "https://github.com/liang102" }
    ]
}

```

### 参数说明
```bash
name：作者名称
image：作者头像
bio: 作者简介
social：作者社交链接,支持多个社交链接
- email
- link
- amazon 
- apple 
- blogger 
- codepen 
- dev 
- discord 
- dribbble
- facebook 
- flickr 
- foursquare 
- github 
- gitlab 
- google 
- hashnode 
- instagram 
- keybase 
- kickstarter
- lastfm
- linkedin 
- mastodon
- medium 
- microsoft
- orcid 
- patreon
- pinterest
- reddit 
- researchgate
- slack 
- snapchat
- soundcloud 
- stack-overflow 
- steam 
- telegram 
- tiktok 
- tumblr 
- twitch 
- twitter 
- x-twitter 
- whatsapp
- youtube 
- ko-fi
```

## 创建作者分类 
- 在配置文件`config/_default/config.toml`中找到`taxonomies`添加`atuthor`。这样文章将通过作者进行文章分类。
```shell
[taxonomies]
  tag = "tags"
  category = "categories"
  author = "authors"
```

## 配置多名作者菜单
- 编辑菜单文件`config/_default/menus.语言代码.toml`
- 配置到哪都行，主要是`pageRef`参数必须是`authors`，这样就方便通过作者找到对应的文章。
我这里习惯配置到页脚。
```bash
[[footer]]
  name = "©小橘子Single"
  pageRef = "authors"
  weight = 10
```

> 还可以向每个作者页面添加更多详细信息，以便它显示一些个人简介、链接或任何信息。
```bash
mkdir -p content/authors/作者名称
touch content/authors/作者名称/_index.md 
# 文件内容
---
title: "authors"
---

my name is authors
```

## 文章前置中引用作者信息
```shell
---
authors: 
  - "小橘子Single"
showAuthor: false            # 是否显示默认作者
showAuthorsBadges : false    # 是否在文章封面显示作者信息
---
```

### 样本
下面的示例显示了默认网站作者已开启且文章有多个作者的示例。
{{< article link="/docs/linux/sftp/" >}}




