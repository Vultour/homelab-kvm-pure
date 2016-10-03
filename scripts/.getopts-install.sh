#!/bin/bash

### === CONFIG === ###
DIR=$(dirname "$0")
. $DIR/.conf.sh
### === CONFIG === ###


USAGE="Accepted parameters: -n MACHINE_NAME [-c VCPUS] [-m MACHINE_MEMORY] [-d MACHINE_DISKSIZE]"

MACHINE_NAME=""
MACHINE_CPUS=$VIRT_INSTALL_CPUS
MACHINE_MEMORY=$VIRT_POSTINSTALL_MEMORY
MACHINE_DISK=$VIRT_INSTALL_DISK


while getopts "n:c:m:d:" opt; do
	case $opt in
		n)
			MACHINE_NAME=$OPTARG
			;;
		c)
			MACHINE_CPUS=$OPTARG
			;;
		m)
			MACHINE_MEMORY=$OPTARG
			;;
		d)
			MACHINE_DISK=$OPTARG
			;;
	esac
done


if [ -z $MACHINE_NAME ]; then
	echo $USAGE >&2
	echo "Error: Argument '-n MACHINE_NAME' is required" >&2
	exit 1
fi

echo "Options:"
echo "Name  : $MACHINE_NAME"
echo "CPUS  : $MACHINE_CPUS"
echo "MEMORY: $MACHINE_MEMORY"
echo "DISK  : $MACHINE_DISK"
