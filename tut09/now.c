// Program that prints all we want to now about now!
// But it's lazy so it calls other programs

#include <errno.h>
#include <spawn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

// This gives us a way to access the 'raw' environment variables
// getenv(3) is safer, but this is needed for posix_spawn
extern char **environ;

void spawn_and_wait(char **args) {
  pid_t pid;
  int status;

  // TODO: Spawn the process
}

int main(int argc, char const *argv[]) {

  pid_t process_ids[5];
  int status[5];

  // Note: All these arrays of strings MUST be null-terminated!
  // This is because we aren't passing in their size, so posix_spawn has to work
  // it out
  char *date_args[] = {"/bin/date", "+%d-%m-%Y", NULL};
  char *time_args[] = {"/bin/date", "+%T", NULL};
  char *whoami_args[] = {"/usr/bin/whoami", NULL};
  char *hostname_args[] = {"/bin/hostname", "-f", NULL};
  char *realpath_args[] = {"/usr/bin/realpath", ".", NULL};

  spawn_and_wait(date_args);
  spawn_and_wait(time_args);
  spawn_and_wait(whoami_args);
  spawn_and_wait(hostname_args);
  spawn_and_wait(realpath_args);

  return 0;
}
