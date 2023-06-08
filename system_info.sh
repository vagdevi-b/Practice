<<Comment
DESCRIPTION: 
Script that retrieves and displays system information such as the current date and time, the logged-in users, the system uptime, and the memory usage.
When the script is executed with the command `./system_info.sh`, it retrieves the required system information and display it in a readable format.
Comment

#!/bin/bash

# Current Date and Time
date=$(date)

# Logged in users
logged_users=$(who | awk '{print $1}' | uniq)

# System Uptime
uptime=$(uptime -p)

# Retrieve Memory Usage
used_mem=$(free -h | awk '/^Mem:/ {printf $3}')
total_mem=$(free -h | awk '/^Mem:/ {printf $2}')
percentage_used=$(free -h | awk '/^Mem:/ {printf("%2.2f%", $3/$2 * 100)}')

# Display system information

# Print the current date and time
echo "Date and Time: $date"

# Print the logged-in users
echo "Logged-in Users: $logged_users"

# Print the system uptime
echo "System Uptime: $uptime"

# Print memory usage information
echo "Memory Usage: "$used_mem" used out of "$total_mem" ("$percentage_used")"
