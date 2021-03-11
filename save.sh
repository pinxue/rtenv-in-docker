#!/bin/sh
docker save pinxue/rtenv:$1 | gzip -9 -c > rtenvd_$1.tar.gz
