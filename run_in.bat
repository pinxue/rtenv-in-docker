@cls

@echo Using default toolchain in docker (/opt/gcc/gcc-arm-none-eabi-5_4)
@echo To change toolchain in ./gcc/gcc-arm-none-eabi-6_2-2016q4
@echo "run_in.bat -v \PATH\TO\TOOLCHAIN:/opt/gcc/YOUR_TOOL_CHAIN -e RTT_EXEC_PATH=/opt/gcc/YUOR_TOOL_CHAIN/bin"
@echo .
@echo Assume rt-thread source code is in ./rt-thread (of windows system)
@echo .
@echo Note: You are in Linux bash now!
@echo .

@set TOOLCHAIN=/opt/gcc/gcc-arm-none-eabi-5_4-2016q3/bin

@REM scan-view-9 default on localhost:8181
@REM For your reference: -v %~dp0scripts:/home/rtt/ -v %~dp0gcc:/opt/gcc -e RTT_EXEC_PATH=%TOOLCHAIN% 
@docker run --name rtenv --rm -it --privileged -p 8181:8181 -v %~dp0rt-thread:/home/rtt/rt-thread %1 %2 %3 %4 %5 %6 %7 %8 %9 pinxue/rtenv:clang6_opt_gcc bash
