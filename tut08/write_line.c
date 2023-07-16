
// FILE*
// stdin

#include <err.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

// Write to file
// File is command line arg
// read from stdin
int main(int argc, char const *argv[]) {
    // Do some error checking
    if (argc < 2) {
        fprintf(stderr, "Not enough arguments!\n");
        return 1;
    }

    // get file path
    char *path = argv[1];

    FILE *output = fopen(path, "w");
    if (output == NULL) {
        perror("Unable to open file for writing");
        return 1;
    }

    // Write things to a file
    int ch = fgetc(stdin);
    while (ch != '\n' && ch != EOF) {
        fputc(ch, output);
        ch = fgetc(stdin);
    }

    // Now what else?
    // match fopens with fcloses
    fclose(output);

    return 0;
}
