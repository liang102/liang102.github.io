---
title: "Nginx Kernel optimization"
externalUrl: ""
summary: "针对IPv4的内核7个参数的配置优化"
tags: ["nginx"]
showRelatedContent: false
invertPagination: false
weight: 100
---


## 针对IPv4的内核7个参数的配置优化
&emsp;&emsp; 这里提及的参数是和IPv4 网络有关的Linux内核参数。可以将这些内核参数的值追加到Linux系统的/etc/sysctl.conf 文件中，然后使用以下命令使修改生效。
```bash
#/sbin/sysctl -p
```


### net.core.netdev_max_backlog 参数
- 表示当每个网络接口接收数据包的速率比内核处理这些包的速率快时，允许发送到队列的数据包的最大数目。一般默认值为128(可能不同的Linux系统该数值也不同)。Nginx 服务器中定义的NGX_LISTEN_BACKLOG默认为511。
```bash
net.core.netdev_max_backlog = 262144
```


### net.core.somaxconn 参数
- 该参数用于调节系统同时发起的TCP连接数，一般默认为128。在客户端存在高并发请求的情况下，该默认值较小，可能导致链接超时或者重传问题，可以根据实际需要结合并发请求数来调节此值。
```bash
net.core.somaxconn = 262144
```


### net.ipv4.tcp_max_orphans 参数
- 该参数用于设定系统中最多允许存在多少TCP套接字不被关联到任何一个用户文件句柄上。如果超过这个数字，没有与用户文件句柄关联的TCP套接字将立即被复位，同时给出警告信息。这个限制只是为了防止简单的DoS(Denial of Service，拒绝服务)攻击。一般在系统内存比较充足的情况下，可以增大这个参数的赋值。
```bash
net.ipv4.tcp_max_orphans = 262144
```


### net.ipv4.tcp_max_syn_backlog 参数
- 该参数用于记录尚未收到客户端确认信息的连接请求的最大值。对于拥有128MB内存的系统而言，此参数的默认值是1024，对小内存的系统则是128。一般在系统内存比较充足的情况下，可以增大这个参数的赋值。
```bash
net.ipv4.tcp_max_syn_backlog = 262144
```


### net.ipv4.tcp_timestamps 参数
- 该参数用于设置时间戳，这可以避免序列号的卷绕。在一个1Gb/s 的链路上，遇到以前用过的序列号的概率很大。当此值赋值为0时，禁用对于TCP时间戳的支持。在默认情况下，TCP协议会让内核接受这种"异常"的数据包。针对Nginx 服务器来说，建议关闭。
```bash
net.ipv4.tcp_timestamps = 0
```


### net.ipv4.tcp_synack_retries 参数
- 该参数用于设置内核放弃TCP连接之前向客户端发送SYN+ACK包的数量。为了建立对端的连接服务，服务器和客户端需要进行三次握手，第二次握手期间，内核需要发送SYN并附带一个会应前一个SYN的ACK，这个参数主要影响这个过程，一般赋值为1，即内核放弃连接之前发送依次SYN+ACK包，可以设置为
```bash
net.ipv4.tcp_synack_retries = 1 
```


### net.ipv4.tcp_syn_retries 参数
- 该参数的作用与上一个参数类似，设置内核放弃建立连接之前发送SYN包的数量，它的赋值和上个参数一样即可。
```bash
net.ipv4.tcp_syn_retries = 1
```