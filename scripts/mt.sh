#!/bin/bash
# File: mt.sh
# Info: Mount and Unmount Ubunt and Fedora volumes
# NOTE: This probably won't work with every filesystem. It should work with a couple of old hard drives I have lying around.
# 	If you want to use this with a Raspberry Pi, you will need an adequate power source or else the drive will not work.
#	Consider using something that provides adequate power


# Func: usage
# Info: You general command that shows up with the -h/--help option
usage(){
 cat << EOF

find      - List what's avaiable. You may need to modify this script
            to be compatible with those results.
fedora	  - Mount a Fedora System
ubuntu	  - Mount an Ubuntu System
sd or usb - Mount a SD (using a USB adapter) or USB device.
            These may use exFAT for cards or thumbdrives 32GB on up.
unmount   - Unmount a filesystem
help      - This message

For extended help, please read the article in my Hacktop Wiki title "Mount a Hard Drive"
https://github.com/jrcharney/hacktop/wiki/Mount-a-Hard-Drive.md

Consider connecting your Desktop or Laptop hard drive with something that has adequate power like this device.
http://www.amazon.com/USB2-0-IDE-SATA-Adapter-Kit/dp/B000HJBE0O

For Micro SD cards use something like a MicroSD to USB card reader.

Use 'sudo fdisk -l' to modify this script to your needs accordingly.

DO NOT USE THIS SCRIPT ON THE HARD DRIVE YOU ARE RUNNING!
(i.e. /dev/mmcblk[0-9]p[0-9] or /dev/sda[0-9]+) unless you want to
unmount the disk you are using.
Also, don't mess with any Boot partitions (i.e. /dev/boot/)

EOF
 exit 0
}

warning(){
 cat << EOF
WARNING! YOU MUST MODIFIY THIS SCRIPT BEFORE USING IT!
To turn this warning off, you will need to comment out the line that
I have pointed out.

But first, you must also find replace the setting I made for USB Devices.
Scroll down until you find the line that says "EDIT THIS LINE!"
EOF
 exit 1
}

warning # COMMENT OUT THIS LINE once you have set up this script!

# Device paths. Modify them if they are different 
# from what `sudo fdisk -l` may have.
fedora="/dev/mapper/VolGroup-LogVol00"
ubuntu="/dev/mapper/ubuntu-root"

thumbdrive="/dev/sda1"	# EDIT THIS LINE! READ THE warning() AS TO WHY YOU MUST DO THIS!

[ $# -eq 0 ] && usage

case $1 in
	-l|find|list)
		# Note: Another command of interst is 'df -h', but it doesn't show unmounted devices or partitions.
		sudo fdisk -l
		;;
	fedora)
		sudo mount $fedora /mnt/disk
		;;
	ubuntu)
		sudo mount $ubuntu /mnt/disk
		;;
	exfat|sd|microsd|usb)
		sudo mount $thumbdrive /media/exfat
		;;
	-u|umount)
		if [ -b $fedora -o -b $ubuntu ]; then
			sudo umount /mnt/disk
		else
			sudo umount /media/exfat
		fi
		;;
	unmount)	# Help break some bad habits
		printf "'umount' has ONE n in it, try again.\n"
		exit 1
		;;
	-h|--help|help)
		usage
		;;
	*)
		printf "ERROR: Invalid command '%s'. Use 'help' for usage\n" $1
		exit 1
		;;
esac

