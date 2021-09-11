#!/bin/bash
if [ -n "$button" ]
then 
	xdg-open 'https://sinoptik.bg'
fi
info="$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs echo)"
if [ -n "$info" ]
then
	echo "   $info   "
fi
info=""
