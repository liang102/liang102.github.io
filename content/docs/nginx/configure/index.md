---
title: "Nginx Configure"
externalUrl: ""
summary: "configure 选项说明"
tags: ["Nginx"]
showRelatedContent: false
showReadingTime: false
invertPagination: false
weight: 99
---

### Nginx源码包介绍
- `sre:` 目录中存放了`Nginx`软件的所有源代码。
- `man:` 目录中存放了`Nginx`软件的帮助文档。
- `html:` 目录下存放了两个后缀名为`.html`的静态网页文件，与`nginx`服务器的运行相关。
- `conf:` 目录下存放了`Nginx`软件的配置文件,包含`Nginx`服务器的基本配置文件和对部分特性的配置文件。
- `auto:` 目录中存放了大量脚本文件，和`configure`脚本程序相关。
- `configure:` 文件是`Nginx`软件的自动脚本程序。运行`configure`自动脚本一般会完成两项工作：一是检查环境，根据环境检查结果生成C代码；二是生成编译代码所需要的`Makefile`文件。


### configure脚本支持的常用选项
- [nginx_configure](https://nginx.org/en/docs/configure.html)

| 选项|说明|
|:----:|:----|
|  \-\-help     |                        打印帮助信息|
|  \-\-prefix=PATH  |                    设置nginx安装路径。默认/usr/local/nginx/|
|  \-\-sbin-path=PATH |                  设置nginx可执行文件安装路径。默认\<prefix\>/sbin/|
|  \-\-modules-path=PATH  |              设置nginx动态模块安装目录。默认值为\<prefix\>/modules/|
|  \-\-conf-path=PATH|                   设置nginx配置文件nginx.conf的安装路径。默认\<prefix\>/conf/|
|  \-\-error-log-path=PATH |             设置nginx错误日志的安装路径。默认<prefix>/logs/
|  \-\-pid-path=PATH |                   设置nginx主进程pid文件nginx.pid的安装路径。默认\<prefix\>/logs/|
|  \-\-lock-path=PATH  |                 设置nginx锁文件 nginx.lock 的安装路径。默认/var/lock/|
|  \-\-user=USER  |                      设置启动nginx 进程用户。默认nobody|
|  \-\-group=GROUP  |                    设置启动nginx进程用户组。默认nobody|
| \-\-build=NAME  |                     设置一个可选的nginx编译名称。|
|  \-\-builddir=DIR |                    设置编译时生成的目录。 |
|  \-\-with-select_module |              启用select()方法模块，select是一种信号处理模式。 |
|  \-\-with-poll_module  |               启用poll()方法模块，poll是信号处理的一种方法，与select类似，轮询方法处理信号。|
|  \-\-with-threads  |                   启用线程池支持。|
|  \-\-with-file-aio |                   设置nginx异步文件I/O |
|  \-\-with-http_ssl_module |            设置nginx支持https协议，运行此模块需要OpenSSL库。|
|  \-\-with-http_v2_module |             设置nginx支持http2协议。|
|  \-\-with-http_realip_module |         设置nginx获取客户端真实IP地址。|
|  \-\-with-http_addition_module |       设置nginx响应前后添加文本。|
|  \-\-with-http_xslt_module |           设置nginx支持使用一个或多个 XSLT 样式表转换 XML 响应的过滤器。运行此模块需要libxml2和libxslt库。|
|  \-\-with-http_xslt_module=dynamic |   设置nginx支持使用一个或多个 XSLT 样式表转换 XML 响应的过滤器。运行此模块需要libxml2和libxslt库。|
|  \-\-with-http_image_filter_module |   设置nginx支持将图像转换为JPEG、GIF、PNG和WebP格式 |
|  \-\-with-http_image_filter_module=dynamic | 设置nginx支持将图像动态的转换为JPEG、GIF、PNG和WebP格式 |                             
|  \-\-with-http_geoip_module |          设置nginxz支持使用预编译的MaxMind数据库，根据客户端IP地址创建变量值 ，读取ip所在地信息。|
|  \-\-with-http_geoip_module=dynamic |  设置nginxz支持使用预编译的MaxMind数据库，根据客户端IP地址创建变量值 ，读取ip所在地信息。|
|  \-\-with-http_sub_module |            设置nginxz支持将响应中的一个给定字符串更改为另一个给定字符串|
|  \-\-with-http_dav_module |            设置nginx支持通过 WebDAV 协议实现文件管理自动化。该模块处理 HTTP 和 WebDAV 方法 PUT、DELETE、MKCOL、COPY 和 MOVE。
|  \-\-with-http_flv_module |            基于nginx-rtmp-module的流媒体服务器，为Flash Video(FLV)文件 提供服务端伪流媒体支持通过返回以请求偏移位置开始的文件内容，该模块专门处理 在查询串中有start参数的请求, 和有预先设置到FLV头部的请求。|
|  \-\-with-http_mp4_module |            设置nginx支持以 .mp4、.m4v、和.m4a为扩展名的文件，提供伪流媒体服务端支持。|
|  \-\-with-http_gunzip_module |         设置nginx支持为不支持gzip编码方法的客户端解压缩响应。|
|  \-\-with-http_gzip_static_module |    设置nginx支持允许发送文件扩展名为“.gz”的预压缩文件，而不是常规文件。|
|  \-\-with-http_auth_request_module |   设置nginx支持根据子请求的结果实现客户端授权。|
|  \-\-with-http_random_index_module|    设置nginx支持在文件夹中随机选择一个文件作为默认页。|
|  \-\-with-http_secure_link_module |    设置nginx支持用于检查所请求链接的真实性，保护资源免遭未经授权的访问，并限制链接生命周期。用于检查所请求链接的真实性，保护资源免遭未经授权的访问，并限制链接生命周期。|
|  \-\-with-http_degradation_module |    设置nginx支持degradation模块。|
|  \-\-with-http_slice_module |          设置nginx支持将请求拆分为子请求，每个子请求返回一定范围的响应。该过滤器提供了更有效的大响应缓存。|
|  \-\-with-http_stub_status_module |    设置nginx支持提供对基本状态信息的访问。|
|  \-\-with-http_perl_module |           设置nginx支持perl脚本，允许在 Perl 中实现位置和变量处理程序，并将 Perl 调用插入到 SSI 中。|
|  \-\-with-http_perl_module=dynamic |   设置nginx支持perl脚本，允许在 Perl 中实现位置和变量处理程序，并将 Perl 调用插入到 SSI 中。|
|  \-\-with-perl_modules_path=PATH |     设置perl模块的安装路径。|
|  \-\-with-perl=PATH |                  设置Perl二进制文件路径名称。|
|  \-\-http-log-path=PATH |              设置nginx访问日志access.log的安装路径。|
|  \-\-http-client-body-temp-path=PATH | 设置存储http客户端请求正文临时文件的路径。可以使用client_body_temp_path指令进行更改，默认\<prefix\>/client_body_temp。|
|  \-\-http-proxy-temp-path=PATH |       设置存储http代理临时文件的路径。可以使用proxy_temp_path指令进行更改，默认\<prefix\>/proxy_temp。|
|  \-\-http-fastcgi-temp-path=PATH |     设置存储http fastcgi临时文件的路径。可以使用fastcgi_tmp_path指令进行更改，默认\<prefix\>/fastcgi_temp。|
|  \-\-http-uwsgi-temp-path=PATH |       设置存储http uwsgi临时文件的路径。可以使用uwsgi_temp_path指令进行更改，默认\<prefix\>/uwsgi_temp。|
|  \-\-http-scgi-temp-path=PATH |        设置存储http scgi临时文件的路径。可以使用scgi_temp_path指令进行更改，默认\<prefix\>/scgi_temp。|
|  \-\-with-mail |                       设置nginx启用 POP3/IMAP4/SMTP 邮件代理模块。|
|  \-\-with-mail=dynamic |               设置nginx启用动态POP3/IMAP4/SMTP代理模块。|
|  \-\-with-mail_ssl_module |            设置邮件代理服务器支持SSL/TLS协议，需要安装OpenSSL库。|
|  \-\-with-stream |                     设置nginx启用TCP/UDP(四层)代理模块。|
|  \-\-with-stream=dynamic |             设置nginx启用动态TCP/UDP(四层)代理模块。|
|  \-\-with-stream_ssl_module |          设置四层代理(TCP/UDP)支持SSL/TLS协议，需要安装OpenSSL库。|
|  \-\-with-stream_realip_module |       设置nginx四层代理(TCP/UDP)支持获取客户端真实IP地址。|
|  \-\-with-stream_geoip_module |        设置nginx四层代理支持根据客户端IP地址和预编译的MaxMind数据库创建变量。|
|  \-\-with-stream_geoip_module=dynamic |设置nginx四层代理支持根据客户端IP地址和预编译的MaxMind数据库动态创建变量。|
|  \-\-with-stream_ssl_preread_module |  设置nginx四层代理支持允许在不终止 SSL/TLS 的情况下从 ClientHello 消息中提取信息。|
|  \-\-with-google_perftools_module |    模块是用来集成Google的高性能工具集（Google Performance Tools，简称gperftools），这个工具集可以提供更好的内存和CPU性能分析。|
|  \-\-with-cpp_test_module |            启用模块支持使用C++编写的测试代码，以便对Nginx进行单元测试和集成测试。|
|  \-\-add-module=PATH |                 设置第三方模块的安装路径。|
|  \-\-add-dynamic-module=PATH |         设置第三方动态模块的安装路径。|
|  \-\-with-compat |                     实现动态模块兼容性。|
|  \-\-with-cc=PATH |                    设置C编译器的路径名。|
|  \-\-with-cpp=PATH |                   设置C预处理器路径名。|
|  \-\-with-cc-opt=OPTIONS |             设置附加的C编译器选项。|
|  \-\-with-ld-opt=OPTIONS |             设置其他链接器选项。 |
|  \-\-with-cpu-opt=CPU |                启用按指定CPU构建：pentium、pentiumpro、pentium3、pentium4、athlon、optron、sparc32、sparc64、ppc64。|
|  \-\-with-pcre |                       强制使用PCRE库。|
|  \-\-with-pcre=DIR |                   设置到PCRE库的源的路径。需要从PCRE站点下载并提取库分发。其余部分由nginx完成/配置和制作，location指令中的正则表达式支持和ngx_http_rewrite_module模块都需要该库。|
|  \-\-with-pcre-opt=OPTIONS |           设置PCRE的其他构建选项。|
|  \-\-with-pcre-jit |                   使用JIT编译支持构建PCRE。|
|  \-\-with-zlib=DIR |                   设置zlib库源的路径。|
|  \-\-with-zlib-opt=OPTIONS   |         设置zlib其他构建选项。|
|  \-\-with-zlib-asm=CPU |               允许使用为指定CPU之一优化的zlib汇编程序源：pentium、pentiumpro。|
|  \-\-with-libatomic  |                 强制使用libatomic_ops库。|
|  \-\-with-libatomic=DIR  |             设置libatomic_ops库源的路径。|
|  \-\-with-openssl=DIR  |               设置OpenSSL库源的路径。|
|  \-\-with-openssl-opt=OPTIONS|         设置OpenSSL其他构建选项。|
|  \-\-with-debug  |                     启用nginx调试日志记录。|
