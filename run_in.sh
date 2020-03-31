#!/bin/sh
# assume rt-thread source code is in
cd ../rt-thread

echo "Using default toolchain in docker (/opt/gcc/gcc-arm-none-eabi-5_4)"
echo To change toolchain in ./gcc/gcc-arm-none-eabi-6_2-2016q4 : 
echo "  ./run_in.sh -v \`pwd\`/../docker/gcc:/opt/gcc -e RTT_EXEC_PATH=/opt/gcc/gcc-arm-none-eabi-6_2-2016q4/bin "
echo
echo "Now you are in docker."
echo

# to debug scripts: -v `pwd`/../docker/scripts:/home/rtt/ \
# scan-view-9 default on localhost:8181
docker run --name rtenv --rm -it --privileged -p 8181:8181 \
  -v `pwd`:/home/rtt/rt-thread \
  $1 $2 $3 $4 $5 $6 $7 $8 $9 \
  pinxue/rtenv:clang6_opt_gcc \
  bash
