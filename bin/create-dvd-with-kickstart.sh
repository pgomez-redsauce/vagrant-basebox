#!/bin/bash

mkdir tmp/kickstart-dvd1

sudo mount -o loop -t iso9660 isos/CentOS-6.2-x86_64-netinstall.iso tmp/kickstart-dvd1

cp -af tmp/kickstart-dvd1 tmp/kickstart-dvd2
cp -af config/isolinux.cfg tmp/kickstart-dvd2/isolinux/

chmod a+w tmp/kickstart-dvd2/isolinux/isolinux.bin
mkisofs -o isos/CentOS-6.2-x86_64-kickstart.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -v -T tmp/kickstart-dvd2

sudo umount tmp/kickstart-dvd1

