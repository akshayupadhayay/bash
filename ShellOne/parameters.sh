#!/bin/bash

echo "Adding parameter to script: $0"
echo "Creating user: $1"

adduser --home /$1 $1
