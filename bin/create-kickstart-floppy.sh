#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..

. $DIR/config/config.sh

TMPDIR=$DIR/tmp/kickstart-floppy
FILE=$1

dd status=noxfer if=/dev/zero of=$FILE bs=1440K count=1
/sbin/mkfs -q -F -t ext2 $FILE
mkdir -p $TMPDIR
sudo mount -o loop $FILE $TMPDIR 

sed < $DIR/config/ks.cfg > $TMPDIR/ks.cfg -e "s/@ARCH@/$ARCH/g; s/@VBOX@/$VBOX/g; s/@RELEASE@/$RELEASE/g; s/@EPEL@/$EPEL/g; "

sync

sudo umount $TMPDIR
rmdir $TMPDIR
 
