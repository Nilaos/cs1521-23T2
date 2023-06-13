// Squares a number, unless its square is too big for a 32-bit integer.
// If it is too big, prints an error message instead.
// Simplified C version.

#include <stdio.h>

#define SQUARE_MAX 46340

int main(void)
{
    int x, y;

    printf("Enter a number: ");
    scanf("%d", &x);

    if (x >= 46340)
    {
        // If we have reached this, then x is too big
        printf("square too big for 32 bits\n");
    }
    else
    {
        y = x * x;
        printf("%d\n", y);
    }

    return 0;
}