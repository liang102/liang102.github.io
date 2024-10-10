---
title: "Nginx Instruct"
externalUrl: ""
summary: "Nginx 基础指令介绍"
showRelatedContent: false
invertPagination: false
tags: ["Nginx"]
weight: 96
---

### Nginx配置基础指令

#### user
- 用于配置运行`Nginx`服务器的用户(组)的指令
- 只有被设置的用户或者用户组成员才有权限启动`Nginx`进程，如果是其他用户(test_user)尝试启用`Nginx`进程会报错。
- 如果希望所有用户都可以启动`Nginx`进程有两种方法：
  - 第一种： 将这个指令注释掉。
  - 第二种：将用户和用户组设置为默认的用户和用户组(nobody)
- 语法格式：
  - `user`: 指定运行`Nginx`服务器的用户。
  - `group`: 可选项，指定可以运行nginx服务器的用户组。
  - 作用域：全局

{{< alert icon="lightbulb" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  user [user] [group];
{{< /alert >}}


#### worker_processes 
- `worker_processes` 是`Nginx`服务器实现并发处理服务的关键所在。
- 从理论上来说，`worker_process`的值越大，可以支持的并发处理量也越多，但实际上它还要受到来自软件本身、操作系统本身资源和能力、硬件设备(如CPU和磁盘驱动器)等的制约。
- 语法格式：
  - `number`: 指定`Nginx`进程最多可以产生的`worker process`数。
  - `auto`: 设置该值，`Nginx`进程将自动检测。
  - 作用域：全局

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
   worker_processes number | auto; 
{{< /alert >}}


#### pid
- `Nginx`进程作为系统的守护进程运行，我们需要在某文件中保存当前运行程序的主进程号。
- `Nginx`支持对它的存放路径和名称自定义配置。
- 语法格式：
  - `file`：指定`Nginx`进程PID文件的存放路径和文件名称
  - 作用域：全局

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  pid file;
{{< /alert >}}


#### error_log
- 配置`Nginx`错误日志的存放路径和日志级别。
- `debug`日志级别需要在编译时使用(--with-debug)来开启`debug`日志。
- 设置某一级别后，比这一级别高的日志也会被记录。比如设置warn级别后，级别为warn 以及error、crit、alert和emerg的日志都会被记录下来。
- 语法格式：
  - `file`: 指定`Nginx`错误日志的存放路径和文件名称。指定的文件须对运行`Nginx`进程的用户具有写权限，否则会报错。
  - `stderr`: 指定错误日志级别，[debug | info | notice | warn | error | crit | alert | emerg]
  - 作用域：全局、`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  error_log file stderr;
{{< /alert >}}


#### include
- 在一些情况下，我们可能需要将其他的`Nginx`配置或者第三方模块的配置引用到当前的主配置文件中。
- `Nginx`提供了`include`指令来完成配置文件的引入。
- 引入进来的配置文件要求须对运行`Nginx`进程的用户具有写权限，并且符合`Nginx`配置文件规定的相关语法和结构。
- 语法格式：
  - `file`：指定要引入的配置文件，支持相对路径。
  - 作用域: 配置文件的任意地方

{{< alert icon="edit" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  include file;
{{< /alert >}}



#### accept_mutex
- 在《UNIX 网络编程》第1卷里提到过一个叫"惊群"的问题(Thundering herd problem)，大致意思是，当某一个时刻只有一个网络连接到来时，多个睡眠进程会被同时叫醒，但只有一个进程可获得连接。如果每次唤醒的进程数目太多，会影响一部分系统性能。在`Nginx`服务器的多进程下，就有可能出现这样的问题。
- 为了解决这样的问题，`Nginx`配置中包含了这样一条指令`accept_mutex`，当其设置为开启的时候，将会对多个`Nginx`进程接收连接进行序列化，防止多个进程对连接的争抢。
- 语法结构：
  - `on`: 开启
  - `off`: 关闭
  - 作用域：`events`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  accept_mutex on | off;
{{< /alert >}}



#### multi_accept
- 每个`Nginx`服务器的`worker process`都有能力同时接收多个新到达的网络连接，但是这需要在配置文件中进行配置。
- 语法结构：
  - `on`: 开启。高负载建议开启。
  - `off`: 关闭。默认off，即每个`worker process` 一次只能接收一个新到达的网络连接。低负载建议关闭。
  - 作用域：`events`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  multi_accept on | off;
{{< /alert >}}


#### use
- `Nginx`服务器提供了多种事件驱动模型来处理网络消息。配置文件中为我们提供了相关指令来强制`Nginx`服务器选择哪种事件驱动模型进行消息处理。
- 在编译的是否可使用`--with-select-module`是否强制编译`select`模块到`Nginx`内核中，或`--with-poll_module`是否强制将`poll`模块编译到`Nginx`内核中。
- 语法结构：
  - `method`：事件驱动模型。可选项：[select | poll | kqueue | epoll | rtsig | /dev/poll | eventport]。
  - 作用域：`events`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  use method;
{{< /alert >}}



#### worker_connections
- 主要用来设置允许每一个worker process同时开启的最大连接数。
- 语法格式：
  - `number`：指定最大连接数，默认512。不仅仅包括用户建立的连接数，而是包括所有可能的连接数，且该值不能大于操作系统支持打开的最大文件句柄数量65535。Linux 可以使用`ulimit -n`查看句柄数。
  - 作用域：`events`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  worker_connections number;
{{< /alert >}}


#### default_type
- 在常用的浏览器中，可以显示的内容有`HTMl、XML、GIF及Flash`等种类繁多的文本，媒体等资源，浏览器为区分这些资源，需要使用`MIME Type`。
- `MIME Type`是网络资源的媒体资源。`Nginx`作为`Web`服务器，必须能够识别前端请求的资源类型。
- 在默认的`Nginx`配置文件中，在http块中有`include mime.types;`配置，从`mim.type`文件内容片段可以看到，定义了一个`types`结构，结构中包含了浏览器能够识别的`MINE`类型以及对应于相关类型的文件后缀名。由于`mime.types`文件是主配置文件应用的第三方文件，因此，`types`也是`Nginx`配置文件中的一个配置块，称之为`types`块，其用于定义`MIME`类型。
- `default_types`指令用于处理前端请求的`MIME`类型。
- 语法结构：
  - `mime-type`：是types块中定义的MIME-Type。默认值为`text/plain`。
  - 作用域：`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  default_type mime-type;
{{< /alert >}}



#### access_log
- 用于记录`Nginx`服务器提供服务过程中应答前端请求的日志，称之为服务日志。
- `Nginx`服务器支持对服务日志的格式、大小、输出等进行配置。
- 语法格式：
  - `path`：配置服务日志的文件存放路径和名称。
  - `format`：可选项，自定义服务日志的格式字符串，也可以通过“格式字符串”名称使用`log_format`指令定义好的格式。
  - `buffer`=size：配置临时存放服务日志的内存缓存区大小。
  - `off`：取消记录服务日志
  - 作用域：`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  access_log path [format[buffer=size]] | off;
{{< /alert >}}


#### log_format
- 用于定义服务日志的格式，并且可以为格式字符串定义一个名称，以便`access_log`指令可以直接调用。
- 语法格式：
  - name：格式字符串的名称，默认名称`combined`
  - `string`：服务日志的格式字符串。在定义的过程中，可以使用`Nginx`配置预设的一些变量获取相关内容，变量名称使用双引号括起来，`string`整体使用单引号括起来。在`string`中可以使用的变量参见
{{< button href="/docs/nginx/var/" target="_self" >}}
Nginx 内置变量
{{< /button >}}
  - 作用域：`http`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  log_format name string ...;
{{< /alert >}}

&emsp;&emsp;来看一个示例：
```bash
log_format exampleLog '$remote_addr - [$time_local] $request '
                   '$status $body_bytes_sent $http_referer '
                   '$http_user_agent';
```
> 这条配置定义了服务日志文件的名称为 exampleLog。来看测试结果
```bash
192.168.1.1 - [15/Oct/2024:19:20:41 +0800] "GET / HTTP/1.1" 200 151 "-" "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)"
192.168.1.1 - [15/Oct/2024:19:20:41 +0800] "GET /favicon.ico HTTP/1.1" 404 570 "-" "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)"
```
&emsp;&emsp;简单分析一下第二条日志，`$remote_addr`获取到用户机的IP地址为`192.168.1.1`，`$time_local`获取到本地时间为`15/Oct/2024:19:20:41 +0800`，`$request`获取到请求为`GET /favicon.ico HTTP/1.1`，`$status`获取到请求状态为`404`，`$body_bytes_sent` 获取到请求体的大小为`570B`，`$http_referer`未获取到任何内容，`$http_user_agent`获取到用户使用`Mozilla`浏览器。<br>
&emsp;&emsp; 通过分析可以看到，在正常情况下，对于绝大多数的内置变量，`Nginx`服务器都能够获取到相关内容，但也会出现空值的情况。


#### sendfile
- 在`Apache`、`lighttpd` 等`Web`服务器配置中，都有和`sendfile`相关的配置。
- `sendfile` 是一种高效的文件传输机制，它允许服务器直接在内核空间和文件系统之间传输文件，而无需将文件内容复制到用户空间。这样可以显著提高文件传输的效率和性能，特别是对于大文件或高负载的情况。
- `sendfile` 指令只适用于传输静态文件，对于动态内容（如 `PHP` 脚本输出）不适用。
- 语法格式：
  - `on`：开启
  - `off`：关闭
  - 作用域：`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  sendfile on | off;
{{< /alert >}}



#### sendfile_max_chunk
- 用于设置每个 `sendfile` 传输的最大字节数。
- 当需要传输的文件大小超过`size`此值时，`Nginx` 会分割文件并使用多个 `sendfile` 操作进行传输。
- 其中，`size`值如果大于0，`Nginx`进程的每个`worker process`每次调用`sendfile()`传输的数据量最大不能超过这个值；如果设置为0，则无限制。
- 语法结构：
  - `size`：传输的字节数大小，默认为0
  - 作用域：`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  sendfile_max_chunk size;
{{< /alert >}}




#### keepalive_timeout
- 与用户建立会话连接后，`Nginx`服务器可以保持这些连接打开一段时间。
- 语法结构：
  - `timeout`：服务器端对连接的保持时间，以秒为单位。默认值为75s
  - `header_timeout`：可选项，用于设置在发送响应头后等待客户端发送请求头的超时时间。如果在该时间内没有收到新的请求头，服务器将关闭连接。在应答报文头部的`Keep-Alive`域设置超时时间：`Keep-Alive: timout=header_timeout`。报文中的这个指令可以被`Mozilla`或者`Konqueror`识别。
  - 作用域：`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  keepalive_timeout timeout [header_timout];
{{< /alert >}}



#### keepalive_requests 
- `Nginx`服务端和用户端建立会话连接后，用户端通过此连接发送请求。
- `keepalive_requests`指令用于限制用户通过某一连接向`Nginx`服务器发送请求的次数。
- 语法格式：
  - `number`：设置用户端发送请求的次数。默认为100
  - 作用域：`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  keepalive_requests number;
{{< /alert >}}


#### listen
- 用于网络监听，配置方法主要有三种：
  - 监听IP地址
  - 监听端口
  - 监听域名

- 监听IP的语法结构：
{{< alert icon="lightbulb" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  listen address[:port] [default_server] [setfib=number] [backlog=number] [rcvbuf=size] [sndbuf=size] [deferred]
         [accept_filter=filter] [bind] [ssl];
{{< /alert >}}

- 监听端口的语法结构：
{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  listen address port [default_server] [setfib=number] [backlog=number] [rcvbuf=size] [sndbuf=size]               [accept_filter=filter] [deferred] [bind] [ipv6only=on|off] [ssl];
{{< /alert >}}

- 监听UNIX Domain Socket(一种在原有Socket框架上发展起来的IPC机制，用于在单个主机上执行客户/服务器通信。)的语法结构：
{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  listen unix:path [default_server] [backlog=number] [rcvbuf=size] [sndbuf=size] [accept_filter=filter] [deferred]
  [bind] [ssl];
{{< /alert >}}

  - address：IP地址，如果是`IPv6`的地址，需要使用中括号"[]"括起来。
  - port：端口号，如果只定义了IP地址没有定义端口号，就使用80端口。
  - path：socket文件路径，如`/var/run/nginx.sock`等
  - default_server：标识符，将此虚拟主机设置为`address:port`的默认主机。
  - setfib=number：`Nginx`-0.8.44中使用这个变量监听`socket`关联路由表，目前只对`FreeBSD`起作用，不常用。
  - backlog=number：设置监听函数`listen()`最多允许多少网络连接同时处理挂起状态，在`FreeBSD`中默认为-1，其他平台默认511。
  - rcvbuf=size：设置监听`socket`接收缓存区大小。
  - sndbuf=size：设置监听`socket`发送缓存区大小。
  - deferred：标识符，将`accept()`设置为`Deferred`模式。
  - accept_filter=filter：设置监听端口对请求的过滤，被过滤的内容不能被接收和处理。该指令只在`FreeBSD`和`NetBSD 5.0+`平台下有效。filter可以设置为`dataready`或`httpready`
  - bind：标识符，使用独立的bind()处理此`address:port`；一般情况下，对于端口相同而IP地址不同的多个连接，`Nginx`服务器将只使用一个监听命令，并使用bind()处理端口相同的所有连接。
  - ssl：标识符，设置会话连接使用`SSL`模式进行，此标识符和`Nginx`服务器提供的`HTTPS`服务有关。
  - 作用域：`server`

&emsp;&emsp; 下面给出一些示例开说明`listen`的用法
```bash
listen *:80 | *:8080；
# 监听所有80端口和8080端口。

listen 192.168.1.1：8000；    # 监听具体的IP和具体的端口上的连接
listen 192.168.1.1;           # 监听具体的IP的所有端口上的连接
listen 8000;                  # 监听具体端口上的所有IP连接，等同于 listen *:8000;
listen 192.168.1.1 default_server backlog=1024;   # 设置192.168.1.1的连接请求默认此虚拟主机处理，并且允许最多1024网络连接同时处于挂起状态。
```


#### server_name
- 是指`server`块对外提供的虚拟主机。设置了主机的名称并配置好`DNS`，用户就可以使用这个名称向此虚拟主机发送请求了。
- 语法结构：
  - name：域名。对于`name`来说，可以只有一个域名，也可以由多个域名并列，之间用空格隔开。也可以使用IP地址，但是这种方式不推荐。

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  server_name name ...;
{{< /alert >}}
&emsp;&emsp; 下面给出一些示例来说明`server_name`的用法
```bash
server_name myserver.com www.myserver.com;
```
&emsp;&emsp; 在该例中，`Nginx`服务器规定，第一个名称作为此虚拟主机的主要名称。
```bash
server_name *.myserver.com www.myserver.*;
```
&emsp;&emsp; 在该例中，`name`可以使用通配符`*`，但通配符只能用在由三段字符串组成的名称的首段和尾段，或者由两段字符串组成的名称的尾段。
```bash
server_name ~^www\d+\.myserver\.com$;
```
&emsp;&emsp; `name`还可以使用正则表达式，并使用波浪号`~`作为正则表达式字符串的开始标记。在该例中，正则表达式的含义：以`www`开头(使用`^`标记)，紧跟一个或多个`0~9`的数字(`\d+`的含义，其中，`\d`代表`0~9`的某一个数字，`+`代表之前的一个字符出现一次或者多次)，再紧跟`.myserver.co`(由于`.`在正则表达式中有特殊含义，因此需要使用`\`进行转义)，最后以`m`结束(由`$`标记)。关于正则表达式的相关内容参见
{{< button href="/docs/nginx/regex/" target="_self" >}}
  正则表达式
{{< /button >}}

```bash
server_name ~^www\.(.+)\.com$;
```
&emsp;&emsp; `Nginx`从`0.7.40`版本开始，`name`中的正则表达式支持字符串捕获功能。当请求通过`www.myserver.com`到达`Nginx`服务器端时，将会被上面的正则表达式配置成功，其中的`myserver`将会被捕获，并记录到`$1`中。在本`server`块的下文配置中，当需要`myserver`时，就可以使用`$1`代替`myserver`了。<br>
&emsp;&emsp; 由于`server_name`指令支持使用通配符和正则表达式两种配置名称的方式，因此在包含有多个虚拟主机的配置文件中，可能会出现一个名称被多个虚拟主机的`server_name`匹配成功。那么，来自这个名称的请求到底要交给哪个虚拟主机处理呢？`Nginx`服务器做出如下规定： <br>
a. 对于匹配方式不同的，按照以下的优先级选择虚拟主机，排在前面的优先处理请求。<br>
&emsp;&emsp; ① 准确匹配`server_name` <br>
&emsp;&emsp; ② 通配符在开始时匹配`server_name`成功 <br>
&emsp;&emsp; ③ 通配符在结尾时匹配`server_name`成功 <br>
&emsp;&emsp; ④ 正则表达式匹配`server_name`成功  <br>
b. 在以上四种匹配方式中，如果`server_name`被处于同一优先级的匹配方式多次匹配成功，则首次匹配成功的虚拟主机处理请求。

 
### 配置location块
- 语法结构:

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  location [ = | ~ | ~* | ^~ ] uri {......}
{{< /alert >}}

  - `uri`：变量是待匹配的请求字符串，可以是不含正则表达的字符串，如`/myserver.php`等，称之为`标准uri`；可以是包含有正则表达的的字符串，如`\.php$`(表示以`.php`结尾的`URL`)等，称之为`正则uri`。
  - 方括号部分是可选项，用来改变字符串与`uri`的匹配方式。

&emsp;&emsp;在不添加方括号选项时，`Nginx`服务器首先在`server`块的多个`location`块中搜索是否有标准`uri`和请求字符串匹配，如果有多个可以匹配，旧纪录匹配度最高的一个。然后服务器再用`location`块中的正则`uri`和请求字符串匹配，当第一个正则`uri`匹配成功，结束搜索，并使用这个`location`块处理次请求；如果正则匹配全部失败，就是用刚才记录的匹配度最高的`location`块处理此请求。<br>
- `=`：用于标准`uri`前，要求请求字符串与`uri`严格匹配。如果已经匹配成功，就停止继续搜索并立即处理此请求。
- `~`：用于表示`uri`包含正则表达式，并且区分大小写。
- `~*`：用于表示`uri`包含正则表达式，并且不区分大小写。
- `^~`：用于标准`uri`前，要求`Nginx`服务器找到标识`uri`和请求字符串匹配度最高的`location`后，立即使用此`location`处理请求，而不再使用`location`块中的正则`uri`和请求字符串做匹配。

**注意：** <br>
&emsp;&emsp; 在浏览器传送`URI`时对一部分字符进行`URI`编码，比如空格被编码为`%20`，问号被编码为`%3f`等。`^~`有一个特点是，它对`uri`中的这些符号将会进行编码处理。比如，如果`location`块收到的`URI`为 `html%20/data`，则当`Nginx`服务器搜索到配置为 `^~ /html /data` 的`location`时，可以匹配成功。


#### root
- `Web`服务器接收到网络请求之后，首先要在服务器端指定目录中寻找请求资源。在`Nginx`服务器中，指令`root`就是用来配置这个根目录的。
- 语法结构：
  - `path`：`path`为Nginx服务器接收到请求以后查找资源的根目录路径。`path`变量中可以包含Nginx服务器预设的大多数变量，只有 `$document_root` 和 `$realpath_root` 不可以使用。
  - 作用域：http、server、location

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  root path;
{{< /alert >}}

&emsp;&emsp; `root`指令的一个示例为：
```bash
location /data/
{
  root /locationtest1;
}
```
> 当`location`块接收到了`/data/index.htm`的请求时，将在`/locationtest1/data/`目录下找到`index.htm`响应请求。


#### alias
- 在location块中，除了使用root指令指明请求处理根目录，还可以使用alias指令改变location接收到的URI的请求路径。
- 语法结构：
  - `path`：`path`即为修改后的根路径。同样，此变量中也可以包含除了`$document_root` 和 `$realpath_root`之外的其他Nginx服务器预设变量。

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  alias path;
{{< /alert >}}

示例：
```bash
location ~ ^/data/(.+\.htm|htm)$
{
  alias /locationtest1/other/$1;
}
```
> 当此`location`块接收到 `/data/index.htm` 请求时，匹配成功，之后根据`alias`指令的配置，`Nginx`服务器将到`/locationtest1/other`目录下找`index.htm`并响应请求。可以看到，通过`alias`指令的配置。根路径已经从`/data` 更改为`/locationtest1/other` 了。


#### index
- 用于设置网站的默认首页，它一般可以有两个作用：
  - 1：用户在发出请求访问网络时，请求地址可以不写首页名称
  - 2：可以对一个请求，根据其请求内容而设置不同的首页。
- 语法结构：
  - `file`：`file`变量可以包括多个文件名，期间使用空格分隔，也可以包含其他变量。此变量默认为`index.html`。

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  index file ...;
{{< /alert >}}

示例：
```bash
location ~ ^/data/(.+)/web/ $
{
  index index.$1.html index.my1.html index.html;
}
```
> 当`location`块接收到 `/data/locationtest/web/`时，匹配成功，它首先将预置变量`$1` 置为`locationtest`，然后在`/data/locationtest/web/`路径下按照`index`的配置次序依次寻找`index.locationtest.html`页、`index.my1.html`页 和 `index.html`页，首先找到哪个页面，就是用哪个页面响应请求。

#### error_pgae
- Nginx服务器设置网络错误页面的指令为`error_page`。
- 语法结构：
  - `code`：要处理的`HTTP`错误代码，参见
{{< button href="/posts/httpstatus/" target="_self" >}}
HTTP 常见错误代码
{{< /button >}}
  - reponse：可选项，将`code`指定的错误代码转化为新的错误代码`response`。
  - uri：错误页面的路径或者网站地址。如果设置为路径，则是以Nginx服务器按照路径下的`html`目录作为根路径的相对路径；如果设置为网址，则`Nginx`服务器会直接访问该网址获取错误页面，并返回给用户端。
  - 作用域：http、server、location
  
{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  error_page code [=[response]] uri;
{{< /alert >}}

示例：
```bash
error_page 404 /404.html;
```
> 设置`Nginx`服务器使用Nginx安装路径`/html/404.html` 页面响应404错误。

```bash
error_page 403 http://somewebsite.com/forbiden.html;
```
> 设置`Nginx`服务器使用`http://somewebsite.com/forbiden.html`页面响应403错误。

```bash
error_page 410 =301 /empty.gif;
```
> 设置`Nginx`服务器产生410的`HTTP`消息时，使用Nginx安装路径`/html/empty.gif` 返回给用户端301消息。

&emsp;&emsp;从`error_page`指令分析中可以看到，，变量`uri`实际上是一个相对于`Nginx`服务器安装路径的相对路径。那么，如果不想将错误页面放到`Nginx`服务器的安装路径下管理，该怎么做？很简单，只需要将另外使用一个`location`指令定向错误页面到新的路径下面就可以了。<br>
&emsp;&emsp; 对于上面第一个示例，我们希望`Nginx`服务器使用`/myserver/errorpages/404.html`页面响应404错误。
```bash
error_page 404 /404.html;

location /404.html
{
  root /myserver/errorpages/;
}
```
> 首先捕获`404.html`请求，然后将请求定向到新的路径下面即可。




#### allow
- `Nginx`配置通过两种途径支持基本访问权限的控制，其中一种是由`HTTP`标准模块`ngx_http_access_module`支持的，其通过IP来判断客户端是否拥有对`Nginx`的访问权限。
- 用于设置允许访问`Nginx`的客户端IP。
- 语法结构：
  - `address`：允许访问的客户端IP，不支持同时设置多个。如果有多个IP需要设置，需要重复使用`allow`指令。
  - `CIDR`：允许访问的客户端的CIDR地址，例如 `202.80.18.23/25`，前面是32位IP地址，后面`/25`代表该IP地址中前25位是网络部分，其余位代表主机部分。
  - `all`：代表允许所有客户端访问。`Nginx 0.8.22`版本后也支持ipv6地址。
  - 作用域：`http`、`server`、`location`

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  allow address | CIDR | all;
{{< /alert >}}

示例：
```bash
allow 2620:108:e000::8001;
```

#### deny
- 作用刚好和`allow`相反，它用于设置禁止访问`Nginx`的客户端IP。
- 语法结构：
  - `address`：禁止访问的客户端IP，不支持同时设置多个。如果有多个IP需要设置，需要重复使用`deny`指令。
  - `CIDR`：禁止访问的客户端的CIDR地址。
  - `all`：代表禁止所有客户端访问。
  - 作用域：`http`、`server`、`location`


{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  deny address | CIDR | all;
{{< /alert >}}


示例：
```bash
location {
  deny 192.168.1.1;
  allow 192.168.1.0/24;
  deny all;
}
```
> 这个示例中，首先配置禁止`192.168.1.1`访问`Nginx`，然后配置允许`192.168.1.0/24`访问`Nginx`，最后又使用`all`配置禁止所有IP的访问，那么，`192.168.1.0/24`客户端到底可不可以访问呢？是可以的。
>
> `Nginx`配置在解析的过程中，遇到`deny`指令或者`allow`指令是按照顺序对当前客户端的连接进行访问权限检查的。如果遇到匹配的配置时，则停止继续向下搜索相关配置。因此，当`192.168.1.0/24`客户端访问时，`Nginx`在第3行解析配置发现允许该客户端访问，就不会继续向下解析第4行了。



#### auth_basic
- `Nginx`还支持基于`HTTP Basic Authentication`协议的认证。该协议时一种HTTP性质的认证办法，需要识别用户名和密码，认证失败的客户端不拥有访问`Nginx`服务器的权限。该功能由HTTP标准模块`ngx_http_auth_basic_module`支持。
- 语法结构：
  - `string`：开启该认证功能，并配置验证时的指示信息。
  - `off`：关闭该认证功能。

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  auth_basic string | off;
{{< /alert >}}



#### auth_basic_user_file
- 用于设置包含用户名和密码信息的文件路径。
- 语法结构：
  - `file`：密码文件的绝对路径。支持明文或者密码加密后的文件。

{{< alert icon="circle-info" iconColor="#7EE0F0" cardColor="#7EE0F0"  >}}
  auth_basic_user_file file;
{{< /alert >}}

> 加密密码可以使用crypt()函数进行密码加密的格式，可以使用`htpasswd`命令生成。
```bash
htpasswd  -c  -d /nginx/conf/pass_file username   # 运行后输入密码即可
```
