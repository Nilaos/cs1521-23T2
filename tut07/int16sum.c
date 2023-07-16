#include <stdint.h>
#include <stdio.h>

int main(void) {
    // Note that each of these is only 2 bytes long!
    int16_t a, b, res;

    printf("Enter two integers: ");
    scanf("%hd %hd", &a, &b);

    res = a + b;

    printf("%hd + %hd = %d\n", a, b, res);

    return 0;
}
