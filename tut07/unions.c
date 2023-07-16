// Example of how unions behave in C
// Note that since the data is stored in the same memory location,
// the data is shared - modifying one part modifies both.

#include <stdint.h>
#include <stdio.h>

union u_int_float {
    uint32_t i;
    float f;
};

union u_char_int {
    char c;
    int8_t i;
};

int main(void) {
    union u_int_float u_int_float;
    union u_char_int u_char_int;

    u_int_float.f = 1.0;
    printf("u_int_float: %d %f\n", u_int_float.i, u_int_float.f);
    u_int_float.i = 65535;
    printf("u_int_float: %d %f\n", u_int_float.i, u_int_float.f);

    u_char_int.c = 'a';
    printf("u_char_int: %c %d\n", u_char_int.c, u_char_int.i);
    u_char_int.i = 48;
    printf("u_char_int: %c %d\n", u_char_int.c, u_char_int.i);

    return 0;
}
