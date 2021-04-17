
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc c0 b6 10 80       	mov    $0x8010b6c0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 20 2f 10 80       	mov    $0x80102f20,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb f4 b6 10 80       	mov    $0x8010b6f4,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 40 71 10 80       	push   $0x80107140
80100051:	68 c0 b6 10 80       	push   $0x8010b6c0
80100056:	e8 65 42 00 00       	call   801042c0 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 0c fe 10 80 bc 	movl   $0x8010fdbc,0x8010fe0c
80100062:	fd 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 10 fe 10 80 bc 	movl   $0x8010fdbc,0x8010fe10
8010006c:	fd 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fd 10 80       	mov    $0x8010fdbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 bc fd 10 80 	movl   $0x8010fdbc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 47 71 10 80       	push   $0x80107147
80100097:	50                   	push   %eax
80100098:	e8 f3 40 00 00       	call   80104190 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 10 fe 10 80       	mov    0x8010fe10,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 10 fe 10 80    	mov    %ebx,0x8010fe10

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d bc fd 10 80       	cmp    $0x8010fdbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 c0 b6 10 80       	push   $0x8010b6c0
801000e4:	e8 37 43 00 00       	call   80104420 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 10 fe 10 80    	mov    0x8010fe10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 0c fe 10 80    	mov    0x8010fe0c,%ebx
80100126:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b6 10 80       	push   $0x8010b6c0
80100162:	e8 69 43 00 00       	call   801044d0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 5e 40 00 00       	call   801041d0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 2d 20 00 00       	call   801021b0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 4e 71 10 80       	push   $0x8010714e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 bd 40 00 00       	call   80104270 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 e7 1f 00 00       	jmp    801021b0 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 5f 71 10 80       	push   $0x8010715f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 7c 40 00 00       	call   80104270 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 2c 40 00 00       	call   80104230 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 c0 b6 10 80 	movl   $0x8010b6c0,(%esp)
8010020b:	e8 10 42 00 00       	call   80104420 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 10 fe 10 80       	mov    0x8010fe10,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 bc fd 10 80 	movl   $0x8010fdbc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 10 fe 10 80       	mov    0x8010fe10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 10 fe 10 80    	mov    %ebx,0x8010fe10
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 c0 b6 10 80 	movl   $0x8010b6c0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 6f 42 00 00       	jmp    801044d0 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 66 71 10 80       	push   $0x80107166
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 8b 15 00 00       	call   80101810 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
8010028c:	e8 8f 41 00 00       	call   80104420 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 a0 00 11 80       	mov    0x801100a0,%eax
801002a6:	3b 05 a4 00 11 80    	cmp    0x801100a4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a6 10 80       	push   $0x8010a620
801002b8:	68 a0 00 11 80       	push   $0x801100a0
801002bd:	e8 5e 3b 00 00       	call   80103e20 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 a0 00 11 80       	mov    0x801100a0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 00 11 80    	cmp    0x801100a4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(myproc()->killed){
801002d2:	e8 99 35 00 00       	call   80103870 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a6 10 80       	push   $0x8010a620
801002e6:	e8 e5 41 00 00       	call   801044d0 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 3d 14 00 00       	call   80101730 <ilock>
        return -1;
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 00 11 80    	mov    %edx,0x801100a0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 00 11 80 	movsbl -0x7feeffe0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a6 10 80       	push   $0x8010a620
80100346:	e8 85 41 00 00       	call   801044d0 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 dd 13 00 00       	call   80101730 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 a0 00 11 80       	mov    %eax,0x801100a0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100379:	c7 05 54 a6 10 80 00 	movl   $0x0,0x8010a654
80100380:	00 00 00 
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100389:	e8 22 24 00 00       	call   801027b0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 6d 71 10 80       	push   $0x8010716d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 ff 7a 10 80 	movl   $0x80107aff,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 23 3f 00 00       	call   801042e0 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 81 71 10 80       	push   $0x80107181
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d9:	c7 05 58 a6 10 80 01 	movl   $0x1,0x8010a658
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a6 10 80    	mov    0x8010a658,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 d1 58 00 00       	call   80105cf0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 18 58 00 00       	call   80105cf0 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 0c 58 00 00       	call   80105cf0 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 00 58 00 00       	call   80105cf0 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 b7 40 00 00       	call   801045d0 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 f2 3f 00 00       	call   80104520 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 85 71 10 80       	push   $0x80107185
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 b0 71 10 80 	movzbl -0x7fef8e50(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 fc 11 00 00       	call   80101810 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
8010061b:	e8 00 3e 00 00       	call   80104420 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a6 10 80       	push   $0x8010a620
80100647:	e8 84 3e 00 00       	call   801044d0 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 db 10 00 00       	call   80101730 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a6 10 80       	mov    0x8010a654,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a6 10 80       	push   $0x8010a620
8010070d:	e8 be 3d 00 00       	call   801044d0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 98 71 10 80       	mov    $0x80107198,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a6 10 80       	push   $0x8010a620
801007c8:	e8 53 3c 00 00       	call   80104420 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 9f 71 10 80       	push   $0x8010719f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a6 10 80       	push   $0x8010a620
80100803:	e8 18 3c 00 00       	call   80104420 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 a8 00 11 80       	mov    0x801100a8,%eax
80100836:	3b 05 a4 00 11 80    	cmp    0x801100a4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 00 11 80       	mov    %eax,0x801100a8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a6 10 80       	push   $0x8010a620
80100868:	e8 63 3c 00 00       	call   801044d0 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 00 11 80       	mov    0x801100a8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 00 11 80    	sub    0x801100a0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 a8 00 11 80    	mov    %edx,0x801100a8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 00 11 80    	mov    %cl,-0x7feeffe0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 00 11 80       	mov    0x801100a0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 00 11 80    	cmp    %eax,0x801100a8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 a4 00 11 80       	mov    %eax,0x801100a4
          wakeup(&input.r);
801008f1:	68 a0 00 11 80       	push   $0x801100a0
801008f6:	e8 e5 36 00 00       	call   80103fe0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 a8 00 11 80       	mov    0x801100a8,%eax
8010090d:	39 05 a4 00 11 80    	cmp    %eax,0x801100a4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 a8 00 11 80       	mov    %eax,0x801100a8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 a8 00 11 80       	mov    0x801100a8,%eax
80100934:	3b 05 a4 00 11 80    	cmp    0x801100a4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 20 00 11 80 0a 	cmpb   $0xa,-0x7feeffe0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 54 37 00 00       	jmp    801040d0 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 20 00 11 80 0a 	movb   $0xa,-0x7feeffe0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 00 11 80       	mov    0x801100a8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 a8 71 10 80       	push   $0x801071a8
801009ab:	68 20 a6 10 80       	push   $0x8010a620
801009b0:	e8 0b 39 00 00       	call   801042c0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bb:	c7 05 6c 0a 11 80 00 	movl   $0x80100600,0x80110a6c
801009c2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c5:	c7 05 68 0a 11 80 70 	movl   $0x80100270,0x80110a68
801009cc:	02 10 80 
  cons.locking = 1;
801009cf:	c7 05 54 a6 10 80 01 	movl   $0x1,0x8010a654
801009d6:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801009d9:	e8 82 19 00 00       	call   80102360 <ioapicenable>
}
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009fc:	e8 6f 2e 00 00       	call   80103870 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a07:	e8 04 22 00 00       	call   80102c10 <begin_op>

  if((ip = namei(path)) == 0){
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 69 15 00 00       	call   80101f80 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 9c 01 00 00    	je     80100bbe <exec+0x1ce>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 03 0d 00 00       	call   80101730 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 d2 0f 00 00       	call   80101a10 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 71 0f 00 00       	call   801019c0 <iunlockput>
    end_op();
80100a4f:	e8 2c 22 00 00       	call   80102c80 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a74:	e8 07 64 00 00       	call   80106e80 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 43 0f 00 00       	call   80101a10 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
      continue;
    if(ph.memsz < ph.filesz)
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 c7 61 00 00       	call   80106cd0 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 d1 60 00 00       	call   80106c10 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 a2 62 00 00       	call   80106e00 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 51 0e 00 00       	call   801019c0 <iunlockput>
  end_op();
80100b6f:	e8 0c 21 00 00       	call   80102c80 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b7a:	83 c4 0c             	add    $0xc,%esp
  end_op();
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b7d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b87:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b8d:	52                   	push   %edx
80100b8e:	50                   	push   %eax
80100b8f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b95:	e8 36 61 00 00       	call   80106cd0 <allocuvm>
80100b9a:	83 c4 10             	add    $0x10,%esp
80100b9d:	85 c0                	test   %eax,%eax
80100b9f:	89 c6                	mov    %eax,%esi
80100ba1:	75 3a                	jne    80100bdd <exec+0x1ed>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100ba3:	83 ec 0c             	sub    $0xc,%esp
80100ba6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bac:	e8 4f 62 00 00       	call   80106e00 <freevm>
80100bb1:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb9:	e9 9e fe ff ff       	jmp    80100a5c <exec+0x6c>
  struct proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bbe:	e8 bd 20 00 00       	call   80102c80 <end_op>
    cprintf("exec: fail\n");
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 c1 71 10 80       	push   $0x801071c1
80100bcb:	e8 90 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100bd0:	83 c4 10             	add    $0x10,%esp
80100bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd8:	e9 7f fe ff ff       	jmp    80100a5c <exec+0x6c>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bdd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100be3:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100be6:	31 ff                	xor    %edi,%edi
80100be8:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bea:	50                   	push   %eax
80100beb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf1:	e8 2a 63 00 00       	call   80106f20 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bf9:	83 c4 10             	add    $0x10,%esp
80100bfc:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c02:	8b 00                	mov    (%eax),%eax
80100c04:	85 c0                	test   %eax,%eax
80100c06:	74 79                	je     80100c81 <exec+0x291>
80100c08:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c0e:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c14:	eb 13                	jmp    80100c29 <exec+0x239>
80100c16:	8d 76 00             	lea    0x0(%esi),%esi
80100c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(argc >= MAXARG)
80100c20:	83 ff 20             	cmp    $0x20,%edi
80100c23:	0f 84 7a ff ff ff    	je     80100ba3 <exec+0x1b3>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c29:	83 ec 0c             	sub    $0xc,%esp
80100c2c:	50                   	push   %eax
80100c2d:	e8 2e 3b 00 00       	call   80104760 <strlen>
80100c32:	f7 d0                	not    %eax
80100c34:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c36:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c39:	5a                   	pop    %edx

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c3a:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c3d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c40:	e8 1b 3b 00 00       	call   80104760 <strlen>
80100c45:	83 c0 01             	add    $0x1,%eax
80100c48:	50                   	push   %eax
80100c49:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4f:	53                   	push   %ebx
80100c50:	56                   	push   %esi
80100c51:	e8 3a 64 00 00       	call   80107090 <copyout>
80100c56:	83 c4 20             	add    $0x20,%esp
80100c59:	85 c0                	test   %eax,%eax
80100c5b:	0f 88 42 ff ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c61:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c64:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c6b:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c6e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c74:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c77:	85 c0                	test   %eax,%eax
80100c79:	75 a5                	jne    80100c20 <exec+0x230>
80100c7b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c81:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c88:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c8a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c91:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c95:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c9c:	ff ff ff 
  ustack[1] = argc;
80100c9f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca5:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100ca7:	83 c0 0c             	add    $0xc,%eax
80100caa:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cac:	50                   	push   %eax
80100cad:	52                   	push   %edx
80100cae:	53                   	push   %ebx
80100caf:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cb5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cbb:	e8 d0 63 00 00       	call   80107090 <copyout>
80100cc0:	83 c4 10             	add    $0x10,%esp
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	0f 88 d8 fe ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cce:	0f b6 10             	movzbl (%eax),%edx
80100cd1:	84 d2                	test   %dl,%dl
80100cd3:	74 19                	je     80100cee <exec+0x2fe>
80100cd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cd8:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100cdb:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cde:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100ce1:	0f 44 c8             	cmove  %eax,%ecx
80100ce4:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ce7:	84 d2                	test   %dl,%dl
80100ce9:	75 f0                	jne    80100cdb <exec+0x2eb>
80100ceb:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cee:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cf4:	50                   	push   %eax
80100cf5:	6a 10                	push   $0x10
80100cf7:	ff 75 08             	pushl  0x8(%ebp)
80100cfa:	89 f8                	mov    %edi,%eax
80100cfc:	83 c0 6c             	add    $0x6c,%eax
80100cff:	50                   	push   %eax
80100d00:	e8 1b 3a 00 00       	call   80104720 <safestrcpy>

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d05:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100d0b:	89 f8                	mov    %edi,%eax
80100d0d:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->pgdir = pgdir;
  curproc->sz = sz;
80100d10:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d12:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
80100d15:	89 c1                	mov    %eax,%ecx
80100d17:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d1d:	8b 40 18             	mov    0x18(%eax),%eax
80100d20:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d23:	8b 41 18             	mov    0x18(%ecx),%eax
80100d26:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d29:	89 0c 24             	mov    %ecx,(%esp)
80100d2c:	e8 4f 5d 00 00       	call   80106a80 <switchuvm>
  freevm(oldpgdir);
80100d31:	89 3c 24             	mov    %edi,(%esp)
80100d34:	e8 c7 60 00 00       	call   80106e00 <freevm>
  return 0;
80100d39:	83 c4 10             	add    $0x10,%esp
80100d3c:	31 c0                	xor    %eax,%eax
80100d3e:	e9 19 fd ff ff       	jmp    80100a5c <exec+0x6c>
80100d43:	66 90                	xchg   %ax,%ax
80100d45:	66 90                	xchg   %ax,%ax
80100d47:	66 90                	xchg   %ax,%ax
80100d49:	66 90                	xchg   %ax,%ax
80100d4b:	66 90                	xchg   %ax,%ax
80100d4d:	66 90                	xchg   %ax,%ax
80100d4f:	90                   	nop

80100d50 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d56:	68 cd 71 10 80       	push   $0x801071cd
80100d5b:	68 c0 00 11 80       	push   $0x801100c0
80100d60:	e8 5b 35 00 00       	call   801042c0 <initlock>
}
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	c9                   	leave  
80100d69:	c3                   	ret    
80100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d70 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d74:	bb f4 00 11 80       	mov    $0x801100f4,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d79:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d7c:	68 c0 00 11 80       	push   $0x801100c0
80100d81:	e8 9a 36 00 00       	call   80104420 <acquire>
80100d86:	83 c4 10             	add    $0x10,%esp
80100d89:	eb 10                	jmp    80100d9b <filealloc+0x2b>
80100d8b:	90                   	nop
80100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 54 0a 11 80    	cmp    $0x80110a54,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
    if(f->ref == 0){
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100da2:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100da5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dac:	68 c0 00 11 80       	push   $0x801100c0
80100db1:	e8 1a 37 00 00       	call   801044d0 <release>
      return f;
80100db6:	89 d8                	mov    %ebx,%eax
80100db8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dbe:	c9                   	leave  
80100dbf:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100dc0:	83 ec 0c             	sub    $0xc,%esp
80100dc3:	68 c0 00 11 80       	push   $0x801100c0
80100dc8:	e8 03 37 00 00       	call   801044d0 <release>
  return 0;
80100dcd:	83 c4 10             	add    $0x10,%esp
80100dd0:	31 c0                	xor    %eax,%eax
}
80100dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dd5:	c9                   	leave  
80100dd6:	c3                   	ret    
80100dd7:	89 f6                	mov    %esi,%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 10             	sub    $0x10,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dea:	68 c0 00 11 80       	push   $0x801100c0
80100def:	e8 2c 36 00 00       	call   80104420 <acquire>
  if(f->ref < 1)
80100df4:	8b 43 04             	mov    0x4(%ebx),%eax
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	85 c0                	test   %eax,%eax
80100dfc:	7e 1a                	jle    80100e18 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100dfe:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e01:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100e04:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e07:	68 c0 00 11 80       	push   $0x801100c0
80100e0c:	e8 bf 36 00 00       	call   801044d0 <release>
  return f;
}
80100e11:	89 d8                	mov    %ebx,%eax
80100e13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e16:	c9                   	leave  
80100e17:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 d4 71 10 80       	push   $0x801071d4
80100e20:	e8 4b f5 ff ff       	call   80100370 <panic>
80100e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 28             	sub    $0x28,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e3c:	68 c0 00 11 80       	push   $0x801100c0
80100e41:	e8 da 35 00 00       	call   80104420 <acquire>
  if(f->ref < 1)
80100e46:	8b 47 04             	mov    0x4(%edi),%eax
80100e49:	83 c4 10             	add    $0x10,%esp
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	0f 8e 9b 00 00 00    	jle    80100eef <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e54:	83 e8 01             	sub    $0x1,%eax
80100e57:	85 c0                	test   %eax,%eax
80100e59:	89 47 04             	mov    %eax,0x4(%edi)
80100e5c:	74 1a                	je     80100e78 <fileclose+0x48>
    release(&ftable.lock);
80100e5e:	c7 45 08 c0 00 11 80 	movl   $0x801100c0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e68:	5b                   	pop    %ebx
80100e69:	5e                   	pop    %esi
80100e6a:	5f                   	pop    %edi
80100e6b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e6c:	e9 5f 36 00 00       	jmp    801044d0 <release>
80100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e78:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e7c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e7e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e81:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e84:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e8a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e8d:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e90:	68 c0 00 11 80       	push   $0x801100c0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e95:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e98:	e8 33 36 00 00       	call   801044d0 <release>

  if(ff.type == FD_PIPE)
80100e9d:	83 c4 10             	add    $0x10,%esp
80100ea0:	83 fb 01             	cmp    $0x1,%ebx
80100ea3:	74 13                	je     80100eb8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100ea5:	83 fb 02             	cmp    $0x2,%ebx
80100ea8:	74 26                	je     80100ed0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ead:	5b                   	pop    %ebx
80100eae:	5e                   	pop    %esi
80100eaf:	5f                   	pop    %edi
80100eb0:	5d                   	pop    %ebp
80100eb1:	c3                   	ret    
80100eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100eb8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ebc:	83 ec 08             	sub    $0x8,%esp
80100ebf:	53                   	push   %ebx
80100ec0:	56                   	push   %esi
80100ec1:	e8 ea 24 00 00       	call   801033b0 <pipeclose>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb df                	jmp    80100eaa <fileclose+0x7a>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ed0:	e8 3b 1d 00 00       	call   80102c10 <begin_op>
    iput(ff.ip);
80100ed5:	83 ec 0c             	sub    $0xc,%esp
80100ed8:	ff 75 e0             	pushl  -0x20(%ebp)
80100edb:	e8 80 09 00 00       	call   80101860 <iput>
    end_op();
80100ee0:	83 c4 10             	add    $0x10,%esp
  }
}
80100ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee6:	5b                   	pop    %ebx
80100ee7:	5e                   	pop    %esi
80100ee8:	5f                   	pop    %edi
80100ee9:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100eea:	e9 91 1d 00 00       	jmp    80102c80 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	68 dc 71 10 80       	push   $0x801071dc
80100ef7:	e8 74 f4 ff ff       	call   80100370 <panic>
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f00 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f00:	55                   	push   %ebp
80100f01:	89 e5                	mov    %esp,%ebp
80100f03:	53                   	push   %ebx
80100f04:	83 ec 04             	sub    $0x4,%esp
80100f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f0a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0d:	75 31                	jne    80100f40 <filestat+0x40>
    ilock(f->ip);
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	ff 73 10             	pushl  0x10(%ebx)
80100f15:	e8 16 08 00 00       	call   80101730 <ilock>
    stati(f->ip, st);
80100f1a:	58                   	pop    %eax
80100f1b:	5a                   	pop    %edx
80100f1c:	ff 75 0c             	pushl  0xc(%ebp)
80100f1f:	ff 73 10             	pushl  0x10(%ebx)
80100f22:	e8 b9 0a 00 00       	call   801019e0 <stati>
    iunlock(f->ip);
80100f27:	59                   	pop    %ecx
80100f28:	ff 73 10             	pushl  0x10(%ebx)
80100f2b:	e8 e0 08 00 00       	call   80101810 <iunlock>
    return 0;
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f50 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	57                   	push   %edi
80100f54:	56                   	push   %esi
80100f55:	53                   	push   %ebx
80100f56:	83 ec 0c             	sub    $0xc,%esp
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f5f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f62:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f66:	74 60                	je     80100fc8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f68:	8b 03                	mov    (%ebx),%eax
80100f6a:	83 f8 01             	cmp    $0x1,%eax
80100f6d:	74 41                	je     80100fb0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f6f:	83 f8 02             	cmp    $0x2,%eax
80100f72:	75 5b                	jne    80100fcf <fileread+0x7f>
    ilock(f->ip);
80100f74:	83 ec 0c             	sub    $0xc,%esp
80100f77:	ff 73 10             	pushl  0x10(%ebx)
80100f7a:	e8 b1 07 00 00       	call   80101730 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f7f:	57                   	push   %edi
80100f80:	ff 73 14             	pushl  0x14(%ebx)
80100f83:	56                   	push   %esi
80100f84:	ff 73 10             	pushl  0x10(%ebx)
80100f87:	e8 84 0a 00 00       	call   80101a10 <readi>
80100f8c:	83 c4 20             	add    $0x20,%esp
80100f8f:	85 c0                	test   %eax,%eax
80100f91:	89 c6                	mov    %eax,%esi
80100f93:	7e 03                	jle    80100f98 <fileread+0x48>
      f->off += r;
80100f95:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f98:	83 ec 0c             	sub    $0xc,%esp
80100f9b:	ff 73 10             	pushl  0x10(%ebx)
80100f9e:	e8 6d 08 00 00       	call   80101810 <iunlock>
    return r;
80100fa3:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100fa6:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fab:	5b                   	pop    %ebx
80100fac:	5e                   	pop    %esi
80100fad:	5f                   	pop    %edi
80100fae:	5d                   	pop    %ebp
80100faf:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fb0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fb3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	5b                   	pop    %ebx
80100fba:	5e                   	pop    %esi
80100fbb:	5f                   	pop    %edi
80100fbc:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fbd:	e9 8e 25 00 00       	jmp    80103550 <piperead>
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fcd:	eb d9                	jmp    80100fa8 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fcf:	83 ec 0c             	sub    $0xc,%esp
80100fd2:	68 e6 71 10 80       	push   $0x801071e6
80100fd7:	e8 94 f3 ff ff       	call   80100370 <panic>
80100fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fe0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 1c             	sub    $0x1c,%esp
80100fe9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fec:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100ffc:	0f 84 aa 00 00 00    	je     801010ac <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101002:	8b 06                	mov    (%esi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d8 00 00 00    	jne    801010ee <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 ff                	xor    %edi,%edi
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 34                	jg     80101053 <filewrite+0x73>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101028:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010102b:	83 ec 0c             	sub    $0xc,%esp
8010102e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101031:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101034:	e8 d7 07 00 00       	call   80101810 <iunlock>
      end_op();
80101039:	e8 42 1c 00 00       	call   80102c80 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101041:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101044:	39 d8                	cmp    %ebx,%eax
80101046:	0f 85 95 00 00 00    	jne    801010e1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010104c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010104e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101051:	7e 6d                	jle    801010c0 <filewrite+0xe0>
      int n1 = n - i;
80101053:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101056:	b8 00 06 00 00       	mov    $0x600,%eax
8010105b:	29 fb                	sub    %edi,%ebx
8010105d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101063:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101066:	e8 a5 1b 00 00       	call   80102c10 <begin_op>
      ilock(f->ip);
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	e8 ba 06 00 00       	call   80101730 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101076:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101079:	53                   	push   %ebx
8010107a:	ff 76 14             	pushl  0x14(%esi)
8010107d:	01 f8                	add    %edi,%eax
8010107f:	50                   	push   %eax
80101080:	ff 76 10             	pushl  0x10(%esi)
80101083:	e8 88 0a 00 00       	call   80101b10 <writei>
80101088:	83 c4 20             	add    $0x20,%esp
8010108b:	85 c0                	test   %eax,%eax
8010108d:	7f 99                	jg     80101028 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
8010108f:	83 ec 0c             	sub    $0xc,%esp
80101092:	ff 76 10             	pushl  0x10(%esi)
80101095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101098:	e8 73 07 00 00       	call   80101810 <iunlock>
      end_op();
8010109d:	e8 de 1b 00 00       	call   80102c80 <end_op>

      if(r < 0)
801010a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a5:	83 c4 10             	add    $0x10,%esp
801010a8:	85 c0                	test   %eax,%eax
801010aa:	74 98                	je     80101044 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
801010b8:	c3                   	ret    
801010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010c3:	75 e7                	jne    801010ac <filewrite+0xcc>
  }
  panic("filewrite");
}
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	89 f8                	mov    %edi,%eax
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010cf:	8b 46 0c             	mov    0xc(%esi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010dc:	e9 6f 23 00 00       	jmp    80103450 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010e1:	83 ec 0c             	sub    $0xc,%esp
801010e4:	68 ef 71 10 80       	push   $0x801071ef
801010e9:	e8 82 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010ee:	83 ec 0c             	sub    $0xc,%esp
801010f1:	68 f5 71 10 80       	push   $0x801071f5
801010f6:	e8 75 f2 ff ff       	call   80100370 <panic>
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	56                   	push   %esi
80101104:	53                   	push   %ebx
80101105:	89 d3                	mov    %edx,%ebx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101107:	c1 ea 0c             	shr    $0xc,%edx
8010110a:	03 15 d8 0a 11 80    	add    0x80110ad8,%edx
80101110:	83 ec 08             	sub    $0x8,%esp
80101113:	52                   	push   %edx
80101114:	50                   	push   %eax
80101115:	e8 b6 ef ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010111a:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010111c:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101122:	ba 01 00 00 00       	mov    $0x1,%edx
80101127:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010112a:	c1 fb 03             	sar    $0x3,%ebx
8010112d:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101130:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101132:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101137:	85 d1                	test   %edx,%ecx
80101139:	74 27                	je     80101162 <bfree+0x62>
8010113b:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010113d:	f7 d2                	not    %edx
8010113f:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101141:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101144:	21 d0                	and    %edx,%eax
80101146:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010114a:	56                   	push   %esi
8010114b:	e8 a0 1c 00 00       	call   80102df0 <log_write>
  brelse(bp);
80101150:	89 34 24             	mov    %esi,(%esp)
80101153:	e8 88 f0 ff ff       	call   801001e0 <brelse>
}
80101158:	83 c4 10             	add    $0x10,%esp
8010115b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010115e:	5b                   	pop    %ebx
8010115f:	5e                   	pop    %esi
80101160:	5d                   	pop    %ebp
80101161:	c3                   	ret    

  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101162:	83 ec 0c             	sub    $0xc,%esp
80101165:	68 ff 71 10 80       	push   $0x801071ff
8010116a:	e8 01 f2 ff ff       	call   80100370 <panic>
8010116f:	90                   	nop

80101170 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101170:	55                   	push   %ebp
80101171:	89 e5                	mov    %esp,%ebp
80101173:	57                   	push   %edi
80101174:	56                   	push   %esi
80101175:	53                   	push   %ebx
80101176:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101179:	8b 0d c0 0a 11 80    	mov    0x80110ac0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010117f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101182:	85 c9                	test   %ecx,%ecx
80101184:	0f 84 85 00 00 00    	je     8010120f <balloc+0x9f>
8010118a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101191:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101194:	83 ec 08             	sub    $0x8,%esp
80101197:	89 f0                	mov    %esi,%eax
80101199:	c1 f8 0c             	sar    $0xc,%eax
8010119c:	03 05 d8 0a 11 80    	add    0x80110ad8,%eax
801011a2:	50                   	push   %eax
801011a3:	ff 75 d8             	pushl  -0x28(%ebp)
801011a6:	e8 25 ef ff ff       	call   801000d0 <bread>
801011ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801011ae:	a1 c0 0a 11 80       	mov    0x80110ac0,%eax
801011b3:	83 c4 10             	add    $0x10,%esp
801011b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011b9:	31 c0                	xor    %eax,%eax
801011bb:	eb 2d                	jmp    801011ea <balloc+0x7a>
801011bd:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
801011c0:	89 c1                	mov    %eax,%ecx
801011c2:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801011c7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
801011ca:	83 e1 07             	and    $0x7,%ecx
801011cd:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801011cf:	89 c1                	mov    %eax,%ecx
801011d1:	c1 f9 03             	sar    $0x3,%ecx
801011d4:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
801011d9:	85 d7                	test   %edx,%edi
801011db:	74 43                	je     80101220 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011dd:	83 c0 01             	add    $0x1,%eax
801011e0:	83 c6 01             	add    $0x1,%esi
801011e3:	3d 00 10 00 00       	cmp    $0x1000,%eax
801011e8:	74 05                	je     801011ef <balloc+0x7f>
801011ea:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801011ed:	72 d1                	jb     801011c0 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
801011ef:	83 ec 0c             	sub    $0xc,%esp
801011f2:	ff 75 e4             	pushl  -0x1c(%ebp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801011fa:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101201:	83 c4 10             	add    $0x10,%esp
80101204:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101207:	39 05 c0 0a 11 80    	cmp    %eax,0x80110ac0
8010120d:	77 82                	ja     80101191 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
8010120f:	83 ec 0c             	sub    $0xc,%esp
80101212:	68 12 72 10 80       	push   $0x80107212
80101217:	e8 54 f1 ff ff       	call   80100370 <panic>
8010121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
80101220:	09 fa                	or     %edi,%edx
80101222:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
80101225:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
80101228:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
8010122c:	57                   	push   %edi
8010122d:	e8 be 1b 00 00       	call   80102df0 <log_write>
        brelse(bp);
80101232:	89 3c 24             	mov    %edi,(%esp)
80101235:	e8 a6 ef ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
8010123a:	58                   	pop    %eax
8010123b:	5a                   	pop    %edx
8010123c:	56                   	push   %esi
8010123d:	ff 75 d8             	pushl  -0x28(%ebp)
80101240:	e8 8b ee ff ff       	call   801000d0 <bread>
80101245:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
80101247:	8d 40 5c             	lea    0x5c(%eax),%eax
8010124a:	83 c4 0c             	add    $0xc,%esp
8010124d:	68 00 02 00 00       	push   $0x200
80101252:	6a 00                	push   $0x0
80101254:	50                   	push   %eax
80101255:	e8 c6 32 00 00       	call   80104520 <memset>
  log_write(bp);
8010125a:	89 1c 24             	mov    %ebx,(%esp)
8010125d:	e8 8e 1b 00 00       	call   80102df0 <log_write>
  brelse(bp);
80101262:	89 1c 24             	mov    %ebx,(%esp)
80101265:	e8 76 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
8010126a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010126d:	89 f0                	mov    %esi,%eax
8010126f:	5b                   	pop    %ebx
80101270:	5e                   	pop    %esi
80101271:	5f                   	pop    %edi
80101272:	5d                   	pop    %ebp
80101273:	c3                   	ret    
80101274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010127a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101280 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101280:	55                   	push   %ebp
80101281:	89 e5                	mov    %esp,%ebp
80101283:	57                   	push   %edi
80101284:	56                   	push   %esi
80101285:	53                   	push   %ebx
80101286:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101288:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010128a:	bb 14 0b 11 80       	mov    $0x80110b14,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010128f:	83 ec 28             	sub    $0x28,%esp
80101292:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101295:	68 e0 0a 11 80       	push   $0x80110ae0
8010129a:	e8 81 31 00 00       	call   80104420 <acquire>
8010129f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012a2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012a5:	eb 1b                	jmp    801012c2 <iget+0x42>
801012a7:	89 f6                	mov    %esi,%esi
801012a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801012b0:	85 f6                	test   %esi,%esi
801012b2:	74 44                	je     801012f8 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012b4:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
801012ba:	81 fb 6c 26 11 80    	cmp    $0x8011266c,%ebx
801012c0:	74 4e                	je     80101310 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801012c2:	8b 4b 08             	mov    0x8(%ebx),%ecx
801012c5:	85 c9                	test   %ecx,%ecx
801012c7:	7e e7                	jle    801012b0 <iget+0x30>
801012c9:	39 3b                	cmp    %edi,(%ebx)
801012cb:	75 e3                	jne    801012b0 <iget+0x30>
801012cd:	39 53 04             	cmp    %edx,0x4(%ebx)
801012d0:	75 de                	jne    801012b0 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
801012d2:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
801012d5:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
801012d8:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
801012da:	68 e0 0a 11 80       	push   $0x80110ae0

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
801012df:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
801012e2:	e8 e9 31 00 00       	call   801044d0 <release>
      return ip;
801012e7:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
801012ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ed:	89 f0                	mov    %esi,%eax
801012ef:	5b                   	pop    %ebx
801012f0:	5e                   	pop    %esi
801012f1:	5f                   	pop    %edi
801012f2:	5d                   	pop    %ebp
801012f3:	c3                   	ret    
801012f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801012f8:	85 c9                	test   %ecx,%ecx
801012fa:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012fd:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
80101303:	81 fb 6c 26 11 80    	cmp    $0x8011266c,%ebx
80101309:	75 b7                	jne    801012c2 <iget+0x42>
8010130b:	90                   	nop
8010130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101310:	85 f6                	test   %esi,%esi
80101312:	74 2d                	je     80101341 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
80101314:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101317:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101319:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010131c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101323:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010132a:	68 e0 0a 11 80       	push   $0x80110ae0
8010132f:	e8 9c 31 00 00       	call   801044d0 <release>

  return ip;
80101334:	83 c4 10             	add    $0x10,%esp
}
80101337:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133a:	89 f0                	mov    %esi,%eax
8010133c:	5b                   	pop    %ebx
8010133d:	5e                   	pop    %esi
8010133e:	5f                   	pop    %edi
8010133f:	5d                   	pop    %ebp
80101340:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
80101341:	83 ec 0c             	sub    $0xc,%esp
80101344:	68 28 72 10 80       	push   $0x80107228
80101349:	e8 22 f0 ff ff       	call   80100370 <panic>
8010134e:	66 90                	xchg   %ax,%ax

80101350 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101350:	55                   	push   %ebp
80101351:	89 e5                	mov    %esp,%ebp
80101353:	57                   	push   %edi
80101354:	56                   	push   %esi
80101355:	53                   	push   %ebx
80101356:	89 c6                	mov    %eax,%esi
80101358:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  
  if(bn < NDIRECT){
8010135b:	83 fa 0a             	cmp    $0xa,%edx
8010135e:	77 20                	ja     80101380 <bmap+0x30>
80101360:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
80101363:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101366:	85 c0                	test   %eax,%eax
80101368:	0f 84 fa 00 00 00    	je     80101468 <bmap+0x118>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010136e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101371:	5b                   	pop    %ebx
80101372:	5e                   	pop    %esi
80101373:	5f                   	pop    %edi
80101374:	5d                   	pop    %ebp
80101375:	c3                   	ret    
80101376:	8d 76 00             	lea    0x0(%esi),%esi
80101379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101380:	8d 5a f5             	lea    -0xb(%edx),%ebx

  if(bn < NINDIRECT){
80101383:	83 fb 7f             	cmp    $0x7f,%ebx
80101386:	0f 86 84 00 00 00    	jbe    80101410 <bmap+0xc0>
      log_write(bp);
    }
    brelse(bp);
    return addr;
  }
  bn -= NINDIRECT;
8010138c:	8d 9a 75 ff ff ff    	lea    -0x8b(%edx),%ebx

  //double indirect
  if( bn < NINDIRECT*NINDIRECT){
80101392:	81 fb ff 3f 00 00    	cmp    $0x3fff,%ebx
80101398:	0f 87 3c 01 00 00    	ja     801014da <bmap+0x18a>

	// Check if the double-indirect block needs to be allocated.
    if((addr = ip->addrs[NDIRECT + 1]) == 0)
8010139e:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801013a4:	85 c0                	test   %eax,%eax
801013a6:	0f 84 1c 01 00 00    	je     801014c8 <bmap+0x178>
      ip->addrs[NDIRECT + 1] = addr = balloc(ip->dev);

    // Read+lock double-indirect block
    bp = bread(ip->dev, addr);
801013ac:	83 ec 08             	sub    $0x8,%esp
801013af:	50                   	push   %eax
801013b0:	ff 36                	pushl  (%esi)
801013b2:	e8 19 ed ff ff       	call   801000d0 <bread>
801013b7:	89 c2                	mov    %eax,%edx
    a = (uint*)bp->data;
    
    // Check if the double-indirect block is in the array
    if((addr = a[bn / NINDIRECT]) == 0){
801013b9:	89 d8                	mov    %ebx,%eax
801013bb:	83 c4 10             	add    $0x10,%esp
801013be:	c1 e8 07             	shr    $0x7,%eax
801013c1:	8d 4c 82 5c          	lea    0x5c(%edx,%eax,4),%ecx
801013c5:	8b 39                	mov    (%ecx),%edi
801013c7:	85 ff                	test   %edi,%edi
801013c9:	0f 84 b1 00 00 00    	je     80101480 <bmap+0x130>
      // Write the block back to disk
      log_write(bp);
    }
    
    // Release the double-indirect block
    brelse(bp);
801013cf:	83 ec 0c             	sub    $0xc,%esp
    //Read+lock the indirect block
	bp = bread(ip->dev, addr);
    a = (uint*)bp->data;

	// Check if the indirect block is in the array
    if((addr = a[bn % NINDIRECT]) == 0){
801013d2:	83 e3 7f             	and    $0x7f,%ebx
      // Write the block back to disk
      log_write(bp);
    }
    
    // Release the double-indirect block
    brelse(bp);
801013d5:	52                   	push   %edx
801013d6:	e8 05 ee ff ff       	call   801001e0 <brelse>

    //Read+lock the indirect block
	bp = bread(ip->dev, addr);
801013db:	58                   	pop    %eax
801013dc:	5a                   	pop    %edx
801013dd:	57                   	push   %edi
801013de:	ff 36                	pushl  (%esi)
801013e0:	e8 eb ec ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;

	// Check if the indirect block is in the array
    if((addr = a[bn % NINDIRECT]) == 0){
801013e5:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
801013e9:	83 c4 10             	add    $0x10,%esp
    
    // Release the double-indirect block
    brelse(bp);

    //Read+lock the indirect block
	bp = bread(ip->dev, addr);
801013ec:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;

	// Check if the indirect block is in the array
    if((addr = a[bn % NINDIRECT]) == 0){
801013ee:	8b 1a                	mov    (%edx),%ebx
801013f0:	85 db                	test   %ebx,%ebx
801013f2:	74 44                	je     80101438 <bmap+0xe8>
      // Write the block back to disk
      log_write(bp);
    }

    // Release the indirect block
    brelse(bp);
801013f4:	83 ec 0c             	sub    $0xc,%esp
801013f7:	57                   	push   %edi
801013f8:	e8 e3 ed ff ff       	call   801001e0 <brelse>
801013fd:	83 c4 10             	add    $0x10,%esp
    return addr;
80101400:	89 d8                	mov    %ebx,%eax
  }

  panic("bmap: out of range");
}
80101402:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101405:	5b                   	pop    %ebx
80101406:	5e                   	pop    %esi
80101407:	5f                   	pop    %edi
80101408:	5d                   	pop    %ebp
80101409:	c3                   	ret    
8010140a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101410:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
80101416:	85 c0                	test   %eax,%eax
80101418:	0f 84 92 00 00 00    	je     801014b0 <bmap+0x160>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010141e:	83 ec 08             	sub    $0x8,%esp
80101421:	50                   	push   %eax
80101422:	ff 36                	pushl  (%esi)
80101424:	e8 a7 ec ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101429:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010142d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101430:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101432:	8b 1a                	mov    (%edx),%ebx
80101434:	85 db                	test   %ebx,%ebx
80101436:	75 bc                	jne    801013f4 <bmap+0xa4>
    a = (uint*)bp->data;

	// Check if the indirect block is in the array
    if((addr = a[bn % NINDIRECT]) == 0){
      // Allocate the new block
      a[bn % NINDIRECT] = addr = balloc(ip->dev);
80101438:	8b 06                	mov    (%esi),%eax
8010143a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010143d:	e8 2e fd ff ff       	call   80101170 <balloc>
80101442:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      // Write the block back to disk
      log_write(bp);
80101445:	83 ec 0c             	sub    $0xc,%esp
    a = (uint*)bp->data;

	// Check if the indirect block is in the array
    if((addr = a[bn % NINDIRECT]) == 0){
      // Allocate the new block
      a[bn % NINDIRECT] = addr = balloc(ip->dev);
80101448:	89 c3                	mov    %eax,%ebx
8010144a:	89 02                	mov    %eax,(%edx)
      // Write the block back to disk
      log_write(bp);
8010144c:	57                   	push   %edi
8010144d:	e8 9e 19 00 00       	call   80102df0 <log_write>
80101452:	83 c4 10             	add    $0x10,%esp
    }

    // Release the indirect block
    brelse(bp);
80101455:	83 ec 0c             	sub    $0xc,%esp
80101458:	57                   	push   %edi
80101459:	e8 82 ed ff ff       	call   801001e0 <brelse>
8010145e:	83 c4 10             	add    $0x10,%esp
    return addr;
80101461:	89 d8                	mov    %ebx,%eax
80101463:	eb 9d                	jmp    80101402 <bmap+0xb2>
80101465:	8d 76 00             	lea    0x0(%esi),%esi
  struct buf *bp;

  
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101468:	8b 06                	mov    (%esi),%eax
8010146a:	e8 01 fd ff ff       	call   80101170 <balloc>
8010146f:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
80101472:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101475:	5b                   	pop    %ebx
80101476:	5e                   	pop    %esi
80101477:	5f                   	pop    %edi
80101478:	5d                   	pop    %ebp
80101479:	c3                   	ret    
8010147a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    a = (uint*)bp->data;
    
    // Check if the double-indirect block is in the array
    if((addr = a[bn / NINDIRECT]) == 0){
      // Allocate the new block
      a[bn / NINDIRECT] = addr = balloc(ip->dev);
80101480:	8b 06                	mov    (%esi),%eax
80101482:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101485:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101488:	e8 e3 fc ff ff       	call   80101170 <balloc>
      // Write the block back to disk
      log_write(bp);
8010148d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a = (uint*)bp->data;
    
    // Check if the double-indirect block is in the array
    if((addr = a[bn / NINDIRECT]) == 0){
      // Allocate the new block
      a[bn / NINDIRECT] = addr = balloc(ip->dev);
80101490:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      // Write the block back to disk
      log_write(bp);
80101493:	83 ec 0c             	sub    $0xc,%esp
    a = (uint*)bp->data;
    
    // Check if the double-indirect block is in the array
    if((addr = a[bn / NINDIRECT]) == 0){
      // Allocate the new block
      a[bn / NINDIRECT] = addr = balloc(ip->dev);
80101496:	89 c7                	mov    %eax,%edi
80101498:	89 01                	mov    %eax,(%ecx)
      // Write the block back to disk
      log_write(bp);
8010149a:	52                   	push   %edx
8010149b:	e8 50 19 00 00       	call   80102df0 <log_write>
801014a0:	83 c4 10             	add    $0x10,%esp
801014a3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014a6:	e9 24 ff ff ff       	jmp    801013cf <bmap+0x7f>
801014ab:	90                   	nop
801014ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801014b0:	8b 06                	mov    (%esi),%eax
801014b2:	e8 b9 fc ff ff       	call   80101170 <balloc>
801014b7:	89 86 88 00 00 00    	mov    %eax,0x88(%esi)
801014bd:	e9 5c ff ff ff       	jmp    8010141e <bmap+0xce>
801014c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  //double indirect
  if( bn < NINDIRECT*NINDIRECT){

	// Check if the double-indirect block needs to be allocated.
    if((addr = ip->addrs[NDIRECT + 1]) == 0)
      ip->addrs[NDIRECT + 1] = addr = balloc(ip->dev);
801014c8:	8b 06                	mov    (%esi),%eax
801014ca:	e8 a1 fc ff ff       	call   80101170 <balloc>
801014cf:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801014d5:	e9 d2 fe ff ff       	jmp    801013ac <bmap+0x5c>
    // Release the indirect block
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
801014da:	83 ec 0c             	sub    $0xc,%esp
801014dd:	68 38 72 10 80       	push   $0x80107238
801014e2:	e8 89 ee ff ff       	call   80100370 <panic>
801014e7:	89 f6                	mov    %esi,%esi
801014e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014f0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	56                   	push   %esi
801014f4:	53                   	push   %ebx
801014f5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801014f8:	83 ec 08             	sub    $0x8,%esp
801014fb:	6a 01                	push   $0x1
801014fd:	ff 75 08             	pushl  0x8(%ebp)
80101500:	e8 cb eb ff ff       	call   801000d0 <bread>
80101505:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101507:	8d 40 5c             	lea    0x5c(%eax),%eax
8010150a:	83 c4 0c             	add    $0xc,%esp
8010150d:	6a 1c                	push   $0x1c
8010150f:	50                   	push   %eax
80101510:	56                   	push   %esi
80101511:	e8 ba 30 00 00       	call   801045d0 <memmove>
  brelse(bp);
80101516:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101519:	83 c4 10             	add    $0x10,%esp
}
8010151c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010151f:	5b                   	pop    %ebx
80101520:	5e                   	pop    %esi
80101521:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
80101522:	e9 b9 ec ff ff       	jmp    801001e0 <brelse>
80101527:	89 f6                	mov    %esi,%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101530 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101530:	55                   	push   %ebp
80101531:	89 e5                	mov    %esp,%ebp
80101533:	53                   	push   %ebx
80101534:	bb 20 0b 11 80       	mov    $0x80110b20,%ebx
80101539:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010153c:	68 4b 72 10 80       	push   $0x8010724b
80101541:	68 e0 0a 11 80       	push   $0x80110ae0
80101546:	e8 75 2d 00 00       	call   801042c0 <initlock>
8010154b:	83 c4 10             	add    $0x10,%esp
8010154e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101550:	83 ec 08             	sub    $0x8,%esp
80101553:	68 52 72 10 80       	push   $0x80107252
80101558:	53                   	push   %ebx
80101559:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
8010155f:	e8 2c 2c 00 00       	call   80104190 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101564:	83 c4 10             	add    $0x10,%esp
80101567:	81 fb 78 26 11 80    	cmp    $0x80112678,%ebx
8010156d:	75 e1                	jne    80101550 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
8010156f:	83 ec 08             	sub    $0x8,%esp
80101572:	68 c0 0a 11 80       	push   $0x80110ac0
80101577:	ff 75 08             	pushl  0x8(%ebp)
8010157a:	e8 71 ff ff ff       	call   801014f0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010157f:	ff 35 d8 0a 11 80    	pushl  0x80110ad8
80101585:	ff 35 d4 0a 11 80    	pushl  0x80110ad4
8010158b:	ff 35 d0 0a 11 80    	pushl  0x80110ad0
80101591:	ff 35 cc 0a 11 80    	pushl  0x80110acc
80101597:	ff 35 c8 0a 11 80    	pushl  0x80110ac8
8010159d:	ff 35 c4 0a 11 80    	pushl  0x80110ac4
801015a3:	ff 35 c0 0a 11 80    	pushl  0x80110ac0
801015a9:	68 b8 72 10 80       	push   $0x801072b8
801015ae:	e8 ad f0 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801015b3:	83 c4 30             	add    $0x30,%esp
801015b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801015b9:	c9                   	leave  
801015ba:	c3                   	ret    
801015bb:	90                   	nop
801015bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801015c0 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	57                   	push   %edi
801015c4:	56                   	push   %esi
801015c5:	53                   	push   %ebx
801015c6:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015c9:	83 3d c8 0a 11 80 01 	cmpl   $0x1,0x80110ac8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
801015d0:	8b 45 0c             	mov    0xc(%ebp),%eax
801015d3:	8b 75 08             	mov    0x8(%ebp),%esi
801015d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015d9:	0f 86 91 00 00 00    	jbe    80101670 <ialloc+0xb0>
801015df:	bb 01 00 00 00       	mov    $0x1,%ebx
801015e4:	eb 21                	jmp    80101607 <ialloc+0x47>
801015e6:	8d 76 00             	lea    0x0(%esi),%esi
801015e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
801015f0:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015f3:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
801015f6:	57                   	push   %edi
801015f7:	e8 e4 eb ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015fc:	83 c4 10             	add    $0x10,%esp
801015ff:	39 1d c8 0a 11 80    	cmp    %ebx,0x80110ac8
80101605:	76 69                	jbe    80101670 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101607:	89 d8                	mov    %ebx,%eax
80101609:	83 ec 08             	sub    $0x8,%esp
8010160c:	c1 e8 03             	shr    $0x3,%eax
8010160f:	03 05 d4 0a 11 80    	add    0x80110ad4,%eax
80101615:	50                   	push   %eax
80101616:	56                   	push   %esi
80101617:	e8 b4 ea ff ff       	call   801000d0 <bread>
8010161c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010161e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101620:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101623:	83 e0 07             	and    $0x7,%eax
80101626:	c1 e0 06             	shl    $0x6,%eax
80101629:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010162d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101631:	75 bd                	jne    801015f0 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101633:	83 ec 04             	sub    $0x4,%esp
80101636:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101639:	6a 40                	push   $0x40
8010163b:	6a 00                	push   $0x0
8010163d:	51                   	push   %ecx
8010163e:	e8 dd 2e 00 00       	call   80104520 <memset>
      dip->type = type;
80101643:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101647:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010164a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010164d:	89 3c 24             	mov    %edi,(%esp)
80101650:	e8 9b 17 00 00       	call   80102df0 <log_write>
      brelse(bp);
80101655:	89 3c 24             	mov    %edi,(%esp)
80101658:	e8 83 eb ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010165d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101660:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
80101663:	89 da                	mov    %ebx,%edx
80101665:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101667:	5b                   	pop    %ebx
80101668:	5e                   	pop    %esi
80101669:	5f                   	pop    %edi
8010166a:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
8010166b:	e9 10 fc ff ff       	jmp    80101280 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
80101670:	83 ec 0c             	sub    $0xc,%esp
80101673:	68 58 72 10 80       	push   $0x80107258
80101678:	e8 f3 ec ff ff       	call   80100370 <panic>
8010167d:	8d 76 00             	lea    0x0(%esi),%esi

80101680 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	56                   	push   %esi
80101684:	53                   	push   %ebx
80101685:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101688:	83 ec 08             	sub    $0x8,%esp
8010168b:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010168e:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101691:	c1 e8 03             	shr    $0x3,%eax
80101694:	03 05 d4 0a 11 80    	add    0x80110ad4,%eax
8010169a:	50                   	push   %eax
8010169b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010169e:	e8 2d ea ff ff       	call   801000d0 <bread>
801016a3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016a5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801016a8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016ac:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016af:	83 e0 07             	and    $0x7,%eax
801016b2:	c1 e0 06             	shl    $0x6,%eax
801016b5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801016b9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801016bc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016c0:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
801016c3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
801016c7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801016cb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
801016cf:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801016d3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
801016d7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801016da:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016dd:	6a 30                	push   $0x30
801016df:	53                   	push   %ebx
801016e0:	50                   	push   %eax
801016e1:	e8 ea 2e 00 00       	call   801045d0 <memmove>
  log_write(bp);
801016e6:	89 34 24             	mov    %esi,(%esp)
801016e9:	e8 02 17 00 00       	call   80102df0 <log_write>
  brelse(bp);
801016ee:	89 75 08             	mov    %esi,0x8(%ebp)
801016f1:	83 c4 10             	add    $0x10,%esp
}
801016f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016f7:	5b                   	pop    %ebx
801016f8:	5e                   	pop    %esi
801016f9:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
801016fa:	e9 e1 ea ff ff       	jmp    801001e0 <brelse>
801016ff:	90                   	nop

80101700 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101700:	55                   	push   %ebp
80101701:	89 e5                	mov    %esp,%ebp
80101703:	53                   	push   %ebx
80101704:	83 ec 10             	sub    $0x10,%esp
80101707:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010170a:	68 e0 0a 11 80       	push   $0x80110ae0
8010170f:	e8 0c 2d 00 00       	call   80104420 <acquire>
  ip->ref++;
80101714:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101718:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
8010171f:	e8 ac 2d 00 00       	call   801044d0 <release>
  return ip;
}
80101724:	89 d8                	mov    %ebx,%eax
80101726:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101729:	c9                   	leave  
8010172a:	c3                   	ret    
8010172b:	90                   	nop
8010172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101730 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101730:	55                   	push   %ebp
80101731:	89 e5                	mov    %esp,%ebp
80101733:	56                   	push   %esi
80101734:	53                   	push   %ebx
80101735:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101738:	85 db                	test   %ebx,%ebx
8010173a:	0f 84 b7 00 00 00    	je     801017f7 <ilock+0xc7>
80101740:	8b 53 08             	mov    0x8(%ebx),%edx
80101743:	85 d2                	test   %edx,%edx
80101745:	0f 8e ac 00 00 00    	jle    801017f7 <ilock+0xc7>
    panic("ilock");

  acquiresleep(&ip->lock);
8010174b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010174e:	83 ec 0c             	sub    $0xc,%esp
80101751:	50                   	push   %eax
80101752:	e8 79 2a 00 00       	call   801041d0 <acquiresleep>

  if(ip->valid == 0){
80101757:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010175a:	83 c4 10             	add    $0x10,%esp
8010175d:	85 c0                	test   %eax,%eax
8010175f:	74 0f                	je     80101770 <ilock+0x40>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
80101761:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101764:	5b                   	pop    %ebx
80101765:	5e                   	pop    %esi
80101766:	5d                   	pop    %ebp
80101767:	c3                   	ret    
80101768:	90                   	nop
80101769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101770:	8b 43 04             	mov    0x4(%ebx),%eax
80101773:	83 ec 08             	sub    $0x8,%esp
80101776:	c1 e8 03             	shr    $0x3,%eax
80101779:	03 05 d4 0a 11 80    	add    0x80110ad4,%eax
8010177f:	50                   	push   %eax
80101780:	ff 33                	pushl  (%ebx)
80101782:	e8 49 e9 ff ff       	call   801000d0 <bread>
80101787:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101789:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010178c:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010178f:	83 e0 07             	and    $0x7,%eax
80101792:	c1 e0 06             	shl    $0x6,%eax
80101795:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
80101799:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010179c:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
8010179f:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801017a3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017a7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801017ab:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017af:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801017b3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801017b7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801017bb:	8b 50 fc             	mov    -0x4(%eax),%edx
801017be:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017c1:	6a 30                	push   $0x30
801017c3:	50                   	push   %eax
801017c4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801017c7:	50                   	push   %eax
801017c8:	e8 03 2e 00 00       	call   801045d0 <memmove>
    brelse(bp);
801017cd:	89 34 24             	mov    %esi,(%esp)
801017d0:	e8 0b ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
801017d5:	83 c4 10             	add    $0x10,%esp
801017d8:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
801017dd:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
801017e4:	0f 85 77 ff ff ff    	jne    80101761 <ilock+0x31>
      panic("ilock: no type");
801017ea:	83 ec 0c             	sub    $0xc,%esp
801017ed:	68 70 72 10 80       	push   $0x80107270
801017f2:	e8 79 eb ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
801017f7:	83 ec 0c             	sub    $0xc,%esp
801017fa:	68 6a 72 10 80       	push   $0x8010726a
801017ff:	e8 6c eb ff ff       	call   80100370 <panic>
80101804:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010180a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101810 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101810:	55                   	push   %ebp
80101811:	89 e5                	mov    %esp,%ebp
80101813:	56                   	push   %esi
80101814:	53                   	push   %ebx
80101815:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101818:	85 db                	test   %ebx,%ebx
8010181a:	74 28                	je     80101844 <iunlock+0x34>
8010181c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010181f:	83 ec 0c             	sub    $0xc,%esp
80101822:	56                   	push   %esi
80101823:	e8 48 2a 00 00       	call   80104270 <holdingsleep>
80101828:	83 c4 10             	add    $0x10,%esp
8010182b:	85 c0                	test   %eax,%eax
8010182d:	74 15                	je     80101844 <iunlock+0x34>
8010182f:	8b 43 08             	mov    0x8(%ebx),%eax
80101832:	85 c0                	test   %eax,%eax
80101834:	7e 0e                	jle    80101844 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101836:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101839:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010183c:	5b                   	pop    %ebx
8010183d:	5e                   	pop    %esi
8010183e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010183f:	e9 ec 29 00 00       	jmp    80104230 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101844:	83 ec 0c             	sub    $0xc,%esp
80101847:	68 7f 72 10 80       	push   $0x8010727f
8010184c:	e8 1f eb ff ff       	call   80100370 <panic>
80101851:	eb 0d                	jmp    80101860 <iput>
80101853:	90                   	nop
80101854:	90                   	nop
80101855:	90                   	nop
80101856:	90                   	nop
80101857:	90                   	nop
80101858:	90                   	nop
80101859:	90                   	nop
8010185a:	90                   	nop
8010185b:	90                   	nop
8010185c:	90                   	nop
8010185d:	90                   	nop
8010185e:	90                   	nop
8010185f:	90                   	nop

80101860 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
80101860:	55                   	push   %ebp
80101861:	89 e5                	mov    %esp,%ebp
80101863:	57                   	push   %edi
80101864:	56                   	push   %esi
80101865:	53                   	push   %ebx
80101866:	83 ec 28             	sub    $0x28,%esp
80101869:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
8010186c:	8d 7e 0c             	lea    0xc(%esi),%edi
8010186f:	57                   	push   %edi
80101870:	e8 5b 29 00 00       	call   801041d0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
80101875:	8b 56 4c             	mov    0x4c(%esi),%edx
80101878:	83 c4 10             	add    $0x10,%esp
8010187b:	85 d2                	test   %edx,%edx
8010187d:	74 07                	je     80101886 <iput+0x26>
8010187f:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80101884:	74 32                	je     801018b8 <iput+0x58>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
80101886:	83 ec 0c             	sub    $0xc,%esp
80101889:	57                   	push   %edi
8010188a:	e8 a1 29 00 00       	call   80104230 <releasesleep>

  acquire(&icache.lock);
8010188f:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
80101896:	e8 85 2b 00 00       	call   80104420 <acquire>
  ip->ref--;
8010189b:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
8010189f:	83 c4 10             	add    $0x10,%esp
801018a2:	c7 45 08 e0 0a 11 80 	movl   $0x80110ae0,0x8(%ebp)
}
801018a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018ac:	5b                   	pop    %ebx
801018ad:	5e                   	pop    %esi
801018ae:	5f                   	pop    %edi
801018af:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
801018b0:	e9 1b 2c 00 00       	jmp    801044d0 <release>
801018b5:	8d 76 00             	lea    0x0(%esi),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
801018b8:	83 ec 0c             	sub    $0xc,%esp
801018bb:	68 e0 0a 11 80       	push   $0x80110ae0
801018c0:	e8 5b 2b 00 00       	call   80104420 <acquire>
    int r = ip->ref;
801018c5:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
801018c8:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
801018cf:	e8 fc 2b 00 00       	call   801044d0 <release>
    if(r == 1){
801018d4:	83 c4 10             	add    $0x10,%esp
801018d7:	83 fb 01             	cmp    $0x1,%ebx
801018da:	75 aa                	jne    80101886 <iput+0x26>
801018dc:	8d 8e 88 00 00 00    	lea    0x88(%esi),%ecx
801018e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801018e5:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801018e8:	89 cf                	mov    %ecx,%edi
801018ea:	eb 0b                	jmp    801018f7 <iput+0x97>
801018ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801018f0:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801018f3:	39 fb                	cmp    %edi,%ebx
801018f5:	74 19                	je     80101910 <iput+0xb0>
    if(ip->addrs[i]){
801018f7:	8b 13                	mov    (%ebx),%edx
801018f9:	85 d2                	test   %edx,%edx
801018fb:	74 f3                	je     801018f0 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
801018fd:	8b 06                	mov    (%esi),%eax
801018ff:	e8 fc f7 ff ff       	call   80101100 <bfree>
      ip->addrs[i] = 0;
80101904:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010190a:	eb e4                	jmp    801018f0 <iput+0x90>
8010190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101910:	8b 86 88 00 00 00    	mov    0x88(%esi),%eax
80101916:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101919:	85 c0                	test   %eax,%eax
8010191b:	75 33                	jne    80101950 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010191d:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101920:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101927:	56                   	push   %esi
80101928:	e8 53 fd ff ff       	call   80101680 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010192d:	31 c0                	xor    %eax,%eax
8010192f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101933:	89 34 24             	mov    %esi,(%esp)
80101936:	e8 45 fd ff ff       	call   80101680 <iupdate>
      ip->valid = 0;
8010193b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101942:	83 c4 10             	add    $0x10,%esp
80101945:	e9 3c ff ff ff       	jmp    80101886 <iput+0x26>
8010194a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101950:	83 ec 08             	sub    $0x8,%esp
80101953:	50                   	push   %eax
80101954:	ff 36                	pushl  (%esi)
80101956:	e8 75 e7 ff ff       	call   801000d0 <bread>
8010195b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101961:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101964:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101967:	8d 58 5c             	lea    0x5c(%eax),%ebx
8010196a:	83 c4 10             	add    $0x10,%esp
8010196d:	89 cf                	mov    %ecx,%edi
8010196f:	eb 0e                	jmp    8010197f <iput+0x11f>
80101971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101978:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
8010197b:	39 fb                	cmp    %edi,%ebx
8010197d:	74 0f                	je     8010198e <iput+0x12e>
      if(a[j])
8010197f:	8b 13                	mov    (%ebx),%edx
80101981:	85 d2                	test   %edx,%edx
80101983:	74 f3                	je     80101978 <iput+0x118>
        bfree(ip->dev, a[j]);
80101985:	8b 06                	mov    (%esi),%eax
80101987:	e8 74 f7 ff ff       	call   80101100 <bfree>
8010198c:	eb ea                	jmp    80101978 <iput+0x118>
    }
    brelse(bp);
8010198e:	83 ec 0c             	sub    $0xc,%esp
80101991:	ff 75 e4             	pushl  -0x1c(%ebp)
80101994:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101997:	e8 44 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
8010199c:	8b 96 88 00 00 00    	mov    0x88(%esi),%edx
801019a2:	8b 06                	mov    (%esi),%eax
801019a4:	e8 57 f7 ff ff       	call   80101100 <bfree>
    ip->addrs[NDIRECT] = 0;
801019a9:	c7 86 88 00 00 00 00 	movl   $0x0,0x88(%esi)
801019b0:	00 00 00 
801019b3:	83 c4 10             	add    $0x10,%esp
801019b6:	e9 62 ff ff ff       	jmp    8010191d <iput+0xbd>
801019bb:	90                   	nop
801019bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801019c0 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
801019c0:	55                   	push   %ebp
801019c1:	89 e5                	mov    %esp,%ebp
801019c3:	53                   	push   %ebx
801019c4:	83 ec 10             	sub    $0x10,%esp
801019c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801019ca:	53                   	push   %ebx
801019cb:	e8 40 fe ff ff       	call   80101810 <iunlock>
  iput(ip);
801019d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801019d3:	83 c4 10             	add    $0x10,%esp
}
801019d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801019d9:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
801019da:	e9 81 fe ff ff       	jmp    80101860 <iput>
801019df:	90                   	nop

801019e0 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
801019e0:	55                   	push   %ebp
801019e1:	89 e5                	mov    %esp,%ebp
801019e3:	8b 55 08             	mov    0x8(%ebp),%edx
801019e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
801019e9:	8b 0a                	mov    (%edx),%ecx
801019eb:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
801019ee:	8b 4a 04             	mov    0x4(%edx),%ecx
801019f1:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
801019f4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
801019f8:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
801019fb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
801019ff:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101a03:	8b 52 58             	mov    0x58(%edx),%edx
80101a06:	89 50 10             	mov    %edx,0x10(%eax)
}
80101a09:	5d                   	pop    %ebp
80101a0a:	c3                   	ret    
80101a0b:	90                   	nop
80101a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101a10 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	57                   	push   %edi
80101a14:	56                   	push   %esi
80101a15:	53                   	push   %ebx
80101a16:	83 ec 1c             	sub    $0x1c,%esp
80101a19:	8b 45 08             	mov    0x8(%ebp),%eax
80101a1c:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101a1f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a22:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a27:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a2a:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a2d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a30:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a33:	0f 84 a7 00 00 00    	je     80101ae0 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101a39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a3c:	8b 40 58             	mov    0x58(%eax),%eax
80101a3f:	39 f0                	cmp    %esi,%eax
80101a41:	0f 82 c1 00 00 00    	jb     80101b08 <readi+0xf8>
80101a47:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101a4a:	89 fa                	mov    %edi,%edx
80101a4c:	01 f2                	add    %esi,%edx
80101a4e:	0f 82 b4 00 00 00    	jb     80101b08 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101a54:	89 c1                	mov    %eax,%ecx
80101a56:	29 f1                	sub    %esi,%ecx
80101a58:	39 d0                	cmp    %edx,%eax
80101a5a:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a5d:	31 ff                	xor    %edi,%edi
80101a5f:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101a61:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a64:	74 6d                	je     80101ad3 <readi+0xc3>
80101a66:	8d 76 00             	lea    0x0(%esi),%esi
80101a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a70:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101a73:	89 f2                	mov    %esi,%edx
80101a75:	c1 ea 09             	shr    $0x9,%edx
80101a78:	89 d8                	mov    %ebx,%eax
80101a7a:	e8 d1 f8 ff ff       	call   80101350 <bmap>
80101a7f:	83 ec 08             	sub    $0x8,%esp
80101a82:	50                   	push   %eax
80101a83:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
80101a85:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a8a:	e8 41 e6 ff ff       	call   801000d0 <bread>
80101a8f:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a94:	89 f1                	mov    %esi,%ecx
80101a96:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101a9c:	83 c4 0c             	add    $0xc,%esp
    memmove(dst, bp->data + off%BSIZE, m);
80101a9f:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101aa2:	29 cb                	sub    %ecx,%ebx
80101aa4:	29 f8                	sub    %edi,%eax
80101aa6:	39 c3                	cmp    %eax,%ebx
80101aa8:	0f 47 d8             	cmova  %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101aab:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
80101aaf:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101ab0:	01 df                	add    %ebx,%edi
80101ab2:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
80101ab4:	50                   	push   %eax
80101ab5:	ff 75 e0             	pushl  -0x20(%ebp)
80101ab8:	e8 13 2b 00 00       	call   801045d0 <memmove>
    brelse(bp);
80101abd:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101ac0:	89 14 24             	mov    %edx,(%esp)
80101ac3:	e8 18 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101ac8:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101acb:	83 c4 10             	add    $0x10,%esp
80101ace:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101ad1:	77 9d                	ja     80101a70 <readi+0x60>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101ad3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101ad6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ad9:	5b                   	pop    %ebx
80101ada:	5e                   	pop    %esi
80101adb:	5f                   	pop    %edi
80101adc:	5d                   	pop    %ebp
80101add:	c3                   	ret    
80101ade:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101ae0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101ae4:	66 83 f8 09          	cmp    $0x9,%ax
80101ae8:	77 1e                	ja     80101b08 <readi+0xf8>
80101aea:	8b 04 c5 60 0a 11 80 	mov    -0x7feef5a0(,%eax,8),%eax
80101af1:	85 c0                	test   %eax,%eax
80101af3:	74 13                	je     80101b08 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101af5:	89 7d 10             	mov    %edi,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101af8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101afb:	5b                   	pop    %ebx
80101afc:	5e                   	pop    %esi
80101afd:	5f                   	pop    %edi
80101afe:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101aff:	ff e0                	jmp    *%eax
80101b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101b08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b0d:	eb c7                	jmp    80101ad6 <readi+0xc6>
80101b0f:	90                   	nop

80101b10 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101b10:	55                   	push   %ebp
80101b11:	89 e5                	mov    %esp,%ebp
80101b13:	57                   	push   %edi
80101b14:	56                   	push   %esi
80101b15:	53                   	push   %ebx
80101b16:	83 ec 1c             	sub    $0x1c,%esp
80101b19:	8b 45 08             	mov    0x8(%ebp),%eax
80101b1c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b1f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101b22:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101b27:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101b2a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101b2d:	8b 75 10             	mov    0x10(%ebp),%esi
80101b30:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101b33:	0f 84 b7 00 00 00    	je     80101bf0 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101b39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3c:	39 70 58             	cmp    %esi,0x58(%eax)
80101b3f:	0f 82 eb 00 00 00    	jb     80101c30 <writei+0x120>
80101b45:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101b48:	89 f8                	mov    %edi,%eax
80101b4a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101b4c:	3d 00 16 81 00       	cmp    $0x811600,%eax
80101b51:	0f 87 d9 00 00 00    	ja     80101c30 <writei+0x120>
80101b57:	39 c6                	cmp    %eax,%esi
80101b59:	0f 87 d1 00 00 00    	ja     80101c30 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b5f:	85 ff                	test   %edi,%edi
80101b61:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101b68:	74 78                	je     80101be2 <writei+0xd2>
80101b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b70:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101b73:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101b75:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b7a:	c1 ea 09             	shr    $0x9,%edx
80101b7d:	89 f8                	mov    %edi,%eax
80101b7f:	e8 cc f7 ff ff       	call   80101350 <bmap>
80101b84:	83 ec 08             	sub    $0x8,%esp
80101b87:	50                   	push   %eax
80101b88:	ff 37                	pushl  (%edi)
80101b8a:	e8 41 e5 ff ff       	call   801000d0 <bread>
80101b8f:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101b91:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b94:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101b97:	89 f1                	mov    %esi,%ecx
80101b99:	83 c4 0c             	add    $0xc,%esp
80101b9c:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ba2:	29 cb                	sub    %ecx,%ebx
80101ba4:	39 c3                	cmp    %eax,%ebx
80101ba6:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ba9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101bad:	53                   	push   %ebx
80101bae:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101bb1:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101bb3:	50                   	push   %eax
80101bb4:	e8 17 2a 00 00       	call   801045d0 <memmove>
    log_write(bp);
80101bb9:	89 3c 24             	mov    %edi,(%esp)
80101bbc:	e8 2f 12 00 00       	call   80102df0 <log_write>
    brelse(bp);
80101bc1:	89 3c 24             	mov    %edi,(%esp)
80101bc4:	e8 17 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101bc9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101bcc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101bcf:	83 c4 10             	add    $0x10,%esp
80101bd2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101bd5:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101bd8:	77 96                	ja     80101b70 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101bda:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bdd:	3b 70 58             	cmp    0x58(%eax),%esi
80101be0:	77 36                	ja     80101c18 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101be2:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101be5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101be8:	5b                   	pop    %ebx
80101be9:	5e                   	pop    %esi
80101bea:	5f                   	pop    %edi
80101beb:	5d                   	pop    %ebp
80101bec:	c3                   	ret    
80101bed:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101bf0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101bf4:	66 83 f8 09          	cmp    $0x9,%ax
80101bf8:	77 36                	ja     80101c30 <writei+0x120>
80101bfa:	8b 04 c5 64 0a 11 80 	mov    -0x7feef59c(,%eax,8),%eax
80101c01:	85 c0                	test   %eax,%eax
80101c03:	74 2b                	je     80101c30 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101c05:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101c08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c0b:	5b                   	pop    %ebx
80101c0c:	5e                   	pop    %esi
80101c0d:	5f                   	pop    %edi
80101c0e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101c0f:	ff e0                	jmp    *%eax
80101c11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101c18:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101c1b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101c1e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101c21:	50                   	push   %eax
80101c22:	e8 59 fa ff ff       	call   80101680 <iupdate>
80101c27:	83 c4 10             	add    $0x10,%esp
80101c2a:	eb b6                	jmp    80101be2 <writei+0xd2>
80101c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101c30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c35:	eb ae                	jmp    80101be5 <writei+0xd5>
80101c37:	89 f6                	mov    %esi,%esi
80101c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c40 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101c40:	55                   	push   %ebp
80101c41:	89 e5                	mov    %esp,%ebp
80101c43:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101c46:	6a 0e                	push   $0xe
80101c48:	ff 75 0c             	pushl  0xc(%ebp)
80101c4b:	ff 75 08             	pushl  0x8(%ebp)
80101c4e:	e8 fd 29 00 00       	call   80104650 <strncmp>
}
80101c53:	c9                   	leave  
80101c54:	c3                   	ret    
80101c55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c60 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101c60:	55                   	push   %ebp
80101c61:	89 e5                	mov    %esp,%ebp
80101c63:	57                   	push   %edi
80101c64:	56                   	push   %esi
80101c65:	53                   	push   %ebx
80101c66:	83 ec 1c             	sub    $0x1c,%esp
80101c69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101c6c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c71:	0f 85 80 00 00 00    	jne    80101cf7 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101c77:	8b 53 58             	mov    0x58(%ebx),%edx
80101c7a:	31 ff                	xor    %edi,%edi
80101c7c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c7f:	85 d2                	test   %edx,%edx
80101c81:	75 0d                	jne    80101c90 <dirlookup+0x30>
80101c83:	eb 5b                	jmp    80101ce0 <dirlookup+0x80>
80101c85:	8d 76 00             	lea    0x0(%esi),%esi
80101c88:	83 c7 10             	add    $0x10,%edi
80101c8b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101c8e:	76 50                	jbe    80101ce0 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c90:	6a 10                	push   $0x10
80101c92:	57                   	push   %edi
80101c93:	56                   	push   %esi
80101c94:	53                   	push   %ebx
80101c95:	e8 76 fd ff ff       	call   80101a10 <readi>
80101c9a:	83 c4 10             	add    $0x10,%esp
80101c9d:	83 f8 10             	cmp    $0x10,%eax
80101ca0:	75 48                	jne    80101cea <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101ca2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101ca7:	74 df                	je     80101c88 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101ca9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101cac:	83 ec 04             	sub    $0x4,%esp
80101caf:	6a 0e                	push   $0xe
80101cb1:	50                   	push   %eax
80101cb2:	ff 75 0c             	pushl  0xc(%ebp)
80101cb5:	e8 96 29 00 00       	call   80104650 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101cba:	83 c4 10             	add    $0x10,%esp
80101cbd:	85 c0                	test   %eax,%eax
80101cbf:	75 c7                	jne    80101c88 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101cc1:	8b 45 10             	mov    0x10(%ebp),%eax
80101cc4:	85 c0                	test   %eax,%eax
80101cc6:	74 05                	je     80101ccd <dirlookup+0x6d>
        *poff = off;
80101cc8:	8b 45 10             	mov    0x10(%ebp),%eax
80101ccb:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101ccd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101cd1:	8b 03                	mov    (%ebx),%eax
80101cd3:	e8 a8 f5 ff ff       	call   80101280 <iget>
    }
  }

  return 0;
}
80101cd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101cdb:	5b                   	pop    %ebx
80101cdc:	5e                   	pop    %esi
80101cdd:	5f                   	pop    %edi
80101cde:	5d                   	pop    %ebp
80101cdf:	c3                   	ret    
80101ce0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101ce3:	31 c0                	xor    %eax,%eax
}
80101ce5:	5b                   	pop    %ebx
80101ce6:	5e                   	pop    %esi
80101ce7:	5f                   	pop    %edi
80101ce8:	5d                   	pop    %ebp
80101ce9:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101cea:	83 ec 0c             	sub    $0xc,%esp
80101ced:	68 99 72 10 80       	push   $0x80107299
80101cf2:	e8 79 e6 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101cf7:	83 ec 0c             	sub    $0xc,%esp
80101cfa:	68 87 72 10 80       	push   $0x80107287
80101cff:	e8 6c e6 ff ff       	call   80100370 <panic>
80101d04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101d0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101d10 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d10:	55                   	push   %ebp
80101d11:	89 e5                	mov    %esp,%ebp
80101d13:	57                   	push   %edi
80101d14:	56                   	push   %esi
80101d15:	53                   	push   %ebx
80101d16:	89 cf                	mov    %ecx,%edi
80101d18:	89 c3                	mov    %eax,%ebx
80101d1a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101d1d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d20:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101d23:	0f 84 53 01 00 00    	je     80101e7c <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101d29:	e8 42 1b 00 00       	call   80103870 <myproc>
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101d2e:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101d31:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101d34:	68 e0 0a 11 80       	push   $0x80110ae0
80101d39:	e8 e2 26 00 00       	call   80104420 <acquire>
  ip->ref++;
80101d3e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101d42:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
80101d49:	e8 82 27 00 00       	call   801044d0 <release>
80101d4e:	83 c4 10             	add    $0x10,%esp
80101d51:	eb 08                	jmp    80101d5b <namex+0x4b>
80101d53:	90                   	nop
80101d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101d58:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101d5b:	0f b6 03             	movzbl (%ebx),%eax
80101d5e:	3c 2f                	cmp    $0x2f,%al
80101d60:	74 f6                	je     80101d58 <namex+0x48>
    path++;
  if(*path == 0)
80101d62:	84 c0                	test   %al,%al
80101d64:	0f 84 e3 00 00 00    	je     80101e4d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d6a:	0f b6 03             	movzbl (%ebx),%eax
80101d6d:	89 da                	mov    %ebx,%edx
80101d6f:	84 c0                	test   %al,%al
80101d71:	0f 84 ac 00 00 00    	je     80101e23 <namex+0x113>
80101d77:	3c 2f                	cmp    $0x2f,%al
80101d79:	75 09                	jne    80101d84 <namex+0x74>
80101d7b:	e9 a3 00 00 00       	jmp    80101e23 <namex+0x113>
80101d80:	84 c0                	test   %al,%al
80101d82:	74 0a                	je     80101d8e <namex+0x7e>
    path++;
80101d84:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d87:	0f b6 02             	movzbl (%edx),%eax
80101d8a:	3c 2f                	cmp    $0x2f,%al
80101d8c:	75 f2                	jne    80101d80 <namex+0x70>
80101d8e:	89 d1                	mov    %edx,%ecx
80101d90:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101d92:	83 f9 0d             	cmp    $0xd,%ecx
80101d95:	0f 8e 8d 00 00 00    	jle    80101e28 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101d9b:	83 ec 04             	sub    $0x4,%esp
80101d9e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101da1:	6a 0e                	push   $0xe
80101da3:	53                   	push   %ebx
80101da4:	57                   	push   %edi
80101da5:	e8 26 28 00 00       	call   801045d0 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101daa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101dad:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101db0:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101db2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101db5:	75 11                	jne    80101dc8 <namex+0xb8>
80101db7:	89 f6                	mov    %esi,%esi
80101db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101dc0:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101dc3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101dc6:	74 f8                	je     80101dc0 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101dc8:	83 ec 0c             	sub    $0xc,%esp
80101dcb:	56                   	push   %esi
80101dcc:	e8 5f f9 ff ff       	call   80101730 <ilock>
    if(ip->type != T_DIR){
80101dd1:	83 c4 10             	add    $0x10,%esp
80101dd4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101dd9:	0f 85 7f 00 00 00    	jne    80101e5e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101ddf:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101de2:	85 d2                	test   %edx,%edx
80101de4:	74 09                	je     80101def <namex+0xdf>
80101de6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101de9:	0f 84 a3 00 00 00    	je     80101e92 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101def:	83 ec 04             	sub    $0x4,%esp
80101df2:	6a 00                	push   $0x0
80101df4:	57                   	push   %edi
80101df5:	56                   	push   %esi
80101df6:	e8 65 fe ff ff       	call   80101c60 <dirlookup>
80101dfb:	83 c4 10             	add    $0x10,%esp
80101dfe:	85 c0                	test   %eax,%eax
80101e00:	74 5c                	je     80101e5e <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101e02:	83 ec 0c             	sub    $0xc,%esp
80101e05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101e08:	56                   	push   %esi
80101e09:	e8 02 fa ff ff       	call   80101810 <iunlock>
  iput(ip);
80101e0e:	89 34 24             	mov    %esi,(%esp)
80101e11:	e8 4a fa ff ff       	call   80101860 <iput>
80101e16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e19:	83 c4 10             	add    $0x10,%esp
80101e1c:	89 c6                	mov    %eax,%esi
80101e1e:	e9 38 ff ff ff       	jmp    80101d5b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101e23:	31 c9                	xor    %ecx,%ecx
80101e25:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101e28:	83 ec 04             	sub    $0x4,%esp
80101e2b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101e2e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101e31:	51                   	push   %ecx
80101e32:	53                   	push   %ebx
80101e33:	57                   	push   %edi
80101e34:	e8 97 27 00 00       	call   801045d0 <memmove>
    name[len] = 0;
80101e39:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101e3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101e3f:	83 c4 10             	add    $0x10,%esp
80101e42:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101e46:	89 d3                	mov    %edx,%ebx
80101e48:	e9 65 ff ff ff       	jmp    80101db2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101e4d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101e50:	85 c0                	test   %eax,%eax
80101e52:	75 54                	jne    80101ea8 <namex+0x198>
80101e54:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101e56:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e59:	5b                   	pop    %ebx
80101e5a:	5e                   	pop    %esi
80101e5b:	5f                   	pop    %edi
80101e5c:	5d                   	pop    %ebp
80101e5d:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101e5e:	83 ec 0c             	sub    $0xc,%esp
80101e61:	56                   	push   %esi
80101e62:	e8 a9 f9 ff ff       	call   80101810 <iunlock>
  iput(ip);
80101e67:	89 34 24             	mov    %esi,(%esp)
80101e6a:	e8 f1 f9 ff ff       	call   80101860 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101e6f:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101e72:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101e75:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101e77:	5b                   	pop    %ebx
80101e78:	5e                   	pop    %esi
80101e79:	5f                   	pop    %edi
80101e7a:	5d                   	pop    %ebp
80101e7b:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101e7c:	ba 01 00 00 00       	mov    $0x1,%edx
80101e81:	b8 01 00 00 00       	mov    $0x1,%eax
80101e86:	e8 f5 f3 ff ff       	call   80101280 <iget>
80101e8b:	89 c6                	mov    %eax,%esi
80101e8d:	e9 c9 fe ff ff       	jmp    80101d5b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101e92:	83 ec 0c             	sub    $0xc,%esp
80101e95:	56                   	push   %esi
80101e96:	e8 75 f9 ff ff       	call   80101810 <iunlock>
      return ip;
80101e9b:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101e9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101ea1:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101ea3:	5b                   	pop    %ebx
80101ea4:	5e                   	pop    %esi
80101ea5:	5f                   	pop    %edi
80101ea6:	5d                   	pop    %ebp
80101ea7:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101ea8:	83 ec 0c             	sub    $0xc,%esp
80101eab:	56                   	push   %esi
80101eac:	e8 af f9 ff ff       	call   80101860 <iput>
    return 0;
80101eb1:	83 c4 10             	add    $0x10,%esp
80101eb4:	31 c0                	xor    %eax,%eax
80101eb6:	eb 9e                	jmp    80101e56 <namex+0x146>
80101eb8:	90                   	nop
80101eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101ec0 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101ec0:	55                   	push   %ebp
80101ec1:	89 e5                	mov    %esp,%ebp
80101ec3:	57                   	push   %edi
80101ec4:	56                   	push   %esi
80101ec5:	53                   	push   %ebx
80101ec6:	83 ec 20             	sub    $0x20,%esp
80101ec9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101ecc:	6a 00                	push   $0x0
80101ece:	ff 75 0c             	pushl  0xc(%ebp)
80101ed1:	53                   	push   %ebx
80101ed2:	e8 89 fd ff ff       	call   80101c60 <dirlookup>
80101ed7:	83 c4 10             	add    $0x10,%esp
80101eda:	85 c0                	test   %eax,%eax
80101edc:	75 67                	jne    80101f45 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101ede:	8b 7b 58             	mov    0x58(%ebx),%edi
80101ee1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101ee4:	85 ff                	test   %edi,%edi
80101ee6:	74 29                	je     80101f11 <dirlink+0x51>
80101ee8:	31 ff                	xor    %edi,%edi
80101eea:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101eed:	eb 09                	jmp    80101ef8 <dirlink+0x38>
80101eef:	90                   	nop
80101ef0:	83 c7 10             	add    $0x10,%edi
80101ef3:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101ef6:	76 19                	jbe    80101f11 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ef8:	6a 10                	push   $0x10
80101efa:	57                   	push   %edi
80101efb:	56                   	push   %esi
80101efc:	53                   	push   %ebx
80101efd:	e8 0e fb ff ff       	call   80101a10 <readi>
80101f02:	83 c4 10             	add    $0x10,%esp
80101f05:	83 f8 10             	cmp    $0x10,%eax
80101f08:	75 4e                	jne    80101f58 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101f0a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101f0f:	75 df                	jne    80101ef0 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101f11:	8d 45 da             	lea    -0x26(%ebp),%eax
80101f14:	83 ec 04             	sub    $0x4,%esp
80101f17:	6a 0e                	push   $0xe
80101f19:	ff 75 0c             	pushl  0xc(%ebp)
80101f1c:	50                   	push   %eax
80101f1d:	e8 9e 27 00 00       	call   801046c0 <strncpy>
  de.inum = inum;
80101f22:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f25:	6a 10                	push   $0x10
80101f27:	57                   	push   %edi
80101f28:	56                   	push   %esi
80101f29:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101f2a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f2e:	e8 dd fb ff ff       	call   80101b10 <writei>
80101f33:	83 c4 20             	add    $0x20,%esp
80101f36:	83 f8 10             	cmp    $0x10,%eax
80101f39:	75 2a                	jne    80101f65 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101f3b:	31 c0                	xor    %eax,%eax
}
80101f3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f40:	5b                   	pop    %ebx
80101f41:	5e                   	pop    %esi
80101f42:	5f                   	pop    %edi
80101f43:	5d                   	pop    %ebp
80101f44:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101f45:	83 ec 0c             	sub    $0xc,%esp
80101f48:	50                   	push   %eax
80101f49:	e8 12 f9 ff ff       	call   80101860 <iput>
    return -1;
80101f4e:	83 c4 10             	add    $0x10,%esp
80101f51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f56:	eb e5                	jmp    80101f3d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101f58:	83 ec 0c             	sub    $0xc,%esp
80101f5b:	68 a8 72 10 80       	push   $0x801072a8
80101f60:	e8 0b e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101f65:	83 ec 0c             	sub    $0xc,%esp
80101f68:	68 e6 78 10 80       	push   $0x801078e6
80101f6d:	e8 fe e3 ff ff       	call   80100370 <panic>
80101f72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f80 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101f80:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f81:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101f83:	89 e5                	mov    %esp,%ebp
80101f85:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f88:	8b 45 08             	mov    0x8(%ebp),%eax
80101f8b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f8e:	e8 7d fd ff ff       	call   80101d10 <namex>
}
80101f93:	c9                   	leave  
80101f94:	c3                   	ret    
80101f95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fa0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101fa0:	55                   	push   %ebp
  return namex(path, 1, name);
80101fa1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101fa6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101fa8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101fab:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101fae:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101faf:	e9 5c fd ff ff       	jmp    80101d10 <namex>
80101fb4:	66 90                	xchg   %ax,%ax
80101fb6:	66 90                	xchg   %ax,%ax
80101fb8:	66 90                	xchg   %ax,%ax
80101fba:	66 90                	xchg   %ax,%ax
80101fbc:	66 90                	xchg   %ax,%ax
80101fbe:	66 90                	xchg   %ax,%ax

80101fc0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101fc0:	55                   	push   %ebp
  if(b == 0)
80101fc1:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101fc3:	89 e5                	mov    %esp,%ebp
80101fc5:	56                   	push   %esi
80101fc6:	53                   	push   %ebx
  if(b == 0)
80101fc7:	0f 84 ad 00 00 00    	je     8010207a <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101fcd:	8b 58 08             	mov    0x8(%eax),%ebx
80101fd0:	89 c1                	mov    %eax,%ecx
80101fd2:	81 fb 1f 4e 00 00    	cmp    $0x4e1f,%ebx
80101fd8:	0f 87 8f 00 00 00    	ja     8010206d <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fde:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fe3:	90                   	nop
80101fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fe8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fe9:	83 e0 c0             	and    $0xffffffc0,%eax
80101fec:	3c 40                	cmp    $0x40,%al
80101fee:	75 f8                	jne    80101fe8 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101ff0:	31 f6                	xor    %esi,%esi
80101ff2:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101ff7:	89 f0                	mov    %esi,%eax
80101ff9:	ee                   	out    %al,(%dx)
80101ffa:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101fff:	b8 01 00 00 00       	mov    $0x1,%eax
80102004:	ee                   	out    %al,(%dx)
80102005:	ba f3 01 00 00       	mov    $0x1f3,%edx
8010200a:	89 d8                	mov    %ebx,%eax
8010200c:	ee                   	out    %al,(%dx)
8010200d:	89 d8                	mov    %ebx,%eax
8010200f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80102014:	c1 f8 08             	sar    $0x8,%eax
80102017:	ee                   	out    %al,(%dx)
80102018:	ba f5 01 00 00       	mov    $0x1f5,%edx
8010201d:	89 f0                	mov    %esi,%eax
8010201f:	ee                   	out    %al,(%dx)
80102020:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80102024:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102029:	83 e0 01             	and    $0x1,%eax
8010202c:	c1 e0 04             	shl    $0x4,%eax
8010202f:	83 c8 e0             	or     $0xffffffe0,%eax
80102032:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80102033:	f6 01 04             	testb  $0x4,(%ecx)
80102036:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203b:	75 13                	jne    80102050 <idestart+0x90>
8010203d:	b8 20 00 00 00       	mov    $0x20,%eax
80102042:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80102043:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102046:	5b                   	pop    %ebx
80102047:	5e                   	pop    %esi
80102048:	5d                   	pop    %ebp
80102049:	c3                   	ret    
8010204a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102050:	b8 30 00 00 00       	mov    $0x30,%eax
80102055:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80102056:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
8010205b:	8d 71 5c             	lea    0x5c(%ecx),%esi
8010205e:	b9 80 00 00 00       	mov    $0x80,%ecx
80102063:	fc                   	cld    
80102064:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80102066:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102069:	5b                   	pop    %ebx
8010206a:	5e                   	pop    %esi
8010206b:	5d                   	pop    %ebp
8010206c:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
8010206d:	83 ec 0c             	sub    $0xc,%esp
80102070:	68 14 73 10 80       	push   $0x80107314
80102075:	e8 f6 e2 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
8010207a:	83 ec 0c             	sub    $0xc,%esp
8010207d:	68 0b 73 10 80       	push   $0x8010730b
80102082:	e8 e9 e2 ff ff       	call   80100370 <panic>
80102087:	89 f6                	mov    %esi,%esi
80102089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102090 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80102090:	55                   	push   %ebp
80102091:	89 e5                	mov    %esp,%ebp
80102093:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80102096:	68 26 73 10 80       	push   $0x80107326
8010209b:	68 80 a6 10 80       	push   $0x8010a680
801020a0:	e8 1b 22 00 00       	call   801042c0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
801020a5:	58                   	pop    %eax
801020a6:	a1 40 2d 11 80       	mov    0x80112d40,%eax
801020ab:	5a                   	pop    %edx
801020ac:	83 e8 01             	sub    $0x1,%eax
801020af:	50                   	push   %eax
801020b0:	6a 0e                	push   $0xe
801020b2:	e8 a9 02 00 00       	call   80102360 <ioapicenable>
801020b7:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020ba:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020bf:	90                   	nop
801020c0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020c1:	83 e0 c0             	and    $0xffffffc0,%eax
801020c4:	3c 40                	cmp    $0x40,%al
801020c6:	75 f8                	jne    801020c0 <ideinit+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801020c8:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020cd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
801020d2:	ee                   	out    %al,(%dx)
801020d3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020d8:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020dd:	eb 06                	jmp    801020e5 <ideinit+0x55>
801020df:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
801020e0:	83 e9 01             	sub    $0x1,%ecx
801020e3:	74 0f                	je     801020f4 <ideinit+0x64>
801020e5:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
801020e6:	84 c0                	test   %al,%al
801020e8:	74 f6                	je     801020e0 <ideinit+0x50>
      havedisk1 = 1;
801020ea:	c7 05 60 a6 10 80 01 	movl   $0x1,0x8010a660
801020f1:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801020f4:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020f9:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801020fe:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
801020ff:	c9                   	leave  
80102100:	c3                   	ret    
80102101:	eb 0d                	jmp    80102110 <ideintr>
80102103:	90                   	nop
80102104:	90                   	nop
80102105:	90                   	nop
80102106:	90                   	nop
80102107:	90                   	nop
80102108:	90                   	nop
80102109:	90                   	nop
8010210a:	90                   	nop
8010210b:	90                   	nop
8010210c:	90                   	nop
8010210d:	90                   	nop
8010210e:	90                   	nop
8010210f:	90                   	nop

80102110 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102110:	55                   	push   %ebp
80102111:	89 e5                	mov    %esp,%ebp
80102113:	57                   	push   %edi
80102114:	56                   	push   %esi
80102115:	53                   	push   %ebx
80102116:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102119:	68 80 a6 10 80       	push   $0x8010a680
8010211e:	e8 fd 22 00 00       	call   80104420 <acquire>

  if((b = idequeue) == 0){
80102123:	8b 1d 64 a6 10 80    	mov    0x8010a664,%ebx
80102129:	83 c4 10             	add    $0x10,%esp
8010212c:	85 db                	test   %ebx,%ebx
8010212e:	74 34                	je     80102164 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102130:	8b 43 58             	mov    0x58(%ebx),%eax
80102133:	a3 64 a6 10 80       	mov    %eax,0x8010a664

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102138:	8b 33                	mov    (%ebx),%esi
8010213a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102140:	74 3e                	je     80102180 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102142:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102145:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102148:	83 ce 02             	or     $0x2,%esi
8010214b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010214d:	53                   	push   %ebx
8010214e:	e8 8d 1e 00 00       	call   80103fe0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102153:	a1 64 a6 10 80       	mov    0x8010a664,%eax
80102158:	83 c4 10             	add    $0x10,%esp
8010215b:	85 c0                	test   %eax,%eax
8010215d:	74 05                	je     80102164 <ideintr+0x54>
    idestart(idequeue);
8010215f:	e8 5c fe ff ff       	call   80101fc0 <idestart>

  // First queued buffer is the active request.
  acquire(&idelock);

  if((b = idequeue) == 0){
    release(&idelock);
80102164:	83 ec 0c             	sub    $0xc,%esp
80102167:	68 80 a6 10 80       	push   $0x8010a680
8010216c:	e8 5f 23 00 00       	call   801044d0 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
80102171:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102174:	5b                   	pop    %ebx
80102175:	5e                   	pop    %esi
80102176:	5f                   	pop    %edi
80102177:	5d                   	pop    %ebp
80102178:	c3                   	ret    
80102179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102180:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102185:	8d 76 00             	lea    0x0(%esi),%esi
80102188:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102189:	89 c1                	mov    %eax,%ecx
8010218b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010218e:	80 f9 40             	cmp    $0x40,%cl
80102191:	75 f5                	jne    80102188 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80102193:	a8 21                	test   $0x21,%al
80102195:	75 ab                	jne    80102142 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
80102197:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
8010219a:	b9 80 00 00 00       	mov    $0x80,%ecx
8010219f:	ba f0 01 00 00       	mov    $0x1f0,%edx
801021a4:	fc                   	cld    
801021a5:	f3 6d                	rep insl (%dx),%es:(%edi)
801021a7:	8b 33                	mov    (%ebx),%esi
801021a9:	eb 97                	jmp    80102142 <ideintr+0x32>
801021ab:	90                   	nop
801021ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801021b0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801021b0:	55                   	push   %ebp
801021b1:	89 e5                	mov    %esp,%ebp
801021b3:	53                   	push   %ebx
801021b4:	83 ec 10             	sub    $0x10,%esp
801021b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801021ba:	8d 43 0c             	lea    0xc(%ebx),%eax
801021bd:	50                   	push   %eax
801021be:	e8 ad 20 00 00       	call   80104270 <holdingsleep>
801021c3:	83 c4 10             	add    $0x10,%esp
801021c6:	85 c0                	test   %eax,%eax
801021c8:	0f 84 ad 00 00 00    	je     8010227b <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801021ce:	8b 03                	mov    (%ebx),%eax
801021d0:	83 e0 06             	and    $0x6,%eax
801021d3:	83 f8 02             	cmp    $0x2,%eax
801021d6:	0f 84 b9 00 00 00    	je     80102295 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
801021dc:	8b 53 04             	mov    0x4(%ebx),%edx
801021df:	85 d2                	test   %edx,%edx
801021e1:	74 0d                	je     801021f0 <iderw+0x40>
801021e3:	a1 60 a6 10 80       	mov    0x8010a660,%eax
801021e8:	85 c0                	test   %eax,%eax
801021ea:	0f 84 98 00 00 00    	je     80102288 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
801021f0:	83 ec 0c             	sub    $0xc,%esp
801021f3:	68 80 a6 10 80       	push   $0x8010a680
801021f8:	e8 23 22 00 00       	call   80104420 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021fd:	8b 15 64 a6 10 80    	mov    0x8010a664,%edx
80102203:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102206:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010220d:	85 d2                	test   %edx,%edx
8010220f:	75 09                	jne    8010221a <iderw+0x6a>
80102211:	eb 58                	jmp    8010226b <iderw+0xbb>
80102213:	90                   	nop
80102214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102218:	89 c2                	mov    %eax,%edx
8010221a:	8b 42 58             	mov    0x58(%edx),%eax
8010221d:	85 c0                	test   %eax,%eax
8010221f:	75 f7                	jne    80102218 <iderw+0x68>
80102221:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102224:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102226:	3b 1d 64 a6 10 80    	cmp    0x8010a664,%ebx
8010222c:	74 44                	je     80102272 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010222e:	8b 03                	mov    (%ebx),%eax
80102230:	83 e0 06             	and    $0x6,%eax
80102233:	83 f8 02             	cmp    $0x2,%eax
80102236:	74 23                	je     8010225b <iderw+0xab>
80102238:	90                   	nop
80102239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102240:	83 ec 08             	sub    $0x8,%esp
80102243:	68 80 a6 10 80       	push   $0x8010a680
80102248:	53                   	push   %ebx
80102249:	e8 d2 1b 00 00       	call   80103e20 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010224e:	8b 03                	mov    (%ebx),%eax
80102250:	83 c4 10             	add    $0x10,%esp
80102253:	83 e0 06             	and    $0x6,%eax
80102256:	83 f8 02             	cmp    $0x2,%eax
80102259:	75 e5                	jne    80102240 <iderw+0x90>
    sleep(b, &idelock);
  }


  release(&idelock);
8010225b:	c7 45 08 80 a6 10 80 	movl   $0x8010a680,0x8(%ebp)
}
80102262:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102265:	c9                   	leave  
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
80102266:	e9 65 22 00 00       	jmp    801044d0 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010226b:	ba 64 a6 10 80       	mov    $0x8010a664,%edx
80102270:	eb b2                	jmp    80102224 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
80102272:	89 d8                	mov    %ebx,%eax
80102274:	e8 47 fd ff ff       	call   80101fc0 <idestart>
80102279:	eb b3                	jmp    8010222e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
8010227b:	83 ec 0c             	sub    $0xc,%esp
8010227e:	68 2a 73 10 80       	push   $0x8010732a
80102283:	e8 e8 e0 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
80102288:	83 ec 0c             	sub    $0xc,%esp
8010228b:	68 55 73 10 80       	push   $0x80107355
80102290:	e8 db e0 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
80102295:	83 ec 0c             	sub    $0xc,%esp
80102298:	68 40 73 10 80       	push   $0x80107340
8010229d:	e8 ce e0 ff ff       	call   80100370 <panic>
801022a2:	66 90                	xchg   %ax,%ax
801022a4:	66 90                	xchg   %ax,%ax
801022a6:	66 90                	xchg   %ax,%ax
801022a8:	66 90                	xchg   %ax,%ax
801022aa:	66 90                	xchg   %ax,%ax
801022ac:	66 90                	xchg   %ax,%ax
801022ae:	66 90                	xchg   %ax,%ax

801022b0 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
801022b0:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
801022b1:	c7 05 6c 26 11 80 00 	movl   $0xfec00000,0x8011266c
801022b8:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
801022bb:	89 e5                	mov    %esp,%ebp
801022bd:	56                   	push   %esi
801022be:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801022bf:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801022c6:	00 00 00 
  return ioapic->data;
801022c9:	8b 15 6c 26 11 80    	mov    0x8011266c,%edx
801022cf:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801022d2:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
801022d8:	8b 0d 6c 26 11 80    	mov    0x8011266c,%ecx
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801022de:	0f b6 15 a0 27 11 80 	movzbl 0x801127a0,%edx
ioapicinit(void)
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801022e5:	89 f0                	mov    %esi,%eax
801022e7:	c1 e8 10             	shr    $0x10,%eax
801022ea:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
801022ed:	8b 41 10             	mov    0x10(%ecx),%eax
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801022f0:	c1 e8 18             	shr    $0x18,%eax
801022f3:	39 d0                	cmp    %edx,%eax
801022f5:	74 16                	je     8010230d <ioapicinit+0x5d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
801022f7:	83 ec 0c             	sub    $0xc,%esp
801022fa:	68 74 73 10 80       	push   $0x80107374
801022ff:	e8 5c e3 ff ff       	call   80100660 <cprintf>
80102304:	8b 0d 6c 26 11 80    	mov    0x8011266c,%ecx
8010230a:	83 c4 10             	add    $0x10,%esp
8010230d:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102310:	ba 10 00 00 00       	mov    $0x10,%edx
80102315:	b8 20 00 00 00       	mov    $0x20,%eax
8010231a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102320:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102322:	8b 0d 6c 26 11 80    	mov    0x8011266c,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102328:	89 c3                	mov    %eax,%ebx
8010232a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102330:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102333:	89 59 10             	mov    %ebx,0x10(%ecx)
80102336:	8d 5a 01             	lea    0x1(%edx),%ebx
80102339:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010233c:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010233e:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
80102340:	8b 0d 6c 26 11 80    	mov    0x8011266c,%ecx
80102346:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010234d:	75 d1                	jne    80102320 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010234f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102352:	5b                   	pop    %ebx
80102353:	5e                   	pop    %esi
80102354:	5d                   	pop    %ebp
80102355:	c3                   	ret    
80102356:	8d 76 00             	lea    0x0(%esi),%esi
80102359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102360 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80102360:	55                   	push   %ebp
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102361:	8b 0d 6c 26 11 80    	mov    0x8011266c,%ecx
  }
}

void
ioapicenable(int irq, int cpunum)
{
80102367:	89 e5                	mov    %esp,%ebp
80102369:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010236c:	8d 50 20             	lea    0x20(%eax),%edx
8010236f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102373:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102375:	8b 0d 6c 26 11 80    	mov    0x8011266c,%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010237b:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010237e:	89 51 10             	mov    %edx,0x10(%ecx)
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102381:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102384:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102386:	a1 6c 26 11 80       	mov    0x8011266c,%eax
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010238b:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
8010238e:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
80102391:	5d                   	pop    %ebp
80102392:	c3                   	ret    
80102393:	66 90                	xchg   %ax,%ax
80102395:	66 90                	xchg   %ax,%ax
80102397:	66 90                	xchg   %ax,%ax
80102399:	66 90                	xchg   %ax,%ax
8010239b:	66 90                	xchg   %ax,%ax
8010239d:	66 90                	xchg   %ax,%ax
8010239f:	90                   	nop

801023a0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801023a0:	55                   	push   %ebp
801023a1:	89 e5                	mov    %esp,%ebp
801023a3:	53                   	push   %ebx
801023a4:	83 ec 04             	sub    $0x4,%esp
801023a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801023aa:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801023b0:	75 70                	jne    80102422 <kfree+0x82>
801023b2:	81 fb e8 56 11 80    	cmp    $0x801156e8,%ebx
801023b8:	72 68                	jb     80102422 <kfree+0x82>
801023ba:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801023c0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801023c5:	77 5b                	ja     80102422 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801023c7:	83 ec 04             	sub    $0x4,%esp
801023ca:	68 00 10 00 00       	push   $0x1000
801023cf:	6a 01                	push   $0x1
801023d1:	53                   	push   %ebx
801023d2:	e8 49 21 00 00       	call   80104520 <memset>

  if(kmem.use_lock)
801023d7:	8b 15 b4 26 11 80    	mov    0x801126b4,%edx
801023dd:	83 c4 10             	add    $0x10,%esp
801023e0:	85 d2                	test   %edx,%edx
801023e2:	75 2c                	jne    80102410 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
801023e4:	a1 b8 26 11 80       	mov    0x801126b8,%eax
801023e9:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
801023eb:	a1 b4 26 11 80       	mov    0x801126b4,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
801023f0:	89 1d b8 26 11 80    	mov    %ebx,0x801126b8
  if(kmem.use_lock)
801023f6:	85 c0                	test   %eax,%eax
801023f8:	75 06                	jne    80102400 <kfree+0x60>
    release(&kmem.lock);
}
801023fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023fd:	c9                   	leave  
801023fe:	c3                   	ret    
801023ff:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102400:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
}
80102407:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010240a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010240b:	e9 c0 20 00 00       	jmp    801044d0 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102410:	83 ec 0c             	sub    $0xc,%esp
80102413:	68 80 26 11 80       	push   $0x80112680
80102418:	e8 03 20 00 00       	call   80104420 <acquire>
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	eb c2                	jmp    801023e4 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102422:	83 ec 0c             	sub    $0xc,%esp
80102425:	68 a6 73 10 80       	push   $0x801073a6
8010242a:	e8 41 df ff ff       	call   80100370 <panic>
8010242f:	90                   	nop

80102430 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102435:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102438:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010243b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102441:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102447:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244d:	39 de                	cmp    %ebx,%esi
8010244f:	72 23                	jb     80102474 <freerange+0x44>
80102451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102458:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010245e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102461:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102467:	50                   	push   %eax
80102468:	e8 33 ff ff ff       	call   801023a0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	39 f3                	cmp    %esi,%ebx
80102472:	76 e4                	jbe    80102458 <freerange+0x28>
    kfree(p);
}
80102474:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102477:	5b                   	pop    %ebx
80102478:	5e                   	pop    %esi
80102479:	5d                   	pop    %ebp
8010247a:	c3                   	ret    
8010247b:	90                   	nop
8010247c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102480 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
80102480:	55                   	push   %ebp
80102481:	89 e5                	mov    %esp,%ebp
80102483:	56                   	push   %esi
80102484:	53                   	push   %ebx
80102485:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102488:	83 ec 08             	sub    $0x8,%esp
8010248b:	68 ac 73 10 80       	push   $0x801073ac
80102490:	68 80 26 11 80       	push   $0x80112680
80102495:	e8 26 1e 00 00       	call   801042c0 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010249a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010249d:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
801024a0:	c7 05 b4 26 11 80 00 	movl   $0x0,0x801126b4
801024a7:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801024aa:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024b0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024b6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024bc:	39 de                	cmp    %ebx,%esi
801024be:	72 1c                	jb     801024dc <kinit1+0x5c>
    kfree(p);
801024c0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024c6:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024c9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801024cf:	50                   	push   %eax
801024d0:	e8 cb fe ff ff       	call   801023a0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024d5:	83 c4 10             	add    $0x10,%esp
801024d8:	39 de                	cmp    %ebx,%esi
801024da:	73 e4                	jae    801024c0 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
801024dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024df:	5b                   	pop    %ebx
801024e0:	5e                   	pop    %esi
801024e1:	5d                   	pop    %ebp
801024e2:	c3                   	ret    
801024e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024f0 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
801024f0:	55                   	push   %ebp
801024f1:	89 e5                	mov    %esp,%ebp
801024f3:	56                   	push   %esi
801024f4:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801024f5:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
801024f8:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801024fb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102501:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102507:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010250d:	39 de                	cmp    %ebx,%esi
8010250f:	72 23                	jb     80102534 <kinit2+0x44>
80102511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102518:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010251e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102521:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102527:	50                   	push   %eax
80102528:	e8 73 fe ff ff       	call   801023a0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010252d:	83 c4 10             	add    $0x10,%esp
80102530:	39 de                	cmp    %ebx,%esi
80102532:	73 e4                	jae    80102518 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
80102534:	c7 05 b4 26 11 80 01 	movl   $0x1,0x801126b4
8010253b:	00 00 00 
}
8010253e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102541:	5b                   	pop    %ebx
80102542:	5e                   	pop    %esi
80102543:	5d                   	pop    %ebp
80102544:	c3                   	ret    
80102545:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102550 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102550:	55                   	push   %ebp
80102551:	89 e5                	mov    %esp,%ebp
80102553:	53                   	push   %ebx
80102554:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102557:	a1 b4 26 11 80       	mov    0x801126b4,%eax
8010255c:	85 c0                	test   %eax,%eax
8010255e:	75 30                	jne    80102590 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102560:	8b 1d b8 26 11 80    	mov    0x801126b8,%ebx
  if(r)
80102566:	85 db                	test   %ebx,%ebx
80102568:	74 1c                	je     80102586 <kalloc+0x36>
    kmem.freelist = r->next;
8010256a:	8b 13                	mov    (%ebx),%edx
8010256c:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
  if(kmem.use_lock)
80102572:	85 c0                	test   %eax,%eax
80102574:	74 10                	je     80102586 <kalloc+0x36>
    release(&kmem.lock);
80102576:	83 ec 0c             	sub    $0xc,%esp
80102579:	68 80 26 11 80       	push   $0x80112680
8010257e:	e8 4d 1f 00 00       	call   801044d0 <release>
80102583:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
80102586:	89 d8                	mov    %ebx,%eax
80102588:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010258b:	c9                   	leave  
8010258c:	c3                   	ret    
8010258d:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102590:	83 ec 0c             	sub    $0xc,%esp
80102593:	68 80 26 11 80       	push   $0x80112680
80102598:	e8 83 1e 00 00       	call   80104420 <acquire>
  r = kmem.freelist;
8010259d:	8b 1d b8 26 11 80    	mov    0x801126b8,%ebx
  if(r)
801025a3:	83 c4 10             	add    $0x10,%esp
801025a6:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801025ab:	85 db                	test   %ebx,%ebx
801025ad:	75 bb                	jne    8010256a <kalloc+0x1a>
801025af:	eb c1                	jmp    80102572 <kalloc+0x22>
801025b1:	66 90                	xchg   %ax,%ax
801025b3:	66 90                	xchg   %ax,%ax
801025b5:	66 90                	xchg   %ax,%ax
801025b7:	66 90                	xchg   %ax,%ax
801025b9:	66 90                	xchg   %ax,%ax
801025bb:	66 90                	xchg   %ax,%ax
801025bd:	66 90                	xchg   %ax,%ax
801025bf:	90                   	nop

801025c0 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
801025c0:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025c1:	ba 64 00 00 00       	mov    $0x64,%edx
801025c6:	89 e5                	mov    %esp,%ebp
801025c8:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801025c9:	a8 01                	test   $0x1,%al
801025cb:	0f 84 af 00 00 00    	je     80102680 <kbdgetc+0xc0>
801025d1:	ba 60 00 00 00       	mov    $0x60,%edx
801025d6:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
801025d7:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
801025da:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801025e0:	74 7e                	je     80102660 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801025e2:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801025e4:	8b 0d b4 a6 10 80    	mov    0x8010a6b4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801025ea:	79 24                	jns    80102610 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801025ec:	f6 c1 40             	test   $0x40,%cl
801025ef:	75 05                	jne    801025f6 <kbdgetc+0x36>
801025f1:	89 c2                	mov    %eax,%edx
801025f3:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
801025f6:	0f b6 82 e0 74 10 80 	movzbl -0x7fef8b20(%edx),%eax
801025fd:	83 c8 40             	or     $0x40,%eax
80102600:	0f b6 c0             	movzbl %al,%eax
80102603:	f7 d0                	not    %eax
80102605:	21 c8                	and    %ecx,%eax
80102607:	a3 b4 a6 10 80       	mov    %eax,0x8010a6b4
    return 0;
8010260c:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010260e:	5d                   	pop    %ebp
8010260f:	c3                   	ret    
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102610:	f6 c1 40             	test   $0x40,%cl
80102613:	74 09                	je     8010261e <kbdgetc+0x5e>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102615:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102618:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010261b:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
8010261e:	0f b6 82 e0 74 10 80 	movzbl -0x7fef8b20(%edx),%eax
80102625:	09 c1                	or     %eax,%ecx
80102627:	0f b6 82 e0 73 10 80 	movzbl -0x7fef8c20(%edx),%eax
8010262e:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102630:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102632:	89 0d b4 a6 10 80    	mov    %ecx,0x8010a6b4
  c = charcode[shift & (CTL | SHIFT)][data];
80102638:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
8010263b:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010263e:	8b 04 85 c0 73 10 80 	mov    -0x7fef8c40(,%eax,4),%eax
80102645:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
80102649:	74 c3                	je     8010260e <kbdgetc+0x4e>
    if('a' <= c && c <= 'z')
8010264b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010264e:	83 fa 19             	cmp    $0x19,%edx
80102651:	77 1d                	ja     80102670 <kbdgetc+0xb0>
      c += 'A' - 'a';
80102653:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102656:	5d                   	pop    %ebp
80102657:	c3                   	ret    
80102658:	90                   	nop
80102659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
80102660:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
80102662:	83 0d b4 a6 10 80 40 	orl    $0x40,0x8010a6b4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102669:	5d                   	pop    %ebp
8010266a:	c3                   	ret    
8010266b:	90                   	nop
8010266c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
80102670:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
80102673:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
80102676:	5d                   	pop    %ebp
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
80102677:	83 f9 19             	cmp    $0x19,%ecx
8010267a:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
8010267d:	c3                   	ret    
8010267e:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
80102680:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102685:	5d                   	pop    %ebp
80102686:	c3                   	ret    
80102687:	89 f6                	mov    %esi,%esi
80102689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102690 <kbdintr>:

void
kbdintr(void)
{
80102690:	55                   	push   %ebp
80102691:	89 e5                	mov    %esp,%ebp
80102693:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102696:	68 c0 25 10 80       	push   $0x801025c0
8010269b:	e8 50 e1 ff ff       	call   801007f0 <consoleintr>
}
801026a0:	83 c4 10             	add    $0x10,%esp
801026a3:	c9                   	leave  
801026a4:	c3                   	ret    
801026a5:	66 90                	xchg   %ax,%ax
801026a7:	66 90                	xchg   %ax,%ax
801026a9:	66 90                	xchg   %ax,%ax
801026ab:	66 90                	xchg   %ax,%ax
801026ad:	66 90                	xchg   %ax,%ax
801026af:	90                   	nop

801026b0 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
801026b0:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  lapic[ID];  // wait for write to finish, by reading
}

void
lapicinit(void)
{
801026b5:	55                   	push   %ebp
801026b6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
801026b8:	85 c0                	test   %eax,%eax
801026ba:	0f 84 c8 00 00 00    	je     80102788 <lapicinit+0xd8>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026c0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801026c7:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026ca:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026cd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801026d4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026d7:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026da:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026e1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801026e4:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026e7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026ee:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026f1:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026f4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026fb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026fe:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102701:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102708:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010270b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010270e:	8b 50 30             	mov    0x30(%eax),%edx
80102711:	c1 ea 10             	shr    $0x10,%edx
80102714:	80 fa 03             	cmp    $0x3,%dl
80102717:	77 77                	ja     80102790 <lapicinit+0xe0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102719:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102720:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102723:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102726:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010272d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102730:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102733:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010273a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010273d:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102740:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102747:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010274a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010274d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102754:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102757:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010275a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102761:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102764:	8b 50 20             	mov    0x20(%eax),%edx
80102767:	89 f6                	mov    %esi,%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102770:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102776:	80 e6 10             	and    $0x10,%dh
80102779:	75 f5                	jne    80102770 <lapicinit+0xc0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010277b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102782:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102785:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102788:	5d                   	pop    %ebp
80102789:	c3                   	ret    
8010278a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102790:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102797:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010279a:	8b 50 20             	mov    0x20(%eax),%edx
8010279d:	e9 77 ff ff ff       	jmp    80102719 <lapicinit+0x69>
801027a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801027a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027b0 <lapicid>:
}

int
lapicid(void)
{
  if (!lapic)
801027b0:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  lapicw(TPR, 0);
}

int
lapicid(void)
{
801027b5:	55                   	push   %ebp
801027b6:	89 e5                	mov    %esp,%ebp
  if (!lapic)
801027b8:	85 c0                	test   %eax,%eax
801027ba:	74 0c                	je     801027c8 <lapicid+0x18>
    return 0;
  return lapic[ID] >> 24;
801027bc:	8b 40 20             	mov    0x20(%eax),%eax
}
801027bf:	5d                   	pop    %ebp
int
lapicid(void)
{
  if (!lapic)
    return 0;
  return lapic[ID] >> 24;
801027c0:	c1 e8 18             	shr    $0x18,%eax
}
801027c3:	c3                   	ret    
801027c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

int
lapicid(void)
{
  if (!lapic)
    return 0;
801027c8:	31 c0                	xor    %eax,%eax
  return lapic[ID] >> 24;
}
801027ca:	5d                   	pop    %ebp
801027cb:	c3                   	ret    
801027cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027d0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
801027d0:	a1 bc 26 11 80       	mov    0x801126bc,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
801027d5:	55                   	push   %ebp
801027d6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801027d8:	85 c0                	test   %eax,%eax
801027da:	74 0d                	je     801027e9 <lapiceoi+0x19>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027dc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027e3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027e6:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
801027e9:	5d                   	pop    %ebp
801027ea:	c3                   	ret    
801027eb:	90                   	nop
801027ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027f0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801027f0:	55                   	push   %ebp
801027f1:	89 e5                	mov    %esp,%ebp
}
801027f3:	5d                   	pop    %ebp
801027f4:	c3                   	ret    
801027f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102800 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102800:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102801:	ba 70 00 00 00       	mov    $0x70,%edx
80102806:	b8 0f 00 00 00       	mov    $0xf,%eax
8010280b:	89 e5                	mov    %esp,%ebp
8010280d:	53                   	push   %ebx
8010280e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102811:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102814:	ee                   	out    %al,(%dx)
80102815:	ba 71 00 00 00       	mov    $0x71,%edx
8010281a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010281f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102820:	31 c0                	xor    %eax,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102822:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102825:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010282b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010282d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102830:	c1 e8 04             	shr    $0x4,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102833:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102835:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102838:	66 a3 69 04 00 80    	mov    %ax,0x80000469

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010283e:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102843:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102849:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010284c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102853:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102856:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102859:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102860:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102863:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102866:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010286c:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010286f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102875:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102878:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010287e:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102881:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102887:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
8010288a:	5b                   	pop    %ebx
8010288b:	5d                   	pop    %ebp
8010288c:	c3                   	ret    
8010288d:	8d 76 00             	lea    0x0(%esi),%esi

80102890 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102890:	55                   	push   %ebp
80102891:	ba 70 00 00 00       	mov    $0x70,%edx
80102896:	b8 0b 00 00 00       	mov    $0xb,%eax
8010289b:	89 e5                	mov    %esp,%ebp
8010289d:	57                   	push   %edi
8010289e:	56                   	push   %esi
8010289f:	53                   	push   %ebx
801028a0:	83 ec 4c             	sub    $0x4c,%esp
801028a3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028a4:	ba 71 00 00 00       	mov    $0x71,%edx
801028a9:	ec                   	in     (%dx),%al
801028aa:	83 e0 04             	and    $0x4,%eax
801028ad:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b0:	31 db                	xor    %ebx,%ebx
801028b2:	88 45 b7             	mov    %al,-0x49(%ebp)
801028b5:	bf 70 00 00 00       	mov    $0x70,%edi
801028ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801028c0:	89 d8                	mov    %ebx,%eax
801028c2:	89 fa                	mov    %edi,%edx
801028c4:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028c5:	b9 71 00 00 00       	mov    $0x71,%ecx
801028ca:	89 ca                	mov    %ecx,%edx
801028cc:	ec                   	in     (%dx),%al
}

static void
fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
801028cd:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d0:	89 fa                	mov    %edi,%edx
801028d2:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028d5:	b8 02 00 00 00       	mov    $0x2,%eax
801028da:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028db:	89 ca                	mov    %ecx,%edx
801028dd:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
801028de:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e1:	89 fa                	mov    %edi,%edx
801028e3:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028e6:	b8 04 00 00 00       	mov    $0x4,%eax
801028eb:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ec:	89 ca                	mov    %ecx,%edx
801028ee:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801028ef:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028f2:	89 fa                	mov    %edi,%edx
801028f4:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028f7:	b8 07 00 00 00       	mov    $0x7,%eax
801028fc:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028fd:	89 ca                	mov    %ecx,%edx
801028ff:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102900:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102903:	89 fa                	mov    %edi,%edx
80102905:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102908:	b8 08 00 00 00       	mov    $0x8,%eax
8010290d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010290e:	89 ca                	mov    %ecx,%edx
80102910:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102911:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102914:	89 fa                	mov    %edi,%edx
80102916:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102919:	b8 09 00 00 00       	mov    $0x9,%eax
8010291e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010291f:	89 ca                	mov    %ecx,%edx
80102921:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102922:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102925:	89 fa                	mov    %edi,%edx
80102927:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010292a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010292f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102930:	89 ca                	mov    %ecx,%edx
80102932:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102933:	84 c0                	test   %al,%al
80102935:	78 89                	js     801028c0 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102937:	89 d8                	mov    %ebx,%eax
80102939:	89 fa                	mov    %edi,%edx
8010293b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010293c:	89 ca                	mov    %ecx,%edx
8010293e:	ec                   	in     (%dx),%al
}

static void
fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010293f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102942:	89 fa                	mov    %edi,%edx
80102944:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102947:	b8 02 00 00 00       	mov    $0x2,%eax
8010294c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010294d:	89 ca                	mov    %ecx,%edx
8010294f:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
80102950:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102953:	89 fa                	mov    %edi,%edx
80102955:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102958:	b8 04 00 00 00       	mov    $0x4,%eax
8010295d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010295e:	89 ca                	mov    %ecx,%edx
80102960:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
80102961:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102964:	89 fa                	mov    %edi,%edx
80102966:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102969:	b8 07 00 00 00       	mov    $0x7,%eax
8010296e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010296f:	89 ca                	mov    %ecx,%edx
80102971:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102972:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102975:	89 fa                	mov    %edi,%edx
80102977:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010297a:	b8 08 00 00 00       	mov    $0x8,%eax
8010297f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102980:	89 ca                	mov    %ecx,%edx
80102982:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102983:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102986:	89 fa                	mov    %edi,%edx
80102988:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010298b:	b8 09 00 00 00       	mov    $0x9,%eax
80102990:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102991:	89 ca                	mov    %ecx,%edx
80102993:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102994:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102997:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
8010299a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010299d:	8d 45 b8             	lea    -0x48(%ebp),%eax
801029a0:	6a 18                	push   $0x18
801029a2:	56                   	push   %esi
801029a3:	50                   	push   %eax
801029a4:	e8 c7 1b 00 00       	call   80104570 <memcmp>
801029a9:	83 c4 10             	add    $0x10,%esp
801029ac:	85 c0                	test   %eax,%eax
801029ae:	0f 85 0c ff ff ff    	jne    801028c0 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
801029b4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801029b8:	75 78                	jne    80102a32 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801029ba:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029bd:	89 c2                	mov    %eax,%edx
801029bf:	83 e0 0f             	and    $0xf,%eax
801029c2:	c1 ea 04             	shr    $0x4,%edx
801029c5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029c8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029cb:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801029ce:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029d1:	89 c2                	mov    %eax,%edx
801029d3:	83 e0 0f             	and    $0xf,%eax
801029d6:	c1 ea 04             	shr    $0x4,%edx
801029d9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029dc:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029df:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801029e2:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e5:	89 c2                	mov    %eax,%edx
801029e7:	83 e0 0f             	and    $0xf,%eax
801029ea:	c1 ea 04             	shr    $0x4,%edx
801029ed:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029f0:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029f3:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
801029f6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029f9:	89 c2                	mov    %eax,%edx
801029fb:	83 e0 0f             	and    $0xf,%eax
801029fe:	c1 ea 04             	shr    $0x4,%edx
80102a01:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a04:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a07:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102a0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a0d:	89 c2                	mov    %eax,%edx
80102a0f:	83 e0 0f             	and    $0xf,%eax
80102a12:	c1 ea 04             	shr    $0x4,%edx
80102a15:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a18:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a1b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102a1e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a21:	89 c2                	mov    %eax,%edx
80102a23:	83 e0 0f             	and    $0xf,%eax
80102a26:	c1 ea 04             	shr    $0x4,%edx
80102a29:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a2c:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a2f:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102a32:	8b 75 08             	mov    0x8(%ebp),%esi
80102a35:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a38:	89 06                	mov    %eax,(%esi)
80102a3a:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a3d:	89 46 04             	mov    %eax,0x4(%esi)
80102a40:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a43:	89 46 08             	mov    %eax,0x8(%esi)
80102a46:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a49:	89 46 0c             	mov    %eax,0xc(%esi)
80102a4c:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a4f:	89 46 10             	mov    %eax,0x10(%esi)
80102a52:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a55:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102a58:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a62:	5b                   	pop    %ebx
80102a63:	5e                   	pop    %esi
80102a64:	5f                   	pop    %edi
80102a65:	5d                   	pop    %ebp
80102a66:	c3                   	ret    
80102a67:	66 90                	xchg   %ax,%ax
80102a69:	66 90                	xchg   %ax,%ax
80102a6b:	66 90                	xchg   %ax,%ax
80102a6d:	66 90                	xchg   %ax,%ax
80102a6f:	90                   	nop

80102a70 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a70:	8b 0d 08 27 11 80    	mov    0x80112708,%ecx
80102a76:	85 c9                	test   %ecx,%ecx
80102a78:	0f 8e 85 00 00 00    	jle    80102b03 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102a7e:	55                   	push   %ebp
80102a7f:	89 e5                	mov    %esp,%ebp
80102a81:	57                   	push   %edi
80102a82:	56                   	push   %esi
80102a83:	53                   	push   %ebx
80102a84:	31 db                	xor    %ebx,%ebx
80102a86:	83 ec 0c             	sub    $0xc,%esp
80102a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102a90:	a1 f4 26 11 80       	mov    0x801126f4,%eax
80102a95:	83 ec 08             	sub    $0x8,%esp
80102a98:	01 d8                	add    %ebx,%eax
80102a9a:	83 c0 01             	add    $0x1,%eax
80102a9d:	50                   	push   %eax
80102a9e:	ff 35 04 27 11 80    	pushl  0x80112704
80102aa4:	e8 27 d6 ff ff       	call   801000d0 <bread>
80102aa9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102aab:	58                   	pop    %eax
80102aac:	5a                   	pop    %edx
80102aad:	ff 34 9d 0c 27 11 80 	pushl  -0x7feed8f4(,%ebx,4)
80102ab4:	ff 35 04 27 11 80    	pushl  0x80112704
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102aba:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102abd:	e8 0e d6 ff ff       	call   801000d0 <bread>
80102ac2:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102ac4:	8d 47 5c             	lea    0x5c(%edi),%eax
80102ac7:	83 c4 0c             	add    $0xc,%esp
80102aca:	68 00 02 00 00       	push   $0x200
80102acf:	50                   	push   %eax
80102ad0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102ad3:	50                   	push   %eax
80102ad4:	e8 f7 1a 00 00       	call   801045d0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102ad9:	89 34 24             	mov    %esi,(%esp)
80102adc:	e8 bf d6 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102ae1:	89 3c 24             	mov    %edi,(%esp)
80102ae4:	e8 f7 d6 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102ae9:	89 34 24             	mov    %esi,(%esp)
80102aec:	e8 ef d6 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102af1:	83 c4 10             	add    $0x10,%esp
80102af4:	39 1d 08 27 11 80    	cmp    %ebx,0x80112708
80102afa:	7f 94                	jg     80102a90 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102afc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102aff:	5b                   	pop    %ebx
80102b00:	5e                   	pop    %esi
80102b01:	5f                   	pop    %edi
80102b02:	5d                   	pop    %ebp
80102b03:	f3 c3                	repz ret 
80102b05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b10 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102b17:	ff 35 f4 26 11 80    	pushl  0x801126f4
80102b1d:	ff 35 04 27 11 80    	pushl  0x80112704
80102b23:	e8 a8 d5 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102b28:	8b 0d 08 27 11 80    	mov    0x80112708,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102b2e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b31:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102b33:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102b35:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102b38:	7e 1f                	jle    80102b59 <write_head+0x49>
80102b3a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102b41:	31 d2                	xor    %edx,%edx
80102b43:	90                   	nop
80102b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102b48:	8b 8a 0c 27 11 80    	mov    -0x7feed8f4(%edx),%ecx
80102b4e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102b52:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102b55:	39 c2                	cmp    %eax,%edx
80102b57:	75 ef                	jne    80102b48 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102b59:	83 ec 0c             	sub    $0xc,%esp
80102b5c:	53                   	push   %ebx
80102b5d:	e8 3e d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102b62:	89 1c 24             	mov    %ebx,(%esp)
80102b65:	e8 76 d6 ff ff       	call   801001e0 <brelse>
}
80102b6a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b6d:	c9                   	leave  
80102b6e:	c3                   	ret    
80102b6f:	90                   	nop

80102b70 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102b70:	55                   	push   %ebp
80102b71:	89 e5                	mov    %esp,%ebp
80102b73:	53                   	push   %ebx
80102b74:	83 ec 2c             	sub    $0x2c,%esp
80102b77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102b7a:	68 e0 75 10 80       	push   $0x801075e0
80102b7f:	68 c0 26 11 80       	push   $0x801126c0
80102b84:	e8 37 17 00 00       	call   801042c0 <initlock>
  readsb(dev, &sb);
80102b89:	58                   	pop    %eax
80102b8a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b8d:	5a                   	pop    %edx
80102b8e:	50                   	push   %eax
80102b8f:	53                   	push   %ebx
80102b90:	e8 5b e9 ff ff       	call   801014f0 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b95:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b98:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b9b:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102b9c:	89 1d 04 27 11 80    	mov    %ebx,0x80112704

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102ba2:	89 15 f8 26 11 80    	mov    %edx,0x801126f8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102ba8:	a3 f4 26 11 80       	mov    %eax,0x801126f4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102bad:	5a                   	pop    %edx
80102bae:	50                   	push   %eax
80102baf:	53                   	push   %ebx
80102bb0:	e8 1b d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102bb5:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102bb8:	83 c4 10             	add    $0x10,%esp
80102bbb:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102bbd:	89 0d 08 27 11 80    	mov    %ecx,0x80112708
  for (i = 0; i < log.lh.n; i++) {
80102bc3:	7e 1c                	jle    80102be1 <initlog+0x71>
80102bc5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102bcc:	31 d2                	xor    %edx,%edx
80102bce:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102bd0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102bd4:	83 c2 04             	add    $0x4,%edx
80102bd7:	89 8a 08 27 11 80    	mov    %ecx,-0x7feed8f8(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102bdd:	39 da                	cmp    %ebx,%edx
80102bdf:	75 ef                	jne    80102bd0 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102be1:	83 ec 0c             	sub    $0xc,%esp
80102be4:	50                   	push   %eax
80102be5:	e8 f6 d5 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102bea:	e8 81 fe ff ff       	call   80102a70 <install_trans>
  log.lh.n = 0;
80102bef:	c7 05 08 27 11 80 00 	movl   $0x0,0x80112708
80102bf6:	00 00 00 
  write_head(); // clear the log
80102bf9:	e8 12 ff ff ff       	call   80102b10 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102bfe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c01:	c9                   	leave  
80102c02:	c3                   	ret    
80102c03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c10 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102c10:	55                   	push   %ebp
80102c11:	89 e5                	mov    %esp,%ebp
80102c13:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102c16:	68 c0 26 11 80       	push   $0x801126c0
80102c1b:	e8 00 18 00 00       	call   80104420 <acquire>
80102c20:	83 c4 10             	add    $0x10,%esp
80102c23:	eb 18                	jmp    80102c3d <begin_op+0x2d>
80102c25:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102c28:	83 ec 08             	sub    $0x8,%esp
80102c2b:	68 c0 26 11 80       	push   $0x801126c0
80102c30:	68 c0 26 11 80       	push   $0x801126c0
80102c35:	e8 e6 11 00 00       	call   80103e20 <sleep>
80102c3a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102c3d:	a1 00 27 11 80       	mov    0x80112700,%eax
80102c42:	85 c0                	test   %eax,%eax
80102c44:	75 e2                	jne    80102c28 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102c46:	a1 fc 26 11 80       	mov    0x801126fc,%eax
80102c4b:	8b 15 08 27 11 80    	mov    0x80112708,%edx
80102c51:	83 c0 01             	add    $0x1,%eax
80102c54:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c57:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c5a:	83 fa 1e             	cmp    $0x1e,%edx
80102c5d:	7f c9                	jg     80102c28 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102c5f:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102c62:	a3 fc 26 11 80       	mov    %eax,0x801126fc
      release(&log.lock);
80102c67:	68 c0 26 11 80       	push   $0x801126c0
80102c6c:	e8 5f 18 00 00       	call   801044d0 <release>
      break;
    }
  }
}
80102c71:	83 c4 10             	add    $0x10,%esp
80102c74:	c9                   	leave  
80102c75:	c3                   	ret    
80102c76:	8d 76 00             	lea    0x0(%esi),%esi
80102c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c80 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102c80:	55                   	push   %ebp
80102c81:	89 e5                	mov    %esp,%ebp
80102c83:	57                   	push   %edi
80102c84:	56                   	push   %esi
80102c85:	53                   	push   %ebx
80102c86:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102c89:	68 c0 26 11 80       	push   $0x801126c0
80102c8e:	e8 8d 17 00 00       	call   80104420 <acquire>
  log.outstanding -= 1;
80102c93:	a1 fc 26 11 80       	mov    0x801126fc,%eax
  if(log.committing)
80102c98:	8b 1d 00 27 11 80    	mov    0x80112700,%ebx
80102c9e:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102ca1:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102ca4:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102ca6:	a3 fc 26 11 80       	mov    %eax,0x801126fc
  if(log.committing)
80102cab:	0f 85 23 01 00 00    	jne    80102dd4 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102cb1:	85 c0                	test   %eax,%eax
80102cb3:	0f 85 f7 00 00 00    	jne    80102db0 <end_op+0x130>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102cb9:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102cbc:	c7 05 00 27 11 80 01 	movl   $0x1,0x80112700
80102cc3:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102cc6:	31 db                	xor    %ebx,%ebx
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102cc8:	68 c0 26 11 80       	push   $0x801126c0
80102ccd:	e8 fe 17 00 00       	call   801044d0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102cd2:	8b 0d 08 27 11 80    	mov    0x80112708,%ecx
80102cd8:	83 c4 10             	add    $0x10,%esp
80102cdb:	85 c9                	test   %ecx,%ecx
80102cdd:	0f 8e 8a 00 00 00    	jle    80102d6d <end_op+0xed>
80102ce3:	90                   	nop
80102ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102ce8:	a1 f4 26 11 80       	mov    0x801126f4,%eax
80102ced:	83 ec 08             	sub    $0x8,%esp
80102cf0:	01 d8                	add    %ebx,%eax
80102cf2:	83 c0 01             	add    $0x1,%eax
80102cf5:	50                   	push   %eax
80102cf6:	ff 35 04 27 11 80    	pushl  0x80112704
80102cfc:	e8 cf d3 ff ff       	call   801000d0 <bread>
80102d01:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d03:	58                   	pop    %eax
80102d04:	5a                   	pop    %edx
80102d05:	ff 34 9d 0c 27 11 80 	pushl  -0x7feed8f4(,%ebx,4)
80102d0c:	ff 35 04 27 11 80    	pushl  0x80112704
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102d12:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d15:	e8 b6 d3 ff ff       	call   801000d0 <bread>
80102d1a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102d1c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d1f:	83 c4 0c             	add    $0xc,%esp
80102d22:	68 00 02 00 00       	push   $0x200
80102d27:	50                   	push   %eax
80102d28:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d2b:	50                   	push   %eax
80102d2c:	e8 9f 18 00 00       	call   801045d0 <memmove>
    bwrite(to);  // write the log
80102d31:	89 34 24             	mov    %esi,(%esp)
80102d34:	e8 67 d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102d39:	89 3c 24             	mov    %edi,(%esp)
80102d3c:	e8 9f d4 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102d41:	89 34 24             	mov    %esi,(%esp)
80102d44:	e8 97 d4 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102d49:	83 c4 10             	add    $0x10,%esp
80102d4c:	3b 1d 08 27 11 80    	cmp    0x80112708,%ebx
80102d52:	7c 94                	jl     80102ce8 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102d54:	e8 b7 fd ff ff       	call   80102b10 <write_head>
    install_trans(); // Now install writes to home locations
80102d59:	e8 12 fd ff ff       	call   80102a70 <install_trans>
    log.lh.n = 0;
80102d5e:	c7 05 08 27 11 80 00 	movl   $0x0,0x80112708
80102d65:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d68:	e8 a3 fd ff ff       	call   80102b10 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102d6d:	83 ec 0c             	sub    $0xc,%esp
80102d70:	68 c0 26 11 80       	push   $0x801126c0
80102d75:	e8 a6 16 00 00       	call   80104420 <acquire>
    log.committing = 0;
    wakeup(&log);
80102d7a:	c7 04 24 c0 26 11 80 	movl   $0x801126c0,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102d81:	c7 05 00 27 11 80 00 	movl   $0x0,0x80112700
80102d88:	00 00 00 
    wakeup(&log);
80102d8b:	e8 50 12 00 00       	call   80103fe0 <wakeup>
    release(&log.lock);
80102d90:	c7 04 24 c0 26 11 80 	movl   $0x801126c0,(%esp)
80102d97:	e8 34 17 00 00       	call   801044d0 <release>
80102d9c:	83 c4 10             	add    $0x10,%esp
  }
}
80102d9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102da2:	5b                   	pop    %ebx
80102da3:	5e                   	pop    %esi
80102da4:	5f                   	pop    %edi
80102da5:	5d                   	pop    %ebp
80102da6:	c3                   	ret    
80102da7:	89 f6                	mov    %esi,%esi
80102da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
80102db0:	83 ec 0c             	sub    $0xc,%esp
80102db3:	68 c0 26 11 80       	push   $0x801126c0
80102db8:	e8 23 12 00 00       	call   80103fe0 <wakeup>
  }
  release(&log.lock);
80102dbd:	c7 04 24 c0 26 11 80 	movl   $0x801126c0,(%esp)
80102dc4:	e8 07 17 00 00       	call   801044d0 <release>
80102dc9:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102dcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dcf:	5b                   	pop    %ebx
80102dd0:	5e                   	pop    %esi
80102dd1:	5f                   	pop    %edi
80102dd2:	5d                   	pop    %ebp
80102dd3:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102dd4:	83 ec 0c             	sub    $0xc,%esp
80102dd7:	68 e4 75 10 80       	push   $0x801075e4
80102ddc:	e8 8f d5 ff ff       	call   80100370 <panic>
80102de1:	eb 0d                	jmp    80102df0 <log_write>
80102de3:	90                   	nop
80102de4:	90                   	nop
80102de5:	90                   	nop
80102de6:	90                   	nop
80102de7:	90                   	nop
80102de8:	90                   	nop
80102de9:	90                   	nop
80102dea:	90                   	nop
80102deb:	90                   	nop
80102dec:	90                   	nop
80102ded:	90                   	nop
80102dee:	90                   	nop
80102def:	90                   	nop

80102df0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	53                   	push   %ebx
80102df4:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102df7:	8b 15 08 27 11 80    	mov    0x80112708,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102dfd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102e00:	83 fa 1d             	cmp    $0x1d,%edx
80102e03:	0f 8f 97 00 00 00    	jg     80102ea0 <log_write+0xb0>
80102e09:	a1 f8 26 11 80       	mov    0x801126f8,%eax
80102e0e:	83 e8 01             	sub    $0x1,%eax
80102e11:	39 c2                	cmp    %eax,%edx
80102e13:	0f 8d 87 00 00 00    	jge    80102ea0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102e19:	a1 fc 26 11 80       	mov    0x801126fc,%eax
80102e1e:	85 c0                	test   %eax,%eax
80102e20:	0f 8e 87 00 00 00    	jle    80102ead <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102e26:	83 ec 0c             	sub    $0xc,%esp
80102e29:	68 c0 26 11 80       	push   $0x801126c0
80102e2e:	e8 ed 15 00 00       	call   80104420 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102e33:	8b 15 08 27 11 80    	mov    0x80112708,%edx
80102e39:	83 c4 10             	add    $0x10,%esp
80102e3c:	83 fa 00             	cmp    $0x0,%edx
80102e3f:	7e 50                	jle    80102e91 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e41:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102e44:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e46:	3b 0d 0c 27 11 80    	cmp    0x8011270c,%ecx
80102e4c:	75 0b                	jne    80102e59 <log_write+0x69>
80102e4e:	eb 38                	jmp    80102e88 <log_write+0x98>
80102e50:	39 0c 85 0c 27 11 80 	cmp    %ecx,-0x7feed8f4(,%eax,4)
80102e57:	74 2f                	je     80102e88 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102e59:	83 c0 01             	add    $0x1,%eax
80102e5c:	39 d0                	cmp    %edx,%eax
80102e5e:	75 f0                	jne    80102e50 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102e60:	89 0c 95 0c 27 11 80 	mov    %ecx,-0x7feed8f4(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102e67:	83 c2 01             	add    $0x1,%edx
80102e6a:	89 15 08 27 11 80    	mov    %edx,0x80112708
  b->flags |= B_DIRTY; // prevent eviction
80102e70:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102e73:	c7 45 08 c0 26 11 80 	movl   $0x801126c0,0x8(%ebp)
}
80102e7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e7d:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102e7e:	e9 4d 16 00 00       	jmp    801044d0 <release>
80102e83:	90                   	nop
80102e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102e88:	89 0c 85 0c 27 11 80 	mov    %ecx,-0x7feed8f4(,%eax,4)
80102e8f:	eb df                	jmp    80102e70 <log_write+0x80>
80102e91:	8b 43 08             	mov    0x8(%ebx),%eax
80102e94:	a3 0c 27 11 80       	mov    %eax,0x8011270c
  if (i == log.lh.n)
80102e99:	75 d5                	jne    80102e70 <log_write+0x80>
80102e9b:	eb ca                	jmp    80102e67 <log_write+0x77>
80102e9d:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102ea0:	83 ec 0c             	sub    $0xc,%esp
80102ea3:	68 f3 75 10 80       	push   $0x801075f3
80102ea8:	e8 c3 d4 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102ead:	83 ec 0c             	sub    $0xc,%esp
80102eb0:	68 09 76 10 80       	push   $0x80107609
80102eb5:	e8 b6 d4 ff ff       	call   80100370 <panic>
80102eba:	66 90                	xchg   %ax,%ax
80102ebc:	66 90                	xchg   %ax,%ax
80102ebe:	66 90                	xchg   %ax,%ax

80102ec0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102ec0:	55                   	push   %ebp
80102ec1:	89 e5                	mov    %esp,%ebp
80102ec3:	53                   	push   %ebx
80102ec4:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102ec7:	e8 84 09 00 00       	call   80103850 <cpuid>
80102ecc:	89 c3                	mov    %eax,%ebx
80102ece:	e8 7d 09 00 00       	call   80103850 <cpuid>
80102ed3:	83 ec 04             	sub    $0x4,%esp
80102ed6:	53                   	push   %ebx
80102ed7:	50                   	push   %eax
80102ed8:	68 24 76 10 80       	push   $0x80107624
80102edd:	e8 7e d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102ee2:	e8 59 2a 00 00       	call   80105940 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102ee7:	e8 e4 08 00 00       	call   801037d0 <mycpu>
80102eec:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102eee:	b8 01 00 00 00       	mov    $0x1,%eax
80102ef3:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102efa:	e8 31 0c 00 00       	call   80103b30 <scheduler>
80102eff:	90                   	nop

80102f00 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102f00:	55                   	push   %ebp
80102f01:	89 e5                	mov    %esp,%ebp
80102f03:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102f06:	e8 55 3b 00 00       	call   80106a60 <switchkvm>
  seginit();
80102f0b:	e8 50 3a 00 00       	call   80106960 <seginit>
  lapicinit();
80102f10:	e8 9b f7 ff ff       	call   801026b0 <lapicinit>
  mpmain();
80102f15:	e8 a6 ff ff ff       	call   80102ec0 <mpmain>
80102f1a:	66 90                	xchg   %ax,%ax
80102f1c:	66 90                	xchg   %ax,%ax
80102f1e:	66 90                	xchg   %ax,%ax

80102f20 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102f20:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f24:	83 e4 f0             	and    $0xfffffff0,%esp
80102f27:	ff 71 fc             	pushl  -0x4(%ecx)
80102f2a:	55                   	push   %ebp
80102f2b:	89 e5                	mov    %esp,%ebp
80102f2d:	53                   	push   %ebx
80102f2e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f2f:	bb c0 27 11 80       	mov    $0x801127c0,%ebx
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102f34:	83 ec 08             	sub    $0x8,%esp
80102f37:	68 00 00 40 80       	push   $0x80400000
80102f3c:	68 e8 56 11 80       	push   $0x801156e8
80102f41:	e8 3a f5 ff ff       	call   80102480 <kinit1>
  kvmalloc();      // kernel page table
80102f46:	e8 b5 3f 00 00       	call   80106f00 <kvmalloc>
  mpinit();        // detect other processors
80102f4b:	e8 70 01 00 00       	call   801030c0 <mpinit>
  lapicinit();     // interrupt controller
80102f50:	e8 5b f7 ff ff       	call   801026b0 <lapicinit>
  seginit();       // segment descriptors
80102f55:	e8 06 3a 00 00       	call   80106960 <seginit>
  picinit();       // disable pic
80102f5a:	e8 31 03 00 00       	call   80103290 <picinit>
  ioapicinit();    // another interrupt controller
80102f5f:	e8 4c f3 ff ff       	call   801022b0 <ioapicinit>
  consoleinit();   // console hardware
80102f64:	e8 37 da ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102f69:	e8 c2 2c 00 00       	call   80105c30 <uartinit>
  pinit();         // process table
80102f6e:	e8 3d 08 00 00       	call   801037b0 <pinit>
  tvinit();        // trap vectors
80102f73:	e8 28 29 00 00       	call   801058a0 <tvinit>
  binit();         // buffer cache
80102f78:	e8 c3 d0 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102f7d:	e8 ce dd ff ff       	call   80100d50 <fileinit>
  ideinit();       // disk 
80102f82:	e8 09 f1 ff ff       	call   80102090 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f87:	83 c4 0c             	add    $0xc,%esp
80102f8a:	68 8a 00 00 00       	push   $0x8a
80102f8f:	68 8c a5 10 80       	push   $0x8010a58c
80102f94:	68 00 70 00 80       	push   $0x80007000
80102f99:	e8 32 16 00 00       	call   801045d0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102f9e:	69 05 40 2d 11 80 b0 	imul   $0xb0,0x80112d40,%eax
80102fa5:	00 00 00 
80102fa8:	83 c4 10             	add    $0x10,%esp
80102fab:	05 c0 27 11 80       	add    $0x801127c0,%eax
80102fb0:	39 d8                	cmp    %ebx,%eax
80102fb2:	76 6f                	jbe    80103023 <main+0x103>
80102fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102fb8:	e8 13 08 00 00       	call   801037d0 <mycpu>
80102fbd:	39 d8                	cmp    %ebx,%eax
80102fbf:	74 49                	je     8010300a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102fc1:	e8 8a f5 ff ff       	call   80102550 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102fc6:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80102fcb:	c7 05 f8 6f 00 80 00 	movl   $0x80102f00,0x80006ff8
80102fd2:	2f 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102fd5:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102fdc:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102fdf:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void(**)(void))(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102fe4:	0f b6 03             	movzbl (%ebx),%eax
80102fe7:	83 ec 08             	sub    $0x8,%esp
80102fea:	68 00 70 00 00       	push   $0x7000
80102fef:	50                   	push   %eax
80102ff0:	e8 0b f8 ff ff       	call   80102800 <lapicstartap>
80102ff5:	83 c4 10             	add    $0x10,%esp
80102ff8:	90                   	nop
80102ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80103000:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103006:	85 c0                	test   %eax,%eax
80103008:	74 f6                	je     80103000 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
8010300a:	69 05 40 2d 11 80 b0 	imul   $0xb0,0x80112d40,%eax
80103011:	00 00 00 
80103014:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
8010301a:	05 c0 27 11 80       	add    $0x801127c0,%eax
8010301f:	39 c3                	cmp    %eax,%ebx
80103021:	72 95                	jb     80102fb8 <main+0x98>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103023:	83 ec 08             	sub    $0x8,%esp
80103026:	68 00 00 00 8e       	push   $0x8e000000
8010302b:	68 00 00 40 80       	push   $0x80400000
80103030:	e8 bb f4 ff ff       	call   801024f0 <kinit2>
  userinit();      // first user process
80103035:	e8 66 08 00 00       	call   801038a0 <userinit>
  mpmain();        // finish this processor's setup
8010303a:	e8 81 fe ff ff       	call   80102ec0 <mpmain>
8010303f:	90                   	nop

80103040 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103040:	55                   	push   %ebp
80103041:	89 e5                	mov    %esp,%ebp
80103043:	57                   	push   %edi
80103044:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103045:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010304b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
8010304c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010304f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103052:	39 de                	cmp    %ebx,%esi
80103054:	73 48                	jae    8010309e <mpsearch1+0x5e>
80103056:	8d 76 00             	lea    0x0(%esi),%esi
80103059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103060:	83 ec 04             	sub    $0x4,%esp
80103063:	8d 7e 10             	lea    0x10(%esi),%edi
80103066:	6a 04                	push   $0x4
80103068:	68 38 76 10 80       	push   $0x80107638
8010306d:	56                   	push   %esi
8010306e:	e8 fd 14 00 00       	call   80104570 <memcmp>
80103073:	83 c4 10             	add    $0x10,%esp
80103076:	85 c0                	test   %eax,%eax
80103078:	75 1e                	jne    80103098 <mpsearch1+0x58>
8010307a:	8d 7e 10             	lea    0x10(%esi),%edi
8010307d:	89 f2                	mov    %esi,%edx
8010307f:	31 c9                	xor    %ecx,%ecx
80103081:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80103088:	0f b6 02             	movzbl (%edx),%eax
8010308b:	83 c2 01             	add    $0x1,%edx
8010308e:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103090:	39 fa                	cmp    %edi,%edx
80103092:	75 f4                	jne    80103088 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103094:	84 c9                	test   %cl,%cl
80103096:	74 10                	je     801030a8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103098:	39 fb                	cmp    %edi,%ebx
8010309a:	89 fe                	mov    %edi,%esi
8010309c:	77 c2                	ja     80103060 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
8010309e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
801030a1:	31 c0                	xor    %eax,%eax
}
801030a3:	5b                   	pop    %ebx
801030a4:	5e                   	pop    %esi
801030a5:	5f                   	pop    %edi
801030a6:	5d                   	pop    %ebp
801030a7:	c3                   	ret    
801030a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030ab:	89 f0                	mov    %esi,%eax
801030ad:	5b                   	pop    %ebx
801030ae:	5e                   	pop    %esi
801030af:	5f                   	pop    %edi
801030b0:	5d                   	pop    %ebp
801030b1:	c3                   	ret    
801030b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801030c0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
801030c0:	55                   	push   %ebp
801030c1:	89 e5                	mov    %esp,%ebp
801030c3:	57                   	push   %edi
801030c4:	56                   	push   %esi
801030c5:	53                   	push   %ebx
801030c6:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801030c9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801030d0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801030d7:	c1 e0 08             	shl    $0x8,%eax
801030da:	09 d0                	or     %edx,%eax
801030dc:	c1 e0 04             	shl    $0x4,%eax
801030df:	85 c0                	test   %eax,%eax
801030e1:	75 1b                	jne    801030fe <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
801030e3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030ea:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801030f1:	c1 e0 08             	shl    $0x8,%eax
801030f4:	09 d0                	or     %edx,%eax
801030f6:	c1 e0 0a             	shl    $0xa,%eax
801030f9:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
801030fe:	ba 00 04 00 00       	mov    $0x400,%edx
80103103:	e8 38 ff ff ff       	call   80103040 <mpsearch1>
80103108:	85 c0                	test   %eax,%eax
8010310a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010310d:	0f 84 37 01 00 00    	je     8010324a <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103113:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103116:	8b 58 04             	mov    0x4(%eax),%ebx
80103119:	85 db                	test   %ebx,%ebx
8010311b:	0f 84 43 01 00 00    	je     80103264 <mpinit+0x1a4>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103121:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103127:	83 ec 04             	sub    $0x4,%esp
8010312a:	6a 04                	push   $0x4
8010312c:	68 3d 76 10 80       	push   $0x8010763d
80103131:	56                   	push   %esi
80103132:	e8 39 14 00 00       	call   80104570 <memcmp>
80103137:	83 c4 10             	add    $0x10,%esp
8010313a:	85 c0                	test   %eax,%eax
8010313c:	0f 85 22 01 00 00    	jne    80103264 <mpinit+0x1a4>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103142:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103149:	3c 01                	cmp    $0x1,%al
8010314b:	74 08                	je     80103155 <mpinit+0x95>
8010314d:	3c 04                	cmp    $0x4,%al
8010314f:	0f 85 0f 01 00 00    	jne    80103264 <mpinit+0x1a4>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103155:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010315c:	85 ff                	test   %edi,%edi
8010315e:	74 21                	je     80103181 <mpinit+0xc1>
80103160:	31 d2                	xor    %edx,%edx
80103162:	31 c0                	xor    %eax,%eax
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103168:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010316f:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103170:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
80103173:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103175:	39 c7                	cmp    %eax,%edi
80103177:	75 ef                	jne    80103168 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103179:	84 d2                	test   %dl,%dl
8010317b:	0f 85 e3 00 00 00    	jne    80103264 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103181:	85 f6                	test   %esi,%esi
80103183:	0f 84 db 00 00 00    	je     80103264 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
80103189:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
8010318f:	a3 bc 26 11 80       	mov    %eax,0x801126bc
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103194:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
8010319b:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
801031a1:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031a6:	01 d6                	add    %edx,%esi
801031a8:	90                   	nop
801031a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801031b0:	39 c6                	cmp    %eax,%esi
801031b2:	76 23                	jbe    801031d7 <mpinit+0x117>
801031b4:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
801031b7:	80 fa 04             	cmp    $0x4,%dl
801031ba:	0f 87 c0 00 00 00    	ja     80103280 <mpinit+0x1c0>
801031c0:	ff 24 95 7c 76 10 80 	jmp    *-0x7fef8984(,%edx,4)
801031c7:	89 f6                	mov    %esi,%esi
801031c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801031d0:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031d3:	39 c6                	cmp    %eax,%esi
801031d5:	77 dd                	ja     801031b4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
801031d7:	85 db                	test   %ebx,%ebx
801031d9:	0f 84 92 00 00 00    	je     80103271 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
801031df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801031e2:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
801031e6:	74 15                	je     801031fd <mpinit+0x13d>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031e8:	ba 22 00 00 00       	mov    $0x22,%edx
801031ed:	b8 70 00 00 00       	mov    $0x70,%eax
801031f2:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801031f3:	ba 23 00 00 00       	mov    $0x23,%edx
801031f8:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031f9:	83 c8 01             	or     $0x1,%eax
801031fc:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
801031fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103200:	5b                   	pop    %ebx
80103201:	5e                   	pop    %esi
80103202:	5f                   	pop    %edi
80103203:	5d                   	pop    %ebp
80103204:	c3                   	ret    
80103205:	8d 76 00             	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103208:	8b 0d 40 2d 11 80    	mov    0x80112d40,%ecx
8010320e:	83 f9 07             	cmp    $0x7,%ecx
80103211:	7f 19                	jg     8010322c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103213:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103217:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010321d:	83 c1 01             	add    $0x1,%ecx
80103220:	89 0d 40 2d 11 80    	mov    %ecx,0x80112d40
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103226:	88 97 c0 27 11 80    	mov    %dl,-0x7feed840(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010322c:	83 c0 14             	add    $0x14,%eax
      continue;
8010322f:	e9 7c ff ff ff       	jmp    801031b0 <mpinit+0xf0>
80103234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010323c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010323f:	88 15 a0 27 11 80    	mov    %dl,0x801127a0
      p += sizeof(struct mpioapic);
      continue;
80103245:	e9 66 ff ff ff       	jmp    801031b0 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010324a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010324f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103254:	e8 e7 fd ff ff       	call   80103040 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103259:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010325b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010325e:	0f 85 af fe ff ff    	jne    80103113 <mpinit+0x53>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
80103264:	83 ec 0c             	sub    $0xc,%esp
80103267:	68 42 76 10 80       	push   $0x80107642
8010326c:	e8 ff d0 ff ff       	call   80100370 <panic>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
80103271:	83 ec 0c             	sub    $0xc,%esp
80103274:	68 5c 76 10 80       	push   $0x8010765c
80103279:	e8 f2 d0 ff ff       	call   80100370 <panic>
8010327e:	66 90                	xchg   %ax,%ax
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
80103280:	31 db                	xor    %ebx,%ebx
80103282:	e9 30 ff ff ff       	jmp    801031b7 <mpinit+0xf7>
80103287:	66 90                	xchg   %ax,%ax
80103289:	66 90                	xchg   %ax,%ax
8010328b:	66 90                	xchg   %ax,%ax
8010328d:	66 90                	xchg   %ax,%ax
8010328f:	90                   	nop

80103290 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
80103290:	55                   	push   %ebp
80103291:	ba 21 00 00 00       	mov    $0x21,%edx
80103296:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010329b:	89 e5                	mov    %esp,%ebp
8010329d:	ee                   	out    %al,(%dx)
8010329e:	ba a1 00 00 00       	mov    $0xa1,%edx
801032a3:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
801032a4:	5d                   	pop    %ebp
801032a5:	c3                   	ret    
801032a6:	66 90                	xchg   %ax,%ax
801032a8:	66 90                	xchg   %ax,%ax
801032aa:	66 90                	xchg   %ax,%ax
801032ac:	66 90                	xchg   %ax,%ax
801032ae:	66 90                	xchg   %ax,%ax

801032b0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801032b0:	55                   	push   %ebp
801032b1:	89 e5                	mov    %esp,%ebp
801032b3:	57                   	push   %edi
801032b4:	56                   	push   %esi
801032b5:	53                   	push   %ebx
801032b6:	83 ec 0c             	sub    $0xc,%esp
801032b9:	8b 75 08             	mov    0x8(%ebp),%esi
801032bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801032bf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801032c5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801032cb:	e8 a0 da ff ff       	call   80100d70 <filealloc>
801032d0:	85 c0                	test   %eax,%eax
801032d2:	89 06                	mov    %eax,(%esi)
801032d4:	0f 84 a8 00 00 00    	je     80103382 <pipealloc+0xd2>
801032da:	e8 91 da ff ff       	call   80100d70 <filealloc>
801032df:	85 c0                	test   %eax,%eax
801032e1:	89 03                	mov    %eax,(%ebx)
801032e3:	0f 84 87 00 00 00    	je     80103370 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801032e9:	e8 62 f2 ff ff       	call   80102550 <kalloc>
801032ee:	85 c0                	test   %eax,%eax
801032f0:	89 c7                	mov    %eax,%edi
801032f2:	0f 84 b0 00 00 00    	je     801033a8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
801032f8:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
801032fb:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103302:	00 00 00 
  p->writeopen = 1;
80103305:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010330c:	00 00 00 
  p->nwrite = 0;
8010330f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103316:	00 00 00 
  p->nread = 0;
80103319:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103320:	00 00 00 
  initlock(&p->lock, "pipe");
80103323:	68 90 76 10 80       	push   $0x80107690
80103328:	50                   	push   %eax
80103329:	e8 92 0f 00 00       	call   801042c0 <initlock>
  (*f0)->type = FD_PIPE;
8010332e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103330:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103333:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103339:	8b 06                	mov    (%esi),%eax
8010333b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010333f:	8b 06                	mov    (%esi),%eax
80103341:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103345:	8b 06                	mov    (%esi),%eax
80103347:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010334a:	8b 03                	mov    (%ebx),%eax
8010334c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103352:	8b 03                	mov    (%ebx),%eax
80103354:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103358:	8b 03                	mov    (%ebx),%eax
8010335a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010335e:	8b 03                	mov    (%ebx),%eax
80103360:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103363:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103366:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103368:	5b                   	pop    %ebx
80103369:	5e                   	pop    %esi
8010336a:	5f                   	pop    %edi
8010336b:	5d                   	pop    %ebp
8010336c:	c3                   	ret    
8010336d:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103370:	8b 06                	mov    (%esi),%eax
80103372:	85 c0                	test   %eax,%eax
80103374:	74 1e                	je     80103394 <pipealloc+0xe4>
    fileclose(*f0);
80103376:	83 ec 0c             	sub    $0xc,%esp
80103379:	50                   	push   %eax
8010337a:	e8 b1 da ff ff       	call   80100e30 <fileclose>
8010337f:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103382:	8b 03                	mov    (%ebx),%eax
80103384:	85 c0                	test   %eax,%eax
80103386:	74 0c                	je     80103394 <pipealloc+0xe4>
    fileclose(*f1);
80103388:	83 ec 0c             	sub    $0xc,%esp
8010338b:	50                   	push   %eax
8010338c:	e8 9f da ff ff       	call   80100e30 <fileclose>
80103391:	83 c4 10             	add    $0x10,%esp
  return -1;
}
80103394:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
80103397:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010339c:	5b                   	pop    %ebx
8010339d:	5e                   	pop    %esi
8010339e:	5f                   	pop    %edi
8010339f:	5d                   	pop    %ebp
801033a0:	c3                   	ret    
801033a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801033a8:	8b 06                	mov    (%esi),%eax
801033aa:	85 c0                	test   %eax,%eax
801033ac:	75 c8                	jne    80103376 <pipealloc+0xc6>
801033ae:	eb d2                	jmp    80103382 <pipealloc+0xd2>

801033b0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801033b0:	55                   	push   %ebp
801033b1:	89 e5                	mov    %esp,%ebp
801033b3:	56                   	push   %esi
801033b4:	53                   	push   %ebx
801033b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801033bb:	83 ec 0c             	sub    $0xc,%esp
801033be:	53                   	push   %ebx
801033bf:	e8 5c 10 00 00       	call   80104420 <acquire>
  if(writable){
801033c4:	83 c4 10             	add    $0x10,%esp
801033c7:	85 f6                	test   %esi,%esi
801033c9:	74 45                	je     80103410 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801033cb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801033d1:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
801033d4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801033db:	00 00 00 
    wakeup(&p->nread);
801033de:	50                   	push   %eax
801033df:	e8 fc 0b 00 00       	call   80103fe0 <wakeup>
801033e4:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801033e7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801033ed:	85 d2                	test   %edx,%edx
801033ef:	75 0a                	jne    801033fb <pipeclose+0x4b>
801033f1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801033f7:	85 c0                	test   %eax,%eax
801033f9:	74 35                	je     80103430 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801033fb:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801033fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103401:	5b                   	pop    %ebx
80103402:	5e                   	pop    %esi
80103403:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103404:	e9 c7 10 00 00       	jmp    801044d0 <release>
80103409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103410:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103416:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103419:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103420:	00 00 00 
    wakeup(&p->nwrite);
80103423:	50                   	push   %eax
80103424:	e8 b7 0b 00 00       	call   80103fe0 <wakeup>
80103429:	83 c4 10             	add    $0x10,%esp
8010342c:	eb b9                	jmp    801033e7 <pipeclose+0x37>
8010342e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103430:	83 ec 0c             	sub    $0xc,%esp
80103433:	53                   	push   %ebx
80103434:	e8 97 10 00 00       	call   801044d0 <release>
    kfree((char*)p);
80103439:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010343c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010343f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103442:	5b                   	pop    %ebx
80103443:	5e                   	pop    %esi
80103444:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103445:	e9 56 ef ff ff       	jmp    801023a0 <kfree>
8010344a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103450 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103450:	55                   	push   %ebp
80103451:	89 e5                	mov    %esp,%ebp
80103453:	57                   	push   %edi
80103454:	56                   	push   %esi
80103455:	53                   	push   %ebx
80103456:	83 ec 28             	sub    $0x28,%esp
80103459:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010345c:	53                   	push   %ebx
8010345d:	e8 be 0f 00 00       	call   80104420 <acquire>
  for(i = 0; i < n; i++){
80103462:	8b 45 10             	mov    0x10(%ebp),%eax
80103465:	83 c4 10             	add    $0x10,%esp
80103468:	85 c0                	test   %eax,%eax
8010346a:	0f 8e b9 00 00 00    	jle    80103529 <pipewrite+0xd9>
80103470:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103473:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103479:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010347f:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103485:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103488:	03 4d 10             	add    0x10(%ebp),%ecx
8010348b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010348e:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
80103494:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
8010349a:	39 d0                	cmp    %edx,%eax
8010349c:	74 38                	je     801034d6 <pipewrite+0x86>
8010349e:	eb 59                	jmp    801034f9 <pipewrite+0xa9>
      if(p->readopen == 0 || myproc()->killed){
801034a0:	e8 cb 03 00 00       	call   80103870 <myproc>
801034a5:	8b 48 24             	mov    0x24(%eax),%ecx
801034a8:	85 c9                	test   %ecx,%ecx
801034aa:	75 34                	jne    801034e0 <pipewrite+0x90>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801034ac:	83 ec 0c             	sub    $0xc,%esp
801034af:	57                   	push   %edi
801034b0:	e8 2b 0b 00 00       	call   80103fe0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801034b5:	58                   	pop    %eax
801034b6:	5a                   	pop    %edx
801034b7:	53                   	push   %ebx
801034b8:	56                   	push   %esi
801034b9:	e8 62 09 00 00       	call   80103e20 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034be:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034c4:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801034ca:	83 c4 10             	add    $0x10,%esp
801034cd:	05 00 02 00 00       	add    $0x200,%eax
801034d2:	39 c2                	cmp    %eax,%edx
801034d4:	75 2a                	jne    80103500 <pipewrite+0xb0>
      if(p->readopen == 0 || myproc()->killed){
801034d6:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801034dc:	85 c0                	test   %eax,%eax
801034de:	75 c0                	jne    801034a0 <pipewrite+0x50>
        release(&p->lock);
801034e0:	83 ec 0c             	sub    $0xc,%esp
801034e3:	53                   	push   %ebx
801034e4:	e8 e7 0f 00 00       	call   801044d0 <release>
        return -1;
801034e9:	83 c4 10             	add    $0x10,%esp
801034ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801034f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034f4:	5b                   	pop    %ebx
801034f5:	5e                   	pop    %esi
801034f6:	5f                   	pop    %edi
801034f7:	5d                   	pop    %ebp
801034f8:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034f9:	89 c2                	mov    %eax,%edx
801034fb:	90                   	nop
801034fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103500:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103503:	8d 42 01             	lea    0x1(%edx),%eax
80103506:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010350a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103510:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103516:	0f b6 09             	movzbl (%ecx),%ecx
80103519:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010351d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103520:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103523:	0f 85 65 ff ff ff    	jne    8010348e <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103529:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010352f:	83 ec 0c             	sub    $0xc,%esp
80103532:	50                   	push   %eax
80103533:	e8 a8 0a 00 00       	call   80103fe0 <wakeup>
  release(&p->lock);
80103538:	89 1c 24             	mov    %ebx,(%esp)
8010353b:	e8 90 0f 00 00       	call   801044d0 <release>
  return n;
80103540:	83 c4 10             	add    $0x10,%esp
80103543:	8b 45 10             	mov    0x10(%ebp),%eax
80103546:	eb a9                	jmp    801034f1 <pipewrite+0xa1>
80103548:	90                   	nop
80103549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103550 <piperead>:
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103550:	55                   	push   %ebp
80103551:	89 e5                	mov    %esp,%ebp
80103553:	57                   	push   %edi
80103554:	56                   	push   %esi
80103555:	53                   	push   %ebx
80103556:	83 ec 18             	sub    $0x18,%esp
80103559:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010355c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010355f:	53                   	push   %ebx
80103560:	e8 bb 0e 00 00       	call   80104420 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103565:	83 c4 10             	add    $0x10,%esp
80103568:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010356e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
80103574:	75 6a                	jne    801035e0 <piperead+0x90>
80103576:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
8010357c:	85 f6                	test   %esi,%esi
8010357e:	0f 84 cc 00 00 00    	je     80103650 <piperead+0x100>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103584:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
8010358a:	eb 2d                	jmp    801035b9 <piperead+0x69>
8010358c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103590:	83 ec 08             	sub    $0x8,%esp
80103593:	53                   	push   %ebx
80103594:	56                   	push   %esi
80103595:	e8 86 08 00 00       	call   80103e20 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010359a:	83 c4 10             	add    $0x10,%esp
8010359d:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801035a3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801035a9:	75 35                	jne    801035e0 <piperead+0x90>
801035ab:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801035b1:	85 d2                	test   %edx,%edx
801035b3:	0f 84 97 00 00 00    	je     80103650 <piperead+0x100>
    if(myproc()->killed){
801035b9:	e8 b2 02 00 00       	call   80103870 <myproc>
801035be:	8b 48 24             	mov    0x24(%eax),%ecx
801035c1:	85 c9                	test   %ecx,%ecx
801035c3:	74 cb                	je     80103590 <piperead+0x40>
      release(&p->lock);
801035c5:	83 ec 0c             	sub    $0xc,%esp
801035c8:	53                   	push   %ebx
801035c9:	e8 02 0f 00 00       	call   801044d0 <release>
      return -1;
801035ce:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035d1:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
      return -1;
801035d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035d9:	5b                   	pop    %ebx
801035da:	5e                   	pop    %esi
801035db:	5f                   	pop    %edi
801035dc:	5d                   	pop    %ebp
801035dd:	c3                   	ret    
801035de:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035e0:	8b 45 10             	mov    0x10(%ebp),%eax
801035e3:	85 c0                	test   %eax,%eax
801035e5:	7e 69                	jle    80103650 <piperead+0x100>
    if(p->nread == p->nwrite)
801035e7:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801035ed:	31 c9                	xor    %ecx,%ecx
801035ef:	eb 15                	jmp    80103606 <piperead+0xb6>
801035f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035f8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801035fe:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103604:	74 5a                	je     80103660 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103606:	8d 70 01             	lea    0x1(%eax),%esi
80103609:	25 ff 01 00 00       	and    $0x1ff,%eax
8010360e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103614:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103619:	88 04 0f             	mov    %al,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010361c:	83 c1 01             	add    $0x1,%ecx
8010361f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103622:	75 d4                	jne    801035f8 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103624:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010362a:	83 ec 0c             	sub    $0xc,%esp
8010362d:	50                   	push   %eax
8010362e:	e8 ad 09 00 00       	call   80103fe0 <wakeup>
  release(&p->lock);
80103633:	89 1c 24             	mov    %ebx,(%esp)
80103636:	e8 95 0e 00 00       	call   801044d0 <release>
  return i;
8010363b:	8b 45 10             	mov    0x10(%ebp),%eax
8010363e:	83 c4 10             	add    $0x10,%esp
}
80103641:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103644:	5b                   	pop    %ebx
80103645:	5e                   	pop    %esi
80103646:	5f                   	pop    %edi
80103647:	5d                   	pop    %ebp
80103648:	c3                   	ret    
80103649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103650:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103657:	eb cb                	jmp    80103624 <piperead+0xd4>
80103659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103660:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103663:	eb bf                	jmp    80103624 <piperead+0xd4>
80103665:	66 90                	xchg   %ax,%ax
80103667:	66 90                	xchg   %ax,%ax
80103669:	66 90                	xchg   %ax,%ax
8010366b:	66 90                	xchg   %ax,%ax
8010366d:	66 90                	xchg   %ax,%ax
8010366f:	90                   	nop

80103670 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103670:	55                   	push   %ebp
80103671:	89 e5                	mov    %esp,%ebp
80103673:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103674:	bb 94 2d 11 80       	mov    $0x80112d94,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103679:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010367c:	68 60 2d 11 80       	push   $0x80112d60
80103681:	e8 9a 0d 00 00       	call   80104420 <acquire>
80103686:	83 c4 10             	add    $0x10,%esp
80103689:	eb 17                	jmp    801036a2 <allocproc+0x32>
8010368b:	90                   	nop
8010368c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103690:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103696:	81 fb 94 4e 11 80    	cmp    $0x80114e94,%ebx
8010369c:	0f 84 8e 00 00 00    	je     80103730 <allocproc+0xc0>
    if(p->state == UNUSED)
801036a2:	8b 43 0c             	mov    0xc(%ebx),%eax
801036a5:	85 c0                	test   %eax,%eax
801036a7:	75 e7                	jne    80103690 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036a9:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
  p->sysCallCount = 0;
  release(&ptable.lock);
801036ae:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801036b1:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
  p->sysCallCount = 0;
  release(&ptable.lock);
801036b8:	68 60 2d 11 80       	push   $0x80112d60

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
801036bd:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
  p->sysCallCount = 0;
801036c4:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801036cb:	00 00 00 
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036ce:	8d 50 01             	lea    0x1(%eax),%edx
801036d1:	89 43 10             	mov    %eax,0x10(%ebx)
801036d4:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
  p->sysCallCount = 0;
  release(&ptable.lock);
801036da:	e8 f1 0d 00 00       	call   801044d0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801036df:	e8 6c ee ff ff       	call   80102550 <kalloc>
801036e4:	83 c4 10             	add    $0x10,%esp
801036e7:	85 c0                	test   %eax,%eax
801036e9:	89 43 08             	mov    %eax,0x8(%ebx)
801036ec:	74 59                	je     80103747 <allocproc+0xd7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036ee:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801036f4:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
801036f7:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036fc:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
801036ff:	c7 40 14 8d 58 10 80 	movl   $0x8010588d,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103706:	6a 14                	push   $0x14
80103708:	6a 00                	push   $0x0
8010370a:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
8010370b:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010370e:	e8 0d 0e 00 00       	call   80104520 <memset>
  p->context->eip = (uint)forkret;
80103713:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103716:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103719:	c7 40 10 50 37 10 80 	movl   $0x80103750,0x10(%eax)

  return p;
80103720:	89 d8                	mov    %ebx,%eax
}
80103722:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103725:	c9                   	leave  
80103726:	c3                   	ret    
80103727:	89 f6                	mov    %esi,%esi
80103729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103730:	83 ec 0c             	sub    $0xc,%esp
80103733:	68 60 2d 11 80       	push   $0x80112d60
80103738:	e8 93 0d 00 00       	call   801044d0 <release>
  return 0;
8010373d:	83 c4 10             	add    $0x10,%esp
80103740:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103742:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103745:	c9                   	leave  
80103746:	c3                   	ret    
  p->sysCallCount = 0;
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103747:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010374e:	eb d2                	jmp    80103722 <allocproc+0xb2>

80103750 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103756:	68 60 2d 11 80       	push   $0x80112d60
8010375b:	e8 70 0d 00 00       	call   801044d0 <release>

  if (first) {
80103760:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103765:	83 c4 10             	add    $0x10,%esp
80103768:	85 c0                	test   %eax,%eax
8010376a:	75 04                	jne    80103770 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010376c:	c9                   	leave  
8010376d:	c3                   	ret    
8010376e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103770:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103773:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010377a:	00 00 00 
    iinit(ROOTDEV);
8010377d:	6a 01                	push   $0x1
8010377f:	e8 ac dd ff ff       	call   80101530 <iinit>
    initlog(ROOTDEV);
80103784:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010378b:	e8 e0 f3 ff ff       	call   80102b70 <initlog>
80103790:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103793:	c9                   	leave  
80103794:	c3                   	ret    
80103795:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037a0 <getptable_proc>:
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

struct proc *getptable_proc(){
801037a0:	55                   	push   %ebp
    return ptable.proc;
}
801037a1:	b8 94 2d 11 80       	mov    $0x80112d94,%eax
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

struct proc *getptable_proc(){
801037a6:	89 e5                	mov    %esp,%ebp
    return ptable.proc;
}
801037a8:	5d                   	pop    %ebp
801037a9:	c3                   	ret    
801037aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801037b0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801037b6:	68 95 76 10 80       	push   $0x80107695
801037bb:	68 60 2d 11 80       	push   $0x80112d60
801037c0:	e8 fb 0a 00 00       	call   801042c0 <initlock>
}
801037c5:	83 c4 10             	add    $0x10,%esp
801037c8:	c9                   	leave  
801037c9:	c3                   	ret    
801037ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801037d0 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	56                   	push   %esi
801037d4:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801037d5:	9c                   	pushf  
801037d6:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
801037d7:	f6 c4 02             	test   $0x2,%ah
801037da:	75 5b                	jne    80103837 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
801037dc:	e8 cf ef ff ff       	call   801027b0 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801037e1:	8b 35 40 2d 11 80    	mov    0x80112d40,%esi
801037e7:	85 f6                	test   %esi,%esi
801037e9:	7e 3f                	jle    8010382a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801037eb:	0f b6 15 c0 27 11 80 	movzbl 0x801127c0,%edx
801037f2:	39 d0                	cmp    %edx,%eax
801037f4:	74 30                	je     80103826 <mycpu+0x56>
801037f6:	b9 70 28 11 80       	mov    $0x80112870,%ecx
801037fb:	31 d2                	xor    %edx,%edx
801037fd:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103800:	83 c2 01             	add    $0x1,%edx
80103803:	39 f2                	cmp    %esi,%edx
80103805:	74 23                	je     8010382a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103807:	0f b6 19             	movzbl (%ecx),%ebx
8010380a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103810:	39 d8                	cmp    %ebx,%eax
80103812:	75 ec                	jne    80103800 <mycpu+0x30>
      return &cpus[i];
80103814:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010381a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010381d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010381e:	05 c0 27 11 80       	add    $0x801127c0,%eax
  }
  panic("unknown apicid\n");
}
80103823:	5e                   	pop    %esi
80103824:	5d                   	pop    %ebp
80103825:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103826:	31 d2                	xor    %edx,%edx
80103828:	eb ea                	jmp    80103814 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010382a:	83 ec 0c             	sub    $0xc,%esp
8010382d:	68 9c 76 10 80       	push   $0x8010769c
80103832:	e8 39 cb ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
80103837:	83 ec 0c             	sub    $0xc,%esp
8010383a:	68 78 77 10 80       	push   $0x80107778
8010383f:	e8 2c cb ff ff       	call   80100370 <panic>
80103844:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010384a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103850 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103856:	e8 75 ff ff ff       	call   801037d0 <mycpu>
8010385b:	2d c0 27 11 80       	sub    $0x801127c0,%eax
}
80103860:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
80103861:	c1 f8 04             	sar    $0x4,%eax
80103864:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010386a:	c3                   	ret    
8010386b:	90                   	nop
8010386c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103870 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	53                   	push   %ebx
80103874:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
80103877:	e8 c4 0a 00 00       	call   80104340 <pushcli>
  c = mycpu();
8010387c:	e8 4f ff ff ff       	call   801037d0 <mycpu>
  p = c->proc;
80103881:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103887:	e8 f4 0a 00 00       	call   80104380 <popcli>
  return p;
}
8010388c:	83 c4 04             	add    $0x4,%esp
8010388f:	89 d8                	mov    %ebx,%eax
80103891:	5b                   	pop    %ebx
80103892:	5d                   	pop    %ebp
80103893:	c3                   	ret    
80103894:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010389a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801038a0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	53                   	push   %ebx
801038a4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801038a7:	e8 c4 fd ff ff       	call   80103670 <allocproc>
801038ac:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801038ae:	a3 b8 a6 10 80       	mov    %eax,0x8010a6b8
  if((p->pgdir = setupkvm()) == 0)
801038b3:	e8 c8 35 00 00       	call   80106e80 <setupkvm>
801038b8:	85 c0                	test   %eax,%eax
801038ba:	89 43 04             	mov    %eax,0x4(%ebx)
801038bd:	0f 84 bd 00 00 00    	je     80103980 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038c3:	83 ec 04             	sub    $0x4,%esp
801038c6:	68 2c 00 00 00       	push   $0x2c
801038cb:	68 60 a5 10 80       	push   $0x8010a560
801038d0:	50                   	push   %eax
801038d1:	e8 ba 32 00 00       	call   80106b90 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
801038d6:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
801038d9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801038df:	6a 4c                	push   $0x4c
801038e1:	6a 00                	push   $0x0
801038e3:	ff 73 18             	pushl  0x18(%ebx)
801038e6:	e8 35 0c 00 00       	call   80104520 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038eb:	8b 43 18             	mov    0x18(%ebx),%eax
801038ee:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038f3:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
801038f8:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038fb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038ff:	8b 43 18             	mov    0x18(%ebx),%eax
80103902:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103906:	8b 43 18             	mov    0x18(%ebx),%eax
80103909:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010390d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103911:	8b 43 18             	mov    0x18(%ebx),%eax
80103914:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103918:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010391c:	8b 43 18             	mov    0x18(%ebx),%eax
8010391f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103926:	8b 43 18             	mov    0x18(%ebx),%eax
80103929:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103930:	8b 43 18             	mov    0x18(%ebx),%eax
80103933:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010393a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010393d:	6a 10                	push   $0x10
8010393f:	68 c5 76 10 80       	push   $0x801076c5
80103944:	50                   	push   %eax
80103945:	e8 d6 0d 00 00       	call   80104720 <safestrcpy>
  p->cwd = namei("/");
8010394a:	c7 04 24 ce 76 10 80 	movl   $0x801076ce,(%esp)
80103951:	e8 2a e6 ff ff       	call   80101f80 <namei>
80103956:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103959:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103960:	e8 bb 0a 00 00       	call   80104420 <acquire>

  p->state = RUNNABLE;
80103965:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010396c:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103973:	e8 58 0b 00 00       	call   801044d0 <release>
}
80103978:	83 c4 10             	add    $0x10,%esp
8010397b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010397e:	c9                   	leave  
8010397f:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103980:	83 ec 0c             	sub    $0xc,%esp
80103983:	68 ac 76 10 80       	push   $0x801076ac
80103988:	e8 e3 c9 ff ff       	call   80100370 <panic>
8010398d:	8d 76 00             	lea    0x0(%esi),%esi

80103990 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103990:	55                   	push   %ebp
80103991:	89 e5                	mov    %esp,%ebp
80103993:	56                   	push   %esi
80103994:	53                   	push   %ebx
80103995:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103998:	e8 a3 09 00 00       	call   80104340 <pushcli>
  c = mycpu();
8010399d:	e8 2e fe ff ff       	call   801037d0 <mycpu>
  p = c->proc;
801039a2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801039a8:	e8 d3 09 00 00       	call   80104380 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
801039ad:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
801039b0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801039b2:	7e 34                	jle    801039e8 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801039b4:	83 ec 04             	sub    $0x4,%esp
801039b7:	01 c6                	add    %eax,%esi
801039b9:	56                   	push   %esi
801039ba:	50                   	push   %eax
801039bb:	ff 73 04             	pushl  0x4(%ebx)
801039be:	e8 0d 33 00 00       	call   80106cd0 <allocuvm>
801039c3:	83 c4 10             	add    $0x10,%esp
801039c6:	85 c0                	test   %eax,%eax
801039c8:	74 36                	je     80103a00 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
801039ca:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
801039cd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801039cf:	53                   	push   %ebx
801039d0:	e8 ab 30 00 00       	call   80106a80 <switchuvm>
  return 0;
801039d5:	83 c4 10             	add    $0x10,%esp
801039d8:	31 c0                	xor    %eax,%eax
}
801039da:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039dd:	5b                   	pop    %ebx
801039de:	5e                   	pop    %esi
801039df:	5d                   	pop    %ebp
801039e0:	c3                   	ret    
801039e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801039e8:	74 e0                	je     801039ca <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801039ea:	83 ec 04             	sub    $0x4,%esp
801039ed:	01 c6                	add    %eax,%esi
801039ef:	56                   	push   %esi
801039f0:	50                   	push   %eax
801039f1:	ff 73 04             	pushl  0x4(%ebx)
801039f4:	e8 d7 33 00 00       	call   80106dd0 <deallocuvm>
801039f9:	83 c4 10             	add    $0x10,%esp
801039fc:	85 c0                	test   %eax,%eax
801039fe:	75 ca                	jne    801039ca <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103a00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a05:	eb d3                	jmp    801039da <growproc+0x4a>
80103a07:	89 f6                	mov    %esi,%esi
80103a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a10 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103a10:	55                   	push   %ebp
80103a11:	89 e5                	mov    %esp,%ebp
80103a13:	57                   	push   %edi
80103a14:	56                   	push   %esi
80103a15:	53                   	push   %ebx
80103a16:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103a19:	e8 22 09 00 00       	call   80104340 <pushcli>
  c = mycpu();
80103a1e:	e8 ad fd ff ff       	call   801037d0 <mycpu>
  p = c->proc;
80103a23:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a29:	e8 52 09 00 00       	call   80104380 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
80103a2e:	e8 3d fc ff ff       	call   80103670 <allocproc>
80103a33:	85 c0                	test   %eax,%eax
80103a35:	89 c7                	mov    %eax,%edi
80103a37:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a3a:	0f 84 b5 00 00 00    	je     80103af5 <fork+0xe5>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a40:	83 ec 08             	sub    $0x8,%esp
80103a43:	ff 33                	pushl  (%ebx)
80103a45:	ff 73 04             	pushl  0x4(%ebx)
80103a48:	e8 03 35 00 00       	call   80106f50 <copyuvm>
80103a4d:	83 c4 10             	add    $0x10,%esp
80103a50:	85 c0                	test   %eax,%eax
80103a52:	89 47 04             	mov    %eax,0x4(%edi)
80103a55:	0f 84 a1 00 00 00    	je     80103afc <fork+0xec>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
80103a5b:	8b 03                	mov    (%ebx),%eax
80103a5d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103a60:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103a62:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103a65:	89 c8                	mov    %ecx,%eax
80103a67:	8b 79 18             	mov    0x18(%ecx),%edi
80103a6a:	8b 73 18             	mov    0x18(%ebx),%esi
80103a6d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103a72:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a74:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103a76:	8b 40 18             	mov    0x18(%eax),%eax
80103a79:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
80103a80:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103a84:	85 c0                	test   %eax,%eax
80103a86:	74 13                	je     80103a9b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103a88:	83 ec 0c             	sub    $0xc,%esp
80103a8b:	50                   	push   %eax
80103a8c:	e8 4f d3 ff ff       	call   80100de0 <filedup>
80103a91:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103a94:	83 c4 10             	add    $0x10,%esp
80103a97:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a9b:	83 c6 01             	add    $0x1,%esi
80103a9e:	83 fe 10             	cmp    $0x10,%esi
80103aa1:	75 dd                	jne    80103a80 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103aa3:	83 ec 0c             	sub    $0xc,%esp
80103aa6:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103aa9:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103aac:	e8 4f dc ff ff       	call   80101700 <idup>
80103ab1:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103ab4:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103ab7:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103aba:	8d 47 6c             	lea    0x6c(%edi),%eax
80103abd:	6a 10                	push   $0x10
80103abf:	53                   	push   %ebx
80103ac0:	50                   	push   %eax
80103ac1:	e8 5a 0c 00 00       	call   80104720 <safestrcpy>

  pid = np->pid;
80103ac6:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
80103ac9:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103ad0:	e8 4b 09 00 00       	call   80104420 <acquire>

  np->state = RUNNABLE;
80103ad5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
80103adc:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103ae3:	e8 e8 09 00 00       	call   801044d0 <release>

  return pid;
80103ae8:	83 c4 10             	add    $0x10,%esp
80103aeb:	89 d8                	mov    %ebx,%eax
}
80103aed:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103af0:	5b                   	pop    %ebx
80103af1:	5e                   	pop    %esi
80103af2:	5f                   	pop    %edi
80103af3:	5d                   	pop    %ebp
80103af4:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103af5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103afa:	eb f1                	jmp    80103aed <fork+0xdd>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
80103afc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103aff:	83 ec 0c             	sub    $0xc,%esp
80103b02:	ff 77 08             	pushl  0x8(%edi)
80103b05:	e8 96 e8 ff ff       	call   801023a0 <kfree>
    np->kstack = 0;
80103b0a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103b11:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103b18:	83 c4 10             	add    $0x10,%esp
80103b1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103b20:	eb cb                	jmp    80103aed <fork+0xdd>
80103b22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b30 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103b30:	55                   	push   %ebp
80103b31:	89 e5                	mov    %esp,%ebp
80103b33:	57                   	push   %edi
80103b34:	56                   	push   %esi
80103b35:	53                   	push   %ebx
80103b36:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103b39:	e8 92 fc ff ff       	call   801037d0 <mycpu>
80103b3e:	8d 78 04             	lea    0x4(%eax),%edi
80103b41:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103b43:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103b4a:	00 00 00 
80103b4d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103b50:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103b51:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b54:	bb 94 2d 11 80       	mov    $0x80112d94,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103b59:	68 60 2d 11 80       	push   $0x80112d60
80103b5e:	e8 bd 08 00 00       	call   80104420 <acquire>
80103b63:	83 c4 10             	add    $0x10,%esp
80103b66:	eb 16                	jmp    80103b7e <scheduler+0x4e>
80103b68:	90                   	nop
80103b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b70:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103b76:	81 fb 94 4e 11 80    	cmp    $0x80114e94,%ebx
80103b7c:	74 4a                	je     80103bc8 <scheduler+0x98>
      if(p->state != RUNNABLE)
80103b7e:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103b82:	75 ec                	jne    80103b70 <scheduler+0x40>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103b84:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103b87:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103b8d:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b8e:	81 c3 84 00 00 00    	add    $0x84,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103b94:	e8 e7 2e 00 00       	call   80106a80 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103b99:	58                   	pop    %eax
80103b9a:	5a                   	pop    %edx
80103b9b:	ff 73 98             	pushl  -0x68(%ebx)
80103b9e:	57                   	push   %edi
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103b9f:	c7 43 88 04 00 00 00 	movl   $0x4,-0x78(%ebx)

      swtch(&(c->scheduler), p->context);
80103ba6:	e8 d0 0b 00 00       	call   8010477b <swtch>
      switchkvm();
80103bab:	e8 b0 2e 00 00       	call   80106a60 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103bb0:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bb3:	81 fb 94 4e 11 80    	cmp    $0x80114e94,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103bb9:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103bc0:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bc3:	75 b9                	jne    80103b7e <scheduler+0x4e>
80103bc5:	8d 76 00             	lea    0x0(%esi),%esi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103bc8:	83 ec 0c             	sub    $0xc,%esp
80103bcb:	68 60 2d 11 80       	push   $0x80112d60
80103bd0:	e8 fb 08 00 00       	call   801044d0 <release>

  }
80103bd5:	83 c4 10             	add    $0x10,%esp
80103bd8:	e9 73 ff ff ff       	jmp    80103b50 <scheduler+0x20>
80103bdd:	8d 76 00             	lea    0x0(%esi),%esi

80103be0 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103be0:	55                   	push   %ebp
80103be1:	89 e5                	mov    %esp,%ebp
80103be3:	56                   	push   %esi
80103be4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103be5:	e8 56 07 00 00       	call   80104340 <pushcli>
  c = mycpu();
80103bea:	e8 e1 fb ff ff       	call   801037d0 <mycpu>
  p = c->proc;
80103bef:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103bf5:	e8 86 07 00 00       	call   80104380 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103bfa:	83 ec 0c             	sub    $0xc,%esp
80103bfd:	68 60 2d 11 80       	push   $0x80112d60
80103c02:	e8 e9 07 00 00       	call   801043f0 <holding>
80103c07:	83 c4 10             	add    $0x10,%esp
80103c0a:	85 c0                	test   %eax,%eax
80103c0c:	74 4f                	je     80103c5d <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103c0e:	e8 bd fb ff ff       	call   801037d0 <mycpu>
80103c13:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103c1a:	75 68                	jne    80103c84 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103c1c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103c20:	74 55                	je     80103c77 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103c22:	9c                   	pushf  
80103c23:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103c24:	f6 c4 02             	test   $0x2,%ah
80103c27:	75 41                	jne    80103c6a <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103c29:	e8 a2 fb ff ff       	call   801037d0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103c2e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103c31:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103c37:	e8 94 fb ff ff       	call   801037d0 <mycpu>
80103c3c:	83 ec 08             	sub    $0x8,%esp
80103c3f:	ff 70 04             	pushl  0x4(%eax)
80103c42:	53                   	push   %ebx
80103c43:	e8 33 0b 00 00       	call   8010477b <swtch>
  mycpu()->intena = intena;
80103c48:	e8 83 fb ff ff       	call   801037d0 <mycpu>
}
80103c4d:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103c50:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103c56:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103c59:	5b                   	pop    %ebx
80103c5a:	5e                   	pop    %esi
80103c5b:	5d                   	pop    %ebp
80103c5c:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103c5d:	83 ec 0c             	sub    $0xc,%esp
80103c60:	68 d0 76 10 80       	push   $0x801076d0
80103c65:	e8 06 c7 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103c6a:	83 ec 0c             	sub    $0xc,%esp
80103c6d:	68 fc 76 10 80       	push   $0x801076fc
80103c72:	e8 f9 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103c77:	83 ec 0c             	sub    $0xc,%esp
80103c7a:	68 ee 76 10 80       	push   $0x801076ee
80103c7f:	e8 ec c6 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103c84:	83 ec 0c             	sub    $0xc,%esp
80103c87:	68 e2 76 10 80       	push   $0x801076e2
80103c8c:	e8 df c6 ff ff       	call   80100370 <panic>
80103c91:	eb 0d                	jmp    80103ca0 <exit>
80103c93:	90                   	nop
80103c94:	90                   	nop
80103c95:	90                   	nop
80103c96:	90                   	nop
80103c97:	90                   	nop
80103c98:	90                   	nop
80103c99:	90                   	nop
80103c9a:	90                   	nop
80103c9b:	90                   	nop
80103c9c:	90                   	nop
80103c9d:	90                   	nop
80103c9e:	90                   	nop
80103c9f:	90                   	nop

80103ca0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103ca0:	55                   	push   %ebp
80103ca1:	89 e5                	mov    %esp,%ebp
80103ca3:	57                   	push   %edi
80103ca4:	56                   	push   %esi
80103ca5:	53                   	push   %ebx
80103ca6:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103ca9:	e8 92 06 00 00       	call   80104340 <pushcli>
  c = mycpu();
80103cae:	e8 1d fb ff ff       	call   801037d0 <mycpu>
  p = c->proc;
80103cb3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103cb9:	e8 c2 06 00 00       	call   80104380 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103cbe:	39 35 b8 a6 10 80    	cmp    %esi,0x8010a6b8
80103cc4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103cc7:	8d 7e 68             	lea    0x68(%esi),%edi
80103cca:	0f 84 f1 00 00 00    	je     80103dc1 <exit+0x121>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103cd0:	8b 03                	mov    (%ebx),%eax
80103cd2:	85 c0                	test   %eax,%eax
80103cd4:	74 12                	je     80103ce8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103cd6:	83 ec 0c             	sub    $0xc,%esp
80103cd9:	50                   	push   %eax
80103cda:	e8 51 d1 ff ff       	call   80100e30 <fileclose>
      curproc->ofile[fd] = 0;
80103cdf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103ce5:	83 c4 10             	add    $0x10,%esp
80103ce8:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103ceb:	39 df                	cmp    %ebx,%edi
80103ced:	75 e1                	jne    80103cd0 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103cef:	e8 1c ef ff ff       	call   80102c10 <begin_op>
  iput(curproc->cwd);
80103cf4:	83 ec 0c             	sub    $0xc,%esp
80103cf7:	ff 76 68             	pushl  0x68(%esi)
80103cfa:	e8 61 db ff ff       	call   80101860 <iput>
  end_op();
80103cff:	e8 7c ef ff ff       	call   80102c80 <end_op>
  curproc->cwd = 0;
80103d04:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103d0b:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103d12:	e8 09 07 00 00       	call   80104420 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103d17:	8b 56 14             	mov    0x14(%esi),%edx
80103d1a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d1d:	b8 94 2d 11 80       	mov    $0x80112d94,%eax
80103d22:	eb 10                	jmp    80103d34 <exit+0x94>
80103d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d28:	05 84 00 00 00       	add    $0x84,%eax
80103d2d:	3d 94 4e 11 80       	cmp    $0x80114e94,%eax
80103d32:	74 1e                	je     80103d52 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103d34:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d38:	75 ee                	jne    80103d28 <exit+0x88>
80103d3a:	3b 50 20             	cmp    0x20(%eax),%edx
80103d3d:	75 e9                	jne    80103d28 <exit+0x88>
      p->state = RUNNABLE;
80103d3f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d46:	05 84 00 00 00       	add    $0x84,%eax
80103d4b:	3d 94 4e 11 80       	cmp    $0x80114e94,%eax
80103d50:	75 e2                	jne    80103d34 <exit+0x94>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103d52:	8b 0d b8 a6 10 80    	mov    0x8010a6b8,%ecx
80103d58:	ba 94 2d 11 80       	mov    $0x80112d94,%edx
80103d5d:	eb 0f                	jmp    80103d6e <exit+0xce>
80103d5f:	90                   	nop

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d60:	81 c2 84 00 00 00    	add    $0x84,%edx
80103d66:	81 fa 94 4e 11 80    	cmp    $0x80114e94,%edx
80103d6c:	74 3a                	je     80103da8 <exit+0x108>
    if(p->parent == curproc){
80103d6e:	39 72 14             	cmp    %esi,0x14(%edx)
80103d71:	75 ed                	jne    80103d60 <exit+0xc0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103d73:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103d77:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103d7a:	75 e4                	jne    80103d60 <exit+0xc0>
80103d7c:	b8 94 2d 11 80       	mov    $0x80112d94,%eax
80103d81:	eb 11                	jmp    80103d94 <exit+0xf4>
80103d83:	90                   	nop
80103d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d88:	05 84 00 00 00       	add    $0x84,%eax
80103d8d:	3d 94 4e 11 80       	cmp    $0x80114e94,%eax
80103d92:	74 cc                	je     80103d60 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103d94:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d98:	75 ee                	jne    80103d88 <exit+0xe8>
80103d9a:	3b 48 20             	cmp    0x20(%eax),%ecx
80103d9d:	75 e9                	jne    80103d88 <exit+0xe8>
      p->state = RUNNABLE;
80103d9f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103da6:	eb e0                	jmp    80103d88 <exit+0xe8>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103da8:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103daf:	e8 2c fe ff ff       	call   80103be0 <sched>
  panic("zombie exit");
80103db4:	83 ec 0c             	sub    $0xc,%esp
80103db7:	68 1d 77 10 80       	push   $0x8010771d
80103dbc:	e8 af c5 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103dc1:	83 ec 0c             	sub    $0xc,%esp
80103dc4:	68 10 77 10 80       	push   $0x80107710
80103dc9:	e8 a2 c5 ff ff       	call   80100370 <panic>
80103dce:	66 90                	xchg   %ax,%ax

80103dd0 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103dd0:	55                   	push   %ebp
80103dd1:	89 e5                	mov    %esp,%ebp
80103dd3:	53                   	push   %ebx
80103dd4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103dd7:	68 60 2d 11 80       	push   $0x80112d60
80103ddc:	e8 3f 06 00 00       	call   80104420 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103de1:	e8 5a 05 00 00       	call   80104340 <pushcli>
  c = mycpu();
80103de6:	e8 e5 f9 ff ff       	call   801037d0 <mycpu>
  p = c->proc;
80103deb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103df1:	e8 8a 05 00 00       	call   80104380 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103df6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103dfd:	e8 de fd ff ff       	call   80103be0 <sched>
  release(&ptable.lock);
80103e02:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103e09:	e8 c2 06 00 00       	call   801044d0 <release>
}
80103e0e:	83 c4 10             	add    $0x10,%esp
80103e11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103e14:	c9                   	leave  
80103e15:	c3                   	ret    
80103e16:	8d 76 00             	lea    0x0(%esi),%esi
80103e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103e20 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103e20:	55                   	push   %ebp
80103e21:	89 e5                	mov    %esp,%ebp
80103e23:	57                   	push   %edi
80103e24:	56                   	push   %esi
80103e25:	53                   	push   %ebx
80103e26:	83 ec 0c             	sub    $0xc,%esp
80103e29:	8b 7d 08             	mov    0x8(%ebp),%edi
80103e2c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103e2f:	e8 0c 05 00 00       	call   80104340 <pushcli>
  c = mycpu();
80103e34:	e8 97 f9 ff ff       	call   801037d0 <mycpu>
  p = c->proc;
80103e39:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103e3f:	e8 3c 05 00 00       	call   80104380 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103e44:	85 db                	test   %ebx,%ebx
80103e46:	0f 84 87 00 00 00    	je     80103ed3 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103e4c:	85 f6                	test   %esi,%esi
80103e4e:	74 76                	je     80103ec6 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103e50:	81 fe 60 2d 11 80    	cmp    $0x80112d60,%esi
80103e56:	74 50                	je     80103ea8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103e58:	83 ec 0c             	sub    $0xc,%esp
80103e5b:	68 60 2d 11 80       	push   $0x80112d60
80103e60:	e8 bb 05 00 00       	call   80104420 <acquire>
    release(lk);
80103e65:	89 34 24             	mov    %esi,(%esp)
80103e68:	e8 63 06 00 00       	call   801044d0 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103e6d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e70:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103e77:	e8 64 fd ff ff       	call   80103be0 <sched>

  // Tidy up.
  p->chan = 0;
80103e7c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103e83:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103e8a:	e8 41 06 00 00       	call   801044d0 <release>
    acquire(lk);
80103e8f:	89 75 08             	mov    %esi,0x8(%ebp)
80103e92:	83 c4 10             	add    $0x10,%esp
  }
}
80103e95:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e98:	5b                   	pop    %ebx
80103e99:	5e                   	pop    %esi
80103e9a:	5f                   	pop    %edi
80103e9b:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103e9c:	e9 7f 05 00 00       	jmp    80104420 <acquire>
80103ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103ea8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103eab:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103eb2:	e8 29 fd ff ff       	call   80103be0 <sched>

  // Tidy up.
  p->chan = 0;
80103eb7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103ebe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ec1:	5b                   	pop    %ebx
80103ec2:	5e                   	pop    %esi
80103ec3:	5f                   	pop    %edi
80103ec4:	5d                   	pop    %ebp
80103ec5:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103ec6:	83 ec 0c             	sub    $0xc,%esp
80103ec9:	68 2f 77 10 80       	push   $0x8010772f
80103ece:	e8 9d c4 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103ed3:	83 ec 0c             	sub    $0xc,%esp
80103ed6:	68 29 77 10 80       	push   $0x80107729
80103edb:	e8 90 c4 ff ff       	call   80100370 <panic>

80103ee0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103ee0:	55                   	push   %ebp
80103ee1:	89 e5                	mov    %esp,%ebp
80103ee3:	56                   	push   %esi
80103ee4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103ee5:	e8 56 04 00 00       	call   80104340 <pushcli>
  c = mycpu();
80103eea:	e8 e1 f8 ff ff       	call   801037d0 <mycpu>
  p = c->proc;
80103eef:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103ef5:	e8 86 04 00 00       	call   80104380 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103efa:	83 ec 0c             	sub    $0xc,%esp
80103efd:	68 60 2d 11 80       	push   $0x80112d60
80103f02:	e8 19 05 00 00       	call   80104420 <acquire>
80103f07:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103f0a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f0c:	bb 94 2d 11 80       	mov    $0x80112d94,%ebx
80103f11:	eb 13                	jmp    80103f26 <wait+0x46>
80103f13:	90                   	nop
80103f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f18:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103f1e:	81 fb 94 4e 11 80    	cmp    $0x80114e94,%ebx
80103f24:	74 22                	je     80103f48 <wait+0x68>
      if(p->parent != curproc)
80103f26:	39 73 14             	cmp    %esi,0x14(%ebx)
80103f29:	75 ed                	jne    80103f18 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103f2b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103f2f:	74 35                	je     80103f66 <wait+0x86>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f31:	81 c3 84 00 00 00    	add    $0x84,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103f37:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f3c:	81 fb 94 4e 11 80    	cmp    $0x80114e94,%ebx
80103f42:	75 e2                	jne    80103f26 <wait+0x46>
80103f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103f48:	85 c0                	test   %eax,%eax
80103f4a:	74 70                	je     80103fbc <wait+0xdc>
80103f4c:	8b 46 24             	mov    0x24(%esi),%eax
80103f4f:	85 c0                	test   %eax,%eax
80103f51:	75 69                	jne    80103fbc <wait+0xdc>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103f53:	83 ec 08             	sub    $0x8,%esp
80103f56:	68 60 2d 11 80       	push   $0x80112d60
80103f5b:	56                   	push   %esi
80103f5c:	e8 bf fe ff ff       	call   80103e20 <sleep>
  }
80103f61:	83 c4 10             	add    $0x10,%esp
80103f64:	eb a4                	jmp    80103f0a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103f66:	83 ec 0c             	sub    $0xc,%esp
80103f69:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103f6c:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103f6f:	e8 2c e4 ff ff       	call   801023a0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103f74:	5a                   	pop    %edx
80103f75:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103f78:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103f7f:	e8 7c 2e 00 00       	call   80106e00 <freevm>
        p->pid = 0;
80103f84:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103f8b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103f92:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103f96:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103f9d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103fa4:	c7 04 24 60 2d 11 80 	movl   $0x80112d60,(%esp)
80103fab:	e8 20 05 00 00       	call   801044d0 <release>
        return pid;
80103fb0:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fb3:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103fb6:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fb8:	5b                   	pop    %ebx
80103fb9:	5e                   	pop    %esi
80103fba:	5d                   	pop    %ebp
80103fbb:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103fbc:	83 ec 0c             	sub    $0xc,%esp
80103fbf:	68 60 2d 11 80       	push   $0x80112d60
80103fc4:	e8 07 05 00 00       	call   801044d0 <release>
      return -1;
80103fc9:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fcc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103fcf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fd4:	5b                   	pop    %ebx
80103fd5:	5e                   	pop    %esi
80103fd6:	5d                   	pop    %ebp
80103fd7:	c3                   	ret    
80103fd8:	90                   	nop
80103fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103fe0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	53                   	push   %ebx
80103fe4:	83 ec 10             	sub    $0x10,%esp
80103fe7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103fea:	68 60 2d 11 80       	push   $0x80112d60
80103fef:	e8 2c 04 00 00       	call   80104420 <acquire>
80103ff4:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ff7:	b8 94 2d 11 80       	mov    $0x80112d94,%eax
80103ffc:	eb 0e                	jmp    8010400c <wakeup+0x2c>
80103ffe:	66 90                	xchg   %ax,%ax
80104000:	05 84 00 00 00       	add    $0x84,%eax
80104005:	3d 94 4e 11 80       	cmp    $0x80114e94,%eax
8010400a:	74 1e                	je     8010402a <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
8010400c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104010:	75 ee                	jne    80104000 <wakeup+0x20>
80104012:	3b 58 20             	cmp    0x20(%eax),%ebx
80104015:	75 e9                	jne    80104000 <wakeup+0x20>
      p->state = RUNNABLE;
80104017:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010401e:	05 84 00 00 00       	add    $0x84,%eax
80104023:	3d 94 4e 11 80       	cmp    $0x80114e94,%eax
80104028:	75 e2                	jne    8010400c <wakeup+0x2c>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
8010402a:	c7 45 08 60 2d 11 80 	movl   $0x80112d60,0x8(%ebp)
}
80104031:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104034:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104035:	e9 96 04 00 00       	jmp    801044d0 <release>
8010403a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104040 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104040:	55                   	push   %ebp
80104041:	89 e5                	mov    %esp,%ebp
80104043:	53                   	push   %ebx
80104044:	83 ec 10             	sub    $0x10,%esp
80104047:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010404a:	68 60 2d 11 80       	push   $0x80112d60
8010404f:	e8 cc 03 00 00       	call   80104420 <acquire>
80104054:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104057:	b8 94 2d 11 80       	mov    $0x80112d94,%eax
8010405c:	eb 0e                	jmp    8010406c <kill+0x2c>
8010405e:	66 90                	xchg   %ax,%ax
80104060:	05 84 00 00 00       	add    $0x84,%eax
80104065:	3d 94 4e 11 80       	cmp    $0x80114e94,%eax
8010406a:	74 3c                	je     801040a8 <kill+0x68>
    if(p->pid == pid){
8010406c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010406f:	75 ef                	jne    80104060 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104071:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80104075:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010407c:	74 1a                	je     80104098 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010407e:	83 ec 0c             	sub    $0xc,%esp
80104081:	68 60 2d 11 80       	push   $0x80112d60
80104086:	e8 45 04 00 00       	call   801044d0 <release>
      return 0;
8010408b:	83 c4 10             	add    $0x10,%esp
8010408e:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104090:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104093:	c9                   	leave  
80104094:	c3                   	ret    
80104095:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80104098:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010409f:	eb dd                	jmp    8010407e <kill+0x3e>
801040a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801040a8:	83 ec 0c             	sub    $0xc,%esp
801040ab:	68 60 2d 11 80       	push   $0x80112d60
801040b0:	e8 1b 04 00 00       	call   801044d0 <release>
  return -1;
801040b5:	83 c4 10             	add    $0x10,%esp
801040b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801040bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040c0:	c9                   	leave  
801040c1:	c3                   	ret    
801040c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801040c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040d0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	57                   	push   %edi
801040d4:	56                   	push   %esi
801040d5:	53                   	push   %ebx
801040d6:	8d 75 e8             	lea    -0x18(%ebp),%esi
801040d9:	bb 00 2e 11 80       	mov    $0x80112e00,%ebx
801040de:	83 ec 3c             	sub    $0x3c,%esp
801040e1:	eb 27                	jmp    8010410a <procdump+0x3a>
801040e3:	90                   	nop
801040e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
801040e8:	83 ec 0c             	sub    $0xc,%esp
801040eb:	68 ff 7a 10 80       	push   $0x80107aff
801040f0:	e8 6b c5 ff ff       	call   80100660 <cprintf>
801040f5:	83 c4 10             	add    $0x10,%esp
801040f8:	81 c3 84 00 00 00    	add    $0x84,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040fe:	81 fb 00 4f 11 80    	cmp    $0x80114f00,%ebx
80104104:	0f 84 7e 00 00 00    	je     80104188 <procdump+0xb8>
    if(p->state == UNUSED)
8010410a:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010410d:	85 c0                	test   %eax,%eax
8010410f:	74 e7                	je     801040f8 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104111:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104114:	ba 40 77 10 80       	mov    $0x80107740,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104119:	77 11                	ja     8010412c <procdump+0x5c>
8010411b:	8b 14 85 a0 77 10 80 	mov    -0x7fef8860(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
80104122:	b8 40 77 10 80       	mov    $0x80107740,%eax
80104127:	85 d2                	test   %edx,%edx
80104129:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
8010412c:	53                   	push   %ebx
8010412d:	52                   	push   %edx
8010412e:	ff 73 a4             	pushl  -0x5c(%ebx)
80104131:	68 44 77 10 80       	push   $0x80107744
80104136:	e8 25 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
8010413b:	83 c4 10             	add    $0x10,%esp
8010413e:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80104142:	75 a4                	jne    801040e8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104144:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104147:	83 ec 08             	sub    $0x8,%esp
8010414a:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010414d:	50                   	push   %eax
8010414e:	8b 43 b0             	mov    -0x50(%ebx),%eax
80104151:	8b 40 0c             	mov    0xc(%eax),%eax
80104154:	83 c0 08             	add    $0x8,%eax
80104157:	50                   	push   %eax
80104158:	e8 83 01 00 00       	call   801042e0 <getcallerpcs>
8010415d:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
80104160:	8b 17                	mov    (%edi),%edx
80104162:	85 d2                	test   %edx,%edx
80104164:	74 82                	je     801040e8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104166:	83 ec 08             	sub    $0x8,%esp
80104169:	83 c7 04             	add    $0x4,%edi
8010416c:	52                   	push   %edx
8010416d:	68 81 71 10 80       	push   $0x80107181
80104172:	e8 e9 c4 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104177:	83 c4 10             	add    $0x10,%esp
8010417a:	39 f7                	cmp    %esi,%edi
8010417c:	75 e2                	jne    80104160 <procdump+0x90>
8010417e:	e9 65 ff ff ff       	jmp    801040e8 <procdump+0x18>
80104183:	90                   	nop
80104184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104188:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010418b:	5b                   	pop    %ebx
8010418c:	5e                   	pop    %esi
8010418d:	5f                   	pop    %edi
8010418e:	5d                   	pop    %ebp
8010418f:	c3                   	ret    

80104190 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	53                   	push   %ebx
80104194:	83 ec 0c             	sub    $0xc,%esp
80104197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010419a:	68 b8 77 10 80       	push   $0x801077b8
8010419f:	8d 43 04             	lea    0x4(%ebx),%eax
801041a2:	50                   	push   %eax
801041a3:	e8 18 01 00 00       	call   801042c0 <initlock>
  lk->name = name;
801041a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801041ab:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801041b1:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
801041b4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801041bb:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801041be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041c1:	c9                   	leave  
801041c2:	c3                   	ret    
801041c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041d0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	56                   	push   %esi
801041d4:	53                   	push   %ebx
801041d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801041d8:	83 ec 0c             	sub    $0xc,%esp
801041db:	8d 73 04             	lea    0x4(%ebx),%esi
801041de:	56                   	push   %esi
801041df:	e8 3c 02 00 00       	call   80104420 <acquire>
  while (lk->locked) {
801041e4:	8b 13                	mov    (%ebx),%edx
801041e6:	83 c4 10             	add    $0x10,%esp
801041e9:	85 d2                	test   %edx,%edx
801041eb:	74 16                	je     80104203 <acquiresleep+0x33>
801041ed:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801041f0:	83 ec 08             	sub    $0x8,%esp
801041f3:	56                   	push   %esi
801041f4:	53                   	push   %ebx
801041f5:	e8 26 fc ff ff       	call   80103e20 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
801041fa:	8b 03                	mov    (%ebx),%eax
801041fc:	83 c4 10             	add    $0x10,%esp
801041ff:	85 c0                	test   %eax,%eax
80104201:	75 ed                	jne    801041f0 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104203:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104209:	e8 62 f6 ff ff       	call   80103870 <myproc>
8010420e:	8b 40 10             	mov    0x10(%eax),%eax
80104211:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104214:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104217:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010421a:	5b                   	pop    %ebx
8010421b:	5e                   	pop    %esi
8010421c:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
8010421d:	e9 ae 02 00 00       	jmp    801044d0 <release>
80104222:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104230 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	56                   	push   %esi
80104234:	53                   	push   %ebx
80104235:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104238:	83 ec 0c             	sub    $0xc,%esp
8010423b:	8d 73 04             	lea    0x4(%ebx),%esi
8010423e:	56                   	push   %esi
8010423f:	e8 dc 01 00 00       	call   80104420 <acquire>
  lk->locked = 0;
80104244:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010424a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104251:	89 1c 24             	mov    %ebx,(%esp)
80104254:	e8 87 fd ff ff       	call   80103fe0 <wakeup>
  release(&lk->lk);
80104259:	89 75 08             	mov    %esi,0x8(%ebp)
8010425c:	83 c4 10             	add    $0x10,%esp
}
8010425f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104262:	5b                   	pop    %ebx
80104263:	5e                   	pop    %esi
80104264:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104265:	e9 66 02 00 00       	jmp    801044d0 <release>
8010426a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104270 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104270:	55                   	push   %ebp
80104271:	89 e5                	mov    %esp,%ebp
80104273:	57                   	push   %edi
80104274:	56                   	push   %esi
80104275:	53                   	push   %ebx
80104276:	31 ff                	xor    %edi,%edi
80104278:	83 ec 18             	sub    $0x18,%esp
8010427b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010427e:	8d 73 04             	lea    0x4(%ebx),%esi
80104281:	56                   	push   %esi
80104282:	e8 99 01 00 00       	call   80104420 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104287:	8b 03                	mov    (%ebx),%eax
80104289:	83 c4 10             	add    $0x10,%esp
8010428c:	85 c0                	test   %eax,%eax
8010428e:	74 13                	je     801042a3 <holdingsleep+0x33>
80104290:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104293:	e8 d8 f5 ff ff       	call   80103870 <myproc>
80104298:	39 58 10             	cmp    %ebx,0x10(%eax)
8010429b:	0f 94 c0             	sete   %al
8010429e:	0f b6 c0             	movzbl %al,%eax
801042a1:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
801042a3:	83 ec 0c             	sub    $0xc,%esp
801042a6:	56                   	push   %esi
801042a7:	e8 24 02 00 00       	call   801044d0 <release>
  return r;
}
801042ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042af:	89 f8                	mov    %edi,%eax
801042b1:	5b                   	pop    %ebx
801042b2:	5e                   	pop    %esi
801042b3:	5f                   	pop    %edi
801042b4:	5d                   	pop    %ebp
801042b5:	c3                   	ret    
801042b6:	66 90                	xchg   %ax,%ax
801042b8:	66 90                	xchg   %ax,%ax
801042ba:	66 90                	xchg   %ax,%ax
801042bc:	66 90                	xchg   %ax,%ax
801042be:	66 90                	xchg   %ax,%ax

801042c0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801042c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801042c9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801042cf:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
801042d2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801042d9:	5d                   	pop    %ebp
801042da:	c3                   	ret    
801042db:	90                   	nop
801042dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042e0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801042e4:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801042e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801042ea:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801042ed:	31 c0                	xor    %eax,%eax
801042ef:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801042f0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801042f6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801042fc:	77 1a                	ja     80104318 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801042fe:	8b 5a 04             	mov    0x4(%edx),%ebx
80104301:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104304:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104307:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104309:	83 f8 0a             	cmp    $0xa,%eax
8010430c:	75 e2                	jne    801042f0 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010430e:	5b                   	pop    %ebx
8010430f:	5d                   	pop    %ebp
80104310:	c3                   	ret    
80104311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104318:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010431f:	83 c0 01             	add    $0x1,%eax
80104322:	83 f8 0a             	cmp    $0xa,%eax
80104325:	74 e7                	je     8010430e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104327:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010432e:	83 c0 01             	add    $0x1,%eax
80104331:	83 f8 0a             	cmp    $0xa,%eax
80104334:	75 e2                	jne    80104318 <getcallerpcs+0x38>
80104336:	eb d6                	jmp    8010430e <getcallerpcs+0x2e>
80104338:	90                   	nop
80104339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104340 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	53                   	push   %ebx
80104344:	83 ec 04             	sub    $0x4,%esp
80104347:	9c                   	pushf  
80104348:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104349:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010434a:	e8 81 f4 ff ff       	call   801037d0 <mycpu>
8010434f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104355:	85 c0                	test   %eax,%eax
80104357:	75 11                	jne    8010436a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104359:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010435f:	e8 6c f4 ff ff       	call   801037d0 <mycpu>
80104364:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010436a:	e8 61 f4 ff ff       	call   801037d0 <mycpu>
8010436f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104376:	83 c4 04             	add    $0x4,%esp
80104379:	5b                   	pop    %ebx
8010437a:	5d                   	pop    %ebp
8010437b:	c3                   	ret    
8010437c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104380 <popcli>:

void
popcli(void)
{
80104380:	55                   	push   %ebp
80104381:	89 e5                	mov    %esp,%ebp
80104383:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104386:	9c                   	pushf  
80104387:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104388:	f6 c4 02             	test   $0x2,%ah
8010438b:	75 52                	jne    801043df <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010438d:	e8 3e f4 ff ff       	call   801037d0 <mycpu>
80104392:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104398:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010439b:	85 d2                	test   %edx,%edx
8010439d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801043a3:	78 2d                	js     801043d2 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801043a5:	e8 26 f4 ff ff       	call   801037d0 <mycpu>
801043aa:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801043b0:	85 d2                	test   %edx,%edx
801043b2:	74 0c                	je     801043c0 <popcli+0x40>
    sti();
}
801043b4:	c9                   	leave  
801043b5:	c3                   	ret    
801043b6:	8d 76 00             	lea    0x0(%esi),%esi
801043b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801043c0:	e8 0b f4 ff ff       	call   801037d0 <mycpu>
801043c5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801043cb:	85 c0                	test   %eax,%eax
801043cd:	74 e5                	je     801043b4 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
801043cf:	fb                   	sti    
    sti();
}
801043d0:	c9                   	leave  
801043d1:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
801043d2:	83 ec 0c             	sub    $0xc,%esp
801043d5:	68 da 77 10 80       	push   $0x801077da
801043da:	e8 91 bf ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
801043df:	83 ec 0c             	sub    $0xc,%esp
801043e2:	68 c3 77 10 80       	push   $0x801077c3
801043e7:	e8 84 bf ff ff       	call   80100370 <panic>
801043ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043f0 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
801043f0:	55                   	push   %ebp
801043f1:	89 e5                	mov    %esp,%ebp
801043f3:	56                   	push   %esi
801043f4:	53                   	push   %ebx
801043f5:	8b 75 08             	mov    0x8(%ebp),%esi
801043f8:	31 db                	xor    %ebx,%ebx
  int r;
  pushcli();
801043fa:	e8 41 ff ff ff       	call   80104340 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801043ff:	8b 06                	mov    (%esi),%eax
80104401:	85 c0                	test   %eax,%eax
80104403:	74 10                	je     80104415 <holding+0x25>
80104405:	8b 5e 08             	mov    0x8(%esi),%ebx
80104408:	e8 c3 f3 ff ff       	call   801037d0 <mycpu>
8010440d:	39 c3                	cmp    %eax,%ebx
8010440f:	0f 94 c3             	sete   %bl
80104412:	0f b6 db             	movzbl %bl,%ebx
  popcli();
80104415:	e8 66 ff ff ff       	call   80104380 <popcli>
  return r;
}
8010441a:	89 d8                	mov    %ebx,%eax
8010441c:	5b                   	pop    %ebx
8010441d:	5e                   	pop    %esi
8010441e:	5d                   	pop    %ebp
8010441f:	c3                   	ret    

80104420 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	53                   	push   %ebx
80104424:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104427:	e8 14 ff ff ff       	call   80104340 <pushcli>
  if(holding(lk))
8010442c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010442f:	83 ec 0c             	sub    $0xc,%esp
80104432:	53                   	push   %ebx
80104433:	e8 b8 ff ff ff       	call   801043f0 <holding>
80104438:	83 c4 10             	add    $0x10,%esp
8010443b:	85 c0                	test   %eax,%eax
8010443d:	0f 85 7d 00 00 00    	jne    801044c0 <acquire+0xa0>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104443:	ba 01 00 00 00       	mov    $0x1,%edx
80104448:	eb 09                	jmp    80104453 <acquire+0x33>
8010444a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104450:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104453:	89 d0                	mov    %edx,%eax
80104455:	f0 87 03             	lock xchg %eax,(%ebx)
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104458:	85 c0                	test   %eax,%eax
8010445a:	75 f4                	jne    80104450 <acquire+0x30>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
8010445c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
80104461:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104464:	e8 67 f3 ff ff       	call   801037d0 <mycpu>
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104469:	89 ea                	mov    %ebp,%edx
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
8010446b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
8010446e:	89 43 08             	mov    %eax,0x8(%ebx)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104471:	31 c0                	xor    %eax,%eax
80104473:	90                   	nop
80104474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104478:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
8010447e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104484:	77 1a                	ja     801044a0 <acquire+0x80>
      break;
    pcs[i] = ebp[1];     // saved %eip
80104486:	8b 5a 04             	mov    0x4(%edx),%ebx
80104489:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
8010448c:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
8010448f:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104491:	83 f8 0a             	cmp    $0xa,%eax
80104494:	75 e2                	jne    80104478 <acquire+0x58>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
}
80104496:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104499:	c9                   	leave  
8010449a:	c3                   	ret    
8010449b:	90                   	nop
8010449c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801044a0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801044a7:	83 c0 01             	add    $0x1,%eax
801044aa:	83 f8 0a             	cmp    $0xa,%eax
801044ad:	74 e7                	je     80104496 <acquire+0x76>
    pcs[i] = 0;
801044af:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801044b6:	83 c0 01             	add    $0x1,%eax
801044b9:	83 f8 0a             	cmp    $0xa,%eax
801044bc:	75 e2                	jne    801044a0 <acquire+0x80>
801044be:	eb d6                	jmp    80104496 <acquire+0x76>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
801044c0:	83 ec 0c             	sub    $0xc,%esp
801044c3:	68 e1 77 10 80       	push   $0x801077e1
801044c8:	e8 a3 be ff ff       	call   80100370 <panic>
801044cd:	8d 76 00             	lea    0x0(%esi),%esi

801044d0 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	53                   	push   %ebx
801044d4:	83 ec 10             	sub    $0x10,%esp
801044d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
801044da:	53                   	push   %ebx
801044db:	e8 10 ff ff ff       	call   801043f0 <holding>
801044e0:	83 c4 10             	add    $0x10,%esp
801044e3:	85 c0                	test   %eax,%eax
801044e5:	74 22                	je     80104509 <release+0x39>
    panic("release");

  lk->pcs[0] = 0;
801044e7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801044ee:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
801044f5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801044fa:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
80104500:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104503:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104504:	e9 77 fe ff ff       	jmp    80104380 <popcli>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
80104509:	83 ec 0c             	sub    $0xc,%esp
8010450c:	68 e9 77 10 80       	push   $0x801077e9
80104511:	e8 5a be ff ff       	call   80100370 <panic>
80104516:	66 90                	xchg   %ax,%ax
80104518:	66 90                	xchg   %ax,%ax
8010451a:	66 90                	xchg   %ax,%ax
8010451c:	66 90                	xchg   %ax,%ax
8010451e:	66 90                	xchg   %ax,%ax

80104520 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	57                   	push   %edi
80104524:	53                   	push   %ebx
80104525:	8b 55 08             	mov    0x8(%ebp),%edx
80104528:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010452b:	f6 c2 03             	test   $0x3,%dl
8010452e:	75 05                	jne    80104535 <memset+0x15>
80104530:	f6 c1 03             	test   $0x3,%cl
80104533:	74 13                	je     80104548 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104535:	89 d7                	mov    %edx,%edi
80104537:	8b 45 0c             	mov    0xc(%ebp),%eax
8010453a:	fc                   	cld    
8010453b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010453d:	5b                   	pop    %ebx
8010453e:	89 d0                	mov    %edx,%eax
80104540:	5f                   	pop    %edi
80104541:	5d                   	pop    %ebp
80104542:	c3                   	ret    
80104543:	90                   	nop
80104544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104548:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
8010454c:	c1 e9 02             	shr    $0x2,%ecx
8010454f:	89 fb                	mov    %edi,%ebx
80104551:	89 f8                	mov    %edi,%eax
80104553:	c1 e3 18             	shl    $0x18,%ebx
80104556:	c1 e0 10             	shl    $0x10,%eax
80104559:	09 d8                	or     %ebx,%eax
8010455b:	09 f8                	or     %edi,%eax
8010455d:	c1 e7 08             	shl    $0x8,%edi
80104560:	09 f8                	or     %edi,%eax
80104562:	89 d7                	mov    %edx,%edi
80104564:	fc                   	cld    
80104565:	f3 ab                	rep stos %eax,%es:(%edi)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104567:	5b                   	pop    %ebx
80104568:	89 d0                	mov    %edx,%eax
8010456a:	5f                   	pop    %edi
8010456b:	5d                   	pop    %ebp
8010456c:	c3                   	ret    
8010456d:	8d 76 00             	lea    0x0(%esi),%esi

80104570 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104570:	55                   	push   %ebp
80104571:	89 e5                	mov    %esp,%ebp
80104573:	57                   	push   %edi
80104574:	56                   	push   %esi
80104575:	8b 45 10             	mov    0x10(%ebp),%eax
80104578:	53                   	push   %ebx
80104579:	8b 75 0c             	mov    0xc(%ebp),%esi
8010457c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010457f:	85 c0                	test   %eax,%eax
80104581:	74 29                	je     801045ac <memcmp+0x3c>
    if(*s1 != *s2)
80104583:	0f b6 13             	movzbl (%ebx),%edx
80104586:	0f b6 0e             	movzbl (%esi),%ecx
80104589:	38 d1                	cmp    %dl,%cl
8010458b:	75 2b                	jne    801045b8 <memcmp+0x48>
8010458d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104590:	31 c0                	xor    %eax,%eax
80104592:	eb 14                	jmp    801045a8 <memcmp+0x38>
80104594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104598:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010459d:	83 c0 01             	add    $0x1,%eax
801045a0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801045a4:	38 ca                	cmp    %cl,%dl
801045a6:	75 10                	jne    801045b8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801045a8:	39 f8                	cmp    %edi,%eax
801045aa:	75 ec                	jne    80104598 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
801045ac:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801045ad:	31 c0                	xor    %eax,%eax
}
801045af:	5e                   	pop    %esi
801045b0:	5f                   	pop    %edi
801045b1:	5d                   	pop    %ebp
801045b2:	c3                   	ret    
801045b3:	90                   	nop
801045b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801045b8:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
801045bb:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801045bc:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
801045be:	5e                   	pop    %esi
801045bf:	5f                   	pop    %edi
801045c0:	5d                   	pop    %ebp
801045c1:	c3                   	ret    
801045c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045d0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	56                   	push   %esi
801045d4:	53                   	push   %ebx
801045d5:	8b 45 08             	mov    0x8(%ebp),%eax
801045d8:	8b 75 0c             	mov    0xc(%ebp),%esi
801045db:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801045de:	39 c6                	cmp    %eax,%esi
801045e0:	73 2e                	jae    80104610 <memmove+0x40>
801045e2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801045e5:	39 c8                	cmp    %ecx,%eax
801045e7:	73 27                	jae    80104610 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
801045e9:	85 db                	test   %ebx,%ebx
801045eb:	8d 53 ff             	lea    -0x1(%ebx),%edx
801045ee:	74 17                	je     80104607 <memmove+0x37>
      *--d = *--s;
801045f0:	29 d9                	sub    %ebx,%ecx
801045f2:	89 cb                	mov    %ecx,%ebx
801045f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045f8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801045fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
801045ff:	83 ea 01             	sub    $0x1,%edx
80104602:	83 fa ff             	cmp    $0xffffffff,%edx
80104605:	75 f1                	jne    801045f8 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104607:	5b                   	pop    %ebx
80104608:	5e                   	pop    %esi
80104609:	5d                   	pop    %ebp
8010460a:	c3                   	ret    
8010460b:	90                   	nop
8010460c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104610:	31 d2                	xor    %edx,%edx
80104612:	85 db                	test   %ebx,%ebx
80104614:	74 f1                	je     80104607 <memmove+0x37>
80104616:	8d 76 00             	lea    0x0(%esi),%esi
80104619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *d++ = *s++;
80104620:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104624:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104627:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010462a:	39 d3                	cmp    %edx,%ebx
8010462c:	75 f2                	jne    80104620 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
8010462e:	5b                   	pop    %ebx
8010462f:	5e                   	pop    %esi
80104630:	5d                   	pop    %ebp
80104631:	c3                   	ret    
80104632:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104640 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104643:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104644:	eb 8a                	jmp    801045d0 <memmove>
80104646:	8d 76 00             	lea    0x0(%esi),%esi
80104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104650 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	57                   	push   %edi
80104654:	56                   	push   %esi
80104655:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104658:	53                   	push   %ebx
80104659:	8b 7d 08             	mov    0x8(%ebp),%edi
8010465c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010465f:	85 c9                	test   %ecx,%ecx
80104661:	74 37                	je     8010469a <strncmp+0x4a>
80104663:	0f b6 17             	movzbl (%edi),%edx
80104666:	0f b6 1e             	movzbl (%esi),%ebx
80104669:	84 d2                	test   %dl,%dl
8010466b:	74 3f                	je     801046ac <strncmp+0x5c>
8010466d:	38 d3                	cmp    %dl,%bl
8010466f:	75 3b                	jne    801046ac <strncmp+0x5c>
80104671:	8d 47 01             	lea    0x1(%edi),%eax
80104674:	01 cf                	add    %ecx,%edi
80104676:	eb 1b                	jmp    80104693 <strncmp+0x43>
80104678:	90                   	nop
80104679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104680:	0f b6 10             	movzbl (%eax),%edx
80104683:	84 d2                	test   %dl,%dl
80104685:	74 21                	je     801046a8 <strncmp+0x58>
80104687:	0f b6 19             	movzbl (%ecx),%ebx
8010468a:	83 c0 01             	add    $0x1,%eax
8010468d:	89 ce                	mov    %ecx,%esi
8010468f:	38 da                	cmp    %bl,%dl
80104691:	75 19                	jne    801046ac <strncmp+0x5c>
80104693:	39 c7                	cmp    %eax,%edi
    n--, p++, q++;
80104695:	8d 4e 01             	lea    0x1(%esi),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
80104698:	75 e6                	jne    80104680 <strncmp+0x30>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
8010469a:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
8010469b:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
8010469d:	5e                   	pop    %esi
8010469e:	5f                   	pop    %edi
8010469f:	5d                   	pop    %ebp
801046a0:	c3                   	ret    
801046a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046a8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801046ac:	0f b6 c2             	movzbl %dl,%eax
801046af:	29 d8                	sub    %ebx,%eax
}
801046b1:	5b                   	pop    %ebx
801046b2:	5e                   	pop    %esi
801046b3:	5f                   	pop    %edi
801046b4:	5d                   	pop    %ebp
801046b5:	c3                   	ret    
801046b6:	8d 76 00             	lea    0x0(%esi),%esi
801046b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046c0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	56                   	push   %esi
801046c4:	53                   	push   %ebx
801046c5:	8b 45 08             	mov    0x8(%ebp),%eax
801046c8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801046cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801046ce:	89 c2                	mov    %eax,%edx
801046d0:	eb 19                	jmp    801046eb <strncpy+0x2b>
801046d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046d8:	83 c3 01             	add    $0x1,%ebx
801046db:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801046df:	83 c2 01             	add    $0x1,%edx
801046e2:	84 c9                	test   %cl,%cl
801046e4:	88 4a ff             	mov    %cl,-0x1(%edx)
801046e7:	74 09                	je     801046f2 <strncpy+0x32>
801046e9:	89 f1                	mov    %esi,%ecx
801046eb:	85 c9                	test   %ecx,%ecx
801046ed:	8d 71 ff             	lea    -0x1(%ecx),%esi
801046f0:	7f e6                	jg     801046d8 <strncpy+0x18>
    ;
  while(n-- > 0)
801046f2:	31 c9                	xor    %ecx,%ecx
801046f4:	85 f6                	test   %esi,%esi
801046f6:	7e 17                	jle    8010470f <strncpy+0x4f>
801046f8:	90                   	nop
801046f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104700:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104704:	89 f3                	mov    %esi,%ebx
80104706:	83 c1 01             	add    $0x1,%ecx
80104709:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
8010470b:	85 db                	test   %ebx,%ebx
8010470d:	7f f1                	jg     80104700 <strncpy+0x40>
    *s++ = 0;
  return os;
}
8010470f:	5b                   	pop    %ebx
80104710:	5e                   	pop    %esi
80104711:	5d                   	pop    %ebp
80104712:	c3                   	ret    
80104713:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104720 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	56                   	push   %esi
80104724:	53                   	push   %ebx
80104725:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104728:	8b 45 08             	mov    0x8(%ebp),%eax
8010472b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010472e:	85 c9                	test   %ecx,%ecx
80104730:	7e 26                	jle    80104758 <safestrcpy+0x38>
80104732:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104736:	89 c1                	mov    %eax,%ecx
80104738:	eb 17                	jmp    80104751 <safestrcpy+0x31>
8010473a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104740:	83 c2 01             	add    $0x1,%edx
80104743:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104747:	83 c1 01             	add    $0x1,%ecx
8010474a:	84 db                	test   %bl,%bl
8010474c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010474f:	74 04                	je     80104755 <safestrcpy+0x35>
80104751:	39 f2                	cmp    %esi,%edx
80104753:	75 eb                	jne    80104740 <safestrcpy+0x20>
    ;
  *s = 0;
80104755:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104758:	5b                   	pop    %ebx
80104759:	5e                   	pop    %esi
8010475a:	5d                   	pop    %ebp
8010475b:	c3                   	ret    
8010475c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104760 <strlen>:

int
strlen(const char *s)
{
80104760:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104761:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104763:	89 e5                	mov    %esp,%ebp
80104765:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104768:	80 3a 00             	cmpb   $0x0,(%edx)
8010476b:	74 0c                	je     80104779 <strlen+0x19>
8010476d:	8d 76 00             	lea    0x0(%esi),%esi
80104770:	83 c0 01             	add    $0x1,%eax
80104773:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104777:	75 f7                	jne    80104770 <strlen+0x10>
    ;
  return n;
}
80104779:	5d                   	pop    %ebp
8010477a:	c3                   	ret    

8010477b <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010477b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010477f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80104783:	55                   	push   %ebp
  pushl %ebx
80104784:	53                   	push   %ebx
  pushl %esi
80104785:	56                   	push   %esi
  pushl %edi
80104786:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104787:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104789:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
8010478b:	5f                   	pop    %edi
  popl %esi
8010478c:	5e                   	pop    %esi
  popl %ebx
8010478d:	5b                   	pop    %ebx
  popl %ebp
8010478e:	5d                   	pop    %ebp
  ret
8010478f:	c3                   	ret    

80104790 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104790:	55                   	push   %ebp
80104791:	89 e5                	mov    %esp,%ebp
80104793:	53                   	push   %ebx
80104794:	83 ec 04             	sub    $0x4,%esp
80104797:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010479a:	e8 d1 f0 ff ff       	call   80103870 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010479f:	8b 00                	mov    (%eax),%eax
801047a1:	39 d8                	cmp    %ebx,%eax
801047a3:	76 1b                	jbe    801047c0 <fetchint+0x30>
801047a5:	8d 53 04             	lea    0x4(%ebx),%edx
801047a8:	39 d0                	cmp    %edx,%eax
801047aa:	72 14                	jb     801047c0 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
801047ac:	8b 45 0c             	mov    0xc(%ebp),%eax
801047af:	8b 13                	mov    (%ebx),%edx
801047b1:	89 10                	mov    %edx,(%eax)
  return 0;
801047b3:	31 c0                	xor    %eax,%eax
}
801047b5:	83 c4 04             	add    $0x4,%esp
801047b8:	5b                   	pop    %ebx
801047b9:	5d                   	pop    %ebp
801047ba:	c3                   	ret    
801047bb:	90                   	nop
801047bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
801047c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047c5:	eb ee                	jmp    801047b5 <fetchint+0x25>
801047c7:	89 f6                	mov    %esi,%esi
801047c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047d0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801047d0:	55                   	push   %ebp
801047d1:	89 e5                	mov    %esp,%ebp
801047d3:	53                   	push   %ebx
801047d4:	83 ec 04             	sub    $0x4,%esp
801047d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801047da:	e8 91 f0 ff ff       	call   80103870 <myproc>

  if(addr >= curproc->sz)
801047df:	39 18                	cmp    %ebx,(%eax)
801047e1:	76 29                	jbe    8010480c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
801047e3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801047e6:	89 da                	mov    %ebx,%edx
801047e8:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
801047ea:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
801047ec:	39 c3                	cmp    %eax,%ebx
801047ee:	73 1c                	jae    8010480c <fetchstr+0x3c>
    if(*s == 0)
801047f0:	80 3b 00             	cmpb   $0x0,(%ebx)
801047f3:	75 10                	jne    80104805 <fetchstr+0x35>
801047f5:	eb 29                	jmp    80104820 <fetchstr+0x50>
801047f7:	89 f6                	mov    %esi,%esi
801047f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104800:	80 3a 00             	cmpb   $0x0,(%edx)
80104803:	74 1b                	je     80104820 <fetchstr+0x50>

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104805:	83 c2 01             	add    $0x1,%edx
80104808:	39 d0                	cmp    %edx,%eax
8010480a:	77 f4                	ja     80104800 <fetchstr+0x30>
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
8010480c:	83 c4 04             	add    $0x4,%esp
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
    return -1;
8010480f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104814:	5b                   	pop    %ebx
80104815:	5d                   	pop    %ebp
80104816:	c3                   	ret    
80104817:	89 f6                	mov    %esi,%esi
80104819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104820:	83 c4 04             	add    $0x4,%esp
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
80104823:	89 d0                	mov    %edx,%eax
80104825:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104827:	5b                   	pop    %ebx
80104828:	5d                   	pop    %ebp
80104829:	c3                   	ret    
8010482a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104830 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	56                   	push   %esi
80104834:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104835:	e8 36 f0 ff ff       	call   80103870 <myproc>
8010483a:	8b 40 18             	mov    0x18(%eax),%eax
8010483d:	8b 55 08             	mov    0x8(%ebp),%edx
80104840:	8b 40 44             	mov    0x44(%eax),%eax
80104843:	8d 1c 90             	lea    (%eax,%edx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();
80104846:	e8 25 f0 ff ff       	call   80103870 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010484b:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010484d:	8d 73 04             	lea    0x4(%ebx),%esi
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104850:	39 c6                	cmp    %eax,%esi
80104852:	73 1c                	jae    80104870 <argint+0x40>
80104854:	8d 53 08             	lea    0x8(%ebx),%edx
80104857:	39 d0                	cmp    %edx,%eax
80104859:	72 15                	jb     80104870 <argint+0x40>
    return -1;
  *ip = *(int*)(addr);
8010485b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010485e:	8b 53 04             	mov    0x4(%ebx),%edx
80104861:	89 10                	mov    %edx,(%eax)
  return 0;
80104863:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
80104865:	5b                   	pop    %ebx
80104866:	5e                   	pop    %esi
80104867:	5d                   	pop    %ebp
80104868:	c3                   	ret    
80104869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
80104870:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104875:	eb ee                	jmp    80104865 <argint+0x35>
80104877:	89 f6                	mov    %esi,%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104880 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104880:	55                   	push   %ebp
80104881:	89 e5                	mov    %esp,%ebp
80104883:	56                   	push   %esi
80104884:	53                   	push   %ebx
80104885:	83 ec 10             	sub    $0x10,%esp
80104888:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010488b:	e8 e0 ef ff ff       	call   80103870 <myproc>
80104890:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104892:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104895:	83 ec 08             	sub    $0x8,%esp
80104898:	50                   	push   %eax
80104899:	ff 75 08             	pushl  0x8(%ebp)
8010489c:	e8 8f ff ff ff       	call   80104830 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
801048a1:	c1 e8 1f             	shr    $0x1f,%eax
801048a4:	83 c4 10             	add    $0x10,%esp
801048a7:	84 c0                	test   %al,%al
801048a9:	75 2d                	jne    801048d8 <argptr+0x58>
801048ab:	89 d8                	mov    %ebx,%eax
801048ad:	c1 e8 1f             	shr    $0x1f,%eax
801048b0:	84 c0                	test   %al,%al
801048b2:	75 24                	jne    801048d8 <argptr+0x58>
801048b4:	8b 16                	mov    (%esi),%edx
801048b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801048b9:	39 c2                	cmp    %eax,%edx
801048bb:	76 1b                	jbe    801048d8 <argptr+0x58>
801048bd:	01 c3                	add    %eax,%ebx
801048bf:	39 da                	cmp    %ebx,%edx
801048c1:	72 15                	jb     801048d8 <argptr+0x58>
    return -1;
  *pp = (char*)i;
801048c3:	8b 55 0c             	mov    0xc(%ebp),%edx
801048c6:	89 02                	mov    %eax,(%edx)
  return 0;
801048c8:	31 c0                	xor    %eax,%eax
}
801048ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
801048cd:	5b                   	pop    %ebx
801048ce:	5e                   	pop    %esi
801048cf:	5d                   	pop    %ebp
801048d0:	c3                   	ret    
801048d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
801048d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048dd:	eb eb                	jmp    801048ca <argptr+0x4a>
801048df:	90                   	nop

801048e0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801048e0:	55                   	push   %ebp
801048e1:	89 e5                	mov    %esp,%ebp
801048e3:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
801048e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048e9:	50                   	push   %eax
801048ea:	ff 75 08             	pushl  0x8(%ebp)
801048ed:	e8 3e ff ff ff       	call   80104830 <argint>
801048f2:	83 c4 10             	add    $0x10,%esp
801048f5:	85 c0                	test   %eax,%eax
801048f7:	78 17                	js     80104910 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
801048f9:	83 ec 08             	sub    $0x8,%esp
801048fc:	ff 75 0c             	pushl  0xc(%ebp)
801048ff:	ff 75 f4             	pushl  -0xc(%ebp)
80104902:	e8 c9 fe ff ff       	call   801047d0 <fetchstr>
80104907:	83 c4 10             	add    $0x10,%esp
}
8010490a:	c9                   	leave  
8010490b:	c3                   	ret    
8010490c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104910:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104915:	c9                   	leave  
80104916:	c3                   	ret    
80104917:	89 f6                	mov    %esi,%esi
80104919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104920 <syscall>:
    "getprocs",
};

void
syscall(void)
{
80104920:	55                   	push   %ebp
80104921:	89 e5                	mov    %esp,%ebp
80104923:	57                   	push   %edi
80104924:	56                   	push   %esi
80104925:	53                   	push   %ebx
80104926:	83 ec 1c             	sub    $0x1c,%esp
  int num;
  struct proc *curproc = myproc();
80104929:	e8 42 ef ff ff       	call   80103870 <myproc>

  num = curproc->tf->eax;
8010492e:	8b 78 18             	mov    0x18(%eax),%edi

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
80104931:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104933:	8b 77 1c             	mov    0x1c(%edi),%esi
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104936:	8d 56 ff             	lea    -0x1(%esi),%edx
80104939:	83 fa 16             	cmp    $0x16,%edx
8010493c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010493f:	77 57                	ja     80104998 <syscall+0x78>
80104941:	8b 04 b5 60 78 10 80 	mov    -0x7fef87a0(,%esi,4),%eax
80104948:	85 c0                	test   %eax,%eax
8010494a:	74 4c                	je     80104998 <syscall+0x78>
    curproc->tf->eax = syscalls[num]();
8010494c:	ff d0                	call   *%eax
8010494e:	89 47 1c             	mov    %eax,0x1c(%edi)
    if(curproc->tracing){
80104951:	8b 43 7c             	mov    0x7c(%ebx),%eax
80104954:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104957:	85 c0                	test   %eax,%eax
80104959:	74 5c                	je     801049b7 <syscall+0x97>
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
8010495b:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010495e:	83 ec 08             	sub    $0x8,%esp
80104961:	ff b3 80 00 00 00    	pushl  0x80(%ebx)
80104967:	56                   	push   %esi
80104968:	8d 84 00 20 a0 10 80 	lea    -0x7fef5fe0(%eax,%eax,1),%eax
8010496f:	50                   	push   %eax
80104970:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104973:	50                   	push   %eax
80104974:	ff 73 10             	pushl  0x10(%ebx)
80104977:	68 f4 77 10 80       	push   $0x801077f4
8010497c:	e8 df bc ff ff       	call   80100660 <cprintf>
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
  curproc->sysCallCount++;
80104981:	83 83 80 00 00 00 01 	addl   $0x1,0x80(%ebx)

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
    if(curproc->tracing){
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
80104988:	83 c4 20             	add    $0x20,%esp
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
  curproc->sysCallCount++;
}
8010498b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010498e:	5b                   	pop    %ebx
8010498f:	5e                   	pop    %esi
80104990:	5f                   	pop    %edi
80104991:	5d                   	pop    %ebp
80104992:	c3                   	ret    
80104993:	90                   	nop
80104994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->tracing){
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
    }
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
80104998:	8d 43 6c             	lea    0x6c(%ebx),%eax
    curproc->tf->eax = syscalls[num]();
    if(curproc->tracing){
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
    }
  } else {
    cprintf("%d %s: unknown sys call %d\n",
8010499b:	56                   	push   %esi
8010499c:	50                   	push   %eax
8010499d:	ff 73 10             	pushl  0x10(%ebx)
801049a0:	68 35 78 10 80       	push   $0x80107835
801049a5:	e8 b6 bc ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
801049aa:	8b 43 18             	mov    0x18(%ebx),%eax
801049ad:	83 c4 10             	add    $0x10,%esp
801049b0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
  curproc->sysCallCount++;
801049b7:	83 83 80 00 00 00 01 	addl   $0x1,0x80(%ebx)
}
801049be:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049c1:	5b                   	pop    %ebx
801049c2:	5e                   	pop    %esi
801049c3:	5f                   	pop    %edi
801049c4:	5d                   	pop    %ebp
801049c5:	c3                   	ret    
801049c6:	66 90                	xchg   %ax,%ax
801049c8:	66 90                	xchg   %ax,%ax
801049ca:	66 90                	xchg   %ax,%ax
801049cc:	66 90                	xchg   %ax,%ax
801049ce:	66 90                	xchg   %ax,%ax

801049d0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049d0:	55                   	push   %ebp
801049d1:	89 e5                	mov    %esp,%ebp
801049d3:	57                   	push   %edi
801049d4:	56                   	push   %esi
801049d5:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049d6:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049d9:	83 ec 34             	sub    $0x34,%esp
801049dc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
801049df:	8b 4d 08             	mov    0x8(%ebp),%ecx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049e2:	56                   	push   %esi
801049e3:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049e4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
801049e7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049ea:	e8 b1 d5 ff ff       	call   80101fa0 <nameiparent>
801049ef:	83 c4 10             	add    $0x10,%esp
801049f2:	85 c0                	test   %eax,%eax
801049f4:	0f 84 f6 00 00 00    	je     80104af0 <create+0x120>
    return 0;
  ilock(dp);
801049fa:	83 ec 0c             	sub    $0xc,%esp
801049fd:	89 c7                	mov    %eax,%edi
801049ff:	50                   	push   %eax
80104a00:	e8 2b cd ff ff       	call   80101730 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104a05:	83 c4 0c             	add    $0xc,%esp
80104a08:	6a 00                	push   $0x0
80104a0a:	56                   	push   %esi
80104a0b:	57                   	push   %edi
80104a0c:	e8 4f d2 ff ff       	call   80101c60 <dirlookup>
80104a11:	83 c4 10             	add    $0x10,%esp
80104a14:	85 c0                	test   %eax,%eax
80104a16:	89 c3                	mov    %eax,%ebx
80104a18:	74 56                	je     80104a70 <create+0xa0>
    iunlockput(dp);
80104a1a:	83 ec 0c             	sub    $0xc,%esp
80104a1d:	57                   	push   %edi
80104a1e:	e8 9d cf ff ff       	call   801019c0 <iunlockput>
    ilock(ip);
80104a23:	89 1c 24             	mov    %ebx,(%esp)
80104a26:	e8 05 cd ff ff       	call   80101730 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104a2b:	83 c4 10             	add    $0x10,%esp
80104a2e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104a33:	75 1b                	jne    80104a50 <create+0x80>
80104a35:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104a3a:	89 d8                	mov    %ebx,%eax
80104a3c:	75 12                	jne    80104a50 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a41:	5b                   	pop    %ebx
80104a42:	5e                   	pop    %esi
80104a43:	5f                   	pop    %edi
80104a44:	5d                   	pop    %ebp
80104a45:	c3                   	ret    
80104a46:	8d 76 00             	lea    0x0(%esi),%esi
80104a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if((ip = dirlookup(dp, name, 0)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104a50:	83 ec 0c             	sub    $0xc,%esp
80104a53:	53                   	push   %ebx
80104a54:	e8 67 cf ff ff       	call   801019c0 <iunlockput>
    return 0;
80104a59:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104a5f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a61:	5b                   	pop    %ebx
80104a62:	5e                   	pop    %esi
80104a63:	5f                   	pop    %edi
80104a64:	5d                   	pop    %ebp
80104a65:	c3                   	ret    
80104a66:	8d 76 00             	lea    0x0(%esi),%esi
80104a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104a70:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104a74:	83 ec 08             	sub    $0x8,%esp
80104a77:	50                   	push   %eax
80104a78:	ff 37                	pushl  (%edi)
80104a7a:	e8 41 cb ff ff       	call   801015c0 <ialloc>
80104a7f:	83 c4 10             	add    $0x10,%esp
80104a82:	85 c0                	test   %eax,%eax
80104a84:	89 c3                	mov    %eax,%ebx
80104a86:	0f 84 cc 00 00 00    	je     80104b58 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104a8c:	83 ec 0c             	sub    $0xc,%esp
80104a8f:	50                   	push   %eax
80104a90:	e8 9b cc ff ff       	call   80101730 <ilock>
  ip->major = major;
80104a95:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104a99:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104a9d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104aa1:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104aa5:	b8 01 00 00 00       	mov    $0x1,%eax
80104aaa:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104aae:	89 1c 24             	mov    %ebx,(%esp)
80104ab1:	e8 ca cb ff ff       	call   80101680 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104ab6:	83 c4 10             	add    $0x10,%esp
80104ab9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104abe:	74 40                	je     80104b00 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104ac0:	83 ec 04             	sub    $0x4,%esp
80104ac3:	ff 73 04             	pushl  0x4(%ebx)
80104ac6:	56                   	push   %esi
80104ac7:	57                   	push   %edi
80104ac8:	e8 f3 d3 ff ff       	call   80101ec0 <dirlink>
80104acd:	83 c4 10             	add    $0x10,%esp
80104ad0:	85 c0                	test   %eax,%eax
80104ad2:	78 77                	js     80104b4b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104ad4:	83 ec 0c             	sub    $0xc,%esp
80104ad7:	57                   	push   %edi
80104ad8:	e8 e3 ce ff ff       	call   801019c0 <iunlockput>

  return ip;
80104add:	83 c4 10             	add    $0x10,%esp
}
80104ae0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104ae3:	89 d8                	mov    %ebx,%eax
}
80104ae5:	5b                   	pop    %ebx
80104ae6:	5e                   	pop    %esi
80104ae7:	5f                   	pop    %edi
80104ae8:	5d                   	pop    %ebp
80104ae9:	c3                   	ret    
80104aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104af0:	31 c0                	xor    %eax,%eax
80104af2:	e9 47 ff ff ff       	jmp    80104a3e <create+0x6e>
80104af7:	89 f6                	mov    %esi,%esi
80104af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104b00:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104b05:	83 ec 0c             	sub    $0xc,%esp
80104b08:	57                   	push   %edi
80104b09:	e8 72 cb ff ff       	call   80101680 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104b0e:	83 c4 0c             	add    $0xc,%esp
80104b11:	ff 73 04             	pushl  0x4(%ebx)
80104b14:	68 dc 78 10 80       	push   $0x801078dc
80104b19:	53                   	push   %ebx
80104b1a:	e8 a1 d3 ff ff       	call   80101ec0 <dirlink>
80104b1f:	83 c4 10             	add    $0x10,%esp
80104b22:	85 c0                	test   %eax,%eax
80104b24:	78 18                	js     80104b3e <create+0x16e>
80104b26:	83 ec 04             	sub    $0x4,%esp
80104b29:	ff 77 04             	pushl  0x4(%edi)
80104b2c:	68 db 78 10 80       	push   $0x801078db
80104b31:	53                   	push   %ebx
80104b32:	e8 89 d3 ff ff       	call   80101ec0 <dirlink>
80104b37:	83 c4 10             	add    $0x10,%esp
80104b3a:	85 c0                	test   %eax,%eax
80104b3c:	79 82                	jns    80104ac0 <create+0xf0>
      panic("create dots");
80104b3e:	83 ec 0c             	sub    $0xc,%esp
80104b41:	68 cf 78 10 80       	push   $0x801078cf
80104b46:	e8 25 b8 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104b4b:	83 ec 0c             	sub    $0xc,%esp
80104b4e:	68 de 78 10 80       	push   $0x801078de
80104b53:	e8 18 b8 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104b58:	83 ec 0c             	sub    $0xc,%esp
80104b5b:	68 c0 78 10 80       	push   $0x801078c0
80104b60:	e8 0b b8 ff ff       	call   80100370 <panic>
80104b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b70 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104b70:	55                   	push   %ebp
80104b71:	89 e5                	mov    %esp,%ebp
80104b73:	56                   	push   %esi
80104b74:	53                   	push   %ebx
80104b75:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104b77:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104b7a:	89 d3                	mov    %edx,%ebx
80104b7c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104b7f:	50                   	push   %eax
80104b80:	6a 00                	push   $0x0
80104b82:	e8 a9 fc ff ff       	call   80104830 <argint>
80104b87:	83 c4 10             	add    $0x10,%esp
80104b8a:	85 c0                	test   %eax,%eax
80104b8c:	78 32                	js     80104bc0 <argfd.constprop.0+0x50>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104b8e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104b92:	77 2c                	ja     80104bc0 <argfd.constprop.0+0x50>
80104b94:	e8 d7 ec ff ff       	call   80103870 <myproc>
80104b99:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b9c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104ba0:	85 c0                	test   %eax,%eax
80104ba2:	74 1c                	je     80104bc0 <argfd.constprop.0+0x50>
    return -1;
  if(pfd)
80104ba4:	85 f6                	test   %esi,%esi
80104ba6:	74 02                	je     80104baa <argfd.constprop.0+0x3a>
    *pfd = fd;
80104ba8:	89 16                	mov    %edx,(%esi)
  if(pf)
80104baa:	85 db                	test   %ebx,%ebx
80104bac:	74 22                	je     80104bd0 <argfd.constprop.0+0x60>
    *pf = f;
80104bae:	89 03                	mov    %eax,(%ebx)
  return 0;
80104bb0:	31 c0                	xor    %eax,%eax
}
80104bb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104bb5:	5b                   	pop    %ebx
80104bb6:	5e                   	pop    %esi
80104bb7:	5d                   	pop    %ebp
80104bb8:	c3                   	ret    
80104bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bc0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104bc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}
80104bc8:	5b                   	pop    %ebx
80104bc9:	5e                   	pop    %esi
80104bca:	5d                   	pop    %ebp
80104bcb:	c3                   	ret    
80104bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104bd0:	31 c0                	xor    %eax,%eax
80104bd2:	eb de                	jmp    80104bb2 <argfd.constprop.0+0x42>
80104bd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104be0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104be0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104be1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104be3:	89 e5                	mov    %esp,%ebp
80104be5:	56                   	push   %esi
80104be6:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104be7:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104bea:	83 ec 10             	sub    $0x10,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104bed:	e8 7e ff ff ff       	call   80104b70 <argfd.constprop.0>
80104bf2:	85 c0                	test   %eax,%eax
80104bf4:	78 1a                	js     80104c10 <sys_dup+0x30>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104bf6:	31 db                	xor    %ebx,%ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
80104bf8:	8b 75 f4             	mov    -0xc(%ebp),%esi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80104bfb:	e8 70 ec ff ff       	call   80103870 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80104c00:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104c04:	85 d2                	test   %edx,%edx
80104c06:	74 18                	je     80104c20 <sys_dup+0x40>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104c08:	83 c3 01             	add    $0x1,%ebx
80104c0b:	83 fb 10             	cmp    $0x10,%ebx
80104c0e:	75 f0                	jne    80104c00 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104c10:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104c13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104c18:	5b                   	pop    %ebx
80104c19:	5e                   	pop    %esi
80104c1a:	5d                   	pop    %ebp
80104c1b:	c3                   	ret    
80104c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80104c20:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104c24:	83 ec 0c             	sub    $0xc,%esp
80104c27:	ff 75 f4             	pushl  -0xc(%ebp)
80104c2a:	e8 b1 c1 ff ff       	call   80100de0 <filedup>
  return fd;
80104c2f:	83 c4 10             	add    $0x10,%esp
}
80104c32:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
80104c35:	89 d8                	mov    %ebx,%eax
}
80104c37:	5b                   	pop    %ebx
80104c38:	5e                   	pop    %esi
80104c39:	5d                   	pop    %ebp
80104c3a:	c3                   	ret    
80104c3b:	90                   	nop
80104c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c40 <sys_read>:

int
sys_read(void)
{
80104c40:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c41:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104c43:	89 e5                	mov    %esp,%ebp
80104c45:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c48:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c4b:	e8 20 ff ff ff       	call   80104b70 <argfd.constprop.0>
80104c50:	85 c0                	test   %eax,%eax
80104c52:	78 4c                	js     80104ca0 <sys_read+0x60>
80104c54:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c57:	83 ec 08             	sub    $0x8,%esp
80104c5a:	50                   	push   %eax
80104c5b:	6a 02                	push   $0x2
80104c5d:	e8 ce fb ff ff       	call   80104830 <argint>
80104c62:	83 c4 10             	add    $0x10,%esp
80104c65:	85 c0                	test   %eax,%eax
80104c67:	78 37                	js     80104ca0 <sys_read+0x60>
80104c69:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c6c:	83 ec 04             	sub    $0x4,%esp
80104c6f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c72:	50                   	push   %eax
80104c73:	6a 01                	push   $0x1
80104c75:	e8 06 fc ff ff       	call   80104880 <argptr>
80104c7a:	83 c4 10             	add    $0x10,%esp
80104c7d:	85 c0                	test   %eax,%eax
80104c7f:	78 1f                	js     80104ca0 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104c81:	83 ec 04             	sub    $0x4,%esp
80104c84:	ff 75 f0             	pushl  -0x10(%ebp)
80104c87:	ff 75 f4             	pushl  -0xc(%ebp)
80104c8a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c8d:	e8 be c2 ff ff       	call   80100f50 <fileread>
80104c92:	83 c4 10             	add    $0x10,%esp
}
80104c95:	c9                   	leave  
80104c96:	c3                   	ret    
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104ca5:	c9                   	leave  
80104ca6:	c3                   	ret    
80104ca7:	89 f6                	mov    %esi,%esi
80104ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cb0 <sys_write>:

int
sys_write(void)
{
80104cb0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104cb1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104cb3:	89 e5                	mov    %esp,%ebp
80104cb5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104cb8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104cbb:	e8 b0 fe ff ff       	call   80104b70 <argfd.constprop.0>
80104cc0:	85 c0                	test   %eax,%eax
80104cc2:	78 4c                	js     80104d10 <sys_write+0x60>
80104cc4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cc7:	83 ec 08             	sub    $0x8,%esp
80104cca:	50                   	push   %eax
80104ccb:	6a 02                	push   $0x2
80104ccd:	e8 5e fb ff ff       	call   80104830 <argint>
80104cd2:	83 c4 10             	add    $0x10,%esp
80104cd5:	85 c0                	test   %eax,%eax
80104cd7:	78 37                	js     80104d10 <sys_write+0x60>
80104cd9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cdc:	83 ec 04             	sub    $0x4,%esp
80104cdf:	ff 75 f0             	pushl  -0x10(%ebp)
80104ce2:	50                   	push   %eax
80104ce3:	6a 01                	push   $0x1
80104ce5:	e8 96 fb ff ff       	call   80104880 <argptr>
80104cea:	83 c4 10             	add    $0x10,%esp
80104ced:	85 c0                	test   %eax,%eax
80104cef:	78 1f                	js     80104d10 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104cf1:	83 ec 04             	sub    $0x4,%esp
80104cf4:	ff 75 f0             	pushl  -0x10(%ebp)
80104cf7:	ff 75 f4             	pushl  -0xc(%ebp)
80104cfa:	ff 75 ec             	pushl  -0x14(%ebp)
80104cfd:	e8 de c2 ff ff       	call   80100fe0 <filewrite>
80104d02:	83 c4 10             	add    $0x10,%esp
}
80104d05:	c9                   	leave  
80104d06:	c3                   	ret    
80104d07:	89 f6                	mov    %esi,%esi
80104d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104d10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104d15:	c9                   	leave  
80104d16:	c3                   	ret    
80104d17:	89 f6                	mov    %esi,%esi
80104d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d20 <sys_close>:

int
sys_close(void)
{
80104d20:	55                   	push   %ebp
80104d21:	89 e5                	mov    %esp,%ebp
80104d23:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104d26:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104d29:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d2c:	e8 3f fe ff ff       	call   80104b70 <argfd.constprop.0>
80104d31:	85 c0                	test   %eax,%eax
80104d33:	78 2b                	js     80104d60 <sys_close+0x40>
    return -1;
  myproc()->ofile[fd] = 0;
80104d35:	e8 36 eb ff ff       	call   80103870 <myproc>
80104d3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104d3d:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
80104d40:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104d47:	00 
  fileclose(f);
80104d48:	ff 75 f4             	pushl  -0xc(%ebp)
80104d4b:	e8 e0 c0 ff ff       	call   80100e30 <fileclose>
  return 0;
80104d50:	83 c4 10             	add    $0x10,%esp
80104d53:	31 c0                	xor    %eax,%eax
}
80104d55:	c9                   	leave  
80104d56:	c3                   	ret    
80104d57:	89 f6                	mov    %esi,%esi
80104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104d60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104d65:	c9                   	leave  
80104d66:	c3                   	ret    
80104d67:	89 f6                	mov    %esi,%esi
80104d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d70 <sys_fstat>:

int
sys_fstat(void)
{
80104d70:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d71:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104d73:	89 e5                	mov    %esp,%ebp
80104d75:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d78:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104d7b:	e8 f0 fd ff ff       	call   80104b70 <argfd.constprop.0>
80104d80:	85 c0                	test   %eax,%eax
80104d82:	78 2c                	js     80104db0 <sys_fstat+0x40>
80104d84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d87:	83 ec 04             	sub    $0x4,%esp
80104d8a:	6a 14                	push   $0x14
80104d8c:	50                   	push   %eax
80104d8d:	6a 01                	push   $0x1
80104d8f:	e8 ec fa ff ff       	call   80104880 <argptr>
80104d94:	83 c4 10             	add    $0x10,%esp
80104d97:	85 c0                	test   %eax,%eax
80104d99:	78 15                	js     80104db0 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104d9b:	83 ec 08             	sub    $0x8,%esp
80104d9e:	ff 75 f4             	pushl  -0xc(%ebp)
80104da1:	ff 75 f0             	pushl  -0x10(%ebp)
80104da4:	e8 57 c1 ff ff       	call   80100f00 <filestat>
80104da9:	83 c4 10             	add    $0x10,%esp
}
80104dac:	c9                   	leave  
80104dad:	c3                   	ret    
80104dae:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104db0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104db5:	c9                   	leave  
80104db6:	c3                   	ret    
80104db7:	89 f6                	mov    %esi,%esi
80104db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104dc0 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104dc0:	55                   	push   %ebp
80104dc1:	89 e5                	mov    %esp,%ebp
80104dc3:	57                   	push   %edi
80104dc4:	56                   	push   %esi
80104dc5:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104dc6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104dc9:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104dcc:	50                   	push   %eax
80104dcd:	6a 00                	push   $0x0
80104dcf:	e8 0c fb ff ff       	call   801048e0 <argstr>
80104dd4:	83 c4 10             	add    $0x10,%esp
80104dd7:	85 c0                	test   %eax,%eax
80104dd9:	0f 88 fb 00 00 00    	js     80104eda <sys_link+0x11a>
80104ddf:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104de2:	83 ec 08             	sub    $0x8,%esp
80104de5:	50                   	push   %eax
80104de6:	6a 01                	push   $0x1
80104de8:	e8 f3 fa ff ff       	call   801048e0 <argstr>
80104ded:	83 c4 10             	add    $0x10,%esp
80104df0:	85 c0                	test   %eax,%eax
80104df2:	0f 88 e2 00 00 00    	js     80104eda <sys_link+0x11a>
    return -1;

  begin_op();
80104df8:	e8 13 de ff ff       	call   80102c10 <begin_op>
  if((ip = namei(old)) == 0){
80104dfd:	83 ec 0c             	sub    $0xc,%esp
80104e00:	ff 75 d4             	pushl  -0x2c(%ebp)
80104e03:	e8 78 d1 ff ff       	call   80101f80 <namei>
80104e08:	83 c4 10             	add    $0x10,%esp
80104e0b:	85 c0                	test   %eax,%eax
80104e0d:	89 c3                	mov    %eax,%ebx
80104e0f:	0f 84 f3 00 00 00    	je     80104f08 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104e15:	83 ec 0c             	sub    $0xc,%esp
80104e18:	50                   	push   %eax
80104e19:	e8 12 c9 ff ff       	call   80101730 <ilock>
  if(ip->type == T_DIR){
80104e1e:	83 c4 10             	add    $0x10,%esp
80104e21:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e26:	0f 84 c4 00 00 00    	je     80104ef0 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104e2c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104e31:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104e34:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104e37:	53                   	push   %ebx
80104e38:	e8 43 c8 ff ff       	call   80101680 <iupdate>
  iunlock(ip);
80104e3d:	89 1c 24             	mov    %ebx,(%esp)
80104e40:	e8 cb c9 ff ff       	call   80101810 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104e45:	58                   	pop    %eax
80104e46:	5a                   	pop    %edx
80104e47:	57                   	push   %edi
80104e48:	ff 75 d0             	pushl  -0x30(%ebp)
80104e4b:	e8 50 d1 ff ff       	call   80101fa0 <nameiparent>
80104e50:	83 c4 10             	add    $0x10,%esp
80104e53:	85 c0                	test   %eax,%eax
80104e55:	89 c6                	mov    %eax,%esi
80104e57:	74 5b                	je     80104eb4 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104e59:	83 ec 0c             	sub    $0xc,%esp
80104e5c:	50                   	push   %eax
80104e5d:	e8 ce c8 ff ff       	call   80101730 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104e62:	83 c4 10             	add    $0x10,%esp
80104e65:	8b 03                	mov    (%ebx),%eax
80104e67:	39 06                	cmp    %eax,(%esi)
80104e69:	75 3d                	jne    80104ea8 <sys_link+0xe8>
80104e6b:	83 ec 04             	sub    $0x4,%esp
80104e6e:	ff 73 04             	pushl  0x4(%ebx)
80104e71:	57                   	push   %edi
80104e72:	56                   	push   %esi
80104e73:	e8 48 d0 ff ff       	call   80101ec0 <dirlink>
80104e78:	83 c4 10             	add    $0x10,%esp
80104e7b:	85 c0                	test   %eax,%eax
80104e7d:	78 29                	js     80104ea8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104e7f:	83 ec 0c             	sub    $0xc,%esp
80104e82:	56                   	push   %esi
80104e83:	e8 38 cb ff ff       	call   801019c0 <iunlockput>
  iput(ip);
80104e88:	89 1c 24             	mov    %ebx,(%esp)
80104e8b:	e8 d0 c9 ff ff       	call   80101860 <iput>

  end_op();
80104e90:	e8 eb dd ff ff       	call   80102c80 <end_op>

  return 0;
80104e95:	83 c4 10             	add    $0x10,%esp
80104e98:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e9d:	5b                   	pop    %ebx
80104e9e:	5e                   	pop    %esi
80104e9f:	5f                   	pop    %edi
80104ea0:	5d                   	pop    %ebp
80104ea1:	c3                   	ret    
80104ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104ea8:	83 ec 0c             	sub    $0xc,%esp
80104eab:	56                   	push   %esi
80104eac:	e8 0f cb ff ff       	call   801019c0 <iunlockput>
    goto bad;
80104eb1:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104eb4:	83 ec 0c             	sub    $0xc,%esp
80104eb7:	53                   	push   %ebx
80104eb8:	e8 73 c8 ff ff       	call   80101730 <ilock>
  ip->nlink--;
80104ebd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ec2:	89 1c 24             	mov    %ebx,(%esp)
80104ec5:	e8 b6 c7 ff ff       	call   80101680 <iupdate>
  iunlockput(ip);
80104eca:	89 1c 24             	mov    %ebx,(%esp)
80104ecd:	e8 ee ca ff ff       	call   801019c0 <iunlockput>
  end_op();
80104ed2:	e8 a9 dd ff ff       	call   80102c80 <end_op>
  return -1;
80104ed7:	83 c4 10             	add    $0x10,%esp
}
80104eda:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104edd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ee2:	5b                   	pop    %ebx
80104ee3:	5e                   	pop    %esi
80104ee4:	5f                   	pop    %edi
80104ee5:	5d                   	pop    %ebp
80104ee6:	c3                   	ret    
80104ee7:	89 f6                	mov    %esi,%esi
80104ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104ef0:	83 ec 0c             	sub    $0xc,%esp
80104ef3:	53                   	push   %ebx
80104ef4:	e8 c7 ca ff ff       	call   801019c0 <iunlockput>
    end_op();
80104ef9:	e8 82 dd ff ff       	call   80102c80 <end_op>
    return -1;
80104efe:	83 c4 10             	add    $0x10,%esp
80104f01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f06:	eb 92                	jmp    80104e9a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104f08:	e8 73 dd ff ff       	call   80102c80 <end_op>
    return -1;
80104f0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f12:	eb 86                	jmp    80104e9a <sys_link+0xda>
80104f14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104f1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104f20 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	57                   	push   %edi
80104f24:	56                   	push   %esi
80104f25:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104f26:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104f29:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104f2c:	50                   	push   %eax
80104f2d:	6a 00                	push   $0x0
80104f2f:	e8 ac f9 ff ff       	call   801048e0 <argstr>
80104f34:	83 c4 10             	add    $0x10,%esp
80104f37:	85 c0                	test   %eax,%eax
80104f39:	0f 88 82 01 00 00    	js     801050c1 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104f3f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80104f42:	e8 c9 dc ff ff       	call   80102c10 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104f47:	83 ec 08             	sub    $0x8,%esp
80104f4a:	53                   	push   %ebx
80104f4b:	ff 75 c0             	pushl  -0x40(%ebp)
80104f4e:	e8 4d d0 ff ff       	call   80101fa0 <nameiparent>
80104f53:	83 c4 10             	add    $0x10,%esp
80104f56:	85 c0                	test   %eax,%eax
80104f58:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104f5b:	0f 84 6a 01 00 00    	je     801050cb <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80104f61:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104f64:	83 ec 0c             	sub    $0xc,%esp
80104f67:	56                   	push   %esi
80104f68:	e8 c3 c7 ff ff       	call   80101730 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104f6d:	58                   	pop    %eax
80104f6e:	5a                   	pop    %edx
80104f6f:	68 dc 78 10 80       	push   $0x801078dc
80104f74:	53                   	push   %ebx
80104f75:	e8 c6 cc ff ff       	call   80101c40 <namecmp>
80104f7a:	83 c4 10             	add    $0x10,%esp
80104f7d:	85 c0                	test   %eax,%eax
80104f7f:	0f 84 fc 00 00 00    	je     80105081 <sys_unlink+0x161>
80104f85:	83 ec 08             	sub    $0x8,%esp
80104f88:	68 db 78 10 80       	push   $0x801078db
80104f8d:	53                   	push   %ebx
80104f8e:	e8 ad cc ff ff       	call   80101c40 <namecmp>
80104f93:	83 c4 10             	add    $0x10,%esp
80104f96:	85 c0                	test   %eax,%eax
80104f98:	0f 84 e3 00 00 00    	je     80105081 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104f9e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104fa1:	83 ec 04             	sub    $0x4,%esp
80104fa4:	50                   	push   %eax
80104fa5:	53                   	push   %ebx
80104fa6:	56                   	push   %esi
80104fa7:	e8 b4 cc ff ff       	call   80101c60 <dirlookup>
80104fac:	83 c4 10             	add    $0x10,%esp
80104faf:	85 c0                	test   %eax,%eax
80104fb1:	89 c3                	mov    %eax,%ebx
80104fb3:	0f 84 c8 00 00 00    	je     80105081 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80104fb9:	83 ec 0c             	sub    $0xc,%esp
80104fbc:	50                   	push   %eax
80104fbd:	e8 6e c7 ff ff       	call   80101730 <ilock>

  if(ip->nlink < 1)
80104fc2:	83 c4 10             	add    $0x10,%esp
80104fc5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104fca:	0f 8e 24 01 00 00    	jle    801050f4 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104fd0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fd5:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104fd8:	74 66                	je     80105040 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104fda:	83 ec 04             	sub    $0x4,%esp
80104fdd:	6a 10                	push   $0x10
80104fdf:	6a 00                	push   $0x0
80104fe1:	56                   	push   %esi
80104fe2:	e8 39 f5 ff ff       	call   80104520 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104fe7:	6a 10                	push   $0x10
80104fe9:	ff 75 c4             	pushl  -0x3c(%ebp)
80104fec:	56                   	push   %esi
80104fed:	ff 75 b4             	pushl  -0x4c(%ebp)
80104ff0:	e8 1b cb ff ff       	call   80101b10 <writei>
80104ff5:	83 c4 20             	add    $0x20,%esp
80104ff8:	83 f8 10             	cmp    $0x10,%eax
80104ffb:	0f 85 e6 00 00 00    	jne    801050e7 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80105001:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105006:	0f 84 9c 00 00 00    	je     801050a8 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
8010500c:	83 ec 0c             	sub    $0xc,%esp
8010500f:	ff 75 b4             	pushl  -0x4c(%ebp)
80105012:	e8 a9 c9 ff ff       	call   801019c0 <iunlockput>

  ip->nlink--;
80105017:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
8010501c:	89 1c 24             	mov    %ebx,(%esp)
8010501f:	e8 5c c6 ff ff       	call   80101680 <iupdate>
  iunlockput(ip);
80105024:	89 1c 24             	mov    %ebx,(%esp)
80105027:	e8 94 c9 ff ff       	call   801019c0 <iunlockput>

  end_op();
8010502c:	e8 4f dc ff ff       	call   80102c80 <end_op>

  return 0;
80105031:	83 c4 10             	add    $0x10,%esp
80105034:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80105036:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105039:	5b                   	pop    %ebx
8010503a:	5e                   	pop    %esi
8010503b:	5f                   	pop    %edi
8010503c:	5d                   	pop    %ebp
8010503d:	c3                   	ret    
8010503e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105040:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105044:	76 94                	jbe    80104fda <sys_unlink+0xba>
80105046:	bf 20 00 00 00       	mov    $0x20,%edi
8010504b:	eb 0f                	jmp    8010505c <sys_unlink+0x13c>
8010504d:	8d 76 00             	lea    0x0(%esi),%esi
80105050:	83 c7 10             	add    $0x10,%edi
80105053:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105056:	0f 83 7e ff ff ff    	jae    80104fda <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010505c:	6a 10                	push   $0x10
8010505e:	57                   	push   %edi
8010505f:	56                   	push   %esi
80105060:	53                   	push   %ebx
80105061:	e8 aa c9 ff ff       	call   80101a10 <readi>
80105066:	83 c4 10             	add    $0x10,%esp
80105069:	83 f8 10             	cmp    $0x10,%eax
8010506c:	75 6c                	jne    801050da <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010506e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105073:	74 db                	je     80105050 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105075:	83 ec 0c             	sub    $0xc,%esp
80105078:	53                   	push   %ebx
80105079:	e8 42 c9 ff ff       	call   801019c0 <iunlockput>
    goto bad;
8010507e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80105081:	83 ec 0c             	sub    $0xc,%esp
80105084:	ff 75 b4             	pushl  -0x4c(%ebp)
80105087:	e8 34 c9 ff ff       	call   801019c0 <iunlockput>
  end_op();
8010508c:	e8 ef db ff ff       	call   80102c80 <end_op>
  return -1;
80105091:	83 c4 10             	add    $0x10,%esp
}
80105094:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80105097:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010509c:	5b                   	pop    %ebx
8010509d:	5e                   	pop    %esi
8010509e:	5f                   	pop    %edi
8010509f:	5d                   	pop    %ebp
801050a0:	c3                   	ret    
801050a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801050a8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
801050ab:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801050ae:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
801050b3:	50                   	push   %eax
801050b4:	e8 c7 c5 ff ff       	call   80101680 <iupdate>
801050b9:	83 c4 10             	add    $0x10,%esp
801050bc:	e9 4b ff ff ff       	jmp    8010500c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
801050c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050c6:	e9 6b ff ff ff       	jmp    80105036 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
801050cb:	e8 b0 db ff ff       	call   80102c80 <end_op>
    return -1;
801050d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050d5:	e9 5c ff ff ff       	jmp    80105036 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
801050da:	83 ec 0c             	sub    $0xc,%esp
801050dd:	68 00 79 10 80       	push   $0x80107900
801050e2:	e8 89 b2 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
801050e7:	83 ec 0c             	sub    $0xc,%esp
801050ea:	68 12 79 10 80       	push   $0x80107912
801050ef:	e8 7c b2 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
801050f4:	83 ec 0c             	sub    $0xc,%esp
801050f7:	68 ee 78 10 80       	push   $0x801078ee
801050fc:	e8 6f b2 ff ff       	call   80100370 <panic>
80105101:	eb 0d                	jmp    80105110 <sys_open>
80105103:	90                   	nop
80105104:	90                   	nop
80105105:	90                   	nop
80105106:	90                   	nop
80105107:	90                   	nop
80105108:	90                   	nop
80105109:	90                   	nop
8010510a:	90                   	nop
8010510b:	90                   	nop
8010510c:	90                   	nop
8010510d:	90                   	nop
8010510e:	90                   	nop
8010510f:	90                   	nop

80105110 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105110:	55                   	push   %ebp
80105111:	89 e5                	mov    %esp,%ebp
80105113:	57                   	push   %edi
80105114:	56                   	push   %esi
80105115:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105116:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80105119:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010511c:	50                   	push   %eax
8010511d:	6a 00                	push   $0x0
8010511f:	e8 bc f7 ff ff       	call   801048e0 <argstr>
80105124:	83 c4 10             	add    $0x10,%esp
80105127:	85 c0                	test   %eax,%eax
80105129:	0f 88 9e 00 00 00    	js     801051cd <sys_open+0xbd>
8010512f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105132:	83 ec 08             	sub    $0x8,%esp
80105135:	50                   	push   %eax
80105136:	6a 01                	push   $0x1
80105138:	e8 f3 f6 ff ff       	call   80104830 <argint>
8010513d:	83 c4 10             	add    $0x10,%esp
80105140:	85 c0                	test   %eax,%eax
80105142:	0f 88 85 00 00 00    	js     801051cd <sys_open+0xbd>
    return -1;

  begin_op();
80105148:	e8 c3 da ff ff       	call   80102c10 <begin_op>

  if(omode & O_CREATE){
8010514d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105151:	0f 85 89 00 00 00    	jne    801051e0 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105157:	83 ec 0c             	sub    $0xc,%esp
8010515a:	ff 75 e0             	pushl  -0x20(%ebp)
8010515d:	e8 1e ce ff ff       	call   80101f80 <namei>
80105162:	83 c4 10             	add    $0x10,%esp
80105165:	85 c0                	test   %eax,%eax
80105167:	89 c6                	mov    %eax,%esi
80105169:	0f 84 8e 00 00 00    	je     801051fd <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010516f:	83 ec 0c             	sub    $0xc,%esp
80105172:	50                   	push   %eax
80105173:	e8 b8 c5 ff ff       	call   80101730 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105178:	83 c4 10             	add    $0x10,%esp
8010517b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105180:	0f 84 d2 00 00 00    	je     80105258 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105186:	e8 e5 bb ff ff       	call   80100d70 <filealloc>
8010518b:	85 c0                	test   %eax,%eax
8010518d:	89 c7                	mov    %eax,%edi
8010518f:	74 2b                	je     801051bc <sys_open+0xac>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105191:	31 db                	xor    %ebx,%ebx
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105193:	e8 d8 e6 ff ff       	call   80103870 <myproc>
80105198:	90                   	nop
80105199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
801051a0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801051a4:	85 d2                	test   %edx,%edx
801051a6:	74 68                	je     80105210 <sys_open+0x100>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801051a8:	83 c3 01             	add    $0x1,%ebx
801051ab:	83 fb 10             	cmp    $0x10,%ebx
801051ae:	75 f0                	jne    801051a0 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
801051b0:	83 ec 0c             	sub    $0xc,%esp
801051b3:	57                   	push   %edi
801051b4:	e8 77 bc ff ff       	call   80100e30 <fileclose>
801051b9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801051bc:	83 ec 0c             	sub    $0xc,%esp
801051bf:	56                   	push   %esi
801051c0:	e8 fb c7 ff ff       	call   801019c0 <iunlockput>
    end_op();
801051c5:	e8 b6 da ff ff       	call   80102c80 <end_op>
    return -1;
801051ca:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801051cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
801051d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801051d5:	5b                   	pop    %ebx
801051d6:	5e                   	pop    %esi
801051d7:	5f                   	pop    %edi
801051d8:	5d                   	pop    %ebp
801051d9:	c3                   	ret    
801051da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801051e0:	83 ec 0c             	sub    $0xc,%esp
801051e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801051e6:	31 c9                	xor    %ecx,%ecx
801051e8:	6a 00                	push   $0x0
801051ea:	ba 02 00 00 00       	mov    $0x2,%edx
801051ef:	e8 dc f7 ff ff       	call   801049d0 <create>
    if(ip == 0){
801051f4:	83 c4 10             	add    $0x10,%esp
801051f7:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801051f9:	89 c6                	mov    %eax,%esi
    if(ip == 0){
801051fb:	75 89                	jne    80105186 <sys_open+0x76>
      end_op();
801051fd:	e8 7e da ff ff       	call   80102c80 <end_op>
      return -1;
80105202:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105207:	eb 43                	jmp    8010524c <sys_open+0x13c>
80105209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105210:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105213:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105217:	56                   	push   %esi
80105218:	e8 f3 c5 ff ff       	call   80101810 <iunlock>
  end_op();
8010521d:	e8 5e da ff ff       	call   80102c80 <end_op>

  f->type = FD_INODE;
80105222:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105228:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010522b:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
8010522e:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105231:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80105238:	89 d0                	mov    %edx,%eax
8010523a:	83 e0 01             	and    $0x1,%eax
8010523d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105240:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105243:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105246:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
8010524a:	89 d8                	mov    %ebx,%eax
}
8010524c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010524f:	5b                   	pop    %ebx
80105250:	5e                   	pop    %esi
80105251:	5f                   	pop    %edi
80105252:	5d                   	pop    %ebp
80105253:	c3                   	ret    
80105254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105258:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010525b:	85 c9                	test   %ecx,%ecx
8010525d:	0f 84 23 ff ff ff    	je     80105186 <sys_open+0x76>
80105263:	e9 54 ff ff ff       	jmp    801051bc <sys_open+0xac>
80105268:	90                   	nop
80105269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105270 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105270:	55                   	push   %ebp
80105271:	89 e5                	mov    %esp,%ebp
80105273:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105276:	e8 95 d9 ff ff       	call   80102c10 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010527b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010527e:	83 ec 08             	sub    $0x8,%esp
80105281:	50                   	push   %eax
80105282:	6a 00                	push   $0x0
80105284:	e8 57 f6 ff ff       	call   801048e0 <argstr>
80105289:	83 c4 10             	add    $0x10,%esp
8010528c:	85 c0                	test   %eax,%eax
8010528e:	78 30                	js     801052c0 <sys_mkdir+0x50>
80105290:	83 ec 0c             	sub    $0xc,%esp
80105293:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105296:	31 c9                	xor    %ecx,%ecx
80105298:	6a 00                	push   $0x0
8010529a:	ba 01 00 00 00       	mov    $0x1,%edx
8010529f:	e8 2c f7 ff ff       	call   801049d0 <create>
801052a4:	83 c4 10             	add    $0x10,%esp
801052a7:	85 c0                	test   %eax,%eax
801052a9:	74 15                	je     801052c0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801052ab:	83 ec 0c             	sub    $0xc,%esp
801052ae:	50                   	push   %eax
801052af:	e8 0c c7 ff ff       	call   801019c0 <iunlockput>
  end_op();
801052b4:	e8 c7 d9 ff ff       	call   80102c80 <end_op>
  return 0;
801052b9:	83 c4 10             	add    $0x10,%esp
801052bc:	31 c0                	xor    %eax,%eax
}
801052be:	c9                   	leave  
801052bf:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
801052c0:	e8 bb d9 ff ff       	call   80102c80 <end_op>
    return -1;
801052c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801052ca:	c9                   	leave  
801052cb:	c3                   	ret    
801052cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052d0 <sys_mknod>:

int
sys_mknod(void)
{
801052d0:	55                   	push   %ebp
801052d1:	89 e5                	mov    %esp,%ebp
801052d3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801052d6:	e8 35 d9 ff ff       	call   80102c10 <begin_op>
  if((argstr(0, &path)) < 0 ||
801052db:	8d 45 ec             	lea    -0x14(%ebp),%eax
801052de:	83 ec 08             	sub    $0x8,%esp
801052e1:	50                   	push   %eax
801052e2:	6a 00                	push   $0x0
801052e4:	e8 f7 f5 ff ff       	call   801048e0 <argstr>
801052e9:	83 c4 10             	add    $0x10,%esp
801052ec:	85 c0                	test   %eax,%eax
801052ee:	78 60                	js     80105350 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801052f0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052f3:	83 ec 08             	sub    $0x8,%esp
801052f6:	50                   	push   %eax
801052f7:	6a 01                	push   $0x1
801052f9:	e8 32 f5 ff ff       	call   80104830 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801052fe:	83 c4 10             	add    $0x10,%esp
80105301:	85 c0                	test   %eax,%eax
80105303:	78 4b                	js     80105350 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105305:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105308:	83 ec 08             	sub    $0x8,%esp
8010530b:	50                   	push   %eax
8010530c:	6a 02                	push   $0x2
8010530e:	e8 1d f5 ff ff       	call   80104830 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105313:	83 c4 10             	add    $0x10,%esp
80105316:	85 c0                	test   %eax,%eax
80105318:	78 36                	js     80105350 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
8010531a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010531e:	83 ec 0c             	sub    $0xc,%esp
80105321:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105325:	ba 03 00 00 00       	mov    $0x3,%edx
8010532a:	50                   	push   %eax
8010532b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010532e:	e8 9d f6 ff ff       	call   801049d0 <create>
80105333:	83 c4 10             	add    $0x10,%esp
80105336:	85 c0                	test   %eax,%eax
80105338:	74 16                	je     80105350 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010533a:	83 ec 0c             	sub    $0xc,%esp
8010533d:	50                   	push   %eax
8010533e:	e8 7d c6 ff ff       	call   801019c0 <iunlockput>
  end_op();
80105343:	e8 38 d9 ff ff       	call   80102c80 <end_op>
  return 0;
80105348:	83 c4 10             	add    $0x10,%esp
8010534b:	31 c0                	xor    %eax,%eax
}
8010534d:	c9                   	leave  
8010534e:	c3                   	ret    
8010534f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105350:	e8 2b d9 ff ff       	call   80102c80 <end_op>
    return -1;
80105355:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010535a:	c9                   	leave  
8010535b:	c3                   	ret    
8010535c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105360 <sys_chdir>:

int
sys_chdir(void)
{
80105360:	55                   	push   %ebp
80105361:	89 e5                	mov    %esp,%ebp
80105363:	56                   	push   %esi
80105364:	53                   	push   %ebx
80105365:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105368:	e8 03 e5 ff ff       	call   80103870 <myproc>
8010536d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010536f:	e8 9c d8 ff ff       	call   80102c10 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105374:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105377:	83 ec 08             	sub    $0x8,%esp
8010537a:	50                   	push   %eax
8010537b:	6a 00                	push   $0x0
8010537d:	e8 5e f5 ff ff       	call   801048e0 <argstr>
80105382:	83 c4 10             	add    $0x10,%esp
80105385:	85 c0                	test   %eax,%eax
80105387:	78 77                	js     80105400 <sys_chdir+0xa0>
80105389:	83 ec 0c             	sub    $0xc,%esp
8010538c:	ff 75 f4             	pushl  -0xc(%ebp)
8010538f:	e8 ec cb ff ff       	call   80101f80 <namei>
80105394:	83 c4 10             	add    $0x10,%esp
80105397:	85 c0                	test   %eax,%eax
80105399:	89 c3                	mov    %eax,%ebx
8010539b:	74 63                	je     80105400 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010539d:	83 ec 0c             	sub    $0xc,%esp
801053a0:	50                   	push   %eax
801053a1:	e8 8a c3 ff ff       	call   80101730 <ilock>
  if(ip->type != T_DIR){
801053a6:	83 c4 10             	add    $0x10,%esp
801053a9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801053ae:	75 30                	jne    801053e0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801053b0:	83 ec 0c             	sub    $0xc,%esp
801053b3:	53                   	push   %ebx
801053b4:	e8 57 c4 ff ff       	call   80101810 <iunlock>
  iput(curproc->cwd);
801053b9:	58                   	pop    %eax
801053ba:	ff 76 68             	pushl  0x68(%esi)
801053bd:	e8 9e c4 ff ff       	call   80101860 <iput>
  end_op();
801053c2:	e8 b9 d8 ff ff       	call   80102c80 <end_op>
  curproc->cwd = ip;
801053c7:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801053ca:	83 c4 10             	add    $0x10,%esp
801053cd:	31 c0                	xor    %eax,%eax
}
801053cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801053d2:	5b                   	pop    %ebx
801053d3:	5e                   	pop    %esi
801053d4:	5d                   	pop    %ebp
801053d5:	c3                   	ret    
801053d6:	8d 76 00             	lea    0x0(%esi),%esi
801053d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
801053e0:	83 ec 0c             	sub    $0xc,%esp
801053e3:	53                   	push   %ebx
801053e4:	e8 d7 c5 ff ff       	call   801019c0 <iunlockput>
    end_op();
801053e9:	e8 92 d8 ff ff       	call   80102c80 <end_op>
    return -1;
801053ee:	83 c4 10             	add    $0x10,%esp
801053f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053f6:	eb d7                	jmp    801053cf <sys_chdir+0x6f>
801053f8:	90                   	nop
801053f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105400:	e8 7b d8 ff ff       	call   80102c80 <end_op>
    return -1;
80105405:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010540a:	eb c3                	jmp    801053cf <sys_chdir+0x6f>
8010540c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105410 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
80105410:	55                   	push   %ebp
80105411:	89 e5                	mov    %esp,%ebp
80105413:	57                   	push   %edi
80105414:	56                   	push   %esi
80105415:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105416:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
8010541c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105422:	50                   	push   %eax
80105423:	6a 00                	push   $0x0
80105425:	e8 b6 f4 ff ff       	call   801048e0 <argstr>
8010542a:	83 c4 10             	add    $0x10,%esp
8010542d:	85 c0                	test   %eax,%eax
8010542f:	78 7f                	js     801054b0 <sys_exec+0xa0>
80105431:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105437:	83 ec 08             	sub    $0x8,%esp
8010543a:	50                   	push   %eax
8010543b:	6a 01                	push   $0x1
8010543d:	e8 ee f3 ff ff       	call   80104830 <argint>
80105442:	83 c4 10             	add    $0x10,%esp
80105445:	85 c0                	test   %eax,%eax
80105447:	78 67                	js     801054b0 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105449:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010544f:	83 ec 04             	sub    $0x4,%esp
80105452:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105458:	68 80 00 00 00       	push   $0x80
8010545d:	6a 00                	push   $0x0
8010545f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105465:	50                   	push   %eax
80105466:	31 db                	xor    %ebx,%ebx
80105468:	e8 b3 f0 ff ff       	call   80104520 <memset>
8010546d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105470:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105476:	83 ec 08             	sub    $0x8,%esp
80105479:	57                   	push   %edi
8010547a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010547d:	50                   	push   %eax
8010547e:	e8 0d f3 ff ff       	call   80104790 <fetchint>
80105483:	83 c4 10             	add    $0x10,%esp
80105486:	85 c0                	test   %eax,%eax
80105488:	78 26                	js     801054b0 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010548a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105490:	85 c0                	test   %eax,%eax
80105492:	74 2c                	je     801054c0 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105494:	83 ec 08             	sub    $0x8,%esp
80105497:	56                   	push   %esi
80105498:	50                   	push   %eax
80105499:	e8 32 f3 ff ff       	call   801047d0 <fetchstr>
8010549e:	83 c4 10             	add    $0x10,%esp
801054a1:	85 c0                	test   %eax,%eax
801054a3:	78 0b                	js     801054b0 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801054a5:	83 c3 01             	add    $0x1,%ebx
801054a8:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801054ab:	83 fb 20             	cmp    $0x20,%ebx
801054ae:	75 c0                	jne    80105470 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801054b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801054b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801054b8:	5b                   	pop    %ebx
801054b9:	5e                   	pop    %esi
801054ba:	5f                   	pop    %edi
801054bb:	5d                   	pop    %ebp
801054bc:	c3                   	ret    
801054bd:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801054c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801054c6:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
801054c9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801054d0:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801054d4:	50                   	push   %eax
801054d5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801054db:	e8 10 b5 ff ff       	call   801009f0 <exec>
801054e0:	83 c4 10             	add    $0x10,%esp
}
801054e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054e6:	5b                   	pop    %ebx
801054e7:	5e                   	pop    %esi
801054e8:	5f                   	pop    %edi
801054e9:	5d                   	pop    %ebp
801054ea:	c3                   	ret    
801054eb:	90                   	nop
801054ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_pipe>:

int
sys_pipe(void)
{
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	57                   	push   %edi
801054f4:	56                   	push   %esi
801054f5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801054f6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
801054f9:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801054fc:	6a 08                	push   $0x8
801054fe:	50                   	push   %eax
801054ff:	6a 00                	push   $0x0
80105501:	e8 7a f3 ff ff       	call   80104880 <argptr>
80105506:	83 c4 10             	add    $0x10,%esp
80105509:	85 c0                	test   %eax,%eax
8010550b:	78 4a                	js     80105557 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010550d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105510:	83 ec 08             	sub    $0x8,%esp
80105513:	50                   	push   %eax
80105514:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105517:	50                   	push   %eax
80105518:	e8 93 dd ff ff       	call   801032b0 <pipealloc>
8010551d:	83 c4 10             	add    $0x10,%esp
80105520:	85 c0                	test   %eax,%eax
80105522:	78 33                	js     80105557 <sys_pipe+0x67>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105524:	31 db                	xor    %ebx,%ebx
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105526:	8b 7d e0             	mov    -0x20(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105529:	e8 42 e3 ff ff       	call   80103870 <myproc>
8010552e:	66 90                	xchg   %ax,%ax

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105530:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105534:	85 f6                	test   %esi,%esi
80105536:	74 30                	je     80105568 <sys_pipe+0x78>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105538:	83 c3 01             	add    $0x1,%ebx
8010553b:	83 fb 10             	cmp    $0x10,%ebx
8010553e:	75 f0                	jne    80105530 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105540:	83 ec 0c             	sub    $0xc,%esp
80105543:	ff 75 e0             	pushl  -0x20(%ebp)
80105546:	e8 e5 b8 ff ff       	call   80100e30 <fileclose>
    fileclose(wf);
8010554b:	58                   	pop    %eax
8010554c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010554f:	e8 dc b8 ff ff       	call   80100e30 <fileclose>
    return -1;
80105554:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105557:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
8010555a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
8010555f:	5b                   	pop    %ebx
80105560:	5e                   	pop    %esi
80105561:	5f                   	pop    %edi
80105562:	5d                   	pop    %ebp
80105563:	c3                   	ret    
80105564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105568:	8d 73 08             	lea    0x8(%ebx),%esi
8010556b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010556f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105572:	e8 f9 e2 ff ff       	call   80103870 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
80105577:	31 d2                	xor    %edx,%edx
80105579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
80105580:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105584:	85 c9                	test   %ecx,%ecx
80105586:	74 18                	je     801055a0 <sys_pipe+0xb0>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105588:	83 c2 01             	add    $0x1,%edx
8010558b:	83 fa 10             	cmp    $0x10,%edx
8010558e:	75 f0                	jne    80105580 <sys_pipe+0x90>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
80105590:	e8 db e2 ff ff       	call   80103870 <myproc>
80105595:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010559c:	00 
8010559d:	eb a1                	jmp    80105540 <sys_pipe+0x50>
8010559f:	90                   	nop
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801055a0:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801055a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801055a7:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801055a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801055ac:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
801055af:	8d 65 f4             	lea    -0xc(%ebp),%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
801055b2:	31 c0                	xor    %eax,%eax
}
801055b4:	5b                   	pop    %ebx
801055b5:	5e                   	pop    %esi
801055b6:	5f                   	pop    %edi
801055b7:	5d                   	pop    %ebp
801055b8:	c3                   	ret    
801055b9:	66 90                	xchg   %ax,%ax
801055bb:	66 90                	xchg   %ax,%ax
801055bd:	66 90                	xchg   %ax,%ax
801055bf:	90                   	nop

801055c0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801055c3:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
801055c4:	e9 47 e4 ff ff       	jmp    80103a10 <fork>
801055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055d0 <sys_exit>:
}

int
sys_exit(void)
{
801055d0:	55                   	push   %ebp
801055d1:	89 e5                	mov    %esp,%ebp
801055d3:	83 ec 08             	sub    $0x8,%esp
  exit();
801055d6:	e8 c5 e6 ff ff       	call   80103ca0 <exit>
  return 0;  // not reached
}
801055db:	31 c0                	xor    %eax,%eax
801055dd:	c9                   	leave  
801055de:	c3                   	ret    
801055df:	90                   	nop

801055e0 <sys_wait>:

int
sys_wait(void)
{
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801055e3:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
801055e4:	e9 f7 e8 ff ff       	jmp    80103ee0 <wait>
801055e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055f0 <sys_kill>:
}

int
sys_kill(void)
{
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801055f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055f9:	50                   	push   %eax
801055fa:	6a 00                	push   $0x0
801055fc:	e8 2f f2 ff ff       	call   80104830 <argint>
80105601:	83 c4 10             	add    $0x10,%esp
80105604:	85 c0                	test   %eax,%eax
80105606:	78 18                	js     80105620 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105608:	83 ec 0c             	sub    $0xc,%esp
8010560b:	ff 75 f4             	pushl  -0xc(%ebp)
8010560e:	e8 2d ea ff ff       	call   80104040 <kill>
80105613:	83 c4 10             	add    $0x10,%esp
}
80105616:	c9                   	leave  
80105617:	c3                   	ret    
80105618:	90                   	nop
80105619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105620:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105625:	c9                   	leave  
80105626:	c3                   	ret    
80105627:	89 f6                	mov    %esi,%esi
80105629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105630 <sys_getpid>:

int
sys_getpid(void)
{
80105630:	55                   	push   %ebp
80105631:	89 e5                	mov    %esp,%ebp
80105633:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105636:	e8 35 e2 ff ff       	call   80103870 <myproc>
8010563b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010563e:	c9                   	leave  
8010563f:	c3                   	ret    

80105640 <sys_sbrk>:

int
sys_sbrk(void)
{
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105644:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105647:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010564a:	50                   	push   %eax
8010564b:	6a 00                	push   $0x0
8010564d:	e8 de f1 ff ff       	call   80104830 <argint>
80105652:	83 c4 10             	add    $0x10,%esp
80105655:	85 c0                	test   %eax,%eax
80105657:	78 27                	js     80105680 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105659:	e8 12 e2 ff ff       	call   80103870 <myproc>
  if(growproc(n) < 0)
8010565e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
80105661:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105663:	ff 75 f4             	pushl  -0xc(%ebp)
80105666:	e8 25 e3 ff ff       	call   80103990 <growproc>
8010566b:	83 c4 10             	add    $0x10,%esp
8010566e:	85 c0                	test   %eax,%eax
80105670:	78 0e                	js     80105680 <sys_sbrk+0x40>
    return -1;
  return addr;
80105672:	89 d8                	mov    %ebx,%eax
}
80105674:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105677:	c9                   	leave  
80105678:	c3                   	ret    
80105679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105680:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105685:	eb ed                	jmp    80105674 <sys_sbrk+0x34>
80105687:	89 f6                	mov    %esi,%esi
80105689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105690 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105690:	55                   	push   %ebp
80105691:	89 e5                	mov    %esp,%ebp
80105693:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105694:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105697:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010569a:	50                   	push   %eax
8010569b:	6a 00                	push   $0x0
8010569d:	e8 8e f1 ff ff       	call   80104830 <argint>
801056a2:	83 c4 10             	add    $0x10,%esp
801056a5:	85 c0                	test   %eax,%eax
801056a7:	0f 88 8a 00 00 00    	js     80105737 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801056ad:	83 ec 0c             	sub    $0xc,%esp
801056b0:	68 a0 4e 11 80       	push   $0x80114ea0
801056b5:	e8 66 ed ff ff       	call   80104420 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801056ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
801056bd:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801056c0:	8b 1d e0 56 11 80    	mov    0x801156e0,%ebx
  while(ticks - ticks0 < n){
801056c6:	85 d2                	test   %edx,%edx
801056c8:	75 27                	jne    801056f1 <sys_sleep+0x61>
801056ca:	eb 54                	jmp    80105720 <sys_sleep+0x90>
801056cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801056d0:	83 ec 08             	sub    $0x8,%esp
801056d3:	68 a0 4e 11 80       	push   $0x80114ea0
801056d8:	68 e0 56 11 80       	push   $0x801156e0
801056dd:	e8 3e e7 ff ff       	call   80103e20 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801056e2:	a1 e0 56 11 80       	mov    0x801156e0,%eax
801056e7:	83 c4 10             	add    $0x10,%esp
801056ea:	29 d8                	sub    %ebx,%eax
801056ec:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801056ef:	73 2f                	jae    80105720 <sys_sleep+0x90>
    if(myproc()->killed){
801056f1:	e8 7a e1 ff ff       	call   80103870 <myproc>
801056f6:	8b 40 24             	mov    0x24(%eax),%eax
801056f9:	85 c0                	test   %eax,%eax
801056fb:	74 d3                	je     801056d0 <sys_sleep+0x40>
      release(&tickslock);
801056fd:	83 ec 0c             	sub    $0xc,%esp
80105700:	68 a0 4e 11 80       	push   $0x80114ea0
80105705:	e8 c6 ed ff ff       	call   801044d0 <release>
      return -1;
8010570a:	83 c4 10             	add    $0x10,%esp
8010570d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105712:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105715:	c9                   	leave  
80105716:	c3                   	ret    
80105717:	89 f6                	mov    %esi,%esi
80105719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105720:	83 ec 0c             	sub    $0xc,%esp
80105723:	68 a0 4e 11 80       	push   $0x80114ea0
80105728:	e8 a3 ed ff ff       	call   801044d0 <release>
  return 0;
8010572d:	83 c4 10             	add    $0x10,%esp
80105730:	31 c0                	xor    %eax,%eax
}
80105732:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105735:	c9                   	leave  
80105736:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105737:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010573c:	eb d4                	jmp    80105712 <sys_sleep+0x82>
8010573e:	66 90                	xchg   %ax,%ax

80105740 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
80105743:	53                   	push   %ebx
80105744:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105747:	68 a0 4e 11 80       	push   $0x80114ea0
8010574c:	e8 cf ec ff ff       	call   80104420 <acquire>
  xticks = ticks;
80105751:	8b 1d e0 56 11 80    	mov    0x801156e0,%ebx
  release(&tickslock);
80105757:	c7 04 24 a0 4e 11 80 	movl   $0x80114ea0,(%esp)
8010575e:	e8 6d ed ff ff       	call   801044d0 <release>
  return xticks;
}
80105763:	89 d8                	mov    %ebx,%eax
80105765:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105768:	c9                   	leave  
80105769:	c3                   	ret    
8010576a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105770 <sys_trace>:

// Set the tracing attribute based on the argument of trace
int sys_trace(void){
80105770:	55                   	push   %ebp
80105771:	89 e5                	mov    %esp,%ebp
80105773:	53                   	push   %ebx
  int n;
  if(argint(0, &n) < 0){
80105774:	8d 45 f4             	lea    -0xc(%ebp),%eax
  release(&tickslock);
  return xticks;
}

// Set the tracing attribute based on the argument of trace
int sys_trace(void){
80105777:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  if(argint(0, &n) < 0){
8010577a:	50                   	push   %eax
8010577b:	6a 00                	push   $0x0
8010577d:	e8 ae f0 ff ff       	call   80104830 <argint>
80105782:	83 c4 10             	add    $0x10,%esp
80105785:	85 c0                	test   %eax,%eax
80105787:	78 37                	js     801057c0 <sys_trace+0x50>
    return -1;
  }
  if(n == 0){
80105789:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010578c:	85 db                	test   %ebx,%ebx
8010578e:	74 18                	je     801057a8 <sys_trace+0x38>
    myproc()->tracing = 0;
  }
  else{
    myproc()->tracing = 1;
80105790:	e8 db e0 ff ff       	call   80103870 <myproc>
  }
  return 0;
80105795:	31 db                	xor    %ebx,%ebx
  }
  if(n == 0){
    myproc()->tracing = 0;
  }
  else{
    myproc()->tracing = 1;
80105797:	c7 40 7c 01 00 00 00 	movl   $0x1,0x7c(%eax)
  }
  return 0;
}
8010579e:	89 d8                	mov    %ebx,%eax
801057a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057a3:	c9                   	leave  
801057a4:	c3                   	ret    
801057a5:	8d 76 00             	lea    0x0(%esi),%esi
  int n;
  if(argint(0, &n) < 0){
    return -1;
  }
  if(n == 0){
    myproc()->tracing = 0;
801057a8:	e8 c3 e0 ff ff       	call   80103870 <myproc>
801057ad:	c7 40 7c 00 00 00 00 	movl   $0x0,0x7c(%eax)
  }
  else{
    myproc()->tracing = 1;
  }
  return 0;
}
801057b4:	89 d8                	mov    %ebx,%eax
801057b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057b9:	c9                   	leave  
801057ba:	c3                   	ret    
801057bb:	90                   	nop
801057bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Set the tracing attribute based on the argument of trace
int sys_trace(void){
  int n;
  if(argint(0, &n) < 0){
    return -1;
801057c0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801057c5:	eb d7                	jmp    8010579e <sys_trace+0x2e>
801057c7:	89 f6                	mov    %esi,%esi
801057c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057d0 <sys_getprocs>:
    int state;
    uint sz;
    char name[16];
};

int sys_getprocs(void){
801057d0:	55                   	push   %ebp
801057d1:	89 e5                	mov    %esp,%ebp
801057d3:	57                   	push   %edi
801057d4:	56                   	push   %esi
801057d5:	53                   	push   %ebx
    int size, i, j;
    struct uproc *buf;
    struct proc *p = '\0';
    char *pbuf;
    if (argint(0, &size) < 0){
801057d6:	8d 45 e0             	lea    -0x20(%ebp),%eax
    int state;
    uint sz;
    char name[16];
};

int sys_getprocs(void){
801057d9:	83 ec 24             	sub    $0x24,%esp
    int size, i, j;
    struct uproc *buf;
    struct proc *p = '\0';
    char *pbuf;
    if (argint(0, &size) < 0){
801057dc:	50                   	push   %eax
801057dd:	6a 00                	push   $0x0
801057df:	e8 4c f0 ff ff       	call   80104830 <argint>
801057e4:	83 c4 10             	add    $0x10,%esp
801057e7:	85 c0                	test   %eax,%eax
801057e9:	0f 88 7f 00 00 00    	js     8010586e <sys_getprocs+0x9e>
        return -1;
    }
    if (argptr(1, &pbuf, size*sizeof(struct uproc)) < 0){
801057ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
801057f2:	83 ec 04             	sub    $0x4,%esp
801057f5:	c1 e0 05             	shl    $0x5,%eax
801057f8:	50                   	push   %eax
801057f9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801057fc:	50                   	push   %eax
801057fd:	6a 01                	push   $0x1
801057ff:	e8 7c f0 ff ff       	call   80104880 <argptr>
80105804:	83 c4 10             	add    $0x10,%esp
80105807:	85 c0                	test   %eax,%eax
80105809:	78 63                	js     8010586e <sys_getprocs+0x9e>
        return -1;
    }
    buf = (struct uproc *)pbuf;
8010580b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    // Get the ptable elements
    p = getptable_proc();
8010580e:	e8 8d df ff ff       	call   801037a0 <getptable_proc>
    // Copy ptables elements to buff
    for(i = 0; i<size; i++){
80105813:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105816:	85 d2                	test   %edx,%edx
80105818:	7e 4a                	jle    80105864 <sys_getprocs+0x94>
8010581a:	89 c6                	mov    %eax,%esi
8010581c:	31 ff                	xor    %edi,%edi
8010581e:	66 90                	xchg   %ax,%ax
        //Store all standard attributes
        buf[i].pid = p[i].pid;
80105820:	8b 46 10             	mov    0x10(%esi),%eax
        buf[i].ppid = p[i].parent->pid;
        buf[i].state = p[i].state;
        buf[i].sz = p[i].sz;
80105823:	31 d2                	xor    %edx,%edx
    // Get the ptable elements
    p = getptable_proc();
    // Copy ptables elements to buff
    for(i = 0; i<size; i++){
        //Store all standard attributes
        buf[i].pid = p[i].pid;
80105825:	89 03                	mov    %eax,(%ebx)
        buf[i].ppid = p[i].parent->pid;
80105827:	8b 46 14             	mov    0x14(%esi),%eax
8010582a:	8b 40 10             	mov    0x10(%eax),%eax
8010582d:	89 43 04             	mov    %eax,0x4(%ebx)
        buf[i].state = p[i].state;
80105830:	8b 46 0c             	mov    0xc(%esi),%eax
80105833:	89 43 08             	mov    %eax,0x8(%ebx)
        buf[i].sz = p[i].sz;
80105836:	8b 06                	mov    (%esi),%eax
80105838:	89 43 0c             	mov    %eax,0xc(%ebx)
8010583b:	90                   	nop
8010583c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        
        // Loop through chars in name storing each
        for(j = 0; j < sizeof(p[i].name); j++){
            buf[i].name[j] = p[i].name[j];
80105840:	0f b6 4c 16 6c       	movzbl 0x6c(%esi,%edx,1),%ecx
80105845:	88 4c 13 10          	mov    %cl,0x10(%ebx,%edx,1)
        buf[i].ppid = p[i].parent->pid;
        buf[i].state = p[i].state;
        buf[i].sz = p[i].sz;
        
        // Loop through chars in name storing each
        for(j = 0; j < sizeof(p[i].name); j++){
80105849:	83 c2 01             	add    $0x1,%edx
8010584c:	83 fa 10             	cmp    $0x10,%edx
8010584f:	75 ef                	jne    80105840 <sys_getprocs+0x70>
    }
    buf = (struct uproc *)pbuf;
    // Get the ptable elements
    p = getptable_proc();
    // Copy ptables elements to buff
    for(i = 0; i<size; i++){
80105851:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105854:	83 c7 01             	add    $0x1,%edi
80105857:	81 c6 84 00 00 00    	add    $0x84,%esi
8010585d:	83 c3 20             	add    $0x20,%ebx
80105860:	39 fa                	cmp    %edi,%edx
80105862:	7f bc                	jg     80105820 <sys_getprocs+0x50>
    }
    

    return size;

}
80105864:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105867:	89 d0                	mov    %edx,%eax
80105869:	5b                   	pop    %ebx
8010586a:	5e                   	pop    %esi
8010586b:	5f                   	pop    %edi
8010586c:	5d                   	pop    %ebp
8010586d:	c3                   	ret    
    int size, i, j;
    struct uproc *buf;
    struct proc *p = '\0';
    char *pbuf;
    if (argint(0, &size) < 0){
        return -1;
8010586e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80105873:	eb ef                	jmp    80105864 <sys_getprocs+0x94>

80105875 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105875:	1e                   	push   %ds
  pushl %es
80105876:	06                   	push   %es
  pushl %fs
80105877:	0f a0                	push   %fs
  pushl %gs
80105879:	0f a8                	push   %gs
  pushal
8010587b:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
8010587c:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105880:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105882:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105884:	54                   	push   %esp
  call trap
80105885:	e8 e6 00 00 00       	call   80105970 <trap>
  addl $4, %esp
8010588a:	83 c4 04             	add    $0x4,%esp

8010588d <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
8010588d:	61                   	popa   
  popl %gs
8010588e:	0f a9                	pop    %gs
  popl %fs
80105890:	0f a1                	pop    %fs
  popl %es
80105892:	07                   	pop    %es
  popl %ds
80105893:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105894:	83 c4 08             	add    $0x8,%esp
  iret
80105897:	cf                   	iret   
80105898:	66 90                	xchg   %ax,%ax
8010589a:	66 90                	xchg   %ax,%ax
8010589c:	66 90                	xchg   %ax,%ax
8010589e:	66 90                	xchg   %ax,%ax

801058a0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801058a0:	31 c0                	xor    %eax,%eax
801058a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801058a8:	8b 14 85 06 a1 10 80 	mov    -0x7fef5efa(,%eax,4),%edx
801058af:	b9 08 00 00 00       	mov    $0x8,%ecx
801058b4:	c6 04 c5 e4 4e 11 80 	movb   $0x0,-0x7feeb11c(,%eax,8)
801058bb:	00 
801058bc:	66 89 0c c5 e2 4e 11 	mov    %cx,-0x7feeb11e(,%eax,8)
801058c3:	80 
801058c4:	c6 04 c5 e5 4e 11 80 	movb   $0x8e,-0x7feeb11b(,%eax,8)
801058cb:	8e 
801058cc:	66 89 14 c5 e0 4e 11 	mov    %dx,-0x7feeb120(,%eax,8)
801058d3:	80 
801058d4:	c1 ea 10             	shr    $0x10,%edx
801058d7:	66 89 14 c5 e6 4e 11 	mov    %dx,-0x7feeb11a(,%eax,8)
801058de:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801058df:	83 c0 01             	add    $0x1,%eax
801058e2:	3d 00 01 00 00       	cmp    $0x100,%eax
801058e7:	75 bf                	jne    801058a8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801058e9:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058ea:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801058ef:	89 e5                	mov    %esp,%ebp
801058f1:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058f4:	a1 06 a2 10 80       	mov    0x8010a206,%eax

  initlock(&tickslock, "time");
801058f9:	68 21 79 10 80       	push   $0x80107921
801058fe:	68 a0 4e 11 80       	push   $0x80114ea0
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105903:	66 89 15 e2 50 11 80 	mov    %dx,0x801150e2
8010590a:	c6 05 e4 50 11 80 00 	movb   $0x0,0x801150e4
80105911:	66 a3 e0 50 11 80    	mov    %ax,0x801150e0
80105917:	c1 e8 10             	shr    $0x10,%eax
8010591a:	c6 05 e5 50 11 80 ef 	movb   $0xef,0x801150e5
80105921:	66 a3 e6 50 11 80    	mov    %ax,0x801150e6

  initlock(&tickslock, "time");
80105927:	e8 94 e9 ff ff       	call   801042c0 <initlock>
}
8010592c:	83 c4 10             	add    $0x10,%esp
8010592f:	c9                   	leave  
80105930:	c3                   	ret    
80105931:	eb 0d                	jmp    80105940 <idtinit>
80105933:	90                   	nop
80105934:	90                   	nop
80105935:	90                   	nop
80105936:	90                   	nop
80105937:	90                   	nop
80105938:	90                   	nop
80105939:	90                   	nop
8010593a:	90                   	nop
8010593b:	90                   	nop
8010593c:	90                   	nop
8010593d:	90                   	nop
8010593e:	90                   	nop
8010593f:	90                   	nop

80105940 <idtinit>:

void
idtinit(void)
{
80105940:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105941:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105946:	89 e5                	mov    %esp,%ebp
80105948:	83 ec 10             	sub    $0x10,%esp
8010594b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010594f:	b8 e0 4e 11 80       	mov    $0x80114ee0,%eax
80105954:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105958:	c1 e8 10             	shr    $0x10,%eax
8010595b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010595f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105962:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105965:	c9                   	leave  
80105966:	c3                   	ret    
80105967:	89 f6                	mov    %esi,%esi
80105969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105970 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105970:	55                   	push   %ebp
80105971:	89 e5                	mov    %esp,%ebp
80105973:	57                   	push   %edi
80105974:	56                   	push   %esi
80105975:	53                   	push   %ebx
80105976:	83 ec 1c             	sub    $0x1c,%esp
80105979:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
8010597c:	8b 47 30             	mov    0x30(%edi),%eax
8010597f:	83 f8 40             	cmp    $0x40,%eax
80105982:	0f 84 88 01 00 00    	je     80105b10 <trap+0x1a0>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105988:	83 e8 20             	sub    $0x20,%eax
8010598b:	83 f8 1f             	cmp    $0x1f,%eax
8010598e:	77 10                	ja     801059a0 <trap+0x30>
80105990:	ff 24 85 c8 79 10 80 	jmp    *-0x7fef8638(,%eax,4)
80105997:	89 f6                	mov    %esi,%esi
80105999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
801059a0:	e8 cb de ff ff       	call   80103870 <myproc>
801059a5:	85 c0                	test   %eax,%eax
801059a7:	0f 84 d7 01 00 00    	je     80105b84 <trap+0x214>
801059ad:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801059b1:	0f 84 cd 01 00 00    	je     80105b84 <trap+0x214>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801059b7:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059ba:	8b 57 38             	mov    0x38(%edi),%edx
801059bd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801059c0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801059c3:	e8 88 de ff ff       	call   80103850 <cpuid>
801059c8:	8b 77 34             	mov    0x34(%edi),%esi
801059cb:	8b 5f 30             	mov    0x30(%edi),%ebx
801059ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801059d1:	e8 9a de ff ff       	call   80103870 <myproc>
801059d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801059d9:	e8 92 de ff ff       	call   80103870 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059de:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801059e1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801059e4:	51                   	push   %ecx
801059e5:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801059e6:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059e9:	ff 75 e4             	pushl  -0x1c(%ebp)
801059ec:	56                   	push   %esi
801059ed:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801059ee:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059f1:	52                   	push   %edx
801059f2:	ff 70 10             	pushl  0x10(%eax)
801059f5:	68 84 79 10 80       	push   $0x80107984
801059fa:	e8 61 ac ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
801059ff:	83 c4 20             	add    $0x20,%esp
80105a02:	e8 69 de ff ff       	call   80103870 <myproc>
80105a07:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105a0e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105a10:	e8 5b de ff ff       	call   80103870 <myproc>
80105a15:	85 c0                	test   %eax,%eax
80105a17:	74 0c                	je     80105a25 <trap+0xb5>
80105a19:	e8 52 de ff ff       	call   80103870 <myproc>
80105a1e:	8b 50 24             	mov    0x24(%eax),%edx
80105a21:	85 d2                	test   %edx,%edx
80105a23:	75 4b                	jne    80105a70 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105a25:	e8 46 de ff ff       	call   80103870 <myproc>
80105a2a:	85 c0                	test   %eax,%eax
80105a2c:	74 0b                	je     80105a39 <trap+0xc9>
80105a2e:	e8 3d de ff ff       	call   80103870 <myproc>
80105a33:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105a37:	74 4f                	je     80105a88 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105a39:	e8 32 de ff ff       	call   80103870 <myproc>
80105a3e:	85 c0                	test   %eax,%eax
80105a40:	74 1d                	je     80105a5f <trap+0xef>
80105a42:	e8 29 de ff ff       	call   80103870 <myproc>
80105a47:	8b 40 24             	mov    0x24(%eax),%eax
80105a4a:	85 c0                	test   %eax,%eax
80105a4c:	74 11                	je     80105a5f <trap+0xef>
80105a4e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a52:	83 e0 03             	and    $0x3,%eax
80105a55:	66 83 f8 03          	cmp    $0x3,%ax
80105a59:	0f 84 da 00 00 00    	je     80105b39 <trap+0x1c9>
    exit();
}
80105a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a62:	5b                   	pop    %ebx
80105a63:	5e                   	pop    %esi
80105a64:	5f                   	pop    %edi
80105a65:	5d                   	pop    %ebp
80105a66:	c3                   	ret    
80105a67:	89 f6                	mov    %esi,%esi
80105a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105a70:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a74:	83 e0 03             	and    $0x3,%eax
80105a77:	66 83 f8 03          	cmp    $0x3,%ax
80105a7b:	75 a8                	jne    80105a25 <trap+0xb5>
    exit();
80105a7d:	e8 1e e2 ff ff       	call   80103ca0 <exit>
80105a82:	eb a1                	jmp    80105a25 <trap+0xb5>
80105a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105a88:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105a8c:	75 ab                	jne    80105a39 <trap+0xc9>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
80105a8e:	e8 3d e3 ff ff       	call   80103dd0 <yield>
80105a93:	eb a4                	jmp    80105a39 <trap+0xc9>
80105a95:	8d 76 00             	lea    0x0(%esi),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80105a98:	e8 b3 dd ff ff       	call   80103850 <cpuid>
80105a9d:	85 c0                	test   %eax,%eax
80105a9f:	0f 84 ab 00 00 00    	je     80105b50 <trap+0x1e0>
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
80105aa5:	e8 26 cd ff ff       	call   801027d0 <lapiceoi>
    break;
80105aaa:	e9 61 ff ff ff       	jmp    80105a10 <trap+0xa0>
80105aaf:	90                   	nop
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105ab0:	e8 db cb ff ff       	call   80102690 <kbdintr>
    lapiceoi();
80105ab5:	e8 16 cd ff ff       	call   801027d0 <lapiceoi>
    break;
80105aba:	e9 51 ff ff ff       	jmp    80105a10 <trap+0xa0>
80105abf:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105ac0:	e8 5b 02 00 00       	call   80105d20 <uartintr>
    lapiceoi();
80105ac5:	e8 06 cd ff ff       	call   801027d0 <lapiceoi>
    break;
80105aca:	e9 41 ff ff ff       	jmp    80105a10 <trap+0xa0>
80105acf:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105ad0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105ad4:	8b 77 38             	mov    0x38(%edi),%esi
80105ad7:	e8 74 dd ff ff       	call   80103850 <cpuid>
80105adc:	56                   	push   %esi
80105add:	53                   	push   %ebx
80105ade:	50                   	push   %eax
80105adf:	68 2c 79 10 80       	push   $0x8010792c
80105ae4:	e8 77 ab ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80105ae9:	e8 e2 cc ff ff       	call   801027d0 <lapiceoi>
    break;
80105aee:	83 c4 10             	add    $0x10,%esp
80105af1:	e9 1a ff ff ff       	jmp    80105a10 <trap+0xa0>
80105af6:	8d 76 00             	lea    0x0(%esi),%esi
80105af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105b00:	e8 0b c6 ff ff       	call   80102110 <ideintr>
80105b05:	eb 9e                	jmp    80105aa5 <trap+0x135>
80105b07:	89 f6                	mov    %esi,%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
80105b10:	e8 5b dd ff ff       	call   80103870 <myproc>
80105b15:	8b 58 24             	mov    0x24(%eax),%ebx
80105b18:	85 db                	test   %ebx,%ebx
80105b1a:	75 2c                	jne    80105b48 <trap+0x1d8>
      exit();
    myproc()->tf = tf;
80105b1c:	e8 4f dd ff ff       	call   80103870 <myproc>
80105b21:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105b24:	e8 f7 ed ff ff       	call   80104920 <syscall>
    if(myproc()->killed)
80105b29:	e8 42 dd ff ff       	call   80103870 <myproc>
80105b2e:	8b 48 24             	mov    0x24(%eax),%ecx
80105b31:	85 c9                	test   %ecx,%ecx
80105b33:	0f 84 26 ff ff ff    	je     80105a5f <trap+0xef>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105b39:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b3c:	5b                   	pop    %ebx
80105b3d:	5e                   	pop    %esi
80105b3e:	5f                   	pop    %edi
80105b3f:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
80105b40:	e9 5b e1 ff ff       	jmp    80103ca0 <exit>
80105b45:	8d 76 00             	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
80105b48:	e8 53 e1 ff ff       	call   80103ca0 <exit>
80105b4d:	eb cd                	jmp    80105b1c <trap+0x1ac>
80105b4f:	90                   	nop
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
80105b50:	83 ec 0c             	sub    $0xc,%esp
80105b53:	68 a0 4e 11 80       	push   $0x80114ea0
80105b58:	e8 c3 e8 ff ff       	call   80104420 <acquire>
      ticks++;
      wakeup(&ticks);
80105b5d:	c7 04 24 e0 56 11 80 	movl   $0x801156e0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
80105b64:	83 05 e0 56 11 80 01 	addl   $0x1,0x801156e0
      wakeup(&ticks);
80105b6b:	e8 70 e4 ff ff       	call   80103fe0 <wakeup>
      release(&tickslock);
80105b70:	c7 04 24 a0 4e 11 80 	movl   $0x80114ea0,(%esp)
80105b77:	e8 54 e9 ff ff       	call   801044d0 <release>
80105b7c:	83 c4 10             	add    $0x10,%esp
80105b7f:	e9 21 ff ff ff       	jmp    80105aa5 <trap+0x135>
80105b84:	0f 20 d6             	mov    %cr2,%esi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105b87:	8b 5f 38             	mov    0x38(%edi),%ebx
80105b8a:	e8 c1 dc ff ff       	call   80103850 <cpuid>
80105b8f:	83 ec 0c             	sub    $0xc,%esp
80105b92:	56                   	push   %esi
80105b93:	53                   	push   %ebx
80105b94:	50                   	push   %eax
80105b95:	ff 77 30             	pushl  0x30(%edi)
80105b98:	68 50 79 10 80       	push   $0x80107950
80105b9d:	e8 be aa ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
80105ba2:	83 c4 14             	add    $0x14,%esp
80105ba5:	68 26 79 10 80       	push   $0x80107926
80105baa:	e8 c1 a7 ff ff       	call   80100370 <panic>
80105baf:	90                   	nop

80105bb0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105bb0:	a1 bc a6 10 80       	mov    0x8010a6bc,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105bb5:	55                   	push   %ebp
80105bb6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105bb8:	85 c0                	test   %eax,%eax
80105bba:	74 1c                	je     80105bd8 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105bbc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105bc1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105bc2:	a8 01                	test   $0x1,%al
80105bc4:	74 12                	je     80105bd8 <uartgetc+0x28>
80105bc6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bcb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105bcc:	0f b6 c0             	movzbl %al,%eax
}
80105bcf:	5d                   	pop    %ebp
80105bd0:	c3                   	ret    
80105bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105bd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105bdd:	5d                   	pop    %ebp
80105bde:	c3                   	ret    
80105bdf:	90                   	nop

80105be0 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105be0:	55                   	push   %ebp
80105be1:	89 e5                	mov    %esp,%ebp
80105be3:	57                   	push   %edi
80105be4:	56                   	push   %esi
80105be5:	53                   	push   %ebx
80105be6:	89 c7                	mov    %eax,%edi
80105be8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105bed:	be fd 03 00 00       	mov    $0x3fd,%esi
80105bf2:	83 ec 0c             	sub    $0xc,%esp
80105bf5:	eb 1b                	jmp    80105c12 <uartputc.part.0+0x32>
80105bf7:	89 f6                	mov    %esi,%esi
80105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105c00:	83 ec 0c             	sub    $0xc,%esp
80105c03:	6a 0a                	push   $0xa
80105c05:	e8 e6 cb ff ff       	call   801027f0 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105c0a:	83 c4 10             	add    $0x10,%esp
80105c0d:	83 eb 01             	sub    $0x1,%ebx
80105c10:	74 07                	je     80105c19 <uartputc.part.0+0x39>
80105c12:	89 f2                	mov    %esi,%edx
80105c14:	ec                   	in     (%dx),%al
80105c15:	a8 20                	test   $0x20,%al
80105c17:	74 e7                	je     80105c00 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105c19:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c1e:	89 f8                	mov    %edi,%eax
80105c20:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c24:	5b                   	pop    %ebx
80105c25:	5e                   	pop    %esi
80105c26:	5f                   	pop    %edi
80105c27:	5d                   	pop    %ebp
80105c28:	c3                   	ret    
80105c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c30 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105c30:	55                   	push   %ebp
80105c31:	31 c9                	xor    %ecx,%ecx
80105c33:	89 c8                	mov    %ecx,%eax
80105c35:	89 e5                	mov    %esp,%ebp
80105c37:	57                   	push   %edi
80105c38:	56                   	push   %esi
80105c39:	53                   	push   %ebx
80105c3a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105c3f:	89 da                	mov    %ebx,%edx
80105c41:	83 ec 0c             	sub    $0xc,%esp
80105c44:	ee                   	out    %al,(%dx)
80105c45:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105c4a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105c4f:	89 fa                	mov    %edi,%edx
80105c51:	ee                   	out    %al,(%dx)
80105c52:	b8 0c 00 00 00       	mov    $0xc,%eax
80105c57:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c5c:	ee                   	out    %al,(%dx)
80105c5d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105c62:	89 c8                	mov    %ecx,%eax
80105c64:	89 f2                	mov    %esi,%edx
80105c66:	ee                   	out    %al,(%dx)
80105c67:	b8 03 00 00 00       	mov    $0x3,%eax
80105c6c:	89 fa                	mov    %edi,%edx
80105c6e:	ee                   	out    %al,(%dx)
80105c6f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105c74:	89 c8                	mov    %ecx,%eax
80105c76:	ee                   	out    %al,(%dx)
80105c77:	b8 01 00 00 00       	mov    $0x1,%eax
80105c7c:	89 f2                	mov    %esi,%edx
80105c7e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105c7f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c84:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105c85:	3c ff                	cmp    $0xff,%al
80105c87:	74 5a                	je     80105ce3 <uartinit+0xb3>
    return;
  uart = 1;
80105c89:	c7 05 bc a6 10 80 01 	movl   $0x1,0x8010a6bc
80105c90:	00 00 00 
80105c93:	89 da                	mov    %ebx,%edx
80105c95:	ec                   	in     (%dx),%al
80105c96:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c9b:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);
80105c9c:	83 ec 08             	sub    $0x8,%esp
80105c9f:	bb 48 7a 10 80       	mov    $0x80107a48,%ebx
80105ca4:	6a 00                	push   $0x0
80105ca6:	6a 04                	push   $0x4
80105ca8:	e8 b3 c6 ff ff       	call   80102360 <ioapicenable>
80105cad:	83 c4 10             	add    $0x10,%esp
80105cb0:	b8 78 00 00 00       	mov    $0x78,%eax
80105cb5:	eb 13                	jmp    80105cca <uartinit+0x9a>
80105cb7:	89 f6                	mov    %esi,%esi
80105cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105cc0:	83 c3 01             	add    $0x1,%ebx
80105cc3:	0f be 03             	movsbl (%ebx),%eax
80105cc6:	84 c0                	test   %al,%al
80105cc8:	74 19                	je     80105ce3 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105cca:	8b 15 bc a6 10 80    	mov    0x8010a6bc,%edx
80105cd0:	85 d2                	test   %edx,%edx
80105cd2:	74 ec                	je     80105cc0 <uartinit+0x90>
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105cd4:	83 c3 01             	add    $0x1,%ebx
80105cd7:	e8 04 ff ff ff       	call   80105be0 <uartputc.part.0>
80105cdc:	0f be 03             	movsbl (%ebx),%eax
80105cdf:	84 c0                	test   %al,%al
80105ce1:	75 e7                	jne    80105cca <uartinit+0x9a>
    uartputc(*p);
}
80105ce3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ce6:	5b                   	pop    %ebx
80105ce7:	5e                   	pop    %esi
80105ce8:	5f                   	pop    %edi
80105ce9:	5d                   	pop    %ebp
80105cea:	c3                   	ret    
80105ceb:	90                   	nop
80105cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105cf0 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105cf0:	8b 15 bc a6 10 80    	mov    0x8010a6bc,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105cf6:	55                   	push   %ebp
80105cf7:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105cf9:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105cfb:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105cfe:	74 10                	je     80105d10 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105d00:	5d                   	pop    %ebp
80105d01:	e9 da fe ff ff       	jmp    80105be0 <uartputc.part.0>
80105d06:	8d 76 00             	lea    0x0(%esi),%esi
80105d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105d10:	5d                   	pop    %ebp
80105d11:	c3                   	ret    
80105d12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d20 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105d20:	55                   	push   %ebp
80105d21:	89 e5                	mov    %esp,%ebp
80105d23:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105d26:	68 b0 5b 10 80       	push   $0x80105bb0
80105d2b:	e8 c0 aa ff ff       	call   801007f0 <consoleintr>
}
80105d30:	83 c4 10             	add    $0x10,%esp
80105d33:	c9                   	leave  
80105d34:	c3                   	ret    

80105d35 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105d35:	6a 00                	push   $0x0
  pushl $0
80105d37:	6a 00                	push   $0x0
  jmp alltraps
80105d39:	e9 37 fb ff ff       	jmp    80105875 <alltraps>

80105d3e <vector1>:
.globl vector1
vector1:
  pushl $0
80105d3e:	6a 00                	push   $0x0
  pushl $1
80105d40:	6a 01                	push   $0x1
  jmp alltraps
80105d42:	e9 2e fb ff ff       	jmp    80105875 <alltraps>

80105d47 <vector2>:
.globl vector2
vector2:
  pushl $0
80105d47:	6a 00                	push   $0x0
  pushl $2
80105d49:	6a 02                	push   $0x2
  jmp alltraps
80105d4b:	e9 25 fb ff ff       	jmp    80105875 <alltraps>

80105d50 <vector3>:
.globl vector3
vector3:
  pushl $0
80105d50:	6a 00                	push   $0x0
  pushl $3
80105d52:	6a 03                	push   $0x3
  jmp alltraps
80105d54:	e9 1c fb ff ff       	jmp    80105875 <alltraps>

80105d59 <vector4>:
.globl vector4
vector4:
  pushl $0
80105d59:	6a 00                	push   $0x0
  pushl $4
80105d5b:	6a 04                	push   $0x4
  jmp alltraps
80105d5d:	e9 13 fb ff ff       	jmp    80105875 <alltraps>

80105d62 <vector5>:
.globl vector5
vector5:
  pushl $0
80105d62:	6a 00                	push   $0x0
  pushl $5
80105d64:	6a 05                	push   $0x5
  jmp alltraps
80105d66:	e9 0a fb ff ff       	jmp    80105875 <alltraps>

80105d6b <vector6>:
.globl vector6
vector6:
  pushl $0
80105d6b:	6a 00                	push   $0x0
  pushl $6
80105d6d:	6a 06                	push   $0x6
  jmp alltraps
80105d6f:	e9 01 fb ff ff       	jmp    80105875 <alltraps>

80105d74 <vector7>:
.globl vector7
vector7:
  pushl $0
80105d74:	6a 00                	push   $0x0
  pushl $7
80105d76:	6a 07                	push   $0x7
  jmp alltraps
80105d78:	e9 f8 fa ff ff       	jmp    80105875 <alltraps>

80105d7d <vector8>:
.globl vector8
vector8:
  pushl $8
80105d7d:	6a 08                	push   $0x8
  jmp alltraps
80105d7f:	e9 f1 fa ff ff       	jmp    80105875 <alltraps>

80105d84 <vector9>:
.globl vector9
vector9:
  pushl $0
80105d84:	6a 00                	push   $0x0
  pushl $9
80105d86:	6a 09                	push   $0x9
  jmp alltraps
80105d88:	e9 e8 fa ff ff       	jmp    80105875 <alltraps>

80105d8d <vector10>:
.globl vector10
vector10:
  pushl $10
80105d8d:	6a 0a                	push   $0xa
  jmp alltraps
80105d8f:	e9 e1 fa ff ff       	jmp    80105875 <alltraps>

80105d94 <vector11>:
.globl vector11
vector11:
  pushl $11
80105d94:	6a 0b                	push   $0xb
  jmp alltraps
80105d96:	e9 da fa ff ff       	jmp    80105875 <alltraps>

80105d9b <vector12>:
.globl vector12
vector12:
  pushl $12
80105d9b:	6a 0c                	push   $0xc
  jmp alltraps
80105d9d:	e9 d3 fa ff ff       	jmp    80105875 <alltraps>

80105da2 <vector13>:
.globl vector13
vector13:
  pushl $13
80105da2:	6a 0d                	push   $0xd
  jmp alltraps
80105da4:	e9 cc fa ff ff       	jmp    80105875 <alltraps>

80105da9 <vector14>:
.globl vector14
vector14:
  pushl $14
80105da9:	6a 0e                	push   $0xe
  jmp alltraps
80105dab:	e9 c5 fa ff ff       	jmp    80105875 <alltraps>

80105db0 <vector15>:
.globl vector15
vector15:
  pushl $0
80105db0:	6a 00                	push   $0x0
  pushl $15
80105db2:	6a 0f                	push   $0xf
  jmp alltraps
80105db4:	e9 bc fa ff ff       	jmp    80105875 <alltraps>

80105db9 <vector16>:
.globl vector16
vector16:
  pushl $0
80105db9:	6a 00                	push   $0x0
  pushl $16
80105dbb:	6a 10                	push   $0x10
  jmp alltraps
80105dbd:	e9 b3 fa ff ff       	jmp    80105875 <alltraps>

80105dc2 <vector17>:
.globl vector17
vector17:
  pushl $17
80105dc2:	6a 11                	push   $0x11
  jmp alltraps
80105dc4:	e9 ac fa ff ff       	jmp    80105875 <alltraps>

80105dc9 <vector18>:
.globl vector18
vector18:
  pushl $0
80105dc9:	6a 00                	push   $0x0
  pushl $18
80105dcb:	6a 12                	push   $0x12
  jmp alltraps
80105dcd:	e9 a3 fa ff ff       	jmp    80105875 <alltraps>

80105dd2 <vector19>:
.globl vector19
vector19:
  pushl $0
80105dd2:	6a 00                	push   $0x0
  pushl $19
80105dd4:	6a 13                	push   $0x13
  jmp alltraps
80105dd6:	e9 9a fa ff ff       	jmp    80105875 <alltraps>

80105ddb <vector20>:
.globl vector20
vector20:
  pushl $0
80105ddb:	6a 00                	push   $0x0
  pushl $20
80105ddd:	6a 14                	push   $0x14
  jmp alltraps
80105ddf:	e9 91 fa ff ff       	jmp    80105875 <alltraps>

80105de4 <vector21>:
.globl vector21
vector21:
  pushl $0
80105de4:	6a 00                	push   $0x0
  pushl $21
80105de6:	6a 15                	push   $0x15
  jmp alltraps
80105de8:	e9 88 fa ff ff       	jmp    80105875 <alltraps>

80105ded <vector22>:
.globl vector22
vector22:
  pushl $0
80105ded:	6a 00                	push   $0x0
  pushl $22
80105def:	6a 16                	push   $0x16
  jmp alltraps
80105df1:	e9 7f fa ff ff       	jmp    80105875 <alltraps>

80105df6 <vector23>:
.globl vector23
vector23:
  pushl $0
80105df6:	6a 00                	push   $0x0
  pushl $23
80105df8:	6a 17                	push   $0x17
  jmp alltraps
80105dfa:	e9 76 fa ff ff       	jmp    80105875 <alltraps>

80105dff <vector24>:
.globl vector24
vector24:
  pushl $0
80105dff:	6a 00                	push   $0x0
  pushl $24
80105e01:	6a 18                	push   $0x18
  jmp alltraps
80105e03:	e9 6d fa ff ff       	jmp    80105875 <alltraps>

80105e08 <vector25>:
.globl vector25
vector25:
  pushl $0
80105e08:	6a 00                	push   $0x0
  pushl $25
80105e0a:	6a 19                	push   $0x19
  jmp alltraps
80105e0c:	e9 64 fa ff ff       	jmp    80105875 <alltraps>

80105e11 <vector26>:
.globl vector26
vector26:
  pushl $0
80105e11:	6a 00                	push   $0x0
  pushl $26
80105e13:	6a 1a                	push   $0x1a
  jmp alltraps
80105e15:	e9 5b fa ff ff       	jmp    80105875 <alltraps>

80105e1a <vector27>:
.globl vector27
vector27:
  pushl $0
80105e1a:	6a 00                	push   $0x0
  pushl $27
80105e1c:	6a 1b                	push   $0x1b
  jmp alltraps
80105e1e:	e9 52 fa ff ff       	jmp    80105875 <alltraps>

80105e23 <vector28>:
.globl vector28
vector28:
  pushl $0
80105e23:	6a 00                	push   $0x0
  pushl $28
80105e25:	6a 1c                	push   $0x1c
  jmp alltraps
80105e27:	e9 49 fa ff ff       	jmp    80105875 <alltraps>

80105e2c <vector29>:
.globl vector29
vector29:
  pushl $0
80105e2c:	6a 00                	push   $0x0
  pushl $29
80105e2e:	6a 1d                	push   $0x1d
  jmp alltraps
80105e30:	e9 40 fa ff ff       	jmp    80105875 <alltraps>

80105e35 <vector30>:
.globl vector30
vector30:
  pushl $0
80105e35:	6a 00                	push   $0x0
  pushl $30
80105e37:	6a 1e                	push   $0x1e
  jmp alltraps
80105e39:	e9 37 fa ff ff       	jmp    80105875 <alltraps>

80105e3e <vector31>:
.globl vector31
vector31:
  pushl $0
80105e3e:	6a 00                	push   $0x0
  pushl $31
80105e40:	6a 1f                	push   $0x1f
  jmp alltraps
80105e42:	e9 2e fa ff ff       	jmp    80105875 <alltraps>

80105e47 <vector32>:
.globl vector32
vector32:
  pushl $0
80105e47:	6a 00                	push   $0x0
  pushl $32
80105e49:	6a 20                	push   $0x20
  jmp alltraps
80105e4b:	e9 25 fa ff ff       	jmp    80105875 <alltraps>

80105e50 <vector33>:
.globl vector33
vector33:
  pushl $0
80105e50:	6a 00                	push   $0x0
  pushl $33
80105e52:	6a 21                	push   $0x21
  jmp alltraps
80105e54:	e9 1c fa ff ff       	jmp    80105875 <alltraps>

80105e59 <vector34>:
.globl vector34
vector34:
  pushl $0
80105e59:	6a 00                	push   $0x0
  pushl $34
80105e5b:	6a 22                	push   $0x22
  jmp alltraps
80105e5d:	e9 13 fa ff ff       	jmp    80105875 <alltraps>

80105e62 <vector35>:
.globl vector35
vector35:
  pushl $0
80105e62:	6a 00                	push   $0x0
  pushl $35
80105e64:	6a 23                	push   $0x23
  jmp alltraps
80105e66:	e9 0a fa ff ff       	jmp    80105875 <alltraps>

80105e6b <vector36>:
.globl vector36
vector36:
  pushl $0
80105e6b:	6a 00                	push   $0x0
  pushl $36
80105e6d:	6a 24                	push   $0x24
  jmp alltraps
80105e6f:	e9 01 fa ff ff       	jmp    80105875 <alltraps>

80105e74 <vector37>:
.globl vector37
vector37:
  pushl $0
80105e74:	6a 00                	push   $0x0
  pushl $37
80105e76:	6a 25                	push   $0x25
  jmp alltraps
80105e78:	e9 f8 f9 ff ff       	jmp    80105875 <alltraps>

80105e7d <vector38>:
.globl vector38
vector38:
  pushl $0
80105e7d:	6a 00                	push   $0x0
  pushl $38
80105e7f:	6a 26                	push   $0x26
  jmp alltraps
80105e81:	e9 ef f9 ff ff       	jmp    80105875 <alltraps>

80105e86 <vector39>:
.globl vector39
vector39:
  pushl $0
80105e86:	6a 00                	push   $0x0
  pushl $39
80105e88:	6a 27                	push   $0x27
  jmp alltraps
80105e8a:	e9 e6 f9 ff ff       	jmp    80105875 <alltraps>

80105e8f <vector40>:
.globl vector40
vector40:
  pushl $0
80105e8f:	6a 00                	push   $0x0
  pushl $40
80105e91:	6a 28                	push   $0x28
  jmp alltraps
80105e93:	e9 dd f9 ff ff       	jmp    80105875 <alltraps>

80105e98 <vector41>:
.globl vector41
vector41:
  pushl $0
80105e98:	6a 00                	push   $0x0
  pushl $41
80105e9a:	6a 29                	push   $0x29
  jmp alltraps
80105e9c:	e9 d4 f9 ff ff       	jmp    80105875 <alltraps>

80105ea1 <vector42>:
.globl vector42
vector42:
  pushl $0
80105ea1:	6a 00                	push   $0x0
  pushl $42
80105ea3:	6a 2a                	push   $0x2a
  jmp alltraps
80105ea5:	e9 cb f9 ff ff       	jmp    80105875 <alltraps>

80105eaa <vector43>:
.globl vector43
vector43:
  pushl $0
80105eaa:	6a 00                	push   $0x0
  pushl $43
80105eac:	6a 2b                	push   $0x2b
  jmp alltraps
80105eae:	e9 c2 f9 ff ff       	jmp    80105875 <alltraps>

80105eb3 <vector44>:
.globl vector44
vector44:
  pushl $0
80105eb3:	6a 00                	push   $0x0
  pushl $44
80105eb5:	6a 2c                	push   $0x2c
  jmp alltraps
80105eb7:	e9 b9 f9 ff ff       	jmp    80105875 <alltraps>

80105ebc <vector45>:
.globl vector45
vector45:
  pushl $0
80105ebc:	6a 00                	push   $0x0
  pushl $45
80105ebe:	6a 2d                	push   $0x2d
  jmp alltraps
80105ec0:	e9 b0 f9 ff ff       	jmp    80105875 <alltraps>

80105ec5 <vector46>:
.globl vector46
vector46:
  pushl $0
80105ec5:	6a 00                	push   $0x0
  pushl $46
80105ec7:	6a 2e                	push   $0x2e
  jmp alltraps
80105ec9:	e9 a7 f9 ff ff       	jmp    80105875 <alltraps>

80105ece <vector47>:
.globl vector47
vector47:
  pushl $0
80105ece:	6a 00                	push   $0x0
  pushl $47
80105ed0:	6a 2f                	push   $0x2f
  jmp alltraps
80105ed2:	e9 9e f9 ff ff       	jmp    80105875 <alltraps>

80105ed7 <vector48>:
.globl vector48
vector48:
  pushl $0
80105ed7:	6a 00                	push   $0x0
  pushl $48
80105ed9:	6a 30                	push   $0x30
  jmp alltraps
80105edb:	e9 95 f9 ff ff       	jmp    80105875 <alltraps>

80105ee0 <vector49>:
.globl vector49
vector49:
  pushl $0
80105ee0:	6a 00                	push   $0x0
  pushl $49
80105ee2:	6a 31                	push   $0x31
  jmp alltraps
80105ee4:	e9 8c f9 ff ff       	jmp    80105875 <alltraps>

80105ee9 <vector50>:
.globl vector50
vector50:
  pushl $0
80105ee9:	6a 00                	push   $0x0
  pushl $50
80105eeb:	6a 32                	push   $0x32
  jmp alltraps
80105eed:	e9 83 f9 ff ff       	jmp    80105875 <alltraps>

80105ef2 <vector51>:
.globl vector51
vector51:
  pushl $0
80105ef2:	6a 00                	push   $0x0
  pushl $51
80105ef4:	6a 33                	push   $0x33
  jmp alltraps
80105ef6:	e9 7a f9 ff ff       	jmp    80105875 <alltraps>

80105efb <vector52>:
.globl vector52
vector52:
  pushl $0
80105efb:	6a 00                	push   $0x0
  pushl $52
80105efd:	6a 34                	push   $0x34
  jmp alltraps
80105eff:	e9 71 f9 ff ff       	jmp    80105875 <alltraps>

80105f04 <vector53>:
.globl vector53
vector53:
  pushl $0
80105f04:	6a 00                	push   $0x0
  pushl $53
80105f06:	6a 35                	push   $0x35
  jmp alltraps
80105f08:	e9 68 f9 ff ff       	jmp    80105875 <alltraps>

80105f0d <vector54>:
.globl vector54
vector54:
  pushl $0
80105f0d:	6a 00                	push   $0x0
  pushl $54
80105f0f:	6a 36                	push   $0x36
  jmp alltraps
80105f11:	e9 5f f9 ff ff       	jmp    80105875 <alltraps>

80105f16 <vector55>:
.globl vector55
vector55:
  pushl $0
80105f16:	6a 00                	push   $0x0
  pushl $55
80105f18:	6a 37                	push   $0x37
  jmp alltraps
80105f1a:	e9 56 f9 ff ff       	jmp    80105875 <alltraps>

80105f1f <vector56>:
.globl vector56
vector56:
  pushl $0
80105f1f:	6a 00                	push   $0x0
  pushl $56
80105f21:	6a 38                	push   $0x38
  jmp alltraps
80105f23:	e9 4d f9 ff ff       	jmp    80105875 <alltraps>

80105f28 <vector57>:
.globl vector57
vector57:
  pushl $0
80105f28:	6a 00                	push   $0x0
  pushl $57
80105f2a:	6a 39                	push   $0x39
  jmp alltraps
80105f2c:	e9 44 f9 ff ff       	jmp    80105875 <alltraps>

80105f31 <vector58>:
.globl vector58
vector58:
  pushl $0
80105f31:	6a 00                	push   $0x0
  pushl $58
80105f33:	6a 3a                	push   $0x3a
  jmp alltraps
80105f35:	e9 3b f9 ff ff       	jmp    80105875 <alltraps>

80105f3a <vector59>:
.globl vector59
vector59:
  pushl $0
80105f3a:	6a 00                	push   $0x0
  pushl $59
80105f3c:	6a 3b                	push   $0x3b
  jmp alltraps
80105f3e:	e9 32 f9 ff ff       	jmp    80105875 <alltraps>

80105f43 <vector60>:
.globl vector60
vector60:
  pushl $0
80105f43:	6a 00                	push   $0x0
  pushl $60
80105f45:	6a 3c                	push   $0x3c
  jmp alltraps
80105f47:	e9 29 f9 ff ff       	jmp    80105875 <alltraps>

80105f4c <vector61>:
.globl vector61
vector61:
  pushl $0
80105f4c:	6a 00                	push   $0x0
  pushl $61
80105f4e:	6a 3d                	push   $0x3d
  jmp alltraps
80105f50:	e9 20 f9 ff ff       	jmp    80105875 <alltraps>

80105f55 <vector62>:
.globl vector62
vector62:
  pushl $0
80105f55:	6a 00                	push   $0x0
  pushl $62
80105f57:	6a 3e                	push   $0x3e
  jmp alltraps
80105f59:	e9 17 f9 ff ff       	jmp    80105875 <alltraps>

80105f5e <vector63>:
.globl vector63
vector63:
  pushl $0
80105f5e:	6a 00                	push   $0x0
  pushl $63
80105f60:	6a 3f                	push   $0x3f
  jmp alltraps
80105f62:	e9 0e f9 ff ff       	jmp    80105875 <alltraps>

80105f67 <vector64>:
.globl vector64
vector64:
  pushl $0
80105f67:	6a 00                	push   $0x0
  pushl $64
80105f69:	6a 40                	push   $0x40
  jmp alltraps
80105f6b:	e9 05 f9 ff ff       	jmp    80105875 <alltraps>

80105f70 <vector65>:
.globl vector65
vector65:
  pushl $0
80105f70:	6a 00                	push   $0x0
  pushl $65
80105f72:	6a 41                	push   $0x41
  jmp alltraps
80105f74:	e9 fc f8 ff ff       	jmp    80105875 <alltraps>

80105f79 <vector66>:
.globl vector66
vector66:
  pushl $0
80105f79:	6a 00                	push   $0x0
  pushl $66
80105f7b:	6a 42                	push   $0x42
  jmp alltraps
80105f7d:	e9 f3 f8 ff ff       	jmp    80105875 <alltraps>

80105f82 <vector67>:
.globl vector67
vector67:
  pushl $0
80105f82:	6a 00                	push   $0x0
  pushl $67
80105f84:	6a 43                	push   $0x43
  jmp alltraps
80105f86:	e9 ea f8 ff ff       	jmp    80105875 <alltraps>

80105f8b <vector68>:
.globl vector68
vector68:
  pushl $0
80105f8b:	6a 00                	push   $0x0
  pushl $68
80105f8d:	6a 44                	push   $0x44
  jmp alltraps
80105f8f:	e9 e1 f8 ff ff       	jmp    80105875 <alltraps>

80105f94 <vector69>:
.globl vector69
vector69:
  pushl $0
80105f94:	6a 00                	push   $0x0
  pushl $69
80105f96:	6a 45                	push   $0x45
  jmp alltraps
80105f98:	e9 d8 f8 ff ff       	jmp    80105875 <alltraps>

80105f9d <vector70>:
.globl vector70
vector70:
  pushl $0
80105f9d:	6a 00                	push   $0x0
  pushl $70
80105f9f:	6a 46                	push   $0x46
  jmp alltraps
80105fa1:	e9 cf f8 ff ff       	jmp    80105875 <alltraps>

80105fa6 <vector71>:
.globl vector71
vector71:
  pushl $0
80105fa6:	6a 00                	push   $0x0
  pushl $71
80105fa8:	6a 47                	push   $0x47
  jmp alltraps
80105faa:	e9 c6 f8 ff ff       	jmp    80105875 <alltraps>

80105faf <vector72>:
.globl vector72
vector72:
  pushl $0
80105faf:	6a 00                	push   $0x0
  pushl $72
80105fb1:	6a 48                	push   $0x48
  jmp alltraps
80105fb3:	e9 bd f8 ff ff       	jmp    80105875 <alltraps>

80105fb8 <vector73>:
.globl vector73
vector73:
  pushl $0
80105fb8:	6a 00                	push   $0x0
  pushl $73
80105fba:	6a 49                	push   $0x49
  jmp alltraps
80105fbc:	e9 b4 f8 ff ff       	jmp    80105875 <alltraps>

80105fc1 <vector74>:
.globl vector74
vector74:
  pushl $0
80105fc1:	6a 00                	push   $0x0
  pushl $74
80105fc3:	6a 4a                	push   $0x4a
  jmp alltraps
80105fc5:	e9 ab f8 ff ff       	jmp    80105875 <alltraps>

80105fca <vector75>:
.globl vector75
vector75:
  pushl $0
80105fca:	6a 00                	push   $0x0
  pushl $75
80105fcc:	6a 4b                	push   $0x4b
  jmp alltraps
80105fce:	e9 a2 f8 ff ff       	jmp    80105875 <alltraps>

80105fd3 <vector76>:
.globl vector76
vector76:
  pushl $0
80105fd3:	6a 00                	push   $0x0
  pushl $76
80105fd5:	6a 4c                	push   $0x4c
  jmp alltraps
80105fd7:	e9 99 f8 ff ff       	jmp    80105875 <alltraps>

80105fdc <vector77>:
.globl vector77
vector77:
  pushl $0
80105fdc:	6a 00                	push   $0x0
  pushl $77
80105fde:	6a 4d                	push   $0x4d
  jmp alltraps
80105fe0:	e9 90 f8 ff ff       	jmp    80105875 <alltraps>

80105fe5 <vector78>:
.globl vector78
vector78:
  pushl $0
80105fe5:	6a 00                	push   $0x0
  pushl $78
80105fe7:	6a 4e                	push   $0x4e
  jmp alltraps
80105fe9:	e9 87 f8 ff ff       	jmp    80105875 <alltraps>

80105fee <vector79>:
.globl vector79
vector79:
  pushl $0
80105fee:	6a 00                	push   $0x0
  pushl $79
80105ff0:	6a 4f                	push   $0x4f
  jmp alltraps
80105ff2:	e9 7e f8 ff ff       	jmp    80105875 <alltraps>

80105ff7 <vector80>:
.globl vector80
vector80:
  pushl $0
80105ff7:	6a 00                	push   $0x0
  pushl $80
80105ff9:	6a 50                	push   $0x50
  jmp alltraps
80105ffb:	e9 75 f8 ff ff       	jmp    80105875 <alltraps>

80106000 <vector81>:
.globl vector81
vector81:
  pushl $0
80106000:	6a 00                	push   $0x0
  pushl $81
80106002:	6a 51                	push   $0x51
  jmp alltraps
80106004:	e9 6c f8 ff ff       	jmp    80105875 <alltraps>

80106009 <vector82>:
.globl vector82
vector82:
  pushl $0
80106009:	6a 00                	push   $0x0
  pushl $82
8010600b:	6a 52                	push   $0x52
  jmp alltraps
8010600d:	e9 63 f8 ff ff       	jmp    80105875 <alltraps>

80106012 <vector83>:
.globl vector83
vector83:
  pushl $0
80106012:	6a 00                	push   $0x0
  pushl $83
80106014:	6a 53                	push   $0x53
  jmp alltraps
80106016:	e9 5a f8 ff ff       	jmp    80105875 <alltraps>

8010601b <vector84>:
.globl vector84
vector84:
  pushl $0
8010601b:	6a 00                	push   $0x0
  pushl $84
8010601d:	6a 54                	push   $0x54
  jmp alltraps
8010601f:	e9 51 f8 ff ff       	jmp    80105875 <alltraps>

80106024 <vector85>:
.globl vector85
vector85:
  pushl $0
80106024:	6a 00                	push   $0x0
  pushl $85
80106026:	6a 55                	push   $0x55
  jmp alltraps
80106028:	e9 48 f8 ff ff       	jmp    80105875 <alltraps>

8010602d <vector86>:
.globl vector86
vector86:
  pushl $0
8010602d:	6a 00                	push   $0x0
  pushl $86
8010602f:	6a 56                	push   $0x56
  jmp alltraps
80106031:	e9 3f f8 ff ff       	jmp    80105875 <alltraps>

80106036 <vector87>:
.globl vector87
vector87:
  pushl $0
80106036:	6a 00                	push   $0x0
  pushl $87
80106038:	6a 57                	push   $0x57
  jmp alltraps
8010603a:	e9 36 f8 ff ff       	jmp    80105875 <alltraps>

8010603f <vector88>:
.globl vector88
vector88:
  pushl $0
8010603f:	6a 00                	push   $0x0
  pushl $88
80106041:	6a 58                	push   $0x58
  jmp alltraps
80106043:	e9 2d f8 ff ff       	jmp    80105875 <alltraps>

80106048 <vector89>:
.globl vector89
vector89:
  pushl $0
80106048:	6a 00                	push   $0x0
  pushl $89
8010604a:	6a 59                	push   $0x59
  jmp alltraps
8010604c:	e9 24 f8 ff ff       	jmp    80105875 <alltraps>

80106051 <vector90>:
.globl vector90
vector90:
  pushl $0
80106051:	6a 00                	push   $0x0
  pushl $90
80106053:	6a 5a                	push   $0x5a
  jmp alltraps
80106055:	e9 1b f8 ff ff       	jmp    80105875 <alltraps>

8010605a <vector91>:
.globl vector91
vector91:
  pushl $0
8010605a:	6a 00                	push   $0x0
  pushl $91
8010605c:	6a 5b                	push   $0x5b
  jmp alltraps
8010605e:	e9 12 f8 ff ff       	jmp    80105875 <alltraps>

80106063 <vector92>:
.globl vector92
vector92:
  pushl $0
80106063:	6a 00                	push   $0x0
  pushl $92
80106065:	6a 5c                	push   $0x5c
  jmp alltraps
80106067:	e9 09 f8 ff ff       	jmp    80105875 <alltraps>

8010606c <vector93>:
.globl vector93
vector93:
  pushl $0
8010606c:	6a 00                	push   $0x0
  pushl $93
8010606e:	6a 5d                	push   $0x5d
  jmp alltraps
80106070:	e9 00 f8 ff ff       	jmp    80105875 <alltraps>

80106075 <vector94>:
.globl vector94
vector94:
  pushl $0
80106075:	6a 00                	push   $0x0
  pushl $94
80106077:	6a 5e                	push   $0x5e
  jmp alltraps
80106079:	e9 f7 f7 ff ff       	jmp    80105875 <alltraps>

8010607e <vector95>:
.globl vector95
vector95:
  pushl $0
8010607e:	6a 00                	push   $0x0
  pushl $95
80106080:	6a 5f                	push   $0x5f
  jmp alltraps
80106082:	e9 ee f7 ff ff       	jmp    80105875 <alltraps>

80106087 <vector96>:
.globl vector96
vector96:
  pushl $0
80106087:	6a 00                	push   $0x0
  pushl $96
80106089:	6a 60                	push   $0x60
  jmp alltraps
8010608b:	e9 e5 f7 ff ff       	jmp    80105875 <alltraps>

80106090 <vector97>:
.globl vector97
vector97:
  pushl $0
80106090:	6a 00                	push   $0x0
  pushl $97
80106092:	6a 61                	push   $0x61
  jmp alltraps
80106094:	e9 dc f7 ff ff       	jmp    80105875 <alltraps>

80106099 <vector98>:
.globl vector98
vector98:
  pushl $0
80106099:	6a 00                	push   $0x0
  pushl $98
8010609b:	6a 62                	push   $0x62
  jmp alltraps
8010609d:	e9 d3 f7 ff ff       	jmp    80105875 <alltraps>

801060a2 <vector99>:
.globl vector99
vector99:
  pushl $0
801060a2:	6a 00                	push   $0x0
  pushl $99
801060a4:	6a 63                	push   $0x63
  jmp alltraps
801060a6:	e9 ca f7 ff ff       	jmp    80105875 <alltraps>

801060ab <vector100>:
.globl vector100
vector100:
  pushl $0
801060ab:	6a 00                	push   $0x0
  pushl $100
801060ad:	6a 64                	push   $0x64
  jmp alltraps
801060af:	e9 c1 f7 ff ff       	jmp    80105875 <alltraps>

801060b4 <vector101>:
.globl vector101
vector101:
  pushl $0
801060b4:	6a 00                	push   $0x0
  pushl $101
801060b6:	6a 65                	push   $0x65
  jmp alltraps
801060b8:	e9 b8 f7 ff ff       	jmp    80105875 <alltraps>

801060bd <vector102>:
.globl vector102
vector102:
  pushl $0
801060bd:	6a 00                	push   $0x0
  pushl $102
801060bf:	6a 66                	push   $0x66
  jmp alltraps
801060c1:	e9 af f7 ff ff       	jmp    80105875 <alltraps>

801060c6 <vector103>:
.globl vector103
vector103:
  pushl $0
801060c6:	6a 00                	push   $0x0
  pushl $103
801060c8:	6a 67                	push   $0x67
  jmp alltraps
801060ca:	e9 a6 f7 ff ff       	jmp    80105875 <alltraps>

801060cf <vector104>:
.globl vector104
vector104:
  pushl $0
801060cf:	6a 00                	push   $0x0
  pushl $104
801060d1:	6a 68                	push   $0x68
  jmp alltraps
801060d3:	e9 9d f7 ff ff       	jmp    80105875 <alltraps>

801060d8 <vector105>:
.globl vector105
vector105:
  pushl $0
801060d8:	6a 00                	push   $0x0
  pushl $105
801060da:	6a 69                	push   $0x69
  jmp alltraps
801060dc:	e9 94 f7 ff ff       	jmp    80105875 <alltraps>

801060e1 <vector106>:
.globl vector106
vector106:
  pushl $0
801060e1:	6a 00                	push   $0x0
  pushl $106
801060e3:	6a 6a                	push   $0x6a
  jmp alltraps
801060e5:	e9 8b f7 ff ff       	jmp    80105875 <alltraps>

801060ea <vector107>:
.globl vector107
vector107:
  pushl $0
801060ea:	6a 00                	push   $0x0
  pushl $107
801060ec:	6a 6b                	push   $0x6b
  jmp alltraps
801060ee:	e9 82 f7 ff ff       	jmp    80105875 <alltraps>

801060f3 <vector108>:
.globl vector108
vector108:
  pushl $0
801060f3:	6a 00                	push   $0x0
  pushl $108
801060f5:	6a 6c                	push   $0x6c
  jmp alltraps
801060f7:	e9 79 f7 ff ff       	jmp    80105875 <alltraps>

801060fc <vector109>:
.globl vector109
vector109:
  pushl $0
801060fc:	6a 00                	push   $0x0
  pushl $109
801060fe:	6a 6d                	push   $0x6d
  jmp alltraps
80106100:	e9 70 f7 ff ff       	jmp    80105875 <alltraps>

80106105 <vector110>:
.globl vector110
vector110:
  pushl $0
80106105:	6a 00                	push   $0x0
  pushl $110
80106107:	6a 6e                	push   $0x6e
  jmp alltraps
80106109:	e9 67 f7 ff ff       	jmp    80105875 <alltraps>

8010610e <vector111>:
.globl vector111
vector111:
  pushl $0
8010610e:	6a 00                	push   $0x0
  pushl $111
80106110:	6a 6f                	push   $0x6f
  jmp alltraps
80106112:	e9 5e f7 ff ff       	jmp    80105875 <alltraps>

80106117 <vector112>:
.globl vector112
vector112:
  pushl $0
80106117:	6a 00                	push   $0x0
  pushl $112
80106119:	6a 70                	push   $0x70
  jmp alltraps
8010611b:	e9 55 f7 ff ff       	jmp    80105875 <alltraps>

80106120 <vector113>:
.globl vector113
vector113:
  pushl $0
80106120:	6a 00                	push   $0x0
  pushl $113
80106122:	6a 71                	push   $0x71
  jmp alltraps
80106124:	e9 4c f7 ff ff       	jmp    80105875 <alltraps>

80106129 <vector114>:
.globl vector114
vector114:
  pushl $0
80106129:	6a 00                	push   $0x0
  pushl $114
8010612b:	6a 72                	push   $0x72
  jmp alltraps
8010612d:	e9 43 f7 ff ff       	jmp    80105875 <alltraps>

80106132 <vector115>:
.globl vector115
vector115:
  pushl $0
80106132:	6a 00                	push   $0x0
  pushl $115
80106134:	6a 73                	push   $0x73
  jmp alltraps
80106136:	e9 3a f7 ff ff       	jmp    80105875 <alltraps>

8010613b <vector116>:
.globl vector116
vector116:
  pushl $0
8010613b:	6a 00                	push   $0x0
  pushl $116
8010613d:	6a 74                	push   $0x74
  jmp alltraps
8010613f:	e9 31 f7 ff ff       	jmp    80105875 <alltraps>

80106144 <vector117>:
.globl vector117
vector117:
  pushl $0
80106144:	6a 00                	push   $0x0
  pushl $117
80106146:	6a 75                	push   $0x75
  jmp alltraps
80106148:	e9 28 f7 ff ff       	jmp    80105875 <alltraps>

8010614d <vector118>:
.globl vector118
vector118:
  pushl $0
8010614d:	6a 00                	push   $0x0
  pushl $118
8010614f:	6a 76                	push   $0x76
  jmp alltraps
80106151:	e9 1f f7 ff ff       	jmp    80105875 <alltraps>

80106156 <vector119>:
.globl vector119
vector119:
  pushl $0
80106156:	6a 00                	push   $0x0
  pushl $119
80106158:	6a 77                	push   $0x77
  jmp alltraps
8010615a:	e9 16 f7 ff ff       	jmp    80105875 <alltraps>

8010615f <vector120>:
.globl vector120
vector120:
  pushl $0
8010615f:	6a 00                	push   $0x0
  pushl $120
80106161:	6a 78                	push   $0x78
  jmp alltraps
80106163:	e9 0d f7 ff ff       	jmp    80105875 <alltraps>

80106168 <vector121>:
.globl vector121
vector121:
  pushl $0
80106168:	6a 00                	push   $0x0
  pushl $121
8010616a:	6a 79                	push   $0x79
  jmp alltraps
8010616c:	e9 04 f7 ff ff       	jmp    80105875 <alltraps>

80106171 <vector122>:
.globl vector122
vector122:
  pushl $0
80106171:	6a 00                	push   $0x0
  pushl $122
80106173:	6a 7a                	push   $0x7a
  jmp alltraps
80106175:	e9 fb f6 ff ff       	jmp    80105875 <alltraps>

8010617a <vector123>:
.globl vector123
vector123:
  pushl $0
8010617a:	6a 00                	push   $0x0
  pushl $123
8010617c:	6a 7b                	push   $0x7b
  jmp alltraps
8010617e:	e9 f2 f6 ff ff       	jmp    80105875 <alltraps>

80106183 <vector124>:
.globl vector124
vector124:
  pushl $0
80106183:	6a 00                	push   $0x0
  pushl $124
80106185:	6a 7c                	push   $0x7c
  jmp alltraps
80106187:	e9 e9 f6 ff ff       	jmp    80105875 <alltraps>

8010618c <vector125>:
.globl vector125
vector125:
  pushl $0
8010618c:	6a 00                	push   $0x0
  pushl $125
8010618e:	6a 7d                	push   $0x7d
  jmp alltraps
80106190:	e9 e0 f6 ff ff       	jmp    80105875 <alltraps>

80106195 <vector126>:
.globl vector126
vector126:
  pushl $0
80106195:	6a 00                	push   $0x0
  pushl $126
80106197:	6a 7e                	push   $0x7e
  jmp alltraps
80106199:	e9 d7 f6 ff ff       	jmp    80105875 <alltraps>

8010619e <vector127>:
.globl vector127
vector127:
  pushl $0
8010619e:	6a 00                	push   $0x0
  pushl $127
801061a0:	6a 7f                	push   $0x7f
  jmp alltraps
801061a2:	e9 ce f6 ff ff       	jmp    80105875 <alltraps>

801061a7 <vector128>:
.globl vector128
vector128:
  pushl $0
801061a7:	6a 00                	push   $0x0
  pushl $128
801061a9:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801061ae:	e9 c2 f6 ff ff       	jmp    80105875 <alltraps>

801061b3 <vector129>:
.globl vector129
vector129:
  pushl $0
801061b3:	6a 00                	push   $0x0
  pushl $129
801061b5:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801061ba:	e9 b6 f6 ff ff       	jmp    80105875 <alltraps>

801061bf <vector130>:
.globl vector130
vector130:
  pushl $0
801061bf:	6a 00                	push   $0x0
  pushl $130
801061c1:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801061c6:	e9 aa f6 ff ff       	jmp    80105875 <alltraps>

801061cb <vector131>:
.globl vector131
vector131:
  pushl $0
801061cb:	6a 00                	push   $0x0
  pushl $131
801061cd:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801061d2:	e9 9e f6 ff ff       	jmp    80105875 <alltraps>

801061d7 <vector132>:
.globl vector132
vector132:
  pushl $0
801061d7:	6a 00                	push   $0x0
  pushl $132
801061d9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801061de:	e9 92 f6 ff ff       	jmp    80105875 <alltraps>

801061e3 <vector133>:
.globl vector133
vector133:
  pushl $0
801061e3:	6a 00                	push   $0x0
  pushl $133
801061e5:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801061ea:	e9 86 f6 ff ff       	jmp    80105875 <alltraps>

801061ef <vector134>:
.globl vector134
vector134:
  pushl $0
801061ef:	6a 00                	push   $0x0
  pushl $134
801061f1:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801061f6:	e9 7a f6 ff ff       	jmp    80105875 <alltraps>

801061fb <vector135>:
.globl vector135
vector135:
  pushl $0
801061fb:	6a 00                	push   $0x0
  pushl $135
801061fd:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106202:	e9 6e f6 ff ff       	jmp    80105875 <alltraps>

80106207 <vector136>:
.globl vector136
vector136:
  pushl $0
80106207:	6a 00                	push   $0x0
  pushl $136
80106209:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010620e:	e9 62 f6 ff ff       	jmp    80105875 <alltraps>

80106213 <vector137>:
.globl vector137
vector137:
  pushl $0
80106213:	6a 00                	push   $0x0
  pushl $137
80106215:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010621a:	e9 56 f6 ff ff       	jmp    80105875 <alltraps>

8010621f <vector138>:
.globl vector138
vector138:
  pushl $0
8010621f:	6a 00                	push   $0x0
  pushl $138
80106221:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106226:	e9 4a f6 ff ff       	jmp    80105875 <alltraps>

8010622b <vector139>:
.globl vector139
vector139:
  pushl $0
8010622b:	6a 00                	push   $0x0
  pushl $139
8010622d:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106232:	e9 3e f6 ff ff       	jmp    80105875 <alltraps>

80106237 <vector140>:
.globl vector140
vector140:
  pushl $0
80106237:	6a 00                	push   $0x0
  pushl $140
80106239:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010623e:	e9 32 f6 ff ff       	jmp    80105875 <alltraps>

80106243 <vector141>:
.globl vector141
vector141:
  pushl $0
80106243:	6a 00                	push   $0x0
  pushl $141
80106245:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010624a:	e9 26 f6 ff ff       	jmp    80105875 <alltraps>

8010624f <vector142>:
.globl vector142
vector142:
  pushl $0
8010624f:	6a 00                	push   $0x0
  pushl $142
80106251:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106256:	e9 1a f6 ff ff       	jmp    80105875 <alltraps>

8010625b <vector143>:
.globl vector143
vector143:
  pushl $0
8010625b:	6a 00                	push   $0x0
  pushl $143
8010625d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106262:	e9 0e f6 ff ff       	jmp    80105875 <alltraps>

80106267 <vector144>:
.globl vector144
vector144:
  pushl $0
80106267:	6a 00                	push   $0x0
  pushl $144
80106269:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010626e:	e9 02 f6 ff ff       	jmp    80105875 <alltraps>

80106273 <vector145>:
.globl vector145
vector145:
  pushl $0
80106273:	6a 00                	push   $0x0
  pushl $145
80106275:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010627a:	e9 f6 f5 ff ff       	jmp    80105875 <alltraps>

8010627f <vector146>:
.globl vector146
vector146:
  pushl $0
8010627f:	6a 00                	push   $0x0
  pushl $146
80106281:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106286:	e9 ea f5 ff ff       	jmp    80105875 <alltraps>

8010628b <vector147>:
.globl vector147
vector147:
  pushl $0
8010628b:	6a 00                	push   $0x0
  pushl $147
8010628d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106292:	e9 de f5 ff ff       	jmp    80105875 <alltraps>

80106297 <vector148>:
.globl vector148
vector148:
  pushl $0
80106297:	6a 00                	push   $0x0
  pushl $148
80106299:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010629e:	e9 d2 f5 ff ff       	jmp    80105875 <alltraps>

801062a3 <vector149>:
.globl vector149
vector149:
  pushl $0
801062a3:	6a 00                	push   $0x0
  pushl $149
801062a5:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801062aa:	e9 c6 f5 ff ff       	jmp    80105875 <alltraps>

801062af <vector150>:
.globl vector150
vector150:
  pushl $0
801062af:	6a 00                	push   $0x0
  pushl $150
801062b1:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801062b6:	e9 ba f5 ff ff       	jmp    80105875 <alltraps>

801062bb <vector151>:
.globl vector151
vector151:
  pushl $0
801062bb:	6a 00                	push   $0x0
  pushl $151
801062bd:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801062c2:	e9 ae f5 ff ff       	jmp    80105875 <alltraps>

801062c7 <vector152>:
.globl vector152
vector152:
  pushl $0
801062c7:	6a 00                	push   $0x0
  pushl $152
801062c9:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801062ce:	e9 a2 f5 ff ff       	jmp    80105875 <alltraps>

801062d3 <vector153>:
.globl vector153
vector153:
  pushl $0
801062d3:	6a 00                	push   $0x0
  pushl $153
801062d5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801062da:	e9 96 f5 ff ff       	jmp    80105875 <alltraps>

801062df <vector154>:
.globl vector154
vector154:
  pushl $0
801062df:	6a 00                	push   $0x0
  pushl $154
801062e1:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801062e6:	e9 8a f5 ff ff       	jmp    80105875 <alltraps>

801062eb <vector155>:
.globl vector155
vector155:
  pushl $0
801062eb:	6a 00                	push   $0x0
  pushl $155
801062ed:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
801062f2:	e9 7e f5 ff ff       	jmp    80105875 <alltraps>

801062f7 <vector156>:
.globl vector156
vector156:
  pushl $0
801062f7:	6a 00                	push   $0x0
  pushl $156
801062f9:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
801062fe:	e9 72 f5 ff ff       	jmp    80105875 <alltraps>

80106303 <vector157>:
.globl vector157
vector157:
  pushl $0
80106303:	6a 00                	push   $0x0
  pushl $157
80106305:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010630a:	e9 66 f5 ff ff       	jmp    80105875 <alltraps>

8010630f <vector158>:
.globl vector158
vector158:
  pushl $0
8010630f:	6a 00                	push   $0x0
  pushl $158
80106311:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106316:	e9 5a f5 ff ff       	jmp    80105875 <alltraps>

8010631b <vector159>:
.globl vector159
vector159:
  pushl $0
8010631b:	6a 00                	push   $0x0
  pushl $159
8010631d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106322:	e9 4e f5 ff ff       	jmp    80105875 <alltraps>

80106327 <vector160>:
.globl vector160
vector160:
  pushl $0
80106327:	6a 00                	push   $0x0
  pushl $160
80106329:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010632e:	e9 42 f5 ff ff       	jmp    80105875 <alltraps>

80106333 <vector161>:
.globl vector161
vector161:
  pushl $0
80106333:	6a 00                	push   $0x0
  pushl $161
80106335:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010633a:	e9 36 f5 ff ff       	jmp    80105875 <alltraps>

8010633f <vector162>:
.globl vector162
vector162:
  pushl $0
8010633f:	6a 00                	push   $0x0
  pushl $162
80106341:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106346:	e9 2a f5 ff ff       	jmp    80105875 <alltraps>

8010634b <vector163>:
.globl vector163
vector163:
  pushl $0
8010634b:	6a 00                	push   $0x0
  pushl $163
8010634d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106352:	e9 1e f5 ff ff       	jmp    80105875 <alltraps>

80106357 <vector164>:
.globl vector164
vector164:
  pushl $0
80106357:	6a 00                	push   $0x0
  pushl $164
80106359:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010635e:	e9 12 f5 ff ff       	jmp    80105875 <alltraps>

80106363 <vector165>:
.globl vector165
vector165:
  pushl $0
80106363:	6a 00                	push   $0x0
  pushl $165
80106365:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010636a:	e9 06 f5 ff ff       	jmp    80105875 <alltraps>

8010636f <vector166>:
.globl vector166
vector166:
  pushl $0
8010636f:	6a 00                	push   $0x0
  pushl $166
80106371:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106376:	e9 fa f4 ff ff       	jmp    80105875 <alltraps>

8010637b <vector167>:
.globl vector167
vector167:
  pushl $0
8010637b:	6a 00                	push   $0x0
  pushl $167
8010637d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106382:	e9 ee f4 ff ff       	jmp    80105875 <alltraps>

80106387 <vector168>:
.globl vector168
vector168:
  pushl $0
80106387:	6a 00                	push   $0x0
  pushl $168
80106389:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010638e:	e9 e2 f4 ff ff       	jmp    80105875 <alltraps>

80106393 <vector169>:
.globl vector169
vector169:
  pushl $0
80106393:	6a 00                	push   $0x0
  pushl $169
80106395:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010639a:	e9 d6 f4 ff ff       	jmp    80105875 <alltraps>

8010639f <vector170>:
.globl vector170
vector170:
  pushl $0
8010639f:	6a 00                	push   $0x0
  pushl $170
801063a1:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801063a6:	e9 ca f4 ff ff       	jmp    80105875 <alltraps>

801063ab <vector171>:
.globl vector171
vector171:
  pushl $0
801063ab:	6a 00                	push   $0x0
  pushl $171
801063ad:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801063b2:	e9 be f4 ff ff       	jmp    80105875 <alltraps>

801063b7 <vector172>:
.globl vector172
vector172:
  pushl $0
801063b7:	6a 00                	push   $0x0
  pushl $172
801063b9:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801063be:	e9 b2 f4 ff ff       	jmp    80105875 <alltraps>

801063c3 <vector173>:
.globl vector173
vector173:
  pushl $0
801063c3:	6a 00                	push   $0x0
  pushl $173
801063c5:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801063ca:	e9 a6 f4 ff ff       	jmp    80105875 <alltraps>

801063cf <vector174>:
.globl vector174
vector174:
  pushl $0
801063cf:	6a 00                	push   $0x0
  pushl $174
801063d1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801063d6:	e9 9a f4 ff ff       	jmp    80105875 <alltraps>

801063db <vector175>:
.globl vector175
vector175:
  pushl $0
801063db:	6a 00                	push   $0x0
  pushl $175
801063dd:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801063e2:	e9 8e f4 ff ff       	jmp    80105875 <alltraps>

801063e7 <vector176>:
.globl vector176
vector176:
  pushl $0
801063e7:	6a 00                	push   $0x0
  pushl $176
801063e9:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801063ee:	e9 82 f4 ff ff       	jmp    80105875 <alltraps>

801063f3 <vector177>:
.globl vector177
vector177:
  pushl $0
801063f3:	6a 00                	push   $0x0
  pushl $177
801063f5:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
801063fa:	e9 76 f4 ff ff       	jmp    80105875 <alltraps>

801063ff <vector178>:
.globl vector178
vector178:
  pushl $0
801063ff:	6a 00                	push   $0x0
  pushl $178
80106401:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106406:	e9 6a f4 ff ff       	jmp    80105875 <alltraps>

8010640b <vector179>:
.globl vector179
vector179:
  pushl $0
8010640b:	6a 00                	push   $0x0
  pushl $179
8010640d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106412:	e9 5e f4 ff ff       	jmp    80105875 <alltraps>

80106417 <vector180>:
.globl vector180
vector180:
  pushl $0
80106417:	6a 00                	push   $0x0
  pushl $180
80106419:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010641e:	e9 52 f4 ff ff       	jmp    80105875 <alltraps>

80106423 <vector181>:
.globl vector181
vector181:
  pushl $0
80106423:	6a 00                	push   $0x0
  pushl $181
80106425:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010642a:	e9 46 f4 ff ff       	jmp    80105875 <alltraps>

8010642f <vector182>:
.globl vector182
vector182:
  pushl $0
8010642f:	6a 00                	push   $0x0
  pushl $182
80106431:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106436:	e9 3a f4 ff ff       	jmp    80105875 <alltraps>

8010643b <vector183>:
.globl vector183
vector183:
  pushl $0
8010643b:	6a 00                	push   $0x0
  pushl $183
8010643d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106442:	e9 2e f4 ff ff       	jmp    80105875 <alltraps>

80106447 <vector184>:
.globl vector184
vector184:
  pushl $0
80106447:	6a 00                	push   $0x0
  pushl $184
80106449:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010644e:	e9 22 f4 ff ff       	jmp    80105875 <alltraps>

80106453 <vector185>:
.globl vector185
vector185:
  pushl $0
80106453:	6a 00                	push   $0x0
  pushl $185
80106455:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010645a:	e9 16 f4 ff ff       	jmp    80105875 <alltraps>

8010645f <vector186>:
.globl vector186
vector186:
  pushl $0
8010645f:	6a 00                	push   $0x0
  pushl $186
80106461:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106466:	e9 0a f4 ff ff       	jmp    80105875 <alltraps>

8010646b <vector187>:
.globl vector187
vector187:
  pushl $0
8010646b:	6a 00                	push   $0x0
  pushl $187
8010646d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106472:	e9 fe f3 ff ff       	jmp    80105875 <alltraps>

80106477 <vector188>:
.globl vector188
vector188:
  pushl $0
80106477:	6a 00                	push   $0x0
  pushl $188
80106479:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010647e:	e9 f2 f3 ff ff       	jmp    80105875 <alltraps>

80106483 <vector189>:
.globl vector189
vector189:
  pushl $0
80106483:	6a 00                	push   $0x0
  pushl $189
80106485:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010648a:	e9 e6 f3 ff ff       	jmp    80105875 <alltraps>

8010648f <vector190>:
.globl vector190
vector190:
  pushl $0
8010648f:	6a 00                	push   $0x0
  pushl $190
80106491:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106496:	e9 da f3 ff ff       	jmp    80105875 <alltraps>

8010649b <vector191>:
.globl vector191
vector191:
  pushl $0
8010649b:	6a 00                	push   $0x0
  pushl $191
8010649d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801064a2:	e9 ce f3 ff ff       	jmp    80105875 <alltraps>

801064a7 <vector192>:
.globl vector192
vector192:
  pushl $0
801064a7:	6a 00                	push   $0x0
  pushl $192
801064a9:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801064ae:	e9 c2 f3 ff ff       	jmp    80105875 <alltraps>

801064b3 <vector193>:
.globl vector193
vector193:
  pushl $0
801064b3:	6a 00                	push   $0x0
  pushl $193
801064b5:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801064ba:	e9 b6 f3 ff ff       	jmp    80105875 <alltraps>

801064bf <vector194>:
.globl vector194
vector194:
  pushl $0
801064bf:	6a 00                	push   $0x0
  pushl $194
801064c1:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801064c6:	e9 aa f3 ff ff       	jmp    80105875 <alltraps>

801064cb <vector195>:
.globl vector195
vector195:
  pushl $0
801064cb:	6a 00                	push   $0x0
  pushl $195
801064cd:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801064d2:	e9 9e f3 ff ff       	jmp    80105875 <alltraps>

801064d7 <vector196>:
.globl vector196
vector196:
  pushl $0
801064d7:	6a 00                	push   $0x0
  pushl $196
801064d9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801064de:	e9 92 f3 ff ff       	jmp    80105875 <alltraps>

801064e3 <vector197>:
.globl vector197
vector197:
  pushl $0
801064e3:	6a 00                	push   $0x0
  pushl $197
801064e5:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801064ea:	e9 86 f3 ff ff       	jmp    80105875 <alltraps>

801064ef <vector198>:
.globl vector198
vector198:
  pushl $0
801064ef:	6a 00                	push   $0x0
  pushl $198
801064f1:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
801064f6:	e9 7a f3 ff ff       	jmp    80105875 <alltraps>

801064fb <vector199>:
.globl vector199
vector199:
  pushl $0
801064fb:	6a 00                	push   $0x0
  pushl $199
801064fd:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106502:	e9 6e f3 ff ff       	jmp    80105875 <alltraps>

80106507 <vector200>:
.globl vector200
vector200:
  pushl $0
80106507:	6a 00                	push   $0x0
  pushl $200
80106509:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010650e:	e9 62 f3 ff ff       	jmp    80105875 <alltraps>

80106513 <vector201>:
.globl vector201
vector201:
  pushl $0
80106513:	6a 00                	push   $0x0
  pushl $201
80106515:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010651a:	e9 56 f3 ff ff       	jmp    80105875 <alltraps>

8010651f <vector202>:
.globl vector202
vector202:
  pushl $0
8010651f:	6a 00                	push   $0x0
  pushl $202
80106521:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106526:	e9 4a f3 ff ff       	jmp    80105875 <alltraps>

8010652b <vector203>:
.globl vector203
vector203:
  pushl $0
8010652b:	6a 00                	push   $0x0
  pushl $203
8010652d:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106532:	e9 3e f3 ff ff       	jmp    80105875 <alltraps>

80106537 <vector204>:
.globl vector204
vector204:
  pushl $0
80106537:	6a 00                	push   $0x0
  pushl $204
80106539:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010653e:	e9 32 f3 ff ff       	jmp    80105875 <alltraps>

80106543 <vector205>:
.globl vector205
vector205:
  pushl $0
80106543:	6a 00                	push   $0x0
  pushl $205
80106545:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010654a:	e9 26 f3 ff ff       	jmp    80105875 <alltraps>

8010654f <vector206>:
.globl vector206
vector206:
  pushl $0
8010654f:	6a 00                	push   $0x0
  pushl $206
80106551:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106556:	e9 1a f3 ff ff       	jmp    80105875 <alltraps>

8010655b <vector207>:
.globl vector207
vector207:
  pushl $0
8010655b:	6a 00                	push   $0x0
  pushl $207
8010655d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106562:	e9 0e f3 ff ff       	jmp    80105875 <alltraps>

80106567 <vector208>:
.globl vector208
vector208:
  pushl $0
80106567:	6a 00                	push   $0x0
  pushl $208
80106569:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010656e:	e9 02 f3 ff ff       	jmp    80105875 <alltraps>

80106573 <vector209>:
.globl vector209
vector209:
  pushl $0
80106573:	6a 00                	push   $0x0
  pushl $209
80106575:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010657a:	e9 f6 f2 ff ff       	jmp    80105875 <alltraps>

8010657f <vector210>:
.globl vector210
vector210:
  pushl $0
8010657f:	6a 00                	push   $0x0
  pushl $210
80106581:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106586:	e9 ea f2 ff ff       	jmp    80105875 <alltraps>

8010658b <vector211>:
.globl vector211
vector211:
  pushl $0
8010658b:	6a 00                	push   $0x0
  pushl $211
8010658d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106592:	e9 de f2 ff ff       	jmp    80105875 <alltraps>

80106597 <vector212>:
.globl vector212
vector212:
  pushl $0
80106597:	6a 00                	push   $0x0
  pushl $212
80106599:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
8010659e:	e9 d2 f2 ff ff       	jmp    80105875 <alltraps>

801065a3 <vector213>:
.globl vector213
vector213:
  pushl $0
801065a3:	6a 00                	push   $0x0
  pushl $213
801065a5:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801065aa:	e9 c6 f2 ff ff       	jmp    80105875 <alltraps>

801065af <vector214>:
.globl vector214
vector214:
  pushl $0
801065af:	6a 00                	push   $0x0
  pushl $214
801065b1:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801065b6:	e9 ba f2 ff ff       	jmp    80105875 <alltraps>

801065bb <vector215>:
.globl vector215
vector215:
  pushl $0
801065bb:	6a 00                	push   $0x0
  pushl $215
801065bd:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801065c2:	e9 ae f2 ff ff       	jmp    80105875 <alltraps>

801065c7 <vector216>:
.globl vector216
vector216:
  pushl $0
801065c7:	6a 00                	push   $0x0
  pushl $216
801065c9:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801065ce:	e9 a2 f2 ff ff       	jmp    80105875 <alltraps>

801065d3 <vector217>:
.globl vector217
vector217:
  pushl $0
801065d3:	6a 00                	push   $0x0
  pushl $217
801065d5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801065da:	e9 96 f2 ff ff       	jmp    80105875 <alltraps>

801065df <vector218>:
.globl vector218
vector218:
  pushl $0
801065df:	6a 00                	push   $0x0
  pushl $218
801065e1:	68 da 00 00 00       	push   $0xda
  jmp alltraps
801065e6:	e9 8a f2 ff ff       	jmp    80105875 <alltraps>

801065eb <vector219>:
.globl vector219
vector219:
  pushl $0
801065eb:	6a 00                	push   $0x0
  pushl $219
801065ed:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
801065f2:	e9 7e f2 ff ff       	jmp    80105875 <alltraps>

801065f7 <vector220>:
.globl vector220
vector220:
  pushl $0
801065f7:	6a 00                	push   $0x0
  pushl $220
801065f9:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
801065fe:	e9 72 f2 ff ff       	jmp    80105875 <alltraps>

80106603 <vector221>:
.globl vector221
vector221:
  pushl $0
80106603:	6a 00                	push   $0x0
  pushl $221
80106605:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
8010660a:	e9 66 f2 ff ff       	jmp    80105875 <alltraps>

8010660f <vector222>:
.globl vector222
vector222:
  pushl $0
8010660f:	6a 00                	push   $0x0
  pushl $222
80106611:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106616:	e9 5a f2 ff ff       	jmp    80105875 <alltraps>

8010661b <vector223>:
.globl vector223
vector223:
  pushl $0
8010661b:	6a 00                	push   $0x0
  pushl $223
8010661d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106622:	e9 4e f2 ff ff       	jmp    80105875 <alltraps>

80106627 <vector224>:
.globl vector224
vector224:
  pushl $0
80106627:	6a 00                	push   $0x0
  pushl $224
80106629:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010662e:	e9 42 f2 ff ff       	jmp    80105875 <alltraps>

80106633 <vector225>:
.globl vector225
vector225:
  pushl $0
80106633:	6a 00                	push   $0x0
  pushl $225
80106635:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010663a:	e9 36 f2 ff ff       	jmp    80105875 <alltraps>

8010663f <vector226>:
.globl vector226
vector226:
  pushl $0
8010663f:	6a 00                	push   $0x0
  pushl $226
80106641:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106646:	e9 2a f2 ff ff       	jmp    80105875 <alltraps>

8010664b <vector227>:
.globl vector227
vector227:
  pushl $0
8010664b:	6a 00                	push   $0x0
  pushl $227
8010664d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106652:	e9 1e f2 ff ff       	jmp    80105875 <alltraps>

80106657 <vector228>:
.globl vector228
vector228:
  pushl $0
80106657:	6a 00                	push   $0x0
  pushl $228
80106659:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010665e:	e9 12 f2 ff ff       	jmp    80105875 <alltraps>

80106663 <vector229>:
.globl vector229
vector229:
  pushl $0
80106663:	6a 00                	push   $0x0
  pushl $229
80106665:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010666a:	e9 06 f2 ff ff       	jmp    80105875 <alltraps>

8010666f <vector230>:
.globl vector230
vector230:
  pushl $0
8010666f:	6a 00                	push   $0x0
  pushl $230
80106671:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106676:	e9 fa f1 ff ff       	jmp    80105875 <alltraps>

8010667b <vector231>:
.globl vector231
vector231:
  pushl $0
8010667b:	6a 00                	push   $0x0
  pushl $231
8010667d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106682:	e9 ee f1 ff ff       	jmp    80105875 <alltraps>

80106687 <vector232>:
.globl vector232
vector232:
  pushl $0
80106687:	6a 00                	push   $0x0
  pushl $232
80106689:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010668e:	e9 e2 f1 ff ff       	jmp    80105875 <alltraps>

80106693 <vector233>:
.globl vector233
vector233:
  pushl $0
80106693:	6a 00                	push   $0x0
  pushl $233
80106695:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
8010669a:	e9 d6 f1 ff ff       	jmp    80105875 <alltraps>

8010669f <vector234>:
.globl vector234
vector234:
  pushl $0
8010669f:	6a 00                	push   $0x0
  pushl $234
801066a1:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
801066a6:	e9 ca f1 ff ff       	jmp    80105875 <alltraps>

801066ab <vector235>:
.globl vector235
vector235:
  pushl $0
801066ab:	6a 00                	push   $0x0
  pushl $235
801066ad:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801066b2:	e9 be f1 ff ff       	jmp    80105875 <alltraps>

801066b7 <vector236>:
.globl vector236
vector236:
  pushl $0
801066b7:	6a 00                	push   $0x0
  pushl $236
801066b9:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801066be:	e9 b2 f1 ff ff       	jmp    80105875 <alltraps>

801066c3 <vector237>:
.globl vector237
vector237:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $237
801066c5:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801066ca:	e9 a6 f1 ff ff       	jmp    80105875 <alltraps>

801066cf <vector238>:
.globl vector238
vector238:
  pushl $0
801066cf:	6a 00                	push   $0x0
  pushl $238
801066d1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801066d6:	e9 9a f1 ff ff       	jmp    80105875 <alltraps>

801066db <vector239>:
.globl vector239
vector239:
  pushl $0
801066db:	6a 00                	push   $0x0
  pushl $239
801066dd:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
801066e2:	e9 8e f1 ff ff       	jmp    80105875 <alltraps>

801066e7 <vector240>:
.globl vector240
vector240:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $240
801066e9:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
801066ee:	e9 82 f1 ff ff       	jmp    80105875 <alltraps>

801066f3 <vector241>:
.globl vector241
vector241:
  pushl $0
801066f3:	6a 00                	push   $0x0
  pushl $241
801066f5:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
801066fa:	e9 76 f1 ff ff       	jmp    80105875 <alltraps>

801066ff <vector242>:
.globl vector242
vector242:
  pushl $0
801066ff:	6a 00                	push   $0x0
  pushl $242
80106701:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106706:	e9 6a f1 ff ff       	jmp    80105875 <alltraps>

8010670b <vector243>:
.globl vector243
vector243:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $243
8010670d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106712:	e9 5e f1 ff ff       	jmp    80105875 <alltraps>

80106717 <vector244>:
.globl vector244
vector244:
  pushl $0
80106717:	6a 00                	push   $0x0
  pushl $244
80106719:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
8010671e:	e9 52 f1 ff ff       	jmp    80105875 <alltraps>

80106723 <vector245>:
.globl vector245
vector245:
  pushl $0
80106723:	6a 00                	push   $0x0
  pushl $245
80106725:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
8010672a:	e9 46 f1 ff ff       	jmp    80105875 <alltraps>

8010672f <vector246>:
.globl vector246
vector246:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $246
80106731:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106736:	e9 3a f1 ff ff       	jmp    80105875 <alltraps>

8010673b <vector247>:
.globl vector247
vector247:
  pushl $0
8010673b:	6a 00                	push   $0x0
  pushl $247
8010673d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106742:	e9 2e f1 ff ff       	jmp    80105875 <alltraps>

80106747 <vector248>:
.globl vector248
vector248:
  pushl $0
80106747:	6a 00                	push   $0x0
  pushl $248
80106749:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
8010674e:	e9 22 f1 ff ff       	jmp    80105875 <alltraps>

80106753 <vector249>:
.globl vector249
vector249:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $249
80106755:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
8010675a:	e9 16 f1 ff ff       	jmp    80105875 <alltraps>

8010675f <vector250>:
.globl vector250
vector250:
  pushl $0
8010675f:	6a 00                	push   $0x0
  pushl $250
80106761:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106766:	e9 0a f1 ff ff       	jmp    80105875 <alltraps>

8010676b <vector251>:
.globl vector251
vector251:
  pushl $0
8010676b:	6a 00                	push   $0x0
  pushl $251
8010676d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106772:	e9 fe f0 ff ff       	jmp    80105875 <alltraps>

80106777 <vector252>:
.globl vector252
vector252:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $252
80106779:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010677e:	e9 f2 f0 ff ff       	jmp    80105875 <alltraps>

80106783 <vector253>:
.globl vector253
vector253:
  pushl $0
80106783:	6a 00                	push   $0x0
  pushl $253
80106785:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010678a:	e9 e6 f0 ff ff       	jmp    80105875 <alltraps>

8010678f <vector254>:
.globl vector254
vector254:
  pushl $0
8010678f:	6a 00                	push   $0x0
  pushl $254
80106791:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106796:	e9 da f0 ff ff       	jmp    80105875 <alltraps>

8010679b <vector255>:
.globl vector255
vector255:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $255
8010679d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
801067a2:	e9 ce f0 ff ff       	jmp    80105875 <alltraps>
801067a7:	66 90                	xchg   %ax,%ax
801067a9:	66 90                	xchg   %ax,%ax
801067ab:	66 90                	xchg   %ax,%ax
801067ad:	66 90                	xchg   %ax,%ax
801067af:	90                   	nop

801067b0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801067b0:	55                   	push   %ebp
801067b1:	89 e5                	mov    %esp,%ebp
801067b3:	57                   	push   %edi
801067b4:	56                   	push   %esi
801067b5:	53                   	push   %ebx
801067b6:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801067b8:	c1 ea 16             	shr    $0x16,%edx
801067bb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801067be:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
801067c1:	8b 07                	mov    (%edi),%eax
801067c3:	a8 01                	test   $0x1,%al
801067c5:	74 29                	je     801067f0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801067c7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067cc:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801067d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801067d5:	c1 eb 0a             	shr    $0xa,%ebx
801067d8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
801067de:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
801067e1:	5b                   	pop    %ebx
801067e2:	5e                   	pop    %esi
801067e3:	5f                   	pop    %edi
801067e4:	5d                   	pop    %ebp
801067e5:	c3                   	ret    
801067e6:	8d 76 00             	lea    0x0(%esi),%esi
801067e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801067f0:	85 c9                	test   %ecx,%ecx
801067f2:	74 2c                	je     80106820 <walkpgdir+0x70>
801067f4:	e8 57 bd ff ff       	call   80102550 <kalloc>
801067f9:	85 c0                	test   %eax,%eax
801067fb:	89 c6                	mov    %eax,%esi
801067fd:	74 21                	je     80106820 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
801067ff:	83 ec 04             	sub    $0x4,%esp
80106802:	68 00 10 00 00       	push   $0x1000
80106807:	6a 00                	push   $0x0
80106809:	50                   	push   %eax
8010680a:	e8 11 dd ff ff       	call   80104520 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010680f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106815:	83 c4 10             	add    $0x10,%esp
80106818:	83 c8 07             	or     $0x7,%eax
8010681b:	89 07                	mov    %eax,(%edi)
8010681d:	eb b3                	jmp    801067d2 <walkpgdir+0x22>
8010681f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106820:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106823:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106825:	5b                   	pop    %ebx
80106826:	5e                   	pop    %esi
80106827:	5f                   	pop    %edi
80106828:	5d                   	pop    %ebp
80106829:	c3                   	ret    
8010682a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106830 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106830:	55                   	push   %ebp
80106831:	89 e5                	mov    %esp,%ebp
80106833:	57                   	push   %edi
80106834:	56                   	push   %esi
80106835:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106836:	89 d3                	mov    %edx,%ebx
80106838:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010683e:	83 ec 1c             	sub    $0x1c,%esp
80106841:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106844:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106848:	8b 7d 08             	mov    0x8(%ebp),%edi
8010684b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106850:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106853:	8b 45 0c             	mov    0xc(%ebp),%eax
80106856:	29 df                	sub    %ebx,%edi
80106858:	83 c8 01             	or     $0x1,%eax
8010685b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010685e:	eb 15                	jmp    80106875 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106860:	f6 00 01             	testb  $0x1,(%eax)
80106863:	75 45                	jne    801068aa <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106865:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106868:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010686b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010686d:	74 31                	je     801068a0 <mappages+0x70>
      break;
    a += PGSIZE;
8010686f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106875:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106878:	b9 01 00 00 00       	mov    $0x1,%ecx
8010687d:	89 da                	mov    %ebx,%edx
8010687f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106882:	e8 29 ff ff ff       	call   801067b0 <walkpgdir>
80106887:	85 c0                	test   %eax,%eax
80106889:	75 d5                	jne    80106860 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
8010688b:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
8010688e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106893:	5b                   	pop    %ebx
80106894:	5e                   	pop    %esi
80106895:	5f                   	pop    %edi
80106896:	5d                   	pop    %ebp
80106897:	c3                   	ret    
80106898:	90                   	nop
80106899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801068a3:	31 c0                	xor    %eax,%eax
}
801068a5:	5b                   	pop    %ebx
801068a6:	5e                   	pop    %esi
801068a7:	5f                   	pop    %edi
801068a8:	5d                   	pop    %ebp
801068a9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801068aa:	83 ec 0c             	sub    $0xc,%esp
801068ad:	68 50 7a 10 80       	push   $0x80107a50
801068b2:	e8 b9 9a ff ff       	call   80100370 <panic>
801068b7:	89 f6                	mov    %esi,%esi
801068b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068c0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068c0:	55                   	push   %ebp
801068c1:	89 e5                	mov    %esp,%ebp
801068c3:	57                   	push   %edi
801068c4:	56                   	push   %esi
801068c5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801068c6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068cc:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801068ce:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068d4:	83 ec 1c             	sub    $0x1c,%esp
801068d7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801068da:	39 d3                	cmp    %edx,%ebx
801068dc:	73 66                	jae    80106944 <deallocuvm.part.0+0x84>
801068de:	89 d6                	mov    %edx,%esi
801068e0:	eb 3d                	jmp    8010691f <deallocuvm.part.0+0x5f>
801068e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801068e8:	8b 10                	mov    (%eax),%edx
801068ea:	f6 c2 01             	test   $0x1,%dl
801068ed:	74 26                	je     80106915 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801068ef:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801068f5:	74 58                	je     8010694f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
801068f7:	83 ec 0c             	sub    $0xc,%esp
801068fa:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106900:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106903:	52                   	push   %edx
80106904:	e8 97 ba ff ff       	call   801023a0 <kfree>
      *pte = 0;
80106909:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010690c:	83 c4 10             	add    $0x10,%esp
8010690f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106915:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010691b:	39 f3                	cmp    %esi,%ebx
8010691d:	73 25                	jae    80106944 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010691f:	31 c9                	xor    %ecx,%ecx
80106921:	89 da                	mov    %ebx,%edx
80106923:	89 f8                	mov    %edi,%eax
80106925:	e8 86 fe ff ff       	call   801067b0 <walkpgdir>
    if(!pte)
8010692a:	85 c0                	test   %eax,%eax
8010692c:	75 ba                	jne    801068e8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010692e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106934:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010693a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106940:	39 f3                	cmp    %esi,%ebx
80106942:	72 db                	jb     8010691f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106944:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106947:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010694a:	5b                   	pop    %ebx
8010694b:	5e                   	pop    %esi
8010694c:	5f                   	pop    %edi
8010694d:	5d                   	pop    %ebp
8010694e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010694f:	83 ec 0c             	sub    $0xc,%esp
80106952:	68 a6 73 10 80       	push   $0x801073a6
80106957:	e8 14 9a ff ff       	call   80100370 <panic>
8010695c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106960 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106960:	55                   	push   %ebp
80106961:	89 e5                	mov    %esp,%ebp
80106963:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106966:	e8 e5 ce ff ff       	call   80103850 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010696b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106971:	31 c9                	xor    %ecx,%ecx
80106973:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106978:	66 89 90 38 28 11 80 	mov    %dx,-0x7feed7c8(%eax)
8010697f:	66 89 88 3a 28 11 80 	mov    %cx,-0x7feed7c6(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106986:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010698b:	31 c9                	xor    %ecx,%ecx
8010698d:	66 89 90 40 28 11 80 	mov    %dx,-0x7feed7c0(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106994:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106999:	66 89 88 42 28 11 80 	mov    %cx,-0x7feed7be(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801069a0:	31 c9                	xor    %ecx,%ecx
801069a2:	66 89 90 48 28 11 80 	mov    %dx,-0x7feed7b8(%eax)
801069a9:	66 89 88 4a 28 11 80 	mov    %cx,-0x7feed7b6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801069b0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801069b5:	31 c9                	xor    %ecx,%ecx
801069b7:	66 89 90 50 28 11 80 	mov    %dx,-0x7feed7b0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801069be:	c6 80 3c 28 11 80 00 	movb   $0x0,-0x7feed7c4(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801069c5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801069ca:	c6 80 3d 28 11 80 9a 	movb   $0x9a,-0x7feed7c3(%eax)
801069d1:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)
801069d8:	c6 80 3f 28 11 80 00 	movb   $0x0,-0x7feed7c1(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801069df:	c6 80 44 28 11 80 00 	movb   $0x0,-0x7feed7bc(%eax)
801069e6:	c6 80 45 28 11 80 92 	movb   $0x92,-0x7feed7bb(%eax)
801069ed:	c6 80 46 28 11 80 cf 	movb   $0xcf,-0x7feed7ba(%eax)
801069f4:	c6 80 47 28 11 80 00 	movb   $0x0,-0x7feed7b9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801069fb:	c6 80 4c 28 11 80 00 	movb   $0x0,-0x7feed7b4(%eax)
80106a02:	c6 80 4d 28 11 80 fa 	movb   $0xfa,-0x7feed7b3(%eax)
80106a09:	c6 80 4e 28 11 80 cf 	movb   $0xcf,-0x7feed7b2(%eax)
80106a10:	c6 80 4f 28 11 80 00 	movb   $0x0,-0x7feed7b1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106a17:	66 89 88 52 28 11 80 	mov    %cx,-0x7feed7ae(%eax)
80106a1e:	c6 80 54 28 11 80 00 	movb   $0x0,-0x7feed7ac(%eax)
80106a25:	c6 80 55 28 11 80 f2 	movb   $0xf2,-0x7feed7ab(%eax)
80106a2c:	c6 80 56 28 11 80 cf 	movb   $0xcf,-0x7feed7aa(%eax)
80106a33:	c6 80 57 28 11 80 00 	movb   $0x0,-0x7feed7a9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
80106a3a:	05 30 28 11 80       	add    $0x80112830,%eax
80106a3f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106a43:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106a47:	c1 e8 10             	shr    $0x10,%eax
80106a4a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106a4e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106a51:	0f 01 10             	lgdtl  (%eax)
}
80106a54:	c9                   	leave  
80106a55:	c3                   	ret    
80106a56:	8d 76 00             	lea    0x0(%esi),%esi
80106a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a60 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106a60:	a1 e4 56 11 80       	mov    0x801156e4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106a65:	55                   	push   %ebp
80106a66:	89 e5                	mov    %esp,%ebp
80106a68:	05 00 00 00 80       	add    $0x80000000,%eax
80106a6d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106a70:	5d                   	pop    %ebp
80106a71:	c3                   	ret    
80106a72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a80 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106a80:	55                   	push   %ebp
80106a81:	89 e5                	mov    %esp,%ebp
80106a83:	57                   	push   %edi
80106a84:	56                   	push   %esi
80106a85:	53                   	push   %ebx
80106a86:	83 ec 1c             	sub    $0x1c,%esp
80106a89:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80106a8c:	85 f6                	test   %esi,%esi
80106a8e:	0f 84 cd 00 00 00    	je     80106b61 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106a94:	8b 46 08             	mov    0x8(%esi),%eax
80106a97:	85 c0                	test   %eax,%eax
80106a99:	0f 84 dc 00 00 00    	je     80106b7b <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80106a9f:	8b 7e 04             	mov    0x4(%esi),%edi
80106aa2:	85 ff                	test   %edi,%edi
80106aa4:	0f 84 c4 00 00 00    	je     80106b6e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
80106aaa:	e8 91 d8 ff ff       	call   80104340 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106aaf:	e8 1c cd ff ff       	call   801037d0 <mycpu>
80106ab4:	89 c3                	mov    %eax,%ebx
80106ab6:	e8 15 cd ff ff       	call   801037d0 <mycpu>
80106abb:	89 c7                	mov    %eax,%edi
80106abd:	e8 0e cd ff ff       	call   801037d0 <mycpu>
80106ac2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ac5:	83 c7 08             	add    $0x8,%edi
80106ac8:	e8 03 cd ff ff       	call   801037d0 <mycpu>
80106acd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106ad0:	83 c0 08             	add    $0x8,%eax
80106ad3:	ba 67 00 00 00       	mov    $0x67,%edx
80106ad8:	c1 e8 18             	shr    $0x18,%eax
80106adb:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106ae2:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106ae9:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106af0:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106af7:	83 c1 08             	add    $0x8,%ecx
80106afa:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106b00:	c1 e9 10             	shr    $0x10,%ecx
80106b03:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106b09:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
80106b0e:	e8 bd cc ff ff       	call   801037d0 <mycpu>
80106b13:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106b1a:	e8 b1 cc ff ff       	call   801037d0 <mycpu>
80106b1f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106b24:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106b28:	e8 a3 cc ff ff       	call   801037d0 <mycpu>
80106b2d:	8b 56 08             	mov    0x8(%esi),%edx
80106b30:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106b36:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106b39:	e8 92 cc ff ff       	call   801037d0 <mycpu>
80106b3e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106b42:	b8 28 00 00 00       	mov    $0x28,%eax
80106b47:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106b4a:	8b 46 04             	mov    0x4(%esi),%eax
80106b4d:	05 00 00 00 80       	add    $0x80000000,%eax
80106b52:	0f 22 d8             	mov    %eax,%cr3
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106b55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b58:	5b                   	pop    %ebx
80106b59:	5e                   	pop    %esi
80106b5a:	5f                   	pop    %edi
80106b5b:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106b5c:	e9 1f d8 ff ff       	jmp    80104380 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106b61:	83 ec 0c             	sub    $0xc,%esp
80106b64:	68 56 7a 10 80       	push   $0x80107a56
80106b69:	e8 02 98 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106b6e:	83 ec 0c             	sub    $0xc,%esp
80106b71:	68 81 7a 10 80       	push   $0x80107a81
80106b76:	e8 f5 97 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106b7b:	83 ec 0c             	sub    $0xc,%esp
80106b7e:	68 6c 7a 10 80       	push   $0x80107a6c
80106b83:	e8 e8 97 ff ff       	call   80100370 <panic>
80106b88:	90                   	nop
80106b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106b90 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106b90:	55                   	push   %ebp
80106b91:	89 e5                	mov    %esp,%ebp
80106b93:	57                   	push   %edi
80106b94:	56                   	push   %esi
80106b95:	53                   	push   %ebx
80106b96:	83 ec 1c             	sub    $0x1c,%esp
80106b99:	8b 75 10             	mov    0x10(%ebp),%esi
80106b9c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b9f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106ba2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106ba8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106bab:	77 49                	ja     80106bf6 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106bad:	e8 9e b9 ff ff       	call   80102550 <kalloc>
  memset(mem, 0, PGSIZE);
80106bb2:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106bb5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106bb7:	68 00 10 00 00       	push   $0x1000
80106bbc:	6a 00                	push   $0x0
80106bbe:	50                   	push   %eax
80106bbf:	e8 5c d9 ff ff       	call   80104520 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106bc4:	58                   	pop    %eax
80106bc5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106bcb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106bd0:	5a                   	pop    %edx
80106bd1:	6a 06                	push   $0x6
80106bd3:	50                   	push   %eax
80106bd4:	31 d2                	xor    %edx,%edx
80106bd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106bd9:	e8 52 fc ff ff       	call   80106830 <mappages>
  memmove(mem, init, sz);
80106bde:	89 75 10             	mov    %esi,0x10(%ebp)
80106be1:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106be4:	83 c4 10             	add    $0x10,%esp
80106be7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106bea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bed:	5b                   	pop    %ebx
80106bee:	5e                   	pop    %esi
80106bef:	5f                   	pop    %edi
80106bf0:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106bf1:	e9 da d9 ff ff       	jmp    801045d0 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106bf6:	83 ec 0c             	sub    $0xc,%esp
80106bf9:	68 95 7a 10 80       	push   $0x80107a95
80106bfe:	e8 6d 97 ff ff       	call   80100370 <panic>
80106c03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c10 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106c10:	55                   	push   %ebp
80106c11:	89 e5                	mov    %esp,%ebp
80106c13:	57                   	push   %edi
80106c14:	56                   	push   %esi
80106c15:	53                   	push   %ebx
80106c16:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106c19:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106c20:	0f 85 91 00 00 00    	jne    80106cb7 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106c26:	8b 75 18             	mov    0x18(%ebp),%esi
80106c29:	31 db                	xor    %ebx,%ebx
80106c2b:	85 f6                	test   %esi,%esi
80106c2d:	75 1a                	jne    80106c49 <loaduvm+0x39>
80106c2f:	eb 6f                	jmp    80106ca0 <loaduvm+0x90>
80106c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c38:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c3e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106c44:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106c47:	76 57                	jbe    80106ca0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106c49:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c4c:	8b 45 08             	mov    0x8(%ebp),%eax
80106c4f:	31 c9                	xor    %ecx,%ecx
80106c51:	01 da                	add    %ebx,%edx
80106c53:	e8 58 fb ff ff       	call   801067b0 <walkpgdir>
80106c58:	85 c0                	test   %eax,%eax
80106c5a:	74 4e                	je     80106caa <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106c5c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106c5e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106c61:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106c66:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106c6b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106c71:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106c74:	01 d9                	add    %ebx,%ecx
80106c76:	05 00 00 00 80       	add    $0x80000000,%eax
80106c7b:	57                   	push   %edi
80106c7c:	51                   	push   %ecx
80106c7d:	50                   	push   %eax
80106c7e:	ff 75 10             	pushl  0x10(%ebp)
80106c81:	e8 8a ad ff ff       	call   80101a10 <readi>
80106c86:	83 c4 10             	add    $0x10,%esp
80106c89:	39 c7                	cmp    %eax,%edi
80106c8b:	74 ab                	je     80106c38 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106c8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106c95:	5b                   	pop    %ebx
80106c96:	5e                   	pop    %esi
80106c97:	5f                   	pop    %edi
80106c98:	5d                   	pop    %ebp
80106c99:	c3                   	ret    
80106c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ca0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106ca3:	31 c0                	xor    %eax,%eax
}
80106ca5:	5b                   	pop    %ebx
80106ca6:	5e                   	pop    %esi
80106ca7:	5f                   	pop    %edi
80106ca8:	5d                   	pop    %ebp
80106ca9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106caa:	83 ec 0c             	sub    $0xc,%esp
80106cad:	68 af 7a 10 80       	push   $0x80107aaf
80106cb2:	e8 b9 96 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106cb7:	83 ec 0c             	sub    $0xc,%esp
80106cba:	68 50 7b 10 80       	push   $0x80107b50
80106cbf:	e8 ac 96 ff ff       	call   80100370 <panic>
80106cc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106cd0 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106cd0:	55                   	push   %ebp
80106cd1:	89 e5                	mov    %esp,%ebp
80106cd3:	57                   	push   %edi
80106cd4:	56                   	push   %esi
80106cd5:	53                   	push   %ebx
80106cd6:	83 ec 0c             	sub    $0xc,%esp
80106cd9:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106cdc:	85 ff                	test   %edi,%edi
80106cde:	0f 88 ca 00 00 00    	js     80106dae <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106ce4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106ce7:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106cea:	0f 82 82 00 00 00    	jb     80106d72 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106cf0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106cf6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106cfc:	39 df                	cmp    %ebx,%edi
80106cfe:	77 43                	ja     80106d43 <allocuvm+0x73>
80106d00:	e9 bb 00 00 00       	jmp    80106dc0 <allocuvm+0xf0>
80106d05:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106d08:	83 ec 04             	sub    $0x4,%esp
80106d0b:	68 00 10 00 00       	push   $0x1000
80106d10:	6a 00                	push   $0x0
80106d12:	50                   	push   %eax
80106d13:	e8 08 d8 ff ff       	call   80104520 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106d18:	58                   	pop    %eax
80106d19:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106d1f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d24:	5a                   	pop    %edx
80106d25:	6a 06                	push   $0x6
80106d27:	50                   	push   %eax
80106d28:	89 da                	mov    %ebx,%edx
80106d2a:	8b 45 08             	mov    0x8(%ebp),%eax
80106d2d:	e8 fe fa ff ff       	call   80106830 <mappages>
80106d32:	83 c4 10             	add    $0x10,%esp
80106d35:	85 c0                	test   %eax,%eax
80106d37:	78 47                	js     80106d80 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106d39:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d3f:	39 df                	cmp    %ebx,%edi
80106d41:	76 7d                	jbe    80106dc0 <allocuvm+0xf0>
    mem = kalloc();
80106d43:	e8 08 b8 ff ff       	call   80102550 <kalloc>
    if(mem == 0){
80106d48:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106d4a:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106d4c:	75 ba                	jne    80106d08 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106d4e:	83 ec 0c             	sub    $0xc,%esp
80106d51:	68 cd 7a 10 80       	push   $0x80107acd
80106d56:	e8 05 99 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106d5b:	83 c4 10             	add    $0x10,%esp
80106d5e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106d61:	76 4b                	jbe    80106dae <allocuvm+0xde>
80106d63:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d66:	8b 45 08             	mov    0x8(%ebp),%eax
80106d69:	89 fa                	mov    %edi,%edx
80106d6b:	e8 50 fb ff ff       	call   801068c0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106d70:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106d72:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d75:	5b                   	pop    %ebx
80106d76:	5e                   	pop    %esi
80106d77:	5f                   	pop    %edi
80106d78:	5d                   	pop    %ebp
80106d79:	c3                   	ret    
80106d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106d80:	83 ec 0c             	sub    $0xc,%esp
80106d83:	68 e5 7a 10 80       	push   $0x80107ae5
80106d88:	e8 d3 98 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106d8d:	83 c4 10             	add    $0x10,%esp
80106d90:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106d93:	76 0d                	jbe    80106da2 <allocuvm+0xd2>
80106d95:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d98:	8b 45 08             	mov    0x8(%ebp),%eax
80106d9b:	89 fa                	mov    %edi,%edx
80106d9d:	e8 1e fb ff ff       	call   801068c0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106da2:	83 ec 0c             	sub    $0xc,%esp
80106da5:	56                   	push   %esi
80106da6:	e8 f5 b5 ff ff       	call   801023a0 <kfree>
      return 0;
80106dab:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106dae:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106db1:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106db3:	5b                   	pop    %ebx
80106db4:	5e                   	pop    %esi
80106db5:	5f                   	pop    %edi
80106db6:	5d                   	pop    %ebp
80106db7:	c3                   	ret    
80106db8:	90                   	nop
80106db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106dc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106dc3:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106dc5:	5b                   	pop    %ebx
80106dc6:	5e                   	pop    %esi
80106dc7:	5f                   	pop    %edi
80106dc8:	5d                   	pop    %ebp
80106dc9:	c3                   	ret    
80106dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106dd0 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106dd0:	55                   	push   %ebp
80106dd1:	89 e5                	mov    %esp,%ebp
80106dd3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dd6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106dd9:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106ddc:	39 d1                	cmp    %edx,%ecx
80106dde:	73 10                	jae    80106df0 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106de0:	5d                   	pop    %ebp
80106de1:	e9 da fa ff ff       	jmp    801068c0 <deallocuvm.part.0>
80106de6:	8d 76 00             	lea    0x0(%esi),%esi
80106de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106df0:	89 d0                	mov    %edx,%eax
80106df2:	5d                   	pop    %ebp
80106df3:	c3                   	ret    
80106df4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106dfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e00 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106e00:	55                   	push   %ebp
80106e01:	89 e5                	mov    %esp,%ebp
80106e03:	57                   	push   %edi
80106e04:	56                   	push   %esi
80106e05:	53                   	push   %ebx
80106e06:	83 ec 0c             	sub    $0xc,%esp
80106e09:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106e0c:	85 f6                	test   %esi,%esi
80106e0e:	74 59                	je     80106e69 <freevm+0x69>
80106e10:	31 c9                	xor    %ecx,%ecx
80106e12:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106e17:	89 f0                	mov    %esi,%eax
80106e19:	e8 a2 fa ff ff       	call   801068c0 <deallocuvm.part.0>
80106e1e:	89 f3                	mov    %esi,%ebx
80106e20:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106e26:	eb 0f                	jmp    80106e37 <freevm+0x37>
80106e28:	90                   	nop
80106e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e30:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106e33:	39 fb                	cmp    %edi,%ebx
80106e35:	74 23                	je     80106e5a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106e37:	8b 03                	mov    (%ebx),%eax
80106e39:	a8 01                	test   $0x1,%al
80106e3b:	74 f3                	je     80106e30 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106e3d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e42:	83 ec 0c             	sub    $0xc,%esp
80106e45:	83 c3 04             	add    $0x4,%ebx
80106e48:	05 00 00 00 80       	add    $0x80000000,%eax
80106e4d:	50                   	push   %eax
80106e4e:	e8 4d b5 ff ff       	call   801023a0 <kfree>
80106e53:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106e56:	39 fb                	cmp    %edi,%ebx
80106e58:	75 dd                	jne    80106e37 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106e5a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106e5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e60:	5b                   	pop    %ebx
80106e61:	5e                   	pop    %esi
80106e62:	5f                   	pop    %edi
80106e63:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106e64:	e9 37 b5 ff ff       	jmp    801023a0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106e69:	83 ec 0c             	sub    $0xc,%esp
80106e6c:	68 01 7b 10 80       	push   $0x80107b01
80106e71:	e8 fa 94 ff ff       	call   80100370 <panic>
80106e76:	8d 76 00             	lea    0x0(%esi),%esi
80106e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e80 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106e80:	55                   	push   %ebp
80106e81:	89 e5                	mov    %esp,%ebp
80106e83:	56                   	push   %esi
80106e84:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106e85:	e8 c6 b6 ff ff       	call   80102550 <kalloc>
80106e8a:	85 c0                	test   %eax,%eax
80106e8c:	74 6a                	je     80106ef8 <setupkvm+0x78>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106e8e:	83 ec 04             	sub    $0x4,%esp
80106e91:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106e93:	bb 20 a5 10 80       	mov    $0x8010a520,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106e98:	68 00 10 00 00       	push   $0x1000
80106e9d:	6a 00                	push   $0x0
80106e9f:	50                   	push   %eax
80106ea0:	e8 7b d6 ff ff       	call   80104520 <memset>
80106ea5:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106ea8:	8b 43 04             	mov    0x4(%ebx),%eax
80106eab:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106eae:	83 ec 08             	sub    $0x8,%esp
80106eb1:	8b 13                	mov    (%ebx),%edx
80106eb3:	ff 73 0c             	pushl  0xc(%ebx)
80106eb6:	50                   	push   %eax
80106eb7:	29 c1                	sub    %eax,%ecx
80106eb9:	89 f0                	mov    %esi,%eax
80106ebb:	e8 70 f9 ff ff       	call   80106830 <mappages>
80106ec0:	83 c4 10             	add    $0x10,%esp
80106ec3:	85 c0                	test   %eax,%eax
80106ec5:	78 19                	js     80106ee0 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106ec7:	83 c3 10             	add    $0x10,%ebx
80106eca:	81 fb 60 a5 10 80    	cmp    $0x8010a560,%ebx
80106ed0:	75 d6                	jne    80106ea8 <setupkvm+0x28>
80106ed2:	89 f0                	mov    %esi,%eax
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106ed4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ed7:	5b                   	pop    %ebx
80106ed8:	5e                   	pop    %esi
80106ed9:	5d                   	pop    %ebp
80106eda:	c3                   	ret    
80106edb:	90                   	nop
80106edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106ee0:	83 ec 0c             	sub    $0xc,%esp
80106ee3:	56                   	push   %esi
80106ee4:	e8 17 ff ff ff       	call   80106e00 <freevm>
      return 0;
80106ee9:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
80106eec:	8d 65 f8             	lea    -0x8(%ebp),%esp
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
80106eef:	31 c0                	xor    %eax,%eax
    }
  return pgdir;
}
80106ef1:	5b                   	pop    %ebx
80106ef2:	5e                   	pop    %esi
80106ef3:	5d                   	pop    %ebp
80106ef4:	c3                   	ret    
80106ef5:	8d 76 00             	lea    0x0(%esi),%esi
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106ef8:	31 c0                	xor    %eax,%eax
80106efa:	eb d8                	jmp    80106ed4 <setupkvm+0x54>
80106efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106f00 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106f00:	55                   	push   %ebp
80106f01:	89 e5                	mov    %esp,%ebp
80106f03:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106f06:	e8 75 ff ff ff       	call   80106e80 <setupkvm>
80106f0b:	a3 e4 56 11 80       	mov    %eax,0x801156e4
80106f10:	05 00 00 00 80       	add    $0x80000000,%eax
80106f15:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106f18:	c9                   	leave  
80106f19:	c3                   	ret    
80106f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f20 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106f20:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f21:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106f23:	89 e5                	mov    %esp,%ebp
80106f25:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f28:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f2b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f2e:	e8 7d f8 ff ff       	call   801067b0 <walkpgdir>
  if(pte == 0)
80106f33:	85 c0                	test   %eax,%eax
80106f35:	74 05                	je     80106f3c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106f37:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106f3a:	c9                   	leave  
80106f3b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106f3c:	83 ec 0c             	sub    $0xc,%esp
80106f3f:	68 12 7b 10 80       	push   $0x80107b12
80106f44:	e8 27 94 ff ff       	call   80100370 <panic>
80106f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106f50 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106f50:	55                   	push   %ebp
80106f51:	89 e5                	mov    %esp,%ebp
80106f53:	57                   	push   %edi
80106f54:	56                   	push   %esi
80106f55:	53                   	push   %ebx
80106f56:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106f59:	e8 22 ff ff ff       	call   80106e80 <setupkvm>
80106f5e:	85 c0                	test   %eax,%eax
80106f60:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f63:	0f 84 c5 00 00 00    	je     8010702e <copyuvm+0xde>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f69:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f6c:	85 c9                	test   %ecx,%ecx
80106f6e:	0f 84 9c 00 00 00    	je     80107010 <copyuvm+0xc0>
80106f74:	31 ff                	xor    %edi,%edi
80106f76:	eb 4a                	jmp    80106fc2 <copyuvm+0x72>
80106f78:	90                   	nop
80106f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106f80:	83 ec 04             	sub    $0x4,%esp
80106f83:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106f89:	68 00 10 00 00       	push   $0x1000
80106f8e:	53                   	push   %ebx
80106f8f:	50                   	push   %eax
80106f90:	e8 3b d6 ff ff       	call   801045d0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106f95:	58                   	pop    %eax
80106f96:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f9c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106fa1:	5a                   	pop    %edx
80106fa2:	ff 75 e4             	pushl  -0x1c(%ebp)
80106fa5:	50                   	push   %eax
80106fa6:	89 fa                	mov    %edi,%edx
80106fa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106fab:	e8 80 f8 ff ff       	call   80106830 <mappages>
80106fb0:	83 c4 10             	add    $0x10,%esp
80106fb3:	85 c0                	test   %eax,%eax
80106fb5:	78 69                	js     80107020 <copyuvm+0xd0>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106fb7:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106fbd:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106fc0:	76 4e                	jbe    80107010 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106fc2:	8b 45 08             	mov    0x8(%ebp),%eax
80106fc5:	31 c9                	xor    %ecx,%ecx
80106fc7:	89 fa                	mov    %edi,%edx
80106fc9:	e8 e2 f7 ff ff       	call   801067b0 <walkpgdir>
80106fce:	85 c0                	test   %eax,%eax
80106fd0:	74 6d                	je     8010703f <copyuvm+0xef>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106fd2:	8b 00                	mov    (%eax),%eax
80106fd4:	a8 01                	test   $0x1,%al
80106fd6:	74 5a                	je     80107032 <copyuvm+0xe2>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106fd8:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
80106fda:	25 ff 0f 00 00       	and    $0xfff,%eax
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106fdf:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80106fe5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80106fe8:	e8 63 b5 ff ff       	call   80102550 <kalloc>
80106fed:	85 c0                	test   %eax,%eax
80106fef:	89 c6                	mov    %eax,%esi
80106ff1:	75 8d                	jne    80106f80 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80106ff3:	83 ec 0c             	sub    $0xc,%esp
80106ff6:	ff 75 e0             	pushl  -0x20(%ebp)
80106ff9:	e8 02 fe ff ff       	call   80106e00 <freevm>
  return 0;
80106ffe:	83 c4 10             	add    $0x10,%esp
80107001:	31 c0                	xor    %eax,%eax
}
80107003:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107006:	5b                   	pop    %ebx
80107007:	5e                   	pop    %esi
80107008:	5f                   	pop    %edi
80107009:	5d                   	pop    %ebp
8010700a:	c3                   	ret    
8010700b:	90                   	nop
8010700c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107010:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80107013:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107016:	5b                   	pop    %ebx
80107017:	5e                   	pop    %esi
80107018:	5f                   	pop    %edi
80107019:	5d                   	pop    %ebp
8010701a:	c3                   	ret    
8010701b:	90                   	nop
8010701c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
      kfree(mem);
80107020:	83 ec 0c             	sub    $0xc,%esp
80107023:	56                   	push   %esi
80107024:	e8 77 b3 ff ff       	call   801023a0 <kfree>
      goto bad;
80107029:	83 c4 10             	add    $0x10,%esp
8010702c:	eb c5                	jmp    80106ff3 <copyuvm+0xa3>
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
8010702e:	31 c0                	xor    %eax,%eax
80107030:	eb d1                	jmp    80107003 <copyuvm+0xb3>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80107032:	83 ec 0c             	sub    $0xc,%esp
80107035:	68 36 7b 10 80       	push   $0x80107b36
8010703a:	e8 31 93 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
8010703f:	83 ec 0c             	sub    $0xc,%esp
80107042:	68 1c 7b 10 80       	push   $0x80107b1c
80107047:	e8 24 93 ff ff       	call   80100370 <panic>
8010704c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107050 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107050:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107051:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107053:	89 e5                	mov    %esp,%ebp
80107055:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107058:	8b 55 0c             	mov    0xc(%ebp),%edx
8010705b:	8b 45 08             	mov    0x8(%ebp),%eax
8010705e:	e8 4d f7 ff ff       	call   801067b0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107063:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80107065:	89 c2                	mov    %eax,%edx
80107067:	83 e2 05             	and    $0x5,%edx
8010706a:	83 fa 05             	cmp    $0x5,%edx
8010706d:	75 11                	jne    80107080 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
8010706f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80107074:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107075:	05 00 00 00 80       	add    $0x80000000,%eax
}
8010707a:	c3                   	ret    
8010707b:	90                   	nop
8010707c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107080:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107082:	c9                   	leave  
80107083:	c3                   	ret    
80107084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010708a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107090 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107090:	55                   	push   %ebp
80107091:	89 e5                	mov    %esp,%ebp
80107093:	57                   	push   %edi
80107094:	56                   	push   %esi
80107095:	53                   	push   %ebx
80107096:	83 ec 1c             	sub    $0x1c,%esp
80107099:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010709c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010709f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801070a2:	85 db                	test   %ebx,%ebx
801070a4:	75 40                	jne    801070e6 <copyout+0x56>
801070a6:	eb 70                	jmp    80107118 <copyout+0x88>
801070a8:	90                   	nop
801070a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
801070b0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801070b3:	89 f1                	mov    %esi,%ecx
801070b5:	29 d1                	sub    %edx,%ecx
801070b7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
801070bd:	39 d9                	cmp    %ebx,%ecx
801070bf:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801070c2:	29 f2                	sub    %esi,%edx
801070c4:	83 ec 04             	sub    $0x4,%esp
801070c7:	01 d0                	add    %edx,%eax
801070c9:	51                   	push   %ecx
801070ca:	57                   	push   %edi
801070cb:	50                   	push   %eax
801070cc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801070cf:	e8 fc d4 ff ff       	call   801045d0 <memmove>
    len -= n;
    buf += n;
801070d4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801070d7:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
801070da:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
801070e0:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801070e2:	29 cb                	sub    %ecx,%ebx
801070e4:	74 32                	je     80107118 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801070e6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070e8:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
801070eb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801070ee:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070f4:	56                   	push   %esi
801070f5:	ff 75 08             	pushl  0x8(%ebp)
801070f8:	e8 53 ff ff ff       	call   80107050 <uva2ka>
    if(pa0 == 0)
801070fd:	83 c4 10             	add    $0x10,%esp
80107100:	85 c0                	test   %eax,%eax
80107102:	75 ac                	jne    801070b0 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80107104:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80107107:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
8010710c:	5b                   	pop    %ebx
8010710d:	5e                   	pop    %esi
8010710e:	5f                   	pop    %edi
8010710f:	5d                   	pop    %ebp
80107110:	c3                   	ret    
80107111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107118:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010711b:	31 c0                	xor    %eax,%eax
}
8010711d:	5b                   	pop    %ebx
8010711e:	5e                   	pop    %esi
8010711f:	5f                   	pop    %edi
80107120:	5d                   	pop    %ebp
80107121:	c3                   	ret    
