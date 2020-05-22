#!/bin/bash
# Generate random pass with Base64

echo "Generating random password. Enter password length"

read PASSWORD_LENGTH

for pass in $(seq 1 5);
do
	openssl rand -base64 48 | cut -c1-$PASSWORD_LENGTH
done

