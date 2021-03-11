FROM pinxue/rtenv:base
MAINTAINER Wu Yang <yangwu@rt-thread.com>

# NXP QorIQ Toolchain: https://nxp.flexnetoperations.com/control/frse/product?entitlementId=585148727&lineNum=1
# Download .iso and extract yocto/fsl-toolchain/fsl-qoriq-glibc-x86_64-ppce500v2-toolchain-2.0.sh here
RUN sudo apt-get remove -y python
ARG src="fsl-qoriq-glibc-x86_64-ppce500v2-toolchain-2.0.sh"
COPY ${src} /tmp/
RUN cd /tmp && sudo ./${src} -y && cd && sudo rm -f /tmp/${src} && sudo apt-get install -y scons

# Note: so far apt install clang-6, apt later ver doesn't support multiarch yet
ENV RTT_CC="gcc"
ENV RTT_EXEC_PATH="/opt/fsl-qoriq/2.0/sysroots/x86_64-fslsdk-linux/usr/bin/powerpc-fsl-linux-gnuspe"
