#!/bin/bash
if [ ! -z $button ]
then
	i3-msg exec pavucontrol > /dev/null
fi
comm=$(amixer -D pulse get Master)
leftVolume=$(echo $comm | awk -F'Left:|[][]' 'BEGIN {RS=""}{print $3}')
rightVolume=$(echo $comm | awk -F'Right:|[][]' 'BEGIN {RS=""}{print$7}')
leftMuted=$(echo $comm | awk -F'Left:|[][]' 'BEGIN {RS=""}{print $5}')
rightMuted=$(echo $comm | awk -F'Right:|[][]' 'BEGIN {RS=""}{print$9}')
echo "   $leftMuted" "$leftVolume" " ""$rightVolume" "$rightMuted   "
