#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
  int fd;
  
  // Exit if only one arg was given
  if(argc <= 1){
    exit();
  }
  
  unlink(argv[2]);

  // Open the first file - exit if an error occurs
  if((fd = open(argv[1], O_CREATE|O_RDWR)) < 0){
      printf(1, "mv: cannot open %s\n", argv[1]);
      exit();
  }

  // Run our CP function
  link(argv[1], argv[2]);
  unlink(argv[1]);

  //Close files and exit
  close(fd);
  exit();
}
