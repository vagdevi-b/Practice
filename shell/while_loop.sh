echo enter value for n:
read n
i=0

#read -p "Give me a value: " n
while [ $i -le $n ]
do
	echo $i
	i=$(expr $i + 1)
done
