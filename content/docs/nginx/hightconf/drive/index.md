---
title: "Nginx Drive model optimization"
externalUrl: ""
summary: "与事件驱动相关的指令配置"
tags: ["nginx"]
showRelatedContent: false
invertPagination: false
weight: 97
---


## 与事件驱动模型相关配置的8个指令

### use 指令
- 该指令用于指定Nginx 服务器使用的事件驱动模型。


### worker_connections 指令
- 该指令用于设置Nginx服务器的每个工作进程允许同时连接客户端的最大数量。结合worker_processes 指令，可以计算出nginx 服务器允许同时连接的客户端最大数量Client= worker_processes * worker_connetions/2。
- 在使用Nginx服务器的过程中，可能会遇到无法访问Nginx 服务器的情况，查看日志发现报以下错误。
```bash
[alert] 24082#0: 1024 worker_connections is not enough while accepting new connection 0.0.0.0:81
```
> 根据报错信息，推测可能是Nginx服务器的最大访问连接数设置小了。该指令设置的就是Nginx服务器能接受的最大访问俩，其中包括前端用户连接也包括其他连接，这个值在理论上等于该指令的值与它允许开启的工作进程最大数的乘积。一般设置为65535。
```bash
worker_connencionts 65535;
```
> 该指令的赋值与Linux操作系统进行可以打开的文件句柄数量有关系。按照以上设置以后，Nginx报以下错误。
```bash
[warn]: 8192 worker_connections are more than open file resource limit: 1024
```
> 究其原因，Linux系统中有一个系统指令 open file resource limit，它设置了进程可以打开的文件句柄数量。worker_connections指令的赋值当然不能超过open file resource limit 的赋值。可以使用以下命令查看linux系统中open file resource limit 指令的值。
```bash
# cat /proc/sys/fs/file-max
```
- 可以通过以下命令将 open file resource limit指令的值设为2390251
```bash
# echo "2390252" > /proc/sys/fs/file-max; sysctl -p
```
> 这样，Nginx 的worker_connections 指令赋值65535 就没问题了。



### worker_rlimit_sigpending 指令
- 该指令用于设置Linux2.6.6-mm2版本后的Linux平台的事件信号队列长度上限。
- 该指令主要影响事件驱动模型中rtsig模型可以保存的最大信号数。Nginx服务器的每一个工作进程有自己的事件信号队列用于暂存客户端请求发生信号，如果超出长度限制，Nginx服务器自动转用poll模型处理未处理的客户端请求。为了保证Nginx 服务器对客户端请求的高效处理，请根据实际的客户端请求数量和服务器运行环境的处理能力设定该值。
```bash
wowrker_rlimit_sigpending 1024;
```


### devpoll_changes 和 devpoll_events 指令
- 这两个指令用于设置在/dev/poll事件驱动模式下Nginx服务器可以与内核之间传递事件的数量。前者设置传递给内核的事件数量，后者设置从内核获取的事件数量。
```bash
devpoll_changes number;
devpoll_events number;
```
- 其中number为要设置的数量，默认值均为512。
- 使用kequeue_changes 方式，可以设置与内核之间传递事件的数量。



### epoll_events 指令
- 该指令用于设置在epoll 事件驱动模式下Nginx 服务器可以与内核之间传递事件的数量。
```bash
epoll_events number;
```
- 其中，number 为要设置的数量，默认值均为512。

**注意:** <br>
&emsp;&emsp; 与其他事件驱动模型不同，在epoll事件驱动模式下Nginx 服务器向内核传递事件的数量和从内核传递的事件数量是相等的 ，因此没有类似epoll_changes这样的指令。<br>


### rtsig_signo 指令
- 该指令用于设置rtsig模式使用的两个信号中的第1个，第2个信号是在第1个信号的编号上加1，
```bash
rtsig_signo signo;
```
- 默认第1个信号设置为 SIGRTMIN+10

**提示：**  <br>
&emsp;&emsp; 在Linux中可以使用以下命令查看系统支持的SIGRTMIN有哪些。<br>
```bash
kill -l | grep SIGRTMIN
```


### rtsig_overflow_* 指令
- 该指令代表三个具体的指令，分别为 rtsig_overflow_events、rtsig_overflow_test和rtsig_overflow_threshold 指令。这些指令用来控制当rtsig模式中信号对列溢出时Nginx 服务器的处理方式。
```bash
rtsig_overflow_* number;  # 这里的* 代表提到的三个指令。
```
- 其中，number为要设置的值。
- rtsig_overflow_events 指令指定队列溢出时使用poll库处理的事件数，默认值为16.
- rtsig_overflow_test 指令指定poll库处理完第几件事件后将清空rtsig模型使用的信号队列，默认值为32.
- rtsig_overflow_threshold 指令指定 rtsig 模式使用的信号队列中的事件超过多少时就需要清空队列了。该指令只对Linux 2.4.x 及以下版本有效。在这些版本中包含两个参数：分别是/proc/sys/kernel/rtsig-nr 和 /proc/sys/kernel/rtsig-max/rtsig_overflow_threshold，后者就是该指令设定的值。当Nginx 服务器检测到前者大于后者时，将清空队列。该指令默认值为10，代表rtsig-max的1/10。