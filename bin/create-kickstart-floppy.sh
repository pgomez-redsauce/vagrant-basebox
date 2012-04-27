#!/bin/bash

dd if=/dev/zero of=images/kickstart.img bs=1440K count=1
/sbin/mkfs -F -t ext2  images/kickstart.img
mkdir -p tmp/kickstart-floppy
sudo mount -o loop images/kickstart.img tmp/kickstart-floppy 
cp -p config/ks.cfg tmp/kickstart-floppy/
sudo umount tmp/kickstart-floppy
rmdir tmp/kickstart-floppy
 
