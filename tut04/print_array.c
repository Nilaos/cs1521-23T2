#include <stdio.h>

int main(void) {
    // Data - this is an array of integers i.e. 32 bits each
    int numbers[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    // Counter
    int i;
    i = 0;
start_loop:
    if (i >= 10)
        goto end_loop;
    // while (i < 10) {

    // Syscall
    printf("%d\n", numbers[i]);

    i++;
    goto start_loop;

end_loop:
    // }
}