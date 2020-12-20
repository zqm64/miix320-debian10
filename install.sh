#!/bin/bash -x

if [ $(id -u) != 0 ]; then
	echo "Please run this as ROOT!"
	exit 1
fi

source /etc/profile

echo i915 >> /etc/initramfs-tools/modules
echo pwm_lpss_platform >> /etc/initramfs-tools/modules

apt install firmware-intel-sound firmware-iwlwifi
apt install xserver-xorg-video-intel

mkdir -p /usr/share/X11/xorg.conf.d/

echo 'Section "Monitor"
	Identifier "DSI-1"
	Option "Rotate" "right"
EndSection

Section "InputClass"
	Identifier "Rotate Touchscreen"
	MatchIsTouchscreen "on"
	Option "CalibrationMatrix" "0 1 0 -1 0 1 0 0 1"
	Option "Gesture" "on"
EndSection'> /usr/share/X11/xorg.conf.d/99-miix320.conf

update-initramfs -u
update-grub
