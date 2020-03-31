#!/bin/sh
# assume rt-thread source code is in
cd ../rt-thread

# scan-view default on localhost:8181
TOOLCHAIN=/opt/gcc/gcc-linaro-6.5.0-2018.12-x86_64_aarch64-elf/bin

docker run --name rtenv --rm -it --privileged -p 8181:8181 \
  -v `pwd`:/home/rtt/rt-thread \
  -v `pwd`/../docker/gcc:/opt/gcc -e RTT_EXEC_PATH=$TOOLCHAIN \
  $1 $2 $3 $4 $5 $6 $7 $8 $9 \
  pinxue/rtenv:clang6_opt_gcc \
  bash
