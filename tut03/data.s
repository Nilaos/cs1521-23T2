		
# A simple program to demonstrate the use of the data section
	
	.text

main:

	la	$t0, a_word		# load address of a into $t0
	lw	$t1, 0($t0)		# load word from 0($t0) into $t1

	la	$t2, b_space	# load address of b into $t2
	la	$t3, c_str		# load address of c into $t3
	la	$t4, d_bytes

	li	$t1, 42069		# $t1 = 42069
	sw	$t1, e_words	# store $t1 at e

	sb	$t1, f_space	# store $t1 at f

main__end:
	li	$v0, 0			# $v0 = 0
	jr	$ra				# goto $ra

	.data

a_word:		.word	42
b_space:	.space	4
c_str:		.asciiz	"abcde"
			.align	2
d_bytes: 	.byte	1, 2, 3, 4
e_words:		.word	1, 2, 3, 4
f_space:	.space	1