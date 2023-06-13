# Prints a right - angled triangle of asterisks, 10 rows high.

	.text

main:
	# Main function to print a triangle of asterisks
	# counter i is in $t0
	# counter j is in $t1

	# TODO: Add the missing loops in this program
main__row_loop:
	li	$t0,	1		# i = 1;
	
main__row_loop_cond:
	# // while (i < 10)
	bge	$t0,	10,	main__row_loop_end
	
main__col_loop:
	li	$t1,	0		# j = 0;

main__col_loop_cond:
	bge	$t1,	$t0,	main__col_loop_end

					# printf("*");
	li	$a0, 	'*'
	li	$v0,	11		# syscall no. 11
	syscall

	b	main__col_loop_cond

main__col_loop_end:
					# printf("\n");
	li	$a0,	'\n'
	li	$v0,	11		# syscall no. 11
	syscall

	b	main__row_loop_cond

main__row_loop_end:

epilogue:
	li 	$v0, 	0		# return 0;
	jr	$ra


	.data 
	# Nothing here!