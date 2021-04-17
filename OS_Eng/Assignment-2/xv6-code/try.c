#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{

  trace(1);
  //int fd = open("README", 0);
  //fd = fd + 0;
  printf(1, "hello");
  trace(0);
  printf(1, "hWorld");
  exit();
}
