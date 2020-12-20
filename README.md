# Hacks to run Debian 10 on Lenovo Miix320
Sync `non-free` APT sources to your system and run the `install.sh` as root.
Thanks to https://github.com/vovan47/miix310 for reference.

## Rotate framebuffer console
Add `fbcon=rotate:1` to kernel commandline.

## Blacklist faulty Intel WIFI driver
Add `blacklist iwlwifi` to /etc/modprobe.d and run `update-initramfs -u`.
