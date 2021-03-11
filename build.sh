#!/bin/bash
if [ -z $1 ]; then
  echo Hint: 'build.sh xgfw' to use mirrors behind GFW
fi

qemu_official=https://git.qemu.org/git/qemu.git
qemu_mirror=https://mirrors.tuna.tsinghua.edu.cn/git/qemu.git
gfw=$1
# GFW make it so slow in China Mainland, use a mirror instead
if [ "$gfw" = "xgfw" ]; then
  qemu_url=$qemu_mirror
  cp sources.list.huaweimirror sources.list
else
  qemu_url=$qemu_official
  cp sources.list.origin sources.list
fi
docker build --rm --build-arg qemu_repo=$qemu_url . -t pinxue/rtenv_base:v1.0
