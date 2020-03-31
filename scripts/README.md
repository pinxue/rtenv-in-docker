# RT-Thread Buidling Env in Docker

`sh run_in.sh` to get into the env.

You will run as user rtt, password rtt with sudo enabled.

- `. pandora.sh` to cd into bsp of RT-Thread IoT board (stm32l475-atk-pandora) 
- `. qemu-a9.sh` to cd into bsp of QEMU simulation for ARM Cortex-A9
- `. raspi3.sh`  to cd into bsp of Raspberry Pi 3B 64bit

If you have build the bsp in host env, `clean_host_env.sh` may clean it for you, it is already in PATH.

If you want to do static analysis of the source code, `run_clang_analyzer.sh` shows you how to, feel free to customize it for you convenience. Once you got the report, `report_server.sh <path_from_analyzer>` will open the webserver to serve the HTML report. Launch the `HOST` browser and visit `http://localhost:8181`

PS, toolchain (most likely gcc) is supposed in /opt/gcc
