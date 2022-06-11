#!/bin/bash
variant="$(xkblayout-state print %v)"
if [ -z "$variant" ]
then
	variant=""
else
	variant=": $variant"
fi
echo "      ⌨ $(xkblayout-state print %s)$variant   "
