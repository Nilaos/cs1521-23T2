

#include <stdio.h>

int main(void)
{
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x < 46340)
        goto main__x_lt_46340;
main__x_ge_46340:
    // If we have reached this, then x is too big
    printf("square too big for 32 bits\n");
    goto main__x_lt_46340_end;
    //  else
main__x_lt_46340:
    y = x * x;
    printf("%d\n", y);
main__x_lt_46340_end:

    return 0;
}