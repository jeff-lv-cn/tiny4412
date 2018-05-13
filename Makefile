# tiny 44412 top Makefile
# author:jeff-lv  email:jeff-lv-1009080308@outlook.com create-time: 2018-5-12

DIR_BOOTLOADER = ./bootloader
DIR_KERNEL = ./kernel
DIR_IMAGES = ./images
#DIR_TOOL_CAHIN = /home/jf/tiny4412/4.5.1/bin
DIR_TOOL_CAHIN = /home/jf/tiny4412/tools/arm-2014.05/bin

.PHONY : all install clean distclean \
		 bootloader kernel
		 
all: bootloader kernel
	
bootloader:
	make -C $(DIR_BOOTLOADER)
	make -C $(DIR_BOOTLOADER) install
	
kernel:
	make -C $(DIR_KERNEL)
	make -C $(DIR_KERNEL) install
	
config: config-bootloader config-kernel
config-bootloader:
	make -C $(DIR_BOOTLOADER) config
config-kernel:
	make -C $(DIR_KERNEL) config

install: install-bootloader install-kernel
install-bootloader:
	make -C $(DIR_BOOTLOADER) install
install-kernel:
	make -C $(DIR_KERNEL) install

clean: clean-bootloader clean-kernel
	rm -rf $(DIR_IMAGES)/*.bin $(DIR_IMAGES)/*Image*
clean-bootloader:
	make -C $(DIR_BOOTLOADER) clean
clean-kernel:
	make -C $(DIR_KERNEL) clean

distclean: distclean-bootloader distclean-kernel
	rm -rf $(DIR_IMAGES)/*.bin $(DIR_IMAGES)/*Image*
distclean-bootloader: 
	make -C $(DIR_BOOTLOADER) distclean
distclean-kernel:
	make -C $(DIR_KERNEL) distclean


	
	
	

	
	
	
	