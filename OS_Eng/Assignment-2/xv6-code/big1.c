/* this code is a stand alone program that can be used to test your indirect block code. */

typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;
typedef uint pde_t;
struct sleeplock {
int dummy;
};
#include <stdio.h>
// On-disk file system format.
// Both the kernel and user programs use this header file.


#define ROOTINO 1  // root i-number
#define BSIZE 50  // block size

// Disk layout:
// [ boot block | super block | log | inode blocks |
//                                          free bit map | data blocks]
//
// mkfs computes the super block and builds an initial file system. The
// super block describes the disk layout:
struct superblock {
  uint size;         // Size of file system image (blocks)
  uint nblocks;      // Number of data blocks
  uint ninodes;      // Number of inodes.
  uint nlog;         // Number of log blocks
  uint logstart;     // Block number of first log block
  uint inodestart;   // Block number of first inode block
  uint bmapstart;    // Block number of first free map block
};

#define NDIRECT 11  // Num direct block pointers on an inode
#define NINDIRECT (BSIZE / sizeof(uint))  // Num 4byte pointers per block
#define MAXFILE (NDIRECT + NINDIRECT + NINDIRECT*NINDIRECT)  // Max num of blocks in a file

// On-disk inode structure.
struct dinode {
  short type;           // File type
  short major;          // Major device number (T_DEV only)
  short minor;          // Minor device number (T_DEV only)
  short nlink;          // Number of links to inode in file system
  uint size;            // Size of file (bytes)
  uint addrs[NDIRECT+2];   // Data block addresses
};

// Inodes per block.
#define IPB           (BSIZE / sizeof(struct dinode))

// Block containing inode i
#define IBLOCK(i, sb)     ((i) / IPB + sb.inodestart)

// Bitmap bits per block
#define BPB           (BSIZE*8)

// Block of free map containing bit for block b
#define BBLOCK(b, sb) (b/BPB + sb.bmapstart)

// Directory is a file containing a sequence of dirent structures.
#define DIRSIZ 14


// file.h



// in-memory copy of an inode
struct inode {
  uint dev;           // Device number
  uint inum;          // Inode number
  int ref;            // Reference count
  struct sleeplock lock; // protects everything below here
  int valid;          // inode has been read from disk?

  short type;         // copy of disk inode
  short major;
  short minor;
  short nlink;
  uint size;
  uint addrs[NDIRECT+1];
};

// table mapping major device number to
// device functions
struct devsw {
  int (*read)(struct inode*, char*, int);
  int (*write)(struct inode*, char*, int);
};

extern struct devsw devsw[];

#define CONSOLE 1


struct dirent {
  ushort inum;
  char name[DIRSIZ];
};



// buf.h
struct buf {
  int flags;
  uint dev;
  uint blockno;
  struct sleeplock lock;
  uint refcnt;
  struct buf *prev; // LRU cache list
  struct buf *next;
  struct buf *qnext; // disk queue
  uchar data[BSIZE];
};
#define B_VALID 0x2  // buffer has been read from disk
#define B_DIRTY 0x4  // buffer needs to be written to disk

uint min(int a,int b){ return a<b ? a:b;}

void memmove(char *src,char *dest,int n){
int i=0;
for (i=0;i<n;i++)
    *src++ = *dest++;
}

void panic(char *p){printf(p);}

void brelse( struct buf *bp){}
void  log_write(struct buf* bp){}
void iupdate(struct inode *ip){
}
uint next;

struct buf blocks[20000];

uint balloc(uint dev){
return next++;
}

struct buf * bread(uint dev , uint addr){
//printf("bread addr %d\n",addr);
if (addr ==-1) return (struct buf *)0;
return blocks+addr;
}

static int
bmap(struct inode *ip, uint bn)
{
  uint addr, *a;
  struct buf *bp;
printf("bmap %u\n",bn);
  // Direct block
  if(bn < NDIRECT){
printf("direct block bn is %d\n",bn);
    if((addr = ip->addrs[bn]) == 0)
      // Logical block not yet allocated
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }

  bn -= NDIRECT;

  // Indirect block
  if(bn < NINDIRECT){
printf("indirect block bn is %d\n",bn);
    if((addr = ip->addrs[NDIRECT]) == 0)
      // Indirect block itself not yet allocated
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);

    // Read+lock indirect block
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;

    if((addr = a[bn]) == 0){
      // Logical block not yet allocated
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
    return addr;
  }

  bn -= NINDIRECT;

  // Double-indirect block
  if (bn < NINDIRECT*NINDIRECT) {
printf("double indirect block\n");
    if((addr = ip->addrs[NDIRECT + 1]) == 0){
        //double-indirect block itself not yet allocated
        ip->addrs[NDIRECT + 1] = addr = balloc(ip->dev);
    }
    

        // Read+Lock double-indirect block
        bp = bread(ip->dev, addr);
        a = (uint*)bp->data;

    // load indirect block allocated if needed
    if((addr = a[bn/(NINDIRECT)]) == 0){
        a[(bn/NINDIRECT)] = addr = balloc(ip->dev);
        log_write(bp);
    }
    brelse(bp);
    // Read+Lock double-indirect block
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    
    if((addr = a[(bn%NINDIRECT)]) == 0){
        a[(bn%NINDIRECT)] = addr = balloc(ip->dev);
        log_write(bp);
    }
    
    brelse(bp);
    return addr;
  }


  panic("bmap: out of range");
  return -1;
}


int
readi(struct inode *ip, char *dst, uint off, uint n)
{
  uint tot, m;
  struct buf *bp;


  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    if (!(bp = bread(ip->dev, bmap(ip, off/BSIZE))))
       return -1;

    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
char ch=dst[10];
dst[10]=0;
//printf("readi loop tot=%d m %d off %d src %s\n",tot,m,off,dst);
dst[10]=ch;
fflush(stdout);
    brelse(bp);
  }
  return n;
}

int
writei(struct inode *ip, char *src, uint off, uint n)
{
  uint tot, m;
  struct buf *bp;

  
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    char ch = src[10];
    src[10]=0;

    if (!(bp = bread(ip->dev, bmap(ip, off/BSIZE)))) 
        return -1;

    m = min(n - tot, BSIZE - off%BSIZE);
//printf("writei loop tot=%d m %d off %d src %s\n",tot,m,off,src);
    src[10] =ch;
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){

    ip->size = off;
    iupdate(ip);
  }
  return n;
}
 struct inode i;
int main(int argc,char **argv)

{

    FILE *fp1;
    int bytes;
    char buffer[BSIZE];

setbuf(stdout, NULL);
   
    if ((fp1 = fopen(argv[1],"r")) == NULL)    

    {    

        printf("\nFile cannot be opened");

        return;

    }

    else     

    {

        printf("\nFile opened for copy...\n ");    

    }


    
    int off=0;
    while ( (bytes = fread(buffer, 1, sizeof(buffer), fp1))!=0){
//printf("main loop off 1 %d bytes = %d\n",off,bytes);
    		writei(&i, buffer, off, bytes);
         off += bytes;
        if (bytes<sizeof(buffer)) break;
//printf("main loop off2 %d bytes = %d\n",off,bytes);
	}
   
   int n=0;
   int size=0;
printf("ere\n");
   while (size<i.size){
      if ((n=readi(&i, buffer, size, sizeof(buffer))) ==-1)
         break;
      printf("-----\n");
      fwrite(buffer,1,n,stdout);
      size+=n;
   }
}

