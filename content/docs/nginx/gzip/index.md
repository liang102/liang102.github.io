---
title: "Nginx 服务器的 GZIP 压缩"
externalUrl: ""
summary: "介绍gzip相关的指令配置及功能的使用。"
tags: ["nginx"]
showRelatedContent: false
invertPagination: false
weight: 99
---


## 由ngx_http_gzip_module 模块处理的9个指令
- ngx_http_gzip_module 模块主要负责Gzip功能的开启和设置，对响应数据进行在线实时压缩。



### gzip 指令
- 该指令用于开启或者关闭Gzip功能
```bash
gzip on | off;
```
> 默认情况下，该指令设置为off，即不启用gzip功能。只有将启用该指令，下列各指令设置才有效。



### gzip_buffers 指令
- 该指令用于设置Gzip压缩文件使用缓存空间的大小
```bash
gzip_buffers number size;
```
> number: 指定nginx服务器需要向系统申请缓存空间的个数。
>
> size: 指定每个缓存空间的大小。
>
> 根据该配置项，Nginx服务器在对响应输出数据进行Gzip压缩时需要向系统申请number*size 大小的空间用于存储压缩数据。从Nginx 0.7.28开始，默认情况下 number * size的值为128，其中size的值取系统内存页一页的大小，为4KB或者8KB,
```bash
gzip_buffers 32 4k | 16 8k;
```


### gzip_comp_level 指令
- 该指令用于设定Gzip压缩程度，包括级别1到级别9.级别1表示压缩程度最低，压缩效率最高；级别9表示压缩程度最高，压缩效率最低，最费时间。
```bash
gzip_comp_level level;
```
> 默认值设置为级别1。



### gzip_disable 指令
- 针对不同种类客户端发起的请求，可以选择性地开启和关闭gzip功能。该指令从Nginx0.6.23启用，用于设置一些客户端种类。Nginx服务器在响应这些种类的客户端请求时，不使用Gzip功能缓存响应输出数据。
```bash
gzip_disable regex ...;
```
> regex：根据客户端的浏览器标志(User-Agent，UA)进行设置，支持使用正则表达式。
- 常见的PC浏览器及手机浏览器的UA字符串，见下表


|浏览器|UA 字符串|
| :----: | :----|
| Inernet Explorer 系列浏览器 
| Internet Explorer10 | Mozilla/5.0(compatible;MSIE 10.0;Windows NT6.1;Trident/6.0)   |
| Internet Explorer9 | Mozilla/5.0(compatible;MSIE 9.0;Windows NT6.1;Trident/5.0) |
| Internet Explorer8 | Mozilla/4.0(compatible;MSIE 8.0;Windows NT6.0;Trident/4.0) |
| Internet Explorer7 | Mozilla/4.0(compatible;MSIE 7.0;Windows NT6.0) |
| Internet Explorer6 | Mozilla/4.0(compatible;MSIE 6.0;Windows NT5.1) |
| 火狐(FireFox)系列浏览器
| Firefox7(Windows 平台) | Mozilla/5.0(Windows NT6.1;Intel Mac OS X 10.6;rv7.0.1)Gecko/20100101 Firefox/7.0.1 |
| Firefox7(Mac 平台) | Mozilla/5.0(Macintosh;Intel Mac OS X 10.6;rv7.0.1)Gecko/20100101 Firefox/7.0.1 |
| Firefox4(Windows 平台) | Mozilla/5.0(Windows NT6.1;rv2.0.1)Gecko/20100101 Firefox/4.0.1 |
| Firefox4(Mac 平台) | Mozilla/5.0(Macintosh;Intel Mac OS X 10.6;rv2.0.1)Gecko/20100101 Firefox/4.0.1 |
| 谷歌(Chrom)浏览器 
| Chrome 10 及之前版本(Windows 平台) | Mozilla/5.0(Windows;U;Windows NT5.1len-US)AppleWebKit/=version(KHTML,like Gecko)Chrome/version Safari/534.16 |
| Chrome 10 及之前版本(Linux 平台) | Mozilla/5.0(X11;U;Linux x86_64;en-US)AppleWebKit/version(KHTML,like Gecko)Chrome/version Safari/534.16 |
| Chrome 11 (Windows 平台) | Mozilla/5.0(Windows;U;Windows NT6.0;WOW64)AppleWebKit/534.24(KHTML,like Gecko)Chrome/version Safari/534.24 |
| Chrome 11 (Linux 平台) | Mozilla/5.0(X11;Linux x86_64)AppleWebKit/version(KHTML,like Gecko)Chrome/534.24 Safari/534.24 |
| Opera 浏览器
| Opera 7(Windows 平台) | Opera/7.54(Windows NT 5.1;U)[en] |
| Opera 8(Windows 平台) | Opera/8.0(Windows NT 5.1;en)
| Opera 9(Windows 平台) | Mozilla/5.0(Windows NT 5.1;U;en;rv:1.8.1)Gecko/20061208 Firefox/2.0.0.0 Opera9.50Mozilla/4.0(compatible;MSIE 6.0;Windows NT5.1;en) |
| Opera 10(Windows 平台) | Opera/9.80(Macinitosh;Intel Mac OS X;U;en)Persto/2.2.15 Version/10.00 |
| iOS 系列平台浏览器
| iOS 6 (iPhone) | Mozilla/5.0(iPhone;CPU iPhone OS 6_0 like Mac OS X)AppleWebKit/536.26(KHTML,like Gecko)Version/6.0 Mobile/10A403 Safari/8536.25 |
| iOS 6 (iPad) | Mozilla/5.0(iPad;CPU iPhone OS 6_0 like Mac OS X)AppleWebKit/536.26(KHTML,like Gecko)Version/6.0 Mobile/10A403 Safari/8536.25 |
| iOS 5 (iPhone) | Mozilla/5.0(iPhone;CPU iPhone OS 5_0 like Mac OS X)AppleWebKit/534.46(KHTML,like Gecko)Version/5.1 Mobile/9A334 Safari/7534.48.3 |
| iOS 5 (iPad) | Mozilla/5.0(iPad;CPU iPhone OS 5_0 like Mac OS X)AppleWebKit/534.46(KHTML,like Gecko)Version/5.1 Mobile/9A334 Safari/7534.48.3 |
| iOS 4 (iPhone) | Mozilla/5.0(iPhone;CPU iPhone OS 4_3_2 like Mac OS X;en-us)AppleWebKit/533.17.9(KHTML,like Gecko)Version/5.0.2 Mobile/8H7 Safari/6533.18.5 |
| iOS 4 (iPad) | Mozilla/5.0(iPad;CPU iPhone OS 4_3_2 like Mac OS X;en-us)AppleWebKit/533.17.9(KHTML,like Gecko)Version/5.0.2 Mobile/8H7 Safari/6533.18.5 |
| Android 平台浏览器
| Android 4.1.2 | Mozilla/5.0(Linux;U;Andriud 4.1.2;zh-cn;Nexus S Build/JZO54K)AppleWebKit/534.30(KHTML,like Gecko)Version/4.0 Mobile/8H7 Safari/534.30  |
| Android 4.0.2 | Mozilla/5.0(Linux;U;Andriud 4.0.2;en-us;Galaxy Nexus Build/ICL53F)AppleWebKit/534.30(KHTML,like Gecko)Version/4.0 Mobile/8H7 Safari/534.30 |
| Android 2.3.6 | Mozilla/5.0(Linux;U;Andriud 2.3.2;en-us;Nexus S Build/GRK39F)AppleWebKit/533.1(KHTML,like Gecko)Version/4.0 Mobile/8H7 Safari/533.1 |
|

**注意：** <br>
&emsp;&emsp; 由于浏览器的UA可以人为更改，因此对于实际情况还要进行具体分析。表格中列举的常见浏览器及UA字符串只符合默认情况。<br>
&emsp;&emsp; 下面为gzip_disable指令的一个示例：
```bash
gzip_disable MSIE [4-6].\;
```
> 该设置使用了正则表达式，可以匹配UC字符串中包含MSIE4、MSIE5和MSIE6的所有浏览器，响应这些浏览器发出的请求时，Nginx服务器不进行GZIP压缩。


### gzip_http_version 指令
- 早期的一些浏览器或者HTTP客户端，可能不支持gzip自解压，因此有时会看到乱码，所以针对不同的HTTP协议版本，需要选择性地开启或者关闭gzip功能。该指令用于设置开启gzip功能的最低HTTP协议版本。
```bash
gzip_http_version 1.0 | 1.1;
```
> 设置为1.1版本，即只有客户端使用1.1及1.1以上版本的HTTP协议时，才使用gzip功能对响应输出数据进行压缩。



### gzip_min_length 指令
- Gzip 压缩功能对绝大多数的压缩效果明显，但是如果压缩很小的数据，可能出现越压缩数据量越大的情况(许多压缩算法都有这样的情况发生)，因此应该根据响应页面的大小，选择性地开启或者关闭gzip功能。该指令设置页面的字节数，当响应页面的大小>该值时，才启用gzip功能。响应页面的大小通过HTTP响应头部中的Content-Length 指令获取，但是如果使用了Chunk编码动态压缩，Content-Length 或不存在或被忽略，该指令不起作用。
```bash
gzip_min_length 1024;
```
> 默认设置为20，设置为0时表示不管响应页面大小如何统统压缩。建议设置1KB以上，防止出现数据越压越大的情况。



### gzip_proxied 指令
- 该指令在使用Nginx服务器的反向代理功能时有效，前提时在后端服务器返回的响应页头部中，Request部分包含用于通知代理服务器的Via头域。它主要用于设置Nginx服务器是否对后端服务器返回的结果进行Gzip压缩。
- off: 关闭Nginx 服务器对后端服务器返回结果的gzip压缩，默认设置。
- expired：当后端服务器响应页头部包含用于指示响应数据过期时间的expired 头域时，启用对响应数据的gzip压缩。
- no-cache：当后端服务器响应页头部包含用于通知所有缓存机制是否缓存的 Cache-Control 头域、且指令值为no-cache 时，启用对响应数据的压缩。
- private：当后端服务器响应页头部包含用于通知所有缓存机制是否缓存的Cache-Control 头域、且指令值为private时，启用对响应数据的gzip压缩。
- no_last_modified：当后端服务器响应页头部不包含用于指明需要获取数据最后修改时间的Last-Modified 头域时，启用对响应数据的gzip压缩。
- no-etag：当后端服务器响应页头部不包含用于标示被请求变量的实体值的ETag头域时，启用对响应数据的gzip压缩。
- auth：当后端服务器响应页头部包含用于标示HTTP授权证书的Authorization 头域时，启用对响应数据的gzip压缩。
- any：无条件启用对后端服务器响应数据的gzip压缩。
```bash
gzip_proxied off | expired | no-cache | no-store | private | no_last_modified | no_etag | auth | any ...;
```
> 该指令的设置需要对HTTP协议的HTTP header 消息有基本的了解。



### gzip_types 指令
- Nginx 服务器可以根据响应页的MIME类型选择性地开启gzip压缩功能。该指令用来设置MIME类型，被设置的类型将被压缩。
```bash
gzip_types mime-type ...;
```
> mime-type 变量的取值默认为text/html，但实际上，在gzip指令设置为on时，Nginx服务器会对所有的text/html 类型页面数据进行gzip压缩。该变量还可以取`*`值，表示对所有MIME类型的页面数据进行gzip压缩。一般情况下我们压缩常规的文件类型时，可以设置为
```bash
gzip_types text/plain application/x-javascript text/css text/html application/xml;
```



### gzip_vary 指令
- 该指令用于设置在使用gzip功能时是否发送带有"Vary: Accept-Encoding"头域的响应头部。该头域的主要功能是告诉接收方发送的数据经过了压缩处理。开启后的效果是在响应头部添加了"Accept-Encoding：gzip"，这对于本身不支持gzip压缩的客户端浏览器是有用的。
```bash
gzip_vary on | off;
```
> 默认off。我们可以通过Nginx配置的add_header指令强制Nginx服务器在响应头部添加"Vary: Accept-Encoding"头域，以达到相同效果。
```bash
add_header Vary Accept-Encoding gzip;
```
> 该指令在使用过程中存在bug，会导致IE4及以上的浏览器的数据缓存功能失效。



## 由 ngx_http_gzip_static_module 模块处理的指令
- ngx_http_gzip_static_module 模块主要负责搜索和发送经过gzip功能的预压缩的数据。这些数据以`.gz`作为后缀名存储在服务器上。如果客户端请求的数据在之前被压缩过，且客户端浏览器支持gzip压缩，就直接返回压缩后的数据。
- 该模块与ngx_http_gzip_module 模块的不同之处主要在于，该模块使用的是静态压缩，在HTTP响应头部包含Cntent-Length 头域来指明报文体的长度，用于服务器可确定响应数据长度的情况；而后者默认使用Chunked 编码的动态压缩，其主要适用于服务器无法确定响应数据长度的情况，比如文件下载的情形，这时需要实时生成数据长度。
- 与该模块有关的指令主要有以下几个：`gzip_static、gzip_http_version、 gzip_proxied、gzip_disable和gzip_vary`等。
- 其中的gzip_static 指令，用于开启和关闭该模块的功能。
  - on：开启该模块的功能。
  - off: 关闭该模块的功能。
  - always：一直发送gzip预压缩文件，而不检查客户端浏览器是否支持gzip压缩。
```bash
gzip_static on | off | always;
```
- 其他指令与ngx_http_gzip_module 模块下的使用方式相同。gzip_proxied 指令只接收以下设置
```bash
gzip_proxied expired no-cacahe no-store private auth;
```
> 对于该模块下的gzip_vary指令，开启以后只给未压缩的内容添加"Vary: Accept-Encoding"头域，而不是对所有的内容都添加。如果需要给所有响应头添加该头域，可以通过Nginx配置的add_header指令实现。



### 由ngx_http_gunzip_module 模块处理的2个指令
- Nginx服务器支持对响应输出数据流进行Gzip压缩，这对客户端浏览器来说，需要有能力解压和处理gzip压缩数据，但如果客户端本身不支持该功能，就需要Nginx服务器在向其发送数据之前先将该数据解压。这些压缩数据可能来自于后端服务器压缩产生或者Nginx服务器预压缩产生。
- Ngx_http_gunzip_module 模块便是用来针对不支持gzip压缩数据处理的客户端浏览器，对压缩数据进行解压处理的，与它有关的指令主要有以下几个：`gunzip、gunzip_buffers、gzip_http_version、gzip_proxied、gzip_disable和gizp_vary`等。


### gunzip 指令
- 该指令用于开启或者关闭该模块的功能。
  - on: 开启该模块的功能
  - off: 关闭该模块的功能
```bash
gunzip_static on| off;
```
> 该指令默认off。当功能开启时，如果客户端浏览器不支持gzip处理，Nginx服务器将返回解压后的数据；如果客户端浏览器支持gzip处理，nginx服务器忽略该指令的设置，仍返回压缩数据。

**注意：**<br>
&emsp;&emsp; 在某些特殊情况下可能要求Nginx服务器始终返回非压缩的数据(比如使用HTTP可选模块ngx_http_addition_module时，用于在响应请求的页面开始或者结尾添加文本信息，它只有在Nginx服务器返回非压缩数据时才能正常使用)，这就需要在编译的Nginx程序之前对源码进行适当的处理。<br>


> 当客户端浏览器不支持gzip数据处理时，使用改模块可以解决数据解析的问题，同时保证Nginx服务器与后端服务器交互数据或者本身存储数据时仍然使用压缩数据，从而减少了服务器之间的数据传输量，降低了本地存储空间的和缓存的使用率。



### gunzip_buffers 指令
- 该指令与ngx_http_gzip_module 模块中的gzip_buffers指令非常相似，都是用于设置Nginx 服务器解压Gzip文件使用缓存空间的大小的。
  - number：指定Nginx服务器需要向系统申请缓存空间的个数。
  - size：指定每个缓存空间的大小。
```bash
gunzip_buffers number size;
```
> 根据该配置项，Nginx服务器在对Gzip数据进行减压时需向系统申请`number * size`大小的空间。默认情况下`number * size`的值为128，其中`size`的值取系统内存页 一页的大小，为4KB或者8KB。
```bash
gunzip_buffers 32 4K | 16 8K;
```
> 其他指令同ngx_http_gzip_module 模块下的使用方法相同。




## Gzip 压缩功能的使用
- 本节对两类问题进行了分析和说明，一类问题涉及客户端浏览器gzip压缩功能的支持，另一类问题涉及Nginx服务器作为代理服务器时与其他服务器在交互过程中gzip压缩功能的支持。



### gzip 压缩功能综合配置实例
```bash
user nobody nobody;
worker_processes 3;
error_log logs/error.log;
pid  nginx.pid;

events {
    use epoll;
    worker_connections 1024;
}

http {
include mime.types;
default_type application/octet-stream;
sedfile on;
keepalive_timeout 65;
log_format access.log '$remote_addr-[$time_local]-"$request"-"$http_user_agent"';

gzip on;                                                                   # 开启gzip功能
gzip_min_length 1024;                                                      # 响应页数据上限
gzip_buffers 4 16k;                                                        # 缓存空间大小
gzip_comp_level 2;                                                         # 压缩机别为2
gzip_types text/pain application/x-javascript text/css application/xml;    # 压缩源文件类型
gzip_vary on;                                                              # 启用压缩标识
gunzip_static on;                                                          # 检查预压缩文件

  server {
    listen 8081;
    server_name myserver1;
    access_log  /myweb/server1/log/access.log;
    error_page  404  /404.html;
    location  /server1/location1 {
        root  /myweb;
        index  index.svr1-loc1.htm;
    }
    location /server1/location2 {
        root /myweb;
        index  index.svr1-loc2.htm;
    }
  }


  server {
    listen 8082;
    server_name 192.168.1.3;
    access_log  /myweb/server2/log/access.log;
    error_page  404  /404.html;
    location /server2/location1 {
        root /myweb;
        index index.svr2.loc1.htm;
    }
    location /server2/location2 {
        root /myweb;
        index index.svr2.loc2.htm;
    }
    location = /404.html {
        root  /myweb;
        index 404.html;
    }
  }
}

```

&emsp;&emsp; 在该实例中，配置开启gzip功能(代码：gzip_min_length 1024)，Nginx服务器用于gzip压缩的缓存空间大小为4 X 16KB = 64KB (代码：gzip_buffers 4 16K)。当响应页数据大于1KB时(代码：gzip_min_length 1024行)对类型为TXT数据、JS数据、CSS数据和XML数据(代码：gzip_types  text/plain application/x-javascript text/css application/xml)进行级别为2 的快速Gzip压缩(代码：gzip_comp_level 2)，并在返回数据头部添加“Vary：Accept-Encoding”头域通知客户端浏览器使用了gzip压缩(代码：gzip_vary on)。如果检测到客户端浏览器不支持gzip压缩功能，Nginx服务器自动将预压缩过的数据解压后再发送。<br>
&emsp;&emsp; 为了使Nginx服务器能够在全局范围内应用gzip压缩功能，应放到HTTP全局块里。如果要对各个虚拟主机差别性对待，可以在对应的server块中添加各自的gzip配置指令，对于少数虚拟主机的差别性对待，也可以在HTTP全局块中配置gzip指令后在对应的少数server块中添加配置。比如，在上个例子中，假设需要设置虚拟主机192.168.1.3不开启gzip压缩功能，如下所示<br>

```bash
    server {
        listen 8082;
        server_name 192.168.1.3;
        gzip off;
        access_log /myweb/server2/log/access.log
        error_page  404  /404.html;
    }
```
> HTTP块中的gzip配置不需要改动。
