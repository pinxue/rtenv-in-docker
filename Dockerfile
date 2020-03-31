FROM ubuntu:18.04
MAINTAINER Wu Yang <yangwu@rt-thread.com>

# Enable apt repo mirror
ADD ./sources.list /etc/apt/

RUN apt-get update \
    && apt-get --no-install-recommends --fix-broken -y install \
         wget bzip2 make vim git ca-certificates  sudo \
         scons clang clang-tools gdb gcc-multilib g++-multilib \
         lsb-core \
    && apt-get clean

# RUN apt-get install -y qemu-system-arm qemuctl qemu-utils
# Note: qemu in apt repo is 2.11, easy to install but quite old 
#       for latest version, build from source
# For developers build behind GFW: sorry, qemu has some git submodules,
#        mirror to be found, so that they are still super slow.
ARG qemu_repo
RUN sudo apt-get install -y pkg-config libglib2.0-dev libpixman-1-dev \
    && apt-get clean \
    && git config --global http.postBuffer 524288000 \
    && git clone --depth 1 $qemu_repo \
    && cd qemu \
    && ./configure \
    && sudo make install -j2 \
    && cd .. && sudo rm -rf qemu

ADD gcc/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 /opt/gcc

RUN useradd -m -g root -G sudo -p rtt  rtt  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/rtt
# Note: so far apt install clang-6, apt later ver doesn't support multiarch yet
ENV PATH="${PATH}:/home/rtt:/usr/lib/llvm-6.0/libexec"
ENV RTT_CC="gcc"
ENV RTT_EXEC_PATH="/opt/gcc/gcc-arm-none-eabi-5_4-2016q3/bin"
EXPOSE 8181
USER rtt

ADD ./scripts/* /home/rtt/
# According above and scons --menuconfig will install env into rtt home,
#    don't borther to add RT-Thread env tools.
# RUN git clone https://github.com/RT-Thread/env .env/tools/scripts
# Keep for your reference.
