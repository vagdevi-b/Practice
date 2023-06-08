#!/bin/bash

echo "Before appending the file"
cat file.txt

echo "Hi All">>file.txt
echo "After appending the file"
cat file.txt
