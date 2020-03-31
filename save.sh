#!/bin/sh
docker save pinxue/rtenv:clang6_opt_gcc | gzip -9 -c > rtenvd.tar.gz
