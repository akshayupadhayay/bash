#!/bin/bash
#loop through names.txt

for NAMES in $(cat ./names.txt); do
	echo "Names are $NAMES"
done

