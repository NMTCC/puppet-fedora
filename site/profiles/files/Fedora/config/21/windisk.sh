#!/bin/bash

WINDISK=`fdisk -l /dev/sda | grep NTFS | cut -f1 -d" "`

if [ -n "$WINDISK"  ]; then
        mkdir /mnt/windows
        mount -o rw $WINDISK /mnt/windows

	pushd "/mnt/windows/Documents and Settings"
	for x in `ls`; do
		ENT=`getent passwd $x`
		if [ -n "$ENT" ]; then
			#rm -rf $x
			true
		fi
	done

	popd
        df | grep windows > /fs/tmp/windisk/`hostname`  
        umount /mnt/windows
        CLEAR=`mount | grep windows`
        if [ -z $CLEAR ]; then
                rm -rf /mnt/windows
        fi
fi

