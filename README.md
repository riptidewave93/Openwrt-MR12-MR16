**NOTE: This repo is NO LONGER MAINTAINED as these changes were applied upstream. Refer to http://git.openwrt.org/?p=openwrt.git;a=commit;h=acdf1a2592a14e11aab99996133c836dbef1f92a and enjoy the official nightles!** 

Openwrt-MR12/MR16
============

Bringup Repo for the Cisco Meraki MR12/MR16 on the latest OpenWRT Nightlies. 

I will continue to do random updates/upgrades/releases on this repo as long as it keeps me entertained. Forks/Pull Requests are welcome!

About
-----
Based on OpenWRT CHAOS CALMER r45651. May or may not work on newer revisions.

Building
--------
git sync, copy files on top of build dir, menuconfig && kernel_menuconfig to mr12 or mr16, build, and enjoy

Booting TFTP
-------
	tftpboot 0x81000000 openwrt-ar71xx-generic-mr1*-initramfs-uImage.bin; bootm

Flashing System Images
-------
##### MR12
In uboot, run the following commands:

	tftpboot 0x80010000 openwrt-ar71xx-generic-mr12-kernel.bin;erase 0x9fda0000 +0x240000;cp.b 0x80010000 0x9fda0000 0x240000
	tftpboot 0x80010000 openwrt-ar71xx-generic-mr12-rootfs-squashfs.bin;erase 0x9f080000 +0xD20000;cp.b 0x80010000 0x9f080000 0xD20000
	setenv bootcmd bootm 0x9fda0000; saveenv; boot

##### MR16
In uboot, run the following commands:

	tftpboot 0x80010000 openwrt-ar71xx-generic-mr16-kernel.bin;erase 0xbfda0000 +0x240000;cp.b 0x80010000 0xbfda0000 0x240000
	tftpboot 0x80010000 openwrt-ar71xx-generic-mr16-rootfs-squashfs.bin;erase 0xbf080000 +0xD20000;cp.b 0x80010000 0xbf080000 0xD20000
	setenv bootcmd bootm 0xbfda0000; saveenv; boot
	
#### LEDE - Setting hardware MAC Address
Note that as of 2016-10-26, users of LEDE on the MR12 and MR16 can now properly set their hardware MAC address to prevent MAC conflicts, or needing to set this with every reset. To verify if your installed firmware supports this, run `cat /proc/mtd` and if you see a "mac" partition like the example below, you can then follow the below steps to set your MAC address.

```
root@lede:~# cat /proc/mtd | grep mac
mtd5: 00010000 00010000 "mac"
```

If you see the "mac" partition like the above example you can continue, otherwise the following process will not work and MAY BE DAMAGING to your device.

To set your MAC, do the following.

  1. Get your MAC from the bottom of the device. In this example, we use 00:18:0a:33:44:55
  2. Convert your mac to somthing we can use with hex & echo. SO with the above mac, we would change it to:
  
  ```
  \x00\x18\x0a\x33\x44\x55
  ```
  
  3. With this, we can now erase our mac partition and set the MAC address using the following commands:
  
  ```
  mtd erase mac
  echo -n -e '\x00\x18\x0a\x33\x44\x55' > /dev/mtd5
  sync && reboot
  ```

  4. Once done your board will reboot, and should have the correct MAC set on the eth and wireless interfaces.
  
To Do
-----
##### MR12
  * Bring up the 2nd NIC (OpenWRT lacks driver support for the SoC NIC)
  * You tell me!
  
##### MR16
  * You tell me!

Notice
------
No promises this won't brick your AP, and no promises that this will even work!
