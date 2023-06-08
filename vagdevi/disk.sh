threshold=70
# echo "$threshold"
disk_usage=$(df -h /dev/root | head -n 2 | tail -n 1 | awk '{print $5}' | cut -c -2)

echo "Disk usage is $disk_usage%"

if [ $disk_usage -gt $threshold ]; then
        echo "Disk usage is high"
else
	echo "Disk usage is normal"
fi
