#!/bin/sh
if [ ! -z ${button} ]
then 
	xdg-open 'https://calendar.google.com'
fi
echo "   $(date '+%B %d, %y')   "

