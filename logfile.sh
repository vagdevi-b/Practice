#!/bin/bash

log_file="./log.txt"
start_date="20/02/22"
end_date="24/02/22"

start_timestamp=$(date -d "$(echo "$start_date" | awk -F '/' '{print $2 "/" $1 "/20" $3}')" +%s)
end_timestamp=$(date -d "$(echo "$end_date" | awk -F '/' '{print $2 "/" $1 "/20" $3}')" +%s)

if [ ! -f "$log_file" ]; then
  echo "Log file '$log_file' does not exist."
  exit 1
fi

while IFS= read -r line; do
  timestamp=$(date -d "$(echo "$line" | awk -F ' ' '{print $1}' | awk -F '/' '{print $2 "/" $1 "/20" $3}')" +%s)
  if [[ $timestamp -ge $start_timestamp && $timestamp -lt $end_timestamp ]]; then
    echo "$line"
  fi
done < "$log_file"

