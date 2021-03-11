#!/bin/sh
# assume pwd contains rt-thread source code

echo "Using default toolchain in docker"
echo To change toolchain, for example ./gcc/gcc-arm-none-eabi-6_2-2016q4 : 
echo "  ./run_in.sh -v \`pwd\`/../docker/gcc:/opt/gcc -e RTT_EXEC_PATH=/opt/gcc/gcc-arm-none-eabi-6_2-2016q4/bin "
echo
echo "Now you are in docker."
echo

# to debug scripts: -v `pwd`/../docker/scripts:/home/rtt/ \
# scan-view-9 default on localhost:8181
docker run --name rtenv --rm -it --privileged -p 8181:8181 \
  -v `pwd`:/home/rtt/rt-thread \
  $2 $3 $4 $5 $6 $7 $8 $9 \
  pinxue/rtenv:$1\
  bash
