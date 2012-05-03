#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..
RELEASE=$1

mkdir $DIR/isos
wget -nd -m -P $DIR/isos http://ftp.udl.es/pub/centos/$RELEASE/isos/x86_64/CentOS-$RELEASE-x86_64-netinstall.iso
