---
title: "Nginx Working"
externalUrl: ""
summary: "Nginx 安装目录介绍"
tags: ["nginx"]
showRelatedContent: false
invertPagination: false
weight: 98
---

### Nginx安装目录介绍
- `Nginx`服务器的安装目录中主要包括了`conf、html、logs、sbin`等4个目录。
- `conf:` 目录中存放了`Nginx`的所有配置文件。其中,`nginx.conf`文件是`Nginx`服务器的主配置文件，其他配置文件使用来配置`Nginx`的相关功能的。比如，配置`fastcgi`使用的`fastcgi.conf`和`fastcgi_params`两个文件。所有的配置文件都提供了以`.default`结尾的默认配置文件，方便我们将配置过的`.conf`文件恢复到初始状态。
- `html:` 目录中存放了`Nginx`服务器在运行过程中调用的一些HTML网页文件。
- `logs:` 是用来存放`Nginx`服务器的日志文件的。`Nginx`的日志功能比较强大，有不同的种类，并且可以自定义输出格式内容等。
- `sbin:` 目录存放名称为`nginx`的二进制文件，是`Nginx`主程序。



### Nginx服务的信号控制
&emsp;&emsp; `Nginx`服务在运行时，会保持一个主进程和一个或多个`worker process`工作进程。通过给`Nginx`服务器的主进程发送信号就可以控制服务的启停了。如何给主进程发送信号，需要知道`Nginx`主进程的进程号`PID`。<br>
&emsp;&emsp; 获取`PID`有两个途径：一个是，在`Nginx`服务启动以后，默认在`Nginx`服务器安装目录下的`logs`目录中会生产文件名为`nginx.pid`文件，此文件中保持的就是`Nginx`服务主进程的`PID`。这个文件的存放路径和文件名都可以在`Nginx`服务器的配置文件中进行配置。第二个获取`Nginx`服务主进程PID的方法是使用`Linux`平台下查看进程的工具`ps`


#### Nginx服务可接收的信号
| 信号 | 作用 |
|:----:|:----|
| TERM 或 INT | 快速停止`Nginx`服务 |
| QUIT | 平缓停止`Nginx`服务 |
| HUP | 使用新的配置文件启动进程，之后平缓停止原有进程，也就是所谓的 "平滑重启" | 
| USR1 | 重新打开日志文件，常用于日志切割。|
| USR2 | 使用新版本的`Nginx`文件启动服务,之后平缓停止原有的`Nginx`进程，也就是所谓的 "平滑升级" |
| WINCH | 平缓停止`worker process`，用于`Nginx`服务器平滑升级 |
|

&emsp;&emsp; 向`Nginx`服务主进程发送信号也有两种方法。一种是使用`Nginx`二进制文件。另一种是使用`kill`命令发送信号。
```bash
kill SIGNAL PID

# SIGANL 用于指定信号，即指定表中的某一个
# PID 指定Nginx服务主进程的PID，也可以使用nginx.pid动态获取PID号。

kill SIGNAL `filepath`

# filepath 为 nginx.pid的路径。
```


### Nginx服务的启动
- `Nginx` 使用说明

| 参数 | 说明 |
|:----:|:----|
|-?,-h| 显示帮助信息。 |
| -v | 打印`Nginx`版本号。 |
| -V | 打印`Nginx`版本号和编译信息。 | 
| -t | 检查`Nginx`服务器配置文件是否有语法错误。 |
| -q | 可以与 "-t" 联用，如果配置文件没有错误，则不输出任何信息。|
| -c | 指定启动Nginx服务使用的配置文件。可以与 "-t" 联用，使输出内容更详细，对查找配置文件中的语法错误很有帮助 |
| -s signal | 用来向`Nginx`服务的主进程发送信号。`stop, quit, reopen, reload` |
| -p prefix | 用来改变`Nginx`的安装路径，常用在平滑升级`Nginx`服务器的场合 |
| -g directives | 用来补充`Nginx`配置文件，向`Nginx`服务指定启动时应用于全局的配置 |
|

### Nginx服务的停止
停止`Nginx`服务有两种方法：
- 快速停止：是指立即停止当前Nginx服务正在处理的所有网络请求，马上丢弃连接，停止工作。
- 平缓停止：是指允许Nginx服务将当前正在处理的网络请求处理完成，但不再接收新的请求，之后关闭连接，停止工作。

```bash
./nginx -g TERM | INT | QUIT

# TERM 和 INT 信号用于快速停止，QUIT用于平缓停止。
# 或者：
kill TERM | INT | QUIT  `/nginx/logs/nginx.pid`

# 当然也可以使用kill命令向Nginx进程发送-9 或者SIGKILL信号强制关闭Nginx服务，但不建议这样使用。
kill -9 | SIGKILL `/nginx/logs/nginx.pid`
```


### Nginx服务的重启
&emsp;&emsp; 更改`Nginx`服务器的配置和加入新模块后，如果希望当前的`Nginx`服务应用新的配置或使用新模块生效，就需要重启`Nginx`服务。<br>
&emsp;&emsp; 平滑重启是这样一个过程，`Nginx`服务进程接收到信号后，首先读取新的`Nginx`配置文件，如果配置语法正确，则启动新的`Nginx`服务，然后平缓关闭旧的服务进程；如果新的`Nginx`配置有问题，将显示错误，仍然使用旧的`Nginx`进程提供服务。<br>
&emsp;&emsp; 使用以下命令实现`Nginx`平滑重启
```bash
./nginx -g HUP [-c newConfFile]

# HUP 信号用于发送平滑重启信号
# newConfFile， 可选项，用于指定新配置文件的路径

kill HUP '/nginx/logs/nginx.pid'
# 也可以实现平滑重启
```


### Nginx服务器的升级
&emsp;&emsp;如果要对当前的`Nginx`服务器进行版本升级，应用新模块，最简单的方法就是停止当前`Nginx`服务，然后开启新的`Nginx`服务，但这样就会导致在一段时间内，用户无法访问服务器。为了解决这个问题，`Nginx`服务器提供平滑升级的功能。<br>
&emsp;&emsp;平滑升级的过程是这样的，`Nginx`服务接收到`USR2`信号后，首先将旧的`nginx.pid`文件添加后缀`.oldbin`，变为`nginx.pid.oldbin`文件；然后执行新版本`Nginx`服务器的二进制文件启动服务。如果新的服务启动成功，系统中将有新旧两个`Nginx`服务共同提供`Web`服务。之后，需要向旧的`Nginx`服务进程发送`WINCH`信号，使旧的`Nginx`服务平滑停止，并删除`nginx.pid.oldbin`文件。在发送`WINCH`信号之前，可以随时停止新的`Nginx`服务。

**注意：**<br>
&emsp;&emsp;为了实现`Nginx`服务器的平滑升级，新的服务器安装路径应该和旧的保持一致。因此建议在安装新的服务器之前先备份旧的服务器。如果由于某种原因无法保持新旧服务器安装路径一致，则可以先使用以下命令将旧服务器的安装路径更改为新服务器的安装路径。
```bash
./nginx -p newInstallPath
```
`newInstallPath` 为新服务器的安装路径。之后备份旧服务器，安装新服务器即可。
做好准备工作以后，使用以下命令实现`Nginx`服务的平滑升级
```bash
./nginx -g USR2
# 或者
kill USR2 `/nginx/logs/nginx.pid`
```
`USR2`信号用于发送平滑升级信号。
通过`ps -ef |grep nginx` 查看新的`Nginx`服务启动正常，再使用：
```bash
./nginx -g WINCH
# 或者
kill WINCH '/nginx/logs/nginx.pid'
```
`WINCH`信号用于发送平滑停止旧服务信号。这样就在不停止提供`Web`服务的前提下完成了`Nginx`服务器的平滑升级。
