# Recursive maximum of array function

# Register usage:
#   - `&a' is in $a0
#   - `length' is in $a1
#   - `first_element' is in $s0
#   - `max_so_far' is in $s1
#   - Return 1 integer in $v1

# s0 & s1 used for a and first_element because they need
# to keep their value across recursive call

max:
	# prologue
	# Move the stack pointer *down* to get space
	addi	$sp, $sp, -12	   # 4*3 = 12

	# Then store $ra and $s0 registers
	sw	$ra, 8($sp)	# 
	sw	$s0, 4($sp)	# 
	sw	$s1, 0($sp)	# 
	
	# first_element = a[0]
	lw	$s0, 0($a0)	# 
	
	# if (length == 1)
	bgt	 $a1, 1, end1
	#   return first_element;
	move	$v0, $s0
	b	   max_return

end1:			   # }

	# calculate &a[1]
	addi	$a0, $a0, 4		
	
	# and length - 1
	addi	$a1, $a1, -1

	# Make a function call
	# Sets value of $ra
	jal	max		# jump to max and save position to $ra
				# Will continue to execute from here later
	move	$s1, $v0
	# max_so_far = max(&a[1], length - 1);

	# if (first_element > max_so_far) {
	ble	$s0, $s1, end2	# if $s0 <= $s1 end2
	move	$s1, $s0
	
end2:
	move 	$v0, $s1	# return max_so_far

max_return:
	# epilogue
	# Load the values previously stored on the stack 
	lw	$ra, 8($sp)	# 
	lw	$s0, 4($sp)	# 
	lw	$s1, 0($sp)	# 
	
	# and reset the stack pointer
	addi	$sp, $sp, 12	# 4*3 = 12

	# jump to  $ra
	jr	$ra			# jump to $ra
	



# some test code which calls max
main:
	addi $sp, $sp, -4	   # create stack frame
	sw   $ra, 0($sp)	# save return address

	la   $a0, array
	li   $a1, 10
	jal   max		   # Replaces $ra with currentLine+1

	move  $a0, $v0	  # printf ("%d")
	li	$v0, 1
	syscall

	li   $a0, '\n'	  # printf("%c", '\n');
	li   $v0, 11
	syscall

				# clean up stack frame
	lw   $ra, 0($sp)	# restore $ra
	addi $sp, $sp, 4	# restore sp

	li  $v0, 0		  # return 0
	jr  $ra


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1