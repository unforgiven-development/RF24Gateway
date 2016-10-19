#############################################################################
#
# Makefile for RF24Mesh on Raspberry Pi
#
# Author:  TMRh20 
# Date:    2014/09 
#
# Description:
# ------------
# use make all and make install to install the library 
# You can change the install directory by editing the LIBDIR line
#

## source configuration from the RF24 project's __Makefile.inc__ if possible ##
REL_RF24_MAKEFILE_INC="../RF24/Makefile.inc"
RF24_MAKEFILE_INC=$(shell echo "$$(cd "$$(dirname "$(REL_RF24_MAKEFILE_INC)")"; pwd)/$$(basename "$(REL_RF24_MAKEFILE_INC)")")

ifneq ("$(wildcard $(RF24_MAKEFILE_INC))","")
RF24_MAKEFILE_INC_EXISTS=1
else
RF24_MAKEFILE_INC_EXISTS=0
endif

ifeq ($(RF24_MAKEFILE_INC_EXISTS),1)
# $(RF24_MAKEFILE_INC) DEFINES:
# - CFLAGS
# - CXXFLAGS
# - PREFIX
# - CC
# - CXX
# - LDCONFIG
# - LIB_DIR
# - EXAMPLES_DIR
include $(RF24_MAKEFILE_INC)
else
PREFIX=/usr/local
LIB_DIR=$(PREFIX)/lib
EXAMPLES_DIR=$(PREFIX)/bin
CC=gcc
CXX=g++
LDCONFIG=ldconfig
# CFLAGS/CXXFLAGS #
## Assuming Raspberry Pi (original) / Raspberry Pi Zero ##
CFLAGS=-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard -O2 -pthread -pipe -fstack-protector --param=ssp-buffer-size=4
CXXFLAGS=-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard -O2 -pthread -pipe -fstack-protector --param=ssp-buffer-size=4 -std=c++0x
## -- Check for Raspberry Pi 2+ -- ##
ifeq "$(shell uname -m)" "armv7l"
## Set CFLAGS for Raspberry Pi 2+ ##
CFLAGS=-march=armv7-a -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -O2 -pthread -pipe -fstack-protector --param=ssp-buffer-size=4
CXXFLAGS=-march=armv7-a -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -O2 -pthread -pipe -fstack-protector --param=ssp-buffer-size=4 -std=c++0x
endif

endif
# (end of RF24_MAKEFILE_INC_EXISTS)

# Library parameters
# lib name 
LIB_RFN=librf24gateway
# shared library name
LIBNAME_RFN=$(LIB_RFN).so.1.0
# library include (header) directory
HEADER_DIR=${PREFIX}/include/RF24Gateway


# make all
# reinstall the library after each recompilation
all: librf24gateway

# Make the library
librf24gateway: RF24Gateway.o
	${CXX} -shared -Wl,-soname,$@.so.1 ${CXXFLAGS} -o ${LIBNAME_RFN} $^

# Library parts
RF24Gateway.o: RF24Gateway.cpp
	g++ -Wall -fPIC ${CCFLAGS} -c $^

# clear build files
clean:
	rm -rf *.o ${LIB_RFN}.*

install: install-libs install-headers

# Install the library to LIBPATH

install-libs: 
	@echo "[Install]"
	@if ( test ! -d $(PREFIX)/lib ) ; then mkdir -p $(PREFIX)/lib ; fi
	@install -m 0755 ${LIBNAME_RFN} ${LIBDIR}
	@ln -sf ${LIBDIR}/${LIBNAME_RFN} ${LIBDIR}/${LIB_RFN}.so.1
	@ln -sf ${LIBDIR}/${LIBNAME_RFN} ${LIBDIR}/${LIB_RFN}.so
	@ldconfig

install-headers:
	@echo "[Installing Headers]"
	@if ( test ! -d ${HEADER_DIR} ) ; then mkdir -p ${HEADER_DIR} ; fi
	@install -m 0644 *.h ${HEADER_DIR}

# simple debug function
print-%:
	@echo $*=$($*)

.PHONY: install