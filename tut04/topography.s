# A topographic map!
# This helpful tool will tell explorers how much they need to climb to
# reach various points of interest.
# 
# Given an array of points, `my_points`, it can look up individual cells
# in the 2D map and print their height. 

# Constants
MAP_SIZE = 5
N_POINTS = 4

POINT_SZ = 8
ROW_OFFT = 0
COL_OFFT = 4

.text

main:
        # Registers:
        #  - $t0: int i, the loop counter
        #  - $t1: row of the current point
        #  - $t2: col of the current point
        #  - $t3: height of the current point
        #  - $t4: temporary result for array indexing
        #  - $t5: temporary result for array indexing

                                        # Loop over all elements, and print their data
points_loop_init:                       # for (int i = 0; i < N_POINTS; i++) {
        li      $t0, 0                  # $t0 = 0

points_loop_cond:
        bge     $t0, N_POINTS, points_loop_end  # if (i >= N_POINTS)

                                        # TODO: Complete these three!
	# 1) Access the array of point structs
	# &elem[i] = start of the array + i * size of each element
	la	$t4,	my_points	# base address of array of structs
	mul	$t5,	$t0,	POINT_SZ	# Offset calculation
	add	$t4,	$t4,	$t5
                                        # int row = my_points[i].row;
	lw	$t1,	ROW_OFFT($t4)	# X offset + array index position
					# int col = my_points[i].col;
        lw	$t2,	COL_OFFT($t4)	# Y offset + array index position

	# 2) Load the height from the 2D array of integers
	# &elem[i] = start of the array + ...
	mul	$t4,	$t1,	MAP_SIZE	# row offset = row * row length
	mul	$t4,	$t4,	4	# Row offset * size of element (integer = 4)
	mul	$t5,	$t2,	4	# Col offset = col * size of element (int = 4)
	add	$t4,	$t4,	$t5	# Total offset = row offset + col offset
					# int height = topography_grid[row][col];
	lw	$t3, topography_grid($t4)	# load word from topography_grid($t4) into $t3

                                        # printf("Height at %d,%d=%d\n", row, col, height);

        li      $v0, 4                  # $v0 = 4 (print string)
        la      $a0, height_str         # load address of height_str into $a0
        syscall                         # print height_str

        li      $v0, 1                  # $v0 = 1 (print int)
        move    $a0, $t1                # $a0 = row
        syscall                         # print row

        li      $v0, 11                 # $v0 = 11 (print ASCII character)
        li      $a0, ','                # $a0 = ','
        syscall                         # print ','

        li      $v0, 1                  # $v0 = 1 (print int)
        move    $a0, $t2                # $a0 = col
        syscall                         # print col

        li      $v0, 11                 # $v0 = 11 (print ASCII character)
        li      $a0, '='                # $a0 = '='
        syscall                         # print '='

        li      $v0, 1                  # $v0 = 1 (print int)
        move    $a0, $t3                # $a0 = height
        syscall                         # print height

points_loop_iter:
        addi    $t0, $t0, 1             # i++
        b       points_loop_cond        # branch to points_loop_cond

points_loop_end:

        jr      $ra                     # return 0;

.data

# 2D grid representing the height data for an area.
topography_grid:
        .word   0, 1, 1, 2, 3 
        .word   1, 1, 2, 3, 4
        .word   1, 2, 3, 5, 7
        .word   3, 3, 4, 5, 6
        .word   3, 4, 5, 6, 7

# Points of interest to print heights for, as a 1D array of point2D_t structs.
# Note the memory layout of this array: each element requires 8 bytes, not 4.
my_points: 
        .word   1, 2 
        .word   2, 3
        .word   0, 0 
        .word   4, 4

height_str: .asciiz "Height at "