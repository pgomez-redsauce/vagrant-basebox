#!/bin/bash

rm -f images/CentosTest.vdi
VBoxManage createhd --filename images/CentosTest.vdi --size 20480
VBoxManage createvm --register --name CentosTest --ostype RedHat_64

VBoxManage modifyvm CentosTest --boot1 disk --boot2 dvd --boot3 none --boot4 none --memory 512

VBoxManage storagectl CentosTest --name "Floppy" --add floppy
VBoxManage storageattach CentosTest --storagectl "Floppy" --type fdd --device 0 --medium images/kickstart.img

VBoxManage storagectl CentosTest --name "IDE Controller" --add ide
VBoxManage storageattach CentosTest --storagectl "IDE Controller" --port 0 --device 1 --type hdd --medium images/CentosTest.vdi
VBoxManage storageattach CentosTest --storagectl "IDE Controller" --port 1 --device 1 --type dvddrive --medium isos/CentOS-6.2-x86_64-kickstart.iso


VBoxManage startvm CentosTest

#VBoxManage modifyvm CentosTest --dvd none
