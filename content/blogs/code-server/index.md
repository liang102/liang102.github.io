---
title: "云端IDE"
date: "2021-12-07"
externalUrl: ""
summary: "搭建云端IDE教程"
showReadingTime: false
---

# code-server简介
- vscode 是一款轻量级但功能强大的源代码编辑器,适用于 Windows、macOS 和 Linux。
- 支持C++、C#、Java、Python、PHP、Go等等众多语言。
- 致力于在任何地方的任何机器上运行VS Code并在浏览器中访问它。
- 官方文档：[code-server](https://coder.com/docs/code-server/latest)
- 软件包：[code-server](https://github.com/cdr/code-server/releases)



## 服务器要求
- 1 GB 内存
- 2 个 CPU 内核
- 环境必须启用 WebSockets，因为代码服务器使用 WebSockets 在浏览器和服务器之间进行通信。


## 吞吐量
- 读取：3000 IOPS，50 MB/s
- 写入：3000 IOPS 50 MB/s



## 部署云端code-server

### 系统环境
```bash
$ cat /etc/redhat-release 
CentOS Linux release 7.6.1810 (Core)
```

### 用户环境
```bash
]# useradd code
]# echo "password" | passwd --stdin code    #"password" 为code用户登录密码
```

### 部署nginx环境
```bash
## nginx repo 源
]# vim /etc/yum.repos.d/nginx.repo 
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
---------------------------------------------------------
]# yum repolist

## 安装nginx 
]# yum -y install nginx

## 转发配置
]# vim /etc/nginx/conf.d/default.conf

server {
    listen        80;
    listen       443 ssl;
    server_name  domain;
    ssl_certificate cert/cert-file-name.pem;  #需要将cert-file-name.pem替换成已上传的证书文件的名称。
    ssl_certificate_key cert/cert-file-name.key; #需要将cert-file-name.key替换成已上传的证书私钥文件的名称。
    ssl_session_timeout 5m;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
    #表示使用的加密套件的类型。
    ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3; #表示使用的TLS协议的类型。
    ssl_prefer_server_ciphers on;

    if ( $server_port = "80" ) {
      rewrite ^(/.*)$ https://$host$1  permanent;
    }

    location / {
    proxy_pass http://localhost:8080;
    proxy_set_header Host $host;
    proxy_set_header Upgrade $http_upgrade;  # 设置websocket
    proxy_set_header Connection upgrade; 
    proxy_set_header Accept-Encoding gzip;
    }
}

## 检查配置文件语法
]# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

### 开始部署code-server
```bash
# 切换普通用户
]# su - code

# 下载软件包
]$ wget https://github.com/cdr/code-server/releases/download/v3.12.0/code-server-3.12.0-linux-amd64.tar.gz

# 解包
]$ tar xf code-server-3.12.0-linux-amd64.tar.gz && mv code-server-3.12.0-linux-amd64  code-server && cd code-server/

# 编辑配置文件
]$ vim config.yaml
bind-addr: 127.0.0.1:8080
auth: password
password: [password]  # 此处为code-server登录密码
cert: false

]$ logout    # 退出普通用户环境
```

### 配置code-server服务
```bash
]# vim /usr/lib/systemd/system/code-server.service

[Unit]
Description=code-server
Documentation=https://docs.cloudreve.org
After=network.target
Wants=network.target

[Service]
ExecStart=/home/code/code-server/bin/code-server  --config=/home/code/code-server/config.yaml
Restart=on-abnormal
RestartSec=5s
KillMode=mixed

StandardOutput=null
StandardError=syslog

[Install]
WantedBy=multi-user.target

]# systemctl daemon-reload  # 加载服务配置
```

### 添加sudo提权
```bash
]# vim /etc/sudoers
code    ALL=(ALL)  /bin/systemctl, /bin/netstat, /bin/ps, /usr/sbin/nginx
```

### 切换普通用户起服务
```bash
]# su - code
]$ sudo systemctl start code-server
[sudo] password for code:    # 此处输入code 用户密码

]$ sudo systemctl enable code-server
[sudo] password for code:    # 此处输入code 用户密码

]$ sudo nginx
[sudo] password for code:    # 此处输入code 用户密码
```
