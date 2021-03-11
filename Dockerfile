FROM ubuntu:18.04
MAINTAINER Wu Yang <yangwu@rt-thread.com>

# Enable apt repo mirror
ADD ./sources.list /etc/apt/

RUN apt-get update \
    && apt-get --no-install-recommends --fix-broken -y install \
         wget bzip2 make vim git ca-certificates  sudo \
         scons clang clang-tools gdb gcc-multilib g++-multilib \
         lsb-core \
         python-requests ncurses-dev \
    && apt-get clean

# ARG doesn't work well with autobuild, workaround need help from a build hook
# https://github.com/docker/hub-feedback/issues/508#issuecomment-491712592
ARG qemu_repo
# RUN apt-get install -y qemu-system-arm qemuctl qemu-utils
# Note: qemu in apt repo is 2.11, easy to install but quite old 
#       for latest version, build from source
# For developers build behind GFW: sorry, qemu has some git submodules,
#        mirror to be found, so that they are still super slow.
RUN sudo apt-get install -y pkg-config libglib2.0-dev libpixman-1-dev ninja-build \
    && apt-get clean \
    && git config --global http.postBuffer 524288000 \
    && git clone --depth 1 $qemu_repo \
    && cd qemu \
    && ./configure \
    && sudo make install -j2 \
    && cd .. && sudo rm -rf qemu

RUN useradd -m -g root -G sudo -p rtt  rtt  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/rtt
# Note: so far apt install clang-6, apt later ver doesn't support multiarch yet
ENV PATH="${PATH}:/home/rtt:/usr/lib/llvm-6.0/libexec"
EXPOSE 8181
USER rtt

ADD ./scripts/* /home/rtt/
# scons --menuconfig will install env into rtt home,
# prefetch to avoid cloning everytime
RUN mkdir -p .env/tools && git clone https://github.com/RT-Thread/env .env/tools/scripts \
    && echo 'export PATH=~/.env/tools/scripts:$PATH' > ~/.env/env.sh \
    && mkdir -p .env/packages && git clone https://github.com/RT-Thread/packages .env/packages/packages \
    && echo 'source /home/rtt/.env/packages/packages/Kconfig' > ~/.env/packages/Kconfig

# Note: so far apt install clang-6, apt later ver doesn't support multiarch yet
ENV PATH="${PATH}:/home/rtt:/usr/lib/llvm-6.0/libexec"

# TODO : platform specific toolchain
# add or download toolchain and customize env var
# ENV RTT_CC="gcc"
# ENV RTT_EXEC_PATH="/opt/gcc/gcc-arm-none-eabi-5_4-2016q3/bin"
