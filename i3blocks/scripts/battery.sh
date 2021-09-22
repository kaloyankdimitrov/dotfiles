#!/bin/bash
line="$(acpi | grep 'Battery 0' | awk 'NR==1{print}')"
if [ -n "$line" ]
then
	icon=""
	status="$(echo $line | awk '{print $3}')"
	if [  $status == "Charging," ]
	then
		icon=""
	else
		if [ $status != "Full," ]
		then
			icon=""
			if [ $(echo $line | awk '{print substr($4, 1, length($4)-2)}') -lt 76 ]
			then
				icon=""
			fi
			if [ $(echo $line | awk '{print substr($4, 1, length($4)-2)}') -lt 51 ]
			then
				icon=""
			fi
			if [ $(echo $line | awk '{print substr($4, 1, length($4)-2)}') -lt 26 ]
			then
				icon=""
			fi
			if [ $(echo $line | awk '{print substr($4, 1, length($4)-2)}') -lt 6 ]
			then
				icon=""
			fi
		fi
	fi
	if [ $status = "Full," ]
	then
		echo "     100%   "
	elif [ $(echo $line | awk '{print substr($4, 1, length($4)-2)}') != "0" ]
	then
		echo "   $icon $(echo $line | awk '{print substr($4, 1, length($4)-1) " : " $5}')   "
	fi
fi
