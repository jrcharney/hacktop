#!/bin/bash
# File: vcr.sh (formerly mt.sh)
# Info: Mount and Unmount Ubunt and Fedora volumes
# Date: 20 Apr 2016
# Author: Jason Charney, BSCS (jrcharneyATgmailDOTcom)
# NOTE: This probably won't work with every filesystem. 
#	It should work with a couple of old hard drives I have lying around.
# 	If you want to use this with a Raspberry Pi, you will need an adequate 
#	power source or else the drive will not work. Plugging it into your
#	Pi just won't work, not even if you have an old laptop drive in
#	USB enclosure.
#	Consider using something that provides adequate power that has it's own
#	power source.
# Note: I changed the name, because mt is a program in /bin for magnetic tape
#	that is still around.
# TODO: FIX THIS! Everything is broken. x_x

echo "Out of order"
exit 0

# Device paths. Modify them if they are different 
# from what `sudo fdisk -l` may have.
fedora="/dev/mapper/VolGroup00-LogVol00"
fedoraboot="/dev/mapper/VolGroup00-LogVol01"
ubuntu="/dev/mapper/ubuntu-root"
ubuntuswap=""
thumbdrive="/dev/sda1"				# EDIT THIS LINE!

# Func: usage
# Info: You general command that shows up with the -h/--help option
usage(){
	cat << EOF
VCR.sh
-----------------
VCR was an attempt to make a script to make mounting and dismounting
file systems more human friendly.

My advice: DON'T USE THIS! Unless you can fork it and make a better version.
Just be sure to share it with me when you succeed.

-----------------
fdisk     	- List what's avaiable.
			This will show what is mounted an not mounted.
			You may need to modify this script to be compatible 
			with those results.
df		- List what's mounted. This will only show what's mounted.
-m fedora	- Mount a Fedora System
-m ubuntu	- Mount an Ubuntu System
-m exfat	- Mount a (micro)SD card (using a USB adapter) or USB device.
            		These may use exFAT for cards or thumbdrives 32GB on up.
-m <dev> <dir>	- Mount a filesystem that is something other than the three presets.
			dev is a path to a device in /dev/
			dir is a path to a mount point in /mnt/ or /media/
-u		- Unmount a fedora, ubuntu, or exfat file system
-u <dir>   	- Unmount a filesystem. This one is more specific.
help      	- This message

For extended help, please read the article in my Hacktop Wiki 
title "Mount a Hard Drive"
https://github.com/jrcharney/hacktop/wiki/Mount-a-Hard-Drive.md

Consider connecting your Desktop or Laptop hard drive with something 
that has adequate power like this device.
http://www.amazon.com/USB2-0-IDE-SATA-Adapter-Kit/dp/B000HJBE0O

For Micro SD cards use something like a MicroSD to USB card reader.

Use 'sudo fdisk -l' to modify this script to your needs accordingly.

DO NOT USE THIS SCRIPT ON THE HARD DRIVE YOU ARE RUNNING!
(i.e. /dev/mmcblk[0-9]p[0-9] or /dev/sda[0-9]+) unless you want to
unmount the disk you are using.
Also, don't mess with any Boot partitions (i.e. /dev/boot/)

A safety mechanisms  have created to prevent accidents.
Run 'vcr -nw' if this is your first time using vcr.

BE KIND, REWIND!

EOF
	exit 0
}

# Func: safety
# Info: Prevent certain parts of this program from running until ~/.vcr_nowarn is created.
safety(){
	if [ ! -f ~/.vcr_nowarn ]; then
		printf "ERROR! ~/.vcr_nowarn does not exist! Aborting.\n"
		printf "Please run './vcr.sh -nw' bfefore using vcr.sh.\n"
		exit 1
	fi
}

# Func: check
# Info: Make sure that the device partition you are applying a command to is not in 
#	the list of devices you know you shouldn't touch.  This will make sure that
#	vcr.sh doesn't unmount your harddrive.
check(){
	safety
	for line in $(cat ~/.vcr_nowarn);  do
		if [ "$1" == "$line" ]; then
			printf "ERROR! You can't do that to %s.\n" "$1"
			printf "It is on the ~/.vcr_nowarn list.\n"
			exit 1
		fi
	done		# If everything checks out, do nothing. Carry on with whatever it was you were doing.
}

# Func: checkpath
# Info: Sanity check for path
checkpath(){
	if [ -z "$1" ]; then
		printf "ERROR! Path argument is blank. Aborting.\n"
		exit 1
	fi
	# Ideally, only allow mountpoints in /mnt and /media.  Everywhere else is awkward
	okpath=$(echo "$1" | gawk '{ print ( $0 ~ /^\/(mnt|media)/ ) ? "yes" : "no" }')
	if [ "$okpath" == "no" ]; then
		# printf "ERROR! %s is a bad place for a mount point.\n" "$1" 
		printf "ERROR! %s isn't in a mounting directory.\n" "$1"
		printf "Pick somewhere in /mnt/ or /media/.\n"
		exit 1
	fi
}

# Func: checkown
# Info: Sanity check for ownership
checkown(){
	if [ -z "$1" ]; then
		printf "ERROR! Path argument is blank. Aborting.\n"
		exit 1	
	fi
	if [ ! -O "$1" -o ! -G "$1" ]; then	# if the directory exists but is not yours
		printf "%s exist, but you do not have permission to use it." "$1"
		printf "Pick something else. Aborting.\n"
		exit 1
	fi
}

# id -u -n 	# pi	Show the user name
# id -g -n	# pi	Show the group name

# Func: mkmpt
# Info: Make a Mount Point.
#	Create a mount point that you can access without being the adminstrator.
#	This function will still require adminstrator access to run.
mkmpt(){
	checkpath $1
	if [ ! -d "$1" ]; then			# if the directory does not exist
		you=$(whoami)			# DON'T SUDO THIS COMMAND!
		sudo mkdir -p $1		# Create the directory
		sudo chown ${you}:${you} $1	# Make it accessible to you.
		printf "%s created!\n" "$1"
	fi					# Do nothing if the mount point already exists
	checkown $1
}

# Func: mtdisk
# Info: Mount disk.  Mount disk but with two features.
# 1. Check to make sure that the device we are adding isn't on the list.
# 2. Check if the mount point directory exists.
#	If it doesn't, create it if permitted.
#	If it is some place outside of /mnt or /media, cancel.
#	If it does but is not ours, cancel.
mtdisk(){
	check $1		# Check to make sure the device isn't on the ~/.no_warn list.
	mkmpt $2		# Check to make sure the place where we are mounting it to exists.
	sudo mount $1 $2	# Mount it
	printf "%s should be mounted at %s\n" "$1" "$2"
}

# Func: umtdisk
# Info: Unmount a disk
# 	Like with mtdisk, it checks for existence, path location, and ownership
# TODO: Should I ask for confirmation?
umtdisk(){
	if [ ! -d "$1" ]; then			# If the directory doesn't exist
		printf "ERROR: %s doesn't exist.\n" "$1"
		printf "It either isn't mounted or you made a typo.\n"
		exit 1
	fi
	checkpath $1
	checkown $1
	fs=$( df -h | gawk '{print $6 "\t" $1}' | grep "$1" | gawk '{print $2}' )
	check "$fs"		# Check to make sure you can dismount the file system that partition is on
	sudo umount $1		# Unmount it if it passed the check
	printf "%s should be unmounted.\n" "$1"
	exit 0
}

usage	# REMOVE THIS IF YOU WANT IT TO TRY TO GET IT TO WORK.

[ $# -eq 0 ] && usage

# TODO: In the next version of this program, check the information based on File system
# For a nicer view of that, try running this command
# sudo fdisk -l | sed -n -e '/^\/dev\//p' | gawk '{print $1 "\t" $7 }'
# Where $1 is the path to the device and paritition, and $7 is the file system type.
# SD cards may return 'HPFS/NTFS/exFAT'

# I generally like to put old computer harddrives into /mnt/disk.
# For any other devices, there should be a directory in /media.  /media/exfat works OK for SD Cards.
case $1 in
	-l|list|fdisk|avaiable)
		# Note: Another command of interst is 'df -h', but it doesn't show unmounted devices or partitions.
		sudo fdisk -l
		;;
	-L|df|mounted)
		df -h	# Let's add a shortcut to that
		;;
	-m|mount)
		if [ -z "$2" ]; then
			printf "ERROR! I need a file system to mount.\n"
			exit 1
		fi
		case $2 in
			fedora)		# Mount a fedora system
				sudo vgscan
				sudo vgchange -ay VolGroup00
				sudo lvs
				mtdisk "$fedora" /mnt/disk
				;;
			ubuntu)		# Mount an ubuntu system
				sudo vgscan
				sudo vgchange -ay ubuntu
				sudo lvs
				mtdisk "$ubuntu" /mnt/disk
				;;
			exfat|sd|microsd|usb|thumbdrive)	# Mount an exfat device
				mtdisk "$thumbdrive" /media/exfat
				;;
			*)		# Mount something else
				if [ -z "$3" ]; then
					printf "ERROR: I need a mount point to put %s.\n" "$2"
					exit 1
				fi
				mtdisk "$2" "$3"
				;;
		esac
		;;
	-u|umount)
		if [[ -z "$2" ]]; then	# Unmount a fedora or ubuntu system
			#if [ -b $fedora ]; then
			#	umtdisk "$fedora"
			#elif [ -b $ubuntu ]; then
			#	umtdisk "$ubuntu"
			if [ -b "$fedora" -o -b "$ubuntu" ]; then
				umtdisk /mnt/disk
				# TODO: Remove any soft/hard link that may be in /dev/mapper
				# sudo lvremove -f $fedora  or sudo lvremove -f $ubuntu  as well as any other partitions!
			else		# Unmount an exfat system
				umtdisk /media/exfat
			fi
		else			# Unmount something else
			umtdisk "$2"
		fi
		;;
	unmount)	# Help break some bad habits
		printf "'umount' has ONE n in it, try again.\n"
		exit 1
		;;
	-nw|nowarnings)
		if [ -f ~/.vcr_nowarn ]; then
			printf "ERROR: ~/.vcr_nowarn already exists. Aborting.\n"
			exit 1
		fi
		cat <<EOF
This function will create the ~/.vcr_nowarn file that will prevent you 
from unmounting your hard drive.  In order for this program to work, 
you must disconnect all file systems (thumb drives, floppy disks, DVDs, 
SD cards, etc.) from your computer right now that are not plugged in 
when you start your computer.  If you do not, you will not be permitted
to disconnect those devices.

Any internal harddrives and their partitions will be added to the list 
~/.vcr_nowarn such that if you use vcr.sh, you can mount and unmount only 
the devices that are not part of your system by default.

EOF
		try=0
		while read -r -p "With that said, do you want to create ~/.vcr_nowarn? [Y/N]: " ans; do
			case ${ans,,} in
				y|yes)	
					# Create the ~/.vcr_nowarn file to override warnings.
					sudo fdisk -l | sed -n -e '/^\/dev\//p' | gawk '{print $1}' > ~/.vcr_nowarn
					printf "~/.vcr_nowarn created. You can now use mt.sh.\n"
					exit 0
					;;
				n|no)
					printf "Aboring this script. ~/.vcr_nowarn was not created.\n"
					exit 1
					;;
				*)
					if [ $((++try)) -lt 3 ]; then
						printf "Invalid entry, please try again.\n"
					else
						printf "After three tries, I quit! ~/.vcr_nowarn was not created.\n"
						exit 1
					fi
					;;
			esac
		done
		;;
	-h|--help|help)
		usage
		;;
	*)
		printf "ERROR: Invalid command '%s'. Use 'help' for usage\n" $1
		exit 1
		;;
esac

