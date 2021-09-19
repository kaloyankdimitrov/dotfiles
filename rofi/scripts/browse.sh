#!/bin/bash

declare -A links=( 
[Google]="https://google.com/" 
[Google Classroom]="https://classroom.google.com/" 
[Google Docs]="https://docs.google.com/"
)

if [[ $1 == "--input" ]]
then
	for key in "${!links[@]}"
	do
		echo "$key"
	done
elif [[ $1 == "--output" ]]
then
	read pick
	xdg-open "${links["$pick"]}"
else
	echo "Unknown option $1"
fi
