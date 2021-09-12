#!/bin/sh
if [ ! -z ${button} ]
then 
	xdg-open 'https://www.thetimenow.com/worldclock.php'
fi
echo "   $(date '+%T')   "


