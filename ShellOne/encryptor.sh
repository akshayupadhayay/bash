#!/bin/bash

echo "Encrypt Decrypt files with this script"
echo "Enter user choice: "

choice="Encrypt Decrypt"

select option in $choice; do
	if [ $REPLY = 1 ];
	then
		echo "You chose Encryption"
		echo "Please enter filename to encrypt: "
		read file;
		gpg -c $file
		echo "File has been encrypted"
	else
		echo "You chose Decryption"
		echo "Please enter filename to decrypt"
		read file2;
		gpg -d $file2
		echo "File has been decrypted"
	fi
done

