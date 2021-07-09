.data
	num:	.word 0
	strin:	.asciiz "Enter number: "
	strout:	.asciiz "Your number is "

.text
	li $v0, 4	# system call code for print_str
	la $a0, strin	# address of string to print
	syscall		# print the string

	li $v0, 5	# system call code for read_integer
	syscall		# read integer value from console
	move $t0, $v0	# put user input into a temporary register
	la $t1, num 	# get address of num_value
	sw $t0, 0($t1)	# put user input into num_value

	add $t0, $zero, $zero	# reset $t1

	li $v0, 4	# system call code for print_str
	la $a0, strout	# address of string to print
	syscall			# print the string

	li $v0, 1	# system call code for print_int
	lw $a0, num	# integer to print
	syscall		# print num_value
	
	li $v0, 10	# system call code for exit
	syscall		# bye bye