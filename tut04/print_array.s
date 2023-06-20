

	.data
	#	 // Data - this is an array of integers i.e. 32 bits each
	#	 int numbers[10] = {0,1,2,3,4,5,6,7,8,9};
numbers:	.word 0,1,2,3,4,5,6,7,8,9

	.text
	# int main(void) {
main:
	
	#	 // Counter
	#	 int i;
	#	 i = 0;
	li	$t1, 0	# $t1 =0 
	li	$t2, 10	# $t2 =10 
	
	
	#	 if (i >= 10)
	#	 goto end_loop;
	#	 // while (i < 10) {
start_loop:
	bge	$t1, $t2, end_loop	# if $t1 >= 2t1 then target
	
	# Fetch value of numbers[i] to $t0
	
	# $t0 = numbers[i]
	lw	$t0, ($t3)	# 

	#	 // Syscall
	#	 printf("%d\n", numbers[i]);
	
	# Print a number - syscall 1
	li	$v0, 1		# $v0 =1 
	move 	$a0, $t0	# $a0 = $t0
	syscall

	# print a character - syscall 11
	li	$v0, 11		# $v0 =11 
	li	$a0, '\n'	# $a0 ='\n' 
	syscall

	#	 i++;
	addi	$t1, $t1, 1	# $t1 = $t1 +1 
	
	#	 goto start_loop:
	b	start_loop	# branch to start_loop
	
end_loop:
	jr	$ra		# jump to $ra
	
	#	 // }
	# }
