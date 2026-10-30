#!/bin/sh
cd "$(dirname "$0")/.." || exit 1
qemu-system-x86_64 \
  -kernel linux/arch/x86/boot/bzImage \
  -initrd build/initramfs.cpio.gz \
  -append "console=ttyS0" \
  -nographic \
  -m 512M
