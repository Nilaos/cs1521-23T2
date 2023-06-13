# Squares a number, unless it is too big for a 32-bit register.
# If it is too big, prints an error message instead.

# Constant
SQUARE_MAX = 46340

main:                                   
        # Locals:
        # - $t0: int x, The number to square.
        # - $t1: int y, The result of the square.

        la      $a0, prompt_str          # printf("Enter a number: ");
        li      $v0, 4
        syscall

        li      $v0, 5                  # scanf("%d", x);
        syscall
        move    $t0, $v0

        ble     $t0, SQUARE_MAX, x_le_square_max        # if (x <= SQUARE_MAX) goto square;

        la      $a0, too_big_str         # printf("square too big for 32 bits\n");
        li      $v0, 4
        syscall

        j       epilogue                # goto epilogue;

x_le_square_max:
        mul     $t1, $t0, $t0           # y = x * x

        move    $a0, $t1                # printf("%d", y);
        li      $v0, 1
        syscall

        li      $a0, '\n'               # printf("%c", '\n');
        li      $v0, 11
        syscall
epilogue:
        jr      $ra                     # return from main

        .data
prompt_str:
        .asciiz "Enter a number: "
too_big_str:
        .asciiz "square too big for 32 bits\n"