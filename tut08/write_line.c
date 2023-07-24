
// FILE*
// stdin

#include <err.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

// Write to file
// File is command line arg
// read from stdin
int main(int argc, char const *argv[])
{
    // Do some error checking
    if (argc != 2)
    {
        fprintf(stderr, "Please input a file to write to!\n");
        return EXIT_FAILURE;
    }

    // w - truncate and let us write to the file
    FILE *fp = fopen(argv[1], "w");
    if (fp == NULL)
    {
        perror(argv[1]);
        return EXIT_FAILURE;
    }

    // fprintf()
    // fputc
    // fgetc
    char string[50];
    fgets(string, 50, stdin);

    fputs(string, fp);

    // remember to close!
    fclose(fp);

    return EXIT_SUCCESS;
}
