#tiny4412 bootloader Makefile

DIR_IMAGES := ../images
CUR_BOOTLOADER = ./uboot-201012

.PHONY : all install clean distclean 

all: uboot
uboot:
	make -C $(CUR_BOOTLOADER)

config:
	make -C $(CUR_BOOTLOADER) tiny4412_config
	
install:
	cp $(CUR_BOOTLOADER)/u-boot.bin $(DIR_IMAGES)

clean:
	make -C $(CUR_BOOTLOADER) clean

distclean:
	make -C $(CUR_BOOTLOADER) distclean 