# sum 4 numbers using function calls
# note use of stack to save $ra in main
# and $ra $a0, $a1, $s0 in sum2
# for simplicity we are not using a frame pointer

main:
	# This is the old style - we can use begin, push and pop now!
	addi	$sp, $sp, -4	# move stack pointer down to make room
	sw	$ra, 0($sp)	# save $ra on $stack
	# This is equivalent to `push $ra`

	li	$a0, 11		# sum4(11, 13, 17, 19)
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4

	move	$a0, $v0	# printf("%d", z);
	li	$v0, 1
	syscall

	li	$a0, '\n'	# printf("%c", '\n');
	li	$v0, 11
	syscall

	lw	$ra, 0($sp)	# recover $ra from $stack
	addi	$sp, $sp, 4	# move stack pointer back up to what it was when main called

	li	$v0, 0	 	# return 0 from function main
	jr	$ra		# return from function main


# a,b,c,d are in $a0,$a1,$a2,$a3
# e is in $s0
# f is in $v0 (remporarily)
#
# we use $s0 for e because its value must survive a function call to sum4
# by convention we have to store $s0 original valueon the stack so
# we can restore it before sum4 returns
#
# note sum2 is simple function which changes only $v0
# we could simplify sum4 by relying on this
# but in general we don't do this
# we assume only registers $s0..$s7 survive function calls

sum4:

sum4_prologue:
	# Push/pops must be in reverse order!
	begin
	push	$ra			# push $ra to the stack
	# Since we used $s registers, we need to push/pop them!
	push	$s0			# push $s0 to the stack
	push	$s1			# push $s1 to the stack
	push	$s2			# push $s2 to the stack

sum4_body:

	# Move values to be kept into $s registers before calling the function
	move	$s1, $a2		# $s1 = $a2
	move	$s2, $a3		# $s2 = $s3

	# sum2(a0, a1)
	jal	sum2			# jump to sum2 and save position to $ra
	# < ---- next jr $ra will return here
	move	$s0, $v0		# $s0 = $v0

	move	$a0, $s1		# $a0 = $a2
	move	$a1, $s2		# $a1 = $a3

	# sum2(a0, a1)
	jal	sum2			# jump to sum2 and save position to $ra
	# <--- return here from the jr ra in the function

	add	$v0, $s0, $v0

sum4_epilogue:


	jr $ra


sum2:				# sum2 doesn't call other functions
				# so it doesn't need to save any registers

	add	$v0, $a0, $a1	# return argument + argument 2

	jr	$ra		#
