#!/bin/bash

display_mod(){
	local f="$1"
	echo "Current Permission: "
	ls -l "$f"
}

change_mod(){
	local fl="$1"
	local user="$2"
	local mode="$3"

	case "$user" in 
		owner)
			chmod u="$mode" "$fl"
			;;
		group)
			chmod g="$mode" "$fl"
			;;
		others)
			chmod o="$mode" "$fl"
			;;
		all)
			chmod a="$mode" "$fl"
			;;
		*)
			echo "Invalid user provided"
			;;
	esac
}


if [ $# -lt 1 ]; then
	echo " you have provided no input"
	exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
	echo "this is not a file"
	exit 1
fi

display_mod "$file"

if [ $# -eq 3 ]; then
	change_mod "$1" "$2" "$3"


	echo "updated: "
	display_mod "$file"
fi
