# RT-Thread Development Environment in Docker

This docker image is the basic development environment for it, the toolchain and the source code of the RT-Thread are not included:

- Scons building system
- RT-Thread package management tools (env)
- Static analyzer (clang, scan-build)
- QEMU (with all targets)

RT-Thread is an open source RTOS powering millions of device, created at 2006, its repository is https://github.com/RT-Thread/rt-thread .

For more information about RT-Thread, please visit https://www.rt-thread.io (English) or https://www.rt-thread.org (Chinese)

# Usage

It is refactored a bit lately, now it is a pure base image without any toolchain.

1.  Install docker-ce 
    (https://hub.docker.com/search?q=&type=edition&offering=community)
2.  Change image dir of docker-ce if your system disk space is tight
3.  Get the image by one of three ways: pull or load or build
    - Pull: `docker pull pinxue/rtenv_base:v1.0`
    - Load: put rtenvd.tar.gz saved along with load.bat, run load.bat (sh load.bat for macOS/Linux)
      * Notes: only for local sharing, check save script for making the tarball.
    - Build: 
      * Build script accept an optional 'xgfw' argument, it speeds up a lot if you have troulbe with GFW (just ignore it if you don't know what's GFW)
      * macOS/Linux: `sh build.sh`
      * Windows: bat script to be created, suppose to be `build.bat`
4.  run_in.bat or sh run_in.sh (MS Windows is different from macOS/Linux)
    4.1  Toolchain: just map any toolchain for Linux host into the container, you may use fetch script in ./gcc or fetch by your own. Please refer aa64_run_in.sh for mapping the toolchain into env.
         4.1.1 Prebuild container for specific toolchain are also provided, see build_sdk.sh and run_sdk.sh
         4.1.2 ARM: use `pinxue/rtenv_arm:v1.0` or build your own `./build_sdk.sh arm && ./run_sdk.sh arm`
         4.1.3 PPC: use `pinxue/rtenv_ppc_p1020:v1.0` or build your own `./build_sdk.sh ppc_p1020 && ./run_sdk.sh ppc_p1020`
    4.2  RT-Thread source code: you may `git clone --depth 1 https://github.com/RT-Thread/rt-thread` in docker container.  Or just put somewhere outside the docker, run_in.sh assume it is ../rt-thread (macOS/Linux), run_in.bat assume .\rt-thread (Windows).

## macOS/Linux

```bash
docker run --name rtenv --rm -it --privileged -p 8181:8181 \
  -v `pwd`:/home/rtt/rt-thread \
  pinxue/rtenv_base:v1.0\
  bash
```

## Windows

Assume you have cloned RT-Thread in `.\rt-thread`

```bat
docker run --name rtenv --rm -it --privileged -p 8181:8181 -v %~dp0rt-thread:/home/rtt/rt-thread pinxue/rtenv_base:v1.0 bash
```

## Tools in Docker

Please cat ~/README.md once you get in docker.

## More

The source of Dockerfile and some utility scripts can be found at https://github.com/pinxue/rtenv-in-docker

If you are working on a chip of other architecture, like aarch64, risc-v, xtensa, mips, x86, etc. you need download the toolchain and map into docker volume, take the aa64run_in.sh script as an example.

You may use this docker env just like a command, just take a look at analyzer_in.sh.
