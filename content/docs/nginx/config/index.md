---
title: "Nginx Config"
externalUrl: ""
summary: "Nginx 配置文件结构介绍"
tags: ["Nginx"]
showRelatedContent: false
invertPagination: true
weight: 97
---



## Nginx 主配置文件介绍


### nginx.conf 文件结构
```bash
{
   ......                 # 全局块

   events {               # events块
    ......
   }

   http {                 # http块
    ......                # http全局块

    server {              # server块
      ......              # server全局块
      
      location {          # location块
          ......
      }

    }
    ......                # http全局块
   }

}

```
&emsp;&emsp;最外层的花括号将内容整体分为两个部分，再加上最开始的内容，即第一行省略号表示的。`nginx.conf`一共由三部分组成，分别为全局块、events块和http块。在http块中，又包含http全局块、多个`server`块。每个`server`块中，可以包含`server`全局块和多个`location`块。在同一配置块中嵌套的配置块，各个之间不存在次序关系。<br>
&emsp;&emsp;配置文件支持大量可以配置的指令，绝大多数指令不是特定属于某一个块的。同一个指令放在不同层级的块中，其作用域也不同。一般情况下，高一级块中的指令可以作用于自身所在的块和此块包含的所有低层级块。如果某个指令在两个不同层级的块中同时出现，则采用"就近原则"，即以较低层级块中的配置为准。

#### 全局块
&emsp;&emsp;全局块是默认配置文件从开始到`events`块之间的一部分内容，主要设置一些影响`Nginx`服务器整体运行的配置指令，因此，这些指令的作用域是`Nginx`服务器的全局。<br>
&emsp;&emsp;通常包括配置运行`Nginx`服务器的用户(组)、允许生成的`worker process`数、`Nginx`进程`PID`存放路径、日志的存放路径和类型以及配置文件的引入等。


#### events块
&emsp;&emsp; `events`块涉及的指令主要影响`Nginx`服务器与用户的网络连接。常用到的设置包括是否开启对多`worker process`下的网络连接进行序列化，是否允许同时接收多个网络连接，选取那种事件驱动模型处理连接请求，每个`worker process`可以同时支持的最大连接等。<br>
&emsp;&emsp;这一部分的指令对`Nginx`服务器的性能影响较大，在实际配置中应该根据实际情况灵活调整。


#### http块
&emsp;&emsp; `http`块是`nginx`服务器配置中的重要部分，代理、缓存、和日志定义等绝大多数的功能和第三方模块的配置都可以放在这个模块中。<br>
&emsp;&emsp;可以在http全局块中配置的指令包括文件引入、`MIME-Type`定义、日志自定义、是否是否`sendfile`传输文件、连接超时时间、单连接请求数上限等。


#### server块
&emsp;&emsp;`server`块和"虚拟主机"的概念有密切联系。为了加深对相关配置的理解，在介绍`server`块之前，简单了解一下虚拟主机的相关内容。<br>
&emsp;&emsp;虚拟主机，又称虚拟服务器、空间主机或是网页空间，它是一种技术。该技术是为了节省互联网服务器硬件成本而出现的。这里的"主机" 或 "空间" 是由实体的服务器延伸而来，硬件系统可以基于服务器群，或者单个服务器等。虚拟主机技术主要应用于`HTTP`、`FTP`及`EMAIL`等多项服务，将一台服务器的某项或者全部服务内容逻辑划分为多个服务单位，对外表现为多个服务器，从而充分利用服务器硬件资源。从用户角度来看，一台虚拟主机和一台独立的硬件主机是完全一样的。<br>
&emsp;&emsp;在使用`Nginx`服务器提供`Web`服务时，利用虚拟主机的技术就可以避免为每一个要运行的网站提供单独的Nginx服务器，也无需为每个网站对应运行一组`Nginx`进程。虚拟主机技术使得`Nginx`服务器可以在同一台服务器上只运行一组`Nginx`进程，就可以运行多个网站。本节介绍的`server`块就是用来完成这个功能的。<br>
&emsp;&emsp;每个`server`块就相当于一台虚拟主机，它内部可有多台主机联合提供服务，一起对外提供在逻辑上密切的一组服务(或网站)。`server`全局块的指令的作用域为本`server`块，不会影响其他的`server`块。<br>
&emsp;&emsp; `server`块也可以包含自己的全局块，同时可以包含多个`location`块。在`server`全局块中，最常见的的两个配置项是本虚拟主机的监听配置和本虚拟主机的名称或IP配置。<br>

**注意:**
&emsp;&emsp;`http`全局块部分指令可以在`server`块中和`location`块中使用。


#### location块
&emsp;&emsp; 每个`server`块中可以包含多个`location`块。`location`其实是`server`块的一个指令，知识由于其在整个`Nginx`配置文档中起着重要的作用，而且`Nginx`服务器在许多功能上的灵活性往往在`location`指令的配置中体现出来。<br>
&emsp;&emsp; 这些`location`块的主要作用是，基于`Nginx`服务器接收到的请求字符串(例如：server_name/url-string)，对除虚拟主机名称(也可以是IP别名)之外的字符串(前例中 "/uri-string"部分)进行匹配，对特定的请求进行处理。地址定向、数据缓存和应答控制等功能都是在这部分实现。需多第三方模块的配置也是在`location`块中提供功能。
