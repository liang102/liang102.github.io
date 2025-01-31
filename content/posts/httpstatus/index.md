---
title: "HTTP Status"
externalUrl: ""
summary: "常见的HTTP错误代码"
showRelatedContent: false
invertPagination: false
tags: ["http"]
---


### 设置网站的错误页面
&emsp;&emsp; 如果用户端尝试看网页时遇到问题，服务器会将HTTP错误从网站发送到web浏览器。如果无法显示网页，Web浏览器会显示网站发送的实际错误网页或Web浏览器内置的友好错误信息。Nginx服务器支持自定义错误网页的显示内容。可以通过这一功能在网站发送错误时为用户提供人性化的错误显示页面。
&emsp;&emsp; 一般来说，`HTTP 2XX` 代表请求正常完成，`HTTP 3XX`代表网站重定向，`HTTP 4XX`代表客户端出现错误，`HTTP 5XX` 代表服务器端出现错误。

|HTTP 消息| HTTP 代码 | 含义
|:---- | :----: | :---- |
| 已移动 | HTTP `301`     |  请求的数据具有新的位置，并且更改是永久       |
| 已找到 | HTTP `302`     |  请求的数据临时具有不同的URI        |
| 请参阅其他 | HTTP `303`  |  可在另一URI下找到对请求的响应，并且使用GET方法检索此响应       |
| 未修改 | HTTP `304`     |  未按预期修改文档       |
| 使用代理 | HTTP `305`   | 必须通过位置字段中提供的代理来访问请求的资源         |
| 未使用 | HTTP `306`    | 不再使用，但保留此代码以便将来使用         |
| 无法找到网页 | HTTP `400`    | 可以连接到web服务器，但是由于web地址(URI)的问题，无法找到网页    |
| 网站拒绝显示此网页 | HTTP `403`    | 可以连接到网站，但 Internet Explorer 没有显示网页的权限     |
| 无法找到网页 | HTTP `404`     | 可以连接到网站，但找不到网页。导致此错误的原因有可能是该网页暂时不可用或网页以被删除     |
| 网站无法显示该页面 | HTTP `405`    | 可以连接到网站，但网页内容无法下载到用户计算机。这通常是由网页编写方式问题引起的     |
| 无法读取此网页格式 | HTTP `406`    | 能够从网站接收信息，但 Internet Explorer 不能识别其格式，因而无法正确地显示消息      |
| 此网站太忙，无法显示此网页 | HTTP `408` 或 `409`   | 服务器显示该网页的时间太长，或对同一网页的请求太多    |
| 网页不复存在 | HTTP `410`    | 可以连接到网站，但无法找到网页。与HTTP 404不同，此错误是永久性的，而且由网站管理员打开      |
| 网站无法显示该页面 | HTTP `500`    | 正在访问的网站出现了服务器问题，该问题阻止了此网页的显示。常见的原因是网站正在维护或使用脚本的交互网站上的程序出错     |
| 未执行 | HTTP `501`    | 没有将正在访问的网站设置为显示浏览器所请求的内容 |
|不支持的版本 |  HTTP `505`    | 该网站不支持浏览器用于请求网页的HTTP协议（最常见的是HTTP/1.1） |
