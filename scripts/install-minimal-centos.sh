#!/bin/bash

### === CONFIG === ###
DIR=$(dirname "$0")
. $DIR/.conf.sh
### === CONFIG === ###


### === OPTIONS === ###
. $VIRT_PATH_SCRIPTS/.getopts-install.sh
### === OPTIONS === ###


KICKSTART="https://gist.githubusercontent.com/Vultour/4a01ec29ad818928200c2c5bb450a0e7/raw/0c2e4fc2b5ac51cb954c82620fc9ddce836bbb8d/centos-kickstart-basic.ks"


virt-install \
	--graphics $VIRT_INSTALL_GRAPHICS \
	--name $MACHINE_NAME \
	--vcpus $MACHINE_CPUS \
	--memory $VIRT_INSTALL_MEMORY \
	--disk $VIRT_PATH_MACHINES/$MACHINE_NAME.img,size=$MACHINE_DISK \
	--location $VIRT_INSTALL_REMOTE_CENTOS \
	--network bridge=virbr0 \
	-x "ks=$KICKSTART" \
	--noreboot
#	--noautoconsole


### === POSTINSTALL === ###
. $VIRT_PATH_SCRIPTS/.postinstall.sh
### === POSTINSTALL === ###


virsh start $MACHINE_NAME
