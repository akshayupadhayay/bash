#!/bin/bash
# bash test
# Test path: /home/runner/bash/ShellOne


echo "Enter version and gituser"

read VERSION USERNAME

echo "Version is $VERSION and username is $USERNAME"

if [ $VERSION -eq 2 ];
then
	echo "Correct version"
else
	echo "Not correct version"
fi


if [ -a /home/runner/bash/ShellOne/bashOne.sh ];
then
	echo "Script found"
else
	echo "Script not found"
fi

