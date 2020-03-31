#!/bin/sh
rm -rf __pycache__
rm -rf .sconsign.dblite
scons -c
