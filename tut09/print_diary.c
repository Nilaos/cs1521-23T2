
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  char *diary_name = ".diary";
  char diary_path[FILENAME_MAX] = {'\0'};

  // TODO: Create diary_path

  FILE *filename = fopen(diary_path, "r");
  if (filename == NULL) {
    perror(diary_path);
    exit(1);
  }

  int c = fgetc(filename);
  while (c != EOF) {
    fprintf(stdout, "%c", c);
    // or fputc(stdout, c)
    c = fgetc(filename);
  }

  fclose(filename);
}
