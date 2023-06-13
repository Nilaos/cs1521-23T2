

# Everything after this is code
	.text

main:
	# Main function to calculate the square of a number
	# x is in $t0
	# y is in $t1

	# TODO: This program

	# printf("Enter a number: ");
	li	$v0,	4	# syscall 4 - print string
	la	$a0, 	input_str
	syscall

	# scanf("%d", &x);
	li	$v0, 	5	# syscall 5 - scan integer
	syscall
	move	$t0,	$v0	# move into x

	# y = x * x;
	mul	$t1, 	$t0,	$t0

	# printf("%d", y);
	li	$v0,	1	# syscall 1 - print integer
	move	$a0,	$t1
	syscall

	# printf("\n");
	li	$v0,	11 	# syscall 11 - print character
	li	$a0,	'\n'
	syscall

					# return 0;
	li	$v0,	0		# $v0 = 0
	jr	$ra			# jump to $ra



	.data
input_str: .asciiz "Enter a number: "
	