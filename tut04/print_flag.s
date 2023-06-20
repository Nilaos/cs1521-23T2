
FLAG_COLS = 12
FLAG_ROWS = 6

.data
# char flag[6][12] = {
flag: 
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
# };

.text
# int main(void) {
main:
	#     row is $t0
	li	$t0, 0			# $t0 = 0
	li	$t6, FLAG_ROWS		# $t6 = 6 maximum rows
	
main__row_loop_cond:
						# while(row < 6) {
	bge	$t0, $t6, main__row_loop_end	# if $t0 > $t6 then main__row_loop_end

	li	$t1, 0			# $t1 = 0

main__col_loop_cond:
	bge	$t1, FLAG_COLS, main__col_loop_end	# if $t1 > FLAG_COLS goto target

	# offset calculation in $t3 - TODO:
					# Row Offset = t0 * (1) * row length
	mul	$t2,	$t0,	FLAG_COLS
	add	$t2,	$t2,	$t1	# Add Number of columns for column offset
	mul	$t3,	$t2,	1	# Multiply by the size of each element (1)

	lb	$t4, flag($t3)		# load word from 0($s1) into $t1

	move	$a0, $t4		# $a0 = $41
	li	$v0, 11			# $t1 = 1
	syscall

	addi	$t1,	$t1,	1

	b	main__col_loop_cond	# branch to main__col_loop_cond

main__col_loop_end:

	# printf ("\n");
	# print a character - syscall 11
	li	$v0, 11		# $v0 =11 
	li	$a0, '\n'	# $a0 ='\n' 
	syscall

	# row++;
	addi	$t0, $t0, 1		# $t0 = $t0+ 1 
	b	main__row_loop_cond	# branch to target

main__row_loop_end:
	jr		$ra		# jump to $ra
