#my_sample_fun() {
#    echo "Hello! This is vagdevi."
#}
# Add any environment variables or global configurations here

# Custom aliases

alias ll='ls -al'
alias grep='grep --color=auto'

# Custom functions
sample_function() {
    echo "Hello! This is a sample function."
    # Add your custom code here
}

# Load additional configurations from ~/.bashrc, if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

create_file() {

#!/bin/bash

# Prompt the user for a filename
read -p "Enter a filename: " filename

# Check if the file already exists
if [ -e "$filename" ]; then
    echo "File '$filename' already exists."
else
    # Create the file
    touch "$filename"

    # Check if the file was created successfully
    if [ -e "$filename" ]; then
        echo "File '$filename' created successfully."
    else
        echo "Failed to create file '$filename'."
    fi
fi
}
