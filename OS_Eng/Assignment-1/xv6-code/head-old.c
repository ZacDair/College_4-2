#include "types.h"
#include "stat.h"
#include "user.h"

char buf[512];

void
head(int fd, char *name, int maxLines)
{
  int i, n;
  int l;
  printf(1, "%d\n", maxLines);
  l = 0;
  while(((n = read(fd, buf, sizeof(buf))) > 0)){
    printf(1, "%s", buf);
    for(i=0; i<n; i++){
      if (l == maxLines){
        printf(1, "\n");
        exit();
      }
      if(buf[i] == '\n'){
        l++;
      }
    }
  }
  if(n < 0){
    printf(1, "head: read error\n");
    exit();
  }
}

int
main(int argc, char *argv[])
{
  int fd, numlinesToRead, i;
  if(argc <= 1){
    head(0, "", 0);
    exit();
  }
  for(i = 1; i < argc; i++){
    if (argc == 2){
      numlinesToRead = 10;
    }
    else{
      numlinesToRead = 1;
    }
    if((fd = open(argv[1], 0)) < 0){
      printf(1, "head: cannot open %s\n", argv[1]);
      exit();
    }
    head(fd, argv[1], numlinesToRead);
    close(fd);
  }
  exit();
}
