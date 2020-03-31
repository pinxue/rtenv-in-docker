#!/bin/sh
scan-build -v -v -v --use-cc=arm-none-eabi-gcc --use-c++=arm-none-eabi-g++ scons --clang-analyzer --verbose
