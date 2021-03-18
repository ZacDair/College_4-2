#include "types.h"
#include "stat.h"
#include "user.h"

// From proc.h Proc Structure
// Per-process state
enum procstate{ UNUSED, EMBYRO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE};
char procstateNames[6][10] = {
    "UNUSED",
    "EMPRYO",
    "SLEEPING",
    "RUNNABLE",
    "RUNNING",
    "ZOMBIE",
};

struct uproc{
    int pid;
    int ppid;
    int state;
    uint sz;
    char name[16];
};

#define MAX_PROC 10
extern int getprocs(int, struct uproc[10]);
int main(int argc, char *argv[]){
    struct uproc ptable[MAX_PROC];
    //struct uproc *p;
    int numProc, i;

    numProc = getprocs(10, ptable);
    if(numProc == 0){
        printf(1, "Error getting ptable");
    }
    else{
        //Output the process details
        for(i = 0; i<numProc && ptable[i].state != 0; i++){
            printf(1, "PID= %d  PPID= %d  State= %s  Size= %d  Name= %s\n", ptable[i].pid, ptable[i].ppid, procstateNames[ptable[i].state], ptable[i].sz, ptable[i].name);
        }
    }
    printf(1, "Total Number of Processes: %d\n", numProc);
    exit();
}
