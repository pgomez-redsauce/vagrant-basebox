#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..

NAME=CentosTest
DISK=$DIR/images/$DISK.vdi
ISO=$DIR/isos/CentOS-6.2-x86_64-netinstall.iso
ISOKS=$ISO-kickstart.iso
KS=$DIR/images/kickstart.img

DISKSIZE=20480
MEMORY=512


$DIR/bin/create-dvd-with-kickstart.sh $ISO $ISOKS
$DIR/bin/create-kickstart-floppy.sh $KS

rm -f $DISK
VBoxManage createhd --filename $DISK --size $DISKSIZE
VBoxManage createvm --register --name $NAME --ostype RedHat_64

VBoxManage modifyvm $NAME --boot1 disk --boot2 dvd --boot3 none --boot4 none --memory $MEMORY

VBoxManage storagectl $NAME --name "Floppy" --add floppy
VBoxManage storageattach $NAME --storagectl "Floppy" --type fdd --device 0 --medium $KS

VBoxManage storagectl $NAME --name "IDE Controller" --add ide
VBoxManage storageattach $NAME --storagectl "IDE Controller" --port 0 --device 1 --type hdd --medium $DISK
VBoxManage storageattach $NAME --storagectl "IDE Controller" --port 1 --device 1 --type dvddrive --medium $ISOKS

VBoxManage startvm $NAME

