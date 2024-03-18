#!/bin/bash

log = $PWD/.images.log

# log日志输出
images_log () {
  echo "$1" >> $log
}

# 检查工具
check_qshell () {
 if  which $1 &>/dev/null;
  then
 fi
}

check_qshell qshell

