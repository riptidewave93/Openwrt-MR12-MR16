Openwrt-MR12
============

Bringup Repo for the Cisco Meraki MR12 on the latest OpenWRT Nightlies


About
-----
Based on OpenWRT CHAOS CALMER r43347. May or may not work on newer revisions.

Building
--------
git sync, copy files on top of build dir, menuconfig && kernel_menuconfig to mr12, build, and enjoy

Booting TFTP
-------
tftpboot 0x81000000 openwrt-ar71xx-generic-mr12-initramfs-uImage.bin; bootm

Flashing System Images
-------
In u-boot, run the following commands:

1. tftpboot 0x80010000 openwrt-ar71xx-generic-mr12-kernel.bin;erase 0x9fda0000 +0x240000;cp.b 0x80010000 0x9fda0000 0x240000

2. tftpboot 0x80010000 openwrt-ar71xx-generic-mr12-rootfs-squashfs.bin;erase 0x9f080000 +0xD20000;cp.b 0x80010000 0x9f080000 0xD20000

3. setenv bootcmd bootm 0x9fda0000; saveenv; boot

To Do
-----
* Bring up the 2nd NIC (Not on SPI?)
* Maybe More?

Notice
------
No promises this won't brick your AP, and no promises that this will even work!
