Openwrt-MR12/MR16
============

Bringup Repo for the Cisco Meraki MR12/MR16 on the latest OpenWRT Nightlies. 

I will continue to do random updates/upgrades/release on this repo as long as it keeps me entertained. Forks/Pull Requests are welcome!

About
-----
Based on OpenWRT CHAOS CALMER r44943. May or may not work on newer revisions.

Building
--------
git sync, copy files on top of build dir, menuconfig && kernel_menuconfig to mr12 or mr16, build, and enjoy

Booting TFTP
-------
	tftpboot 0x81000000 openwrt-ar71xx-generic-mr1*-initramfs-uImage.bin; bootm

Flashing System Images
-------
In u-boot, run the following commands:

	tftpboot 0x80010000 openwrt-ar71xx-generic-mr1*-kernel.bin;erase 0x9fda0000 +0x240000;cp.b 0x80010000 0x9fda0000 0x240000
	tftpboot 0x80010000 openwrt-ar71xx-generic-mr1*-rootfs-squashfs.bin;erase 0x9f080000 +0xD20000;cp.b 0x80010000 0x9f080000 0xD20000
	setenv bootcmd bootm 0x9fda0000; saveenv; boot

To Do
-----
##### MR12
  * Bring up the 2nd NIC (Not on SPI?)
  * Maybe More?
  
##### MR16
  * Maybe More?

Notice
------
No promises this won't brick your AP, and no promises that this will even work!
