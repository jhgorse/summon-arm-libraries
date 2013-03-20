#!/bin/bash

set -x +v

TARGET=arm-none-eabi
PREFIX=/Users/jhg/toolchain-gcc-arm-none-eabi-4_7-2012q4-20121208-mac
SUMMON_DIR=$(pwd)
MAKEFLAGS+=-j2
export PATH="${PREFIX}/bin:${PATH}"

# Install a build
function install {
	echo "SED it."
	echo 0 $(echo ${SUDO} make ${MAKEFLAGS} $2 $3 \
		$4 $5 $6 $7 $8 | sed "s,$PREFIX,$SUMMON_DIR,")
	echo 1 $(echo $3 | sed "s,$PREFIX,$SUMMON_DIR,")
	echo "2 **********************************"
	$(echo ${SUDO} make ${MAKEFLAGS} $2 $3 \
		$4 $5 $6 $7 $8 | sed "s,$PREFIX,$SUMMON_DIR,")
	echo "MAKEFLAGS=$MAKEFLAGS"
	echo "TARGET=$TARGET"
	echo "PREFIX=$PREFIX"
	echo "SUMMON_DIR=$SUMMON_DIR"
}

install libcmsis-244329a3b95872060dd2ee3da436bbbffba995a0 arch_prefix=arm-none-eabi prefix=/Users/jhg/toolchain-gcc-arm-none-eabi-4_7-2012q4-20121208-mac install
# becomes:
# make -j2 arch_prefix=arm-none-eabi prefix=/Users/jhg/toolchain-gcc-arm-none-eabi-4_7-2012q4-20121208-mac install
# I want:
# make -j2 arch_prefix=arm-none-eabi prefix=${SUMMON_DIR} install