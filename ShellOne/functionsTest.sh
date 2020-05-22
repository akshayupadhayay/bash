#!/bin/bash

echo "Executing function to check file existance"

function filecheckOne(){

if [ -e ./loop.sh ]; #correct file name is loops.sh
then
	echo "loops.sh exists"
else
	echo "loops.sh does not exists"
fi

filecheckTwo

}


function filecheckTwo(){

if [ -a ./names.txt ];
then
	echo "names.txt exist"
else
	echo "names.txt does not exist"
fi

}

filecheckOne
