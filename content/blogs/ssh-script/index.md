---
title: "ssh防爆破"
date: "2021-12-09"
externalUrl: ""
summary: "保障ssh远程登陆安全"
showReadingTime: false
---

### 系统
- 不同系统间存在差异
- 例如：centos系统7和8
```bash
]# cat /etc/centos-release
CentOS Linux release 7.6.1810 (Core)

]# ls /etc/hosts.deny
/etc/hosts.deny  # 可以理解为ssh登录黑名单文件，8版本没有

# 文件记录格式：
sshd: ipaddr
```

### /var/log/secure 记录ssh登录失败的IP，过滤100条看看
```bash
]# tail -n 100 /var/log/secure  | awk '/Failed password/{print $0}'
Mar 18 23:04:37 centos sshd[31222]: Failed password for invalid user zywang from 165.232.124.55 port 48182 ssh2
Mar 18 23:04:37 centos sshd[31225]: Failed password for invalid user zyx from 165.232.124.55 port 48214 ssh2
Mar 18 23:04:37 centos sshd[31233]: Failed password for invalid user zz from 165.232.124.55 port 48342 ssh2
Mar 18 23:04:37 centos sshd[31228]: Failed password for invalid user zyx from 165.232.124.55 port 48246 ssh2
Mar 18 23:04:38 centos sshd[31235]: Failed password for invalid user zzwang from 165.232.124.55 port 48374 ssh2
Mar 18 23:04:38 centos sshd[31221]: Failed password for invalid user zyliu from 165.232.124.55 port 48150 ssh2
Mar 18 23:04:38 centos sshd[31231]: Failed password for invalid user zy from 165.232.124.55 port 48310 ssh2
Mar 18 23:04:38 centos sshd[31238]: Failed password for invalid user zzy from 165.232.124.55 port 48438 ssh2
Mar 18 23:04:39 centos sshd[31242]: Failed password for invalid user zz from 165.232.124.55 port 48502 ssh2
Mar 18 23:04:40 centos sshd[31240]: Failed password for invalid user zzy from 165.232.124.55 port 48470 ssh2
```

### ssh防爆破脚本
```bash
#!/bin/bash
# ssh 防爆破,登录失败超过3次就禁止登录
set -e

secure_file=($(ls /var/log/secure* | grep -v "gz$"))
sfn=${#secure_file[@]}
logfile="/tmp/tmp.txt"

for ((file=0;file<"$sfn";file++))
  do
    awk '/Invalid user/{print $(NF-2)}' "${secure_file[file]}" | awk '{ip[$1]++;}END{for(i in ip){print ip[i],i}}' | awk '$1>3{print $0}' >> "$logfile"
done

[ -s "$logfile" ] && while read count sship
  do
    if [ $(grep -c "sshd:$sship" /etc/hosts.deny) -eq 0 ];then
        echo "sshd:$sship" >> /etc/hosts.deny
        time=$(date "+%Y-%m-%d %H:%M")
        curl -s --retry 3 https://cip.cc/$sship | grep -E "IP|运营商|数据二|数据三" | awk -v time="$time" -v count="$count" 'BEGIN{print "===============================";print "时间    :",time;print "次数    :",count}$3!=""{print $0}END{print "备注    ：已限制ssh连接"}' | sed 's/数据二/地址一/' | sed 's/数据三/地址二/'  >> /tmp/sshd.log
    fi
done <  "$logfile"
> "$logfile"
```

### 给脚本加上执行权限
```bash
]# chmod +x secure.sh
```

### 放入cron 计划任务里
```bash
*/60 * * * * root /usr/bin/sh  /opt/secure.sh  # 一个小时执行一次
```

### 测试一段时间的效果
```bash
]# cat /tmp/ssh.log
===============================
时间    : 2022-02-16 17:43
次数    : 2274
IP      : 159.89.224.4
运营商  : digitalocean.com
地址一  : 美国 | 纽约DigitalOcean数据中心
地址二  : 美国纽约纽约
备注    ：已限制ssh连接
===============================
时间    : 2022-02-16 17:43
次数    : 4639
IP      : 206.189.190.8
运营商  : digitalocean.com
地址一  : 美国
地址二  : 美国纽约纽约
备注    ：已限制ssh连接
===============================
时间    : 2022-03-03 00:01
次数    : 15371
IP      : 137.184.230.247
地址一  : 美国
地址二  : 美国俄亥俄辛辛那提
备注    ：已限制ssh连接
===============================
```
