---
title: "hugo+blowfish+github搭建个人博客"
externalUrl: ""
summary: ""
categories: ["document"]
tags: ["hugo","blowfish","github"]
showReadingTime: false
weight: 10
comment: true
---


## 前言
- 市面上有很多开源的静态站点，最早使用的是 [WordPress](https://wordpress.com/zh-cn/), [Typecho](https://typecho.org/), 有好看的主题，有后台管理，可以在线编辑发布，对新手非常友好。就是比较折腾，nginx+php+mysql部署 后期维护比较麻烦，也需要花费一笔费用在服务器上。 
- 后来换成了 [Hexo](https://hexo.io/zh-tw/), 免费，开源，无需服务器，托管到GitHub上就行。由于hexo基于nodejs,很多依赖关系导致的bug无从修复，至此放弃。
- 一直探索，直至发现了[Hugo](https://gohugo.io/)
---

## Hugo 介绍
- [Hugo](https://gohugo.io/) 是开源的静态站点生成器之一，使用go语言开发，将Markdown文件转变成html，是世界上最快的网站搭建框架。
- 纯静态页面，访问速度快，而且安全。不足的地方就是跟用户的交互功能需要借助第三方插件来完成，例如评论，访问统计等。
- 完全跨平台，可在 macOS、Linux、Windows 等上轻松安装与使用。
---

## 博客安装思路
1. 了解系统的终端命令使用，不同系统的终端命令也不是完全相同。 例如：`ls`、`cd`
2. 安装Git，会[Git](http://git.p2hp.com/) 命令的基本使用。
3. 有{{< icon github >}}[GitHub](https://github.com)账户, 以及以github账户开头的github仓库，例如: `username.github.io`, username必须是 github 账户名称。
4. 了解 [GitHub Action](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) 持续集成和持续交付平台，以及基本语法。  
5. 默认仓库主分支名称为`main`,还需创建一个分支，命名为 `gh-pages` 切换到这个分支上。

## Hugo 安装
1. 我这边使用Linux系统安装，不同操作系统的安装可以参考[Hugo Install](https://gohugo.io/installation/linux/), 以及想要安装的 [Hugo Version](https://github.com/gohugoio/hugo/releases/latest)
2. 我安装的Hugo版本为 v0.100.0
```bash
hugo new site myblog
```
3. 查看Hugo是否安装成功，可以使用以下命令, 有版本号出现就代表安装成功。
```bash
hugo-100 version

hugo v0.100.0-27b077544d8efeb85867cb4cfb941747d104f765 linux/amd64 BuildDate=2022-05-31T08:37:12Z VendorInfo=gohugoio
```
---

## Blowfish 主题安装
1. 这里 [Hugo Theme](https://themes.gohugo.io/) 有很多主题可选择任意一个喜欢的应用到网站中。
2. 我这边选的是[Blowfish](https://themes.gohugo.io/themes/blowfish/), 这个主题对Hugo的版本要求为 > v0.87.0
```bash
# 进入博客目录下
cd myblog  
# 初始化git
git init
# 下载主题
git submodule add -b main https://github.com/nunocoracao/blowfish.git themes/blowfish
# 若下载失败可以换成 git clone 尝试
git clone https://github.com/nunocoracao/blowfish.git themes/blowfish  
```
3. 配置网站url,将主题目录下的配置文件`config` 复制到当前位置。`cp -r theme/blowfish/exampleSite/config .`
这个config目录下默认有6个配置文件，我们只需要配置`config.toml`的`baseURL`参数即可
```bash
cd config/_default/
vim config.toml
baseURL = "https://yourname.github.io/"     # 网站根目录的url,将你的域名，或者是GitHub Pages 指定的仓库名写上即可。
# googleAnalytics = "G-PEDMYR1V0K"          # 这个参数需要注释掉。
```
---

## 网站构建编译
1. 在推送博客前可以先预览构建效果，满意之后再进行推送。这样可以避免一些效果不达标的结果，减少推送次数
```bash
hugo server -D -F --minify --bind=0.0.0.0
# 这样就可以使用本机外网ip进行访问了，htp://ipaddr:1313
```
2. 达到预期后构建编译，此时，public目录下就产生了网页静态文件。
```bash
hugo --minify
```
---

## Github Pages 介绍
- [GitHub Pages](https://docs.github.com/pages) 是从[GitHub](https://github.com/) 上的存储库获取HTML、CSS和JavaScript文件，可以选择通过构建过程运行文件，然后发布网站。


## Github Actions 介绍
- [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) 是一个持续集成和持续交付 (CI/CD) 平台，可以自动化构建、测试和部署管道
- 创建工作流程来构建和测试存储库的每个拉取请求，或将合并的拉取请求部署到生产环境


## 推送博客至GitHub
1. 推送前的准备工作，需要申请两个秘钥，一个用于ssh免密登录github，一个授权github Action 仓库读取的秘钥。 因为本地Git与GitHub之间数据传输是通过ssh秘钥进行的，创建秘钥并关联GitHub仓库
```bash
# 关联远程github账户
git config --global user.email "your@example.com"     # github邮件
git config --global user.name "Your UserName"         # GitHub账户名称

# 创建秘钥文件
ssh-keygen -t rsa -b 2048 -C "youremail@example.com" -f  ~/.ssh/filename
# 会产生一个公钥和一个私钥文件放在 ~/.ssh/ 
filename.pub  # 公钥
filename.rsa  # 私钥

# 回到GitHub账户，右上角点击头像--->Settings--->然后找到 SSH and GPG keys --->点击 New SSH key
# title 随意写，自己清楚就行，将复制的内容粘贴到key中，Add SSH key即可。
```
2. 验证是否可以免密登录github
```bash
ssh-T git@github.com

Hi UserName/UserName.github.io! You've successfully authenticated, but GitHub does not provide shell access.
```
3. 配置授权 github Action 秘钥读取仓库的权限。
> 在 GitHub账户上，点击头像---> Settings ---> Developer settings ---> Personal access tokens ---> Generate new key ---> Tokens (classic)
>
> note描述：就是写token是干嘛。 然后选择个人令牌的访问权限，按需选择即可
>
> 我的选择范围： [repo admin:repo_hook delete_repo]
>
> 生成一个新的令牌，需要注意，新令牌的token只展示一次，需要复制下来
>
> 进入yourname.github.io仓库 ---> Settings ---> Secrets and variables ---> Action ---> New repository secret 
>
> name: 密钥名称 ACCESS_TOKEN  secret： 将刚刚复制的token粘贴到这里  添加密钥(add secret)


4. 配置自动化工作流程，使博客每次更新推送时可自动触发CI/CD 自动部署网站。
```bash
mkdir -p .github/worker
touch .github/worker/gh-pages.yml

# gh-pages.yaml 文件内容
name: GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    concurrency:
      group: ${{ github.workflow }}-${{ github.ref }}
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with:
          submodules: true
          fetch-depth: 0

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: "latest"

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        if: ${{ github.ref == 'refs/heads/main' }}
        with:
          github_token: ${{ secrets.BLOWFISH_TOKEN }}  # 授权秘钥填写位置
          publish_branch: gh-pages
          publist_dir: ./public    
          cname: yourdomain
```
5. 推送至GitHub
```bash
git remote add origin git@github.com:username/uername.github.io.git  # 关联远程仓库
git add .                    # 提交到暂存库，反悔可 git reset 撤销 
git commit -m "message"      # 提交至本地仓库，message 就是写这个版本做了什么修改
git push origin main         # 推送至远程仓库。
```
