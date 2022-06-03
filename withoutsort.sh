#!/bin/bash
for((i=0;i<10;i++))
do
	a=$(( RANDOM % 1000 * 1 ))
	if [ $a -lt 100 ]
	then
		while [ $a -lt 100 ]
		do
			a=$(( RANDOM % 1000 ))
		done
	fi
	ar[$i]=$a
done
echo "Array elements"
echo "${ar[@]}"

sm=${ar[0]}
gt=${ar[0]}
f=0
f1=0
for((i=1;i<10;i++))
do
	if [[ $sm -gt ${ar[$i]} || $sm -eq ${ar[$i]} ]]
	then
		sm=${ar[$i]}
		f=$i
	elif [[ $gt -lt ${ar[$i]} || $gt -eq ${ar[$i]} ]]
	then	gt=${ar[$i]}
		f1=$i
	fi

done

sm2=${ar[0]}
gt2=${ar[0]}
for((i=0;i<10;i++))
do
	if [[ ${ar[$i]} -eq $sm || ${ar[$i]} -eq $gt ]]
	then
		continue
	elif [[ $sm2 -gt ${ar[$i]} || $sm2 -eq ${ar[$i]} ]]
	then
		sm2=${ar[$i]}
	elif [[ $gt2 -lt ${ar[$i]} || $gt2 -eq ${ar[$i]} ]]
	then
		gt2=${ar[$i]}
	fi
done
echo "2nd smallest $sm2"
echo "2nd largest number is $gt2"
