---
title: "Nginx Var"
externalUrl: ""
summary: "Nginx 常用的内置变量介绍"
tags: ["nginx"]
showRelatedContent: false
invertPagination: false
weight: 6
---

### Nginx 内置变量
&emsp;&emsp; `Nginx`服务器的配置文件中可以包含一些预设的变量，以帮助大家获取`Nginx`自身和网络等方面的信息供配置使用。以下记录了`Nginx`服务器中常用的内置变量，并对变量的含义做了相应的解释，供大家在使用中查询。

- [nginx_variables](https://nginx.org/en/docs/varindex.html)

| 变量           | 说明  |
|:----:          | :---- |
| $arg_PARAMETER | 客户端GET请求中PARAMETER字段的值 |
| $args          | 客户端请求中的参数 |
| $binary_remote_addr | 远程地址的二进制表示 | 
| $body_bytes_sent | 已发送的消息体字节数 |
| $content_length | HTTP请求信息里的Content-Type 字段|
| $cookie_COOKIE  | 客户端请求中COOKIE头域的值 |
| $document_root | 针对当前请求的根路径设置值 |
| $document_uri | 与$uri相同 |
| $host | 请求信息中的Host头域值，如果请求中没有`Host`行，则等于设置的服务器名|
| $http_HEADER | HTTP请求信息里的HEADER字段 |
| $http_host  | 与$host相同，但如果请求信息中没有Host行，则可能不同客户端的cookie信息 |
| $http_cookie | 客户端的cookie信息 |
| $http_refere | 引用地址 |
| $http_user_agent | 客户端代理信息|
| $http_via | 最后一个访问服务器的IP地址 |
| $http_x_forwarded_for | 相当于网络访问路径 |
| $is_args | 如果$args有值，则等于"?";否则等于空 |
| $linit_rate | 对链接速率的限制 |
| $nginx_version | 对当前`Nginx`服务器的版本 |
| $pid | 当前`Nginx`服务器主进程的进程ID |
| $query_string | 与$args相同 |
| $remote_addr | 客户端IP地址 |
| $remote_port | 客户端端口号 |
| $remote_user | 客户端用户名，用于 Auth Basic Module验证 |
| $request | 客户端请求 |
| $request_body | 客户端请求的报文体 |
| $request_body_file | 发往服务器的本地临时缓存文件的名称 |
| $request_filename | 当前请求的文件路径名，由root 或 alias 指令与URI请求生成 |
| $request_method | 请求的方法，比如GET、POST等 |
| $request_uri | 请求的URI，带参数，不包含主机名 |
| $scheme | 所用的协议，如http 或者https。比如：rewrite^(.+)\$\$scheme://mysite.name$1redirect |
| $sent_http_cache_control | 服务端发送客户端的`Cache-Control`响应头的值。 |
| $sent_http_connection | |
| $sent_http_content_length ||
| $sent_http_content_type ||
| $sent_http_keep_alive ||
| $sent_http_last_modified ||
| $sent_http_location ||
| $sent_http_transfer_encoding ||
| $server_addr | 服务器地址，如果没有用`listen`指明服务器地址，使用这个变量将发起一次系统调用以取得地址(会造成资源浪费)|
| $server_name | 请求到达的服务名。|
| $server_port | 请求到达的服务器端口号 | 
| $server_protocol | 请求的协议版本，HTTP/1.0 或 HTTP/1.1 |
| $uri | 请求的不带请求参数的URI，可能和最初的值有不同，比如经过重定向之类的 | 
|
