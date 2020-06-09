#Validation of numeric value
checkNumeric='^[+-]?[0-9]+([.][0-9]+)?$'

#Execute the program while user does not input 'y' on stopStatus
while [ "$stopStatus" != "y" ]
do
	#User input num1
	echo "Enter first number"
	read num1

	#User requires to input num1 again if user input invalid numeric value for num1
	while ! [[ "$num1" =~ $checkNumeric ]]
	do
		echo "Invalid number. Please re-enter first number"
		read num1
	done

	#User input num2
	echo "Enter second number"
	read num2

	#User requires to input num2 again if user input invalid numeric value for num2
	while ! [[ "$num2" =~ $checkNumeric ]]
	do
		echo "Invalid number. Please re-enter second number"
		read num2
	done
	
	#User requires to select an operator.
	echo "Please select an operation"
	#Input 1 for addition
	echo "Enter 1 for addition"
	#Input 2 for subtraction
	echo "Enter 2 for subtraction"
	#Input 3 for multiplication
	echo "Enter 3 for multiplication"
	#Input 4 for division
	echo "Enter 4 for division"
	read operator
	
	#User requires to select operator again if user input invalid operator.
	#(Input the operator either 1, 2, 3 or 4)
	while [ "$operator" != 1 ] && [ "$operator" != 2 ] && [ "$operator" != 3 ] && [ "$operator" != 4 ]
	do
		echo "Invalid choice. Please re-select an operation"
		echo "Enter 1 for addition"
		echo "Enter 2 for subtraction"
		echo "Enter 3 for multiplication"
		echo "Enter 4 for division"
		read operator
	done

	#Calculate result of addition if user input 1 on operator
	if [ "$operator" == 1 ]
	then
		result=$(echo "$num1 + $num2" | bc)
		echo "$num1+$num2=$result"

	#Calculate result of subtraction if user input 2 on operator
	elif [ "$operator" == 2 ]
	then
		result=$(echo "$num1 - $num2" | bc)
		echo "$num1-$num2=$result"
	
	#Calculate result of multiplication if user input 3 on operator
	elif [ "$operator" == 3 ]
	then
		result=$(echo "$num1 * $num2" | bc)
		echo "$num1*$num2=$result"

	#If user input 4 on operator (select division operator)
	else
		#Let user know about number cannot be divided by 0 (if user input '0' on num2)
		if [ "$num2" == 0 ]
		then
			echo "Number cannot be divided by 0";
		#Calculate result of division
		else
			result=$(echo "$num1 / $num2" | bc)
			echo "$num1/$num2=$result"
		fi
	fi

	#Ask user would like to stop the calculator. User requires to type 'y' to stop the calculator.
	echo "Do you wish to stop the calculator? Type 'y' for stop"
	read stopStatus
done
