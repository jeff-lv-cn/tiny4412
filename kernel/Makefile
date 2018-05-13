# tiny4412 kernel Makefile

#LINUX_VERSION = 3.5
LINUX_VERSION = 4.5.7

DIR_IMAGES := ../images
ifeq ("$(LINUX_VERSION)", "3.5")
  CUR_LINUX = ./linux-3.5
else ifeq ("$(LINUX_VERSION)", "4.5.7")
  CUR_LINUX = ./linux-4.5.7
endif
	
CMD_MKIMAGE = mkimage -A arm -O linux -T kernel -C none -a 0x40008000 -e 0x40008040

.PHONY : all install clean distclean 

all: linux
linux:
	make -C $(CUR_LINUX) zImage

config:
	make -C $(CUR_LINUX) tiny4412_linux_defconfig
	
install:
	cp $(CUR_LINUX)/arch/arm/boot/zImage $(DIR_IMAGES)/zImage-$(LINUX_VERSION)
	$(CMD_MKIMAGE) -n linux-$(LINUX_VERSION) -d $(DIR_IMAGES)/zImage-$(LINUX_VERSION) $(DIR_IMAGES)/uImage-$(LINUX_VERSION)

clean:
	make -C $(CUR_LINUX) clean

distclean:
	make -C $(CUR_LINUX) distclean 