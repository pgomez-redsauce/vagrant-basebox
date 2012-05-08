#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..

. $DIR/config/config.sh

export PATH="$PATH:/opt/vagrant/bin"

#VBoxManage closemedium dvd 
#VBoxManage closemedium floppy

mkdir -p $DIR/boxes

vagrant package --base $NAME --output $DIR/boxes/$NAME.box

