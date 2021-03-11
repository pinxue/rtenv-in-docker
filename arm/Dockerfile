FROM pinxue/rtenv_base:v1.0
MAINTAINER Wu Yang <yangwu@rt-thread.com>


RUN mkdir /opt/gcc && cd /opt/gcc \
    && wget -c https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 \
    && tar jxf gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 \
    && rm -f gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
# Keep for local build test
# ADD gcc/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 /opt/gcc

ENV RTT_CC="gcc"
ENV RTT_EXEC_PATH="/opt/gcc/gcc-arm-none-eabi-5_4-2016q3/bin"
