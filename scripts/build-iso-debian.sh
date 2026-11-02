#!/bin/bash
set -e
cd "$(dirname "$0")/.." || exit 1

for f in build/iso/live/vmlinuz build/iso/live/initrd.img build/iso/live/filesystem.squashfs; do
    [ -f "$f" ] || { echo "Falta $f. Haz primero la etapa 4."; exit 1; }
done

mkdir -p build/iso/boot/grub
cp config/grub-debian.cfg build/iso/boot/grub/grub.cfg

grub-mkrescue -o build/aquaelix-debian.iso build/iso
ls -lh build/aquaelix-debian.iso
