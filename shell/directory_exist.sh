#!/bin/bash
read -p "Enter directory name" ndir
if [ -d "$ndir" ]; 
then
echo "Directory exist"
else
`mkdir $ndir`
echo "Directory created"
fi
