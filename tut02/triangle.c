// Prints a right - angled triangle of asterisks, 10 rows high.

#include <stdio.h>

int main(void)
{
// for (int i = 1; i <= 10; i++)
main__row_loop:
    int i = 1;
main__row_loop_cond:
    // while (i < 10)
    if (i >= 10)
        goto main__row_loop_end;
    // {

    // for (int j = 0; j < i; j++)
main__col_loop:
    int j = 0; // Initialiser
main__col_loop_cond:
    // while (j < i) // Condition
    if (j >= i)
        goto main__col_loop_end;
    // {
    printf("*");

    // Don't forget both inrement and the branch
    j++; // Increment
    goto main__col_loop_cond;
main__col_loop_end:
    // }        // end of the loop
    printf("\n");

    i++;
    goto main__row_loop_cond;
    // }
main__row_loop_end:
    return 0;
}