# A simple program that will read 10 numbers into an array

# Constant for the size of the array
# This is treated like a literal (i.e. you load it with `li`, not `la/lb/lw`) but is more 
# readable than a magic number
N_SIZE = 10

	.text

main:
	# Registers:
	# - $t0: int i, the loop counter (i.e. the index of the array)
	# - $t1: Temporary register for the scanned-in value to be stored in numbers[i]
	# - $t2: Base address of array
	# - $t3: Offset, in bytes, in the array (4*i)
	# - $t4: Address of numbers[i] - i.e. *numbers[i]

scan_loop_init:
	li      $t0, 0                  # i = 0

scan_loop_cond:
	bge     $t0, N_SIZE, scan_loop_end      # while (i < N_SIZE) {

	li      $v0, 5                  # scanf("%d", &numbers[i]);
	syscall                         # Stores the result in $v0
	move	$t1, $v0		# $t1 = $v0

	# TODO: calculate &(numbers[i]) and store the value in $v0 into it
	# Hint: Is there a simple formula to use here?
	# 1) Where does the array start?
	la	$t2,	numbers		# Find base address of start of array
	# 2) How far into the array is the element, in bytes?
	mul	$t3,	$t0,	4	# Calculate array offset as sizeof(elem) * i
	# 3) What does this make the address of that element?
	add	$t4,	$t3,	$t2	# Address of numbers[i] = base address + offset
	# 4) How can we store this into the array?
	sw	$t1,	($t4)		# Store a value into numbers[i], now we have the address
	
	sw	$t1,	numbers($t3)	# Alternative way, which does step 3 for you
					# 

					# Jump back to the loop condition
	addi    $t0, $t0, 1             # i++;
	j       scan_loop_cond          # }

scan_loop_end:
					# End of scan_loop

epilogue:
	jr      $ra                     # return

	.data

numbers:                                        # The array of numbers, initialised to 0
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0      # int numbers[10] = {0};