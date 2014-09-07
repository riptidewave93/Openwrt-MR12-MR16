#
# Copyright (C) 2014 Chris Blake (chrisrblake93@gmail.com)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/MR12
	NAME:=Meraki MR12
	PACKAGES:=kmod-spi-gpio
endef

define Profile/MR12/description
	Package set optimized for the Cisco Meraki MR12 Access Point.
endef

$(eval $(call Profile,MR12))
