#!/bin/bash
set -e
cd "$(dirname "$0")/.." || exit 1

mkdir -p build/iso/boot/grub
cp linux/arch/x86/boot/bzImage build/iso/boot/
cp build/initramfs.cpio.gz build/iso/boot/
cp config/grub.cfg build/iso/boot/grub/

grub-mkrescue -o build/aquaelix.iso build/iso
ls -lh build/aquaelix.iso
