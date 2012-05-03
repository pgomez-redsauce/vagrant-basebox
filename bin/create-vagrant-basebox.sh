#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..
VM=CentosBox

export PATH="$PATH:/opt/vagrant/bin"

#VBoxManage closemedium dvd 
#VBoxManage closemedium floppy

vagrant package --base $VM 

