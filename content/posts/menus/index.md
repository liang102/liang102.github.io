---
title: "Blowfish主题菜单设置"
externalUrl: ""
summary: "网站主页菜单布局教程"
categories: ["document"]
tags: ["hugo","blowfish"]
showReadingTime: false
weight: 2
---

> 默认是独立的配置文件 `menus.en.toml`，确保该文件命名与站点配置中`defaultContentLanguage` 的语言代码相同。
> 若`defaultContentLanguage =  zh-cn`, 则文件名为：`menus.zh-cn.toml` 

```bash
# 第一种配置菜单方式
[[main]]                   # 一级菜单标识
  name = "博客"            # 网站菜单目录名称
  pageRef = "blog"        # 网站菜单目录对应的路径
  weight = 10             # 权重，数值大小用于排序。

# 第二种配置菜单的方式
[[main]]
  name = "菜单父目录"       # 菜单父目录
  weight = 20             # 权重，这个权重数值将 排在博客后面

[[main]]
  name = "子目录1"           # 菜单子目录1
  parent = "菜单父目录"      # 指定菜单父目录 
  pageRef = "posts/one"        # 菜单路径，即帖子存放路径
  weight = 20              # 权重，与父目录保持一致。    

[[main]]
  name = "子目录2"           # 菜单子目录2
  parent = "菜单父目录"      # 指定菜单父目录 
  pageRef = "posts/two"        # 菜单路径，即帖子存放路径, 路径可相同可不同。
  weight = 20              # 权重，与父目录保持一致。  
  
# 菜单配置链接方式
[[main]]
  identifier = "github"            # 菜单名称 
  pre = "github"                   # icon 图标名称
  url = "https://github.com/nunocoracao/blowfish"   # 菜单链接
  weight = 30                      # 权重

# 二级菜单配置方式
[[subnavigation]]                  # 二级菜单标识
#  name = "二级菜单"                # 二级菜单名称
#  pageRef = "/docs/some"         # 二级菜单对应路径
#  weight = 10                    # 二级菜单权重

# 页脚菜单
 [[footer]]                      # 页脚菜单标识 
   name = "标签"                  # 页脚菜单名称
   pageRef = "tages"             # 页脚菜单对应路径          
   weight = 20                   # 权重
```   
