#!/bin/bash
: '
read -p "Enter your lucky number" n

if [ $n -eq 101 ]; then
echo "You got 1st prize"
elif [ $n -eq 510 ]; then
echo "You got 2nd prize"
elif [ $n -eq 999 ]; then
echo "You got 3rd prize"
else
echo "Sorry, try for the next time"
fi
'

read -p "Enter your lucky number" n

if [[ $n -eq 101 || $n -eq 510 || $n -eq 999 ]]; then
echo "You got prize"
else
echo "You lost"
fi
