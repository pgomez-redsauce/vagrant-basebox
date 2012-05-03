#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )/..

. $DIR/config/config.sh 

mkdir $DIR/isos
wget -nd -m -P $DIR/isos http://ftp.udl.es/pub/centos/$RELEASE/isos/$CPU/CentOS-$RELEASE-$CPU-$ISOTYPE.iso
