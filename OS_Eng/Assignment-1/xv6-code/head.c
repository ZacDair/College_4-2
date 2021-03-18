#include "types.h"
#include "stat.h"
#include "user.h"

char buf[512];

void
head(int fd, char *name)
{
  int i, n, j;
  int l;
  l = j = 0;
  char line [512];
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n && l < 10; i++){
      if(buf[i] == '\n'){
        line[j] = buf[i];
        line[j+1] = '\0';
        printf(1, line);
        j = 0;
        l++;
      }
      else{
       line[j] = buf[i];
       j++;
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
  int fd, i;

  if(argc <= 1){
    head(0, "");
    exit();
  }
  
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "head: cannot open %s\n", argv[i]);
      exit();
    }
    head(fd, argv[i]);
    close(fd);
  }
  exit();
}
