#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char buf[512];

void
cp(int fd, int fd1)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(fd1, buf, n) != n) {
      printf(1, "cp: write error\n");
      exit();
    }
  }
  if(n < 0){
    printf(1, "cp: read error\n");
    exit();
  }
}

int
main(int argc, char *argv[])
{
  int fd, fd1;
  
  // Exit if only one arg was given
  if(argc <= 1){
    exit();
  }
  
  // Open the first file - exit if an error occurs
  if((fd = open(argv[1], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[1]);
      exit();
  }
  
  // Open the second file - close the first file and exit if an error occurs
  if((fd1 = open(argv[2], O_CREATE|O_RDWR)) < 0){
      printf(1, "cat: cannot open %s\n", argv[2]);
      close(fd);
      exit();
  }

  // Run our CP function
  cp(fd, fd1);

  //Close files and exit
  close(fd);
  close(fd1);
  exit();
}
