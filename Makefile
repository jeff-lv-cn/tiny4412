# author:jeff-lv  email:jeff-lv-1009080308@outlook.com
# create-time: 2018-5-12
# function: gloabl control tiny4412-project

DIR_UBOOT = ./uboot_tiny4412_0929
DIR_LINUX = ./linux-3.5
DIR_IMAGES = ./images

CMD_MKIMAGE = mkimage -A arm -O linux -T kernel -C none -a 0x40008000 -e 0x40008040 -n Linux-3.5

.PHONY : all install clean distclean 

all: uboot linux

tiny4412_config:
	make -C $(DIR_UBOOT) tiny4412_config
	cp  $(DIR_LINUX)/tiny4412_linux_defconfig $(DIR_LINUX)/.config
	
uboot:
	make -C $(DIR_UBOOT)
	make install-uboot
	
linux:
	make -C $(DIR_LINUX) zImage
	make install-linux

install: install-uboot install-linux
install-uboot:
	cp $(DIR_UBOOT)/u-boot.bin $(DIR_IMAGES)
install-linux:
	cp $(DIR_LINUX)/arch/arm/boot/zImage $(DIR_IMAGES)
	$(CMD_MKIMAGE) -d $(DIR_IMAGES)/zImage $(DIR_IMAGES)/uImage

clean: clean-uboot clean-linux
	rm $(DIR_IMAGES)/*
clean-uboot:
	make -C $(DIR_UBOOT) clean
clean-linux:
	make -C $(DIR_LINUX) clean

distclean: distclean-uboot distclean-linux
	rm $(DIR_IMAGES)/*
distclean-uboot: 
	make -C $(DIR_UBOOT) distclean
distclean-linux:
	make -C $(DIR_LINUX) clean


	
	
	

	
	
	
	