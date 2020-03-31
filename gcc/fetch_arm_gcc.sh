#!/bin/sh

wget -c https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
tar jxf gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
wget -c https://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/aarch64-elf/gcc-linaro-5.4.1-2017.05-x86_64_aarch64-elf.tar.xz
wget -c https://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/aarch64-elf/sysroot-newlib-linaro-2017.05-aarch64-elf.tar.xz
tar zxf gcc-linaro-5.4.1-2017.05-x86_64_aarch64-elf.tar.xz
