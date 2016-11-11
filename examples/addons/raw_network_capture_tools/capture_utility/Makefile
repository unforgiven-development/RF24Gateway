################################################################################
# PROJECT:  RF24Gateway
# FILE:     examples/addons/raw_network_capture_tools/capture_utility/Makefile
#
# DESCRIPTION:  Makefile for the capture_utility, a simple tool to passively
#               listen to, capture, and output network traffic between nodes
#               on an NRF24L01(+)-based network on UDP port 32001. A wireshark
#               dissector, as well as a sample program are available to make use
#               of the captured data.
#
# ORIGINAL AUTHOR:  TMRh20
# DATE:             August 2016
# REPOSITORY URL:   https://gitub.com/tmrh20/RF24Gateway
#
# IMPROVEMENTS BY:  Gerad Munsch <gmunsch@unforgivendevelopment.com>
# REPOSITORY URL:   https://github.com/unforgiven-development/RF24Gateway
#
################################################################################

prefix := /usr/local

# Assuming Raspberry Pi (original) / Raspberry Pi Zero
CCFLAGS=-O2 -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -std=c++0x
# -- Check for Raspberry Pi 2+ --
ifeq "$(shell uname -m)" "armv7l"
# Set $CCFLAGS for Raspberry Pi 2+
CCFLAGS=-march=armv7-a -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -O2 -pthread -pipe -fstack-protector --param=ssp-buffer-size=4 -std=c++0x
endif

# define all programs
PROGRAMS = rf24_capture_utility
SOURCES = ${PROGRAMS:=.cpp}

all: ${PROGRAMS}

${PROGRAMS}: ${SOURCES}
	g++ ${CCFLAGS} -Wall -I../ -lrf24-bcm -lrf24network -lrf24mesh -lrf24gateway $@.cpp -o $@

clean:
	rm -rf $(PROGRAMS)

install:
	test -d $(prefix) || mkdir $(prefix)
	test -d $(prefix)/bin || mkdir $(prefix)/bin
	for prog in $(PROGRAMS); do \
	  install -m 0755 $$prog $(prefix)/bin; \
	done

# simple debug function
print-%:
	@echo $*=$($*)

.PHONY: install
