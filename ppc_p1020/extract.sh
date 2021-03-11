tail -n +`expr $(grep -na "^MARKER:$" fsl-qoriq-glibc-x86_64-ppce500v2-toolchain-2.0.sh|cut -d':' -f1) + 1` fsl-qoriq-glibc-x86_64-ppce500v2-toolchain-2.0.sh > t.tar.bz2
