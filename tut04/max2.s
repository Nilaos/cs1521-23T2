# Recursive maximum of array function

# Register usage:
#   - `a' is in a0, address of start of array
#   - `length' is in a1, elements left in array
#   - `first_element' is in $t0
#   - `max_so_far' is in $t1


# if you use an $s you need to save and load it to preserve any value in it. 
# after a function call, assume that all $a, $t registers have no meaningful values

# int max(int a[], int length) {
max:
	# prologue
	

	# int first_element = a[0];
	lw	$t0, 0($a0)		# 

	bne	$a1, 1, max__recursive	# if $a1 != 1 then recurse
max__length_1:
	# BASE CASE
	# if (length == 1) {
	# return first_element;
	move 	$v0, $t0		# $v0 = first_element from $t0
	b	max__return

max__recursive:
	# // find max value in rest of array
	# int max_so_far = max(&a[1], length - 1);
	# a0 and a1 need to updated for the function call
	
	# &a[1] = &a[0] + sizeof(int)
	add	$a0, $a0, 4	# $a0 = $a0 + 4

	# length - 1
	add	$a1, $a1, -1	# $a1 = $a1 + -1

	# Before here: $ra is line 71
	jal	max				# jump to target and current save position to $ra, *replacing any value there*
	# After: $ra is line 42
	
	move	$t1, $v0	# max_so_far = function call result

	# if (first_element > max_so_far) {
	bgt	$t0, $t1, max__swap_max_so_far	# if $t0 > $t1 then target

	# else
	move	$v0, $t1
	b	max__return
	
max__swap_max_so_far:
	# max_so_far = first_element;
	move	$v0, $t0

max__return:
	# epilogue - MUST MATCH PROLOGUE
	# clean up stack frame


	jr	$ra



# some test code which calls max
main:
	addi	$sp, $sp, -4	# create stack frame
	sw	$ra, 0($sp)	# save return address

	la	$a0, array
	li	$a1, 10
	jal	max#

	move	$a0, $v0 # printf ("%d")
	li	$v0, 1
	syscall

	li	$a0, '\n' # printf("%c", '\n');
	li	$v0, 11
	syscall

		# clean up stack frame
	lw	$ra, 0($sp)	# restore $ra
	addi	$sp, $sp, 4	# restore sp

	li	$v0, 0 # return 0
	jr	$ra


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1
