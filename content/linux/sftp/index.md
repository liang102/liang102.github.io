---
title: "SFTP 配置"
externalUrl: ""
summary: "SFTP是基于SSH（Secure Shell）的协议，用于在客户端和服务器之间进行安全的文件传输。"
tags: ["sftp"]
showReadingTime: false
weight: 10
---

## 背景
- 最近使用MAC终端连接服务器，发现在终端上使用不了`rz/rz`命令，导致无法传输文件。因此想到了SFTP工具。
- SFTP是基于SSH（Secure Shell）的协议，用于在客户端和服务器之间进行安全的文件传输。
- SFTP本质上是一种命令行工具，它需要通过终端或者命令行界面与服务器进行交互。
- 完美解决 Mac系统终端文件与服务器文件传输问题。



### 1. 安装OpenSSH服务
- 可以检查下服务器是否安装有这个服务
```bash
rpm -q openssh-server
```
- 若没有安装，可使用下面命令安装
```bash
yum -y install openssh-server
```

### 2. 配置SSH服务
- 编辑SSH服务的配置文件：`/etc/ssh/sshd_config`
- 将内容添加到文件末尾。
```bash
vim /etc/ssh/ssh_config
# 指定使用哪个子系统来处理SFTP连接。internal-sftp 是openssh提供的内部sftp子系统
Subsystem sftp internal-sftp    
# 配置传送目录和所属用户
Match Group sftpusers
# 指定SFTP用户的根目录 %h 代表占位符，表示指定用户家目录，%u 代表占位符，表示指定用户名
ChrootDirectory /home/sftp/%u
# 用于控制是否启用X11转发,X11转发是一种通过SSH连接远程主机并在本地显示图形界面应用程序的功能。
X11Forwarding no
# 用于控制是否允许TCP端口转发,TCP端口转发是SSH协议中的一项功能，它允许通过SSH隧道在远程主机和本地主机之间转发TCP网络连接。
AllowTcpForwarding no
# 强制执行指定的命令。当设置ForceCommand为internal-sftp时，表示强制使用内部的SFTP子系统处理所有SSH连接请求。
ForceCommand internal-sftp

----------------------------------------------------------------------------------------------------------
# 指定SSH端口,建议修改SSH默认端口
Port 2222
```

### 3. 创建SFTP用户组
```bash
groupadd sftpuser
```


### 4.创建SFTP管理目录
```bash
mkdir /home/sftpuser
chmod 0755 /home/sftpuser
```

### 5. 创建SFTP用户
```bash
useradd -g sftpusers -d /home/sftp/<username> -p $(openssl passwd -1 'your passwd') -s /sbin/nologin <username>

# -g 指定用户组
# -d 指定用户主目录
# -p 设置用户加密密码
# 使用 openssl passwd -1  生成一个基于MD5加密的密码
```

### 6. 设置SFTP用户主目录的权限
- 权限直接影响SFTP用户连接后的权限 
```bash
chown root:sftpuser /home/sftp/<username>
chmod 0755 /home/sftp/<username>
```
- 设置一个可以操作的子目录
```bash
mkdir /home/sftp/<username>/putfile
chmod 0700 /home/sftp/<username>/putfile
chown <username>:sftp /home/sftp/<username>/putfile
```
> 当然啦，你可以不用像我这样操作，目录可以换成其他的。


### 7. 重启SSH服务
```bash
systemctl restart sshd
```

### 8. 测试验证
- Mac连接SFTP服务
```bash
sftp -oPort=2222 <username>@host

# -o: 指定服务器端口号，若修改了端口号需要这个选项。
# username: 服务器中创建的sftp用户
# host: 主机名称或IP地址。
```
> 连接成功后使用`ls`命令查看当前目录的文件，能看到文件就代表连接成功。
>
> Mac下载文件不指定路径的话，默认下载路径为你当前账号登录Mac系统的路径。



## sftp 常用命令
```bash
ls: 显示远程目录列表
pwd: 显示远程当前所在目录
put: 上传文件。put 本机路径  远程路径
get: 下载文件。get 远程路径  本机路径
bye/quit: 退出sftp
cp: 复制远程文件 
mkdir: 创建远程目录
rmdir: 删除远程目录
rm: 删除远程文件
```
