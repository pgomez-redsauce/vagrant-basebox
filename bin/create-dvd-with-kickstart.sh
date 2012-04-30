#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..

SOURCE=$1
DEST=$2

mkdir -p $DIR/tmp/kickstart-dvd1

sudo mount -o loop -t iso9660 $SOURCE $DIR/tmp/kickstart-dvd1

cp -af $DIR/tmp/kickstart-dvd1 $DIR/tmp/kickstart-dvd2
cp -af config/isolinux.cfg $DIR/tmp/kickstart-dvd2/isolinux/

chmod a+w $DIR/tmp/kickstart-dvd2/isolinux/isolinux.bin
mkisofs -o $DEST -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -quiet -R -J -v -T $DIR/tmp/kickstart-dvd2 

sudo umount $DIR/tmp/kickstart-dvd1

