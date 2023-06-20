
#include <stdio.h>

// Size of the matrix
#define MATRIX_ROWS 3
#define MATRIX_COLS 4

int M[3][4] = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}};

int main(int argc, char const *argv[]) {
    int mul;
    scanf("%d", &mul);

    for (int row = 0; row < MATRIX_ROWS; row++) {
        for (int col = 0; col < MATRIX_COLS; col++) {
            M[row][col] = M[row][col] * mul;
            printf("%d ", M[row][col]);
        }
        putchar('\n');
    }

    return 0;
}
