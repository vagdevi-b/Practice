#!/bin/bash
read -p "give a number " n
if [ $n -lt 10 ] 
then
echo "given number - $n is one digit number"
else
echo "given number - $n is two digit number"
fi
