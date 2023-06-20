
# Constants defining matrix size
MATRIX_ROWS = 3
MATRIX_COLS = 4

# .DATA
	.data
M: 	.word 1, 2, 3, 4
	.word 3, 4, 5, 6
	.word 5, 6, 7, 8

# .TEXT <main>
	.text
main:
	# Args:     void
	# Returns:  void
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - $t0 - Scalar to multiply by
	# 	- $t1 - row index
	# 	- $t2 - col index
	#	- $t3 - 
	#	- $t4 - 
	#
	# Structure:
	#   main
	#   -> main__row_loop_cond
	#   -> main__row_loop_body
	#     -> main__col_loop_cond
	#     -> main__col_loop_body
	#     -> main__col_loop_end
	#   -> main__row_loop_end

					# scanf("%d, &mul)
	li	$a0, 	5		# $a0 = 5
	syscall
	move 	$t0, 	$v0		# $t0 = $v0

	li	$t1, 	0		# $t1 = 0
main__row_loop_cond:
	bge	$t1,	MATRIX_ROWS, main__row_loop_end	# if $t1 >= MATRIX_ROWS then target
	
main__row_loop_body:

main__col_loop_cond:
	bge	$t2, MATRIX_COLS, main__col_loop_end	# if $t2 >MATRIX_COLSt1 goto target
	
main__col_loop_body:

	# TODO: Calculate the address for $t3
	# and load a value into $a0 to print!

	# offset calculation
	

	move	$a0, $t4			# $a0 = $t4

	li	$v0, 1				# syscall 1 - print an integer
	syscall

	li	$a0, ' '			# $a0 =' '	
	li	$v0, 11				# Syscall 11 - print a character 

	addi	$t2, $t2, 1			# $t2 = $21 1

main__col_loop_end:

	li	$t1, 0				# $t1 = 0

	addi	$t1, $t1, 1			# $t1 = $11 1 0
	b		main__row_loop_cond	# branch to main__row_loop_cond

main__row_loop_end:


					# Return 0
	li		$v0, 	0	# $v0 = 0
	jr		$ra		# jump to $ra
	
