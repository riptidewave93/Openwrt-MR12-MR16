Openwrt-MR12
============

Bringup Repo for the Cisco Meraki MR12 on the latest OpenWRT Nightlies


About
-----
Based on OpenWRT CHAOS CALMER r42690. May or may not work on newer revisions.

Building
--------
git sync, copy files on top of build dir, menuconfig && kernel_menuconfig, build, and enjoy

Booting
-------
tftpboot 0x81000000 openwrt-ar71xx-generic-mr12-initramfs-uImage.bin; bootm

To Do
-----
* Bring up the 2nd NIC (Missing PHY?)
* Bring up the Wi-Fi (PCI init issue?)
* Use Proper NIC MAC Addresses
* Fix Reset button GPIO (Is it even GPIO?)
* enable sysupgrade
* Possibly more?

Notice
------
I have only tested with with TFTP booting and NOT flashing to the flash. No promises this won't break everything!