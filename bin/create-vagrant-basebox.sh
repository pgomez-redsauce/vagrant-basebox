#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..

. $DIR/config/config.sh

export PATH="$PATH:/opt/vagrant/bin"

#VBoxManage closemedium dvd 
#VBoxManage closemedium floppy

vagrant package --base $NAME

