#!/bin/bash
# assume rt-thread source code is in RTT_ROOT
if [ -z "$RTT_ROOT" ]
then
  echo "(You may set RTT_ROOT environment variable to avoid asking.)"
  echo Where is the RTT_ROOT in HOST env:
  read RTT_ROOT
fi

# docker need absolute path
if [ `uname` = Darwin ]; then
   RTT_ROOT=$(grealpath "$RTT_ROOT")
else
   RTT_ROOT=$(realpath "$RTT_ROOT")
fi

if [ -z "$RTT_BSP" ]
then
  echo "(You may set RTT_BSP environment variable to avoid asking.)"
  echo "(If your bsp is outside the RTT_ROOT, modify docker run cmd to map it under.)"
  echo Where is the BSP relative to RTT_ROOT:
  read RTT_BSP
fi

# For your reference
#TOOLCHAIN=/opt/gcc/gcc-arm-none-eabi-6_2-2016q4/bin
#TOOLCHAIN=/opt/gcc/gcc-arm-none-eabi-5_4-2016q3/bin
#   -v `pwd`/scripts:/home/rtt/ \
#   -v `pwd`/gcc:/opt/gcc \
#   -e RTT_EXEC_PATH=$TOOLCHAIN \

# scan-view-9 default on localhost:8181
docker run --name rtenv --rm -it --privileged \
   -p 8181:8181 \
   -v $RTT_ROOT:/home/rtt/rt-thread \
   pinxue/rtenv:$1 \
   bash -c "cd rt-thread/$RTT_BSP && scan-build -v -v -v -o build/clang-analyzer-report --use-cc=arm-none-eabi-gcc --use-c++=arm-none-eabi-g++ scons --clang-analyzer $2 $3 $4 $5 $6 $7 $8 $9"
