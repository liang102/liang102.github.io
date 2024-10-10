---
title: "Nginx networker optimization"
externalUrl: ""
summary: "针对网络连接的指令配置"
tags: ["nginx"]
showRelatedContent: false
invertPagination: false
weight: 98
---

## 与网络连接的相关配置的4个指令


### keepalive_timeout 指令
- 该指令用于设置Nginx服务器与客户端保持连接的超时时间。支持两个选项，用空格隔开。第一个选项指定客户端连接保持活动的超时时间，在这个时间之后，服务器会关闭此连接；第二个选项可选，指定了使用Keep-Alive消息头保持活动的有效时间，如果不设置，Nginx服务器不会向客户端发送Keep-Alive消息头以保持与客户端某些浏览器(如Mozilla、Konqueror等)的连接，超过设置的时间后，客户端就可以关闭连接，而不需要服务器关闭了。建议从服务器的访问数量、处理速度以及网络状况方面考虑此值。
```bash
keepalive_timeout 60 50;
```
> 此设置表示Nginx服务器与客户端连接保持活动的时间是60s，60s后服务器与客户端断开连接；使用keep-alive消息头保持与客户端某些浏览器的连接时间为50s，50s秒后浏览器主动与服务器断开连接。


### send_timeout 指令
- 该指令用于设置Nginx服务器响应客户端的超时时间，这个超时时间仅针对两个客户端和服务器之间建立连接后，某次活动之间的时间。如果这个时间后客户端没有任何活动，Nginx 服务器将会关闭连接。需要考虑服务器访问数量和网络状况等方面。
```bash
send_timeout 10s;
```
> 该设置表示Nginx 服务器与客户端建立连接后，某次会话中服务器等待客户端响应超时10s，就会自动关闭连接。


### client_header_buffer_size 指令
- 该指令用于设置Nginx 服务器允许的客户端请求头部的缓冲区大小，默认为1KB。可以根据系统分页大小来设置。
- 分页大小可以用以下命令获取：
```bash
#getconf PAGESIZE
```
> 有时可能会遇到Nginx 服务器返回400 错误的情况，查找该错误原因比较困难，出现错误的时候，通常再浏览器和日志里也看不到任何有关的提示信息。根据实际经验来看，有很大一部分情况是客户端的请求头部过大造成的，通常是客户端cookie中写入了较大的值引起的。
```bash
client_header_buffer_size 4k;
```


### multi_accept 指令
- 该指令用于配置Nginx服务器是否尽可能多地接收客户端的网络连接请求，默认值off。







