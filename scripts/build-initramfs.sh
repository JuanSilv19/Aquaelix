#!/bin/bash
set -e
cd "$(dirname "$0")/.." || exit 1

BUSYBOX=build/busybox-1.36.1/_install

rm -rf build/rootfs
mkdir -p build/rootfs/{bin,sbin,proc,sys,dev,etc,tmp}
cp -a "$BUSYBOX"/* build/rootfs/
cp initramfs/init build/rootfs/init

sudo mknod -m 600 build/rootfs/dev/console c 5 1
sudo mknod -m 666 build/rootfs/dev/null c 1 3

cd build/rootfs
find . | cpio -o -H newc --owner root:root 2>/dev/null \
  | gzip -9 > ../initramfs.cpio.gz
cd ../..

ls -lh build/initramfs.cpio.gz
