#!/bin/bash
export QEMU_AUDIO_DRV="none"

qemu-system-mipsel -M          malta \
		   -m          256 \
		   -kernel     vmlinux \
		   -nographic  \
 		   -hda        rootfs.ext2 \
                   -netdev     tap,id=foo,ifname=tap0 \
                   -device     virtio-net-pci,netdev=foo \
		   -no-reboot  \
		   -append     "root=/dev/hda console=uart0"

echo
