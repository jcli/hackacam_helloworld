ARCH         := arm
ARM_ROOT     ?= /tools/codesourcery/Sourcery_G++_Lite_for_ARM_GNU_Linux
ARM_TOOLS    ?= $(ARM_ROOT)/2009q3-67/Linux
TARGET_SYS   := 2.6.32.arm
CXX          := $(ARM_TOOLS)/bin/arm-none-linux-gnueabi-c++
CC           := $(ARM_TOOLS)/bin/arm-none-linux-gnueabi-gcc
LD           := $(ARM_TOOLS)/bin/arm-none-linux-gnueabi-ld
AR           := $(ARM_TOOLS)/bin/arm-none-linux-gnueabi-ar

OUTNAME = hackacam_helloworld

$(OUTNAME): hackacam_helloworld.c
	$(CXX) -MMD -fPIC -pipe -g -Wall -o $@ $< -I../common -I./resource/include/ -static -L./resource/lib/ -lsdvr_sdk -lsct -lpthread -lrt -laio -lsvcext_lib

clean:
	rm -rf $(OUTNAME)
	rm -rf *.d
