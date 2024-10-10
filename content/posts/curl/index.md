---
title: "配置curl 支持h2"
externalUrl: ""
summary: "方便验证h2服务"
tags: ["curl","http2"]
showReadingTime: false
weight: 1
---

## Linux 服务器安装新版本curl
- [curl-8.9.0](https://github.com/stunnel/static-curl/releases/tag/8.9.0)
- [ca证书](https://curl.se/docs/caextract.html)
```bash
mkdir /opt/curl
cd /opt/curl
wget https://github.com/stunnel/static-curl/releases/download/8.9.0/curl-linux-x86_64-8.9.0.tar.xz
tar  -xf curl-linux-x86_64-8.9.0.tar.xz

wget https://curl.se/ca/cacert.pem
cp cacert.pem /etc/ssl/certs/ca-certificates.crt
```
