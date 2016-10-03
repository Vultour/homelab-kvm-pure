#!/bin/bash
set -u

### === CONFIG === ###
DIR=$(dirname "$0")
. $DIR/.conf.sh
### === CONFIG === ###


# Reset the memory
virsh setmem $MACHINE_NAME ${MACHINE_MEMORY}MB --config
