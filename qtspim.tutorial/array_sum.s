.data
	arr:	.word 3, 0, 1, 2, 6, -2, 4, 7, 3, 7
	msgin:	.asciiz "Enter Array Length: "
	msgout:	.asciiz "Result: "
	#	int i = 0;
	# 	int sum = 0;
	#	while (i < arrlen) {
	#		sum = sum + arr[i];
	#		i = i + 1;
	#	}
			
.text
	# print array length string message
	li $v0, 4		# system call code for print_str
	la $a0, msgin	# address of string to print
	syscall			# print the string

	# read user input
	li $v0, 5		# system call code for read_integer
	syscall			# read integer value from console
	move $t1, $v0	# put user input into a temporary register

	# initiate i and sum
	# array address -> $t0
	# array length -> $t1
	# i -> $t2
	# sum -> $t3
	# temp -> $t4

	la $t0, arr
	li $t2, 0		# int i = 0;
	li $t3, 0		# int sum = 0;

loop:
	slt $t4, $t2, $t1	# $t4 = i < array length ? 1 : 0
	beq	$t4, $zero, end	# if $t4 == 0, terminate loop

	lw $t4, 0($t0)		# $t4 = arr[i]
	add $t3, $t3, $t4	# sum = sum + $t4 (arr[i])
	addi $t0, $t0, 4	# increment arrdt pointer to next word
	addi $t2, $t2, 1	# i = i + 1
	j loop

end:
	# print result string message
	li $v0, 4		# system call code for print_str
	la $a0, msgout	# address of string to print
	syscall			# print the string

	# print array sum
	li $v0, 1		# system call code for print_int
	move $a0, $t3	# integer to print
	syscall			# print num_value
	
	# terminate program
	li $v0, 10		# system call code for exit
	syscall			# see you next time...