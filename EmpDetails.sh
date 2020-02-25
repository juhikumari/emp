#!/bin/bash
clear
val=0
while [ $val -eq 0 ]
do
	echo -e "\nWelcome To Employee Management System"
	echo "1: Enter Employee Details"
	echo "2: Search Employee Who works less than 9 hours"
	echo "3: Exit"
	echo "Enter your choice:"
	read ch
	if [ $ch -eq 1 ]
	then
	
		echo "Enter Emp Id:"
		read EmpId

		echo "Enter Emp Name:"
		read EmpName

		echo -e "\nTime Format (24-hour clock)"
		echo -e "\nEnter In time:"
		read InTime

		echo "Enter Out time"
		read OutTime

		cat >> File.txt <<-EOF
		$EmpId,$EmpName,$InTime,$OutTime
		EOF

	elif [ $ch -eq 2 ]
	then
		input="File.txt"
		OLDIFS=$IFS
		IFS=','
		while read empid empname intime outtime
		do
			if [ $(($outtime-$intime)) -lt 9 ]
			then
				echo "Emp Id: $empid"
				echo "Emp Name: $empname"
				echo "In Time: $intime"
				echo "Out out: $outtime"
			fi
		done < $input
		IFS=$OLDIFS
	elif [ $ch -eq 3 ]
	then 
		val=1
	else
		echo "Wrong Input"
	fi
done
