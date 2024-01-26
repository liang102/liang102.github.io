---
title: "nginx-reload原理"
date: "2022-03-01"
externalUrl: ""
summary: "记录nginx reload的过程"
showReadingTime: false
---

> 执行这条命令的是希望nginx不停止服务的情况下把旧的nginx配置文件内容平滑的更新为新的配置文件内容。

## nginx -s reload 流程
- 因为启动nginx服务有两个进程,一个是master进程，一个是worker进程
- worker 进程 是由nginx配置文件的worker_processes配置参数控制的，表示CPU处理核数
```bash
[1] 向master 进程发送 HUP 信号 
[2] master 进程校验nginx配置文件语法是否正确
[3] master 进程打开新的监听端口
[4] master 进程用新的nginx配置启动新的 worker 子进程
[5] master 进程向老的 worker 子进程 发送 QUIT 信号
[6] 老的 worker 子进程关闭监听句柄，处理完当前连接后结束进程
```

## 流程图
{{< mermaid >}}
flowchart TD
    a([正在运行的nginx服务])
    a1[master进程\nWorker进程]
    b[修改nginx配置文件]
    c[尝试配置,尝试打开日志文件,\n尝试分配新的监听端口]
    d{是否成功}
    d1[回滚配置]
    d2[使用新的配置,新建一个Worker进程,\n新建成功后发送一个关闭消息给旧的Worker进程]
    e[旧的Worker进程 收到信号后会继续服务,\n当所有请求的客户端被服务后,旧进程关闭]
    f([结束])
    a -->|启动| a1
    a -->|update| b --> c --> d
    d -->|否| d1 --> f 
    d -->|是|d2 --> e --> f
{{< /mermaid >}}
