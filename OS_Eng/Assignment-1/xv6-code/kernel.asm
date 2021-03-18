
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b6 10 80       	mov    $0x8010b6c0,%esp
8010002d:	b8 50 2e 10 80       	mov    $0x80102e50,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 b6 10 80       	mov    $0x8010b6f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 60 70 10 80       	push   $0x80107060
80100051:	68 c0 b6 10 80       	push   $0x8010b6c0
80100056:	e8 95 41 00 00       	call   801041f0 <initlock>
8010005b:	c7 05 0c fe 10 80 bc 	movl   $0x8010fdbc,0x8010fe0c
80100062:	fd 10 80 
80100065:	c7 05 10 fe 10 80 bc 	movl   $0x8010fdbc,0x8010fe10
8010006c:	fd 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fd 10 80       	mov    $0x8010fdbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc fd 10 80 	movl   $0x8010fdbc,0x50(%ebx)
80100092:	68 67 70 10 80       	push   $0x80107067
80100097:	50                   	push   %eax
80100098:	e8 23 40 00 00       	call   801040c0 <initsleeplock>
8010009d:	a1 10 fe 10 80       	mov    0x8010fe10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 fe 10 80    	mov    %ebx,0x8010fe10
801000b6:	3d bc fd 10 80       	cmp    $0x8010fdbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 b6 10 80       	push   $0x8010b6c0
801000e4:	e8 67 42 00 00       	call   80104350 <acquire>
801000e9:	8b 1d 10 fe 10 80    	mov    0x8010fe10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c fe 10 80    	mov    0x8010fe0c,%ebx
80100126:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fd 10 80    	cmp    $0x8010fdbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b6 10 80       	push   $0x8010b6c0
80100162:	e8 99 42 00 00       	call   80104400 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 8e 3f 00 00       	call   80104100 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 5d 1f 00 00       	call   801020e0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 6e 70 10 80       	push   $0x8010706e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 ed 3f 00 00       	call   801041a0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 17 1f 00 00       	jmp    801020e0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 7f 70 10 80       	push   $0x8010707f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 ac 3f 00 00       	call   801041a0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 5c 3f 00 00       	call   80104160 <releasesleep>
80100204:	c7 04 24 c0 b6 10 80 	movl   $0x8010b6c0,(%esp)
8010020b:	e8 40 41 00 00       	call   80104350 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 fe 10 80       	mov    0x8010fe10,%eax
80100237:	c7 43 50 bc fd 10 80 	movl   $0x8010fdbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 fe 10 80       	mov    0x8010fe10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 fe 10 80    	mov    %ebx,0x8010fe10
8010024f:	c7 45 08 c0 b6 10 80 	movl   $0x8010b6c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 9f 41 00 00       	jmp    80104400 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 86 70 10 80       	push   $0x80107086
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
80100280:	e8 bb 14 00 00       	call   80101740 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
8010028c:	e8 bf 40 00 00       	call   80104350 <acquire>
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
801002bd:	e8 8e 3a 00 00       	call   80103d50 <sleep>

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
801002d2:	e8 c9 34 00 00       	call   801037a0 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a6 10 80       	push   $0x8010a620
801002e6:	e8 15 41 00 00       	call   80104400 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 6d 13 00 00       	call   80101660 <ilock>
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
80100346:	e8 b5 40 00 00       	call   80104400 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 0d 13 00 00       	call   80101660 <ilock>

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
80100389:	e8 52 23 00 00       	call   801026e0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 8d 70 10 80       	push   $0x8010708d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 1f 7a 10 80 	movl   $0x80107a1f,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 53 3e 00 00       	call   80104210 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 a1 70 10 80       	push   $0x801070a1
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
8010041a:	e8 01 58 00 00       	call   80105c20 <uartputc>
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
801004d3:	e8 48 57 00 00       	call   80105c20 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 3c 57 00 00       	call   80105c20 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 30 57 00 00       	call   80105c20 <uartputc>
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
80100514:	e8 e7 3f 00 00       	call   80104500 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 22 3f 00 00       	call   80104450 <memset>
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
80100540:	68 a5 70 10 80       	push   $0x801070a5
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
801005b1:	0f b6 92 d0 70 10 80 	movzbl -0x7fef8f30(%edx),%edx
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
8010060f:	e8 2c 11 00 00       	call   80101740 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
8010061b:	e8 30 3d 00 00       	call   80104350 <acquire>
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
80100647:	e8 b4 3d 00 00       	call   80104400 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 0b 10 00 00       	call   80101660 <ilock>

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
8010070d:	e8 ee 3c 00 00       	call   80104400 <release>
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
80100788:	b8 b8 70 10 80       	mov    $0x801070b8,%eax
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
801007c8:	e8 83 3b 00 00       	call   80104350 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 bf 70 10 80       	push   $0x801070bf
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
80100803:	e8 48 3b 00 00       	call   80104350 <acquire>
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
80100868:	e8 93 3b 00 00       	call   80104400 <release>
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
801008f6:	e8 15 36 00 00       	call   80103f10 <wakeup>
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
80100977:	e9 84 36 00 00       	jmp    80104000 <procdump>
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
801009a6:	68 c8 70 10 80       	push   $0x801070c8
801009ab:	68 20 a6 10 80       	push   $0x8010a620
801009b0:	e8 3b 38 00 00       	call   801041f0 <initlock>

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
801009d9:	e8 b2 18 00 00       	call   80102290 <ioapicenable>
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
801009fc:	e8 9f 2d 00 00       	call   801037a0 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a07:	e8 34 21 00 00       	call   80102b40 <begin_op>

  if((ip = namei(path)) == 0){
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 99 14 00 00       	call   80101eb0 <namei>
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
80100a28:	e8 33 0c 00 00       	call   80101660 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 02 0f 00 00       	call   80101940 <readi>
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
80100a4a:	e8 a1 0e 00 00       	call   801018f0 <iunlockput>
    end_op();
80100a4f:	e8 5c 21 00 00       	call   80102bb0 <end_op>
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
80100a74:	e8 37 63 00 00       	call   80106db0 <setupkvm>
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
80100ac8:	e8 73 0e 00 00       	call   80101940 <readi>
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
80100b04:	e8 f7 60 00 00       	call   80106c00 <allocuvm>
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
80100b3a:	e8 01 60 00 00       	call   80106b40 <loaduvm>
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
80100b59:	e8 d2 61 00 00       	call   80106d30 <freevm>
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
80100b6a:	e8 81 0d 00 00       	call   801018f0 <iunlockput>
  end_op();
80100b6f:	e8 3c 20 00 00       	call   80102bb0 <end_op>
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
80100b95:	e8 66 60 00 00       	call   80106c00 <allocuvm>
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
80100bac:	e8 7f 61 00 00       	call   80106d30 <freevm>
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
80100bbe:	e8 ed 1f 00 00       	call   80102bb0 <end_op>
    cprintf("exec: fail\n");
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 e1 70 10 80       	push   $0x801070e1
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
80100bf1:	e8 5a 62 00 00       	call   80106e50 <clearpteu>
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
80100c2d:	e8 5e 3a 00 00       	call   80104690 <strlen>
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
80100c40:	e8 4b 3a 00 00       	call   80104690 <strlen>
80100c45:	83 c0 01             	add    $0x1,%eax
80100c48:	50                   	push   %eax
80100c49:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4f:	53                   	push   %ebx
80100c50:	56                   	push   %esi
80100c51:	e8 6a 63 00 00       	call   80106fc0 <copyout>
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
80100cbb:	e8 00 63 00 00       	call   80106fc0 <copyout>
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
80100d00:	e8 4b 39 00 00       	call   80104650 <safestrcpy>

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
80100d2c:	e8 7f 5c 00 00       	call   801069b0 <switchuvm>
  freevm(oldpgdir);
80100d31:	89 3c 24             	mov    %edi,(%esp)
80100d34:	e8 f7 5f 00 00       	call   80106d30 <freevm>
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
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 10             	sub    $0x10,%esp
80100d56:	68 ed 70 10 80       	push   $0x801070ed
80100d5b:	68 c0 00 11 80       	push   $0x801100c0
80100d60:	e8 8b 34 00 00       	call   801041f0 <initlock>
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	c9                   	leave  
80100d69:	c3                   	ret    
80100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d70 <filealloc>:
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
80100d74:	bb f4 00 11 80       	mov    $0x801100f4,%ebx
80100d79:	83 ec 10             	sub    $0x10,%esp
80100d7c:	68 c0 00 11 80       	push   $0x801100c0
80100d81:	e8 ca 35 00 00       	call   80104350 <acquire>
80100d86:	83 c4 10             	add    $0x10,%esp
80100d89:	eb 10                	jmp    80100d9b <filealloc+0x2b>
80100d8b:	90                   	nop
80100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 54 0a 11 80    	cmp    $0x80110a54,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
80100da2:	83 ec 0c             	sub    $0xc,%esp
80100da5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dac:	68 c0 00 11 80       	push   $0x801100c0
80100db1:	e8 4a 36 00 00       	call   80104400 <release>
80100db6:	89 d8                	mov    %ebx,%eax
80100db8:	83 c4 10             	add    $0x10,%esp
80100dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dbe:	c9                   	leave  
80100dbf:	c3                   	ret    
80100dc0:	83 ec 0c             	sub    $0xc,%esp
80100dc3:	68 c0 00 11 80       	push   $0x801100c0
80100dc8:	e8 33 36 00 00       	call   80104400 <release>
80100dcd:	83 c4 10             	add    $0x10,%esp
80100dd0:	31 c0                	xor    %eax,%eax
80100dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dd5:	c9                   	leave  
80100dd6:	c3                   	ret    
80100dd7:	89 f6                	mov    %esi,%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <filedup>:
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 10             	sub    $0x10,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dea:	68 c0 00 11 80       	push   $0x801100c0
80100def:	e8 5c 35 00 00       	call   80104350 <acquire>
80100df4:	8b 43 04             	mov    0x4(%ebx),%eax
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	85 c0                	test   %eax,%eax
80100dfc:	7e 1a                	jle    80100e18 <filedup+0x38>
80100dfe:	83 c0 01             	add    $0x1,%eax
80100e01:	83 ec 0c             	sub    $0xc,%esp
80100e04:	89 43 04             	mov    %eax,0x4(%ebx)
80100e07:	68 c0 00 11 80       	push   $0x801100c0
80100e0c:	e8 ef 35 00 00       	call   80104400 <release>
80100e11:	89 d8                	mov    %ebx,%eax
80100e13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e16:	c9                   	leave  
80100e17:	c3                   	ret    
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 f4 70 10 80       	push   $0x801070f4
80100e20:	e8 4b f5 ff ff       	call   80100370 <panic>
80100e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 28             	sub    $0x28,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e3c:	68 c0 00 11 80       	push   $0x801100c0
80100e41:	e8 0a 35 00 00       	call   80104350 <acquire>
80100e46:	8b 47 04             	mov    0x4(%edi),%eax
80100e49:	83 c4 10             	add    $0x10,%esp
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	0f 8e 9b 00 00 00    	jle    80100eef <fileclose+0xbf>
80100e54:	83 e8 01             	sub    $0x1,%eax
80100e57:	85 c0                	test   %eax,%eax
80100e59:	89 47 04             	mov    %eax,0x4(%edi)
80100e5c:	74 1a                	je     80100e78 <fileclose+0x48>
80100e5e:	c7 45 08 c0 00 11 80 	movl   $0x801100c0,0x8(%ebp)
80100e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e68:	5b                   	pop    %ebx
80100e69:	5e                   	pop    %esi
80100e6a:	5f                   	pop    %edi
80100e6b:	5d                   	pop    %ebp
80100e6c:	e9 8f 35 00 00       	jmp    80104400 <release>
80100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e78:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e7c:	8b 1f                	mov    (%edi),%ebx
80100e7e:	83 ec 0c             	sub    $0xc,%esp
80100e81:	8b 77 0c             	mov    0xc(%edi),%esi
80100e84:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e8a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e8d:	8b 47 10             	mov    0x10(%edi),%eax
80100e90:	68 c0 00 11 80       	push   $0x801100c0
80100e95:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e98:	e8 63 35 00 00       	call   80104400 <release>
80100e9d:	83 c4 10             	add    $0x10,%esp
80100ea0:	83 fb 01             	cmp    $0x1,%ebx
80100ea3:	74 13                	je     80100eb8 <fileclose+0x88>
80100ea5:	83 fb 02             	cmp    $0x2,%ebx
80100ea8:	74 26                	je     80100ed0 <fileclose+0xa0>
80100eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ead:	5b                   	pop    %ebx
80100eae:	5e                   	pop    %esi
80100eaf:	5f                   	pop    %edi
80100eb0:	5d                   	pop    %ebp
80100eb1:	c3                   	ret    
80100eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100eb8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ebc:	83 ec 08             	sub    $0x8,%esp
80100ebf:	53                   	push   %ebx
80100ec0:	56                   	push   %esi
80100ec1:	e8 1a 24 00 00       	call   801032e0 <pipeclose>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb df                	jmp    80100eaa <fileclose+0x7a>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ed0:	e8 6b 1c 00 00       	call   80102b40 <begin_op>
80100ed5:	83 ec 0c             	sub    $0xc,%esp
80100ed8:	ff 75 e0             	pushl  -0x20(%ebp)
80100edb:	e8 b0 08 00 00       	call   80101790 <iput>
80100ee0:	83 c4 10             	add    $0x10,%esp
80100ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee6:	5b                   	pop    %ebx
80100ee7:	5e                   	pop    %esi
80100ee8:	5f                   	pop    %edi
80100ee9:	5d                   	pop    %ebp
80100eea:	e9 c1 1c 00 00       	jmp    80102bb0 <end_op>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	68 fc 70 10 80       	push   $0x801070fc
80100ef7:	e8 74 f4 ff ff       	call   80100370 <panic>
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f00 <filestat>:
80100f00:	55                   	push   %ebp
80100f01:	89 e5                	mov    %esp,%ebp
80100f03:	53                   	push   %ebx
80100f04:	83 ec 04             	sub    $0x4,%esp
80100f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f0a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0d:	75 31                	jne    80100f40 <filestat+0x40>
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	ff 73 10             	pushl  0x10(%ebx)
80100f15:	e8 46 07 00 00       	call   80101660 <ilock>
80100f1a:	58                   	pop    %eax
80100f1b:	5a                   	pop    %edx
80100f1c:	ff 75 0c             	pushl  0xc(%ebp)
80100f1f:	ff 73 10             	pushl  0x10(%ebx)
80100f22:	e8 e9 09 00 00       	call   80101910 <stati>
80100f27:	59                   	pop    %ecx
80100f28:	ff 73 10             	pushl  0x10(%ebx)
80100f2b:	e8 10 08 00 00       	call   80101740 <iunlock>
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	31 c0                	xor    %eax,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f50 <fileread>:
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	57                   	push   %edi
80100f54:	56                   	push   %esi
80100f55:	53                   	push   %ebx
80100f56:	83 ec 0c             	sub    $0xc,%esp
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f5f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f62:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f66:	74 60                	je     80100fc8 <fileread+0x78>
80100f68:	8b 03                	mov    (%ebx),%eax
80100f6a:	83 f8 01             	cmp    $0x1,%eax
80100f6d:	74 41                	je     80100fb0 <fileread+0x60>
80100f6f:	83 f8 02             	cmp    $0x2,%eax
80100f72:	75 5b                	jne    80100fcf <fileread+0x7f>
80100f74:	83 ec 0c             	sub    $0xc,%esp
80100f77:	ff 73 10             	pushl  0x10(%ebx)
80100f7a:	e8 e1 06 00 00       	call   80101660 <ilock>
80100f7f:	57                   	push   %edi
80100f80:	ff 73 14             	pushl  0x14(%ebx)
80100f83:	56                   	push   %esi
80100f84:	ff 73 10             	pushl  0x10(%ebx)
80100f87:	e8 b4 09 00 00       	call   80101940 <readi>
80100f8c:	83 c4 20             	add    $0x20,%esp
80100f8f:	85 c0                	test   %eax,%eax
80100f91:	89 c6                	mov    %eax,%esi
80100f93:	7e 03                	jle    80100f98 <fileread+0x48>
80100f95:	01 43 14             	add    %eax,0x14(%ebx)
80100f98:	83 ec 0c             	sub    $0xc,%esp
80100f9b:	ff 73 10             	pushl  0x10(%ebx)
80100f9e:	e8 9d 07 00 00       	call   80101740 <iunlock>
80100fa3:	83 c4 10             	add    $0x10,%esp
80100fa6:	89 f0                	mov    %esi,%eax
80100fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fab:	5b                   	pop    %ebx
80100fac:	5e                   	pop    %esi
80100fad:	5f                   	pop    %edi
80100fae:	5d                   	pop    %ebp
80100faf:	c3                   	ret    
80100fb0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fb3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	5b                   	pop    %ebx
80100fba:	5e                   	pop    %esi
80100fbb:	5f                   	pop    %edi
80100fbc:	5d                   	pop    %ebp
80100fbd:	e9 be 24 00 00       	jmp    80103480 <piperead>
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fcd:	eb d9                	jmp    80100fa8 <fileread+0x58>
80100fcf:	83 ec 0c             	sub    $0xc,%esp
80100fd2:	68 06 71 10 80       	push   $0x80107106
80100fd7:	e8 94 f3 ff ff       	call   80100370 <panic>
80100fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fe0 <filewrite>:
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 1c             	sub    $0x1c,%esp
80100fe9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fec:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100ffc:	0f 84 aa 00 00 00    	je     801010ac <filewrite+0xcc>
80101002:	8b 06                	mov    (%esi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d8 00 00 00    	jne    801010ee <filewrite+0x10e>
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 ff                	xor    %edi,%edi
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 34                	jg     80101053 <filewrite+0x73>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101028:	01 46 14             	add    %eax,0x14(%esi)
8010102b:	83 ec 0c             	sub    $0xc,%esp
8010102e:	ff 76 10             	pushl  0x10(%esi)
80101031:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101034:	e8 07 07 00 00       	call   80101740 <iunlock>
80101039:	e8 72 1b 00 00       	call   80102bb0 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101041:	83 c4 10             	add    $0x10,%esp
80101044:	39 d8                	cmp    %ebx,%eax
80101046:	0f 85 95 00 00 00    	jne    801010e1 <filewrite+0x101>
8010104c:	01 c7                	add    %eax,%edi
8010104e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101051:	7e 6d                	jle    801010c0 <filewrite+0xe0>
80101053:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101056:	b8 00 06 00 00       	mov    $0x600,%eax
8010105b:	29 fb                	sub    %edi,%ebx
8010105d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101063:	0f 4f d8             	cmovg  %eax,%ebx
80101066:	e8 d5 1a 00 00       	call   80102b40 <begin_op>
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	e8 ea 05 00 00       	call   80101660 <ilock>
80101076:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101079:	53                   	push   %ebx
8010107a:	ff 76 14             	pushl  0x14(%esi)
8010107d:	01 f8                	add    %edi,%eax
8010107f:	50                   	push   %eax
80101080:	ff 76 10             	pushl  0x10(%esi)
80101083:	e8 b8 09 00 00       	call   80101a40 <writei>
80101088:	83 c4 20             	add    $0x20,%esp
8010108b:	85 c0                	test   %eax,%eax
8010108d:	7f 99                	jg     80101028 <filewrite+0x48>
8010108f:	83 ec 0c             	sub    $0xc,%esp
80101092:	ff 76 10             	pushl  0x10(%esi)
80101095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101098:	e8 a3 06 00 00       	call   80101740 <iunlock>
8010109d:	e8 0e 1b 00 00       	call   80102bb0 <end_op>
801010a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a5:	83 c4 10             	add    $0x10,%esp
801010a8:	85 c0                	test   %eax,%eax
801010aa:	74 98                	je     80101044 <filewrite+0x64>
801010ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
801010b8:	c3                   	ret    
801010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010c3:	75 e7                	jne    801010ac <filewrite+0xcc>
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	89 f8                	mov    %edi,%eax
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
801010cf:	8b 46 0c             	mov    0xc(%esi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
801010dc:	e9 9f 22 00 00       	jmp    80103380 <pipewrite>
801010e1:	83 ec 0c             	sub    $0xc,%esp
801010e4:	68 0f 71 10 80       	push   $0x8010710f
801010e9:	e8 82 f2 ff ff       	call   80100370 <panic>
801010ee:	83 ec 0c             	sub    $0xc,%esp
801010f1:	68 15 71 10 80       	push   $0x80107115
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
8010114b:	e8 d0 1b 00 00       	call   80102d20 <log_write>
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
80101165:	68 1f 71 10 80       	push   $0x8010711f
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
80101212:	68 32 71 10 80       	push   $0x80107132
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
8010122d:	e8 ee 1a 00 00       	call   80102d20 <log_write>
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
80101255:	e8 f6 31 00 00       	call   80104450 <memset>
  log_write(bp);
8010125a:	89 1c 24             	mov    %ebx,(%esp)
8010125d:	e8 be 1a 00 00       	call   80102d20 <log_write>
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
8010129a:	e8 b1 30 00 00       	call   80104350 <acquire>
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
801012b4:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012ba:	81 fb 34 27 11 80    	cmp    $0x80112734,%ebx
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
801012e2:	e8 19 31 00 00       	call   80104400 <release>
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
801012fd:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101303:	81 fb 34 27 11 80    	cmp    $0x80112734,%ebx
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
8010132f:	e8 cc 30 00 00       	call   80104400 <release>

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
80101344:	68 48 71 10 80       	push   $0x80107148
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
8010135b:	83 fa 0b             	cmp    $0xb,%edx
8010135e:	77 18                	ja     80101378 <bmap+0x28>
80101360:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
80101363:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101366:	85 c0                	test   %eax,%eax
80101368:	74 76                	je     801013e0 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010136a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010136d:	5b                   	pop    %ebx
8010136e:	5e                   	pop    %esi
8010136f:	5f                   	pop    %edi
80101370:	5d                   	pop    %ebp
80101371:	c3                   	ret    
80101372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101378:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
8010137b:	83 fb 7f             	cmp    $0x7f,%ebx
8010137e:	0f 87 83 00 00 00    	ja     80101407 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101384:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010138a:	85 c0                	test   %eax,%eax
8010138c:	74 6a                	je     801013f8 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010138e:	83 ec 08             	sub    $0x8,%esp
80101391:	50                   	push   %eax
80101392:	ff 36                	pushl  (%esi)
80101394:	e8 37 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101399:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010139d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801013a0:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
801013a2:	8b 1a                	mov    (%edx),%ebx
801013a4:	85 db                	test   %ebx,%ebx
801013a6:	75 1d                	jne    801013c5 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
801013a8:	8b 06                	mov    (%esi),%eax
801013aa:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013ad:	e8 be fd ff ff       	call   80101170 <balloc>
801013b2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
801013b5:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
801013b8:	89 c3                	mov    %eax,%ebx
801013ba:	89 02                	mov    %eax,(%edx)
      log_write(bp);
801013bc:	57                   	push   %edi
801013bd:	e8 5e 19 00 00       	call   80102d20 <log_write>
801013c2:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
801013c5:	83 ec 0c             	sub    $0xc,%esp
801013c8:	57                   	push   %edi
801013c9:	e8 12 ee ff ff       	call   801001e0 <brelse>
801013ce:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
801013d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
801013d4:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
801013d6:	5b                   	pop    %ebx
801013d7:	5e                   	pop    %esi
801013d8:	5f                   	pop    %edi
801013d9:	5d                   	pop    %ebp
801013da:	c3                   	ret    
801013db:	90                   	nop
801013dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
801013e0:	8b 06                	mov    (%esi),%eax
801013e2:	e8 89 fd ff ff       	call   80101170 <balloc>
801013e7:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801013ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013ed:	5b                   	pop    %ebx
801013ee:	5e                   	pop    %esi
801013ef:	5f                   	pop    %edi
801013f0:	5d                   	pop    %ebp
801013f1:	c3                   	ret    
801013f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801013f8:	8b 06                	mov    (%esi),%eax
801013fa:	e8 71 fd ff ff       	call   80101170 <balloc>
801013ff:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101405:	eb 87                	jmp    8010138e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101407:	83 ec 0c             	sub    $0xc,%esp
8010140a:	68 58 71 10 80       	push   $0x80107158
8010140f:	e8 5c ef ff ff       	call   80100370 <panic>
80101414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010141a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101420 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101420:	55                   	push   %ebp
80101421:	89 e5                	mov    %esp,%ebp
80101423:	56                   	push   %esi
80101424:	53                   	push   %ebx
80101425:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
80101428:	83 ec 08             	sub    $0x8,%esp
8010142b:	6a 01                	push   $0x1
8010142d:	ff 75 08             	pushl  0x8(%ebp)
80101430:	e8 9b ec ff ff       	call   801000d0 <bread>
80101435:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101437:	8d 40 5c             	lea    0x5c(%eax),%eax
8010143a:	83 c4 0c             	add    $0xc,%esp
8010143d:	6a 1c                	push   $0x1c
8010143f:	50                   	push   %eax
80101440:	56                   	push   %esi
80101441:	e8 ba 30 00 00       	call   80104500 <memmove>
  brelse(bp);
80101446:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101449:	83 c4 10             	add    $0x10,%esp
}
8010144c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010144f:	5b                   	pop    %ebx
80101450:	5e                   	pop    %esi
80101451:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
80101452:	e9 89 ed ff ff       	jmp    801001e0 <brelse>
80101457:	89 f6                	mov    %esi,%esi
80101459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101460 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101460:	55                   	push   %ebp
80101461:	89 e5                	mov    %esp,%ebp
80101463:	53                   	push   %ebx
80101464:	bb 20 0b 11 80       	mov    $0x80110b20,%ebx
80101469:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010146c:	68 6b 71 10 80       	push   $0x8010716b
80101471:	68 e0 0a 11 80       	push   $0x80110ae0
80101476:	e8 75 2d 00 00       	call   801041f0 <initlock>
8010147b:	83 c4 10             	add    $0x10,%esp
8010147e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101480:	83 ec 08             	sub    $0x8,%esp
80101483:	68 72 71 10 80       	push   $0x80107172
80101488:	53                   	push   %ebx
80101489:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010148f:	e8 2c 2c 00 00       	call   801040c0 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101494:	83 c4 10             	add    $0x10,%esp
80101497:	81 fb 40 27 11 80    	cmp    $0x80112740,%ebx
8010149d:	75 e1                	jne    80101480 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
8010149f:	83 ec 08             	sub    $0x8,%esp
801014a2:	68 c0 0a 11 80       	push   $0x80110ac0
801014a7:	ff 75 08             	pushl  0x8(%ebp)
801014aa:	e8 71 ff ff ff       	call   80101420 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014af:	ff 35 d8 0a 11 80    	pushl  0x80110ad8
801014b5:	ff 35 d4 0a 11 80    	pushl  0x80110ad4
801014bb:	ff 35 d0 0a 11 80    	pushl  0x80110ad0
801014c1:	ff 35 cc 0a 11 80    	pushl  0x80110acc
801014c7:	ff 35 c8 0a 11 80    	pushl  0x80110ac8
801014cd:	ff 35 c4 0a 11 80    	pushl  0x80110ac4
801014d3:	ff 35 c0 0a 11 80    	pushl  0x80110ac0
801014d9:	68 d8 71 10 80       	push   $0x801071d8
801014de:	e8 7d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801014e3:	83 c4 30             	add    $0x30,%esp
801014e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014e9:	c9                   	leave  
801014ea:	c3                   	ret    
801014eb:	90                   	nop
801014ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014f0 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	57                   	push   %edi
801014f4:	56                   	push   %esi
801014f5:	53                   	push   %ebx
801014f6:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801014f9:	83 3d c8 0a 11 80 01 	cmpl   $0x1,0x80110ac8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101500:	8b 45 0c             	mov    0xc(%ebp),%eax
80101503:	8b 75 08             	mov    0x8(%ebp),%esi
80101506:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101509:	0f 86 91 00 00 00    	jbe    801015a0 <ialloc+0xb0>
8010150f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101514:	eb 21                	jmp    80101537 <ialloc+0x47>
80101516:	8d 76 00             	lea    0x0(%esi),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101520:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101523:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101526:	57                   	push   %edi
80101527:	e8 b4 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010152c:	83 c4 10             	add    $0x10,%esp
8010152f:	39 1d c8 0a 11 80    	cmp    %ebx,0x80110ac8
80101535:	76 69                	jbe    801015a0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101537:	89 d8                	mov    %ebx,%eax
80101539:	83 ec 08             	sub    $0x8,%esp
8010153c:	c1 e8 03             	shr    $0x3,%eax
8010153f:	03 05 d4 0a 11 80    	add    0x80110ad4,%eax
80101545:	50                   	push   %eax
80101546:	56                   	push   %esi
80101547:	e8 84 eb ff ff       	call   801000d0 <bread>
8010154c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010154e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101550:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101553:	83 e0 07             	and    $0x7,%eax
80101556:	c1 e0 06             	shl    $0x6,%eax
80101559:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010155d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101561:	75 bd                	jne    80101520 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101563:	83 ec 04             	sub    $0x4,%esp
80101566:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101569:	6a 40                	push   $0x40
8010156b:	6a 00                	push   $0x0
8010156d:	51                   	push   %ecx
8010156e:	e8 dd 2e 00 00       	call   80104450 <memset>
      dip->type = type;
80101573:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101577:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010157a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010157d:	89 3c 24             	mov    %edi,(%esp)
80101580:	e8 9b 17 00 00       	call   80102d20 <log_write>
      brelse(bp);
80101585:	89 3c 24             	mov    %edi,(%esp)
80101588:	e8 53 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010158d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101590:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
80101593:	89 da                	mov    %ebx,%edx
80101595:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101597:	5b                   	pop    %ebx
80101598:	5e                   	pop    %esi
80101599:	5f                   	pop    %edi
8010159a:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
8010159b:	e9 e0 fc ff ff       	jmp    80101280 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015a0:	83 ec 0c             	sub    $0xc,%esp
801015a3:	68 78 71 10 80       	push   $0x80107178
801015a8:	e8 c3 ed ff ff       	call   80100370 <panic>
801015ad:	8d 76 00             	lea    0x0(%esi),%esi

801015b0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
801015b0:	55                   	push   %ebp
801015b1:	89 e5                	mov    %esp,%ebp
801015b3:	56                   	push   %esi
801015b4:	53                   	push   %ebx
801015b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015b8:	83 ec 08             	sub    $0x8,%esp
801015bb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015be:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015c1:	c1 e8 03             	shr    $0x3,%eax
801015c4:	03 05 d4 0a 11 80    	add    0x80110ad4,%eax
801015ca:	50                   	push   %eax
801015cb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015ce:	e8 fd ea ff ff       	call   801000d0 <bread>
801015d3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015d5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015d8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015dc:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015df:	83 e0 07             	and    $0x7,%eax
801015e2:	c1 e0 06             	shl    $0x6,%eax
801015e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015e9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015ec:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015f0:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
801015f3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
801015f7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015fb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
801015ff:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101603:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101607:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010160a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010160d:	6a 34                	push   $0x34
8010160f:	53                   	push   %ebx
80101610:	50                   	push   %eax
80101611:	e8 ea 2e 00 00       	call   80104500 <memmove>
  log_write(bp);
80101616:	89 34 24             	mov    %esi,(%esp)
80101619:	e8 02 17 00 00       	call   80102d20 <log_write>
  brelse(bp);
8010161e:	89 75 08             	mov    %esi,0x8(%ebp)
80101621:	83 c4 10             	add    $0x10,%esp
}
80101624:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101627:	5b                   	pop    %ebx
80101628:	5e                   	pop    %esi
80101629:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010162a:	e9 b1 eb ff ff       	jmp    801001e0 <brelse>
8010162f:	90                   	nop

80101630 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101630:	55                   	push   %ebp
80101631:	89 e5                	mov    %esp,%ebp
80101633:	53                   	push   %ebx
80101634:	83 ec 10             	sub    $0x10,%esp
80101637:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010163a:	68 e0 0a 11 80       	push   $0x80110ae0
8010163f:	e8 0c 2d 00 00       	call   80104350 <acquire>
  ip->ref++;
80101644:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101648:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
8010164f:	e8 ac 2d 00 00       	call   80104400 <release>
  return ip;
}
80101654:	89 d8                	mov    %ebx,%eax
80101656:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101659:	c9                   	leave  
8010165a:	c3                   	ret    
8010165b:	90                   	nop
8010165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101660 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	56                   	push   %esi
80101664:	53                   	push   %ebx
80101665:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101668:	85 db                	test   %ebx,%ebx
8010166a:	0f 84 b7 00 00 00    	je     80101727 <ilock+0xc7>
80101670:	8b 53 08             	mov    0x8(%ebx),%edx
80101673:	85 d2                	test   %edx,%edx
80101675:	0f 8e ac 00 00 00    	jle    80101727 <ilock+0xc7>
    panic("ilock");

  acquiresleep(&ip->lock);
8010167b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010167e:	83 ec 0c             	sub    $0xc,%esp
80101681:	50                   	push   %eax
80101682:	e8 79 2a 00 00       	call   80104100 <acquiresleep>

  if(ip->valid == 0){
80101687:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010168a:	83 c4 10             	add    $0x10,%esp
8010168d:	85 c0                	test   %eax,%eax
8010168f:	74 0f                	je     801016a0 <ilock+0x40>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
80101691:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101694:	5b                   	pop    %ebx
80101695:	5e                   	pop    %esi
80101696:	5d                   	pop    %ebp
80101697:	c3                   	ret    
80101698:	90                   	nop
80101699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016a0:	8b 43 04             	mov    0x4(%ebx),%eax
801016a3:	83 ec 08             	sub    $0x8,%esp
801016a6:	c1 e8 03             	shr    $0x3,%eax
801016a9:	03 05 d4 0a 11 80    	add    0x80110ad4,%eax
801016af:	50                   	push   %eax
801016b0:	ff 33                	pushl  (%ebx)
801016b2:	e8 19 ea ff ff       	call   801000d0 <bread>
801016b7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016b9:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016bc:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016bf:	83 e0 07             	and    $0x7,%eax
801016c2:	c1 e0 06             	shl    $0x6,%eax
801016c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016c9:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016cc:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016cf:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016d3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016d7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016db:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016df:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016e3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016e7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016eb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016ee:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016f1:	6a 34                	push   $0x34
801016f3:	50                   	push   %eax
801016f4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016f7:	50                   	push   %eax
801016f8:	e8 03 2e 00 00       	call   80104500 <memmove>
    brelse(bp);
801016fd:	89 34 24             	mov    %esi,(%esp)
80101700:	e8 db ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
80101705:	83 c4 10             	add    $0x10,%esp
80101708:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
8010170d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101714:	0f 85 77 ff ff ff    	jne    80101691 <ilock+0x31>
      panic("ilock: no type");
8010171a:	83 ec 0c             	sub    $0xc,%esp
8010171d:	68 90 71 10 80       	push   $0x80107190
80101722:	e8 49 ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101727:	83 ec 0c             	sub    $0xc,%esp
8010172a:	68 8a 71 10 80       	push   $0x8010718a
8010172f:	e8 3c ec ff ff       	call   80100370 <panic>
80101734:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010173a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101740 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101740:	55                   	push   %ebp
80101741:	89 e5                	mov    %esp,%ebp
80101743:	56                   	push   %esi
80101744:	53                   	push   %ebx
80101745:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101748:	85 db                	test   %ebx,%ebx
8010174a:	74 28                	je     80101774 <iunlock+0x34>
8010174c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010174f:	83 ec 0c             	sub    $0xc,%esp
80101752:	56                   	push   %esi
80101753:	e8 48 2a 00 00       	call   801041a0 <holdingsleep>
80101758:	83 c4 10             	add    $0x10,%esp
8010175b:	85 c0                	test   %eax,%eax
8010175d:	74 15                	je     80101774 <iunlock+0x34>
8010175f:	8b 43 08             	mov    0x8(%ebx),%eax
80101762:	85 c0                	test   %eax,%eax
80101764:	7e 0e                	jle    80101774 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101766:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101769:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010176c:	5b                   	pop    %ebx
8010176d:	5e                   	pop    %esi
8010176e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010176f:	e9 ec 29 00 00       	jmp    80104160 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 9f 71 10 80       	push   $0x8010719f
8010177c:	e8 ef eb ff ff       	call   80100370 <panic>
80101781:	eb 0d                	jmp    80101790 <iput>
80101783:	90                   	nop
80101784:	90                   	nop
80101785:	90                   	nop
80101786:	90                   	nop
80101787:	90                   	nop
80101788:	90                   	nop
80101789:	90                   	nop
8010178a:	90                   	nop
8010178b:	90                   	nop
8010178c:	90                   	nop
8010178d:	90                   	nop
8010178e:	90                   	nop
8010178f:	90                   	nop

80101790 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	57                   	push   %edi
80101794:	56                   	push   %esi
80101795:	53                   	push   %ebx
80101796:	83 ec 28             	sub    $0x28,%esp
80101799:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
8010179c:	8d 7e 0c             	lea    0xc(%esi),%edi
8010179f:	57                   	push   %edi
801017a0:	e8 5b 29 00 00       	call   80104100 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017a5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017a8:	83 c4 10             	add    $0x10,%esp
801017ab:	85 d2                	test   %edx,%edx
801017ad:	74 07                	je     801017b6 <iput+0x26>
801017af:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017b4:	74 32                	je     801017e8 <iput+0x58>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
801017b6:	83 ec 0c             	sub    $0xc,%esp
801017b9:	57                   	push   %edi
801017ba:	e8 a1 29 00 00       	call   80104160 <releasesleep>

  acquire(&icache.lock);
801017bf:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
801017c6:	e8 85 2b 00 00       	call   80104350 <acquire>
  ip->ref--;
801017cb:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
801017cf:	83 c4 10             	add    $0x10,%esp
801017d2:	c7 45 08 e0 0a 11 80 	movl   $0x80110ae0,0x8(%ebp)
}
801017d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017dc:	5b                   	pop    %ebx
801017dd:	5e                   	pop    %esi
801017de:	5f                   	pop    %edi
801017df:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
801017e0:	e9 1b 2c 00 00       	jmp    80104400 <release>
801017e5:	8d 76 00             	lea    0x0(%esi),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
801017e8:	83 ec 0c             	sub    $0xc,%esp
801017eb:	68 e0 0a 11 80       	push   $0x80110ae0
801017f0:	e8 5b 2b 00 00       	call   80104350 <acquire>
    int r = ip->ref;
801017f5:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
801017f8:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
801017ff:	e8 fc 2b 00 00       	call   80104400 <release>
    if(r == 1){
80101804:	83 c4 10             	add    $0x10,%esp
80101807:	83 fb 01             	cmp    $0x1,%ebx
8010180a:	75 aa                	jne    801017b6 <iput+0x26>
8010180c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101812:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101815:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101818:	89 cf                	mov    %ecx,%edi
8010181a:	eb 0b                	jmp    80101827 <iput+0x97>
8010181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101820:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101823:	39 fb                	cmp    %edi,%ebx
80101825:	74 19                	je     80101840 <iput+0xb0>
    if(ip->addrs[i]){
80101827:	8b 13                	mov    (%ebx),%edx
80101829:	85 d2                	test   %edx,%edx
8010182b:	74 f3                	je     80101820 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010182d:	8b 06                	mov    (%esi),%eax
8010182f:	e8 cc f8 ff ff       	call   80101100 <bfree>
      ip->addrs[i] = 0;
80101834:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010183a:	eb e4                	jmp    80101820 <iput+0x90>
8010183c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101840:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101846:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101849:	85 c0                	test   %eax,%eax
8010184b:	75 33                	jne    80101880 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010184d:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101850:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101857:	56                   	push   %esi
80101858:	e8 53 fd ff ff       	call   801015b0 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010185d:	31 c0                	xor    %eax,%eax
8010185f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101863:	89 34 24             	mov    %esi,(%esp)
80101866:	e8 45 fd ff ff       	call   801015b0 <iupdate>
      ip->valid = 0;
8010186b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101872:	83 c4 10             	add    $0x10,%esp
80101875:	e9 3c ff ff ff       	jmp    801017b6 <iput+0x26>
8010187a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101880:	83 ec 08             	sub    $0x8,%esp
80101883:	50                   	push   %eax
80101884:	ff 36                	pushl  (%esi)
80101886:	e8 45 e8 ff ff       	call   801000d0 <bread>
8010188b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101891:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101894:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101897:	8d 58 5c             	lea    0x5c(%eax),%ebx
8010189a:	83 c4 10             	add    $0x10,%esp
8010189d:	89 cf                	mov    %ecx,%edi
8010189f:	eb 0e                	jmp    801018af <iput+0x11f>
801018a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018a8:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801018ab:	39 fb                	cmp    %edi,%ebx
801018ad:	74 0f                	je     801018be <iput+0x12e>
      if(a[j])
801018af:	8b 13                	mov    (%ebx),%edx
801018b1:	85 d2                	test   %edx,%edx
801018b3:	74 f3                	je     801018a8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018b5:	8b 06                	mov    (%esi),%eax
801018b7:	e8 44 f8 ff ff       	call   80101100 <bfree>
801018bc:	eb ea                	jmp    801018a8 <iput+0x118>
    }
    brelse(bp);
801018be:	83 ec 0c             	sub    $0xc,%esp
801018c1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018c4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018c7:	e8 14 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018cc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018d2:	8b 06                	mov    (%esi),%eax
801018d4:	e8 27 f8 ff ff       	call   80101100 <bfree>
    ip->addrs[NDIRECT] = 0;
801018d9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018e0:	00 00 00 
801018e3:	83 c4 10             	add    $0x10,%esp
801018e6:	e9 62 ff ff ff       	jmp    8010184d <iput+0xbd>
801018eb:	90                   	nop
801018ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801018f0 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	53                   	push   %ebx
801018f4:	83 ec 10             	sub    $0x10,%esp
801018f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801018fa:	53                   	push   %ebx
801018fb:	e8 40 fe ff ff       	call   80101740 <iunlock>
  iput(ip);
80101900:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101903:	83 c4 10             	add    $0x10,%esp
}
80101906:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101909:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010190a:	e9 81 fe ff ff       	jmp    80101790 <iput>
8010190f:	90                   	nop

80101910 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	8b 55 08             	mov    0x8(%ebp),%edx
80101916:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101919:	8b 0a                	mov    (%edx),%ecx
8010191b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010191e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101921:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101924:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101928:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010192b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010192f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101933:	8b 52 58             	mov    0x58(%edx),%edx
80101936:	89 50 10             	mov    %edx,0x10(%eax)
}
80101939:	5d                   	pop    %ebp
8010193a:	c3                   	ret    
8010193b:	90                   	nop
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101940 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	57                   	push   %edi
80101944:	56                   	push   %esi
80101945:	53                   	push   %ebx
80101946:	83 ec 1c             	sub    $0x1c,%esp
80101949:	8b 45 08             	mov    0x8(%ebp),%eax
8010194c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010194f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101952:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101957:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010195a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010195d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101960:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101963:	0f 84 a7 00 00 00    	je     80101a10 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101969:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010196c:	8b 40 58             	mov    0x58(%eax),%eax
8010196f:	39 f0                	cmp    %esi,%eax
80101971:	0f 82 c1 00 00 00    	jb     80101a38 <readi+0xf8>
80101977:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010197a:	89 fa                	mov    %edi,%edx
8010197c:	01 f2                	add    %esi,%edx
8010197e:	0f 82 b4 00 00 00    	jb     80101a38 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101984:	89 c1                	mov    %eax,%ecx
80101986:	29 f1                	sub    %esi,%ecx
80101988:	39 d0                	cmp    %edx,%eax
8010198a:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010198d:	31 ff                	xor    %edi,%edi
8010198f:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101991:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101994:	74 6d                	je     80101a03 <readi+0xc3>
80101996:	8d 76 00             	lea    0x0(%esi),%esi
80101999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019a0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019a3:	89 f2                	mov    %esi,%edx
801019a5:	c1 ea 09             	shr    $0x9,%edx
801019a8:	89 d8                	mov    %ebx,%eax
801019aa:	e8 a1 f9 ff ff       	call   80101350 <bmap>
801019af:	83 ec 08             	sub    $0x8,%esp
801019b2:	50                   	push   %eax
801019b3:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
801019b5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019ba:	e8 11 e7 ff ff       	call   801000d0 <bread>
801019bf:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019c4:	89 f1                	mov    %esi,%ecx
801019c6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019cc:	83 c4 0c             	add    $0xc,%esp
    memmove(dst, bp->data + off%BSIZE, m);
801019cf:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019d2:	29 cb                	sub    %ecx,%ebx
801019d4:	29 f8                	sub    %edi,%eax
801019d6:	39 c3                	cmp    %eax,%ebx
801019d8:	0f 47 d8             	cmova  %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019db:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019df:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019e0:	01 df                	add    %ebx,%edi
801019e2:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
801019e4:	50                   	push   %eax
801019e5:	ff 75 e0             	pushl  -0x20(%ebp)
801019e8:	e8 13 2b 00 00       	call   80104500 <memmove>
    brelse(bp);
801019ed:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019f0:	89 14 24             	mov    %edx,(%esp)
801019f3:	e8 e8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019fb:	83 c4 10             	add    $0x10,%esp
801019fe:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a01:	77 9d                	ja     801019a0 <readi+0x60>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a06:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a09:	5b                   	pop    %ebx
80101a0a:	5e                   	pop    %esi
80101a0b:	5f                   	pop    %edi
80101a0c:	5d                   	pop    %ebp
80101a0d:	c3                   	ret    
80101a0e:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a10:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a14:	66 83 f8 09          	cmp    $0x9,%ax
80101a18:	77 1e                	ja     80101a38 <readi+0xf8>
80101a1a:	8b 04 c5 60 0a 11 80 	mov    -0x7feef5a0(,%eax,8),%eax
80101a21:	85 c0                	test   %eax,%eax
80101a23:	74 13                	je     80101a38 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a25:	89 7d 10             	mov    %edi,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a28:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a2b:	5b                   	pop    %ebx
80101a2c:	5e                   	pop    %esi
80101a2d:	5f                   	pop    %edi
80101a2e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a2f:	ff e0                	jmp    *%eax
80101a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a3d:	eb c7                	jmp    80101a06 <readi+0xc6>
80101a3f:	90                   	nop

80101a40 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a40:	55                   	push   %ebp
80101a41:	89 e5                	mov    %esp,%ebp
80101a43:	57                   	push   %edi
80101a44:	56                   	push   %esi
80101a45:	53                   	push   %ebx
80101a46:	83 ec 1c             	sub    $0x1c,%esp
80101a49:	8b 45 08             	mov    0x8(%ebp),%eax
80101a4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a4f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a52:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a57:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a5d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a60:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a63:	0f 84 b7 00 00 00    	je     80101b20 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a6c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a6f:	0f 82 eb 00 00 00    	jb     80101b60 <writei+0x120>
80101a75:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a78:	89 f8                	mov    %edi,%eax
80101a7a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a7c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a81:	0f 87 d9 00 00 00    	ja     80101b60 <writei+0x120>
80101a87:	39 c6                	cmp    %eax,%esi
80101a89:	0f 87 d1 00 00 00    	ja     80101b60 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a8f:	85 ff                	test   %edi,%edi
80101a91:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a98:	74 78                	je     80101b12 <writei+0xd2>
80101a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aa0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101aa3:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101aa5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aaa:	c1 ea 09             	shr    $0x9,%edx
80101aad:	89 f8                	mov    %edi,%eax
80101aaf:	e8 9c f8 ff ff       	call   80101350 <bmap>
80101ab4:	83 ec 08             	sub    $0x8,%esp
80101ab7:	50                   	push   %eax
80101ab8:	ff 37                	pushl  (%edi)
80101aba:	e8 11 e6 ff ff       	call   801000d0 <bread>
80101abf:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ac1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ac4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ac7:	89 f1                	mov    %esi,%ecx
80101ac9:	83 c4 0c             	add    $0xc,%esp
80101acc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ad2:	29 cb                	sub    %ecx,%ebx
80101ad4:	39 c3                	cmp    %eax,%ebx
80101ad6:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ad9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101add:	53                   	push   %ebx
80101ade:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ae1:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101ae3:	50                   	push   %eax
80101ae4:	e8 17 2a 00 00       	call   80104500 <memmove>
    log_write(bp);
80101ae9:	89 3c 24             	mov    %edi,(%esp)
80101aec:	e8 2f 12 00 00       	call   80102d20 <log_write>
    brelse(bp);
80101af1:	89 3c 24             	mov    %edi,(%esp)
80101af4:	e8 e7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101afc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101aff:	83 c4 10             	add    $0x10,%esp
80101b02:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b05:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b08:	77 96                	ja     80101aa0 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b0d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b10:	77 36                	ja     80101b48 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b12:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b15:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b18:	5b                   	pop    %ebx
80101b19:	5e                   	pop    %esi
80101b1a:	5f                   	pop    %edi
80101b1b:	5d                   	pop    %ebp
80101b1c:	c3                   	ret    
80101b1d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b24:	66 83 f8 09          	cmp    $0x9,%ax
80101b28:	77 36                	ja     80101b60 <writei+0x120>
80101b2a:	8b 04 c5 64 0a 11 80 	mov    -0x7feef59c(,%eax,8),%eax
80101b31:	85 c0                	test   %eax,%eax
80101b33:	74 2b                	je     80101b60 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b35:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b3b:	5b                   	pop    %ebx
80101b3c:	5e                   	pop    %esi
80101b3d:	5f                   	pop    %edi
80101b3e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b3f:	ff e0                	jmp    *%eax
80101b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b48:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b4b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b4e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b51:	50                   	push   %eax
80101b52:	e8 59 fa ff ff       	call   801015b0 <iupdate>
80101b57:	83 c4 10             	add    $0x10,%esp
80101b5a:	eb b6                	jmp    80101b12 <writei+0xd2>
80101b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b65:	eb ae                	jmp    80101b15 <writei+0xd5>
80101b67:	89 f6                	mov    %esi,%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b76:	6a 0e                	push   $0xe
80101b78:	ff 75 0c             	pushl  0xc(%ebp)
80101b7b:	ff 75 08             	pushl  0x8(%ebp)
80101b7e:	e8 fd 29 00 00       	call   80104580 <strncmp>
}
80101b83:	c9                   	leave  
80101b84:	c3                   	ret    
80101b85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b90 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	57                   	push   %edi
80101b94:	56                   	push   %esi
80101b95:	53                   	push   %ebx
80101b96:	83 ec 1c             	sub    $0x1c,%esp
80101b99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101b9c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101ba1:	0f 85 80 00 00 00    	jne    80101c27 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101ba7:	8b 53 58             	mov    0x58(%ebx),%edx
80101baa:	31 ff                	xor    %edi,%edi
80101bac:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101baf:	85 d2                	test   %edx,%edx
80101bb1:	75 0d                	jne    80101bc0 <dirlookup+0x30>
80101bb3:	eb 5b                	jmp    80101c10 <dirlookup+0x80>
80101bb5:	8d 76 00             	lea    0x0(%esi),%esi
80101bb8:	83 c7 10             	add    $0x10,%edi
80101bbb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bbe:	76 50                	jbe    80101c10 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bc0:	6a 10                	push   $0x10
80101bc2:	57                   	push   %edi
80101bc3:	56                   	push   %esi
80101bc4:	53                   	push   %ebx
80101bc5:	e8 76 fd ff ff       	call   80101940 <readi>
80101bca:	83 c4 10             	add    $0x10,%esp
80101bcd:	83 f8 10             	cmp    $0x10,%eax
80101bd0:	75 48                	jne    80101c1a <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101bd2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bd7:	74 df                	je     80101bb8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101bd9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bdc:	83 ec 04             	sub    $0x4,%esp
80101bdf:	6a 0e                	push   $0xe
80101be1:	50                   	push   %eax
80101be2:	ff 75 0c             	pushl  0xc(%ebp)
80101be5:	e8 96 29 00 00       	call   80104580 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101bea:	83 c4 10             	add    $0x10,%esp
80101bed:	85 c0                	test   %eax,%eax
80101bef:	75 c7                	jne    80101bb8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101bf1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bf4:	85 c0                	test   %eax,%eax
80101bf6:	74 05                	je     80101bfd <dirlookup+0x6d>
        *poff = off;
80101bf8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bfb:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101bfd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c01:	8b 03                	mov    (%ebx),%eax
80101c03:	e8 78 f6 ff ff       	call   80101280 <iget>
    }
  }

  return 0;
}
80101c08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c0b:	5b                   	pop    %ebx
80101c0c:	5e                   	pop    %esi
80101c0d:	5f                   	pop    %edi
80101c0e:	5d                   	pop    %ebp
80101c0f:	c3                   	ret    
80101c10:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c13:	31 c0                	xor    %eax,%eax
}
80101c15:	5b                   	pop    %ebx
80101c16:	5e                   	pop    %esi
80101c17:	5f                   	pop    %edi
80101c18:	5d                   	pop    %ebp
80101c19:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101c1a:	83 ec 0c             	sub    $0xc,%esp
80101c1d:	68 b9 71 10 80       	push   $0x801071b9
80101c22:	e8 49 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c27:	83 ec 0c             	sub    $0xc,%esp
80101c2a:	68 a7 71 10 80       	push   $0x801071a7
80101c2f:	e8 3c e7 ff ff       	call   80100370 <panic>
80101c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c40 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c40:	55                   	push   %ebp
80101c41:	89 e5                	mov    %esp,%ebp
80101c43:	57                   	push   %edi
80101c44:	56                   	push   %esi
80101c45:	53                   	push   %ebx
80101c46:	89 cf                	mov    %ecx,%edi
80101c48:	89 c3                	mov    %eax,%ebx
80101c4a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c4d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c50:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c53:	0f 84 53 01 00 00    	je     80101dac <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c59:	e8 42 1b 00 00       	call   801037a0 <myproc>
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c5e:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c61:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c64:	68 e0 0a 11 80       	push   $0x80110ae0
80101c69:	e8 e2 26 00 00       	call   80104350 <acquire>
  ip->ref++;
80101c6e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c72:	c7 04 24 e0 0a 11 80 	movl   $0x80110ae0,(%esp)
80101c79:	e8 82 27 00 00       	call   80104400 <release>
80101c7e:	83 c4 10             	add    $0x10,%esp
80101c81:	eb 08                	jmp    80101c8b <namex+0x4b>
80101c83:	90                   	nop
80101c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101c88:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101c8b:	0f b6 03             	movzbl (%ebx),%eax
80101c8e:	3c 2f                	cmp    $0x2f,%al
80101c90:	74 f6                	je     80101c88 <namex+0x48>
    path++;
  if(*path == 0)
80101c92:	84 c0                	test   %al,%al
80101c94:	0f 84 e3 00 00 00    	je     80101d7d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101c9a:	0f b6 03             	movzbl (%ebx),%eax
80101c9d:	89 da                	mov    %ebx,%edx
80101c9f:	84 c0                	test   %al,%al
80101ca1:	0f 84 ac 00 00 00    	je     80101d53 <namex+0x113>
80101ca7:	3c 2f                	cmp    $0x2f,%al
80101ca9:	75 09                	jne    80101cb4 <namex+0x74>
80101cab:	e9 a3 00 00 00       	jmp    80101d53 <namex+0x113>
80101cb0:	84 c0                	test   %al,%al
80101cb2:	74 0a                	je     80101cbe <namex+0x7e>
    path++;
80101cb4:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cb7:	0f b6 02             	movzbl (%edx),%eax
80101cba:	3c 2f                	cmp    $0x2f,%al
80101cbc:	75 f2                	jne    80101cb0 <namex+0x70>
80101cbe:	89 d1                	mov    %edx,%ecx
80101cc0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101cc2:	83 f9 0d             	cmp    $0xd,%ecx
80101cc5:	0f 8e 8d 00 00 00    	jle    80101d58 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101ccb:	83 ec 04             	sub    $0x4,%esp
80101cce:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cd1:	6a 0e                	push   $0xe
80101cd3:	53                   	push   %ebx
80101cd4:	57                   	push   %edi
80101cd5:	e8 26 28 00 00       	call   80104500 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cda:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101cdd:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101ce0:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101ce2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101ce5:	75 11                	jne    80101cf8 <namex+0xb8>
80101ce7:	89 f6                	mov    %esi,%esi
80101ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101cf0:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cf3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cf6:	74 f8                	je     80101cf0 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101cf8:	83 ec 0c             	sub    $0xc,%esp
80101cfb:	56                   	push   %esi
80101cfc:	e8 5f f9 ff ff       	call   80101660 <ilock>
    if(ip->type != T_DIR){
80101d01:	83 c4 10             	add    $0x10,%esp
80101d04:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d09:	0f 85 7f 00 00 00    	jne    80101d8e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d12:	85 d2                	test   %edx,%edx
80101d14:	74 09                	je     80101d1f <namex+0xdf>
80101d16:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d19:	0f 84 a3 00 00 00    	je     80101dc2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d1f:	83 ec 04             	sub    $0x4,%esp
80101d22:	6a 00                	push   $0x0
80101d24:	57                   	push   %edi
80101d25:	56                   	push   %esi
80101d26:	e8 65 fe ff ff       	call   80101b90 <dirlookup>
80101d2b:	83 c4 10             	add    $0x10,%esp
80101d2e:	85 c0                	test   %eax,%eax
80101d30:	74 5c                	je     80101d8e <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d32:	83 ec 0c             	sub    $0xc,%esp
80101d35:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d38:	56                   	push   %esi
80101d39:	e8 02 fa ff ff       	call   80101740 <iunlock>
  iput(ip);
80101d3e:	89 34 24             	mov    %esi,(%esp)
80101d41:	e8 4a fa ff ff       	call   80101790 <iput>
80101d46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d49:	83 c4 10             	add    $0x10,%esp
80101d4c:	89 c6                	mov    %eax,%esi
80101d4e:	e9 38 ff ff ff       	jmp    80101c8b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d53:	31 c9                	xor    %ecx,%ecx
80101d55:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d58:	83 ec 04             	sub    $0x4,%esp
80101d5b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d5e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d61:	51                   	push   %ecx
80101d62:	53                   	push   %ebx
80101d63:	57                   	push   %edi
80101d64:	e8 97 27 00 00       	call   80104500 <memmove>
    name[len] = 0;
80101d69:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d6c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d6f:	83 c4 10             	add    $0x10,%esp
80101d72:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d76:	89 d3                	mov    %edx,%ebx
80101d78:	e9 65 ff ff ff       	jmp    80101ce2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d7d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d80:	85 c0                	test   %eax,%eax
80101d82:	75 54                	jne    80101dd8 <namex+0x198>
80101d84:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101d86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d89:	5b                   	pop    %ebx
80101d8a:	5e                   	pop    %esi
80101d8b:	5f                   	pop    %edi
80101d8c:	5d                   	pop    %ebp
80101d8d:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d8e:	83 ec 0c             	sub    $0xc,%esp
80101d91:	56                   	push   %esi
80101d92:	e8 a9 f9 ff ff       	call   80101740 <iunlock>
  iput(ip);
80101d97:	89 34 24             	mov    %esi,(%esp)
80101d9a:	e8 f1 f9 ff ff       	call   80101790 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101d9f:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101da2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101da5:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101da7:	5b                   	pop    %ebx
80101da8:	5e                   	pop    %esi
80101da9:	5f                   	pop    %edi
80101daa:	5d                   	pop    %ebp
80101dab:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dac:	ba 01 00 00 00       	mov    $0x1,%edx
80101db1:	b8 01 00 00 00       	mov    $0x1,%eax
80101db6:	e8 c5 f4 ff ff       	call   80101280 <iget>
80101dbb:	89 c6                	mov    %eax,%esi
80101dbd:	e9 c9 fe ff ff       	jmp    80101c8b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101dc2:	83 ec 0c             	sub    $0xc,%esp
80101dc5:	56                   	push   %esi
80101dc6:	e8 75 f9 ff ff       	call   80101740 <iunlock>
      return ip;
80101dcb:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101dd1:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dd3:	5b                   	pop    %ebx
80101dd4:	5e                   	pop    %esi
80101dd5:	5f                   	pop    %edi
80101dd6:	5d                   	pop    %ebp
80101dd7:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101dd8:	83 ec 0c             	sub    $0xc,%esp
80101ddb:	56                   	push   %esi
80101ddc:	e8 af f9 ff ff       	call   80101790 <iput>
    return 0;
80101de1:	83 c4 10             	add    $0x10,%esp
80101de4:	31 c0                	xor    %eax,%eax
80101de6:	eb 9e                	jmp    80101d86 <namex+0x146>
80101de8:	90                   	nop
80101de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101df0 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101df0:	55                   	push   %ebp
80101df1:	89 e5                	mov    %esp,%ebp
80101df3:	57                   	push   %edi
80101df4:	56                   	push   %esi
80101df5:	53                   	push   %ebx
80101df6:	83 ec 20             	sub    $0x20,%esp
80101df9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101dfc:	6a 00                	push   $0x0
80101dfe:	ff 75 0c             	pushl  0xc(%ebp)
80101e01:	53                   	push   %ebx
80101e02:	e8 89 fd ff ff       	call   80101b90 <dirlookup>
80101e07:	83 c4 10             	add    $0x10,%esp
80101e0a:	85 c0                	test   %eax,%eax
80101e0c:	75 67                	jne    80101e75 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e0e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e11:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e14:	85 ff                	test   %edi,%edi
80101e16:	74 29                	je     80101e41 <dirlink+0x51>
80101e18:	31 ff                	xor    %edi,%edi
80101e1a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e1d:	eb 09                	jmp    80101e28 <dirlink+0x38>
80101e1f:	90                   	nop
80101e20:	83 c7 10             	add    $0x10,%edi
80101e23:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e26:	76 19                	jbe    80101e41 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e28:	6a 10                	push   $0x10
80101e2a:	57                   	push   %edi
80101e2b:	56                   	push   %esi
80101e2c:	53                   	push   %ebx
80101e2d:	e8 0e fb ff ff       	call   80101940 <readi>
80101e32:	83 c4 10             	add    $0x10,%esp
80101e35:	83 f8 10             	cmp    $0x10,%eax
80101e38:	75 4e                	jne    80101e88 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e3a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e3f:	75 df                	jne    80101e20 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e41:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e44:	83 ec 04             	sub    $0x4,%esp
80101e47:	6a 0e                	push   $0xe
80101e49:	ff 75 0c             	pushl  0xc(%ebp)
80101e4c:	50                   	push   %eax
80101e4d:	e8 9e 27 00 00       	call   801045f0 <strncpy>
  de.inum = inum;
80101e52:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e55:	6a 10                	push   $0x10
80101e57:	57                   	push   %edi
80101e58:	56                   	push   %esi
80101e59:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e5a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e5e:	e8 dd fb ff ff       	call   80101a40 <writei>
80101e63:	83 c4 20             	add    $0x20,%esp
80101e66:	83 f8 10             	cmp    $0x10,%eax
80101e69:	75 2a                	jne    80101e95 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e6b:	31 c0                	xor    %eax,%eax
}
80101e6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e70:	5b                   	pop    %ebx
80101e71:	5e                   	pop    %esi
80101e72:	5f                   	pop    %edi
80101e73:	5d                   	pop    %ebp
80101e74:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	50                   	push   %eax
80101e79:	e8 12 f9 ff ff       	call   80101790 <iput>
    return -1;
80101e7e:	83 c4 10             	add    $0x10,%esp
80101e81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e86:	eb e5                	jmp    80101e6d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101e88:	83 ec 0c             	sub    $0xc,%esp
80101e8b:	68 c8 71 10 80       	push   $0x801071c8
80101e90:	e8 db e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101e95:	83 ec 0c             	sub    $0xc,%esp
80101e98:	68 06 78 10 80       	push   $0x80107806
80101e9d:	e8 ce e4 ff ff       	call   80100370 <panic>
80101ea2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101eb0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101eb0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101eb1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101eb3:	89 e5                	mov    %esp,%ebp
80101eb5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101eb8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ebb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ebe:	e8 7d fd ff ff       	call   80101c40 <namex>
}
80101ec3:	c9                   	leave  
80101ec4:	c3                   	ret    
80101ec5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ed0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101ed0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ed1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101ed6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101ed8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101edb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101ede:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101edf:	e9 5c fd ff ff       	jmp    80101c40 <namex>
80101ee4:	66 90                	xchg   %ax,%ax
80101ee6:	66 90                	xchg   %ax,%ax
80101ee8:	66 90                	xchg   %ax,%ax
80101eea:	66 90                	xchg   %ax,%ax
80101eec:	66 90                	xchg   %ax,%ax
80101eee:	66 90                	xchg   %ax,%ax

80101ef0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ef0:	55                   	push   %ebp
  if(b == 0)
80101ef1:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	56                   	push   %esi
80101ef6:	53                   	push   %ebx
  if(b == 0)
80101ef7:	0f 84 ad 00 00 00    	je     80101faa <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101efd:	8b 58 08             	mov    0x8(%eax),%ebx
80101f00:	89 c1                	mov    %eax,%ecx
80101f02:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f08:	0f 87 8f 00 00 00    	ja     80101f9d <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f0e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f13:	90                   	nop
80101f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f18:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f19:	83 e0 c0             	and    $0xffffffc0,%eax
80101f1c:	3c 40                	cmp    $0x40,%al
80101f1e:	75 f8                	jne    80101f18 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f20:	31 f6                	xor    %esi,%esi
80101f22:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f27:	89 f0                	mov    %esi,%eax
80101f29:	ee                   	out    %al,(%dx)
80101f2a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f2f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f34:	ee                   	out    %al,(%dx)
80101f35:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f3a:	89 d8                	mov    %ebx,%eax
80101f3c:	ee                   	out    %al,(%dx)
80101f3d:	89 d8                	mov    %ebx,%eax
80101f3f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f44:	c1 f8 08             	sar    $0x8,%eax
80101f47:	ee                   	out    %al,(%dx)
80101f48:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f4d:	89 f0                	mov    %esi,%eax
80101f4f:	ee                   	out    %al,(%dx)
80101f50:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f54:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f59:	83 e0 01             	and    $0x1,%eax
80101f5c:	c1 e0 04             	shl    $0x4,%eax
80101f5f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f62:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101f63:	f6 01 04             	testb  $0x4,(%ecx)
80101f66:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f6b:	75 13                	jne    80101f80 <idestart+0x90>
80101f6d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f72:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f73:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f76:	5b                   	pop    %ebx
80101f77:	5e                   	pop    %esi
80101f78:	5d                   	pop    %ebp
80101f79:	c3                   	ret    
80101f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f80:	b8 30 00 00 00       	mov    $0x30,%eax
80101f85:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101f86:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101f8b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f8e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f93:	fc                   	cld    
80101f94:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f96:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f99:	5b                   	pop    %ebx
80101f9a:	5e                   	pop    %esi
80101f9b:	5d                   	pop    %ebp
80101f9c:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101f9d:	83 ec 0c             	sub    $0xc,%esp
80101fa0:	68 34 72 10 80       	push   $0x80107234
80101fa5:	e8 c6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101faa:	83 ec 0c             	sub    $0xc,%esp
80101fad:	68 2b 72 10 80       	push   $0x8010722b
80101fb2:	e8 b9 e3 ff ff       	call   80100370 <panic>
80101fb7:	89 f6                	mov    %esi,%esi
80101fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fc0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fc0:	55                   	push   %ebp
80101fc1:	89 e5                	mov    %esp,%ebp
80101fc3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101fc6:	68 46 72 10 80       	push   $0x80107246
80101fcb:	68 80 a6 10 80       	push   $0x8010a680
80101fd0:	e8 1b 22 00 00       	call   801041f0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fd5:	58                   	pop    %eax
80101fd6:	a1 00 2e 11 80       	mov    0x80112e00,%eax
80101fdb:	5a                   	pop    %edx
80101fdc:	83 e8 01             	sub    $0x1,%eax
80101fdf:	50                   	push   %eax
80101fe0:	6a 0e                	push   $0xe
80101fe2:	e8 a9 02 00 00       	call   80102290 <ioapicenable>
80101fe7:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fea:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fef:	90                   	nop
80101ff0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101ff1:	83 e0 c0             	and    $0xffffffc0,%eax
80101ff4:	3c 40                	cmp    $0x40,%al
80101ff6:	75 f8                	jne    80101ff0 <ideinit+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101ff8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101ffd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102002:	ee                   	out    %al,(%dx)
80102003:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102008:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010200d:	eb 06                	jmp    80102015 <ideinit+0x55>
8010200f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102010:	83 e9 01             	sub    $0x1,%ecx
80102013:	74 0f                	je     80102024 <ideinit+0x64>
80102015:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102016:	84 c0                	test   %al,%al
80102018:	74 f6                	je     80102010 <ideinit+0x50>
      havedisk1 = 1;
8010201a:	c7 05 60 a6 10 80 01 	movl   $0x1,0x8010a660
80102021:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102024:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102029:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010202e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010202f:	c9                   	leave  
80102030:	c3                   	ret    
80102031:	eb 0d                	jmp    80102040 <ideintr>
80102033:	90                   	nop
80102034:	90                   	nop
80102035:	90                   	nop
80102036:	90                   	nop
80102037:	90                   	nop
80102038:	90                   	nop
80102039:	90                   	nop
8010203a:	90                   	nop
8010203b:	90                   	nop
8010203c:	90                   	nop
8010203d:	90                   	nop
8010203e:	90                   	nop
8010203f:	90                   	nop

80102040 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	57                   	push   %edi
80102044:	56                   	push   %esi
80102045:	53                   	push   %ebx
80102046:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102049:	68 80 a6 10 80       	push   $0x8010a680
8010204e:	e8 fd 22 00 00       	call   80104350 <acquire>

  if((b = idequeue) == 0){
80102053:	8b 1d 64 a6 10 80    	mov    0x8010a664,%ebx
80102059:	83 c4 10             	add    $0x10,%esp
8010205c:	85 db                	test   %ebx,%ebx
8010205e:	74 34                	je     80102094 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102060:	8b 43 58             	mov    0x58(%ebx),%eax
80102063:	a3 64 a6 10 80       	mov    %eax,0x8010a664

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102068:	8b 33                	mov    (%ebx),%esi
8010206a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102070:	74 3e                	je     801020b0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102072:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102075:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102078:	83 ce 02             	or     $0x2,%esi
8010207b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010207d:	53                   	push   %ebx
8010207e:	e8 8d 1e 00 00       	call   80103f10 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102083:	a1 64 a6 10 80       	mov    0x8010a664,%eax
80102088:	83 c4 10             	add    $0x10,%esp
8010208b:	85 c0                	test   %eax,%eax
8010208d:	74 05                	je     80102094 <ideintr+0x54>
    idestart(idequeue);
8010208f:	e8 5c fe ff ff       	call   80101ef0 <idestart>

  // First queued buffer is the active request.
  acquire(&idelock);

  if((b = idequeue) == 0){
    release(&idelock);
80102094:	83 ec 0c             	sub    $0xc,%esp
80102097:	68 80 a6 10 80       	push   $0x8010a680
8010209c:	e8 5f 23 00 00       	call   80104400 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020a4:	5b                   	pop    %ebx
801020a5:	5e                   	pop    %esi
801020a6:	5f                   	pop    %edi
801020a7:	5d                   	pop    %ebp
801020a8:	c3                   	ret    
801020a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020b0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020b5:	8d 76 00             	lea    0x0(%esi),%esi
801020b8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020b9:	89 c1                	mov    %eax,%ecx
801020bb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020be:	80 f9 40             	cmp    $0x40,%cl
801020c1:	75 f5                	jne    801020b8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020c3:	a8 21                	test   $0x21,%al
801020c5:	75 ab                	jne    80102072 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020c7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020ca:	b9 80 00 00 00       	mov    $0x80,%ecx
801020cf:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020d4:	fc                   	cld    
801020d5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020d7:	8b 33                	mov    (%ebx),%esi
801020d9:	eb 97                	jmp    80102072 <ideintr+0x32>
801020db:	90                   	nop
801020dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020e0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020e0:	55                   	push   %ebp
801020e1:	89 e5                	mov    %esp,%ebp
801020e3:	53                   	push   %ebx
801020e4:	83 ec 10             	sub    $0x10,%esp
801020e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020ea:	8d 43 0c             	lea    0xc(%ebx),%eax
801020ed:	50                   	push   %eax
801020ee:	e8 ad 20 00 00       	call   801041a0 <holdingsleep>
801020f3:	83 c4 10             	add    $0x10,%esp
801020f6:	85 c0                	test   %eax,%eax
801020f8:	0f 84 ad 00 00 00    	je     801021ab <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801020fe:	8b 03                	mov    (%ebx),%eax
80102100:	83 e0 06             	and    $0x6,%eax
80102103:	83 f8 02             	cmp    $0x2,%eax
80102106:	0f 84 b9 00 00 00    	je     801021c5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010210c:	8b 53 04             	mov    0x4(%ebx),%edx
8010210f:	85 d2                	test   %edx,%edx
80102111:	74 0d                	je     80102120 <iderw+0x40>
80102113:	a1 60 a6 10 80       	mov    0x8010a660,%eax
80102118:	85 c0                	test   %eax,%eax
8010211a:	0f 84 98 00 00 00    	je     801021b8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102120:	83 ec 0c             	sub    $0xc,%esp
80102123:	68 80 a6 10 80       	push   $0x8010a680
80102128:	e8 23 22 00 00       	call   80104350 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010212d:	8b 15 64 a6 10 80    	mov    0x8010a664,%edx
80102133:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102136:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010213d:	85 d2                	test   %edx,%edx
8010213f:	75 09                	jne    8010214a <iderw+0x6a>
80102141:	eb 58                	jmp    8010219b <iderw+0xbb>
80102143:	90                   	nop
80102144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102148:	89 c2                	mov    %eax,%edx
8010214a:	8b 42 58             	mov    0x58(%edx),%eax
8010214d:	85 c0                	test   %eax,%eax
8010214f:	75 f7                	jne    80102148 <iderw+0x68>
80102151:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102154:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102156:	3b 1d 64 a6 10 80    	cmp    0x8010a664,%ebx
8010215c:	74 44                	je     801021a2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010215e:	8b 03                	mov    (%ebx),%eax
80102160:	83 e0 06             	and    $0x6,%eax
80102163:	83 f8 02             	cmp    $0x2,%eax
80102166:	74 23                	je     8010218b <iderw+0xab>
80102168:	90                   	nop
80102169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102170:	83 ec 08             	sub    $0x8,%esp
80102173:	68 80 a6 10 80       	push   $0x8010a680
80102178:	53                   	push   %ebx
80102179:	e8 d2 1b 00 00       	call   80103d50 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010217e:	8b 03                	mov    (%ebx),%eax
80102180:	83 c4 10             	add    $0x10,%esp
80102183:	83 e0 06             	and    $0x6,%eax
80102186:	83 f8 02             	cmp    $0x2,%eax
80102189:	75 e5                	jne    80102170 <iderw+0x90>
    sleep(b, &idelock);
  }


  release(&idelock);
8010218b:	c7 45 08 80 a6 10 80 	movl   $0x8010a680,0x8(%ebp)
}
80102192:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102195:	c9                   	leave  
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
80102196:	e9 65 22 00 00       	jmp    80104400 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010219b:	ba 64 a6 10 80       	mov    $0x8010a664,%edx
801021a0:	eb b2                	jmp    80102154 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021a2:	89 d8                	mov    %ebx,%eax
801021a4:	e8 47 fd ff ff       	call   80101ef0 <idestart>
801021a9:	eb b3                	jmp    8010215e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021ab:	83 ec 0c             	sub    $0xc,%esp
801021ae:	68 4a 72 10 80       	push   $0x8010724a
801021b3:	e8 b8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021b8:	83 ec 0c             	sub    $0xc,%esp
801021bb:	68 75 72 10 80       	push   $0x80107275
801021c0:	e8 ab e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021c5:	83 ec 0c             	sub    $0xc,%esp
801021c8:	68 60 72 10 80       	push   $0x80107260
801021cd:	e8 9e e1 ff ff       	call   80100370 <panic>
801021d2:	66 90                	xchg   %ax,%ax
801021d4:	66 90                	xchg   %ax,%ax
801021d6:	66 90                	xchg   %ax,%ax
801021d8:	66 90                	xchg   %ax,%ax
801021da:	66 90                	xchg   %ax,%ax
801021dc:	66 90                	xchg   %ax,%ax
801021de:	66 90                	xchg   %ax,%ax

801021e0 <ioapicinit>:
801021e0:	55                   	push   %ebp
801021e1:	c7 05 34 27 11 80 00 	movl   $0xfec00000,0x80112734
801021e8:	00 c0 fe 
801021eb:	89 e5                	mov    %esp,%ebp
801021ed:	56                   	push   %esi
801021ee:	53                   	push   %ebx
801021ef:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021f6:	00 00 00 
801021f9:	8b 15 34 27 11 80    	mov    0x80112734,%edx
801021ff:	8b 72 10             	mov    0x10(%edx),%esi
80102202:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102208:	8b 0d 34 27 11 80    	mov    0x80112734,%ecx
8010220e:	0f b6 15 60 28 11 80 	movzbl 0x80112860,%edx
80102215:	89 f0                	mov    %esi,%eax
80102217:	c1 e8 10             	shr    $0x10,%eax
8010221a:	0f b6 f0             	movzbl %al,%esi
8010221d:	8b 41 10             	mov    0x10(%ecx),%eax
80102220:	c1 e8 18             	shr    $0x18,%eax
80102223:	39 d0                	cmp    %edx,%eax
80102225:	74 16                	je     8010223d <ioapicinit+0x5d>
80102227:	83 ec 0c             	sub    $0xc,%esp
8010222a:	68 94 72 10 80       	push   $0x80107294
8010222f:	e8 2c e4 ff ff       	call   80100660 <cprintf>
80102234:	8b 0d 34 27 11 80    	mov    0x80112734,%ecx
8010223a:	83 c4 10             	add    $0x10,%esp
8010223d:	83 c6 21             	add    $0x21,%esi
80102240:	ba 10 00 00 00       	mov    $0x10,%edx
80102245:	b8 20 00 00 00       	mov    $0x20,%eax
8010224a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102250:	89 11                	mov    %edx,(%ecx)
80102252:	8b 0d 34 27 11 80    	mov    0x80112734,%ecx
80102258:	89 c3                	mov    %eax,%ebx
8010225a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102260:	83 c0 01             	add    $0x1,%eax
80102263:	89 59 10             	mov    %ebx,0x10(%ecx)
80102266:	8d 5a 01             	lea    0x1(%edx),%ebx
80102269:	83 c2 02             	add    $0x2,%edx
8010226c:	39 f0                	cmp    %esi,%eax
8010226e:	89 19                	mov    %ebx,(%ecx)
80102270:	8b 0d 34 27 11 80    	mov    0x80112734,%ecx
80102276:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010227d:	75 d1                	jne    80102250 <ioapicinit+0x70>
8010227f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102282:	5b                   	pop    %ebx
80102283:	5e                   	pop    %esi
80102284:	5d                   	pop    %ebp
80102285:	c3                   	ret    
80102286:	8d 76 00             	lea    0x0(%esi),%esi
80102289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102290 <ioapicenable>:
80102290:	55                   	push   %ebp
80102291:	8b 0d 34 27 11 80    	mov    0x80112734,%ecx
80102297:	89 e5                	mov    %esp,%ebp
80102299:	8b 45 08             	mov    0x8(%ebp),%eax
8010229c:	8d 50 20             	lea    0x20(%eax),%edx
8010229f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022a3:	89 01                	mov    %eax,(%ecx)
801022a5:	8b 0d 34 27 11 80    	mov    0x80112734,%ecx
801022ab:	83 c0 01             	add    $0x1,%eax
801022ae:	89 51 10             	mov    %edx,0x10(%ecx)
801022b1:	8b 55 0c             	mov    0xc(%ebp),%edx
801022b4:	89 01                	mov    %eax,(%ecx)
801022b6:	a1 34 27 11 80       	mov    0x80112734,%eax
801022bb:	c1 e2 18             	shl    $0x18,%edx
801022be:	89 50 10             	mov    %edx,0x10(%eax)
801022c1:	5d                   	pop    %ebp
801022c2:	c3                   	ret    
801022c3:	66 90                	xchg   %ax,%ax
801022c5:	66 90                	xchg   %ax,%ax
801022c7:	66 90                	xchg   %ax,%ax
801022c9:	66 90                	xchg   %ax,%ax
801022cb:	66 90                	xchg   %ax,%ax
801022cd:	66 90                	xchg   %ax,%ax
801022cf:	90                   	nop

801022d0 <kfree>:
801022d0:	55                   	push   %ebp
801022d1:	89 e5                	mov    %esp,%ebp
801022d3:	53                   	push   %ebx
801022d4:	83 ec 04             	sub    $0x4,%esp
801022d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022da:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022e0:	75 70                	jne    80102352 <kfree+0x82>
801022e2:	81 fb a8 57 11 80    	cmp    $0x801157a8,%ebx
801022e8:	72 68                	jb     80102352 <kfree+0x82>
801022ea:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022f0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022f5:	77 5b                	ja     80102352 <kfree+0x82>
801022f7:	83 ec 04             	sub    $0x4,%esp
801022fa:	68 00 10 00 00       	push   $0x1000
801022ff:	6a 01                	push   $0x1
80102301:	53                   	push   %ebx
80102302:	e8 49 21 00 00       	call   80104450 <memset>
80102307:	8b 15 74 27 11 80    	mov    0x80112774,%edx
8010230d:	83 c4 10             	add    $0x10,%esp
80102310:	85 d2                	test   %edx,%edx
80102312:	75 2c                	jne    80102340 <kfree+0x70>
80102314:	a1 78 27 11 80       	mov    0x80112778,%eax
80102319:	89 03                	mov    %eax,(%ebx)
8010231b:	a1 74 27 11 80       	mov    0x80112774,%eax
80102320:	89 1d 78 27 11 80    	mov    %ebx,0x80112778
80102326:	85 c0                	test   %eax,%eax
80102328:	75 06                	jne    80102330 <kfree+0x60>
8010232a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232d:	c9                   	leave  
8010232e:	c3                   	ret    
8010232f:	90                   	nop
80102330:	c7 45 08 40 27 11 80 	movl   $0x80112740,0x8(%ebp)
80102337:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233a:	c9                   	leave  
8010233b:	e9 c0 20 00 00       	jmp    80104400 <release>
80102340:	83 ec 0c             	sub    $0xc,%esp
80102343:	68 40 27 11 80       	push   $0x80112740
80102348:	e8 03 20 00 00       	call   80104350 <acquire>
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	eb c2                	jmp    80102314 <kfree+0x44>
80102352:	83 ec 0c             	sub    $0xc,%esp
80102355:	68 c6 72 10 80       	push   $0x801072c6
8010235a:	e8 11 e0 ff ff       	call   80100370 <panic>
8010235f:	90                   	nop

80102360 <freerange>:
80102360:	55                   	push   %ebp
80102361:	89 e5                	mov    %esp,%ebp
80102363:	56                   	push   %esi
80102364:	53                   	push   %ebx
80102365:	8b 45 08             	mov    0x8(%ebp),%eax
80102368:	8b 75 0c             	mov    0xc(%ebp),%esi
8010236b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102371:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102377:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010237d:	39 de                	cmp    %ebx,%esi
8010237f:	72 23                	jb     801023a4 <freerange+0x44>
80102381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102388:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010238e:	83 ec 0c             	sub    $0xc,%esp
80102391:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102397:	50                   	push   %eax
80102398:	e8 33 ff ff ff       	call   801022d0 <kfree>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 f3                	cmp    %esi,%ebx
801023a2:	76 e4                	jbe    80102388 <freerange+0x28>
801023a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023a7:	5b                   	pop    %ebx
801023a8:	5e                   	pop    %esi
801023a9:	5d                   	pop    %ebp
801023aa:	c3                   	ret    
801023ab:	90                   	nop
801023ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023b0 <kinit1>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023b8:	83 ec 08             	sub    $0x8,%esp
801023bb:	68 cc 72 10 80       	push   $0x801072cc
801023c0:	68 40 27 11 80       	push   $0x80112740
801023c5:	e8 26 1e 00 00       	call   801041f0 <initlock>
801023ca:	8b 45 08             	mov    0x8(%ebp),%eax
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	c7 05 74 27 11 80 00 	movl   $0x0,0x80112774
801023d7:	00 00 00 
801023da:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023e0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ec:	39 de                	cmp    %ebx,%esi
801023ee:	72 1c                	jb     8010240c <kinit1+0x5c>
801023f0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023f6:	83 ec 0c             	sub    $0xc,%esp
801023f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ff:	50                   	push   %eax
80102400:	e8 cb fe ff ff       	call   801022d0 <kfree>
80102405:	83 c4 10             	add    $0x10,%esp
80102408:	39 de                	cmp    %ebx,%esi
8010240a:	73 e4                	jae    801023f0 <kinit1+0x40>
8010240c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010240f:	5b                   	pop    %ebx
80102410:	5e                   	pop    %esi
80102411:	5d                   	pop    %ebp
80102412:	c3                   	ret    
80102413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102420 <kinit2>:
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx
80102425:	8b 45 08             	mov    0x8(%ebp),%eax
80102428:	8b 75 0c             	mov    0xc(%ebp),%esi
8010242b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102431:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102437:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243d:	39 de                	cmp    %ebx,%esi
8010243f:	72 23                	jb     80102464 <kinit2+0x44>
80102441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102448:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010244e:	83 ec 0c             	sub    $0xc,%esp
80102451:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102457:	50                   	push   %eax
80102458:	e8 73 fe ff ff       	call   801022d0 <kfree>
8010245d:	83 c4 10             	add    $0x10,%esp
80102460:	39 de                	cmp    %ebx,%esi
80102462:	73 e4                	jae    80102448 <kinit2+0x28>
80102464:	c7 05 74 27 11 80 01 	movl   $0x1,0x80112774
8010246b:	00 00 00 
8010246e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102471:	5b                   	pop    %ebx
80102472:	5e                   	pop    %esi
80102473:	5d                   	pop    %ebp
80102474:	c3                   	ret    
80102475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102480 <kalloc>:
80102480:	55                   	push   %ebp
80102481:	89 e5                	mov    %esp,%ebp
80102483:	53                   	push   %ebx
80102484:	83 ec 04             	sub    $0x4,%esp
80102487:	a1 74 27 11 80       	mov    0x80112774,%eax
8010248c:	85 c0                	test   %eax,%eax
8010248e:	75 30                	jne    801024c0 <kalloc+0x40>
80102490:	8b 1d 78 27 11 80    	mov    0x80112778,%ebx
80102496:	85 db                	test   %ebx,%ebx
80102498:	74 1c                	je     801024b6 <kalloc+0x36>
8010249a:	8b 13                	mov    (%ebx),%edx
8010249c:	89 15 78 27 11 80    	mov    %edx,0x80112778
801024a2:	85 c0                	test   %eax,%eax
801024a4:	74 10                	je     801024b6 <kalloc+0x36>
801024a6:	83 ec 0c             	sub    $0xc,%esp
801024a9:	68 40 27 11 80       	push   $0x80112740
801024ae:	e8 4d 1f 00 00       	call   80104400 <release>
801024b3:	83 c4 10             	add    $0x10,%esp
801024b6:	89 d8                	mov    %ebx,%eax
801024b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bb:	c9                   	leave  
801024bc:	c3                   	ret    
801024bd:	8d 76 00             	lea    0x0(%esi),%esi
801024c0:	83 ec 0c             	sub    $0xc,%esp
801024c3:	68 40 27 11 80       	push   $0x80112740
801024c8:	e8 83 1e 00 00       	call   80104350 <acquire>
801024cd:	8b 1d 78 27 11 80    	mov    0x80112778,%ebx
801024d3:	83 c4 10             	add    $0x10,%esp
801024d6:	a1 74 27 11 80       	mov    0x80112774,%eax
801024db:	85 db                	test   %ebx,%ebx
801024dd:	75 bb                	jne    8010249a <kalloc+0x1a>
801024df:	eb c1                	jmp    801024a2 <kalloc+0x22>
801024e1:	66 90                	xchg   %ax,%ax
801024e3:	66 90                	xchg   %ax,%ax
801024e5:	66 90                	xchg   %ax,%ax
801024e7:	66 90                	xchg   %ax,%ax
801024e9:	66 90                	xchg   %ax,%ax
801024eb:	66 90                	xchg   %ax,%ax
801024ed:	66 90                	xchg   %ax,%ax
801024ef:	90                   	nop

801024f0 <kbdgetc>:
801024f0:	55                   	push   %ebp
801024f1:	ba 64 00 00 00       	mov    $0x64,%edx
801024f6:	89 e5                	mov    %esp,%ebp
801024f8:	ec                   	in     (%dx),%al
801024f9:	a8 01                	test   $0x1,%al
801024fb:	0f 84 af 00 00 00    	je     801025b0 <kbdgetc+0xc0>
80102501:	ba 60 00 00 00       	mov    $0x60,%edx
80102506:	ec                   	in     (%dx),%al
80102507:	0f b6 d0             	movzbl %al,%edx
8010250a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102510:	74 7e                	je     80102590 <kbdgetc+0xa0>
80102512:	84 c0                	test   %al,%al
80102514:	8b 0d b4 a6 10 80    	mov    0x8010a6b4,%ecx
8010251a:	79 24                	jns    80102540 <kbdgetc+0x50>
8010251c:	f6 c1 40             	test   $0x40,%cl
8010251f:	75 05                	jne    80102526 <kbdgetc+0x36>
80102521:	89 c2                	mov    %eax,%edx
80102523:	83 e2 7f             	and    $0x7f,%edx
80102526:	0f b6 82 00 74 10 80 	movzbl -0x7fef8c00(%edx),%eax
8010252d:	83 c8 40             	or     $0x40,%eax
80102530:	0f b6 c0             	movzbl %al,%eax
80102533:	f7 d0                	not    %eax
80102535:	21 c8                	and    %ecx,%eax
80102537:	a3 b4 a6 10 80       	mov    %eax,0x8010a6b4
8010253c:	31 c0                	xor    %eax,%eax
8010253e:	5d                   	pop    %ebp
8010253f:	c3                   	ret    
80102540:	f6 c1 40             	test   $0x40,%cl
80102543:	74 09                	je     8010254e <kbdgetc+0x5e>
80102545:	83 c8 80             	or     $0xffffff80,%eax
80102548:	83 e1 bf             	and    $0xffffffbf,%ecx
8010254b:	0f b6 d0             	movzbl %al,%edx
8010254e:	0f b6 82 00 74 10 80 	movzbl -0x7fef8c00(%edx),%eax
80102555:	09 c1                	or     %eax,%ecx
80102557:	0f b6 82 00 73 10 80 	movzbl -0x7fef8d00(%edx),%eax
8010255e:	31 c1                	xor    %eax,%ecx
80102560:	89 c8                	mov    %ecx,%eax
80102562:	89 0d b4 a6 10 80    	mov    %ecx,0x8010a6b4
80102568:	83 e0 03             	and    $0x3,%eax
8010256b:	83 e1 08             	and    $0x8,%ecx
8010256e:	8b 04 85 e0 72 10 80 	mov    -0x7fef8d20(,%eax,4),%eax
80102575:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102579:	74 c3                	je     8010253e <kbdgetc+0x4e>
8010257b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010257e:	83 fa 19             	cmp    $0x19,%edx
80102581:	77 1d                	ja     801025a0 <kbdgetc+0xb0>
80102583:	83 e8 20             	sub    $0x20,%eax
80102586:	5d                   	pop    %ebp
80102587:	c3                   	ret    
80102588:	90                   	nop
80102589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102590:	31 c0                	xor    %eax,%eax
80102592:	83 0d b4 a6 10 80 40 	orl    $0x40,0x8010a6b4
80102599:	5d                   	pop    %ebp
8010259a:	c3                   	ret    
8010259b:	90                   	nop
8010259c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025a0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025a3:	8d 50 20             	lea    0x20(%eax),%edx
801025a6:	5d                   	pop    %ebp
801025a7:	83 f9 19             	cmp    $0x19,%ecx
801025aa:	0f 46 c2             	cmovbe %edx,%eax
801025ad:	c3                   	ret    
801025ae:	66 90                	xchg   %ax,%ax
801025b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025b5:	5d                   	pop    %ebp
801025b6:	c3                   	ret    
801025b7:	89 f6                	mov    %esi,%esi
801025b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025c0 <kbdintr>:
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	83 ec 14             	sub    $0x14,%esp
801025c6:	68 f0 24 10 80       	push   $0x801024f0
801025cb:	e8 20 e2 ff ff       	call   801007f0 <consoleintr>
801025d0:	83 c4 10             	add    $0x10,%esp
801025d3:	c9                   	leave  
801025d4:	c3                   	ret    
801025d5:	66 90                	xchg   %ax,%ax
801025d7:	66 90                	xchg   %ax,%ax
801025d9:	66 90                	xchg   %ax,%ax
801025db:	66 90                	xchg   %ax,%ax
801025dd:	66 90                	xchg   %ax,%ax
801025df:	90                   	nop

801025e0 <lapicinit>:
801025e0:	a1 7c 27 11 80       	mov    0x8011277c,%eax
801025e5:	55                   	push   %ebp
801025e6:	89 e5                	mov    %esp,%ebp
801025e8:	85 c0                	test   %eax,%eax
801025ea:	0f 84 c8 00 00 00    	je     801026b8 <lapicinit+0xd8>
801025f0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025f7:	01 00 00 
801025fa:	8b 50 20             	mov    0x20(%eax),%edx
801025fd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102604:	00 00 00 
80102607:	8b 50 20             	mov    0x20(%eax),%edx
8010260a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102611:	00 02 00 
80102614:	8b 50 20             	mov    0x20(%eax),%edx
80102617:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010261e:	96 98 00 
80102621:	8b 50 20             	mov    0x20(%eax),%edx
80102624:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010262b:	00 01 00 
8010262e:	8b 50 20             	mov    0x20(%eax),%edx
80102631:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102638:	00 01 00 
8010263b:	8b 50 20             	mov    0x20(%eax),%edx
8010263e:	8b 50 30             	mov    0x30(%eax),%edx
80102641:	c1 ea 10             	shr    $0x10,%edx
80102644:	80 fa 03             	cmp    $0x3,%dl
80102647:	77 77                	ja     801026c0 <lapicinit+0xe0>
80102649:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102650:	00 00 00 
80102653:	8b 50 20             	mov    0x20(%eax),%edx
80102656:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010265d:	00 00 00 
80102660:	8b 50 20             	mov    0x20(%eax),%edx
80102663:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266a:	00 00 00 
8010266d:	8b 50 20             	mov    0x20(%eax),%edx
80102670:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102677:	00 00 00 
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
8010267d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102684:	00 00 00 
80102687:	8b 50 20             	mov    0x20(%eax),%edx
8010268a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102691:	85 08 00 
80102694:	8b 50 20             	mov    0x20(%eax),%edx
80102697:	89 f6                	mov    %esi,%esi
80102699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026a0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026a6:	80 e6 10             	and    $0x10,%dh
801026a9:	75 f5                	jne    801026a0 <lapicinit+0xc0>
801026ab:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026b2:	00 00 00 
801026b5:	8b 40 20             	mov    0x20(%eax),%eax
801026b8:	5d                   	pop    %ebp
801026b9:	c3                   	ret    
801026ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026c0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026c7:	00 01 00 
801026ca:	8b 50 20             	mov    0x20(%eax),%edx
801026cd:	e9 77 ff ff ff       	jmp    80102649 <lapicinit+0x69>
801026d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026e0 <lapicid>:
801026e0:	a1 7c 27 11 80       	mov    0x8011277c,%eax
801026e5:	55                   	push   %ebp
801026e6:	89 e5                	mov    %esp,%ebp
801026e8:	85 c0                	test   %eax,%eax
801026ea:	74 0c                	je     801026f8 <lapicid+0x18>
801026ec:	8b 40 20             	mov    0x20(%eax),%eax
801026ef:	5d                   	pop    %ebp
801026f0:	c1 e8 18             	shr    $0x18,%eax
801026f3:	c3                   	ret    
801026f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801026f8:	31 c0                	xor    %eax,%eax
801026fa:	5d                   	pop    %ebp
801026fb:	c3                   	ret    
801026fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102700 <lapiceoi>:
80102700:	a1 7c 27 11 80       	mov    0x8011277c,%eax
80102705:	55                   	push   %ebp
80102706:	89 e5                	mov    %esp,%ebp
80102708:	85 c0                	test   %eax,%eax
8010270a:	74 0d                	je     80102719 <lapiceoi+0x19>
8010270c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102713:	00 00 00 
80102716:	8b 40 20             	mov    0x20(%eax),%eax
80102719:	5d                   	pop    %ebp
8010271a:	c3                   	ret    
8010271b:	90                   	nop
8010271c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102720 <microdelay>:
80102720:	55                   	push   %ebp
80102721:	89 e5                	mov    %esp,%ebp
80102723:	5d                   	pop    %ebp
80102724:	c3                   	ret    
80102725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102730 <lapicstartap>:
80102730:	55                   	push   %ebp
80102731:	ba 70 00 00 00       	mov    $0x70,%edx
80102736:	b8 0f 00 00 00       	mov    $0xf,%eax
8010273b:	89 e5                	mov    %esp,%ebp
8010273d:	53                   	push   %ebx
8010273e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102741:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102744:	ee                   	out    %al,(%dx)
80102745:	ba 71 00 00 00       	mov    $0x71,%edx
8010274a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010274f:	ee                   	out    %al,(%dx)
80102750:	31 c0                	xor    %eax,%eax
80102752:	c1 e3 18             	shl    $0x18,%ebx
80102755:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010275b:	89 c8                	mov    %ecx,%eax
8010275d:	c1 e9 0c             	shr    $0xc,%ecx
80102760:	c1 e8 04             	shr    $0x4,%eax
80102763:	89 da                	mov    %ebx,%edx
80102765:	80 cd 06             	or     $0x6,%ch
80102768:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010276e:	a1 7c 27 11 80       	mov    0x8011277c,%eax
80102773:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102779:	8b 58 20             	mov    0x20(%eax),%ebx
8010277c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102783:	c5 00 00 
80102786:	8b 58 20             	mov    0x20(%eax),%ebx
80102789:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102790:	85 00 00 
80102793:	8b 58 20             	mov    0x20(%eax),%ebx
80102796:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010279c:	8b 58 20             	mov    0x20(%eax),%ebx
8010279f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027a5:	8b 58 20             	mov    0x20(%eax),%ebx
801027a8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ae:	8b 50 20             	mov    0x20(%eax),%edx
801027b1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027b7:	8b 40 20             	mov    0x20(%eax),%eax
801027ba:	5b                   	pop    %ebx
801027bb:	5d                   	pop    %ebp
801027bc:	c3                   	ret    
801027bd:	8d 76 00             	lea    0x0(%esi),%esi

801027c0 <cmostime>:
801027c0:	55                   	push   %ebp
801027c1:	ba 70 00 00 00       	mov    $0x70,%edx
801027c6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027cb:	89 e5                	mov    %esp,%ebp
801027cd:	57                   	push   %edi
801027ce:	56                   	push   %esi
801027cf:	53                   	push   %ebx
801027d0:	83 ec 4c             	sub    $0x4c,%esp
801027d3:	ee                   	out    %al,(%dx)
801027d4:	ba 71 00 00 00       	mov    $0x71,%edx
801027d9:	ec                   	in     (%dx),%al
801027da:	83 e0 04             	and    $0x4,%eax
801027dd:	8d 75 d0             	lea    -0x30(%ebp),%esi
801027e0:	31 db                	xor    %ebx,%ebx
801027e2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027e5:	bf 70 00 00 00       	mov    $0x70,%edi
801027ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801027f0:	89 d8                	mov    %ebx,%eax
801027f2:	89 fa                	mov    %edi,%edx
801027f4:	ee                   	out    %al,(%dx)
801027f5:	b9 71 00 00 00       	mov    $0x71,%ecx
801027fa:	89 ca                	mov    %ecx,%edx
801027fc:	ec                   	in     (%dx),%al
801027fd:	0f b6 c0             	movzbl %al,%eax
80102800:	89 fa                	mov    %edi,%edx
80102802:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102805:	b8 02 00 00 00       	mov    $0x2,%eax
8010280a:	ee                   	out    %al,(%dx)
8010280b:	89 ca                	mov    %ecx,%edx
8010280d:	ec                   	in     (%dx),%al
8010280e:	0f b6 c0             	movzbl %al,%eax
80102811:	89 fa                	mov    %edi,%edx
80102813:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102816:	b8 04 00 00 00       	mov    $0x4,%eax
8010281b:	ee                   	out    %al,(%dx)
8010281c:	89 ca                	mov    %ecx,%edx
8010281e:	ec                   	in     (%dx),%al
8010281f:	0f b6 c0             	movzbl %al,%eax
80102822:	89 fa                	mov    %edi,%edx
80102824:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102827:	b8 07 00 00 00       	mov    $0x7,%eax
8010282c:	ee                   	out    %al,(%dx)
8010282d:	89 ca                	mov    %ecx,%edx
8010282f:	ec                   	in     (%dx),%al
80102830:	0f b6 c0             	movzbl %al,%eax
80102833:	89 fa                	mov    %edi,%edx
80102835:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102838:	b8 08 00 00 00       	mov    $0x8,%eax
8010283d:	ee                   	out    %al,(%dx)
8010283e:	89 ca                	mov    %ecx,%edx
80102840:	ec                   	in     (%dx),%al
80102841:	0f b6 c0             	movzbl %al,%eax
80102844:	89 fa                	mov    %edi,%edx
80102846:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102849:	b8 09 00 00 00       	mov    $0x9,%eax
8010284e:	ee                   	out    %al,(%dx)
8010284f:	89 ca                	mov    %ecx,%edx
80102851:	ec                   	in     (%dx),%al
80102852:	0f b6 c0             	movzbl %al,%eax
80102855:	89 fa                	mov    %edi,%edx
80102857:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010285a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010285f:	ee                   	out    %al,(%dx)
80102860:	89 ca                	mov    %ecx,%edx
80102862:	ec                   	in     (%dx),%al
80102863:	84 c0                	test   %al,%al
80102865:	78 89                	js     801027f0 <cmostime+0x30>
80102867:	89 d8                	mov    %ebx,%eax
80102869:	89 fa                	mov    %edi,%edx
8010286b:	ee                   	out    %al,(%dx)
8010286c:	89 ca                	mov    %ecx,%edx
8010286e:	ec                   	in     (%dx),%al
8010286f:	0f b6 c0             	movzbl %al,%eax
80102872:	89 fa                	mov    %edi,%edx
80102874:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102877:	b8 02 00 00 00       	mov    $0x2,%eax
8010287c:	ee                   	out    %al,(%dx)
8010287d:	89 ca                	mov    %ecx,%edx
8010287f:	ec                   	in     (%dx),%al
80102880:	0f b6 c0             	movzbl %al,%eax
80102883:	89 fa                	mov    %edi,%edx
80102885:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102888:	b8 04 00 00 00       	mov    $0x4,%eax
8010288d:	ee                   	out    %al,(%dx)
8010288e:	89 ca                	mov    %ecx,%edx
80102890:	ec                   	in     (%dx),%al
80102891:	0f b6 c0             	movzbl %al,%eax
80102894:	89 fa                	mov    %edi,%edx
80102896:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102899:	b8 07 00 00 00       	mov    $0x7,%eax
8010289e:	ee                   	out    %al,(%dx)
8010289f:	89 ca                	mov    %ecx,%edx
801028a1:	ec                   	in     (%dx),%al
801028a2:	0f b6 c0             	movzbl %al,%eax
801028a5:	89 fa                	mov    %edi,%edx
801028a7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028aa:	b8 08 00 00 00       	mov    $0x8,%eax
801028af:	ee                   	out    %al,(%dx)
801028b0:	89 ca                	mov    %ecx,%edx
801028b2:	ec                   	in     (%dx),%al
801028b3:	0f b6 c0             	movzbl %al,%eax
801028b6:	89 fa                	mov    %edi,%edx
801028b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028bb:	b8 09 00 00 00       	mov    $0x9,%eax
801028c0:	ee                   	out    %al,(%dx)
801028c1:	89 ca                	mov    %ecx,%edx
801028c3:	ec                   	in     (%dx),%al
801028c4:	0f b6 c0             	movzbl %al,%eax
801028c7:	83 ec 04             	sub    $0x4,%esp
801028ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801028cd:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028d0:	6a 18                	push   $0x18
801028d2:	56                   	push   %esi
801028d3:	50                   	push   %eax
801028d4:	e8 c7 1b 00 00       	call   801044a0 <memcmp>
801028d9:	83 c4 10             	add    $0x10,%esp
801028dc:	85 c0                	test   %eax,%eax
801028de:	0f 85 0c ff ff ff    	jne    801027f0 <cmostime+0x30>
801028e4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028e8:	75 78                	jne    80102962 <cmostime+0x1a2>
801028ea:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028ed:	89 c2                	mov    %eax,%edx
801028ef:	83 e0 0f             	and    $0xf,%eax
801028f2:	c1 ea 04             	shr    $0x4,%edx
801028f5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028f8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028fb:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028fe:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102901:	89 c2                	mov    %eax,%edx
80102903:	83 e0 0f             	and    $0xf,%eax
80102906:	c1 ea 04             	shr    $0x4,%edx
80102909:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010290c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102912:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102915:	89 c2                	mov    %eax,%edx
80102917:	83 e0 0f             	and    $0xf,%eax
8010291a:	c1 ea 04             	shr    $0x4,%edx
8010291d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102920:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102923:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102926:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102929:	89 c2                	mov    %eax,%edx
8010292b:	83 e0 0f             	and    $0xf,%eax
8010292e:	c1 ea 04             	shr    $0x4,%edx
80102931:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102934:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102937:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010293a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010293d:	89 c2                	mov    %eax,%edx
8010293f:	83 e0 0f             	and    $0xf,%eax
80102942:	c1 ea 04             	shr    $0x4,%edx
80102945:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102948:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010294e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102951:	89 c2                	mov    %eax,%edx
80102953:	83 e0 0f             	and    $0xf,%eax
80102956:	c1 ea 04             	shr    $0x4,%edx
80102959:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010295c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295f:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102962:	8b 75 08             	mov    0x8(%ebp),%esi
80102965:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102968:	89 06                	mov    %eax,(%esi)
8010296a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010296d:	89 46 04             	mov    %eax,0x4(%esi)
80102970:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102973:	89 46 08             	mov    %eax,0x8(%esi)
80102976:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102979:	89 46 0c             	mov    %eax,0xc(%esi)
8010297c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010297f:	89 46 10             	mov    %eax,0x10(%esi)
80102982:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102985:	89 46 14             	mov    %eax,0x14(%esi)
80102988:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
8010298f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102992:	5b                   	pop    %ebx
80102993:	5e                   	pop    %esi
80102994:	5f                   	pop    %edi
80102995:	5d                   	pop    %ebp
80102996:	c3                   	ret    
80102997:	66 90                	xchg   %ax,%ax
80102999:	66 90                	xchg   %ax,%ax
8010299b:	66 90                	xchg   %ax,%ax
8010299d:	66 90                	xchg   %ax,%ax
8010299f:	90                   	nop

801029a0 <install_trans>:
801029a0:	8b 0d c8 27 11 80    	mov    0x801127c8,%ecx
801029a6:	85 c9                	test   %ecx,%ecx
801029a8:	0f 8e 85 00 00 00    	jle    80102a33 <install_trans+0x93>
801029ae:	55                   	push   %ebp
801029af:	89 e5                	mov    %esp,%ebp
801029b1:	57                   	push   %edi
801029b2:	56                   	push   %esi
801029b3:	53                   	push   %ebx
801029b4:	31 db                	xor    %ebx,%ebx
801029b6:	83 ec 0c             	sub    $0xc,%esp
801029b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029c0:	a1 b4 27 11 80       	mov    0x801127b4,%eax
801029c5:	83 ec 08             	sub    $0x8,%esp
801029c8:	01 d8                	add    %ebx,%eax
801029ca:	83 c0 01             	add    $0x1,%eax
801029cd:	50                   	push   %eax
801029ce:	ff 35 c4 27 11 80    	pushl  0x801127c4
801029d4:	e8 f7 d6 ff ff       	call   801000d0 <bread>
801029d9:	89 c7                	mov    %eax,%edi
801029db:	58                   	pop    %eax
801029dc:	5a                   	pop    %edx
801029dd:	ff 34 9d cc 27 11 80 	pushl  -0x7feed834(,%ebx,4)
801029e4:	ff 35 c4 27 11 80    	pushl  0x801127c4
801029ea:	83 c3 01             	add    $0x1,%ebx
801029ed:	e8 de d6 ff ff       	call   801000d0 <bread>
801029f2:	89 c6                	mov    %eax,%esi
801029f4:	8d 47 5c             	lea    0x5c(%edi),%eax
801029f7:	83 c4 0c             	add    $0xc,%esp
801029fa:	68 00 02 00 00       	push   $0x200
801029ff:	50                   	push   %eax
80102a00:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a03:	50                   	push   %eax
80102a04:	e8 f7 1a 00 00       	call   80104500 <memmove>
80102a09:	89 34 24             	mov    %esi,(%esp)
80102a0c:	e8 8f d7 ff ff       	call   801001a0 <bwrite>
80102a11:	89 3c 24             	mov    %edi,(%esp)
80102a14:	e8 c7 d7 ff ff       	call   801001e0 <brelse>
80102a19:	89 34 24             	mov    %esi,(%esp)
80102a1c:	e8 bf d7 ff ff       	call   801001e0 <brelse>
80102a21:	83 c4 10             	add    $0x10,%esp
80102a24:	39 1d c8 27 11 80    	cmp    %ebx,0x801127c8
80102a2a:	7f 94                	jg     801029c0 <install_trans+0x20>
80102a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a2f:	5b                   	pop    %ebx
80102a30:	5e                   	pop    %esi
80102a31:	5f                   	pop    %edi
80102a32:	5d                   	pop    %ebp
80102a33:	f3 c3                	repz ret 
80102a35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a40 <write_head>:
80102a40:	55                   	push   %ebp
80102a41:	89 e5                	mov    %esp,%ebp
80102a43:	53                   	push   %ebx
80102a44:	83 ec 0c             	sub    $0xc,%esp
80102a47:	ff 35 b4 27 11 80    	pushl  0x801127b4
80102a4d:	ff 35 c4 27 11 80    	pushl  0x801127c4
80102a53:	e8 78 d6 ff ff       	call   801000d0 <bread>
80102a58:	8b 0d c8 27 11 80    	mov    0x801127c8,%ecx
80102a5e:	83 c4 10             	add    $0x10,%esp
80102a61:	89 c3                	mov    %eax,%ebx
80102a63:	85 c9                	test   %ecx,%ecx
80102a65:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102a68:	7e 1f                	jle    80102a89 <write_head+0x49>
80102a6a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a71:	31 d2                	xor    %edx,%edx
80102a73:	90                   	nop
80102a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a78:	8b 8a cc 27 11 80    	mov    -0x7feed834(%edx),%ecx
80102a7e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a82:	83 c2 04             	add    $0x4,%edx
80102a85:	39 c2                	cmp    %eax,%edx
80102a87:	75 ef                	jne    80102a78 <write_head+0x38>
80102a89:	83 ec 0c             	sub    $0xc,%esp
80102a8c:	53                   	push   %ebx
80102a8d:	e8 0e d7 ff ff       	call   801001a0 <bwrite>
80102a92:	89 1c 24             	mov    %ebx,(%esp)
80102a95:	e8 46 d7 ff ff       	call   801001e0 <brelse>
80102a9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a9d:	c9                   	leave  
80102a9e:	c3                   	ret    
80102a9f:	90                   	nop

80102aa0 <initlog>:
80102aa0:	55                   	push   %ebp
80102aa1:	89 e5                	mov    %esp,%ebp
80102aa3:	53                   	push   %ebx
80102aa4:	83 ec 2c             	sub    $0x2c,%esp
80102aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aaa:	68 00 75 10 80       	push   $0x80107500
80102aaf:	68 80 27 11 80       	push   $0x80112780
80102ab4:	e8 37 17 00 00       	call   801041f0 <initlock>
80102ab9:	58                   	pop    %eax
80102aba:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102abd:	5a                   	pop    %edx
80102abe:	50                   	push   %eax
80102abf:	53                   	push   %ebx
80102ac0:	e8 5b e9 ff ff       	call   80101420 <readsb>
80102ac5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102ac8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102acb:	59                   	pop    %ecx
80102acc:	89 1d c4 27 11 80    	mov    %ebx,0x801127c4
80102ad2:	89 15 b8 27 11 80    	mov    %edx,0x801127b8
80102ad8:	a3 b4 27 11 80       	mov    %eax,0x801127b4
80102add:	5a                   	pop    %edx
80102ade:	50                   	push   %eax
80102adf:	53                   	push   %ebx
80102ae0:	e8 eb d5 ff ff       	call   801000d0 <bread>
80102ae5:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102ae8:	83 c4 10             	add    $0x10,%esp
80102aeb:	85 c9                	test   %ecx,%ecx
80102aed:	89 0d c8 27 11 80    	mov    %ecx,0x801127c8
80102af3:	7e 1c                	jle    80102b11 <initlog+0x71>
80102af5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102afc:	31 d2                	xor    %edx,%edx
80102afe:	66 90                	xchg   %ax,%ax
80102b00:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b04:	83 c2 04             	add    $0x4,%edx
80102b07:	89 8a c8 27 11 80    	mov    %ecx,-0x7feed838(%edx)
80102b0d:	39 da                	cmp    %ebx,%edx
80102b0f:	75 ef                	jne    80102b00 <initlog+0x60>
80102b11:	83 ec 0c             	sub    $0xc,%esp
80102b14:	50                   	push   %eax
80102b15:	e8 c6 d6 ff ff       	call   801001e0 <brelse>
80102b1a:	e8 81 fe ff ff       	call   801029a0 <install_trans>
80102b1f:	c7 05 c8 27 11 80 00 	movl   $0x0,0x801127c8
80102b26:	00 00 00 
80102b29:	e8 12 ff ff ff       	call   80102a40 <write_head>
80102b2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b31:	c9                   	leave  
80102b32:	c3                   	ret    
80102b33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b40 <begin_op>:
80102b40:	55                   	push   %ebp
80102b41:	89 e5                	mov    %esp,%ebp
80102b43:	83 ec 14             	sub    $0x14,%esp
80102b46:	68 80 27 11 80       	push   $0x80112780
80102b4b:	e8 00 18 00 00       	call   80104350 <acquire>
80102b50:	83 c4 10             	add    $0x10,%esp
80102b53:	eb 18                	jmp    80102b6d <begin_op+0x2d>
80102b55:	8d 76 00             	lea    0x0(%esi),%esi
80102b58:	83 ec 08             	sub    $0x8,%esp
80102b5b:	68 80 27 11 80       	push   $0x80112780
80102b60:	68 80 27 11 80       	push   $0x80112780
80102b65:	e8 e6 11 00 00       	call   80103d50 <sleep>
80102b6a:	83 c4 10             	add    $0x10,%esp
80102b6d:	a1 c0 27 11 80       	mov    0x801127c0,%eax
80102b72:	85 c0                	test   %eax,%eax
80102b74:	75 e2                	jne    80102b58 <begin_op+0x18>
80102b76:	a1 bc 27 11 80       	mov    0x801127bc,%eax
80102b7b:	8b 15 c8 27 11 80    	mov    0x801127c8,%edx
80102b81:	83 c0 01             	add    $0x1,%eax
80102b84:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b87:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b8a:	83 fa 1e             	cmp    $0x1e,%edx
80102b8d:	7f c9                	jg     80102b58 <begin_op+0x18>
80102b8f:	83 ec 0c             	sub    $0xc,%esp
80102b92:	a3 bc 27 11 80       	mov    %eax,0x801127bc
80102b97:	68 80 27 11 80       	push   $0x80112780
80102b9c:	e8 5f 18 00 00       	call   80104400 <release>
80102ba1:	83 c4 10             	add    $0x10,%esp
80102ba4:	c9                   	leave  
80102ba5:	c3                   	ret    
80102ba6:	8d 76 00             	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <end_op>:
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	57                   	push   %edi
80102bb4:	56                   	push   %esi
80102bb5:	53                   	push   %ebx
80102bb6:	83 ec 18             	sub    $0x18,%esp
80102bb9:	68 80 27 11 80       	push   $0x80112780
80102bbe:	e8 8d 17 00 00       	call   80104350 <acquire>
80102bc3:	a1 bc 27 11 80       	mov    0x801127bc,%eax
80102bc8:	8b 1d c0 27 11 80    	mov    0x801127c0,%ebx
80102bce:	83 c4 10             	add    $0x10,%esp
80102bd1:	83 e8 01             	sub    $0x1,%eax
80102bd4:	85 db                	test   %ebx,%ebx
80102bd6:	a3 bc 27 11 80       	mov    %eax,0x801127bc
80102bdb:	0f 85 23 01 00 00    	jne    80102d04 <end_op+0x154>
80102be1:	85 c0                	test   %eax,%eax
80102be3:	0f 85 f7 00 00 00    	jne    80102ce0 <end_op+0x130>
80102be9:	83 ec 0c             	sub    $0xc,%esp
80102bec:	c7 05 c0 27 11 80 01 	movl   $0x1,0x801127c0
80102bf3:	00 00 00 
80102bf6:	31 db                	xor    %ebx,%ebx
80102bf8:	68 80 27 11 80       	push   $0x80112780
80102bfd:	e8 fe 17 00 00       	call   80104400 <release>
80102c02:	8b 0d c8 27 11 80    	mov    0x801127c8,%ecx
80102c08:	83 c4 10             	add    $0x10,%esp
80102c0b:	85 c9                	test   %ecx,%ecx
80102c0d:	0f 8e 8a 00 00 00    	jle    80102c9d <end_op+0xed>
80102c13:	90                   	nop
80102c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c18:	a1 b4 27 11 80       	mov    0x801127b4,%eax
80102c1d:	83 ec 08             	sub    $0x8,%esp
80102c20:	01 d8                	add    %ebx,%eax
80102c22:	83 c0 01             	add    $0x1,%eax
80102c25:	50                   	push   %eax
80102c26:	ff 35 c4 27 11 80    	pushl  0x801127c4
80102c2c:	e8 9f d4 ff ff       	call   801000d0 <bread>
80102c31:	89 c6                	mov    %eax,%esi
80102c33:	58                   	pop    %eax
80102c34:	5a                   	pop    %edx
80102c35:	ff 34 9d cc 27 11 80 	pushl  -0x7feed834(,%ebx,4)
80102c3c:	ff 35 c4 27 11 80    	pushl  0x801127c4
80102c42:	83 c3 01             	add    $0x1,%ebx
80102c45:	e8 86 d4 ff ff       	call   801000d0 <bread>
80102c4a:	89 c7                	mov    %eax,%edi
80102c4c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c4f:	83 c4 0c             	add    $0xc,%esp
80102c52:	68 00 02 00 00       	push   $0x200
80102c57:	50                   	push   %eax
80102c58:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c5b:	50                   	push   %eax
80102c5c:	e8 9f 18 00 00       	call   80104500 <memmove>
80102c61:	89 34 24             	mov    %esi,(%esp)
80102c64:	e8 37 d5 ff ff       	call   801001a0 <bwrite>
80102c69:	89 3c 24             	mov    %edi,(%esp)
80102c6c:	e8 6f d5 ff ff       	call   801001e0 <brelse>
80102c71:	89 34 24             	mov    %esi,(%esp)
80102c74:	e8 67 d5 ff ff       	call   801001e0 <brelse>
80102c79:	83 c4 10             	add    $0x10,%esp
80102c7c:	3b 1d c8 27 11 80    	cmp    0x801127c8,%ebx
80102c82:	7c 94                	jl     80102c18 <end_op+0x68>
80102c84:	e8 b7 fd ff ff       	call   80102a40 <write_head>
80102c89:	e8 12 fd ff ff       	call   801029a0 <install_trans>
80102c8e:	c7 05 c8 27 11 80 00 	movl   $0x0,0x801127c8
80102c95:	00 00 00 
80102c98:	e8 a3 fd ff ff       	call   80102a40 <write_head>
80102c9d:	83 ec 0c             	sub    $0xc,%esp
80102ca0:	68 80 27 11 80       	push   $0x80112780
80102ca5:	e8 a6 16 00 00       	call   80104350 <acquire>
80102caa:	c7 04 24 80 27 11 80 	movl   $0x80112780,(%esp)
80102cb1:	c7 05 c0 27 11 80 00 	movl   $0x0,0x801127c0
80102cb8:	00 00 00 
80102cbb:	e8 50 12 00 00       	call   80103f10 <wakeup>
80102cc0:	c7 04 24 80 27 11 80 	movl   $0x80112780,(%esp)
80102cc7:	e8 34 17 00 00       	call   80104400 <release>
80102ccc:	83 c4 10             	add    $0x10,%esp
80102ccf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cd2:	5b                   	pop    %ebx
80102cd3:	5e                   	pop    %esi
80102cd4:	5f                   	pop    %edi
80102cd5:	5d                   	pop    %ebp
80102cd6:	c3                   	ret    
80102cd7:	89 f6                	mov    %esi,%esi
80102cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102ce0:	83 ec 0c             	sub    $0xc,%esp
80102ce3:	68 80 27 11 80       	push   $0x80112780
80102ce8:	e8 23 12 00 00       	call   80103f10 <wakeup>
80102ced:	c7 04 24 80 27 11 80 	movl   $0x80112780,(%esp)
80102cf4:	e8 07 17 00 00       	call   80104400 <release>
80102cf9:	83 c4 10             	add    $0x10,%esp
80102cfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cff:	5b                   	pop    %ebx
80102d00:	5e                   	pop    %esi
80102d01:	5f                   	pop    %edi
80102d02:	5d                   	pop    %ebp
80102d03:	c3                   	ret    
80102d04:	83 ec 0c             	sub    $0xc,%esp
80102d07:	68 04 75 10 80       	push   $0x80107504
80102d0c:	e8 5f d6 ff ff       	call   80100370 <panic>
80102d11:	eb 0d                	jmp    80102d20 <log_write>
80102d13:	90                   	nop
80102d14:	90                   	nop
80102d15:	90                   	nop
80102d16:	90                   	nop
80102d17:	90                   	nop
80102d18:	90                   	nop
80102d19:	90                   	nop
80102d1a:	90                   	nop
80102d1b:	90                   	nop
80102d1c:	90                   	nop
80102d1d:	90                   	nop
80102d1e:	90                   	nop
80102d1f:	90                   	nop

80102d20 <log_write>:
80102d20:	55                   	push   %ebp
80102d21:	89 e5                	mov    %esp,%ebp
80102d23:	53                   	push   %ebx
80102d24:	83 ec 04             	sub    $0x4,%esp
80102d27:	8b 15 c8 27 11 80    	mov    0x801127c8,%edx
80102d2d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d30:	83 fa 1d             	cmp    $0x1d,%edx
80102d33:	0f 8f 97 00 00 00    	jg     80102dd0 <log_write+0xb0>
80102d39:	a1 b8 27 11 80       	mov    0x801127b8,%eax
80102d3e:	83 e8 01             	sub    $0x1,%eax
80102d41:	39 c2                	cmp    %eax,%edx
80102d43:	0f 8d 87 00 00 00    	jge    80102dd0 <log_write+0xb0>
80102d49:	a1 bc 27 11 80       	mov    0x801127bc,%eax
80102d4e:	85 c0                	test   %eax,%eax
80102d50:	0f 8e 87 00 00 00    	jle    80102ddd <log_write+0xbd>
80102d56:	83 ec 0c             	sub    $0xc,%esp
80102d59:	68 80 27 11 80       	push   $0x80112780
80102d5e:	e8 ed 15 00 00       	call   80104350 <acquire>
80102d63:	8b 15 c8 27 11 80    	mov    0x801127c8,%edx
80102d69:	83 c4 10             	add    $0x10,%esp
80102d6c:	83 fa 00             	cmp    $0x0,%edx
80102d6f:	7e 50                	jle    80102dc1 <log_write+0xa1>
80102d71:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102d74:	31 c0                	xor    %eax,%eax
80102d76:	3b 0d cc 27 11 80    	cmp    0x801127cc,%ecx
80102d7c:	75 0b                	jne    80102d89 <log_write+0x69>
80102d7e:	eb 38                	jmp    80102db8 <log_write+0x98>
80102d80:	39 0c 85 cc 27 11 80 	cmp    %ecx,-0x7feed834(,%eax,4)
80102d87:	74 2f                	je     80102db8 <log_write+0x98>
80102d89:	83 c0 01             	add    $0x1,%eax
80102d8c:	39 d0                	cmp    %edx,%eax
80102d8e:	75 f0                	jne    80102d80 <log_write+0x60>
80102d90:	89 0c 95 cc 27 11 80 	mov    %ecx,-0x7feed834(,%edx,4)
80102d97:	83 c2 01             	add    $0x1,%edx
80102d9a:	89 15 c8 27 11 80    	mov    %edx,0x801127c8
80102da0:	83 0b 04             	orl    $0x4,(%ebx)
80102da3:	c7 45 08 80 27 11 80 	movl   $0x80112780,0x8(%ebp)
80102daa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dad:	c9                   	leave  
80102dae:	e9 4d 16 00 00       	jmp    80104400 <release>
80102db3:	90                   	nop
80102db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102db8:	89 0c 85 cc 27 11 80 	mov    %ecx,-0x7feed834(,%eax,4)
80102dbf:	eb df                	jmp    80102da0 <log_write+0x80>
80102dc1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dc4:	a3 cc 27 11 80       	mov    %eax,0x801127cc
80102dc9:	75 d5                	jne    80102da0 <log_write+0x80>
80102dcb:	eb ca                	jmp    80102d97 <log_write+0x77>
80102dcd:	8d 76 00             	lea    0x0(%esi),%esi
80102dd0:	83 ec 0c             	sub    $0xc,%esp
80102dd3:	68 13 75 10 80       	push   $0x80107513
80102dd8:	e8 93 d5 ff ff       	call   80100370 <panic>
80102ddd:	83 ec 0c             	sub    $0xc,%esp
80102de0:	68 29 75 10 80       	push   $0x80107529
80102de5:	e8 86 d5 ff ff       	call   80100370 <panic>
80102dea:	66 90                	xchg   %ax,%ax
80102dec:	66 90                	xchg   %ax,%ax
80102dee:	66 90                	xchg   %ax,%ax

80102df0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	53                   	push   %ebx
80102df4:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102df7:	e8 84 09 00 00       	call   80103780 <cpuid>
80102dfc:	89 c3                	mov    %eax,%ebx
80102dfe:	e8 7d 09 00 00       	call   80103780 <cpuid>
80102e03:	83 ec 04             	sub    $0x4,%esp
80102e06:	53                   	push   %ebx
80102e07:	50                   	push   %eax
80102e08:	68 44 75 10 80       	push   $0x80107544
80102e0d:	e8 4e d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e12:	e8 59 2a 00 00       	call   80105870 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e17:	e8 e4 08 00 00       	call   80103700 <mycpu>
80102e1c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e1e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e23:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e2a:	e8 31 0c 00 00       	call   80103a60 <scheduler>
80102e2f:	90                   	nop

80102e30 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e36:	e8 55 3b 00 00       	call   80106990 <switchkvm>
  seginit();
80102e3b:	e8 50 3a 00 00       	call   80106890 <seginit>
  lapicinit();
80102e40:	e8 9b f7 ff ff       	call   801025e0 <lapicinit>
  mpmain();
80102e45:	e8 a6 ff ff ff       	call   80102df0 <mpmain>
80102e4a:	66 90                	xchg   %ax,%ax
80102e4c:	66 90                	xchg   %ax,%ax
80102e4e:	66 90                	xchg   %ax,%ax

80102e50 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e54:	83 e4 f0             	and    $0xfffffff0,%esp
80102e57:	ff 71 fc             	pushl  -0x4(%ecx)
80102e5a:	55                   	push   %ebp
80102e5b:	89 e5                	mov    %esp,%ebp
80102e5d:	53                   	push   %ebx
80102e5e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e5f:	bb 80 28 11 80       	mov    $0x80112880,%ebx
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e64:	83 ec 08             	sub    $0x8,%esp
80102e67:	68 00 00 40 80       	push   $0x80400000
80102e6c:	68 a8 57 11 80       	push   $0x801157a8
80102e71:	e8 3a f5 ff ff       	call   801023b0 <kinit1>
  kvmalloc();      // kernel page table
80102e76:	e8 b5 3f 00 00       	call   80106e30 <kvmalloc>
  mpinit();        // detect other processors
80102e7b:	e8 70 01 00 00       	call   80102ff0 <mpinit>
  lapicinit();     // interrupt controller
80102e80:	e8 5b f7 ff ff       	call   801025e0 <lapicinit>
  seginit();       // segment descriptors
80102e85:	e8 06 3a 00 00       	call   80106890 <seginit>
  picinit();       // disable pic
80102e8a:	e8 31 03 00 00       	call   801031c0 <picinit>
  ioapicinit();    // another interrupt controller
80102e8f:	e8 4c f3 ff ff       	call   801021e0 <ioapicinit>
  consoleinit();   // console hardware
80102e94:	e8 07 db ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102e99:	e8 c2 2c 00 00       	call   80105b60 <uartinit>
  pinit();         // process table
80102e9e:	e8 3d 08 00 00       	call   801036e0 <pinit>
  tvinit();        // trap vectors
80102ea3:	e8 28 29 00 00       	call   801057d0 <tvinit>
  binit();         // buffer cache
80102ea8:	e8 93 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102ead:	e8 9e de ff ff       	call   80100d50 <fileinit>
  ideinit();       // disk 
80102eb2:	e8 09 f1 ff ff       	call   80101fc0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102eb7:	83 c4 0c             	add    $0xc,%esp
80102eba:	68 8a 00 00 00       	push   $0x8a
80102ebf:	68 8c a5 10 80       	push   $0x8010a58c
80102ec4:	68 00 70 00 80       	push   $0x80007000
80102ec9:	e8 32 16 00 00       	call   80104500 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102ece:	69 05 00 2e 11 80 b0 	imul   $0xb0,0x80112e00,%eax
80102ed5:	00 00 00 
80102ed8:	83 c4 10             	add    $0x10,%esp
80102edb:	05 80 28 11 80       	add    $0x80112880,%eax
80102ee0:	39 d8                	cmp    %ebx,%eax
80102ee2:	76 6f                	jbe    80102f53 <main+0x103>
80102ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102ee8:	e8 13 08 00 00       	call   80103700 <mycpu>
80102eed:	39 d8                	cmp    %ebx,%eax
80102eef:	74 49                	je     80102f3a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102ef1:	e8 8a f5 ff ff       	call   80102480 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102ef6:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80102efb:	c7 05 f8 6f 00 80 30 	movl   $0x80102e30,0x80006ff8
80102f02:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f05:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f0c:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f0f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void(**)(void))(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f14:	0f b6 03             	movzbl (%ebx),%eax
80102f17:	83 ec 08             	sub    $0x8,%esp
80102f1a:	68 00 70 00 00       	push   $0x7000
80102f1f:	50                   	push   %eax
80102f20:	e8 0b f8 ff ff       	call   80102730 <lapicstartap>
80102f25:	83 c4 10             	add    $0x10,%esp
80102f28:	90                   	nop
80102f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f30:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f36:	85 c0                	test   %eax,%eax
80102f38:	74 f6                	je     80102f30 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f3a:	69 05 00 2e 11 80 b0 	imul   $0xb0,0x80112e00,%eax
80102f41:	00 00 00 
80102f44:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f4a:	05 80 28 11 80       	add    $0x80112880,%eax
80102f4f:	39 c3                	cmp    %eax,%ebx
80102f51:	72 95                	jb     80102ee8 <main+0x98>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f53:	83 ec 08             	sub    $0x8,%esp
80102f56:	68 00 00 00 8e       	push   $0x8e000000
80102f5b:	68 00 00 40 80       	push   $0x80400000
80102f60:	e8 bb f4 ff ff       	call   80102420 <kinit2>
  userinit();      // first user process
80102f65:	e8 66 08 00 00       	call   801037d0 <userinit>
  mpmain();        // finish this processor's setup
80102f6a:	e8 81 fe ff ff       	call   80102df0 <mpmain>
80102f6f:	90                   	nop

80102f70 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f70:	55                   	push   %ebp
80102f71:	89 e5                	mov    %esp,%ebp
80102f73:	57                   	push   %edi
80102f74:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f75:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f7b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102f7c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f7f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102f82:	39 de                	cmp    %ebx,%esi
80102f84:	73 48                	jae    80102fce <mpsearch1+0x5e>
80102f86:	8d 76 00             	lea    0x0(%esi),%esi
80102f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102f90:	83 ec 04             	sub    $0x4,%esp
80102f93:	8d 7e 10             	lea    0x10(%esi),%edi
80102f96:	6a 04                	push   $0x4
80102f98:	68 58 75 10 80       	push   $0x80107558
80102f9d:	56                   	push   %esi
80102f9e:	e8 fd 14 00 00       	call   801044a0 <memcmp>
80102fa3:	83 c4 10             	add    $0x10,%esp
80102fa6:	85 c0                	test   %eax,%eax
80102fa8:	75 1e                	jne    80102fc8 <mpsearch1+0x58>
80102faa:	8d 7e 10             	lea    0x10(%esi),%edi
80102fad:	89 f2                	mov    %esi,%edx
80102faf:	31 c9                	xor    %ecx,%ecx
80102fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fb8:	0f b6 02             	movzbl (%edx),%eax
80102fbb:	83 c2 01             	add    $0x1,%edx
80102fbe:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fc0:	39 fa                	cmp    %edi,%edx
80102fc2:	75 f4                	jne    80102fb8 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fc4:	84 c9                	test   %cl,%cl
80102fc6:	74 10                	je     80102fd8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fc8:	39 fb                	cmp    %edi,%ebx
80102fca:	89 fe                	mov    %edi,%esi
80102fcc:	77 c2                	ja     80102f90 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80102fce:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102fd1:	31 c0                	xor    %eax,%eax
}
80102fd3:	5b                   	pop    %ebx
80102fd4:	5e                   	pop    %esi
80102fd5:	5f                   	pop    %edi
80102fd6:	5d                   	pop    %ebp
80102fd7:	c3                   	ret    
80102fd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fdb:	89 f0                	mov    %esi,%eax
80102fdd:	5b                   	pop    %ebx
80102fde:	5e                   	pop    %esi
80102fdf:	5f                   	pop    %edi
80102fe0:	5d                   	pop    %ebp
80102fe1:	c3                   	ret    
80102fe2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ff0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80102ff0:	55                   	push   %ebp
80102ff1:	89 e5                	mov    %esp,%ebp
80102ff3:	57                   	push   %edi
80102ff4:	56                   	push   %esi
80102ff5:	53                   	push   %ebx
80102ff6:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80102ff9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103000:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103007:	c1 e0 08             	shl    $0x8,%eax
8010300a:	09 d0                	or     %edx,%eax
8010300c:	c1 e0 04             	shl    $0x4,%eax
8010300f:	85 c0                	test   %eax,%eax
80103011:	75 1b                	jne    8010302e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80103013:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010301a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103021:	c1 e0 08             	shl    $0x8,%eax
80103024:	09 d0                	or     %edx,%eax
80103026:	c1 e0 0a             	shl    $0xa,%eax
80103029:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010302e:	ba 00 04 00 00       	mov    $0x400,%edx
80103033:	e8 38 ff ff ff       	call   80102f70 <mpsearch1>
80103038:	85 c0                	test   %eax,%eax
8010303a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010303d:	0f 84 37 01 00 00    	je     8010317a <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103043:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103046:	8b 58 04             	mov    0x4(%eax),%ebx
80103049:	85 db                	test   %ebx,%ebx
8010304b:	0f 84 43 01 00 00    	je     80103194 <mpinit+0x1a4>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103051:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103057:	83 ec 04             	sub    $0x4,%esp
8010305a:	6a 04                	push   $0x4
8010305c:	68 5d 75 10 80       	push   $0x8010755d
80103061:	56                   	push   %esi
80103062:	e8 39 14 00 00       	call   801044a0 <memcmp>
80103067:	83 c4 10             	add    $0x10,%esp
8010306a:	85 c0                	test   %eax,%eax
8010306c:	0f 85 22 01 00 00    	jne    80103194 <mpinit+0x1a4>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103072:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103079:	3c 01                	cmp    $0x1,%al
8010307b:	74 08                	je     80103085 <mpinit+0x95>
8010307d:	3c 04                	cmp    $0x4,%al
8010307f:	0f 85 0f 01 00 00    	jne    80103194 <mpinit+0x1a4>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103085:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010308c:	85 ff                	test   %edi,%edi
8010308e:	74 21                	je     801030b1 <mpinit+0xc1>
80103090:	31 d2                	xor    %edx,%edx
80103092:	31 c0                	xor    %eax,%eax
80103094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103098:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010309f:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030a0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801030a3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030a5:	39 c7                	cmp    %eax,%edi
801030a7:	75 ef                	jne    80103098 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030a9:	84 d2                	test   %dl,%dl
801030ab:	0f 85 e3 00 00 00    	jne    80103194 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030b1:	85 f6                	test   %esi,%esi
801030b3:	0f 84 db 00 00 00    	je     80103194 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030b9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030bf:	a3 7c 27 11 80       	mov    %eax,0x8011277c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030c4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030cb:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
801030d1:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030d6:	01 d6                	add    %edx,%esi
801030d8:	90                   	nop
801030d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030e0:	39 c6                	cmp    %eax,%esi
801030e2:	76 23                	jbe    80103107 <mpinit+0x117>
801030e4:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
801030e7:	80 fa 04             	cmp    $0x4,%dl
801030ea:	0f 87 c0 00 00 00    	ja     801031b0 <mpinit+0x1c0>
801030f0:	ff 24 95 9c 75 10 80 	jmp    *-0x7fef8a64(,%edx,4)
801030f7:	89 f6                	mov    %esi,%esi
801030f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103100:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103103:	39 c6                	cmp    %eax,%esi
80103105:	77 dd                	ja     801030e4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103107:	85 db                	test   %ebx,%ebx
80103109:	0f 84 92 00 00 00    	je     801031a1 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010310f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103112:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103116:	74 15                	je     8010312d <mpinit+0x13d>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103118:	ba 22 00 00 00       	mov    $0x22,%edx
8010311d:	b8 70 00 00 00       	mov    $0x70,%eax
80103122:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103123:	ba 23 00 00 00       	mov    $0x23,%edx
80103128:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103129:	83 c8 01             	or     $0x1,%eax
8010312c:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010312d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103130:	5b                   	pop    %ebx
80103131:	5e                   	pop    %esi
80103132:	5f                   	pop    %edi
80103133:	5d                   	pop    %ebp
80103134:	c3                   	ret    
80103135:	8d 76 00             	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103138:	8b 0d 00 2e 11 80    	mov    0x80112e00,%ecx
8010313e:	83 f9 07             	cmp    $0x7,%ecx
80103141:	7f 19                	jg     8010315c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103143:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103147:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010314d:	83 c1 01             	add    $0x1,%ecx
80103150:	89 0d 00 2e 11 80    	mov    %ecx,0x80112e00
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103156:	88 97 80 28 11 80    	mov    %dl,-0x7feed780(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010315c:	83 c0 14             	add    $0x14,%eax
      continue;
8010315f:	e9 7c ff ff ff       	jmp    801030e0 <mpinit+0xf0>
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010316c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010316f:	88 15 60 28 11 80    	mov    %dl,0x80112860
      p += sizeof(struct mpioapic);
      continue;
80103175:	e9 66 ff ff ff       	jmp    801030e0 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010317a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010317f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103184:	e8 e7 fd ff ff       	call   80102f70 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103189:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010318b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010318e:	0f 85 af fe ff ff    	jne    80103043 <mpinit+0x53>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
80103194:	83 ec 0c             	sub    $0xc,%esp
80103197:	68 62 75 10 80       	push   $0x80107562
8010319c:	e8 cf d1 ff ff       	call   80100370 <panic>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
801031a1:	83 ec 0c             	sub    $0xc,%esp
801031a4:	68 7c 75 10 80       	push   $0x8010757c
801031a9:	e8 c2 d1 ff ff       	call   80100370 <panic>
801031ae:	66 90                	xchg   %ax,%ax
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031b0:	31 db                	xor    %ebx,%ebx
801031b2:	e9 30 ff ff ff       	jmp    801030e7 <mpinit+0xf7>
801031b7:	66 90                	xchg   %ax,%ax
801031b9:	66 90                	xchg   %ax,%ax
801031bb:	66 90                	xchg   %ax,%ax
801031bd:	66 90                	xchg   %ax,%ax
801031bf:	90                   	nop

801031c0 <picinit>:
801031c0:	55                   	push   %ebp
801031c1:	ba 21 00 00 00       	mov    $0x21,%edx
801031c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031cb:	89 e5                	mov    %esp,%ebp
801031cd:	ee                   	out    %al,(%dx)
801031ce:	ba a1 00 00 00       	mov    $0xa1,%edx
801031d3:	ee                   	out    %al,(%dx)
801031d4:	5d                   	pop    %ebp
801031d5:	c3                   	ret    
801031d6:	66 90                	xchg   %ax,%ax
801031d8:	66 90                	xchg   %ax,%ax
801031da:	66 90                	xchg   %ax,%ax
801031dc:	66 90                	xchg   %ax,%ax
801031de:	66 90                	xchg   %ax,%ax

801031e0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801031e0:	55                   	push   %ebp
801031e1:	89 e5                	mov    %esp,%ebp
801031e3:	57                   	push   %edi
801031e4:	56                   	push   %esi
801031e5:	53                   	push   %ebx
801031e6:	83 ec 0c             	sub    $0xc,%esp
801031e9:	8b 75 08             	mov    0x8(%ebp),%esi
801031ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801031ef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801031f5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801031fb:	e8 70 db ff ff       	call   80100d70 <filealloc>
80103200:	85 c0                	test   %eax,%eax
80103202:	89 06                	mov    %eax,(%esi)
80103204:	0f 84 a8 00 00 00    	je     801032b2 <pipealloc+0xd2>
8010320a:	e8 61 db ff ff       	call   80100d70 <filealloc>
8010320f:	85 c0                	test   %eax,%eax
80103211:	89 03                	mov    %eax,(%ebx)
80103213:	0f 84 87 00 00 00    	je     801032a0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103219:	e8 62 f2 ff ff       	call   80102480 <kalloc>
8010321e:	85 c0                	test   %eax,%eax
80103220:	89 c7                	mov    %eax,%edi
80103222:	0f 84 b0 00 00 00    	je     801032d8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103228:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010322b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103232:	00 00 00 
  p->writeopen = 1;
80103235:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010323c:	00 00 00 
  p->nwrite = 0;
8010323f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103246:	00 00 00 
  p->nread = 0;
80103249:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103250:	00 00 00 
  initlock(&p->lock, "pipe");
80103253:	68 b0 75 10 80       	push   $0x801075b0
80103258:	50                   	push   %eax
80103259:	e8 92 0f 00 00       	call   801041f0 <initlock>
  (*f0)->type = FD_PIPE;
8010325e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103260:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103263:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103269:	8b 06                	mov    (%esi),%eax
8010326b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010326f:	8b 06                	mov    (%esi),%eax
80103271:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103275:	8b 06                	mov    (%esi),%eax
80103277:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010327a:	8b 03                	mov    (%ebx),%eax
8010327c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103282:	8b 03                	mov    (%ebx),%eax
80103284:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103288:	8b 03                	mov    (%ebx),%eax
8010328a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010328e:	8b 03                	mov    (%ebx),%eax
80103290:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103293:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103296:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103298:	5b                   	pop    %ebx
80103299:	5e                   	pop    %esi
8010329a:	5f                   	pop    %edi
8010329b:	5d                   	pop    %ebp
8010329c:	c3                   	ret    
8010329d:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032a0:	8b 06                	mov    (%esi),%eax
801032a2:	85 c0                	test   %eax,%eax
801032a4:	74 1e                	je     801032c4 <pipealloc+0xe4>
    fileclose(*f0);
801032a6:	83 ec 0c             	sub    $0xc,%esp
801032a9:	50                   	push   %eax
801032aa:	e8 81 db ff ff       	call   80100e30 <fileclose>
801032af:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032b2:	8b 03                	mov    (%ebx),%eax
801032b4:	85 c0                	test   %eax,%eax
801032b6:	74 0c                	je     801032c4 <pipealloc+0xe4>
    fileclose(*f1);
801032b8:	83 ec 0c             	sub    $0xc,%esp
801032bb:	50                   	push   %eax
801032bc:	e8 6f db ff ff       	call   80100e30 <fileclose>
801032c1:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
801032c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032cc:	5b                   	pop    %ebx
801032cd:	5e                   	pop    %esi
801032ce:	5f                   	pop    %edi
801032cf:	5d                   	pop    %ebp
801032d0:	c3                   	ret    
801032d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032d8:	8b 06                	mov    (%esi),%eax
801032da:	85 c0                	test   %eax,%eax
801032dc:	75 c8                	jne    801032a6 <pipealloc+0xc6>
801032de:	eb d2                	jmp    801032b2 <pipealloc+0xd2>

801032e0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801032e0:	55                   	push   %ebp
801032e1:	89 e5                	mov    %esp,%ebp
801032e3:	56                   	push   %esi
801032e4:	53                   	push   %ebx
801032e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801032eb:	83 ec 0c             	sub    $0xc,%esp
801032ee:	53                   	push   %ebx
801032ef:	e8 5c 10 00 00       	call   80104350 <acquire>
  if(writable){
801032f4:	83 c4 10             	add    $0x10,%esp
801032f7:	85 f6                	test   %esi,%esi
801032f9:	74 45                	je     80103340 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801032fb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103301:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103304:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010330b:	00 00 00 
    wakeup(&p->nread);
8010330e:	50                   	push   %eax
8010330f:	e8 fc 0b 00 00       	call   80103f10 <wakeup>
80103314:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103317:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010331d:	85 d2                	test   %edx,%edx
8010331f:	75 0a                	jne    8010332b <pipeclose+0x4b>
80103321:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103327:	85 c0                	test   %eax,%eax
80103329:	74 35                	je     80103360 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010332b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010332e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103331:	5b                   	pop    %ebx
80103332:	5e                   	pop    %esi
80103333:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103334:	e9 c7 10 00 00       	jmp    80104400 <release>
80103339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103340:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103346:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103349:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103350:	00 00 00 
    wakeup(&p->nwrite);
80103353:	50                   	push   %eax
80103354:	e8 b7 0b 00 00       	call   80103f10 <wakeup>
80103359:	83 c4 10             	add    $0x10,%esp
8010335c:	eb b9                	jmp    80103317 <pipeclose+0x37>
8010335e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103360:	83 ec 0c             	sub    $0xc,%esp
80103363:	53                   	push   %ebx
80103364:	e8 97 10 00 00       	call   80104400 <release>
    kfree((char*)p);
80103369:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010336c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010336f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103372:	5b                   	pop    %ebx
80103373:	5e                   	pop    %esi
80103374:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103375:	e9 56 ef ff ff       	jmp    801022d0 <kfree>
8010337a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103380 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103380:	55                   	push   %ebp
80103381:	89 e5                	mov    %esp,%ebp
80103383:	57                   	push   %edi
80103384:	56                   	push   %esi
80103385:	53                   	push   %ebx
80103386:	83 ec 28             	sub    $0x28,%esp
80103389:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010338c:	53                   	push   %ebx
8010338d:	e8 be 0f 00 00       	call   80104350 <acquire>
  for(i = 0; i < n; i++){
80103392:	8b 45 10             	mov    0x10(%ebp),%eax
80103395:	83 c4 10             	add    $0x10,%esp
80103398:	85 c0                	test   %eax,%eax
8010339a:	0f 8e b9 00 00 00    	jle    80103459 <pipewrite+0xd9>
801033a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033a3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033a9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033af:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033b8:	03 4d 10             	add    0x10(%ebp),%ecx
801033bb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033be:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033c4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033ca:	39 d0                	cmp    %edx,%eax
801033cc:	74 38                	je     80103406 <pipewrite+0x86>
801033ce:	eb 59                	jmp    80103429 <pipewrite+0xa9>
      if(p->readopen == 0 || myproc()->killed){
801033d0:	e8 cb 03 00 00       	call   801037a0 <myproc>
801033d5:	8b 48 24             	mov    0x24(%eax),%ecx
801033d8:	85 c9                	test   %ecx,%ecx
801033da:	75 34                	jne    80103410 <pipewrite+0x90>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033dc:	83 ec 0c             	sub    $0xc,%esp
801033df:	57                   	push   %edi
801033e0:	e8 2b 0b 00 00       	call   80103f10 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033e5:	58                   	pop    %eax
801033e6:	5a                   	pop    %edx
801033e7:	53                   	push   %ebx
801033e8:	56                   	push   %esi
801033e9:	e8 62 09 00 00       	call   80103d50 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033ee:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801033f4:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801033fa:	83 c4 10             	add    $0x10,%esp
801033fd:	05 00 02 00 00       	add    $0x200,%eax
80103402:	39 c2                	cmp    %eax,%edx
80103404:	75 2a                	jne    80103430 <pipewrite+0xb0>
      if(p->readopen == 0 || myproc()->killed){
80103406:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010340c:	85 c0                	test   %eax,%eax
8010340e:	75 c0                	jne    801033d0 <pipewrite+0x50>
        release(&p->lock);
80103410:	83 ec 0c             	sub    $0xc,%esp
80103413:	53                   	push   %ebx
80103414:	e8 e7 0f 00 00       	call   80104400 <release>
        return -1;
80103419:	83 c4 10             	add    $0x10,%esp
8010341c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103421:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103424:	5b                   	pop    %ebx
80103425:	5e                   	pop    %esi
80103426:	5f                   	pop    %edi
80103427:	5d                   	pop    %ebp
80103428:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103429:	89 c2                	mov    %eax,%edx
8010342b:	90                   	nop
8010342c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103430:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103433:	8d 42 01             	lea    0x1(%edx),%eax
80103436:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010343a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103440:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103446:	0f b6 09             	movzbl (%ecx),%ecx
80103449:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010344d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103450:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103453:	0f 85 65 ff ff ff    	jne    801033be <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103459:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010345f:	83 ec 0c             	sub    $0xc,%esp
80103462:	50                   	push   %eax
80103463:	e8 a8 0a 00 00       	call   80103f10 <wakeup>
  release(&p->lock);
80103468:	89 1c 24             	mov    %ebx,(%esp)
8010346b:	e8 90 0f 00 00       	call   80104400 <release>
  return n;
80103470:	83 c4 10             	add    $0x10,%esp
80103473:	8b 45 10             	mov    0x10(%ebp),%eax
80103476:	eb a9                	jmp    80103421 <pipewrite+0xa1>
80103478:	90                   	nop
80103479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103480 <piperead>:
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	57                   	push   %edi
80103484:	56                   	push   %esi
80103485:	53                   	push   %ebx
80103486:	83 ec 18             	sub    $0x18,%esp
80103489:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010348c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010348f:	53                   	push   %ebx
80103490:	e8 bb 0e 00 00       	call   80104350 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103495:	83 c4 10             	add    $0x10,%esp
80103498:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010349e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034a4:	75 6a                	jne    80103510 <piperead+0x90>
801034a6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034ac:	85 f6                	test   %esi,%esi
801034ae:	0f 84 cc 00 00 00    	je     80103580 <piperead+0x100>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801034b4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ba:	eb 2d                	jmp    801034e9 <piperead+0x69>
801034bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034c0:	83 ec 08             	sub    $0x8,%esp
801034c3:	53                   	push   %ebx
801034c4:	56                   	push   %esi
801034c5:	e8 86 08 00 00       	call   80103d50 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034ca:	83 c4 10             	add    $0x10,%esp
801034cd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034d3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034d9:	75 35                	jne    80103510 <piperead+0x90>
801034db:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034e1:	85 d2                	test   %edx,%edx
801034e3:	0f 84 97 00 00 00    	je     80103580 <piperead+0x100>
    if(myproc()->killed){
801034e9:	e8 b2 02 00 00       	call   801037a0 <myproc>
801034ee:	8b 48 24             	mov    0x24(%eax),%ecx
801034f1:	85 c9                	test   %ecx,%ecx
801034f3:	74 cb                	je     801034c0 <piperead+0x40>
      release(&p->lock);
801034f5:	83 ec 0c             	sub    $0xc,%esp
801034f8:	53                   	push   %ebx
801034f9:	e8 02 0f 00 00       	call   80104400 <release>
      return -1;
801034fe:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103501:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
      return -1;
80103504:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103509:	5b                   	pop    %ebx
8010350a:	5e                   	pop    %esi
8010350b:	5f                   	pop    %edi
8010350c:	5d                   	pop    %ebp
8010350d:	c3                   	ret    
8010350e:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103510:	8b 45 10             	mov    0x10(%ebp),%eax
80103513:	85 c0                	test   %eax,%eax
80103515:	7e 69                	jle    80103580 <piperead+0x100>
    if(p->nread == p->nwrite)
80103517:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010351d:	31 c9                	xor    %ecx,%ecx
8010351f:	eb 15                	jmp    80103536 <piperead+0xb6>
80103521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103528:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010352e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103534:	74 5a                	je     80103590 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103536:	8d 70 01             	lea    0x1(%eax),%esi
80103539:	25 ff 01 00 00       	and    $0x1ff,%eax
8010353e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103544:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103549:	88 04 0f             	mov    %al,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010354c:	83 c1 01             	add    $0x1,%ecx
8010354f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103552:	75 d4                	jne    80103528 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103554:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010355a:	83 ec 0c             	sub    $0xc,%esp
8010355d:	50                   	push   %eax
8010355e:	e8 ad 09 00 00       	call   80103f10 <wakeup>
  release(&p->lock);
80103563:	89 1c 24             	mov    %ebx,(%esp)
80103566:	e8 95 0e 00 00       	call   80104400 <release>
  return i;
8010356b:	8b 45 10             	mov    0x10(%ebp),%eax
8010356e:	83 c4 10             	add    $0x10,%esp
}
80103571:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103574:	5b                   	pop    %ebx
80103575:	5e                   	pop    %esi
80103576:	5f                   	pop    %edi
80103577:	5d                   	pop    %ebp
80103578:	c3                   	ret    
80103579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103580:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103587:	eb cb                	jmp    80103554 <piperead+0xd4>
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103590:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103593:	eb bf                	jmp    80103554 <piperead+0xd4>
80103595:	66 90                	xchg   %ax,%ax
80103597:	66 90                	xchg   %ax,%ax
80103599:	66 90                	xchg   %ax,%ax
8010359b:	66 90                	xchg   %ax,%ax
8010359d:	66 90                	xchg   %ax,%ax
8010359f:	90                   	nop

801035a0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035a0:	55                   	push   %ebp
801035a1:	89 e5                	mov    %esp,%ebp
801035a3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035a4:	bb 54 2e 11 80       	mov    $0x80112e54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035a9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801035ac:	68 20 2e 11 80       	push   $0x80112e20
801035b1:	e8 9a 0d 00 00       	call   80104350 <acquire>
801035b6:	83 c4 10             	add    $0x10,%esp
801035b9:	eb 17                	jmp    801035d2 <allocproc+0x32>
801035bb:	90                   	nop
801035bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035c0:	81 c3 84 00 00 00    	add    $0x84,%ebx
801035c6:	81 fb 54 4f 11 80    	cmp    $0x80114f54,%ebx
801035cc:	0f 84 8e 00 00 00    	je     80103660 <allocproc+0xc0>
    if(p->state == UNUSED)
801035d2:	8b 43 0c             	mov    0xc(%ebx),%eax
801035d5:	85 c0                	test   %eax,%eax
801035d7:	75 e7                	jne    801035c0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035d9:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
  p->sysCallCount = 0;
  release(&ptable.lock);
801035de:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801035e1:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
  p->sysCallCount = 0;
  release(&ptable.lock);
801035e8:	68 20 2e 11 80       	push   $0x80112e20

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
801035ed:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
  p->sysCallCount = 0;
801035f4:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801035fb:	00 00 00 
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035fe:	8d 50 01             	lea    0x1(%eax),%edx
80103601:	89 43 10             	mov    %eax,0x10(%ebx)
80103604:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  // Add a variable to track the tracing and count of sys calls
  p->tracing = 0;
  p->sysCallCount = 0;
  release(&ptable.lock);
8010360a:	e8 f1 0d 00 00       	call   80104400 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010360f:	e8 6c ee ff ff       	call   80102480 <kalloc>
80103614:	83 c4 10             	add    $0x10,%esp
80103617:	85 c0                	test   %eax,%eax
80103619:	89 43 08             	mov    %eax,0x8(%ebx)
8010361c:	74 59                	je     80103677 <allocproc+0xd7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010361e:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103624:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103627:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010362c:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
8010362f:	c7 40 14 bd 57 10 80 	movl   $0x801057bd,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103636:	6a 14                	push   $0x14
80103638:	6a 00                	push   $0x0
8010363a:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
8010363b:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010363e:	e8 0d 0e 00 00       	call   80104450 <memset>
  p->context->eip = (uint)forkret;
80103643:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103646:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103649:	c7 40 10 80 36 10 80 	movl   $0x80103680,0x10(%eax)

  return p;
80103650:	89 d8                	mov    %ebx,%eax
}
80103652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103655:	c9                   	leave  
80103656:	c3                   	ret    
80103657:	89 f6                	mov    %esi,%esi
80103659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103660:	83 ec 0c             	sub    $0xc,%esp
80103663:	68 20 2e 11 80       	push   $0x80112e20
80103668:	e8 93 0d 00 00       	call   80104400 <release>
  return 0;
8010366d:	83 c4 10             	add    $0x10,%esp
80103670:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103672:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103675:	c9                   	leave  
80103676:	c3                   	ret    
  p->sysCallCount = 0;
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103677:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010367e:	eb d2                	jmp    80103652 <allocproc+0xb2>

80103680 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103680:	55                   	push   %ebp
80103681:	89 e5                	mov    %esp,%ebp
80103683:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103686:	68 20 2e 11 80       	push   $0x80112e20
8010368b:	e8 70 0d 00 00       	call   80104400 <release>

  if (first) {
80103690:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103695:	83 c4 10             	add    $0x10,%esp
80103698:	85 c0                	test   %eax,%eax
8010369a:	75 04                	jne    801036a0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010369c:	c9                   	leave  
8010369d:	c3                   	ret    
8010369e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
801036a0:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
801036a3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801036aa:	00 00 00 
    iinit(ROOTDEV);
801036ad:	6a 01                	push   $0x1
801036af:	e8 ac dd ff ff       	call   80101460 <iinit>
    initlog(ROOTDEV);
801036b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036bb:	e8 e0 f3 ff ff       	call   80102aa0 <initlog>
801036c0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036c3:	c9                   	leave  
801036c4:	c3                   	ret    
801036c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036d0 <getptable_proc>:
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

struct proc *getptable_proc(){
801036d0:	55                   	push   %ebp
    return ptable.proc;
}
801036d1:	b8 54 2e 11 80       	mov    $0x80112e54,%eax
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

struct proc *getptable_proc(){
801036d6:	89 e5                	mov    %esp,%ebp
    return ptable.proc;
}
801036d8:	5d                   	pop    %ebp
801036d9:	c3                   	ret    
801036da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801036e0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801036e6:	68 b5 75 10 80       	push   $0x801075b5
801036eb:	68 20 2e 11 80       	push   $0x80112e20
801036f0:	e8 fb 0a 00 00       	call   801041f0 <initlock>
}
801036f5:	83 c4 10             	add    $0x10,%esp
801036f8:	c9                   	leave  
801036f9:	c3                   	ret    
801036fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103700 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	56                   	push   %esi
80103704:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103705:	9c                   	pushf  
80103706:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
80103707:	f6 c4 02             	test   $0x2,%ah
8010370a:	75 5b                	jne    80103767 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
8010370c:	e8 cf ef ff ff       	call   801026e0 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103711:	8b 35 00 2e 11 80    	mov    0x80112e00,%esi
80103717:	85 f6                	test   %esi,%esi
80103719:	7e 3f                	jle    8010375a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
8010371b:	0f b6 15 80 28 11 80 	movzbl 0x80112880,%edx
80103722:	39 d0                	cmp    %edx,%eax
80103724:	74 30                	je     80103756 <mycpu+0x56>
80103726:	b9 30 29 11 80       	mov    $0x80112930,%ecx
8010372b:	31 d2                	xor    %edx,%edx
8010372d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103730:	83 c2 01             	add    $0x1,%edx
80103733:	39 f2                	cmp    %esi,%edx
80103735:	74 23                	je     8010375a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103737:	0f b6 19             	movzbl (%ecx),%ebx
8010373a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103740:	39 d8                	cmp    %ebx,%eax
80103742:	75 ec                	jne    80103730 <mycpu+0x30>
      return &cpus[i];
80103744:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010374a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010374d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010374e:	05 80 28 11 80       	add    $0x80112880,%eax
  }
  panic("unknown apicid\n");
}
80103753:	5e                   	pop    %esi
80103754:	5d                   	pop    %ebp
80103755:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103756:	31 d2                	xor    %edx,%edx
80103758:	eb ea                	jmp    80103744 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010375a:	83 ec 0c             	sub    $0xc,%esp
8010375d:	68 bc 75 10 80       	push   $0x801075bc
80103762:	e8 09 cc ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
80103767:	83 ec 0c             	sub    $0xc,%esp
8010376a:	68 98 76 10 80       	push   $0x80107698
8010376f:	e8 fc cb ff ff       	call   80100370 <panic>
80103774:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010377a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103780 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103786:	e8 75 ff ff ff       	call   80103700 <mycpu>
8010378b:	2d 80 28 11 80       	sub    $0x80112880,%eax
}
80103790:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
80103791:	c1 f8 04             	sar    $0x4,%eax
80103794:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010379a:	c3                   	ret    
8010379b:	90                   	nop
8010379c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037a0 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
801037a4:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
801037a7:	e8 c4 0a 00 00       	call   80104270 <pushcli>
  c = mycpu();
801037ac:	e8 4f ff ff ff       	call   80103700 <mycpu>
  p = c->proc;
801037b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801037b7:	e8 f4 0a 00 00       	call   801042b0 <popcli>
  return p;
}
801037bc:	83 c4 04             	add    $0x4,%esp
801037bf:	89 d8                	mov    %ebx,%eax
801037c1:	5b                   	pop    %ebx
801037c2:	5d                   	pop    %ebp
801037c3:	c3                   	ret    
801037c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037d0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	53                   	push   %ebx
801037d4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037d7:	e8 c4 fd ff ff       	call   801035a0 <allocproc>
801037dc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801037de:	a3 b8 a6 10 80       	mov    %eax,0x8010a6b8
  if((p->pgdir = setupkvm()) == 0)
801037e3:	e8 c8 35 00 00       	call   80106db0 <setupkvm>
801037e8:	85 c0                	test   %eax,%eax
801037ea:	89 43 04             	mov    %eax,0x4(%ebx)
801037ed:	0f 84 bd 00 00 00    	je     801038b0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037f3:	83 ec 04             	sub    $0x4,%esp
801037f6:	68 2c 00 00 00       	push   $0x2c
801037fb:	68 60 a5 10 80       	push   $0x8010a560
80103800:	50                   	push   %eax
80103801:	e8 ba 32 00 00       	call   80106ac0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103806:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103809:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010380f:	6a 4c                	push   $0x4c
80103811:	6a 00                	push   $0x0
80103813:	ff 73 18             	pushl  0x18(%ebx)
80103816:	e8 35 0c 00 00       	call   80104450 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010381b:	8b 43 18             	mov    0x18(%ebx),%eax
8010381e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103823:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103828:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010382b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010382f:	8b 43 18             	mov    0x18(%ebx),%eax
80103832:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103836:	8b 43 18             	mov    0x18(%ebx),%eax
80103839:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010383d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103841:	8b 43 18             	mov    0x18(%ebx),%eax
80103844:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103848:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010384c:	8b 43 18             	mov    0x18(%ebx),%eax
8010384f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103856:	8b 43 18             	mov    0x18(%ebx),%eax
80103859:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103860:	8b 43 18             	mov    0x18(%ebx),%eax
80103863:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010386a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010386d:	6a 10                	push   $0x10
8010386f:	68 e5 75 10 80       	push   $0x801075e5
80103874:	50                   	push   %eax
80103875:	e8 d6 0d 00 00       	call   80104650 <safestrcpy>
  p->cwd = namei("/");
8010387a:	c7 04 24 ee 75 10 80 	movl   $0x801075ee,(%esp)
80103881:	e8 2a e6 ff ff       	call   80101eb0 <namei>
80103886:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103889:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
80103890:	e8 bb 0a 00 00       	call   80104350 <acquire>

  p->state = RUNNABLE;
80103895:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010389c:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
801038a3:	e8 58 0b 00 00       	call   80104400 <release>
}
801038a8:	83 c4 10             	add    $0x10,%esp
801038ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038ae:	c9                   	leave  
801038af:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801038b0:	83 ec 0c             	sub    $0xc,%esp
801038b3:	68 cc 75 10 80       	push   $0x801075cc
801038b8:	e8 b3 ca ff ff       	call   80100370 <panic>
801038bd:	8d 76 00             	lea    0x0(%esi),%esi

801038c0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	56                   	push   %esi
801038c4:	53                   	push   %ebx
801038c5:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801038c8:	e8 a3 09 00 00       	call   80104270 <pushcli>
  c = mycpu();
801038cd:	e8 2e fe ff ff       	call   80103700 <mycpu>
  p = c->proc;
801038d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038d8:	e8 d3 09 00 00       	call   801042b0 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
801038dd:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
801038e0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038e2:	7e 34                	jle    80103918 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038e4:	83 ec 04             	sub    $0x4,%esp
801038e7:	01 c6                	add    %eax,%esi
801038e9:	56                   	push   %esi
801038ea:	50                   	push   %eax
801038eb:	ff 73 04             	pushl  0x4(%ebx)
801038ee:	e8 0d 33 00 00       	call   80106c00 <allocuvm>
801038f3:	83 c4 10             	add    $0x10,%esp
801038f6:	85 c0                	test   %eax,%eax
801038f8:	74 36                	je     80103930 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
801038fa:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
801038fd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038ff:	53                   	push   %ebx
80103900:	e8 ab 30 00 00       	call   801069b0 <switchuvm>
  return 0;
80103905:	83 c4 10             	add    $0x10,%esp
80103908:	31 c0                	xor    %eax,%eax
}
8010390a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010390d:	5b                   	pop    %ebx
8010390e:	5e                   	pop    %esi
8010390f:	5d                   	pop    %ebp
80103910:	c3                   	ret    
80103911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103918:	74 e0                	je     801038fa <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010391a:	83 ec 04             	sub    $0x4,%esp
8010391d:	01 c6                	add    %eax,%esi
8010391f:	56                   	push   %esi
80103920:	50                   	push   %eax
80103921:	ff 73 04             	pushl  0x4(%ebx)
80103924:	e8 d7 33 00 00       	call   80106d00 <deallocuvm>
80103929:	83 c4 10             	add    $0x10,%esp
8010392c:	85 c0                	test   %eax,%eax
8010392e:	75 ca                	jne    801038fa <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103935:	eb d3                	jmp    8010390a <growproc+0x4a>
80103937:	89 f6                	mov    %esi,%esi
80103939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103940 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103940:	55                   	push   %ebp
80103941:	89 e5                	mov    %esp,%ebp
80103943:	57                   	push   %edi
80103944:	56                   	push   %esi
80103945:	53                   	push   %ebx
80103946:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103949:	e8 22 09 00 00       	call   80104270 <pushcli>
  c = mycpu();
8010394e:	e8 ad fd ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103953:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103959:	e8 52 09 00 00       	call   801042b0 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
8010395e:	e8 3d fc ff ff       	call   801035a0 <allocproc>
80103963:	85 c0                	test   %eax,%eax
80103965:	89 c7                	mov    %eax,%edi
80103967:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010396a:	0f 84 b5 00 00 00    	je     80103a25 <fork+0xe5>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103970:	83 ec 08             	sub    $0x8,%esp
80103973:	ff 33                	pushl  (%ebx)
80103975:	ff 73 04             	pushl  0x4(%ebx)
80103978:	e8 03 35 00 00       	call   80106e80 <copyuvm>
8010397d:	83 c4 10             	add    $0x10,%esp
80103980:	85 c0                	test   %eax,%eax
80103982:	89 47 04             	mov    %eax,0x4(%edi)
80103985:	0f 84 a1 00 00 00    	je     80103a2c <fork+0xec>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
8010398b:	8b 03                	mov    (%ebx),%eax
8010398d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103990:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103992:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103995:	89 c8                	mov    %ecx,%eax
80103997:	8b 79 18             	mov    0x18(%ecx),%edi
8010399a:	8b 73 18             	mov    0x18(%ebx),%esi
8010399d:	b9 13 00 00 00       	mov    $0x13,%ecx
801039a2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039a4:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
801039a6:	8b 40 18             	mov    0x18(%eax),%eax
801039a9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
801039b0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801039b4:	85 c0                	test   %eax,%eax
801039b6:	74 13                	je     801039cb <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
801039b8:	83 ec 0c             	sub    $0xc,%esp
801039bb:	50                   	push   %eax
801039bc:	e8 1f d4 ff ff       	call   80100de0 <filedup>
801039c1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801039c4:	83 c4 10             	add    $0x10,%esp
801039c7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039cb:	83 c6 01             	add    $0x1,%esi
801039ce:	83 fe 10             	cmp    $0x10,%esi
801039d1:	75 dd                	jne    801039b0 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039d3:	83 ec 0c             	sub    $0xc,%esp
801039d6:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039d9:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039dc:	e8 4f dc ff ff       	call   80101630 <idup>
801039e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039e4:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039e7:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039ea:	8d 47 6c             	lea    0x6c(%edi),%eax
801039ed:	6a 10                	push   $0x10
801039ef:	53                   	push   %ebx
801039f0:	50                   	push   %eax
801039f1:	e8 5a 0c 00 00       	call   80104650 <safestrcpy>

  pid = np->pid;
801039f6:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
801039f9:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
80103a00:	e8 4b 09 00 00       	call   80104350 <acquire>

  np->state = RUNNABLE;
80103a05:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
80103a0c:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
80103a13:	e8 e8 09 00 00       	call   80104400 <release>

  return pid;
80103a18:	83 c4 10             	add    $0x10,%esp
80103a1b:	89 d8                	mov    %ebx,%eax
}
80103a1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a20:	5b                   	pop    %ebx
80103a21:	5e                   	pop    %esi
80103a22:	5f                   	pop    %edi
80103a23:	5d                   	pop    %ebp
80103a24:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a2a:	eb f1                	jmp    80103a1d <fork+0xdd>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
80103a2c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a2f:	83 ec 0c             	sub    $0xc,%esp
80103a32:	ff 77 08             	pushl  0x8(%edi)
80103a35:	e8 96 e8 ff ff       	call   801022d0 <kfree>
    np->kstack = 0;
80103a3a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a41:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a48:	83 c4 10             	add    $0x10,%esp
80103a4b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a50:	eb cb                	jmp    80103a1d <fork+0xdd>
80103a52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a60 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a60:	55                   	push   %ebp
80103a61:	89 e5                	mov    %esp,%ebp
80103a63:	57                   	push   %edi
80103a64:	56                   	push   %esi
80103a65:	53                   	push   %ebx
80103a66:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103a69:	e8 92 fc ff ff       	call   80103700 <mycpu>
80103a6e:	8d 78 04             	lea    0x4(%eax),%edi
80103a71:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103a73:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a7a:	00 00 00 
80103a7d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a80:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a81:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a84:	bb 54 2e 11 80       	mov    $0x80112e54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a89:	68 20 2e 11 80       	push   $0x80112e20
80103a8e:	e8 bd 08 00 00       	call   80104350 <acquire>
80103a93:	83 c4 10             	add    $0x10,%esp
80103a96:	eb 16                	jmp    80103aae <scheduler+0x4e>
80103a98:	90                   	nop
80103a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103aa0:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103aa6:	81 fb 54 4f 11 80    	cmp    $0x80114f54,%ebx
80103aac:	74 4a                	je     80103af8 <scheduler+0x98>
      if(p->state != RUNNABLE)
80103aae:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103ab2:	75 ec                	jne    80103aa0 <scheduler+0x40>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103ab4:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103ab7:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103abd:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103abe:	81 c3 84 00 00 00    	add    $0x84,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103ac4:	e8 e7 2e 00 00       	call   801069b0 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103ac9:	58                   	pop    %eax
80103aca:	5a                   	pop    %edx
80103acb:	ff 73 98             	pushl  -0x68(%ebx)
80103ace:	57                   	push   %edi
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103acf:	c7 43 88 04 00 00 00 	movl   $0x4,-0x78(%ebx)

      swtch(&(c->scheduler), p->context);
80103ad6:	e8 d0 0b 00 00       	call   801046ab <swtch>
      switchkvm();
80103adb:	e8 b0 2e 00 00       	call   80106990 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103ae0:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ae3:	81 fb 54 4f 11 80    	cmp    $0x80114f54,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103ae9:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103af0:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103af3:	75 b9                	jne    80103aae <scheduler+0x4e>
80103af5:	8d 76 00             	lea    0x0(%esi),%esi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103af8:	83 ec 0c             	sub    $0xc,%esp
80103afb:	68 20 2e 11 80       	push   $0x80112e20
80103b00:	e8 fb 08 00 00       	call   80104400 <release>

  }
80103b05:	83 c4 10             	add    $0x10,%esp
80103b08:	e9 73 ff ff ff       	jmp    80103a80 <scheduler+0x20>
80103b0d:	8d 76 00             	lea    0x0(%esi),%esi

80103b10 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	56                   	push   %esi
80103b14:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103b15:	e8 56 07 00 00       	call   80104270 <pushcli>
  c = mycpu();
80103b1a:	e8 e1 fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103b1f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b25:	e8 86 07 00 00       	call   801042b0 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103b2a:	83 ec 0c             	sub    $0xc,%esp
80103b2d:	68 20 2e 11 80       	push   $0x80112e20
80103b32:	e8 e9 07 00 00       	call   80104320 <holding>
80103b37:	83 c4 10             	add    $0x10,%esp
80103b3a:	85 c0                	test   %eax,%eax
80103b3c:	74 4f                	je     80103b8d <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103b3e:	e8 bd fb ff ff       	call   80103700 <mycpu>
80103b43:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b4a:	75 68                	jne    80103bb4 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103b4c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b50:	74 55                	je     80103ba7 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b52:	9c                   	pushf  
80103b53:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103b54:	f6 c4 02             	test   $0x2,%ah
80103b57:	75 41                	jne    80103b9a <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b59:	e8 a2 fb ff ff       	call   80103700 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b5e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b61:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103b67:	e8 94 fb ff ff       	call   80103700 <mycpu>
80103b6c:	83 ec 08             	sub    $0x8,%esp
80103b6f:	ff 70 04             	pushl  0x4(%eax)
80103b72:	53                   	push   %ebx
80103b73:	e8 33 0b 00 00       	call   801046ab <swtch>
  mycpu()->intena = intena;
80103b78:	e8 83 fb ff ff       	call   80103700 <mycpu>
}
80103b7d:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103b80:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103b86:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b89:	5b                   	pop    %ebx
80103b8a:	5e                   	pop    %esi
80103b8b:	5d                   	pop    %ebp
80103b8c:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103b8d:	83 ec 0c             	sub    $0xc,%esp
80103b90:	68 f0 75 10 80       	push   $0x801075f0
80103b95:	e8 d6 c7 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103b9a:	83 ec 0c             	sub    $0xc,%esp
80103b9d:	68 1c 76 10 80       	push   $0x8010761c
80103ba2:	e8 c9 c7 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103ba7:	83 ec 0c             	sub    $0xc,%esp
80103baa:	68 0e 76 10 80       	push   $0x8010760e
80103baf:	e8 bc c7 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103bb4:	83 ec 0c             	sub    $0xc,%esp
80103bb7:	68 02 76 10 80       	push   $0x80107602
80103bbc:	e8 af c7 ff ff       	call   80100370 <panic>
80103bc1:	eb 0d                	jmp    80103bd0 <exit>
80103bc3:	90                   	nop
80103bc4:	90                   	nop
80103bc5:	90                   	nop
80103bc6:	90                   	nop
80103bc7:	90                   	nop
80103bc8:	90                   	nop
80103bc9:	90                   	nop
80103bca:	90                   	nop
80103bcb:	90                   	nop
80103bcc:	90                   	nop
80103bcd:	90                   	nop
80103bce:	90                   	nop
80103bcf:	90                   	nop

80103bd0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103bd0:	55                   	push   %ebp
80103bd1:	89 e5                	mov    %esp,%ebp
80103bd3:	57                   	push   %edi
80103bd4:	56                   	push   %esi
80103bd5:	53                   	push   %ebx
80103bd6:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103bd9:	e8 92 06 00 00       	call   80104270 <pushcli>
  c = mycpu();
80103bde:	e8 1d fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103be3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103be9:	e8 c2 06 00 00       	call   801042b0 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103bee:	39 35 b8 a6 10 80    	cmp    %esi,0x8010a6b8
80103bf4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103bf7:	8d 7e 68             	lea    0x68(%esi),%edi
80103bfa:	0f 84 f1 00 00 00    	je     80103cf1 <exit+0x121>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103c00:	8b 03                	mov    (%ebx),%eax
80103c02:	85 c0                	test   %eax,%eax
80103c04:	74 12                	je     80103c18 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103c06:	83 ec 0c             	sub    $0xc,%esp
80103c09:	50                   	push   %eax
80103c0a:	e8 21 d2 ff ff       	call   80100e30 <fileclose>
      curproc->ofile[fd] = 0;
80103c0f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c15:	83 c4 10             	add    $0x10,%esp
80103c18:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103c1b:	39 df                	cmp    %ebx,%edi
80103c1d:	75 e1                	jne    80103c00 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103c1f:	e8 1c ef ff ff       	call   80102b40 <begin_op>
  iput(curproc->cwd);
80103c24:	83 ec 0c             	sub    $0xc,%esp
80103c27:	ff 76 68             	pushl  0x68(%esi)
80103c2a:	e8 61 db ff ff       	call   80101790 <iput>
  end_op();
80103c2f:	e8 7c ef ff ff       	call   80102bb0 <end_op>
  curproc->cwd = 0;
80103c34:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103c3b:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
80103c42:	e8 09 07 00 00       	call   80104350 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103c47:	8b 56 14             	mov    0x14(%esi),%edx
80103c4a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c4d:	b8 54 2e 11 80       	mov    $0x80112e54,%eax
80103c52:	eb 10                	jmp    80103c64 <exit+0x94>
80103c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c58:	05 84 00 00 00       	add    $0x84,%eax
80103c5d:	3d 54 4f 11 80       	cmp    $0x80114f54,%eax
80103c62:	74 1e                	je     80103c82 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103c64:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c68:	75 ee                	jne    80103c58 <exit+0x88>
80103c6a:	3b 50 20             	cmp    0x20(%eax),%edx
80103c6d:	75 e9                	jne    80103c58 <exit+0x88>
      p->state = RUNNABLE;
80103c6f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c76:	05 84 00 00 00       	add    $0x84,%eax
80103c7b:	3d 54 4f 11 80       	cmp    $0x80114f54,%eax
80103c80:	75 e2                	jne    80103c64 <exit+0x94>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c82:	8b 0d b8 a6 10 80    	mov    0x8010a6b8,%ecx
80103c88:	ba 54 2e 11 80       	mov    $0x80112e54,%edx
80103c8d:	eb 0f                	jmp    80103c9e <exit+0xce>
80103c8f:	90                   	nop

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c90:	81 c2 84 00 00 00    	add    $0x84,%edx
80103c96:	81 fa 54 4f 11 80    	cmp    $0x80114f54,%edx
80103c9c:	74 3a                	je     80103cd8 <exit+0x108>
    if(p->parent == curproc){
80103c9e:	39 72 14             	cmp    %esi,0x14(%edx)
80103ca1:	75 ed                	jne    80103c90 <exit+0xc0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103ca3:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103ca7:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103caa:	75 e4                	jne    80103c90 <exit+0xc0>
80103cac:	b8 54 2e 11 80       	mov    $0x80112e54,%eax
80103cb1:	eb 11                	jmp    80103cc4 <exit+0xf4>
80103cb3:	90                   	nop
80103cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cb8:	05 84 00 00 00       	add    $0x84,%eax
80103cbd:	3d 54 4f 11 80       	cmp    $0x80114f54,%eax
80103cc2:	74 cc                	je     80103c90 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103cc4:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cc8:	75 ee                	jne    80103cb8 <exit+0xe8>
80103cca:	3b 48 20             	cmp    0x20(%eax),%ecx
80103ccd:	75 e9                	jne    80103cb8 <exit+0xe8>
      p->state = RUNNABLE;
80103ccf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cd6:	eb e0                	jmp    80103cb8 <exit+0xe8>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103cd8:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103cdf:	e8 2c fe ff ff       	call   80103b10 <sched>
  panic("zombie exit");
80103ce4:	83 ec 0c             	sub    $0xc,%esp
80103ce7:	68 3d 76 10 80       	push   $0x8010763d
80103cec:	e8 7f c6 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103cf1:	83 ec 0c             	sub    $0xc,%esp
80103cf4:	68 30 76 10 80       	push   $0x80107630
80103cf9:	e8 72 c6 ff ff       	call   80100370 <panic>
80103cfe:	66 90                	xchg   %ax,%ax

80103d00 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103d00:	55                   	push   %ebp
80103d01:	89 e5                	mov    %esp,%ebp
80103d03:	53                   	push   %ebx
80103d04:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d07:	68 20 2e 11 80       	push   $0x80112e20
80103d0c:	e8 3f 06 00 00       	call   80104350 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d11:	e8 5a 05 00 00       	call   80104270 <pushcli>
  c = mycpu();
80103d16:	e8 e5 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d1b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d21:	e8 8a 05 00 00       	call   801042b0 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103d26:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d2d:	e8 de fd ff ff       	call   80103b10 <sched>
  release(&ptable.lock);
80103d32:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
80103d39:	e8 c2 06 00 00       	call   80104400 <release>
}
80103d3e:	83 c4 10             	add    $0x10,%esp
80103d41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d44:	c9                   	leave  
80103d45:	c3                   	ret    
80103d46:	8d 76 00             	lea    0x0(%esi),%esi
80103d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d50 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d50:	55                   	push   %ebp
80103d51:	89 e5                	mov    %esp,%ebp
80103d53:	57                   	push   %edi
80103d54:	56                   	push   %esi
80103d55:	53                   	push   %ebx
80103d56:	83 ec 0c             	sub    $0xc,%esp
80103d59:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d5c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d5f:	e8 0c 05 00 00       	call   80104270 <pushcli>
  c = mycpu();
80103d64:	e8 97 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d69:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d6f:	e8 3c 05 00 00       	call   801042b0 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103d74:	85 db                	test   %ebx,%ebx
80103d76:	0f 84 87 00 00 00    	je     80103e03 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103d7c:	85 f6                	test   %esi,%esi
80103d7e:	74 76                	je     80103df6 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d80:	81 fe 20 2e 11 80    	cmp    $0x80112e20,%esi
80103d86:	74 50                	je     80103dd8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d88:	83 ec 0c             	sub    $0xc,%esp
80103d8b:	68 20 2e 11 80       	push   $0x80112e20
80103d90:	e8 bb 05 00 00       	call   80104350 <acquire>
    release(lk);
80103d95:	89 34 24             	mov    %esi,(%esp)
80103d98:	e8 63 06 00 00       	call   80104400 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103d9d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103da0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103da7:	e8 64 fd ff ff       	call   80103b10 <sched>

  // Tidy up.
  p->chan = 0;
80103dac:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103db3:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
80103dba:	e8 41 06 00 00       	call   80104400 <release>
    acquire(lk);
80103dbf:	89 75 08             	mov    %esi,0x8(%ebp)
80103dc2:	83 c4 10             	add    $0x10,%esp
  }
}
80103dc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dc8:	5b                   	pop    %ebx
80103dc9:	5e                   	pop    %esi
80103dca:	5f                   	pop    %edi
80103dcb:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103dcc:	e9 7f 05 00 00       	jmp    80104350 <acquire>
80103dd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103dd8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103ddb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103de2:	e8 29 fd ff ff       	call   80103b10 <sched>

  // Tidy up.
  p->chan = 0;
80103de7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103dee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103df1:	5b                   	pop    %ebx
80103df2:	5e                   	pop    %esi
80103df3:	5f                   	pop    %edi
80103df4:	5d                   	pop    %ebp
80103df5:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103df6:	83 ec 0c             	sub    $0xc,%esp
80103df9:	68 4f 76 10 80       	push   $0x8010764f
80103dfe:	e8 6d c5 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103e03:	83 ec 0c             	sub    $0xc,%esp
80103e06:	68 49 76 10 80       	push   $0x80107649
80103e0b:	e8 60 c5 ff ff       	call   80100370 <panic>

80103e10 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103e10:	55                   	push   %ebp
80103e11:	89 e5                	mov    %esp,%ebp
80103e13:	56                   	push   %esi
80103e14:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103e15:	e8 56 04 00 00       	call   80104270 <pushcli>
  c = mycpu();
80103e1a:	e8 e1 f8 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103e1f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e25:	e8 86 04 00 00       	call   801042b0 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103e2a:	83 ec 0c             	sub    $0xc,%esp
80103e2d:	68 20 2e 11 80       	push   $0x80112e20
80103e32:	e8 19 05 00 00       	call   80104350 <acquire>
80103e37:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e3a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e3c:	bb 54 2e 11 80       	mov    $0x80112e54,%ebx
80103e41:	eb 13                	jmp    80103e56 <wait+0x46>
80103e43:	90                   	nop
80103e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e48:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103e4e:	81 fb 54 4f 11 80    	cmp    $0x80114f54,%ebx
80103e54:	74 22                	je     80103e78 <wait+0x68>
      if(p->parent != curproc)
80103e56:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e59:	75 ed                	jne    80103e48 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e5b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e5f:	74 35                	je     80103e96 <wait+0x86>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e61:	81 c3 84 00 00 00    	add    $0x84,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103e67:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e6c:	81 fb 54 4f 11 80    	cmp    $0x80114f54,%ebx
80103e72:	75 e2                	jne    80103e56 <wait+0x46>
80103e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103e78:	85 c0                	test   %eax,%eax
80103e7a:	74 70                	je     80103eec <wait+0xdc>
80103e7c:	8b 46 24             	mov    0x24(%esi),%eax
80103e7f:	85 c0                	test   %eax,%eax
80103e81:	75 69                	jne    80103eec <wait+0xdc>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103e83:	83 ec 08             	sub    $0x8,%esp
80103e86:	68 20 2e 11 80       	push   $0x80112e20
80103e8b:	56                   	push   %esi
80103e8c:	e8 bf fe ff ff       	call   80103d50 <sleep>
  }
80103e91:	83 c4 10             	add    $0x10,%esp
80103e94:	eb a4                	jmp    80103e3a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103e96:	83 ec 0c             	sub    $0xc,%esp
80103e99:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103e9c:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103e9f:	e8 2c e4 ff ff       	call   801022d0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103ea4:	5a                   	pop    %edx
80103ea5:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103ea8:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103eaf:	e8 7c 2e 00 00       	call   80106d30 <freevm>
        p->pid = 0;
80103eb4:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103ebb:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103ec2:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103ec6:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ecd:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103ed4:	c7 04 24 20 2e 11 80 	movl   $0x80112e20,(%esp)
80103edb:	e8 20 05 00 00       	call   80104400 <release>
        return pid;
80103ee0:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ee3:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103ee6:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ee8:	5b                   	pop    %ebx
80103ee9:	5e                   	pop    %esi
80103eea:	5d                   	pop    %ebp
80103eeb:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103eec:	83 ec 0c             	sub    $0xc,%esp
80103eef:	68 20 2e 11 80       	push   $0x80112e20
80103ef4:	e8 07 05 00 00       	call   80104400 <release>
      return -1;
80103ef9:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103efc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103eff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f04:	5b                   	pop    %ebx
80103f05:	5e                   	pop    %esi
80103f06:	5d                   	pop    %ebp
80103f07:	c3                   	ret    
80103f08:	90                   	nop
80103f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103f10 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103f10:	55                   	push   %ebp
80103f11:	89 e5                	mov    %esp,%ebp
80103f13:	53                   	push   %ebx
80103f14:	83 ec 10             	sub    $0x10,%esp
80103f17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103f1a:	68 20 2e 11 80       	push   $0x80112e20
80103f1f:	e8 2c 04 00 00       	call   80104350 <acquire>
80103f24:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f27:	b8 54 2e 11 80       	mov    $0x80112e54,%eax
80103f2c:	eb 0e                	jmp    80103f3c <wakeup+0x2c>
80103f2e:	66 90                	xchg   %ax,%ax
80103f30:	05 84 00 00 00       	add    $0x84,%eax
80103f35:	3d 54 4f 11 80       	cmp    $0x80114f54,%eax
80103f3a:	74 1e                	je     80103f5a <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
80103f3c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f40:	75 ee                	jne    80103f30 <wakeup+0x20>
80103f42:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f45:	75 e9                	jne    80103f30 <wakeup+0x20>
      p->state = RUNNABLE;
80103f47:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f4e:	05 84 00 00 00       	add    $0x84,%eax
80103f53:	3d 54 4f 11 80       	cmp    $0x80114f54,%eax
80103f58:	75 e2                	jne    80103f3c <wakeup+0x2c>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f5a:	c7 45 08 20 2e 11 80 	movl   $0x80112e20,0x8(%ebp)
}
80103f61:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f64:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f65:	e9 96 04 00 00       	jmp    80104400 <release>
80103f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103f70 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103f70:	55                   	push   %ebp
80103f71:	89 e5                	mov    %esp,%ebp
80103f73:	53                   	push   %ebx
80103f74:	83 ec 10             	sub    $0x10,%esp
80103f77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103f7a:	68 20 2e 11 80       	push   $0x80112e20
80103f7f:	e8 cc 03 00 00       	call   80104350 <acquire>
80103f84:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f87:	b8 54 2e 11 80       	mov    $0x80112e54,%eax
80103f8c:	eb 0e                	jmp    80103f9c <kill+0x2c>
80103f8e:	66 90                	xchg   %ax,%ax
80103f90:	05 84 00 00 00       	add    $0x84,%eax
80103f95:	3d 54 4f 11 80       	cmp    $0x80114f54,%eax
80103f9a:	74 3c                	je     80103fd8 <kill+0x68>
    if(p->pid == pid){
80103f9c:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f9f:	75 ef                	jne    80103f90 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103fa1:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103fa5:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103fac:	74 1a                	je     80103fc8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103fae:	83 ec 0c             	sub    $0xc,%esp
80103fb1:	68 20 2e 11 80       	push   $0x80112e20
80103fb6:	e8 45 04 00 00       	call   80104400 <release>
      return 0;
80103fbb:	83 c4 10             	add    $0x10,%esp
80103fbe:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103fc0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fc3:	c9                   	leave  
80103fc4:	c3                   	ret    
80103fc5:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103fc8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fcf:	eb dd                	jmp    80103fae <kill+0x3e>
80103fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103fd8:	83 ec 0c             	sub    $0xc,%esp
80103fdb:	68 20 2e 11 80       	push   $0x80112e20
80103fe0:	e8 1b 04 00 00       	call   80104400 <release>
  return -1;
80103fe5:	83 c4 10             	add    $0x10,%esp
80103fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103fed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ff0:	c9                   	leave  
80103ff1:	c3                   	ret    
80103ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104000 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104000:	55                   	push   %ebp
80104001:	89 e5                	mov    %esp,%ebp
80104003:	57                   	push   %edi
80104004:	56                   	push   %esi
80104005:	53                   	push   %ebx
80104006:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104009:	bb c0 2e 11 80       	mov    $0x80112ec0,%ebx
8010400e:	83 ec 3c             	sub    $0x3c,%esp
80104011:	eb 27                	jmp    8010403a <procdump+0x3a>
80104013:	90                   	nop
80104014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104018:	83 ec 0c             	sub    $0xc,%esp
8010401b:	68 1f 7a 10 80       	push   $0x80107a1f
80104020:	e8 3b c6 ff ff       	call   80100660 <cprintf>
80104025:	83 c4 10             	add    $0x10,%esp
80104028:	81 c3 84 00 00 00    	add    $0x84,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010402e:	81 fb c0 4f 11 80    	cmp    $0x80114fc0,%ebx
80104034:	0f 84 7e 00 00 00    	je     801040b8 <procdump+0xb8>
    if(p->state == UNUSED)
8010403a:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010403d:	85 c0                	test   %eax,%eax
8010403f:	74 e7                	je     80104028 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104041:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104044:	ba 60 76 10 80       	mov    $0x80107660,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104049:	77 11                	ja     8010405c <procdump+0x5c>
8010404b:	8b 14 85 c0 76 10 80 	mov    -0x7fef8940(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
80104052:	b8 60 76 10 80       	mov    $0x80107660,%eax
80104057:	85 d2                	test   %edx,%edx
80104059:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
8010405c:	53                   	push   %ebx
8010405d:	52                   	push   %edx
8010405e:	ff 73 a4             	pushl  -0x5c(%ebx)
80104061:	68 64 76 10 80       	push   $0x80107664
80104066:	e8 f5 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
8010406b:	83 c4 10             	add    $0x10,%esp
8010406e:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80104072:	75 a4                	jne    80104018 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104074:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104077:	83 ec 08             	sub    $0x8,%esp
8010407a:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010407d:	50                   	push   %eax
8010407e:	8b 43 b0             	mov    -0x50(%ebx),%eax
80104081:	8b 40 0c             	mov    0xc(%eax),%eax
80104084:	83 c0 08             	add    $0x8,%eax
80104087:	50                   	push   %eax
80104088:	e8 83 01 00 00       	call   80104210 <getcallerpcs>
8010408d:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
80104090:	8b 17                	mov    (%edi),%edx
80104092:	85 d2                	test   %edx,%edx
80104094:	74 82                	je     80104018 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104096:	83 ec 08             	sub    $0x8,%esp
80104099:	83 c7 04             	add    $0x4,%edi
8010409c:	52                   	push   %edx
8010409d:	68 a1 70 10 80       	push   $0x801070a1
801040a2:	e8 b9 c5 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
801040a7:	83 c4 10             	add    $0x10,%esp
801040aa:	39 f7                	cmp    %esi,%edi
801040ac:	75 e2                	jne    80104090 <procdump+0x90>
801040ae:	e9 65 ff ff ff       	jmp    80104018 <procdump+0x18>
801040b3:	90                   	nop
801040b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801040b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801040bb:	5b                   	pop    %ebx
801040bc:	5e                   	pop    %esi
801040bd:	5f                   	pop    %edi
801040be:	5d                   	pop    %ebp
801040bf:	c3                   	ret    

801040c0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801040c0:	55                   	push   %ebp
801040c1:	89 e5                	mov    %esp,%ebp
801040c3:	53                   	push   %ebx
801040c4:	83 ec 0c             	sub    $0xc,%esp
801040c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801040ca:	68 d8 76 10 80       	push   $0x801076d8
801040cf:	8d 43 04             	lea    0x4(%ebx),%eax
801040d2:	50                   	push   %eax
801040d3:	e8 18 01 00 00       	call   801041f0 <initlock>
  lk->name = name;
801040d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801040db:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801040e1:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
801040e4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801040eb:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801040ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040f1:	c9                   	leave  
801040f2:	c3                   	ret    
801040f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801040f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104100 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104100:	55                   	push   %ebp
80104101:	89 e5                	mov    %esp,%ebp
80104103:	56                   	push   %esi
80104104:	53                   	push   %ebx
80104105:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104108:	83 ec 0c             	sub    $0xc,%esp
8010410b:	8d 73 04             	lea    0x4(%ebx),%esi
8010410e:	56                   	push   %esi
8010410f:	e8 3c 02 00 00       	call   80104350 <acquire>
  while (lk->locked) {
80104114:	8b 13                	mov    (%ebx),%edx
80104116:	83 c4 10             	add    $0x10,%esp
80104119:	85 d2                	test   %edx,%edx
8010411b:	74 16                	je     80104133 <acquiresleep+0x33>
8010411d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104120:	83 ec 08             	sub    $0x8,%esp
80104123:	56                   	push   %esi
80104124:	53                   	push   %ebx
80104125:	e8 26 fc ff ff       	call   80103d50 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010412a:	8b 03                	mov    (%ebx),%eax
8010412c:	83 c4 10             	add    $0x10,%esp
8010412f:	85 c0                	test   %eax,%eax
80104131:	75 ed                	jne    80104120 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104133:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104139:	e8 62 f6 ff ff       	call   801037a0 <myproc>
8010413e:	8b 40 10             	mov    0x10(%eax),%eax
80104141:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104144:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104147:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010414a:	5b                   	pop    %ebx
8010414b:	5e                   	pop    %esi
8010414c:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
8010414d:	e9 ae 02 00 00       	jmp    80104400 <release>
80104152:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104160 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	56                   	push   %esi
80104164:	53                   	push   %ebx
80104165:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104168:	83 ec 0c             	sub    $0xc,%esp
8010416b:	8d 73 04             	lea    0x4(%ebx),%esi
8010416e:	56                   	push   %esi
8010416f:	e8 dc 01 00 00       	call   80104350 <acquire>
  lk->locked = 0;
80104174:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010417a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104181:	89 1c 24             	mov    %ebx,(%esp)
80104184:	e8 87 fd ff ff       	call   80103f10 <wakeup>
  release(&lk->lk);
80104189:	89 75 08             	mov    %esi,0x8(%ebp)
8010418c:	83 c4 10             	add    $0x10,%esp
}
8010418f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104192:	5b                   	pop    %ebx
80104193:	5e                   	pop    %esi
80104194:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104195:	e9 66 02 00 00       	jmp    80104400 <release>
8010419a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801041a0 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
801041a0:	55                   	push   %ebp
801041a1:	89 e5                	mov    %esp,%ebp
801041a3:	57                   	push   %edi
801041a4:	56                   	push   %esi
801041a5:	53                   	push   %ebx
801041a6:	31 ff                	xor    %edi,%edi
801041a8:	83 ec 18             	sub    $0x18,%esp
801041ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
801041ae:	8d 73 04             	lea    0x4(%ebx),%esi
801041b1:	56                   	push   %esi
801041b2:	e8 99 01 00 00       	call   80104350 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
801041b7:	8b 03                	mov    (%ebx),%eax
801041b9:	83 c4 10             	add    $0x10,%esp
801041bc:	85 c0                	test   %eax,%eax
801041be:	74 13                	je     801041d3 <holdingsleep+0x33>
801041c0:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
801041c3:	e8 d8 f5 ff ff       	call   801037a0 <myproc>
801041c8:	39 58 10             	cmp    %ebx,0x10(%eax)
801041cb:	0f 94 c0             	sete   %al
801041ce:	0f b6 c0             	movzbl %al,%eax
801041d1:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
801041d3:	83 ec 0c             	sub    $0xc,%esp
801041d6:	56                   	push   %esi
801041d7:	e8 24 02 00 00       	call   80104400 <release>
  return r;
}
801041dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041df:	89 f8                	mov    %edi,%eax
801041e1:	5b                   	pop    %ebx
801041e2:	5e                   	pop    %esi
801041e3:	5f                   	pop    %edi
801041e4:	5d                   	pop    %ebp
801041e5:	c3                   	ret    
801041e6:	66 90                	xchg   %ax,%ax
801041e8:	66 90                	xchg   %ax,%ax
801041ea:	66 90                	xchg   %ax,%ax
801041ec:	66 90                	xchg   %ax,%ax
801041ee:	66 90                	xchg   %ax,%ax

801041f0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801041f6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801041f9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801041ff:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104202:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104209:	5d                   	pop    %ebp
8010420a:	c3                   	ret    
8010420b:	90                   	nop
8010420c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104210 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104214:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104217:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010421a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010421d:	31 c0                	xor    %eax,%eax
8010421f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104220:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104226:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010422c:	77 1a                	ja     80104248 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010422e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104231:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104234:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104237:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104239:	83 f8 0a             	cmp    $0xa,%eax
8010423c:	75 e2                	jne    80104220 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010423e:	5b                   	pop    %ebx
8010423f:	5d                   	pop    %ebp
80104240:	c3                   	ret    
80104241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104248:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010424f:	83 c0 01             	add    $0x1,%eax
80104252:	83 f8 0a             	cmp    $0xa,%eax
80104255:	74 e7                	je     8010423e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104257:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010425e:	83 c0 01             	add    $0x1,%eax
80104261:	83 f8 0a             	cmp    $0xa,%eax
80104264:	75 e2                	jne    80104248 <getcallerpcs+0x38>
80104266:	eb d6                	jmp    8010423e <getcallerpcs+0x2e>
80104268:	90                   	nop
80104269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104270 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104270:	55                   	push   %ebp
80104271:	89 e5                	mov    %esp,%ebp
80104273:	53                   	push   %ebx
80104274:	83 ec 04             	sub    $0x4,%esp
80104277:	9c                   	pushf  
80104278:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104279:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010427a:	e8 81 f4 ff ff       	call   80103700 <mycpu>
8010427f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104285:	85 c0                	test   %eax,%eax
80104287:	75 11                	jne    8010429a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104289:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010428f:	e8 6c f4 ff ff       	call   80103700 <mycpu>
80104294:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010429a:	e8 61 f4 ff ff       	call   80103700 <mycpu>
8010429f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801042a6:	83 c4 04             	add    $0x4,%esp
801042a9:	5b                   	pop    %ebx
801042aa:	5d                   	pop    %ebp
801042ab:	c3                   	ret    
801042ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042b0 <popcli>:

void
popcli(void)
{
801042b0:	55                   	push   %ebp
801042b1:	89 e5                	mov    %esp,%ebp
801042b3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801042b6:	9c                   	pushf  
801042b7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801042b8:	f6 c4 02             	test   $0x2,%ah
801042bb:	75 52                	jne    8010430f <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801042bd:	e8 3e f4 ff ff       	call   80103700 <mycpu>
801042c2:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
801042c8:	8d 51 ff             	lea    -0x1(%ecx),%edx
801042cb:	85 d2                	test   %edx,%edx
801042cd:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801042d3:	78 2d                	js     80104302 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801042d5:	e8 26 f4 ff ff       	call   80103700 <mycpu>
801042da:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801042e0:	85 d2                	test   %edx,%edx
801042e2:	74 0c                	je     801042f0 <popcli+0x40>
    sti();
}
801042e4:	c9                   	leave  
801042e5:	c3                   	ret    
801042e6:	8d 76 00             	lea    0x0(%esi),%esi
801042e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801042f0:	e8 0b f4 ff ff       	call   80103700 <mycpu>
801042f5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801042fb:	85 c0                	test   %eax,%eax
801042fd:	74 e5                	je     801042e4 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
801042ff:	fb                   	sti    
    sti();
}
80104300:	c9                   	leave  
80104301:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
80104302:	83 ec 0c             	sub    $0xc,%esp
80104305:	68 fa 76 10 80       	push   $0x801076fa
8010430a:	e8 61 c0 ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
8010430f:	83 ec 0c             	sub    $0xc,%esp
80104312:	68 e3 76 10 80       	push   $0x801076e3
80104317:	e8 54 c0 ff ff       	call   80100370 <panic>
8010431c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104320 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	56                   	push   %esi
80104324:	53                   	push   %ebx
80104325:	8b 75 08             	mov    0x8(%ebp),%esi
80104328:	31 db                	xor    %ebx,%ebx
  int r;
  pushcli();
8010432a:	e8 41 ff ff ff       	call   80104270 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010432f:	8b 06                	mov    (%esi),%eax
80104331:	85 c0                	test   %eax,%eax
80104333:	74 10                	je     80104345 <holding+0x25>
80104335:	8b 5e 08             	mov    0x8(%esi),%ebx
80104338:	e8 c3 f3 ff ff       	call   80103700 <mycpu>
8010433d:	39 c3                	cmp    %eax,%ebx
8010433f:	0f 94 c3             	sete   %bl
80104342:	0f b6 db             	movzbl %bl,%ebx
  popcli();
80104345:	e8 66 ff ff ff       	call   801042b0 <popcli>
  return r;
}
8010434a:	89 d8                	mov    %ebx,%eax
8010434c:	5b                   	pop    %ebx
8010434d:	5e                   	pop    %esi
8010434e:	5d                   	pop    %ebp
8010434f:	c3                   	ret    

80104350 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104350:	55                   	push   %ebp
80104351:	89 e5                	mov    %esp,%ebp
80104353:	53                   	push   %ebx
80104354:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104357:	e8 14 ff ff ff       	call   80104270 <pushcli>
  if(holding(lk))
8010435c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010435f:	83 ec 0c             	sub    $0xc,%esp
80104362:	53                   	push   %ebx
80104363:	e8 b8 ff ff ff       	call   80104320 <holding>
80104368:	83 c4 10             	add    $0x10,%esp
8010436b:	85 c0                	test   %eax,%eax
8010436d:	0f 85 7d 00 00 00    	jne    801043f0 <acquire+0xa0>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104373:	ba 01 00 00 00       	mov    $0x1,%edx
80104378:	eb 09                	jmp    80104383 <acquire+0x33>
8010437a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104380:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104383:	89 d0                	mov    %edx,%eax
80104385:	f0 87 03             	lock xchg %eax,(%ebx)
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104388:	85 c0                	test   %eax,%eax
8010438a:	75 f4                	jne    80104380 <acquire+0x30>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
8010438c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
80104391:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104394:	e8 67 f3 ff ff       	call   80103700 <mycpu>
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104399:	89 ea                	mov    %ebp,%edx
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
8010439b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
8010439e:	89 43 08             	mov    %eax,0x8(%ebx)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801043a1:	31 c0                	xor    %eax,%eax
801043a3:	90                   	nop
801043a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801043a8:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801043ae:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801043b4:	77 1a                	ja     801043d0 <acquire+0x80>
      break;
    pcs[i] = ebp[1];     // saved %eip
801043b6:	8b 5a 04             	mov    0x4(%edx),%ebx
801043b9:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801043bc:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801043bf:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801043c1:	83 f8 0a             	cmp    $0xa,%eax
801043c4:	75 e2                	jne    801043a8 <acquire+0x58>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
}
801043c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043c9:	c9                   	leave  
801043ca:	c3                   	ret    
801043cb:	90                   	nop
801043cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801043d0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801043d7:	83 c0 01             	add    $0x1,%eax
801043da:	83 f8 0a             	cmp    $0xa,%eax
801043dd:	74 e7                	je     801043c6 <acquire+0x76>
    pcs[i] = 0;
801043df:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801043e6:	83 c0 01             	add    $0x1,%eax
801043e9:	83 f8 0a             	cmp    $0xa,%eax
801043ec:	75 e2                	jne    801043d0 <acquire+0x80>
801043ee:	eb d6                	jmp    801043c6 <acquire+0x76>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
801043f0:	83 ec 0c             	sub    $0xc,%esp
801043f3:	68 01 77 10 80       	push   $0x80107701
801043f8:	e8 73 bf ff ff       	call   80100370 <panic>
801043fd:	8d 76 00             	lea    0x0(%esi),%esi

80104400 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	53                   	push   %ebx
80104404:	83 ec 10             	sub    $0x10,%esp
80104407:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
8010440a:	53                   	push   %ebx
8010440b:	e8 10 ff ff ff       	call   80104320 <holding>
80104410:	83 c4 10             	add    $0x10,%esp
80104413:	85 c0                	test   %eax,%eax
80104415:	74 22                	je     80104439 <release+0x39>
    panic("release");

  lk->pcs[0] = 0;
80104417:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
8010441e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
80104425:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010442a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
80104430:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104433:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104434:	e9 77 fe ff ff       	jmp    801042b0 <popcli>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
80104439:	83 ec 0c             	sub    $0xc,%esp
8010443c:	68 09 77 10 80       	push   $0x80107709
80104441:	e8 2a bf ff ff       	call   80100370 <panic>
80104446:	66 90                	xchg   %ax,%ax
80104448:	66 90                	xchg   %ax,%ax
8010444a:	66 90                	xchg   %ax,%ax
8010444c:	66 90                	xchg   %ax,%ax
8010444e:	66 90                	xchg   %ax,%ax

80104450 <memset>:
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	57                   	push   %edi
80104454:	53                   	push   %ebx
80104455:	8b 55 08             	mov    0x8(%ebp),%edx
80104458:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010445b:	f6 c2 03             	test   $0x3,%dl
8010445e:	75 05                	jne    80104465 <memset+0x15>
80104460:	f6 c1 03             	test   $0x3,%cl
80104463:	74 13                	je     80104478 <memset+0x28>
80104465:	89 d7                	mov    %edx,%edi
80104467:	8b 45 0c             	mov    0xc(%ebp),%eax
8010446a:	fc                   	cld    
8010446b:	f3 aa                	rep stos %al,%es:(%edi)
8010446d:	5b                   	pop    %ebx
8010446e:	89 d0                	mov    %edx,%eax
80104470:	5f                   	pop    %edi
80104471:	5d                   	pop    %ebp
80104472:	c3                   	ret    
80104473:	90                   	nop
80104474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104478:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010447c:	c1 e9 02             	shr    $0x2,%ecx
8010447f:	89 fb                	mov    %edi,%ebx
80104481:	89 f8                	mov    %edi,%eax
80104483:	c1 e3 18             	shl    $0x18,%ebx
80104486:	c1 e0 10             	shl    $0x10,%eax
80104489:	09 d8                	or     %ebx,%eax
8010448b:	09 f8                	or     %edi,%eax
8010448d:	c1 e7 08             	shl    $0x8,%edi
80104490:	09 f8                	or     %edi,%eax
80104492:	89 d7                	mov    %edx,%edi
80104494:	fc                   	cld    
80104495:	f3 ab                	rep stos %eax,%es:(%edi)
80104497:	5b                   	pop    %ebx
80104498:	89 d0                	mov    %edx,%eax
8010449a:	5f                   	pop    %edi
8010449b:	5d                   	pop    %ebp
8010449c:	c3                   	ret    
8010449d:	8d 76 00             	lea    0x0(%esi),%esi

801044a0 <memcmp>:
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	57                   	push   %edi
801044a4:	56                   	push   %esi
801044a5:	8b 45 10             	mov    0x10(%ebp),%eax
801044a8:	53                   	push   %ebx
801044a9:	8b 75 0c             	mov    0xc(%ebp),%esi
801044ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044af:	85 c0                	test   %eax,%eax
801044b1:	74 29                	je     801044dc <memcmp+0x3c>
801044b3:	0f b6 13             	movzbl (%ebx),%edx
801044b6:	0f b6 0e             	movzbl (%esi),%ecx
801044b9:	38 d1                	cmp    %dl,%cl
801044bb:	75 2b                	jne    801044e8 <memcmp+0x48>
801044bd:	8d 78 ff             	lea    -0x1(%eax),%edi
801044c0:	31 c0                	xor    %eax,%eax
801044c2:	eb 14                	jmp    801044d8 <memcmp+0x38>
801044c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044c8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801044cd:	83 c0 01             	add    $0x1,%eax
801044d0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801044d4:	38 ca                	cmp    %cl,%dl
801044d6:	75 10                	jne    801044e8 <memcmp+0x48>
801044d8:	39 f8                	cmp    %edi,%eax
801044da:	75 ec                	jne    801044c8 <memcmp+0x28>
801044dc:	5b                   	pop    %ebx
801044dd:	31 c0                	xor    %eax,%eax
801044df:	5e                   	pop    %esi
801044e0:	5f                   	pop    %edi
801044e1:	5d                   	pop    %ebp
801044e2:	c3                   	ret    
801044e3:	90                   	nop
801044e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044e8:	0f b6 c2             	movzbl %dl,%eax
801044eb:	5b                   	pop    %ebx
801044ec:	29 c8                	sub    %ecx,%eax
801044ee:	5e                   	pop    %esi
801044ef:	5f                   	pop    %edi
801044f0:	5d                   	pop    %ebp
801044f1:	c3                   	ret    
801044f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104500 <memmove>:
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	56                   	push   %esi
80104504:	53                   	push   %ebx
80104505:	8b 45 08             	mov    0x8(%ebp),%eax
80104508:	8b 75 0c             	mov    0xc(%ebp),%esi
8010450b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010450e:	39 c6                	cmp    %eax,%esi
80104510:	73 2e                	jae    80104540 <memmove+0x40>
80104512:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104515:	39 c8                	cmp    %ecx,%eax
80104517:	73 27                	jae    80104540 <memmove+0x40>
80104519:	85 db                	test   %ebx,%ebx
8010451b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010451e:	74 17                	je     80104537 <memmove+0x37>
80104520:	29 d9                	sub    %ebx,%ecx
80104522:	89 cb                	mov    %ecx,%ebx
80104524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104528:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010452c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010452f:	83 ea 01             	sub    $0x1,%edx
80104532:	83 fa ff             	cmp    $0xffffffff,%edx
80104535:	75 f1                	jne    80104528 <memmove+0x28>
80104537:	5b                   	pop    %ebx
80104538:	5e                   	pop    %esi
80104539:	5d                   	pop    %ebp
8010453a:	c3                   	ret    
8010453b:	90                   	nop
8010453c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104540:	31 d2                	xor    %edx,%edx
80104542:	85 db                	test   %ebx,%ebx
80104544:	74 f1                	je     80104537 <memmove+0x37>
80104546:	8d 76 00             	lea    0x0(%esi),%esi
80104549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104550:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104554:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104557:	83 c2 01             	add    $0x1,%edx
8010455a:	39 d3                	cmp    %edx,%ebx
8010455c:	75 f2                	jne    80104550 <memmove+0x50>
8010455e:	5b                   	pop    %ebx
8010455f:	5e                   	pop    %esi
80104560:	5d                   	pop    %ebp
80104561:	c3                   	ret    
80104562:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104570 <memcpy>:
80104570:	55                   	push   %ebp
80104571:	89 e5                	mov    %esp,%ebp
80104573:	5d                   	pop    %ebp
80104574:	eb 8a                	jmp    80104500 <memmove>
80104576:	8d 76 00             	lea    0x0(%esi),%esi
80104579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104580 <strncmp>:
80104580:	55                   	push   %ebp
80104581:	89 e5                	mov    %esp,%ebp
80104583:	57                   	push   %edi
80104584:	56                   	push   %esi
80104585:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104588:	53                   	push   %ebx
80104589:	8b 7d 08             	mov    0x8(%ebp),%edi
8010458c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010458f:	85 c9                	test   %ecx,%ecx
80104591:	74 37                	je     801045ca <strncmp+0x4a>
80104593:	0f b6 17             	movzbl (%edi),%edx
80104596:	0f b6 1e             	movzbl (%esi),%ebx
80104599:	84 d2                	test   %dl,%dl
8010459b:	74 3f                	je     801045dc <strncmp+0x5c>
8010459d:	38 d3                	cmp    %dl,%bl
8010459f:	75 3b                	jne    801045dc <strncmp+0x5c>
801045a1:	8d 47 01             	lea    0x1(%edi),%eax
801045a4:	01 cf                	add    %ecx,%edi
801045a6:	eb 1b                	jmp    801045c3 <strncmp+0x43>
801045a8:	90                   	nop
801045a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045b0:	0f b6 10             	movzbl (%eax),%edx
801045b3:	84 d2                	test   %dl,%dl
801045b5:	74 21                	je     801045d8 <strncmp+0x58>
801045b7:	0f b6 19             	movzbl (%ecx),%ebx
801045ba:	83 c0 01             	add    $0x1,%eax
801045bd:	89 ce                	mov    %ecx,%esi
801045bf:	38 da                	cmp    %bl,%dl
801045c1:	75 19                	jne    801045dc <strncmp+0x5c>
801045c3:	39 c7                	cmp    %eax,%edi
801045c5:	8d 4e 01             	lea    0x1(%esi),%ecx
801045c8:	75 e6                	jne    801045b0 <strncmp+0x30>
801045ca:	5b                   	pop    %ebx
801045cb:	31 c0                	xor    %eax,%eax
801045cd:	5e                   	pop    %esi
801045ce:	5f                   	pop    %edi
801045cf:	5d                   	pop    %ebp
801045d0:	c3                   	ret    
801045d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045d8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
801045dc:	0f b6 c2             	movzbl %dl,%eax
801045df:	29 d8                	sub    %ebx,%eax
801045e1:	5b                   	pop    %ebx
801045e2:	5e                   	pop    %esi
801045e3:	5f                   	pop    %edi
801045e4:	5d                   	pop    %ebp
801045e5:	c3                   	ret    
801045e6:	8d 76 00             	lea    0x0(%esi),%esi
801045e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045f0 <strncpy>:
801045f0:	55                   	push   %ebp
801045f1:	89 e5                	mov    %esp,%ebp
801045f3:	56                   	push   %esi
801045f4:	53                   	push   %ebx
801045f5:	8b 45 08             	mov    0x8(%ebp),%eax
801045f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801045fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045fe:	89 c2                	mov    %eax,%edx
80104600:	eb 19                	jmp    8010461b <strncpy+0x2b>
80104602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104608:	83 c3 01             	add    $0x1,%ebx
8010460b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010460f:	83 c2 01             	add    $0x1,%edx
80104612:	84 c9                	test   %cl,%cl
80104614:	88 4a ff             	mov    %cl,-0x1(%edx)
80104617:	74 09                	je     80104622 <strncpy+0x32>
80104619:	89 f1                	mov    %esi,%ecx
8010461b:	85 c9                	test   %ecx,%ecx
8010461d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104620:	7f e6                	jg     80104608 <strncpy+0x18>
80104622:	31 c9                	xor    %ecx,%ecx
80104624:	85 f6                	test   %esi,%esi
80104626:	7e 17                	jle    8010463f <strncpy+0x4f>
80104628:	90                   	nop
80104629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104630:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104634:	89 f3                	mov    %esi,%ebx
80104636:	83 c1 01             	add    $0x1,%ecx
80104639:	29 cb                	sub    %ecx,%ebx
8010463b:	85 db                	test   %ebx,%ebx
8010463d:	7f f1                	jg     80104630 <strncpy+0x40>
8010463f:	5b                   	pop    %ebx
80104640:	5e                   	pop    %esi
80104641:	5d                   	pop    %ebp
80104642:	c3                   	ret    
80104643:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104650 <safestrcpy>:
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	56                   	push   %esi
80104654:	53                   	push   %ebx
80104655:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104658:	8b 45 08             	mov    0x8(%ebp),%eax
8010465b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010465e:	85 c9                	test   %ecx,%ecx
80104660:	7e 26                	jle    80104688 <safestrcpy+0x38>
80104662:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104666:	89 c1                	mov    %eax,%ecx
80104668:	eb 17                	jmp    80104681 <safestrcpy+0x31>
8010466a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104670:	83 c2 01             	add    $0x1,%edx
80104673:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104677:	83 c1 01             	add    $0x1,%ecx
8010467a:	84 db                	test   %bl,%bl
8010467c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010467f:	74 04                	je     80104685 <safestrcpy+0x35>
80104681:	39 f2                	cmp    %esi,%edx
80104683:	75 eb                	jne    80104670 <safestrcpy+0x20>
80104685:	c6 01 00             	movb   $0x0,(%ecx)
80104688:	5b                   	pop    %ebx
80104689:	5e                   	pop    %esi
8010468a:	5d                   	pop    %ebp
8010468b:	c3                   	ret    
8010468c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104690 <strlen>:
80104690:	55                   	push   %ebp
80104691:	31 c0                	xor    %eax,%eax
80104693:	89 e5                	mov    %esp,%ebp
80104695:	8b 55 08             	mov    0x8(%ebp),%edx
80104698:	80 3a 00             	cmpb   $0x0,(%edx)
8010469b:	74 0c                	je     801046a9 <strlen+0x19>
8010469d:	8d 76 00             	lea    0x0(%esi),%esi
801046a0:	83 c0 01             	add    $0x1,%eax
801046a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801046a7:	75 f7                	jne    801046a0 <strlen+0x10>
801046a9:	5d                   	pop    %ebp
801046aa:	c3                   	ret    

801046ab <swtch>:
801046ab:	8b 44 24 04          	mov    0x4(%esp),%eax
801046af:	8b 54 24 08          	mov    0x8(%esp),%edx
801046b3:	55                   	push   %ebp
801046b4:	53                   	push   %ebx
801046b5:	56                   	push   %esi
801046b6:	57                   	push   %edi
801046b7:	89 20                	mov    %esp,(%eax)
801046b9:	89 d4                	mov    %edx,%esp
801046bb:	5f                   	pop    %edi
801046bc:	5e                   	pop    %esi
801046bd:	5b                   	pop    %ebx
801046be:	5d                   	pop    %ebp
801046bf:	c3                   	ret    

801046c0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	53                   	push   %ebx
801046c4:	83 ec 04             	sub    $0x4,%esp
801046c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
801046ca:	e8 d1 f0 ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801046cf:	8b 00                	mov    (%eax),%eax
801046d1:	39 d8                	cmp    %ebx,%eax
801046d3:	76 1b                	jbe    801046f0 <fetchint+0x30>
801046d5:	8d 53 04             	lea    0x4(%ebx),%edx
801046d8:	39 d0                	cmp    %edx,%eax
801046da:	72 14                	jb     801046f0 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
801046dc:	8b 45 0c             	mov    0xc(%ebp),%eax
801046df:	8b 13                	mov    (%ebx),%edx
801046e1:	89 10                	mov    %edx,(%eax)
  return 0;
801046e3:	31 c0                	xor    %eax,%eax
}
801046e5:	83 c4 04             	add    $0x4,%esp
801046e8:	5b                   	pop    %ebx
801046e9:	5d                   	pop    %ebp
801046ea:	c3                   	ret    
801046eb:	90                   	nop
801046ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
801046f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046f5:	eb ee                	jmp    801046e5 <fetchint+0x25>
801046f7:	89 f6                	mov    %esi,%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104700 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104700:	55                   	push   %ebp
80104701:	89 e5                	mov    %esp,%ebp
80104703:	53                   	push   %ebx
80104704:	83 ec 04             	sub    $0x4,%esp
80104707:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010470a:	e8 91 f0 ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz)
8010470f:	39 18                	cmp    %ebx,(%eax)
80104711:	76 29                	jbe    8010473c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104713:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104716:	89 da                	mov    %ebx,%edx
80104718:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010471a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010471c:	39 c3                	cmp    %eax,%ebx
8010471e:	73 1c                	jae    8010473c <fetchstr+0x3c>
    if(*s == 0)
80104720:	80 3b 00             	cmpb   $0x0,(%ebx)
80104723:	75 10                	jne    80104735 <fetchstr+0x35>
80104725:	eb 29                	jmp    80104750 <fetchstr+0x50>
80104727:	89 f6                	mov    %esi,%esi
80104729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104730:	80 3a 00             	cmpb   $0x0,(%edx)
80104733:	74 1b                	je     80104750 <fetchstr+0x50>

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104735:	83 c2 01             	add    $0x1,%edx
80104738:	39 d0                	cmp    %edx,%eax
8010473a:	77 f4                	ja     80104730 <fetchstr+0x30>
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
8010473c:	83 c4 04             	add    $0x4,%esp
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
    return -1;
8010473f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104744:	5b                   	pop    %ebx
80104745:	5d                   	pop    %ebp
80104746:	c3                   	ret    
80104747:	89 f6                	mov    %esi,%esi
80104749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104750:	83 c4 04             	add    $0x4,%esp
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
80104753:	89 d0                	mov    %edx,%eax
80104755:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104757:	5b                   	pop    %ebx
80104758:	5d                   	pop    %ebp
80104759:	c3                   	ret    
8010475a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104760 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104760:	55                   	push   %ebp
80104761:	89 e5                	mov    %esp,%ebp
80104763:	56                   	push   %esi
80104764:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104765:	e8 36 f0 ff ff       	call   801037a0 <myproc>
8010476a:	8b 40 18             	mov    0x18(%eax),%eax
8010476d:	8b 55 08             	mov    0x8(%ebp),%edx
80104770:	8b 40 44             	mov    0x44(%eax),%eax
80104773:	8d 1c 90             	lea    (%eax,%edx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();
80104776:	e8 25 f0 ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010477b:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010477d:	8d 73 04             	lea    0x4(%ebx),%esi
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104780:	39 c6                	cmp    %eax,%esi
80104782:	73 1c                	jae    801047a0 <argint+0x40>
80104784:	8d 53 08             	lea    0x8(%ebx),%edx
80104787:	39 d0                	cmp    %edx,%eax
80104789:	72 15                	jb     801047a0 <argint+0x40>
    return -1;
  *ip = *(int*)(addr);
8010478b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010478e:	8b 53 04             	mov    0x4(%ebx),%edx
80104791:	89 10                	mov    %edx,(%eax)
  return 0;
80104793:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
80104795:	5b                   	pop    %ebx
80104796:	5e                   	pop    %esi
80104797:	5d                   	pop    %ebp
80104798:	c3                   	ret    
80104799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
801047a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047a5:	eb ee                	jmp    80104795 <argint+0x35>
801047a7:	89 f6                	mov    %esi,%esi
801047a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047b0 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	56                   	push   %esi
801047b4:	53                   	push   %ebx
801047b5:	83 ec 10             	sub    $0x10,%esp
801047b8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
801047bb:	e8 e0 ef ff ff       	call   801037a0 <myproc>
801047c0:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
801047c2:	8d 45 f4             	lea    -0xc(%ebp),%eax
801047c5:	83 ec 08             	sub    $0x8,%esp
801047c8:	50                   	push   %eax
801047c9:	ff 75 08             	pushl  0x8(%ebp)
801047cc:	e8 8f ff ff ff       	call   80104760 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
801047d1:	c1 e8 1f             	shr    $0x1f,%eax
801047d4:	83 c4 10             	add    $0x10,%esp
801047d7:	84 c0                	test   %al,%al
801047d9:	75 2d                	jne    80104808 <argptr+0x58>
801047db:	89 d8                	mov    %ebx,%eax
801047dd:	c1 e8 1f             	shr    $0x1f,%eax
801047e0:	84 c0                	test   %al,%al
801047e2:	75 24                	jne    80104808 <argptr+0x58>
801047e4:	8b 16                	mov    (%esi),%edx
801047e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801047e9:	39 c2                	cmp    %eax,%edx
801047eb:	76 1b                	jbe    80104808 <argptr+0x58>
801047ed:	01 c3                	add    %eax,%ebx
801047ef:	39 da                	cmp    %ebx,%edx
801047f1:	72 15                	jb     80104808 <argptr+0x58>
    return -1;
  *pp = (char*)i;
801047f3:	8b 55 0c             	mov    0xc(%ebp),%edx
801047f6:	89 02                	mov    %eax,(%edx)
  return 0;
801047f8:	31 c0                	xor    %eax,%eax
}
801047fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047fd:	5b                   	pop    %ebx
801047fe:	5e                   	pop    %esi
801047ff:	5d                   	pop    %ebp
80104800:	c3                   	ret    
80104801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
80104808:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010480d:	eb eb                	jmp    801047fa <argptr+0x4a>
8010480f:	90                   	nop

80104810 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104810:	55                   	push   %ebp
80104811:	89 e5                	mov    %esp,%ebp
80104813:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104816:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104819:	50                   	push   %eax
8010481a:	ff 75 08             	pushl  0x8(%ebp)
8010481d:	e8 3e ff ff ff       	call   80104760 <argint>
80104822:	83 c4 10             	add    $0x10,%esp
80104825:	85 c0                	test   %eax,%eax
80104827:	78 17                	js     80104840 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104829:	83 ec 08             	sub    $0x8,%esp
8010482c:	ff 75 0c             	pushl  0xc(%ebp)
8010482f:	ff 75 f4             	pushl  -0xc(%ebp)
80104832:	e8 c9 fe ff ff       	call   80104700 <fetchstr>
80104837:	83 c4 10             	add    $0x10,%esp
}
8010483a:	c9                   	leave  
8010483b:	c3                   	ret    
8010483c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104840:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104845:	c9                   	leave  
80104846:	c3                   	ret    
80104847:	89 f6                	mov    %esi,%esi
80104849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104850 <syscall>:
    "getprocs",
};

void
syscall(void)
{
80104850:	55                   	push   %ebp
80104851:	89 e5                	mov    %esp,%ebp
80104853:	57                   	push   %edi
80104854:	56                   	push   %esi
80104855:	53                   	push   %ebx
80104856:	83 ec 1c             	sub    $0x1c,%esp
  int num;
  struct proc *curproc = myproc();
80104859:	e8 42 ef ff ff       	call   801037a0 <myproc>

  num = curproc->tf->eax;
8010485e:	8b 78 18             	mov    0x18(%eax),%edi

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
80104861:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104863:	8b 77 1c             	mov    0x1c(%edi),%esi
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104866:	8d 56 ff             	lea    -0x1(%esi),%edx
80104869:	83 fa 16             	cmp    $0x16,%edx
8010486c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010486f:	77 57                	ja     801048c8 <syscall+0x78>
80104871:	8b 04 b5 80 77 10 80 	mov    -0x7fef8880(,%esi,4),%eax
80104878:	85 c0                	test   %eax,%eax
8010487a:	74 4c                	je     801048c8 <syscall+0x78>
    curproc->tf->eax = syscalls[num]();
8010487c:	ff d0                	call   *%eax
8010487e:	89 47 1c             	mov    %eax,0x1c(%edi)
    if(curproc->tracing){
80104881:	8b 43 7c             	mov    0x7c(%ebx),%eax
80104884:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104887:	85 c0                	test   %eax,%eax
80104889:	74 5c                	je     801048e7 <syscall+0x97>
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
8010488b:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010488e:	83 ec 08             	sub    $0x8,%esp
80104891:	ff b3 80 00 00 00    	pushl  0x80(%ebx)
80104897:	56                   	push   %esi
80104898:	8d 84 00 20 a0 10 80 	lea    -0x7fef5fe0(%eax,%eax,1),%eax
8010489f:	50                   	push   %eax
801048a0:	8d 43 6c             	lea    0x6c(%ebx),%eax
801048a3:	50                   	push   %eax
801048a4:	ff 73 10             	pushl  0x10(%ebx)
801048a7:	68 14 77 10 80       	push   $0x80107714
801048ac:	e8 af bd ff ff       	call   80100660 <cprintf>
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
  curproc->sysCallCount++;
801048b1:	83 83 80 00 00 00 01 	addl   $0x1,0x80(%ebx)

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
    if(curproc->tracing){
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
801048b8:	83 c4 20             	add    $0x20,%esp
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
  curproc->sysCallCount++;
}
801048bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048be:	5b                   	pop    %ebx
801048bf:	5e                   	pop    %esi
801048c0:	5f                   	pop    %edi
801048c1:	5d                   	pop    %ebp
801048c2:	c3                   	ret    
801048c3:	90                   	nop
801048c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->tracing){
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
    }
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
801048c8:	8d 43 6c             	lea    0x6c(%ebx),%eax
    curproc->tf->eax = syscalls[num]();
    if(curproc->tracing){
        cprintf("PID: %d Name: %s Sys call:%s (%d) Total number of sys calls: %d\n", curproc->pid, curproc->name, syscallNames[num-1], num, curproc->sysCallCount);
    }
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801048cb:	56                   	push   %esi
801048cc:	50                   	push   %eax
801048cd:	ff 73 10             	pushl  0x10(%ebx)
801048d0:	68 55 77 10 80       	push   $0x80107755
801048d5:	e8 86 bd ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
801048da:	8b 43 18             	mov    0x18(%ebx),%eax
801048dd:	83 c4 10             	add    $0x10,%esp
801048e0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
  curproc->sysCallCount++;
801048e7:	83 83 80 00 00 00 01 	addl   $0x1,0x80(%ebx)
}
801048ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048f1:	5b                   	pop    %ebx
801048f2:	5e                   	pop    %esi
801048f3:	5f                   	pop    %edi
801048f4:	5d                   	pop    %ebp
801048f5:	c3                   	ret    
801048f6:	66 90                	xchg   %ax,%ax
801048f8:	66 90                	xchg   %ax,%ax
801048fa:	66 90                	xchg   %ax,%ax
801048fc:	66 90                	xchg   %ax,%ax
801048fe:	66 90                	xchg   %ax,%ax

80104900 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104900:	55                   	push   %ebp
80104901:	89 e5                	mov    %esp,%ebp
80104903:	57                   	push   %edi
80104904:	56                   	push   %esi
80104905:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104906:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104909:	83 ec 34             	sub    $0x34,%esp
8010490c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
8010490f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104912:	56                   	push   %esi
80104913:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104914:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104917:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
8010491a:	e8 b1 d5 ff ff       	call   80101ed0 <nameiparent>
8010491f:	83 c4 10             	add    $0x10,%esp
80104922:	85 c0                	test   %eax,%eax
80104924:	0f 84 f6 00 00 00    	je     80104a20 <create+0x120>
    return 0;
  ilock(dp);
8010492a:	83 ec 0c             	sub    $0xc,%esp
8010492d:	89 c7                	mov    %eax,%edi
8010492f:	50                   	push   %eax
80104930:	e8 2b cd ff ff       	call   80101660 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104935:	83 c4 0c             	add    $0xc,%esp
80104938:	6a 00                	push   $0x0
8010493a:	56                   	push   %esi
8010493b:	57                   	push   %edi
8010493c:	e8 4f d2 ff ff       	call   80101b90 <dirlookup>
80104941:	83 c4 10             	add    $0x10,%esp
80104944:	85 c0                	test   %eax,%eax
80104946:	89 c3                	mov    %eax,%ebx
80104948:	74 56                	je     801049a0 <create+0xa0>
    iunlockput(dp);
8010494a:	83 ec 0c             	sub    $0xc,%esp
8010494d:	57                   	push   %edi
8010494e:	e8 9d cf ff ff       	call   801018f0 <iunlockput>
    ilock(ip);
80104953:	89 1c 24             	mov    %ebx,(%esp)
80104956:	e8 05 cd ff ff       	call   80101660 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010495b:	83 c4 10             	add    $0x10,%esp
8010495e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104963:	75 1b                	jne    80104980 <create+0x80>
80104965:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
8010496a:	89 d8                	mov    %ebx,%eax
8010496c:	75 12                	jne    80104980 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010496e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104971:	5b                   	pop    %ebx
80104972:	5e                   	pop    %esi
80104973:	5f                   	pop    %edi
80104974:	5d                   	pop    %ebp
80104975:	c3                   	ret    
80104976:	8d 76 00             	lea    0x0(%esi),%esi
80104979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if((ip = dirlookup(dp, name, 0)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104980:	83 ec 0c             	sub    $0xc,%esp
80104983:	53                   	push   %ebx
80104984:	e8 67 cf ff ff       	call   801018f0 <iunlockput>
    return 0;
80104989:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010498c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
8010498f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104991:	5b                   	pop    %ebx
80104992:	5e                   	pop    %esi
80104993:	5f                   	pop    %edi
80104994:	5d                   	pop    %ebp
80104995:	c3                   	ret    
80104996:	8d 76 00             	lea    0x0(%esi),%esi
80104999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
801049a0:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
801049a4:	83 ec 08             	sub    $0x8,%esp
801049a7:	50                   	push   %eax
801049a8:	ff 37                	pushl  (%edi)
801049aa:	e8 41 cb ff ff       	call   801014f0 <ialloc>
801049af:	83 c4 10             	add    $0x10,%esp
801049b2:	85 c0                	test   %eax,%eax
801049b4:	89 c3                	mov    %eax,%ebx
801049b6:	0f 84 cc 00 00 00    	je     80104a88 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
801049bc:	83 ec 0c             	sub    $0xc,%esp
801049bf:	50                   	push   %eax
801049c0:	e8 9b cc ff ff       	call   80101660 <ilock>
  ip->major = major;
801049c5:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
801049c9:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
801049cd:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
801049d1:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
801049d5:	b8 01 00 00 00       	mov    $0x1,%eax
801049da:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
801049de:	89 1c 24             	mov    %ebx,(%esp)
801049e1:	e8 ca cb ff ff       	call   801015b0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
801049e6:	83 c4 10             	add    $0x10,%esp
801049e9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
801049ee:	74 40                	je     80104a30 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
801049f0:	83 ec 04             	sub    $0x4,%esp
801049f3:	ff 73 04             	pushl  0x4(%ebx)
801049f6:	56                   	push   %esi
801049f7:	57                   	push   %edi
801049f8:	e8 f3 d3 ff ff       	call   80101df0 <dirlink>
801049fd:	83 c4 10             	add    $0x10,%esp
80104a00:	85 c0                	test   %eax,%eax
80104a02:	78 77                	js     80104a7b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104a04:	83 ec 0c             	sub    $0xc,%esp
80104a07:	57                   	push   %edi
80104a08:	e8 e3 ce ff ff       	call   801018f0 <iunlockput>

  return ip;
80104a0d:	83 c4 10             	add    $0x10,%esp
}
80104a10:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104a13:	89 d8                	mov    %ebx,%eax
}
80104a15:	5b                   	pop    %ebx
80104a16:	5e                   	pop    %esi
80104a17:	5f                   	pop    %edi
80104a18:	5d                   	pop    %ebp
80104a19:	c3                   	ret    
80104a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104a20:	31 c0                	xor    %eax,%eax
80104a22:	e9 47 ff ff ff       	jmp    8010496e <create+0x6e>
80104a27:	89 f6                	mov    %esi,%esi
80104a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104a30:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104a35:	83 ec 0c             	sub    $0xc,%esp
80104a38:	57                   	push   %edi
80104a39:	e8 72 cb ff ff       	call   801015b0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104a3e:	83 c4 0c             	add    $0xc,%esp
80104a41:	ff 73 04             	pushl  0x4(%ebx)
80104a44:	68 fc 77 10 80       	push   $0x801077fc
80104a49:	53                   	push   %ebx
80104a4a:	e8 a1 d3 ff ff       	call   80101df0 <dirlink>
80104a4f:	83 c4 10             	add    $0x10,%esp
80104a52:	85 c0                	test   %eax,%eax
80104a54:	78 18                	js     80104a6e <create+0x16e>
80104a56:	83 ec 04             	sub    $0x4,%esp
80104a59:	ff 77 04             	pushl  0x4(%edi)
80104a5c:	68 fb 77 10 80       	push   $0x801077fb
80104a61:	53                   	push   %ebx
80104a62:	e8 89 d3 ff ff       	call   80101df0 <dirlink>
80104a67:	83 c4 10             	add    $0x10,%esp
80104a6a:	85 c0                	test   %eax,%eax
80104a6c:	79 82                	jns    801049f0 <create+0xf0>
      panic("create dots");
80104a6e:	83 ec 0c             	sub    $0xc,%esp
80104a71:	68 ef 77 10 80       	push   $0x801077ef
80104a76:	e8 f5 b8 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104a7b:	83 ec 0c             	sub    $0xc,%esp
80104a7e:	68 fe 77 10 80       	push   $0x801077fe
80104a83:	e8 e8 b8 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104a88:	83 ec 0c             	sub    $0xc,%esp
80104a8b:	68 e0 77 10 80       	push   $0x801077e0
80104a90:	e8 db b8 ff ff       	call   80100370 <panic>
80104a95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104aa0 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	56                   	push   %esi
80104aa4:	53                   	push   %ebx
80104aa5:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104aa7:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104aaa:	89 d3                	mov    %edx,%ebx
80104aac:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104aaf:	50                   	push   %eax
80104ab0:	6a 00                	push   $0x0
80104ab2:	e8 a9 fc ff ff       	call   80104760 <argint>
80104ab7:	83 c4 10             	add    $0x10,%esp
80104aba:	85 c0                	test   %eax,%eax
80104abc:	78 32                	js     80104af0 <argfd.constprop.0+0x50>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104abe:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ac2:	77 2c                	ja     80104af0 <argfd.constprop.0+0x50>
80104ac4:	e8 d7 ec ff ff       	call   801037a0 <myproc>
80104ac9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104acc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104ad0:	85 c0                	test   %eax,%eax
80104ad2:	74 1c                	je     80104af0 <argfd.constprop.0+0x50>
    return -1;
  if(pfd)
80104ad4:	85 f6                	test   %esi,%esi
80104ad6:	74 02                	je     80104ada <argfd.constprop.0+0x3a>
    *pfd = fd;
80104ad8:	89 16                	mov    %edx,(%esi)
  if(pf)
80104ada:	85 db                	test   %ebx,%ebx
80104adc:	74 22                	je     80104b00 <argfd.constprop.0+0x60>
    *pf = f;
80104ade:	89 03                	mov    %eax,(%ebx)
  return 0;
80104ae0:	31 c0                	xor    %eax,%eax
}
80104ae2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ae5:	5b                   	pop    %ebx
80104ae6:	5e                   	pop    %esi
80104ae7:	5d                   	pop    %ebp
80104ae8:	c3                   	ret    
80104ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104af0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104af3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}
80104af8:	5b                   	pop    %ebx
80104af9:	5e                   	pop    %esi
80104afa:	5d                   	pop    %ebp
80104afb:	c3                   	ret    
80104afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104b00:	31 c0                	xor    %eax,%eax
80104b02:	eb de                	jmp    80104ae2 <argfd.constprop.0+0x42>
80104b04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104b10 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104b10:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104b11:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104b13:	89 e5                	mov    %esp,%ebp
80104b15:	56                   	push   %esi
80104b16:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104b17:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104b1a:	83 ec 10             	sub    $0x10,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104b1d:	e8 7e ff ff ff       	call   80104aa0 <argfd.constprop.0>
80104b22:	85 c0                	test   %eax,%eax
80104b24:	78 1a                	js     80104b40 <sys_dup+0x30>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104b26:	31 db                	xor    %ebx,%ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
80104b28:	8b 75 f4             	mov    -0xc(%ebp),%esi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80104b2b:	e8 70 ec ff ff       	call   801037a0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80104b30:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104b34:	85 d2                	test   %edx,%edx
80104b36:	74 18                	je     80104b50 <sys_dup+0x40>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104b38:	83 c3 01             	add    $0x1,%ebx
80104b3b:	83 fb 10             	cmp    $0x10,%ebx
80104b3e:	75 f0                	jne    80104b30 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104b40:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104b43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104b48:	5b                   	pop    %ebx
80104b49:	5e                   	pop    %esi
80104b4a:	5d                   	pop    %ebp
80104b4b:	c3                   	ret    
80104b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80104b50:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104b54:	83 ec 0c             	sub    $0xc,%esp
80104b57:	ff 75 f4             	pushl  -0xc(%ebp)
80104b5a:	e8 81 c2 ff ff       	call   80100de0 <filedup>
  return fd;
80104b5f:	83 c4 10             	add    $0x10,%esp
}
80104b62:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
80104b65:	89 d8                	mov    %ebx,%eax
}
80104b67:	5b                   	pop    %ebx
80104b68:	5e                   	pop    %esi
80104b69:	5d                   	pop    %ebp
80104b6a:	c3                   	ret    
80104b6b:	90                   	nop
80104b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b70 <sys_read>:

int
sys_read(void)
{
80104b70:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b71:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104b73:	89 e5                	mov    %esp,%ebp
80104b75:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b7b:	e8 20 ff ff ff       	call   80104aa0 <argfd.constprop.0>
80104b80:	85 c0                	test   %eax,%eax
80104b82:	78 4c                	js     80104bd0 <sys_read+0x60>
80104b84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b87:	83 ec 08             	sub    $0x8,%esp
80104b8a:	50                   	push   %eax
80104b8b:	6a 02                	push   $0x2
80104b8d:	e8 ce fb ff ff       	call   80104760 <argint>
80104b92:	83 c4 10             	add    $0x10,%esp
80104b95:	85 c0                	test   %eax,%eax
80104b97:	78 37                	js     80104bd0 <sys_read+0x60>
80104b99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b9c:	83 ec 04             	sub    $0x4,%esp
80104b9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104ba2:	50                   	push   %eax
80104ba3:	6a 01                	push   $0x1
80104ba5:	e8 06 fc ff ff       	call   801047b0 <argptr>
80104baa:	83 c4 10             	add    $0x10,%esp
80104bad:	85 c0                	test   %eax,%eax
80104baf:	78 1f                	js     80104bd0 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104bb1:	83 ec 04             	sub    $0x4,%esp
80104bb4:	ff 75 f0             	pushl  -0x10(%ebp)
80104bb7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bba:	ff 75 ec             	pushl  -0x14(%ebp)
80104bbd:	e8 8e c3 ff ff       	call   80100f50 <fileread>
80104bc2:	83 c4 10             	add    $0x10,%esp
}
80104bc5:	c9                   	leave  
80104bc6:	c3                   	ret    
80104bc7:	89 f6                	mov    %esi,%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104bd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104bd5:	c9                   	leave  
80104bd6:	c3                   	ret    
80104bd7:	89 f6                	mov    %esi,%esi
80104bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104be0 <sys_write>:

int
sys_write(void)
{
80104be0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104be1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104be3:	89 e5                	mov    %esp,%ebp
80104be5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104be8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104beb:	e8 b0 fe ff ff       	call   80104aa0 <argfd.constprop.0>
80104bf0:	85 c0                	test   %eax,%eax
80104bf2:	78 4c                	js     80104c40 <sys_write+0x60>
80104bf4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bf7:	83 ec 08             	sub    $0x8,%esp
80104bfa:	50                   	push   %eax
80104bfb:	6a 02                	push   $0x2
80104bfd:	e8 5e fb ff ff       	call   80104760 <argint>
80104c02:	83 c4 10             	add    $0x10,%esp
80104c05:	85 c0                	test   %eax,%eax
80104c07:	78 37                	js     80104c40 <sys_write+0x60>
80104c09:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c0c:	83 ec 04             	sub    $0x4,%esp
80104c0f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c12:	50                   	push   %eax
80104c13:	6a 01                	push   $0x1
80104c15:	e8 96 fb ff ff       	call   801047b0 <argptr>
80104c1a:	83 c4 10             	add    $0x10,%esp
80104c1d:	85 c0                	test   %eax,%eax
80104c1f:	78 1f                	js     80104c40 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104c21:	83 ec 04             	sub    $0x4,%esp
80104c24:	ff 75 f0             	pushl  -0x10(%ebp)
80104c27:	ff 75 f4             	pushl  -0xc(%ebp)
80104c2a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c2d:	e8 ae c3 ff ff       	call   80100fe0 <filewrite>
80104c32:	83 c4 10             	add    $0x10,%esp
}
80104c35:	c9                   	leave  
80104c36:	c3                   	ret    
80104c37:	89 f6                	mov    %esi,%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104c40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104c45:	c9                   	leave  
80104c46:	c3                   	ret    
80104c47:	89 f6                	mov    %esi,%esi
80104c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c50 <sys_close>:

int
sys_close(void)
{
80104c50:	55                   	push   %ebp
80104c51:	89 e5                	mov    %esp,%ebp
80104c53:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104c56:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c59:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c5c:	e8 3f fe ff ff       	call   80104aa0 <argfd.constprop.0>
80104c61:	85 c0                	test   %eax,%eax
80104c63:	78 2b                	js     80104c90 <sys_close+0x40>
    return -1;
  myproc()->ofile[fd] = 0;
80104c65:	e8 36 eb ff ff       	call   801037a0 <myproc>
80104c6a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104c6d:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
80104c70:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c77:	00 
  fileclose(f);
80104c78:	ff 75 f4             	pushl  -0xc(%ebp)
80104c7b:	e8 b0 c1 ff ff       	call   80100e30 <fileclose>
  return 0;
80104c80:	83 c4 10             	add    $0x10,%esp
80104c83:	31 c0                	xor    %eax,%eax
}
80104c85:	c9                   	leave  
80104c86:	c3                   	ret    
80104c87:	89 f6                	mov    %esi,%esi
80104c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104c95:	c9                   	leave  
80104c96:	c3                   	ret    
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ca0 <sys_fstat>:

int
sys_fstat(void)
{
80104ca0:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ca1:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104ca3:	89 e5                	mov    %esp,%ebp
80104ca5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ca8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104cab:	e8 f0 fd ff ff       	call   80104aa0 <argfd.constprop.0>
80104cb0:	85 c0                	test   %eax,%eax
80104cb2:	78 2c                	js     80104ce0 <sys_fstat+0x40>
80104cb4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cb7:	83 ec 04             	sub    $0x4,%esp
80104cba:	6a 14                	push   $0x14
80104cbc:	50                   	push   %eax
80104cbd:	6a 01                	push   $0x1
80104cbf:	e8 ec fa ff ff       	call   801047b0 <argptr>
80104cc4:	83 c4 10             	add    $0x10,%esp
80104cc7:	85 c0                	test   %eax,%eax
80104cc9:	78 15                	js     80104ce0 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104ccb:	83 ec 08             	sub    $0x8,%esp
80104cce:	ff 75 f4             	pushl  -0xc(%ebp)
80104cd1:	ff 75 f0             	pushl  -0x10(%ebp)
80104cd4:	e8 27 c2 ff ff       	call   80100f00 <filestat>
80104cd9:	83 c4 10             	add    $0x10,%esp
}
80104cdc:	c9                   	leave  
80104cdd:	c3                   	ret    
80104cde:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104ce5:	c9                   	leave  
80104ce6:	c3                   	ret    
80104ce7:	89 f6                	mov    %esi,%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	57                   	push   %edi
80104cf4:	56                   	push   %esi
80104cf5:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104cf6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104cf9:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104cfc:	50                   	push   %eax
80104cfd:	6a 00                	push   $0x0
80104cff:	e8 0c fb ff ff       	call   80104810 <argstr>
80104d04:	83 c4 10             	add    $0x10,%esp
80104d07:	85 c0                	test   %eax,%eax
80104d09:	0f 88 fb 00 00 00    	js     80104e0a <sys_link+0x11a>
80104d0f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104d12:	83 ec 08             	sub    $0x8,%esp
80104d15:	50                   	push   %eax
80104d16:	6a 01                	push   $0x1
80104d18:	e8 f3 fa ff ff       	call   80104810 <argstr>
80104d1d:	83 c4 10             	add    $0x10,%esp
80104d20:	85 c0                	test   %eax,%eax
80104d22:	0f 88 e2 00 00 00    	js     80104e0a <sys_link+0x11a>
    return -1;

  begin_op();
80104d28:	e8 13 de ff ff       	call   80102b40 <begin_op>
  if((ip = namei(old)) == 0){
80104d2d:	83 ec 0c             	sub    $0xc,%esp
80104d30:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d33:	e8 78 d1 ff ff       	call   80101eb0 <namei>
80104d38:	83 c4 10             	add    $0x10,%esp
80104d3b:	85 c0                	test   %eax,%eax
80104d3d:	89 c3                	mov    %eax,%ebx
80104d3f:	0f 84 f3 00 00 00    	je     80104e38 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104d45:	83 ec 0c             	sub    $0xc,%esp
80104d48:	50                   	push   %eax
80104d49:	e8 12 c9 ff ff       	call   80101660 <ilock>
  if(ip->type == T_DIR){
80104d4e:	83 c4 10             	add    $0x10,%esp
80104d51:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d56:	0f 84 c4 00 00 00    	je     80104e20 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104d5c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104d61:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104d64:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104d67:	53                   	push   %ebx
80104d68:	e8 43 c8 ff ff       	call   801015b0 <iupdate>
  iunlock(ip);
80104d6d:	89 1c 24             	mov    %ebx,(%esp)
80104d70:	e8 cb c9 ff ff       	call   80101740 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104d75:	58                   	pop    %eax
80104d76:	5a                   	pop    %edx
80104d77:	57                   	push   %edi
80104d78:	ff 75 d0             	pushl  -0x30(%ebp)
80104d7b:	e8 50 d1 ff ff       	call   80101ed0 <nameiparent>
80104d80:	83 c4 10             	add    $0x10,%esp
80104d83:	85 c0                	test   %eax,%eax
80104d85:	89 c6                	mov    %eax,%esi
80104d87:	74 5b                	je     80104de4 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104d89:	83 ec 0c             	sub    $0xc,%esp
80104d8c:	50                   	push   %eax
80104d8d:	e8 ce c8 ff ff       	call   80101660 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104d92:	83 c4 10             	add    $0x10,%esp
80104d95:	8b 03                	mov    (%ebx),%eax
80104d97:	39 06                	cmp    %eax,(%esi)
80104d99:	75 3d                	jne    80104dd8 <sys_link+0xe8>
80104d9b:	83 ec 04             	sub    $0x4,%esp
80104d9e:	ff 73 04             	pushl  0x4(%ebx)
80104da1:	57                   	push   %edi
80104da2:	56                   	push   %esi
80104da3:	e8 48 d0 ff ff       	call   80101df0 <dirlink>
80104da8:	83 c4 10             	add    $0x10,%esp
80104dab:	85 c0                	test   %eax,%eax
80104dad:	78 29                	js     80104dd8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104daf:	83 ec 0c             	sub    $0xc,%esp
80104db2:	56                   	push   %esi
80104db3:	e8 38 cb ff ff       	call   801018f0 <iunlockput>
  iput(ip);
80104db8:	89 1c 24             	mov    %ebx,(%esp)
80104dbb:	e8 d0 c9 ff ff       	call   80101790 <iput>

  end_op();
80104dc0:	e8 eb dd ff ff       	call   80102bb0 <end_op>

  return 0;
80104dc5:	83 c4 10             	add    $0x10,%esp
80104dc8:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104dca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dcd:	5b                   	pop    %ebx
80104dce:	5e                   	pop    %esi
80104dcf:	5f                   	pop    %edi
80104dd0:	5d                   	pop    %ebp
80104dd1:	c3                   	ret    
80104dd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104dd8:	83 ec 0c             	sub    $0xc,%esp
80104ddb:	56                   	push   %esi
80104ddc:	e8 0f cb ff ff       	call   801018f0 <iunlockput>
    goto bad;
80104de1:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104de4:	83 ec 0c             	sub    $0xc,%esp
80104de7:	53                   	push   %ebx
80104de8:	e8 73 c8 ff ff       	call   80101660 <ilock>
  ip->nlink--;
80104ded:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104df2:	89 1c 24             	mov    %ebx,(%esp)
80104df5:	e8 b6 c7 ff ff       	call   801015b0 <iupdate>
  iunlockput(ip);
80104dfa:	89 1c 24             	mov    %ebx,(%esp)
80104dfd:	e8 ee ca ff ff       	call   801018f0 <iunlockput>
  end_op();
80104e02:	e8 a9 dd ff ff       	call   80102bb0 <end_op>
  return -1;
80104e07:	83 c4 10             	add    $0x10,%esp
}
80104e0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104e0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e12:	5b                   	pop    %ebx
80104e13:	5e                   	pop    %esi
80104e14:	5f                   	pop    %edi
80104e15:	5d                   	pop    %ebp
80104e16:	c3                   	ret    
80104e17:	89 f6                	mov    %esi,%esi
80104e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104e20:	83 ec 0c             	sub    $0xc,%esp
80104e23:	53                   	push   %ebx
80104e24:	e8 c7 ca ff ff       	call   801018f0 <iunlockput>
    end_op();
80104e29:	e8 82 dd ff ff       	call   80102bb0 <end_op>
    return -1;
80104e2e:	83 c4 10             	add    $0x10,%esp
80104e31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e36:	eb 92                	jmp    80104dca <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104e38:	e8 73 dd ff ff       	call   80102bb0 <end_op>
    return -1;
80104e3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e42:	eb 86                	jmp    80104dca <sys_link+0xda>
80104e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104e50 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	57                   	push   %edi
80104e54:	56                   	push   %esi
80104e55:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104e56:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104e59:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104e5c:	50                   	push   %eax
80104e5d:	6a 00                	push   $0x0
80104e5f:	e8 ac f9 ff ff       	call   80104810 <argstr>
80104e64:	83 c4 10             	add    $0x10,%esp
80104e67:	85 c0                	test   %eax,%eax
80104e69:	0f 88 82 01 00 00    	js     80104ff1 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104e6f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80104e72:	e8 c9 dc ff ff       	call   80102b40 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104e77:	83 ec 08             	sub    $0x8,%esp
80104e7a:	53                   	push   %ebx
80104e7b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e7e:	e8 4d d0 ff ff       	call   80101ed0 <nameiparent>
80104e83:	83 c4 10             	add    $0x10,%esp
80104e86:	85 c0                	test   %eax,%eax
80104e88:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e8b:	0f 84 6a 01 00 00    	je     80104ffb <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80104e91:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104e94:	83 ec 0c             	sub    $0xc,%esp
80104e97:	56                   	push   %esi
80104e98:	e8 c3 c7 ff ff       	call   80101660 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104e9d:	58                   	pop    %eax
80104e9e:	5a                   	pop    %edx
80104e9f:	68 fc 77 10 80       	push   $0x801077fc
80104ea4:	53                   	push   %ebx
80104ea5:	e8 c6 cc ff ff       	call   80101b70 <namecmp>
80104eaa:	83 c4 10             	add    $0x10,%esp
80104ead:	85 c0                	test   %eax,%eax
80104eaf:	0f 84 fc 00 00 00    	je     80104fb1 <sys_unlink+0x161>
80104eb5:	83 ec 08             	sub    $0x8,%esp
80104eb8:	68 fb 77 10 80       	push   $0x801077fb
80104ebd:	53                   	push   %ebx
80104ebe:	e8 ad cc ff ff       	call   80101b70 <namecmp>
80104ec3:	83 c4 10             	add    $0x10,%esp
80104ec6:	85 c0                	test   %eax,%eax
80104ec8:	0f 84 e3 00 00 00    	je     80104fb1 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104ece:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104ed1:	83 ec 04             	sub    $0x4,%esp
80104ed4:	50                   	push   %eax
80104ed5:	53                   	push   %ebx
80104ed6:	56                   	push   %esi
80104ed7:	e8 b4 cc ff ff       	call   80101b90 <dirlookup>
80104edc:	83 c4 10             	add    $0x10,%esp
80104edf:	85 c0                	test   %eax,%eax
80104ee1:	89 c3                	mov    %eax,%ebx
80104ee3:	0f 84 c8 00 00 00    	je     80104fb1 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80104ee9:	83 ec 0c             	sub    $0xc,%esp
80104eec:	50                   	push   %eax
80104eed:	e8 6e c7 ff ff       	call   80101660 <ilock>

  if(ip->nlink < 1)
80104ef2:	83 c4 10             	add    $0x10,%esp
80104ef5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104efa:	0f 8e 24 01 00 00    	jle    80105024 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104f00:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f05:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104f08:	74 66                	je     80104f70 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104f0a:	83 ec 04             	sub    $0x4,%esp
80104f0d:	6a 10                	push   $0x10
80104f0f:	6a 00                	push   $0x0
80104f11:	56                   	push   %esi
80104f12:	e8 39 f5 ff ff       	call   80104450 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f17:	6a 10                	push   $0x10
80104f19:	ff 75 c4             	pushl  -0x3c(%ebp)
80104f1c:	56                   	push   %esi
80104f1d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f20:	e8 1b cb ff ff       	call   80101a40 <writei>
80104f25:	83 c4 20             	add    $0x20,%esp
80104f28:	83 f8 10             	cmp    $0x10,%eax
80104f2b:	0f 85 e6 00 00 00    	jne    80105017 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104f31:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f36:	0f 84 9c 00 00 00    	je     80104fd8 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104f3c:	83 ec 0c             	sub    $0xc,%esp
80104f3f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f42:	e8 a9 c9 ff ff       	call   801018f0 <iunlockput>

  ip->nlink--;
80104f47:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f4c:	89 1c 24             	mov    %ebx,(%esp)
80104f4f:	e8 5c c6 ff ff       	call   801015b0 <iupdate>
  iunlockput(ip);
80104f54:	89 1c 24             	mov    %ebx,(%esp)
80104f57:	e8 94 c9 ff ff       	call   801018f0 <iunlockput>

  end_op();
80104f5c:	e8 4f dc ff ff       	call   80102bb0 <end_op>

  return 0;
80104f61:	83 c4 10             	add    $0x10,%esp
80104f64:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104f66:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f69:	5b                   	pop    %ebx
80104f6a:	5e                   	pop    %esi
80104f6b:	5f                   	pop    %edi
80104f6c:	5d                   	pop    %ebp
80104f6d:	c3                   	ret    
80104f6e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104f70:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f74:	76 94                	jbe    80104f0a <sys_unlink+0xba>
80104f76:	bf 20 00 00 00       	mov    $0x20,%edi
80104f7b:	eb 0f                	jmp    80104f8c <sys_unlink+0x13c>
80104f7d:	8d 76 00             	lea    0x0(%esi),%esi
80104f80:	83 c7 10             	add    $0x10,%edi
80104f83:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f86:	0f 83 7e ff ff ff    	jae    80104f0a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f8c:	6a 10                	push   $0x10
80104f8e:	57                   	push   %edi
80104f8f:	56                   	push   %esi
80104f90:	53                   	push   %ebx
80104f91:	e8 aa c9 ff ff       	call   80101940 <readi>
80104f96:	83 c4 10             	add    $0x10,%esp
80104f99:	83 f8 10             	cmp    $0x10,%eax
80104f9c:	75 6c                	jne    8010500a <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
80104f9e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104fa3:	74 db                	je     80104f80 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80104fa5:	83 ec 0c             	sub    $0xc,%esp
80104fa8:	53                   	push   %ebx
80104fa9:	e8 42 c9 ff ff       	call   801018f0 <iunlockput>
    goto bad;
80104fae:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80104fb1:	83 ec 0c             	sub    $0xc,%esp
80104fb4:	ff 75 b4             	pushl  -0x4c(%ebp)
80104fb7:	e8 34 c9 ff ff       	call   801018f0 <iunlockput>
  end_op();
80104fbc:	e8 ef db ff ff       	call   80102bb0 <end_op>
  return -1;
80104fc1:	83 c4 10             	add    $0x10,%esp
}
80104fc4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80104fc7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104fcc:	5b                   	pop    %ebx
80104fcd:	5e                   	pop    %esi
80104fce:	5f                   	pop    %edi
80104fcf:	5d                   	pop    %ebp
80104fd0:	c3                   	ret    
80104fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104fd8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
80104fdb:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104fde:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104fe3:	50                   	push   %eax
80104fe4:	e8 c7 c5 ff ff       	call   801015b0 <iupdate>
80104fe9:	83 c4 10             	add    $0x10,%esp
80104fec:	e9 4b ff ff ff       	jmp    80104f3c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80104ff1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ff6:	e9 6b ff ff ff       	jmp    80104f66 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
80104ffb:	e8 b0 db ff ff       	call   80102bb0 <end_op>
    return -1;
80105000:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105005:	e9 5c ff ff ff       	jmp    80104f66 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
8010500a:	83 ec 0c             	sub    $0xc,%esp
8010500d:	68 20 78 10 80       	push   $0x80107820
80105012:	e8 59 b3 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80105017:	83 ec 0c             	sub    $0xc,%esp
8010501a:	68 32 78 10 80       	push   $0x80107832
8010501f:	e8 4c b3 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80105024:	83 ec 0c             	sub    $0xc,%esp
80105027:	68 0e 78 10 80       	push   $0x8010780e
8010502c:	e8 3f b3 ff ff       	call   80100370 <panic>
80105031:	eb 0d                	jmp    80105040 <sys_open>
80105033:	90                   	nop
80105034:	90                   	nop
80105035:	90                   	nop
80105036:	90                   	nop
80105037:	90                   	nop
80105038:	90                   	nop
80105039:	90                   	nop
8010503a:	90                   	nop
8010503b:	90                   	nop
8010503c:	90                   	nop
8010503d:	90                   	nop
8010503e:	90                   	nop
8010503f:	90                   	nop

80105040 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105046:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80105049:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010504c:	50                   	push   %eax
8010504d:	6a 00                	push   $0x0
8010504f:	e8 bc f7 ff ff       	call   80104810 <argstr>
80105054:	83 c4 10             	add    $0x10,%esp
80105057:	85 c0                	test   %eax,%eax
80105059:	0f 88 9e 00 00 00    	js     801050fd <sys_open+0xbd>
8010505f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105062:	83 ec 08             	sub    $0x8,%esp
80105065:	50                   	push   %eax
80105066:	6a 01                	push   $0x1
80105068:	e8 f3 f6 ff ff       	call   80104760 <argint>
8010506d:	83 c4 10             	add    $0x10,%esp
80105070:	85 c0                	test   %eax,%eax
80105072:	0f 88 85 00 00 00    	js     801050fd <sys_open+0xbd>
    return -1;

  begin_op();
80105078:	e8 c3 da ff ff       	call   80102b40 <begin_op>

  if(omode & O_CREATE){
8010507d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105081:	0f 85 89 00 00 00    	jne    80105110 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105087:	83 ec 0c             	sub    $0xc,%esp
8010508a:	ff 75 e0             	pushl  -0x20(%ebp)
8010508d:	e8 1e ce ff ff       	call   80101eb0 <namei>
80105092:	83 c4 10             	add    $0x10,%esp
80105095:	85 c0                	test   %eax,%eax
80105097:	89 c6                	mov    %eax,%esi
80105099:	0f 84 8e 00 00 00    	je     8010512d <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010509f:	83 ec 0c             	sub    $0xc,%esp
801050a2:	50                   	push   %eax
801050a3:	e8 b8 c5 ff ff       	call   80101660 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801050a8:	83 c4 10             	add    $0x10,%esp
801050ab:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801050b0:	0f 84 d2 00 00 00    	je     80105188 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801050b6:	e8 b5 bc ff ff       	call   80100d70 <filealloc>
801050bb:	85 c0                	test   %eax,%eax
801050bd:	89 c7                	mov    %eax,%edi
801050bf:	74 2b                	je     801050ec <sys_open+0xac>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801050c1:	31 db                	xor    %ebx,%ebx
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801050c3:	e8 d8 e6 ff ff       	call   801037a0 <myproc>
801050c8:	90                   	nop
801050c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
801050d0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801050d4:	85 d2                	test   %edx,%edx
801050d6:	74 68                	je     80105140 <sys_open+0x100>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801050d8:	83 c3 01             	add    $0x1,%ebx
801050db:	83 fb 10             	cmp    $0x10,%ebx
801050de:	75 f0                	jne    801050d0 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
801050e0:	83 ec 0c             	sub    $0xc,%esp
801050e3:	57                   	push   %edi
801050e4:	e8 47 bd ff ff       	call   80100e30 <fileclose>
801050e9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801050ec:	83 ec 0c             	sub    $0xc,%esp
801050ef:	56                   	push   %esi
801050f0:	e8 fb c7 ff ff       	call   801018f0 <iunlockput>
    end_op();
801050f5:	e8 b6 da ff ff       	call   80102bb0 <end_op>
    return -1;
801050fa:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801050fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80105100:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80105105:	5b                   	pop    %ebx
80105106:	5e                   	pop    %esi
80105107:	5f                   	pop    %edi
80105108:	5d                   	pop    %ebp
80105109:	c3                   	ret    
8010510a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105110:	83 ec 0c             	sub    $0xc,%esp
80105113:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105116:	31 c9                	xor    %ecx,%ecx
80105118:	6a 00                	push   $0x0
8010511a:	ba 02 00 00 00       	mov    $0x2,%edx
8010511f:	e8 dc f7 ff ff       	call   80104900 <create>
    if(ip == 0){
80105124:	83 c4 10             	add    $0x10,%esp
80105127:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105129:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010512b:	75 89                	jne    801050b6 <sys_open+0x76>
      end_op();
8010512d:	e8 7e da ff ff       	call   80102bb0 <end_op>
      return -1;
80105132:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105137:	eb 43                	jmp    8010517c <sys_open+0x13c>
80105139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105140:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105143:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105147:	56                   	push   %esi
80105148:	e8 f3 c5 ff ff       	call   80101740 <iunlock>
  end_op();
8010514d:	e8 5e da ff ff       	call   80102bb0 <end_op>

  f->type = FD_INODE;
80105152:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105158:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010515b:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
8010515e:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105161:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80105168:	89 d0                	mov    %edx,%eax
8010516a:	83 e0 01             	and    $0x1,%eax
8010516d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105170:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105173:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105176:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
8010517a:	89 d8                	mov    %ebx,%eax
}
8010517c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010517f:	5b                   	pop    %ebx
80105180:	5e                   	pop    %esi
80105181:	5f                   	pop    %edi
80105182:	5d                   	pop    %ebp
80105183:	c3                   	ret    
80105184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105188:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010518b:	85 c9                	test   %ecx,%ecx
8010518d:	0f 84 23 ff ff ff    	je     801050b6 <sys_open+0x76>
80105193:	e9 54 ff ff ff       	jmp    801050ec <sys_open+0xac>
80105198:	90                   	nop
80105199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801051a0 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
801051a0:	55                   	push   %ebp
801051a1:	89 e5                	mov    %esp,%ebp
801051a3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801051a6:	e8 95 d9 ff ff       	call   80102b40 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801051ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051ae:	83 ec 08             	sub    $0x8,%esp
801051b1:	50                   	push   %eax
801051b2:	6a 00                	push   $0x0
801051b4:	e8 57 f6 ff ff       	call   80104810 <argstr>
801051b9:	83 c4 10             	add    $0x10,%esp
801051bc:	85 c0                	test   %eax,%eax
801051be:	78 30                	js     801051f0 <sys_mkdir+0x50>
801051c0:	83 ec 0c             	sub    $0xc,%esp
801051c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051c6:	31 c9                	xor    %ecx,%ecx
801051c8:	6a 00                	push   $0x0
801051ca:	ba 01 00 00 00       	mov    $0x1,%edx
801051cf:	e8 2c f7 ff ff       	call   80104900 <create>
801051d4:	83 c4 10             	add    $0x10,%esp
801051d7:	85 c0                	test   %eax,%eax
801051d9:	74 15                	je     801051f0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801051db:	83 ec 0c             	sub    $0xc,%esp
801051de:	50                   	push   %eax
801051df:	e8 0c c7 ff ff       	call   801018f0 <iunlockput>
  end_op();
801051e4:	e8 c7 d9 ff ff       	call   80102bb0 <end_op>
  return 0;
801051e9:	83 c4 10             	add    $0x10,%esp
801051ec:	31 c0                	xor    %eax,%eax
}
801051ee:	c9                   	leave  
801051ef:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
801051f0:	e8 bb d9 ff ff       	call   80102bb0 <end_op>
    return -1;
801051f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801051fa:	c9                   	leave  
801051fb:	c3                   	ret    
801051fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105200 <sys_mknod>:

int
sys_mknod(void)
{
80105200:	55                   	push   %ebp
80105201:	89 e5                	mov    %esp,%ebp
80105203:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105206:	e8 35 d9 ff ff       	call   80102b40 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010520b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010520e:	83 ec 08             	sub    $0x8,%esp
80105211:	50                   	push   %eax
80105212:	6a 00                	push   $0x0
80105214:	e8 f7 f5 ff ff       	call   80104810 <argstr>
80105219:	83 c4 10             	add    $0x10,%esp
8010521c:	85 c0                	test   %eax,%eax
8010521e:	78 60                	js     80105280 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105220:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105223:	83 ec 08             	sub    $0x8,%esp
80105226:	50                   	push   %eax
80105227:	6a 01                	push   $0x1
80105229:	e8 32 f5 ff ff       	call   80104760 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
8010522e:	83 c4 10             	add    $0x10,%esp
80105231:	85 c0                	test   %eax,%eax
80105233:	78 4b                	js     80105280 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105235:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105238:	83 ec 08             	sub    $0x8,%esp
8010523b:	50                   	push   %eax
8010523c:	6a 02                	push   $0x2
8010523e:	e8 1d f5 ff ff       	call   80104760 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105243:	83 c4 10             	add    $0x10,%esp
80105246:	85 c0                	test   %eax,%eax
80105248:	78 36                	js     80105280 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
8010524a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010524e:	83 ec 0c             	sub    $0xc,%esp
80105251:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105255:	ba 03 00 00 00       	mov    $0x3,%edx
8010525a:	50                   	push   %eax
8010525b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010525e:	e8 9d f6 ff ff       	call   80104900 <create>
80105263:	83 c4 10             	add    $0x10,%esp
80105266:	85 c0                	test   %eax,%eax
80105268:	74 16                	je     80105280 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010526a:	83 ec 0c             	sub    $0xc,%esp
8010526d:	50                   	push   %eax
8010526e:	e8 7d c6 ff ff       	call   801018f0 <iunlockput>
  end_op();
80105273:	e8 38 d9 ff ff       	call   80102bb0 <end_op>
  return 0;
80105278:	83 c4 10             	add    $0x10,%esp
8010527b:	31 c0                	xor    %eax,%eax
}
8010527d:	c9                   	leave  
8010527e:	c3                   	ret    
8010527f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105280:	e8 2b d9 ff ff       	call   80102bb0 <end_op>
    return -1;
80105285:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010528a:	c9                   	leave  
8010528b:	c3                   	ret    
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105290 <sys_chdir>:

int
sys_chdir(void)
{
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	56                   	push   %esi
80105294:	53                   	push   %ebx
80105295:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105298:	e8 03 e5 ff ff       	call   801037a0 <myproc>
8010529d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010529f:	e8 9c d8 ff ff       	call   80102b40 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801052a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052a7:	83 ec 08             	sub    $0x8,%esp
801052aa:	50                   	push   %eax
801052ab:	6a 00                	push   $0x0
801052ad:	e8 5e f5 ff ff       	call   80104810 <argstr>
801052b2:	83 c4 10             	add    $0x10,%esp
801052b5:	85 c0                	test   %eax,%eax
801052b7:	78 77                	js     80105330 <sys_chdir+0xa0>
801052b9:	83 ec 0c             	sub    $0xc,%esp
801052bc:	ff 75 f4             	pushl  -0xc(%ebp)
801052bf:	e8 ec cb ff ff       	call   80101eb0 <namei>
801052c4:	83 c4 10             	add    $0x10,%esp
801052c7:	85 c0                	test   %eax,%eax
801052c9:	89 c3                	mov    %eax,%ebx
801052cb:	74 63                	je     80105330 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801052cd:	83 ec 0c             	sub    $0xc,%esp
801052d0:	50                   	push   %eax
801052d1:	e8 8a c3 ff ff       	call   80101660 <ilock>
  if(ip->type != T_DIR){
801052d6:	83 c4 10             	add    $0x10,%esp
801052d9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052de:	75 30                	jne    80105310 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052e0:	83 ec 0c             	sub    $0xc,%esp
801052e3:	53                   	push   %ebx
801052e4:	e8 57 c4 ff ff       	call   80101740 <iunlock>
  iput(curproc->cwd);
801052e9:	58                   	pop    %eax
801052ea:	ff 76 68             	pushl  0x68(%esi)
801052ed:	e8 9e c4 ff ff       	call   80101790 <iput>
  end_op();
801052f2:	e8 b9 d8 ff ff       	call   80102bb0 <end_op>
  curproc->cwd = ip;
801052f7:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801052fa:	83 c4 10             	add    $0x10,%esp
801052fd:	31 c0                	xor    %eax,%eax
}
801052ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105302:	5b                   	pop    %ebx
80105303:	5e                   	pop    %esi
80105304:	5d                   	pop    %ebp
80105305:	c3                   	ret    
80105306:	8d 76 00             	lea    0x0(%esi),%esi
80105309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	53                   	push   %ebx
80105314:	e8 d7 c5 ff ff       	call   801018f0 <iunlockput>
    end_op();
80105319:	e8 92 d8 ff ff       	call   80102bb0 <end_op>
    return -1;
8010531e:	83 c4 10             	add    $0x10,%esp
80105321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105326:	eb d7                	jmp    801052ff <sys_chdir+0x6f>
80105328:	90                   	nop
80105329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105330:	e8 7b d8 ff ff       	call   80102bb0 <end_op>
    return -1;
80105335:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010533a:	eb c3                	jmp    801052ff <sys_chdir+0x6f>
8010533c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105340 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
80105343:	57                   	push   %edi
80105344:	56                   	push   %esi
80105345:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105346:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
8010534c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105352:	50                   	push   %eax
80105353:	6a 00                	push   $0x0
80105355:	e8 b6 f4 ff ff       	call   80104810 <argstr>
8010535a:	83 c4 10             	add    $0x10,%esp
8010535d:	85 c0                	test   %eax,%eax
8010535f:	78 7f                	js     801053e0 <sys_exec+0xa0>
80105361:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105367:	83 ec 08             	sub    $0x8,%esp
8010536a:	50                   	push   %eax
8010536b:	6a 01                	push   $0x1
8010536d:	e8 ee f3 ff ff       	call   80104760 <argint>
80105372:	83 c4 10             	add    $0x10,%esp
80105375:	85 c0                	test   %eax,%eax
80105377:	78 67                	js     801053e0 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105379:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010537f:	83 ec 04             	sub    $0x4,%esp
80105382:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105388:	68 80 00 00 00       	push   $0x80
8010538d:	6a 00                	push   $0x0
8010538f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105395:	50                   	push   %eax
80105396:	31 db                	xor    %ebx,%ebx
80105398:	e8 b3 f0 ff ff       	call   80104450 <memset>
8010539d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801053a0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801053a6:	83 ec 08             	sub    $0x8,%esp
801053a9:	57                   	push   %edi
801053aa:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801053ad:	50                   	push   %eax
801053ae:	e8 0d f3 ff ff       	call   801046c0 <fetchint>
801053b3:	83 c4 10             	add    $0x10,%esp
801053b6:	85 c0                	test   %eax,%eax
801053b8:	78 26                	js     801053e0 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
801053ba:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801053c0:	85 c0                	test   %eax,%eax
801053c2:	74 2c                	je     801053f0 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801053c4:	83 ec 08             	sub    $0x8,%esp
801053c7:	56                   	push   %esi
801053c8:	50                   	push   %eax
801053c9:	e8 32 f3 ff ff       	call   80104700 <fetchstr>
801053ce:	83 c4 10             	add    $0x10,%esp
801053d1:	85 c0                	test   %eax,%eax
801053d3:	78 0b                	js     801053e0 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801053d5:	83 c3 01             	add    $0x1,%ebx
801053d8:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801053db:	83 fb 20             	cmp    $0x20,%ebx
801053de:	75 c0                	jne    801053a0 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801053e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801053e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801053e8:	5b                   	pop    %ebx
801053e9:	5e                   	pop    %esi
801053ea:	5f                   	pop    %edi
801053eb:	5d                   	pop    %ebp
801053ec:	c3                   	ret    
801053ed:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801053f0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801053f6:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
801053f9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105400:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105404:	50                   	push   %eax
80105405:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010540b:	e8 e0 b5 ff ff       	call   801009f0 <exec>
80105410:	83 c4 10             	add    $0x10,%esp
}
80105413:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105416:	5b                   	pop    %ebx
80105417:	5e                   	pop    %esi
80105418:	5f                   	pop    %edi
80105419:	5d                   	pop    %ebp
8010541a:	c3                   	ret    
8010541b:	90                   	nop
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_pipe>:

int
sys_pipe(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	57                   	push   %edi
80105424:	56                   	push   %esi
80105425:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105426:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
80105429:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010542c:	6a 08                	push   $0x8
8010542e:	50                   	push   %eax
8010542f:	6a 00                	push   $0x0
80105431:	e8 7a f3 ff ff       	call   801047b0 <argptr>
80105436:	83 c4 10             	add    $0x10,%esp
80105439:	85 c0                	test   %eax,%eax
8010543b:	78 4a                	js     80105487 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010543d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105440:	83 ec 08             	sub    $0x8,%esp
80105443:	50                   	push   %eax
80105444:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105447:	50                   	push   %eax
80105448:	e8 93 dd ff ff       	call   801031e0 <pipealloc>
8010544d:	83 c4 10             	add    $0x10,%esp
80105450:	85 c0                	test   %eax,%eax
80105452:	78 33                	js     80105487 <sys_pipe+0x67>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105454:	31 db                	xor    %ebx,%ebx
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105456:	8b 7d e0             	mov    -0x20(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105459:	e8 42 e3 ff ff       	call   801037a0 <myproc>
8010545e:	66 90                	xchg   %ax,%ax

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105460:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105464:	85 f6                	test   %esi,%esi
80105466:	74 30                	je     80105498 <sys_pipe+0x78>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105468:	83 c3 01             	add    $0x1,%ebx
8010546b:	83 fb 10             	cmp    $0x10,%ebx
8010546e:	75 f0                	jne    80105460 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105470:	83 ec 0c             	sub    $0xc,%esp
80105473:	ff 75 e0             	pushl  -0x20(%ebp)
80105476:	e8 b5 b9 ff ff       	call   80100e30 <fileclose>
    fileclose(wf);
8010547b:	58                   	pop    %eax
8010547c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010547f:	e8 ac b9 ff ff       	call   80100e30 <fileclose>
    return -1;
80105484:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105487:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
8010548a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
8010548f:	5b                   	pop    %ebx
80105490:	5e                   	pop    %esi
80105491:	5f                   	pop    %edi
80105492:	5d                   	pop    %ebp
80105493:	c3                   	ret    
80105494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105498:	8d 73 08             	lea    0x8(%ebx),%esi
8010549b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010549f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801054a2:	e8 f9 e2 ff ff       	call   801037a0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
801054a7:	31 d2                	xor    %edx,%edx
801054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
801054b0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801054b4:	85 c9                	test   %ecx,%ecx
801054b6:	74 18                	je     801054d0 <sys_pipe+0xb0>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801054b8:	83 c2 01             	add    $0x1,%edx
801054bb:	83 fa 10             	cmp    $0x10,%edx
801054be:	75 f0                	jne    801054b0 <sys_pipe+0x90>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
801054c0:	e8 db e2 ff ff       	call   801037a0 <myproc>
801054c5:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801054cc:	00 
801054cd:	eb a1                	jmp    80105470 <sys_pipe+0x50>
801054cf:	90                   	nop
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801054d0:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801054d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054d7:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801054d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054dc:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
801054df:	8d 65 f4             	lea    -0xc(%ebp),%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
801054e2:	31 c0                	xor    %eax,%eax
}
801054e4:	5b                   	pop    %ebx
801054e5:	5e                   	pop    %esi
801054e6:	5f                   	pop    %edi
801054e7:	5d                   	pop    %ebp
801054e8:	c3                   	ret    
801054e9:	66 90                	xchg   %ax,%ax
801054eb:	66 90                	xchg   %ax,%ax
801054ed:	66 90                	xchg   %ax,%ax
801054ef:	90                   	nop

801054f0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801054f3:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
801054f4:	e9 47 e4 ff ff       	jmp    80103940 <fork>
801054f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105500 <sys_exit>:
}

int
sys_exit(void)
{
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
80105503:	83 ec 08             	sub    $0x8,%esp
  exit();
80105506:	e8 c5 e6 ff ff       	call   80103bd0 <exit>
  return 0;  // not reached
}
8010550b:	31 c0                	xor    %eax,%eax
8010550d:	c9                   	leave  
8010550e:	c3                   	ret    
8010550f:	90                   	nop

80105510 <sys_wait>:

int
sys_wait(void)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105513:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105514:	e9 f7 e8 ff ff       	jmp    80103e10 <wait>
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105520 <sys_kill>:
}

int
sys_kill(void)
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
80105523:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105526:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105529:	50                   	push   %eax
8010552a:	6a 00                	push   $0x0
8010552c:	e8 2f f2 ff ff       	call   80104760 <argint>
80105531:	83 c4 10             	add    $0x10,%esp
80105534:	85 c0                	test   %eax,%eax
80105536:	78 18                	js     80105550 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105538:	83 ec 0c             	sub    $0xc,%esp
8010553b:	ff 75 f4             	pushl  -0xc(%ebp)
8010553e:	e8 2d ea ff ff       	call   80103f70 <kill>
80105543:	83 c4 10             	add    $0x10,%esp
}
80105546:	c9                   	leave  
80105547:	c3                   	ret    
80105548:	90                   	nop
80105549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105550:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105555:	c9                   	leave  
80105556:	c3                   	ret    
80105557:	89 f6                	mov    %esi,%esi
80105559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105560 <sys_getpid>:

int
sys_getpid(void)
{
80105560:	55                   	push   %ebp
80105561:	89 e5                	mov    %esp,%ebp
80105563:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105566:	e8 35 e2 ff ff       	call   801037a0 <myproc>
8010556b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010556e:	c9                   	leave  
8010556f:	c3                   	ret    

80105570 <sys_sbrk>:

int
sys_sbrk(void)
{
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105574:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105577:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010557a:	50                   	push   %eax
8010557b:	6a 00                	push   $0x0
8010557d:	e8 de f1 ff ff       	call   80104760 <argint>
80105582:	83 c4 10             	add    $0x10,%esp
80105585:	85 c0                	test   %eax,%eax
80105587:	78 27                	js     801055b0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105589:	e8 12 e2 ff ff       	call   801037a0 <myproc>
  if(growproc(n) < 0)
8010558e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
80105591:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105593:	ff 75 f4             	pushl  -0xc(%ebp)
80105596:	e8 25 e3 ff ff       	call   801038c0 <growproc>
8010559b:	83 c4 10             	add    $0x10,%esp
8010559e:	85 c0                	test   %eax,%eax
801055a0:	78 0e                	js     801055b0 <sys_sbrk+0x40>
    return -1;
  return addr;
801055a2:	89 d8                	mov    %ebx,%eax
}
801055a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055a7:	c9                   	leave  
801055a8:	c3                   	ret    
801055a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801055b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055b5:	eb ed                	jmp    801055a4 <sys_sbrk+0x34>
801055b7:	89 f6                	mov    %esi,%esi
801055b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055c0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
801055c3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
801055c7:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055ca:	50                   	push   %eax
801055cb:	6a 00                	push   $0x0
801055cd:	e8 8e f1 ff ff       	call   80104760 <argint>
801055d2:	83 c4 10             	add    $0x10,%esp
801055d5:	85 c0                	test   %eax,%eax
801055d7:	0f 88 8a 00 00 00    	js     80105667 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801055dd:	83 ec 0c             	sub    $0xc,%esp
801055e0:	68 60 4f 11 80       	push   $0x80114f60
801055e5:	e8 66 ed ff ff       	call   80104350 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801055ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055ed:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801055f0:	8b 1d a0 57 11 80    	mov    0x801157a0,%ebx
  while(ticks - ticks0 < n){
801055f6:	85 d2                	test   %edx,%edx
801055f8:	75 27                	jne    80105621 <sys_sleep+0x61>
801055fa:	eb 54                	jmp    80105650 <sys_sleep+0x90>
801055fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105600:	83 ec 08             	sub    $0x8,%esp
80105603:	68 60 4f 11 80       	push   $0x80114f60
80105608:	68 a0 57 11 80       	push   $0x801157a0
8010560d:	e8 3e e7 ff ff       	call   80103d50 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105612:	a1 a0 57 11 80       	mov    0x801157a0,%eax
80105617:	83 c4 10             	add    $0x10,%esp
8010561a:	29 d8                	sub    %ebx,%eax
8010561c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010561f:	73 2f                	jae    80105650 <sys_sleep+0x90>
    if(myproc()->killed){
80105621:	e8 7a e1 ff ff       	call   801037a0 <myproc>
80105626:	8b 40 24             	mov    0x24(%eax),%eax
80105629:	85 c0                	test   %eax,%eax
8010562b:	74 d3                	je     80105600 <sys_sleep+0x40>
      release(&tickslock);
8010562d:	83 ec 0c             	sub    $0xc,%esp
80105630:	68 60 4f 11 80       	push   $0x80114f60
80105635:	e8 c6 ed ff ff       	call   80104400 <release>
      return -1;
8010563a:	83 c4 10             	add    $0x10,%esp
8010563d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105642:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105645:	c9                   	leave  
80105646:	c3                   	ret    
80105647:	89 f6                	mov    %esi,%esi
80105649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105650:	83 ec 0c             	sub    $0xc,%esp
80105653:	68 60 4f 11 80       	push   $0x80114f60
80105658:	e8 a3 ed ff ff       	call   80104400 <release>
  return 0;
8010565d:	83 c4 10             	add    $0x10,%esp
80105660:	31 c0                	xor    %eax,%eax
}
80105662:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105665:	c9                   	leave  
80105666:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105667:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010566c:	eb d4                	jmp    80105642 <sys_sleep+0x82>
8010566e:	66 90                	xchg   %ax,%ax

80105670 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105670:	55                   	push   %ebp
80105671:	89 e5                	mov    %esp,%ebp
80105673:	53                   	push   %ebx
80105674:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105677:	68 60 4f 11 80       	push   $0x80114f60
8010567c:	e8 cf ec ff ff       	call   80104350 <acquire>
  xticks = ticks;
80105681:	8b 1d a0 57 11 80    	mov    0x801157a0,%ebx
  release(&tickslock);
80105687:	c7 04 24 60 4f 11 80 	movl   $0x80114f60,(%esp)
8010568e:	e8 6d ed ff ff       	call   80104400 <release>
  return xticks;
}
80105693:	89 d8                	mov    %ebx,%eax
80105695:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105698:	c9                   	leave  
80105699:	c3                   	ret    
8010569a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801056a0 <sys_trace>:

// Set the tracing attribute based on the argument of trace
int sys_trace(void){
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	53                   	push   %ebx
  int n;
  if(argint(0, &n) < 0){
801056a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  release(&tickslock);
  return xticks;
}

// Set the tracing attribute based on the argument of trace
int sys_trace(void){
801056a7:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  if(argint(0, &n) < 0){
801056aa:	50                   	push   %eax
801056ab:	6a 00                	push   $0x0
801056ad:	e8 ae f0 ff ff       	call   80104760 <argint>
801056b2:	83 c4 10             	add    $0x10,%esp
801056b5:	85 c0                	test   %eax,%eax
801056b7:	78 37                	js     801056f0 <sys_trace+0x50>
    return -1;
  }
  if(n == 0){
801056b9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801056bc:	85 db                	test   %ebx,%ebx
801056be:	74 18                	je     801056d8 <sys_trace+0x38>
    myproc()->tracing = 0;
  }
  else{
    myproc()->tracing = 1;
801056c0:	e8 db e0 ff ff       	call   801037a0 <myproc>
  }
  return 0;
801056c5:	31 db                	xor    %ebx,%ebx
  }
  if(n == 0){
    myproc()->tracing = 0;
  }
  else{
    myproc()->tracing = 1;
801056c7:	c7 40 7c 01 00 00 00 	movl   $0x1,0x7c(%eax)
  }
  return 0;
}
801056ce:	89 d8                	mov    %ebx,%eax
801056d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056d3:	c9                   	leave  
801056d4:	c3                   	ret    
801056d5:	8d 76 00             	lea    0x0(%esi),%esi
  int n;
  if(argint(0, &n) < 0){
    return -1;
  }
  if(n == 0){
    myproc()->tracing = 0;
801056d8:	e8 c3 e0 ff ff       	call   801037a0 <myproc>
801056dd:	c7 40 7c 00 00 00 00 	movl   $0x0,0x7c(%eax)
  }
  else{
    myproc()->tracing = 1;
  }
  return 0;
}
801056e4:	89 d8                	mov    %ebx,%eax
801056e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056e9:	c9                   	leave  
801056ea:	c3                   	ret    
801056eb:	90                   	nop
801056ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Set the tracing attribute based on the argument of trace
int sys_trace(void){
  int n;
  if(argint(0, &n) < 0){
    return -1;
801056f0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801056f5:	eb d7                	jmp    801056ce <sys_trace+0x2e>
801056f7:	89 f6                	mov    %esi,%esi
801056f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105700 <sys_getprocs>:
    int state;
    uint sz;
    char name[16];
};

int sys_getprocs(void){
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	57                   	push   %edi
80105704:	56                   	push   %esi
80105705:	53                   	push   %ebx
    int size, i, j;
    struct uproc *buf;
    struct proc *p = '\0';
    char *pbuf;
    if (argint(0, &size) < 0){
80105706:	8d 45 e0             	lea    -0x20(%ebp),%eax
    int state;
    uint sz;
    char name[16];
};

int sys_getprocs(void){
80105709:	83 ec 24             	sub    $0x24,%esp
    int size, i, j;
    struct uproc *buf;
    struct proc *p = '\0';
    char *pbuf;
    if (argint(0, &size) < 0){
8010570c:	50                   	push   %eax
8010570d:	6a 00                	push   $0x0
8010570f:	e8 4c f0 ff ff       	call   80104760 <argint>
80105714:	83 c4 10             	add    $0x10,%esp
80105717:	85 c0                	test   %eax,%eax
80105719:	0f 88 7f 00 00 00    	js     8010579e <sys_getprocs+0x9e>
        return -1;
    }
    if (argptr(1, &pbuf, size*sizeof(struct uproc)) < 0){
8010571f:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105722:	83 ec 04             	sub    $0x4,%esp
80105725:	c1 e0 05             	shl    $0x5,%eax
80105728:	50                   	push   %eax
80105729:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010572c:	50                   	push   %eax
8010572d:	6a 01                	push   $0x1
8010572f:	e8 7c f0 ff ff       	call   801047b0 <argptr>
80105734:	83 c4 10             	add    $0x10,%esp
80105737:	85 c0                	test   %eax,%eax
80105739:	78 63                	js     8010579e <sys_getprocs+0x9e>
        return -1;
    }
    buf = (struct uproc *)pbuf;
8010573b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    // Get the ptable elements
    p = getptable_proc();
8010573e:	e8 8d df ff ff       	call   801036d0 <getptable_proc>
    // Copy ptables elements to buff
    for(i = 0; i<size; i++){
80105743:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105746:	85 d2                	test   %edx,%edx
80105748:	7e 4a                	jle    80105794 <sys_getprocs+0x94>
8010574a:	89 c6                	mov    %eax,%esi
8010574c:	31 ff                	xor    %edi,%edi
8010574e:	66 90                	xchg   %ax,%ax
        //Store all standard attributes
        buf[i].pid = p[i].pid;
80105750:	8b 46 10             	mov    0x10(%esi),%eax
        buf[i].ppid = p[i].parent->pid;
        buf[i].state = p[i].state;
        buf[i].sz = p[i].sz;
80105753:	31 d2                	xor    %edx,%edx
    // Get the ptable elements
    p = getptable_proc();
    // Copy ptables elements to buff
    for(i = 0; i<size; i++){
        //Store all standard attributes
        buf[i].pid = p[i].pid;
80105755:	89 03                	mov    %eax,(%ebx)
        buf[i].ppid = p[i].parent->pid;
80105757:	8b 46 14             	mov    0x14(%esi),%eax
8010575a:	8b 40 10             	mov    0x10(%eax),%eax
8010575d:	89 43 04             	mov    %eax,0x4(%ebx)
        buf[i].state = p[i].state;
80105760:	8b 46 0c             	mov    0xc(%esi),%eax
80105763:	89 43 08             	mov    %eax,0x8(%ebx)
        buf[i].sz = p[i].sz;
80105766:	8b 06                	mov    (%esi),%eax
80105768:	89 43 0c             	mov    %eax,0xc(%ebx)
8010576b:	90                   	nop
8010576c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        
        // Loop through chars in name storing each
        for(j = 0; j < sizeof(p[i].name); j++){
            buf[i].name[j] = p[i].name[j];
80105770:	0f b6 4c 16 6c       	movzbl 0x6c(%esi,%edx,1),%ecx
80105775:	88 4c 13 10          	mov    %cl,0x10(%ebx,%edx,1)
        buf[i].ppid = p[i].parent->pid;
        buf[i].state = p[i].state;
        buf[i].sz = p[i].sz;
        
        // Loop through chars in name storing each
        for(j = 0; j < sizeof(p[i].name); j++){
80105779:	83 c2 01             	add    $0x1,%edx
8010577c:	83 fa 10             	cmp    $0x10,%edx
8010577f:	75 ef                	jne    80105770 <sys_getprocs+0x70>
    }
    buf = (struct uproc *)pbuf;
    // Get the ptable elements
    p = getptable_proc();
    // Copy ptables elements to buff
    for(i = 0; i<size; i++){
80105781:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105784:	83 c7 01             	add    $0x1,%edi
80105787:	81 c6 84 00 00 00    	add    $0x84,%esi
8010578d:	83 c3 20             	add    $0x20,%ebx
80105790:	39 fa                	cmp    %edi,%edx
80105792:	7f bc                	jg     80105750 <sys_getprocs+0x50>
    }
    

    return size;

}
80105794:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105797:	89 d0                	mov    %edx,%eax
80105799:	5b                   	pop    %ebx
8010579a:	5e                   	pop    %esi
8010579b:	5f                   	pop    %edi
8010579c:	5d                   	pop    %ebp
8010579d:	c3                   	ret    
    int size, i, j;
    struct uproc *buf;
    struct proc *p = '\0';
    char *pbuf;
    if (argint(0, &size) < 0){
        return -1;
8010579e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801057a3:	eb ef                	jmp    80105794 <sys_getprocs+0x94>

801057a5 <alltraps>:
801057a5:	1e                   	push   %ds
801057a6:	06                   	push   %es
801057a7:	0f a0                	push   %fs
801057a9:	0f a8                	push   %gs
801057ab:	60                   	pusha  
801057ac:	66 b8 10 00          	mov    $0x10,%ax
801057b0:	8e d8                	mov    %eax,%ds
801057b2:	8e c0                	mov    %eax,%es
801057b4:	54                   	push   %esp
801057b5:	e8 e6 00 00 00       	call   801058a0 <trap>
801057ba:	83 c4 04             	add    $0x4,%esp

801057bd <trapret>:
801057bd:	61                   	popa   
801057be:	0f a9                	pop    %gs
801057c0:	0f a1                	pop    %fs
801057c2:	07                   	pop    %es
801057c3:	1f                   	pop    %ds
801057c4:	83 c4 08             	add    $0x8,%esp
801057c7:	cf                   	iret   
801057c8:	66 90                	xchg   %ax,%ax
801057ca:	66 90                	xchg   %ax,%ax
801057cc:	66 90                	xchg   %ax,%ax
801057ce:	66 90                	xchg   %ax,%ax

801057d0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801057d0:	31 c0                	xor    %eax,%eax
801057d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801057d8:	8b 14 85 06 a1 10 80 	mov    -0x7fef5efa(,%eax,4),%edx
801057df:	b9 08 00 00 00       	mov    $0x8,%ecx
801057e4:	c6 04 c5 a4 4f 11 80 	movb   $0x0,-0x7feeb05c(,%eax,8)
801057eb:	00 
801057ec:	66 89 0c c5 a2 4f 11 	mov    %cx,-0x7feeb05e(,%eax,8)
801057f3:	80 
801057f4:	c6 04 c5 a5 4f 11 80 	movb   $0x8e,-0x7feeb05b(,%eax,8)
801057fb:	8e 
801057fc:	66 89 14 c5 a0 4f 11 	mov    %dx,-0x7feeb060(,%eax,8)
80105803:	80 
80105804:	c1 ea 10             	shr    $0x10,%edx
80105807:	66 89 14 c5 a6 4f 11 	mov    %dx,-0x7feeb05a(,%eax,8)
8010580e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
8010580f:	83 c0 01             	add    $0x1,%eax
80105812:	3d 00 01 00 00       	cmp    $0x100,%eax
80105817:	75 bf                	jne    801057d8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105819:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010581a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
8010581f:	89 e5                	mov    %esp,%ebp
80105821:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105824:	a1 06 a2 10 80       	mov    0x8010a206,%eax

  initlock(&tickslock, "time");
80105829:	68 41 78 10 80       	push   $0x80107841
8010582e:	68 60 4f 11 80       	push   $0x80114f60
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105833:	66 89 15 a2 51 11 80 	mov    %dx,0x801151a2
8010583a:	c6 05 a4 51 11 80 00 	movb   $0x0,0x801151a4
80105841:	66 a3 a0 51 11 80    	mov    %ax,0x801151a0
80105847:	c1 e8 10             	shr    $0x10,%eax
8010584a:	c6 05 a5 51 11 80 ef 	movb   $0xef,0x801151a5
80105851:	66 a3 a6 51 11 80    	mov    %ax,0x801151a6

  initlock(&tickslock, "time");
80105857:	e8 94 e9 ff ff       	call   801041f0 <initlock>
}
8010585c:	83 c4 10             	add    $0x10,%esp
8010585f:	c9                   	leave  
80105860:	c3                   	ret    
80105861:	eb 0d                	jmp    80105870 <idtinit>
80105863:	90                   	nop
80105864:	90                   	nop
80105865:	90                   	nop
80105866:	90                   	nop
80105867:	90                   	nop
80105868:	90                   	nop
80105869:	90                   	nop
8010586a:	90                   	nop
8010586b:	90                   	nop
8010586c:	90                   	nop
8010586d:	90                   	nop
8010586e:	90                   	nop
8010586f:	90                   	nop

80105870 <idtinit>:

void
idtinit(void)
{
80105870:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105871:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105876:	89 e5                	mov    %esp,%ebp
80105878:	83 ec 10             	sub    $0x10,%esp
8010587b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010587f:	b8 a0 4f 11 80       	mov    $0x80114fa0,%eax
80105884:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105888:	c1 e8 10             	shr    $0x10,%eax
8010588b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010588f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105892:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105895:	c9                   	leave  
80105896:	c3                   	ret    
80105897:	89 f6                	mov    %esi,%esi
80105899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058a0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801058a0:	55                   	push   %ebp
801058a1:	89 e5                	mov    %esp,%ebp
801058a3:	57                   	push   %edi
801058a4:	56                   	push   %esi
801058a5:	53                   	push   %ebx
801058a6:	83 ec 1c             	sub    $0x1c,%esp
801058a9:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
801058ac:	8b 47 30             	mov    0x30(%edi),%eax
801058af:	83 f8 40             	cmp    $0x40,%eax
801058b2:	0f 84 88 01 00 00    	je     80105a40 <trap+0x1a0>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
801058b8:	83 e8 20             	sub    $0x20,%eax
801058bb:	83 f8 1f             	cmp    $0x1f,%eax
801058be:	77 10                	ja     801058d0 <trap+0x30>
801058c0:	ff 24 85 e8 78 10 80 	jmp    *-0x7fef8718(,%eax,4)
801058c7:	89 f6                	mov    %esi,%esi
801058c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
801058d0:	e8 cb de ff ff       	call   801037a0 <myproc>
801058d5:	85 c0                	test   %eax,%eax
801058d7:	0f 84 d7 01 00 00    	je     80105ab4 <trap+0x214>
801058dd:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801058e1:	0f 84 cd 01 00 00    	je     80105ab4 <trap+0x214>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801058e7:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058ea:	8b 57 38             	mov    0x38(%edi),%edx
801058ed:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801058f0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801058f3:	e8 88 de ff ff       	call   80103780 <cpuid>
801058f8:	8b 77 34             	mov    0x34(%edi),%esi
801058fb:	8b 5f 30             	mov    0x30(%edi),%ebx
801058fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105901:	e8 9a de ff ff       	call   801037a0 <myproc>
80105906:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105909:	e8 92 de ff ff       	call   801037a0 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010590e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105911:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105914:	51                   	push   %ecx
80105915:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105916:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105919:	ff 75 e4             	pushl  -0x1c(%ebp)
8010591c:	56                   	push   %esi
8010591d:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
8010591e:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105921:	52                   	push   %edx
80105922:	ff 70 10             	pushl  0x10(%eax)
80105925:	68 a4 78 10 80       	push   $0x801078a4
8010592a:	e8 31 ad ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
8010592f:	83 c4 20             	add    $0x20,%esp
80105932:	e8 69 de ff ff       	call   801037a0 <myproc>
80105937:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010593e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105940:	e8 5b de ff ff       	call   801037a0 <myproc>
80105945:	85 c0                	test   %eax,%eax
80105947:	74 0c                	je     80105955 <trap+0xb5>
80105949:	e8 52 de ff ff       	call   801037a0 <myproc>
8010594e:	8b 50 24             	mov    0x24(%eax),%edx
80105951:	85 d2                	test   %edx,%edx
80105953:	75 4b                	jne    801059a0 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105955:	e8 46 de ff ff       	call   801037a0 <myproc>
8010595a:	85 c0                	test   %eax,%eax
8010595c:	74 0b                	je     80105969 <trap+0xc9>
8010595e:	e8 3d de ff ff       	call   801037a0 <myproc>
80105963:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105967:	74 4f                	je     801059b8 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105969:	e8 32 de ff ff       	call   801037a0 <myproc>
8010596e:	85 c0                	test   %eax,%eax
80105970:	74 1d                	je     8010598f <trap+0xef>
80105972:	e8 29 de ff ff       	call   801037a0 <myproc>
80105977:	8b 40 24             	mov    0x24(%eax),%eax
8010597a:	85 c0                	test   %eax,%eax
8010597c:	74 11                	je     8010598f <trap+0xef>
8010597e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105982:	83 e0 03             	and    $0x3,%eax
80105985:	66 83 f8 03          	cmp    $0x3,%ax
80105989:	0f 84 da 00 00 00    	je     80105a69 <trap+0x1c9>
    exit();
}
8010598f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105992:	5b                   	pop    %ebx
80105993:	5e                   	pop    %esi
80105994:	5f                   	pop    %edi
80105995:	5d                   	pop    %ebp
80105996:	c3                   	ret    
80105997:	89 f6                	mov    %esi,%esi
80105999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801059a0:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801059a4:	83 e0 03             	and    $0x3,%eax
801059a7:	66 83 f8 03          	cmp    $0x3,%ax
801059ab:	75 a8                	jne    80105955 <trap+0xb5>
    exit();
801059ad:	e8 1e e2 ff ff       	call   80103bd0 <exit>
801059b2:	eb a1                	jmp    80105955 <trap+0xb5>
801059b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801059b8:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
801059bc:	75 ab                	jne    80105969 <trap+0xc9>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
801059be:	e8 3d e3 ff ff       	call   80103d00 <yield>
801059c3:	eb a4                	jmp    80105969 <trap+0xc9>
801059c5:	8d 76 00             	lea    0x0(%esi),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
801059c8:	e8 b3 dd ff ff       	call   80103780 <cpuid>
801059cd:	85 c0                	test   %eax,%eax
801059cf:	0f 84 ab 00 00 00    	je     80105a80 <trap+0x1e0>
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
801059d5:	e8 26 cd ff ff       	call   80102700 <lapiceoi>
    break;
801059da:	e9 61 ff ff ff       	jmp    80105940 <trap+0xa0>
801059df:	90                   	nop
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
801059e0:	e8 db cb ff ff       	call   801025c0 <kbdintr>
    lapiceoi();
801059e5:	e8 16 cd ff ff       	call   80102700 <lapiceoi>
    break;
801059ea:	e9 51 ff ff ff       	jmp    80105940 <trap+0xa0>
801059ef:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
801059f0:	e8 5b 02 00 00       	call   80105c50 <uartintr>
    lapiceoi();
801059f5:	e8 06 cd ff ff       	call   80102700 <lapiceoi>
    break;
801059fa:	e9 41 ff ff ff       	jmp    80105940 <trap+0xa0>
801059ff:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105a00:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105a04:	8b 77 38             	mov    0x38(%edi),%esi
80105a07:	e8 74 dd ff ff       	call   80103780 <cpuid>
80105a0c:	56                   	push   %esi
80105a0d:	53                   	push   %ebx
80105a0e:	50                   	push   %eax
80105a0f:	68 4c 78 10 80       	push   $0x8010784c
80105a14:	e8 47 ac ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80105a19:	e8 e2 cc ff ff       	call   80102700 <lapiceoi>
    break;
80105a1e:	83 c4 10             	add    $0x10,%esp
80105a21:	e9 1a ff ff ff       	jmp    80105940 <trap+0xa0>
80105a26:	8d 76 00             	lea    0x0(%esi),%esi
80105a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105a30:	e8 0b c6 ff ff       	call   80102040 <ideintr>
80105a35:	eb 9e                	jmp    801059d5 <trap+0x135>
80105a37:	89 f6                	mov    %esi,%esi
80105a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
80105a40:	e8 5b dd ff ff       	call   801037a0 <myproc>
80105a45:	8b 58 24             	mov    0x24(%eax),%ebx
80105a48:	85 db                	test   %ebx,%ebx
80105a4a:	75 2c                	jne    80105a78 <trap+0x1d8>
      exit();
    myproc()->tf = tf;
80105a4c:	e8 4f dd ff ff       	call   801037a0 <myproc>
80105a51:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105a54:	e8 f7 ed ff ff       	call   80104850 <syscall>
    if(myproc()->killed)
80105a59:	e8 42 dd ff ff       	call   801037a0 <myproc>
80105a5e:	8b 48 24             	mov    0x24(%eax),%ecx
80105a61:	85 c9                	test   %ecx,%ecx
80105a63:	0f 84 26 ff ff ff    	je     8010598f <trap+0xef>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105a69:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a6c:	5b                   	pop    %ebx
80105a6d:	5e                   	pop    %esi
80105a6e:	5f                   	pop    %edi
80105a6f:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
80105a70:	e9 5b e1 ff ff       	jmp    80103bd0 <exit>
80105a75:	8d 76 00             	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
80105a78:	e8 53 e1 ff ff       	call   80103bd0 <exit>
80105a7d:	eb cd                	jmp    80105a4c <trap+0x1ac>
80105a7f:	90                   	nop
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
80105a80:	83 ec 0c             	sub    $0xc,%esp
80105a83:	68 60 4f 11 80       	push   $0x80114f60
80105a88:	e8 c3 e8 ff ff       	call   80104350 <acquire>
      ticks++;
      wakeup(&ticks);
80105a8d:	c7 04 24 a0 57 11 80 	movl   $0x801157a0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
80105a94:	83 05 a0 57 11 80 01 	addl   $0x1,0x801157a0
      wakeup(&ticks);
80105a9b:	e8 70 e4 ff ff       	call   80103f10 <wakeup>
      release(&tickslock);
80105aa0:	c7 04 24 60 4f 11 80 	movl   $0x80114f60,(%esp)
80105aa7:	e8 54 e9 ff ff       	call   80104400 <release>
80105aac:	83 c4 10             	add    $0x10,%esp
80105aaf:	e9 21 ff ff ff       	jmp    801059d5 <trap+0x135>
80105ab4:	0f 20 d6             	mov    %cr2,%esi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105ab7:	8b 5f 38             	mov    0x38(%edi),%ebx
80105aba:	e8 c1 dc ff ff       	call   80103780 <cpuid>
80105abf:	83 ec 0c             	sub    $0xc,%esp
80105ac2:	56                   	push   %esi
80105ac3:	53                   	push   %ebx
80105ac4:	50                   	push   %eax
80105ac5:	ff 77 30             	pushl  0x30(%edi)
80105ac8:	68 70 78 10 80       	push   $0x80107870
80105acd:	e8 8e ab ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
80105ad2:	83 c4 14             	add    $0x14,%esp
80105ad5:	68 46 78 10 80       	push   $0x80107846
80105ada:	e8 91 a8 ff ff       	call   80100370 <panic>
80105adf:	90                   	nop

80105ae0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105ae0:	a1 bc a6 10 80       	mov    0x8010a6bc,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105ae5:	55                   	push   %ebp
80105ae6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105ae8:	85 c0                	test   %eax,%eax
80105aea:	74 1c                	je     80105b08 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105aec:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105af1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105af2:	a8 01                	test   $0x1,%al
80105af4:	74 12                	je     80105b08 <uartgetc+0x28>
80105af6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105afb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105afc:	0f b6 c0             	movzbl %al,%eax
}
80105aff:	5d                   	pop    %ebp
80105b00:	c3                   	ret    
80105b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105b08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105b0d:	5d                   	pop    %ebp
80105b0e:	c3                   	ret    
80105b0f:	90                   	nop

80105b10 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105b10:	55                   	push   %ebp
80105b11:	89 e5                	mov    %esp,%ebp
80105b13:	57                   	push   %edi
80105b14:	56                   	push   %esi
80105b15:	53                   	push   %ebx
80105b16:	89 c7                	mov    %eax,%edi
80105b18:	bb 80 00 00 00       	mov    $0x80,%ebx
80105b1d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105b22:	83 ec 0c             	sub    $0xc,%esp
80105b25:	eb 1b                	jmp    80105b42 <uartputc.part.0+0x32>
80105b27:	89 f6                	mov    %esi,%esi
80105b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105b30:	83 ec 0c             	sub    $0xc,%esp
80105b33:	6a 0a                	push   $0xa
80105b35:	e8 e6 cb ff ff       	call   80102720 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105b3a:	83 c4 10             	add    $0x10,%esp
80105b3d:	83 eb 01             	sub    $0x1,%ebx
80105b40:	74 07                	je     80105b49 <uartputc.part.0+0x39>
80105b42:	89 f2                	mov    %esi,%edx
80105b44:	ec                   	in     (%dx),%al
80105b45:	a8 20                	test   $0x20,%al
80105b47:	74 e7                	je     80105b30 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105b49:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b4e:	89 f8                	mov    %edi,%eax
80105b50:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105b51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b54:	5b                   	pop    %ebx
80105b55:	5e                   	pop    %esi
80105b56:	5f                   	pop    %edi
80105b57:	5d                   	pop    %ebp
80105b58:	c3                   	ret    
80105b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105b60 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105b60:	55                   	push   %ebp
80105b61:	31 c9                	xor    %ecx,%ecx
80105b63:	89 c8                	mov    %ecx,%eax
80105b65:	89 e5                	mov    %esp,%ebp
80105b67:	57                   	push   %edi
80105b68:	56                   	push   %esi
80105b69:	53                   	push   %ebx
80105b6a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105b6f:	89 da                	mov    %ebx,%edx
80105b71:	83 ec 0c             	sub    $0xc,%esp
80105b74:	ee                   	out    %al,(%dx)
80105b75:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105b7a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105b7f:	89 fa                	mov    %edi,%edx
80105b81:	ee                   	out    %al,(%dx)
80105b82:	b8 0c 00 00 00       	mov    $0xc,%eax
80105b87:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b8c:	ee                   	out    %al,(%dx)
80105b8d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105b92:	89 c8                	mov    %ecx,%eax
80105b94:	89 f2                	mov    %esi,%edx
80105b96:	ee                   	out    %al,(%dx)
80105b97:	b8 03 00 00 00       	mov    $0x3,%eax
80105b9c:	89 fa                	mov    %edi,%edx
80105b9e:	ee                   	out    %al,(%dx)
80105b9f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105ba4:	89 c8                	mov    %ecx,%eax
80105ba6:	ee                   	out    %al,(%dx)
80105ba7:	b8 01 00 00 00       	mov    $0x1,%eax
80105bac:	89 f2                	mov    %esi,%edx
80105bae:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105baf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105bb4:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105bb5:	3c ff                	cmp    $0xff,%al
80105bb7:	74 5a                	je     80105c13 <uartinit+0xb3>
    return;
  uart = 1;
80105bb9:	c7 05 bc a6 10 80 01 	movl   $0x1,0x8010a6bc
80105bc0:	00 00 00 
80105bc3:	89 da                	mov    %ebx,%edx
80105bc5:	ec                   	in     (%dx),%al
80105bc6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bcb:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);
80105bcc:	83 ec 08             	sub    $0x8,%esp
80105bcf:	bb 68 79 10 80       	mov    $0x80107968,%ebx
80105bd4:	6a 00                	push   $0x0
80105bd6:	6a 04                	push   $0x4
80105bd8:	e8 b3 c6 ff ff       	call   80102290 <ioapicenable>
80105bdd:	83 c4 10             	add    $0x10,%esp
80105be0:	b8 78 00 00 00       	mov    $0x78,%eax
80105be5:	eb 13                	jmp    80105bfa <uartinit+0x9a>
80105be7:	89 f6                	mov    %esi,%esi
80105be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105bf0:	83 c3 01             	add    $0x1,%ebx
80105bf3:	0f be 03             	movsbl (%ebx),%eax
80105bf6:	84 c0                	test   %al,%al
80105bf8:	74 19                	je     80105c13 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105bfa:	8b 15 bc a6 10 80    	mov    0x8010a6bc,%edx
80105c00:	85 d2                	test   %edx,%edx
80105c02:	74 ec                	je     80105bf0 <uartinit+0x90>
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105c04:	83 c3 01             	add    $0x1,%ebx
80105c07:	e8 04 ff ff ff       	call   80105b10 <uartputc.part.0>
80105c0c:	0f be 03             	movsbl (%ebx),%eax
80105c0f:	84 c0                	test   %al,%al
80105c11:	75 e7                	jne    80105bfa <uartinit+0x9a>
    uartputc(*p);
}
80105c13:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c16:	5b                   	pop    %ebx
80105c17:	5e                   	pop    %esi
80105c18:	5f                   	pop    %edi
80105c19:	5d                   	pop    %ebp
80105c1a:	c3                   	ret    
80105c1b:	90                   	nop
80105c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105c20 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105c20:	8b 15 bc a6 10 80    	mov    0x8010a6bc,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105c26:	55                   	push   %ebp
80105c27:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105c29:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105c2b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105c2e:	74 10                	je     80105c40 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105c30:	5d                   	pop    %ebp
80105c31:	e9 da fe ff ff       	jmp    80105b10 <uartputc.part.0>
80105c36:	8d 76 00             	lea    0x0(%esi),%esi
80105c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c40:	5d                   	pop    %ebp
80105c41:	c3                   	ret    
80105c42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c50 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105c50:	55                   	push   %ebp
80105c51:	89 e5                	mov    %esp,%ebp
80105c53:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105c56:	68 e0 5a 10 80       	push   $0x80105ae0
80105c5b:	e8 90 ab ff ff       	call   801007f0 <consoleintr>
}
80105c60:	83 c4 10             	add    $0x10,%esp
80105c63:	c9                   	leave  
80105c64:	c3                   	ret    

80105c65 <vector0>:
80105c65:	6a 00                	push   $0x0
80105c67:	6a 00                	push   $0x0
80105c69:	e9 37 fb ff ff       	jmp    801057a5 <alltraps>

80105c6e <vector1>:
80105c6e:	6a 00                	push   $0x0
80105c70:	6a 01                	push   $0x1
80105c72:	e9 2e fb ff ff       	jmp    801057a5 <alltraps>

80105c77 <vector2>:
80105c77:	6a 00                	push   $0x0
80105c79:	6a 02                	push   $0x2
80105c7b:	e9 25 fb ff ff       	jmp    801057a5 <alltraps>

80105c80 <vector3>:
80105c80:	6a 00                	push   $0x0
80105c82:	6a 03                	push   $0x3
80105c84:	e9 1c fb ff ff       	jmp    801057a5 <alltraps>

80105c89 <vector4>:
80105c89:	6a 00                	push   $0x0
80105c8b:	6a 04                	push   $0x4
80105c8d:	e9 13 fb ff ff       	jmp    801057a5 <alltraps>

80105c92 <vector5>:
80105c92:	6a 00                	push   $0x0
80105c94:	6a 05                	push   $0x5
80105c96:	e9 0a fb ff ff       	jmp    801057a5 <alltraps>

80105c9b <vector6>:
80105c9b:	6a 00                	push   $0x0
80105c9d:	6a 06                	push   $0x6
80105c9f:	e9 01 fb ff ff       	jmp    801057a5 <alltraps>

80105ca4 <vector7>:
80105ca4:	6a 00                	push   $0x0
80105ca6:	6a 07                	push   $0x7
80105ca8:	e9 f8 fa ff ff       	jmp    801057a5 <alltraps>

80105cad <vector8>:
80105cad:	6a 08                	push   $0x8
80105caf:	e9 f1 fa ff ff       	jmp    801057a5 <alltraps>

80105cb4 <vector9>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 09                	push   $0x9
80105cb8:	e9 e8 fa ff ff       	jmp    801057a5 <alltraps>

80105cbd <vector10>:
80105cbd:	6a 0a                	push   $0xa
80105cbf:	e9 e1 fa ff ff       	jmp    801057a5 <alltraps>

80105cc4 <vector11>:
80105cc4:	6a 0b                	push   $0xb
80105cc6:	e9 da fa ff ff       	jmp    801057a5 <alltraps>

80105ccb <vector12>:
80105ccb:	6a 0c                	push   $0xc
80105ccd:	e9 d3 fa ff ff       	jmp    801057a5 <alltraps>

80105cd2 <vector13>:
80105cd2:	6a 0d                	push   $0xd
80105cd4:	e9 cc fa ff ff       	jmp    801057a5 <alltraps>

80105cd9 <vector14>:
80105cd9:	6a 0e                	push   $0xe
80105cdb:	e9 c5 fa ff ff       	jmp    801057a5 <alltraps>

80105ce0 <vector15>:
80105ce0:	6a 00                	push   $0x0
80105ce2:	6a 0f                	push   $0xf
80105ce4:	e9 bc fa ff ff       	jmp    801057a5 <alltraps>

80105ce9 <vector16>:
80105ce9:	6a 00                	push   $0x0
80105ceb:	6a 10                	push   $0x10
80105ced:	e9 b3 fa ff ff       	jmp    801057a5 <alltraps>

80105cf2 <vector17>:
80105cf2:	6a 11                	push   $0x11
80105cf4:	e9 ac fa ff ff       	jmp    801057a5 <alltraps>

80105cf9 <vector18>:
80105cf9:	6a 00                	push   $0x0
80105cfb:	6a 12                	push   $0x12
80105cfd:	e9 a3 fa ff ff       	jmp    801057a5 <alltraps>

80105d02 <vector19>:
80105d02:	6a 00                	push   $0x0
80105d04:	6a 13                	push   $0x13
80105d06:	e9 9a fa ff ff       	jmp    801057a5 <alltraps>

80105d0b <vector20>:
80105d0b:	6a 00                	push   $0x0
80105d0d:	6a 14                	push   $0x14
80105d0f:	e9 91 fa ff ff       	jmp    801057a5 <alltraps>

80105d14 <vector21>:
80105d14:	6a 00                	push   $0x0
80105d16:	6a 15                	push   $0x15
80105d18:	e9 88 fa ff ff       	jmp    801057a5 <alltraps>

80105d1d <vector22>:
80105d1d:	6a 00                	push   $0x0
80105d1f:	6a 16                	push   $0x16
80105d21:	e9 7f fa ff ff       	jmp    801057a5 <alltraps>

80105d26 <vector23>:
80105d26:	6a 00                	push   $0x0
80105d28:	6a 17                	push   $0x17
80105d2a:	e9 76 fa ff ff       	jmp    801057a5 <alltraps>

80105d2f <vector24>:
80105d2f:	6a 00                	push   $0x0
80105d31:	6a 18                	push   $0x18
80105d33:	e9 6d fa ff ff       	jmp    801057a5 <alltraps>

80105d38 <vector25>:
80105d38:	6a 00                	push   $0x0
80105d3a:	6a 19                	push   $0x19
80105d3c:	e9 64 fa ff ff       	jmp    801057a5 <alltraps>

80105d41 <vector26>:
80105d41:	6a 00                	push   $0x0
80105d43:	6a 1a                	push   $0x1a
80105d45:	e9 5b fa ff ff       	jmp    801057a5 <alltraps>

80105d4a <vector27>:
80105d4a:	6a 00                	push   $0x0
80105d4c:	6a 1b                	push   $0x1b
80105d4e:	e9 52 fa ff ff       	jmp    801057a5 <alltraps>

80105d53 <vector28>:
80105d53:	6a 00                	push   $0x0
80105d55:	6a 1c                	push   $0x1c
80105d57:	e9 49 fa ff ff       	jmp    801057a5 <alltraps>

80105d5c <vector29>:
80105d5c:	6a 00                	push   $0x0
80105d5e:	6a 1d                	push   $0x1d
80105d60:	e9 40 fa ff ff       	jmp    801057a5 <alltraps>

80105d65 <vector30>:
80105d65:	6a 00                	push   $0x0
80105d67:	6a 1e                	push   $0x1e
80105d69:	e9 37 fa ff ff       	jmp    801057a5 <alltraps>

80105d6e <vector31>:
80105d6e:	6a 00                	push   $0x0
80105d70:	6a 1f                	push   $0x1f
80105d72:	e9 2e fa ff ff       	jmp    801057a5 <alltraps>

80105d77 <vector32>:
80105d77:	6a 00                	push   $0x0
80105d79:	6a 20                	push   $0x20
80105d7b:	e9 25 fa ff ff       	jmp    801057a5 <alltraps>

80105d80 <vector33>:
80105d80:	6a 00                	push   $0x0
80105d82:	6a 21                	push   $0x21
80105d84:	e9 1c fa ff ff       	jmp    801057a5 <alltraps>

80105d89 <vector34>:
80105d89:	6a 00                	push   $0x0
80105d8b:	6a 22                	push   $0x22
80105d8d:	e9 13 fa ff ff       	jmp    801057a5 <alltraps>

80105d92 <vector35>:
80105d92:	6a 00                	push   $0x0
80105d94:	6a 23                	push   $0x23
80105d96:	e9 0a fa ff ff       	jmp    801057a5 <alltraps>

80105d9b <vector36>:
80105d9b:	6a 00                	push   $0x0
80105d9d:	6a 24                	push   $0x24
80105d9f:	e9 01 fa ff ff       	jmp    801057a5 <alltraps>

80105da4 <vector37>:
80105da4:	6a 00                	push   $0x0
80105da6:	6a 25                	push   $0x25
80105da8:	e9 f8 f9 ff ff       	jmp    801057a5 <alltraps>

80105dad <vector38>:
80105dad:	6a 00                	push   $0x0
80105daf:	6a 26                	push   $0x26
80105db1:	e9 ef f9 ff ff       	jmp    801057a5 <alltraps>

80105db6 <vector39>:
80105db6:	6a 00                	push   $0x0
80105db8:	6a 27                	push   $0x27
80105dba:	e9 e6 f9 ff ff       	jmp    801057a5 <alltraps>

80105dbf <vector40>:
80105dbf:	6a 00                	push   $0x0
80105dc1:	6a 28                	push   $0x28
80105dc3:	e9 dd f9 ff ff       	jmp    801057a5 <alltraps>

80105dc8 <vector41>:
80105dc8:	6a 00                	push   $0x0
80105dca:	6a 29                	push   $0x29
80105dcc:	e9 d4 f9 ff ff       	jmp    801057a5 <alltraps>

80105dd1 <vector42>:
80105dd1:	6a 00                	push   $0x0
80105dd3:	6a 2a                	push   $0x2a
80105dd5:	e9 cb f9 ff ff       	jmp    801057a5 <alltraps>

80105dda <vector43>:
80105dda:	6a 00                	push   $0x0
80105ddc:	6a 2b                	push   $0x2b
80105dde:	e9 c2 f9 ff ff       	jmp    801057a5 <alltraps>

80105de3 <vector44>:
80105de3:	6a 00                	push   $0x0
80105de5:	6a 2c                	push   $0x2c
80105de7:	e9 b9 f9 ff ff       	jmp    801057a5 <alltraps>

80105dec <vector45>:
80105dec:	6a 00                	push   $0x0
80105dee:	6a 2d                	push   $0x2d
80105df0:	e9 b0 f9 ff ff       	jmp    801057a5 <alltraps>

80105df5 <vector46>:
80105df5:	6a 00                	push   $0x0
80105df7:	6a 2e                	push   $0x2e
80105df9:	e9 a7 f9 ff ff       	jmp    801057a5 <alltraps>

80105dfe <vector47>:
80105dfe:	6a 00                	push   $0x0
80105e00:	6a 2f                	push   $0x2f
80105e02:	e9 9e f9 ff ff       	jmp    801057a5 <alltraps>

80105e07 <vector48>:
80105e07:	6a 00                	push   $0x0
80105e09:	6a 30                	push   $0x30
80105e0b:	e9 95 f9 ff ff       	jmp    801057a5 <alltraps>

80105e10 <vector49>:
80105e10:	6a 00                	push   $0x0
80105e12:	6a 31                	push   $0x31
80105e14:	e9 8c f9 ff ff       	jmp    801057a5 <alltraps>

80105e19 <vector50>:
80105e19:	6a 00                	push   $0x0
80105e1b:	6a 32                	push   $0x32
80105e1d:	e9 83 f9 ff ff       	jmp    801057a5 <alltraps>

80105e22 <vector51>:
80105e22:	6a 00                	push   $0x0
80105e24:	6a 33                	push   $0x33
80105e26:	e9 7a f9 ff ff       	jmp    801057a5 <alltraps>

80105e2b <vector52>:
80105e2b:	6a 00                	push   $0x0
80105e2d:	6a 34                	push   $0x34
80105e2f:	e9 71 f9 ff ff       	jmp    801057a5 <alltraps>

80105e34 <vector53>:
80105e34:	6a 00                	push   $0x0
80105e36:	6a 35                	push   $0x35
80105e38:	e9 68 f9 ff ff       	jmp    801057a5 <alltraps>

80105e3d <vector54>:
80105e3d:	6a 00                	push   $0x0
80105e3f:	6a 36                	push   $0x36
80105e41:	e9 5f f9 ff ff       	jmp    801057a5 <alltraps>

80105e46 <vector55>:
80105e46:	6a 00                	push   $0x0
80105e48:	6a 37                	push   $0x37
80105e4a:	e9 56 f9 ff ff       	jmp    801057a5 <alltraps>

80105e4f <vector56>:
80105e4f:	6a 00                	push   $0x0
80105e51:	6a 38                	push   $0x38
80105e53:	e9 4d f9 ff ff       	jmp    801057a5 <alltraps>

80105e58 <vector57>:
80105e58:	6a 00                	push   $0x0
80105e5a:	6a 39                	push   $0x39
80105e5c:	e9 44 f9 ff ff       	jmp    801057a5 <alltraps>

80105e61 <vector58>:
80105e61:	6a 00                	push   $0x0
80105e63:	6a 3a                	push   $0x3a
80105e65:	e9 3b f9 ff ff       	jmp    801057a5 <alltraps>

80105e6a <vector59>:
80105e6a:	6a 00                	push   $0x0
80105e6c:	6a 3b                	push   $0x3b
80105e6e:	e9 32 f9 ff ff       	jmp    801057a5 <alltraps>

80105e73 <vector60>:
80105e73:	6a 00                	push   $0x0
80105e75:	6a 3c                	push   $0x3c
80105e77:	e9 29 f9 ff ff       	jmp    801057a5 <alltraps>

80105e7c <vector61>:
80105e7c:	6a 00                	push   $0x0
80105e7e:	6a 3d                	push   $0x3d
80105e80:	e9 20 f9 ff ff       	jmp    801057a5 <alltraps>

80105e85 <vector62>:
80105e85:	6a 00                	push   $0x0
80105e87:	6a 3e                	push   $0x3e
80105e89:	e9 17 f9 ff ff       	jmp    801057a5 <alltraps>

80105e8e <vector63>:
80105e8e:	6a 00                	push   $0x0
80105e90:	6a 3f                	push   $0x3f
80105e92:	e9 0e f9 ff ff       	jmp    801057a5 <alltraps>

80105e97 <vector64>:
80105e97:	6a 00                	push   $0x0
80105e99:	6a 40                	push   $0x40
80105e9b:	e9 05 f9 ff ff       	jmp    801057a5 <alltraps>

80105ea0 <vector65>:
80105ea0:	6a 00                	push   $0x0
80105ea2:	6a 41                	push   $0x41
80105ea4:	e9 fc f8 ff ff       	jmp    801057a5 <alltraps>

80105ea9 <vector66>:
80105ea9:	6a 00                	push   $0x0
80105eab:	6a 42                	push   $0x42
80105ead:	e9 f3 f8 ff ff       	jmp    801057a5 <alltraps>

80105eb2 <vector67>:
80105eb2:	6a 00                	push   $0x0
80105eb4:	6a 43                	push   $0x43
80105eb6:	e9 ea f8 ff ff       	jmp    801057a5 <alltraps>

80105ebb <vector68>:
80105ebb:	6a 00                	push   $0x0
80105ebd:	6a 44                	push   $0x44
80105ebf:	e9 e1 f8 ff ff       	jmp    801057a5 <alltraps>

80105ec4 <vector69>:
80105ec4:	6a 00                	push   $0x0
80105ec6:	6a 45                	push   $0x45
80105ec8:	e9 d8 f8 ff ff       	jmp    801057a5 <alltraps>

80105ecd <vector70>:
80105ecd:	6a 00                	push   $0x0
80105ecf:	6a 46                	push   $0x46
80105ed1:	e9 cf f8 ff ff       	jmp    801057a5 <alltraps>

80105ed6 <vector71>:
80105ed6:	6a 00                	push   $0x0
80105ed8:	6a 47                	push   $0x47
80105eda:	e9 c6 f8 ff ff       	jmp    801057a5 <alltraps>

80105edf <vector72>:
80105edf:	6a 00                	push   $0x0
80105ee1:	6a 48                	push   $0x48
80105ee3:	e9 bd f8 ff ff       	jmp    801057a5 <alltraps>

80105ee8 <vector73>:
80105ee8:	6a 00                	push   $0x0
80105eea:	6a 49                	push   $0x49
80105eec:	e9 b4 f8 ff ff       	jmp    801057a5 <alltraps>

80105ef1 <vector74>:
80105ef1:	6a 00                	push   $0x0
80105ef3:	6a 4a                	push   $0x4a
80105ef5:	e9 ab f8 ff ff       	jmp    801057a5 <alltraps>

80105efa <vector75>:
80105efa:	6a 00                	push   $0x0
80105efc:	6a 4b                	push   $0x4b
80105efe:	e9 a2 f8 ff ff       	jmp    801057a5 <alltraps>

80105f03 <vector76>:
80105f03:	6a 00                	push   $0x0
80105f05:	6a 4c                	push   $0x4c
80105f07:	e9 99 f8 ff ff       	jmp    801057a5 <alltraps>

80105f0c <vector77>:
80105f0c:	6a 00                	push   $0x0
80105f0e:	6a 4d                	push   $0x4d
80105f10:	e9 90 f8 ff ff       	jmp    801057a5 <alltraps>

80105f15 <vector78>:
80105f15:	6a 00                	push   $0x0
80105f17:	6a 4e                	push   $0x4e
80105f19:	e9 87 f8 ff ff       	jmp    801057a5 <alltraps>

80105f1e <vector79>:
80105f1e:	6a 00                	push   $0x0
80105f20:	6a 4f                	push   $0x4f
80105f22:	e9 7e f8 ff ff       	jmp    801057a5 <alltraps>

80105f27 <vector80>:
80105f27:	6a 00                	push   $0x0
80105f29:	6a 50                	push   $0x50
80105f2b:	e9 75 f8 ff ff       	jmp    801057a5 <alltraps>

80105f30 <vector81>:
80105f30:	6a 00                	push   $0x0
80105f32:	6a 51                	push   $0x51
80105f34:	e9 6c f8 ff ff       	jmp    801057a5 <alltraps>

80105f39 <vector82>:
80105f39:	6a 00                	push   $0x0
80105f3b:	6a 52                	push   $0x52
80105f3d:	e9 63 f8 ff ff       	jmp    801057a5 <alltraps>

80105f42 <vector83>:
80105f42:	6a 00                	push   $0x0
80105f44:	6a 53                	push   $0x53
80105f46:	e9 5a f8 ff ff       	jmp    801057a5 <alltraps>

80105f4b <vector84>:
80105f4b:	6a 00                	push   $0x0
80105f4d:	6a 54                	push   $0x54
80105f4f:	e9 51 f8 ff ff       	jmp    801057a5 <alltraps>

80105f54 <vector85>:
80105f54:	6a 00                	push   $0x0
80105f56:	6a 55                	push   $0x55
80105f58:	e9 48 f8 ff ff       	jmp    801057a5 <alltraps>

80105f5d <vector86>:
80105f5d:	6a 00                	push   $0x0
80105f5f:	6a 56                	push   $0x56
80105f61:	e9 3f f8 ff ff       	jmp    801057a5 <alltraps>

80105f66 <vector87>:
80105f66:	6a 00                	push   $0x0
80105f68:	6a 57                	push   $0x57
80105f6a:	e9 36 f8 ff ff       	jmp    801057a5 <alltraps>

80105f6f <vector88>:
80105f6f:	6a 00                	push   $0x0
80105f71:	6a 58                	push   $0x58
80105f73:	e9 2d f8 ff ff       	jmp    801057a5 <alltraps>

80105f78 <vector89>:
80105f78:	6a 00                	push   $0x0
80105f7a:	6a 59                	push   $0x59
80105f7c:	e9 24 f8 ff ff       	jmp    801057a5 <alltraps>

80105f81 <vector90>:
80105f81:	6a 00                	push   $0x0
80105f83:	6a 5a                	push   $0x5a
80105f85:	e9 1b f8 ff ff       	jmp    801057a5 <alltraps>

80105f8a <vector91>:
80105f8a:	6a 00                	push   $0x0
80105f8c:	6a 5b                	push   $0x5b
80105f8e:	e9 12 f8 ff ff       	jmp    801057a5 <alltraps>

80105f93 <vector92>:
80105f93:	6a 00                	push   $0x0
80105f95:	6a 5c                	push   $0x5c
80105f97:	e9 09 f8 ff ff       	jmp    801057a5 <alltraps>

80105f9c <vector93>:
80105f9c:	6a 00                	push   $0x0
80105f9e:	6a 5d                	push   $0x5d
80105fa0:	e9 00 f8 ff ff       	jmp    801057a5 <alltraps>

80105fa5 <vector94>:
80105fa5:	6a 00                	push   $0x0
80105fa7:	6a 5e                	push   $0x5e
80105fa9:	e9 f7 f7 ff ff       	jmp    801057a5 <alltraps>

80105fae <vector95>:
80105fae:	6a 00                	push   $0x0
80105fb0:	6a 5f                	push   $0x5f
80105fb2:	e9 ee f7 ff ff       	jmp    801057a5 <alltraps>

80105fb7 <vector96>:
80105fb7:	6a 00                	push   $0x0
80105fb9:	6a 60                	push   $0x60
80105fbb:	e9 e5 f7 ff ff       	jmp    801057a5 <alltraps>

80105fc0 <vector97>:
80105fc0:	6a 00                	push   $0x0
80105fc2:	6a 61                	push   $0x61
80105fc4:	e9 dc f7 ff ff       	jmp    801057a5 <alltraps>

80105fc9 <vector98>:
80105fc9:	6a 00                	push   $0x0
80105fcb:	6a 62                	push   $0x62
80105fcd:	e9 d3 f7 ff ff       	jmp    801057a5 <alltraps>

80105fd2 <vector99>:
80105fd2:	6a 00                	push   $0x0
80105fd4:	6a 63                	push   $0x63
80105fd6:	e9 ca f7 ff ff       	jmp    801057a5 <alltraps>

80105fdb <vector100>:
80105fdb:	6a 00                	push   $0x0
80105fdd:	6a 64                	push   $0x64
80105fdf:	e9 c1 f7 ff ff       	jmp    801057a5 <alltraps>

80105fe4 <vector101>:
80105fe4:	6a 00                	push   $0x0
80105fe6:	6a 65                	push   $0x65
80105fe8:	e9 b8 f7 ff ff       	jmp    801057a5 <alltraps>

80105fed <vector102>:
80105fed:	6a 00                	push   $0x0
80105fef:	6a 66                	push   $0x66
80105ff1:	e9 af f7 ff ff       	jmp    801057a5 <alltraps>

80105ff6 <vector103>:
80105ff6:	6a 00                	push   $0x0
80105ff8:	6a 67                	push   $0x67
80105ffa:	e9 a6 f7 ff ff       	jmp    801057a5 <alltraps>

80105fff <vector104>:
80105fff:	6a 00                	push   $0x0
80106001:	6a 68                	push   $0x68
80106003:	e9 9d f7 ff ff       	jmp    801057a5 <alltraps>

80106008 <vector105>:
80106008:	6a 00                	push   $0x0
8010600a:	6a 69                	push   $0x69
8010600c:	e9 94 f7 ff ff       	jmp    801057a5 <alltraps>

80106011 <vector106>:
80106011:	6a 00                	push   $0x0
80106013:	6a 6a                	push   $0x6a
80106015:	e9 8b f7 ff ff       	jmp    801057a5 <alltraps>

8010601a <vector107>:
8010601a:	6a 00                	push   $0x0
8010601c:	6a 6b                	push   $0x6b
8010601e:	e9 82 f7 ff ff       	jmp    801057a5 <alltraps>

80106023 <vector108>:
80106023:	6a 00                	push   $0x0
80106025:	6a 6c                	push   $0x6c
80106027:	e9 79 f7 ff ff       	jmp    801057a5 <alltraps>

8010602c <vector109>:
8010602c:	6a 00                	push   $0x0
8010602e:	6a 6d                	push   $0x6d
80106030:	e9 70 f7 ff ff       	jmp    801057a5 <alltraps>

80106035 <vector110>:
80106035:	6a 00                	push   $0x0
80106037:	6a 6e                	push   $0x6e
80106039:	e9 67 f7 ff ff       	jmp    801057a5 <alltraps>

8010603e <vector111>:
8010603e:	6a 00                	push   $0x0
80106040:	6a 6f                	push   $0x6f
80106042:	e9 5e f7 ff ff       	jmp    801057a5 <alltraps>

80106047 <vector112>:
80106047:	6a 00                	push   $0x0
80106049:	6a 70                	push   $0x70
8010604b:	e9 55 f7 ff ff       	jmp    801057a5 <alltraps>

80106050 <vector113>:
80106050:	6a 00                	push   $0x0
80106052:	6a 71                	push   $0x71
80106054:	e9 4c f7 ff ff       	jmp    801057a5 <alltraps>

80106059 <vector114>:
80106059:	6a 00                	push   $0x0
8010605b:	6a 72                	push   $0x72
8010605d:	e9 43 f7 ff ff       	jmp    801057a5 <alltraps>

80106062 <vector115>:
80106062:	6a 00                	push   $0x0
80106064:	6a 73                	push   $0x73
80106066:	e9 3a f7 ff ff       	jmp    801057a5 <alltraps>

8010606b <vector116>:
8010606b:	6a 00                	push   $0x0
8010606d:	6a 74                	push   $0x74
8010606f:	e9 31 f7 ff ff       	jmp    801057a5 <alltraps>

80106074 <vector117>:
80106074:	6a 00                	push   $0x0
80106076:	6a 75                	push   $0x75
80106078:	e9 28 f7 ff ff       	jmp    801057a5 <alltraps>

8010607d <vector118>:
8010607d:	6a 00                	push   $0x0
8010607f:	6a 76                	push   $0x76
80106081:	e9 1f f7 ff ff       	jmp    801057a5 <alltraps>

80106086 <vector119>:
80106086:	6a 00                	push   $0x0
80106088:	6a 77                	push   $0x77
8010608a:	e9 16 f7 ff ff       	jmp    801057a5 <alltraps>

8010608f <vector120>:
8010608f:	6a 00                	push   $0x0
80106091:	6a 78                	push   $0x78
80106093:	e9 0d f7 ff ff       	jmp    801057a5 <alltraps>

80106098 <vector121>:
80106098:	6a 00                	push   $0x0
8010609a:	6a 79                	push   $0x79
8010609c:	e9 04 f7 ff ff       	jmp    801057a5 <alltraps>

801060a1 <vector122>:
801060a1:	6a 00                	push   $0x0
801060a3:	6a 7a                	push   $0x7a
801060a5:	e9 fb f6 ff ff       	jmp    801057a5 <alltraps>

801060aa <vector123>:
801060aa:	6a 00                	push   $0x0
801060ac:	6a 7b                	push   $0x7b
801060ae:	e9 f2 f6 ff ff       	jmp    801057a5 <alltraps>

801060b3 <vector124>:
801060b3:	6a 00                	push   $0x0
801060b5:	6a 7c                	push   $0x7c
801060b7:	e9 e9 f6 ff ff       	jmp    801057a5 <alltraps>

801060bc <vector125>:
801060bc:	6a 00                	push   $0x0
801060be:	6a 7d                	push   $0x7d
801060c0:	e9 e0 f6 ff ff       	jmp    801057a5 <alltraps>

801060c5 <vector126>:
801060c5:	6a 00                	push   $0x0
801060c7:	6a 7e                	push   $0x7e
801060c9:	e9 d7 f6 ff ff       	jmp    801057a5 <alltraps>

801060ce <vector127>:
801060ce:	6a 00                	push   $0x0
801060d0:	6a 7f                	push   $0x7f
801060d2:	e9 ce f6 ff ff       	jmp    801057a5 <alltraps>

801060d7 <vector128>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 80 00 00 00       	push   $0x80
801060de:	e9 c2 f6 ff ff       	jmp    801057a5 <alltraps>

801060e3 <vector129>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 81 00 00 00       	push   $0x81
801060ea:	e9 b6 f6 ff ff       	jmp    801057a5 <alltraps>

801060ef <vector130>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 82 00 00 00       	push   $0x82
801060f6:	e9 aa f6 ff ff       	jmp    801057a5 <alltraps>

801060fb <vector131>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 83 00 00 00       	push   $0x83
80106102:	e9 9e f6 ff ff       	jmp    801057a5 <alltraps>

80106107 <vector132>:
80106107:	6a 00                	push   $0x0
80106109:	68 84 00 00 00       	push   $0x84
8010610e:	e9 92 f6 ff ff       	jmp    801057a5 <alltraps>

80106113 <vector133>:
80106113:	6a 00                	push   $0x0
80106115:	68 85 00 00 00       	push   $0x85
8010611a:	e9 86 f6 ff ff       	jmp    801057a5 <alltraps>

8010611f <vector134>:
8010611f:	6a 00                	push   $0x0
80106121:	68 86 00 00 00       	push   $0x86
80106126:	e9 7a f6 ff ff       	jmp    801057a5 <alltraps>

8010612b <vector135>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 87 00 00 00       	push   $0x87
80106132:	e9 6e f6 ff ff       	jmp    801057a5 <alltraps>

80106137 <vector136>:
80106137:	6a 00                	push   $0x0
80106139:	68 88 00 00 00       	push   $0x88
8010613e:	e9 62 f6 ff ff       	jmp    801057a5 <alltraps>

80106143 <vector137>:
80106143:	6a 00                	push   $0x0
80106145:	68 89 00 00 00       	push   $0x89
8010614a:	e9 56 f6 ff ff       	jmp    801057a5 <alltraps>

8010614f <vector138>:
8010614f:	6a 00                	push   $0x0
80106151:	68 8a 00 00 00       	push   $0x8a
80106156:	e9 4a f6 ff ff       	jmp    801057a5 <alltraps>

8010615b <vector139>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 8b 00 00 00       	push   $0x8b
80106162:	e9 3e f6 ff ff       	jmp    801057a5 <alltraps>

80106167 <vector140>:
80106167:	6a 00                	push   $0x0
80106169:	68 8c 00 00 00       	push   $0x8c
8010616e:	e9 32 f6 ff ff       	jmp    801057a5 <alltraps>

80106173 <vector141>:
80106173:	6a 00                	push   $0x0
80106175:	68 8d 00 00 00       	push   $0x8d
8010617a:	e9 26 f6 ff ff       	jmp    801057a5 <alltraps>

8010617f <vector142>:
8010617f:	6a 00                	push   $0x0
80106181:	68 8e 00 00 00       	push   $0x8e
80106186:	e9 1a f6 ff ff       	jmp    801057a5 <alltraps>

8010618b <vector143>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 8f 00 00 00       	push   $0x8f
80106192:	e9 0e f6 ff ff       	jmp    801057a5 <alltraps>

80106197 <vector144>:
80106197:	6a 00                	push   $0x0
80106199:	68 90 00 00 00       	push   $0x90
8010619e:	e9 02 f6 ff ff       	jmp    801057a5 <alltraps>

801061a3 <vector145>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 91 00 00 00       	push   $0x91
801061aa:	e9 f6 f5 ff ff       	jmp    801057a5 <alltraps>

801061af <vector146>:
801061af:	6a 00                	push   $0x0
801061b1:	68 92 00 00 00       	push   $0x92
801061b6:	e9 ea f5 ff ff       	jmp    801057a5 <alltraps>

801061bb <vector147>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 93 00 00 00       	push   $0x93
801061c2:	e9 de f5 ff ff       	jmp    801057a5 <alltraps>

801061c7 <vector148>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 94 00 00 00       	push   $0x94
801061ce:	e9 d2 f5 ff ff       	jmp    801057a5 <alltraps>

801061d3 <vector149>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 95 00 00 00       	push   $0x95
801061da:	e9 c6 f5 ff ff       	jmp    801057a5 <alltraps>

801061df <vector150>:
801061df:	6a 00                	push   $0x0
801061e1:	68 96 00 00 00       	push   $0x96
801061e6:	e9 ba f5 ff ff       	jmp    801057a5 <alltraps>

801061eb <vector151>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 97 00 00 00       	push   $0x97
801061f2:	e9 ae f5 ff ff       	jmp    801057a5 <alltraps>

801061f7 <vector152>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 98 00 00 00       	push   $0x98
801061fe:	e9 a2 f5 ff ff       	jmp    801057a5 <alltraps>

80106203 <vector153>:
80106203:	6a 00                	push   $0x0
80106205:	68 99 00 00 00       	push   $0x99
8010620a:	e9 96 f5 ff ff       	jmp    801057a5 <alltraps>

8010620f <vector154>:
8010620f:	6a 00                	push   $0x0
80106211:	68 9a 00 00 00       	push   $0x9a
80106216:	e9 8a f5 ff ff       	jmp    801057a5 <alltraps>

8010621b <vector155>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 9b 00 00 00       	push   $0x9b
80106222:	e9 7e f5 ff ff       	jmp    801057a5 <alltraps>

80106227 <vector156>:
80106227:	6a 00                	push   $0x0
80106229:	68 9c 00 00 00       	push   $0x9c
8010622e:	e9 72 f5 ff ff       	jmp    801057a5 <alltraps>

80106233 <vector157>:
80106233:	6a 00                	push   $0x0
80106235:	68 9d 00 00 00       	push   $0x9d
8010623a:	e9 66 f5 ff ff       	jmp    801057a5 <alltraps>

8010623f <vector158>:
8010623f:	6a 00                	push   $0x0
80106241:	68 9e 00 00 00       	push   $0x9e
80106246:	e9 5a f5 ff ff       	jmp    801057a5 <alltraps>

8010624b <vector159>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 9f 00 00 00       	push   $0x9f
80106252:	e9 4e f5 ff ff       	jmp    801057a5 <alltraps>

80106257 <vector160>:
80106257:	6a 00                	push   $0x0
80106259:	68 a0 00 00 00       	push   $0xa0
8010625e:	e9 42 f5 ff ff       	jmp    801057a5 <alltraps>

80106263 <vector161>:
80106263:	6a 00                	push   $0x0
80106265:	68 a1 00 00 00       	push   $0xa1
8010626a:	e9 36 f5 ff ff       	jmp    801057a5 <alltraps>

8010626f <vector162>:
8010626f:	6a 00                	push   $0x0
80106271:	68 a2 00 00 00       	push   $0xa2
80106276:	e9 2a f5 ff ff       	jmp    801057a5 <alltraps>

8010627b <vector163>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 a3 00 00 00       	push   $0xa3
80106282:	e9 1e f5 ff ff       	jmp    801057a5 <alltraps>

80106287 <vector164>:
80106287:	6a 00                	push   $0x0
80106289:	68 a4 00 00 00       	push   $0xa4
8010628e:	e9 12 f5 ff ff       	jmp    801057a5 <alltraps>

80106293 <vector165>:
80106293:	6a 00                	push   $0x0
80106295:	68 a5 00 00 00       	push   $0xa5
8010629a:	e9 06 f5 ff ff       	jmp    801057a5 <alltraps>

8010629f <vector166>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 a6 00 00 00       	push   $0xa6
801062a6:	e9 fa f4 ff ff       	jmp    801057a5 <alltraps>

801062ab <vector167>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 a7 00 00 00       	push   $0xa7
801062b2:	e9 ee f4 ff ff       	jmp    801057a5 <alltraps>

801062b7 <vector168>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 a8 00 00 00       	push   $0xa8
801062be:	e9 e2 f4 ff ff       	jmp    801057a5 <alltraps>

801062c3 <vector169>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 a9 00 00 00       	push   $0xa9
801062ca:	e9 d6 f4 ff ff       	jmp    801057a5 <alltraps>

801062cf <vector170>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 aa 00 00 00       	push   $0xaa
801062d6:	e9 ca f4 ff ff       	jmp    801057a5 <alltraps>

801062db <vector171>:
801062db:	6a 00                	push   $0x0
801062dd:	68 ab 00 00 00       	push   $0xab
801062e2:	e9 be f4 ff ff       	jmp    801057a5 <alltraps>

801062e7 <vector172>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 ac 00 00 00       	push   $0xac
801062ee:	e9 b2 f4 ff ff       	jmp    801057a5 <alltraps>

801062f3 <vector173>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 ad 00 00 00       	push   $0xad
801062fa:	e9 a6 f4 ff ff       	jmp    801057a5 <alltraps>

801062ff <vector174>:
801062ff:	6a 00                	push   $0x0
80106301:	68 ae 00 00 00       	push   $0xae
80106306:	e9 9a f4 ff ff       	jmp    801057a5 <alltraps>

8010630b <vector175>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 af 00 00 00       	push   $0xaf
80106312:	e9 8e f4 ff ff       	jmp    801057a5 <alltraps>

80106317 <vector176>:
80106317:	6a 00                	push   $0x0
80106319:	68 b0 00 00 00       	push   $0xb0
8010631e:	e9 82 f4 ff ff       	jmp    801057a5 <alltraps>

80106323 <vector177>:
80106323:	6a 00                	push   $0x0
80106325:	68 b1 00 00 00       	push   $0xb1
8010632a:	e9 76 f4 ff ff       	jmp    801057a5 <alltraps>

8010632f <vector178>:
8010632f:	6a 00                	push   $0x0
80106331:	68 b2 00 00 00       	push   $0xb2
80106336:	e9 6a f4 ff ff       	jmp    801057a5 <alltraps>

8010633b <vector179>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 b3 00 00 00       	push   $0xb3
80106342:	e9 5e f4 ff ff       	jmp    801057a5 <alltraps>

80106347 <vector180>:
80106347:	6a 00                	push   $0x0
80106349:	68 b4 00 00 00       	push   $0xb4
8010634e:	e9 52 f4 ff ff       	jmp    801057a5 <alltraps>

80106353 <vector181>:
80106353:	6a 00                	push   $0x0
80106355:	68 b5 00 00 00       	push   $0xb5
8010635a:	e9 46 f4 ff ff       	jmp    801057a5 <alltraps>

8010635f <vector182>:
8010635f:	6a 00                	push   $0x0
80106361:	68 b6 00 00 00       	push   $0xb6
80106366:	e9 3a f4 ff ff       	jmp    801057a5 <alltraps>

8010636b <vector183>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 b7 00 00 00       	push   $0xb7
80106372:	e9 2e f4 ff ff       	jmp    801057a5 <alltraps>

80106377 <vector184>:
80106377:	6a 00                	push   $0x0
80106379:	68 b8 00 00 00       	push   $0xb8
8010637e:	e9 22 f4 ff ff       	jmp    801057a5 <alltraps>

80106383 <vector185>:
80106383:	6a 00                	push   $0x0
80106385:	68 b9 00 00 00       	push   $0xb9
8010638a:	e9 16 f4 ff ff       	jmp    801057a5 <alltraps>

8010638f <vector186>:
8010638f:	6a 00                	push   $0x0
80106391:	68 ba 00 00 00       	push   $0xba
80106396:	e9 0a f4 ff ff       	jmp    801057a5 <alltraps>

8010639b <vector187>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 bb 00 00 00       	push   $0xbb
801063a2:	e9 fe f3 ff ff       	jmp    801057a5 <alltraps>

801063a7 <vector188>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 bc 00 00 00       	push   $0xbc
801063ae:	e9 f2 f3 ff ff       	jmp    801057a5 <alltraps>

801063b3 <vector189>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 bd 00 00 00       	push   $0xbd
801063ba:	e9 e6 f3 ff ff       	jmp    801057a5 <alltraps>

801063bf <vector190>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 be 00 00 00       	push   $0xbe
801063c6:	e9 da f3 ff ff       	jmp    801057a5 <alltraps>

801063cb <vector191>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 bf 00 00 00       	push   $0xbf
801063d2:	e9 ce f3 ff ff       	jmp    801057a5 <alltraps>

801063d7 <vector192>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 c0 00 00 00       	push   $0xc0
801063de:	e9 c2 f3 ff ff       	jmp    801057a5 <alltraps>

801063e3 <vector193>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 c1 00 00 00       	push   $0xc1
801063ea:	e9 b6 f3 ff ff       	jmp    801057a5 <alltraps>

801063ef <vector194>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 c2 00 00 00       	push   $0xc2
801063f6:	e9 aa f3 ff ff       	jmp    801057a5 <alltraps>

801063fb <vector195>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 c3 00 00 00       	push   $0xc3
80106402:	e9 9e f3 ff ff       	jmp    801057a5 <alltraps>

80106407 <vector196>:
80106407:	6a 00                	push   $0x0
80106409:	68 c4 00 00 00       	push   $0xc4
8010640e:	e9 92 f3 ff ff       	jmp    801057a5 <alltraps>

80106413 <vector197>:
80106413:	6a 00                	push   $0x0
80106415:	68 c5 00 00 00       	push   $0xc5
8010641a:	e9 86 f3 ff ff       	jmp    801057a5 <alltraps>

8010641f <vector198>:
8010641f:	6a 00                	push   $0x0
80106421:	68 c6 00 00 00       	push   $0xc6
80106426:	e9 7a f3 ff ff       	jmp    801057a5 <alltraps>

8010642b <vector199>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 c7 00 00 00       	push   $0xc7
80106432:	e9 6e f3 ff ff       	jmp    801057a5 <alltraps>

80106437 <vector200>:
80106437:	6a 00                	push   $0x0
80106439:	68 c8 00 00 00       	push   $0xc8
8010643e:	e9 62 f3 ff ff       	jmp    801057a5 <alltraps>

80106443 <vector201>:
80106443:	6a 00                	push   $0x0
80106445:	68 c9 00 00 00       	push   $0xc9
8010644a:	e9 56 f3 ff ff       	jmp    801057a5 <alltraps>

8010644f <vector202>:
8010644f:	6a 00                	push   $0x0
80106451:	68 ca 00 00 00       	push   $0xca
80106456:	e9 4a f3 ff ff       	jmp    801057a5 <alltraps>

8010645b <vector203>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 cb 00 00 00       	push   $0xcb
80106462:	e9 3e f3 ff ff       	jmp    801057a5 <alltraps>

80106467 <vector204>:
80106467:	6a 00                	push   $0x0
80106469:	68 cc 00 00 00       	push   $0xcc
8010646e:	e9 32 f3 ff ff       	jmp    801057a5 <alltraps>

80106473 <vector205>:
80106473:	6a 00                	push   $0x0
80106475:	68 cd 00 00 00       	push   $0xcd
8010647a:	e9 26 f3 ff ff       	jmp    801057a5 <alltraps>

8010647f <vector206>:
8010647f:	6a 00                	push   $0x0
80106481:	68 ce 00 00 00       	push   $0xce
80106486:	e9 1a f3 ff ff       	jmp    801057a5 <alltraps>

8010648b <vector207>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 cf 00 00 00       	push   $0xcf
80106492:	e9 0e f3 ff ff       	jmp    801057a5 <alltraps>

80106497 <vector208>:
80106497:	6a 00                	push   $0x0
80106499:	68 d0 00 00 00       	push   $0xd0
8010649e:	e9 02 f3 ff ff       	jmp    801057a5 <alltraps>

801064a3 <vector209>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 d1 00 00 00       	push   $0xd1
801064aa:	e9 f6 f2 ff ff       	jmp    801057a5 <alltraps>

801064af <vector210>:
801064af:	6a 00                	push   $0x0
801064b1:	68 d2 00 00 00       	push   $0xd2
801064b6:	e9 ea f2 ff ff       	jmp    801057a5 <alltraps>

801064bb <vector211>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 d3 00 00 00       	push   $0xd3
801064c2:	e9 de f2 ff ff       	jmp    801057a5 <alltraps>

801064c7 <vector212>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 d4 00 00 00       	push   $0xd4
801064ce:	e9 d2 f2 ff ff       	jmp    801057a5 <alltraps>

801064d3 <vector213>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 d5 00 00 00       	push   $0xd5
801064da:	e9 c6 f2 ff ff       	jmp    801057a5 <alltraps>

801064df <vector214>:
801064df:	6a 00                	push   $0x0
801064e1:	68 d6 00 00 00       	push   $0xd6
801064e6:	e9 ba f2 ff ff       	jmp    801057a5 <alltraps>

801064eb <vector215>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 d7 00 00 00       	push   $0xd7
801064f2:	e9 ae f2 ff ff       	jmp    801057a5 <alltraps>

801064f7 <vector216>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 d8 00 00 00       	push   $0xd8
801064fe:	e9 a2 f2 ff ff       	jmp    801057a5 <alltraps>

80106503 <vector217>:
80106503:	6a 00                	push   $0x0
80106505:	68 d9 00 00 00       	push   $0xd9
8010650a:	e9 96 f2 ff ff       	jmp    801057a5 <alltraps>

8010650f <vector218>:
8010650f:	6a 00                	push   $0x0
80106511:	68 da 00 00 00       	push   $0xda
80106516:	e9 8a f2 ff ff       	jmp    801057a5 <alltraps>

8010651b <vector219>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 db 00 00 00       	push   $0xdb
80106522:	e9 7e f2 ff ff       	jmp    801057a5 <alltraps>

80106527 <vector220>:
80106527:	6a 00                	push   $0x0
80106529:	68 dc 00 00 00       	push   $0xdc
8010652e:	e9 72 f2 ff ff       	jmp    801057a5 <alltraps>

80106533 <vector221>:
80106533:	6a 00                	push   $0x0
80106535:	68 dd 00 00 00       	push   $0xdd
8010653a:	e9 66 f2 ff ff       	jmp    801057a5 <alltraps>

8010653f <vector222>:
8010653f:	6a 00                	push   $0x0
80106541:	68 de 00 00 00       	push   $0xde
80106546:	e9 5a f2 ff ff       	jmp    801057a5 <alltraps>

8010654b <vector223>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 df 00 00 00       	push   $0xdf
80106552:	e9 4e f2 ff ff       	jmp    801057a5 <alltraps>

80106557 <vector224>:
80106557:	6a 00                	push   $0x0
80106559:	68 e0 00 00 00       	push   $0xe0
8010655e:	e9 42 f2 ff ff       	jmp    801057a5 <alltraps>

80106563 <vector225>:
80106563:	6a 00                	push   $0x0
80106565:	68 e1 00 00 00       	push   $0xe1
8010656a:	e9 36 f2 ff ff       	jmp    801057a5 <alltraps>

8010656f <vector226>:
8010656f:	6a 00                	push   $0x0
80106571:	68 e2 00 00 00       	push   $0xe2
80106576:	e9 2a f2 ff ff       	jmp    801057a5 <alltraps>

8010657b <vector227>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 e3 00 00 00       	push   $0xe3
80106582:	e9 1e f2 ff ff       	jmp    801057a5 <alltraps>

80106587 <vector228>:
80106587:	6a 00                	push   $0x0
80106589:	68 e4 00 00 00       	push   $0xe4
8010658e:	e9 12 f2 ff ff       	jmp    801057a5 <alltraps>

80106593 <vector229>:
80106593:	6a 00                	push   $0x0
80106595:	68 e5 00 00 00       	push   $0xe5
8010659a:	e9 06 f2 ff ff       	jmp    801057a5 <alltraps>

8010659f <vector230>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 e6 00 00 00       	push   $0xe6
801065a6:	e9 fa f1 ff ff       	jmp    801057a5 <alltraps>

801065ab <vector231>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 e7 00 00 00       	push   $0xe7
801065b2:	e9 ee f1 ff ff       	jmp    801057a5 <alltraps>

801065b7 <vector232>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 e8 00 00 00       	push   $0xe8
801065be:	e9 e2 f1 ff ff       	jmp    801057a5 <alltraps>

801065c3 <vector233>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 e9 00 00 00       	push   $0xe9
801065ca:	e9 d6 f1 ff ff       	jmp    801057a5 <alltraps>

801065cf <vector234>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 ea 00 00 00       	push   $0xea
801065d6:	e9 ca f1 ff ff       	jmp    801057a5 <alltraps>

801065db <vector235>:
801065db:	6a 00                	push   $0x0
801065dd:	68 eb 00 00 00       	push   $0xeb
801065e2:	e9 be f1 ff ff       	jmp    801057a5 <alltraps>

801065e7 <vector236>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 ec 00 00 00       	push   $0xec
801065ee:	e9 b2 f1 ff ff       	jmp    801057a5 <alltraps>

801065f3 <vector237>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 ed 00 00 00       	push   $0xed
801065fa:	e9 a6 f1 ff ff       	jmp    801057a5 <alltraps>

801065ff <vector238>:
801065ff:	6a 00                	push   $0x0
80106601:	68 ee 00 00 00       	push   $0xee
80106606:	e9 9a f1 ff ff       	jmp    801057a5 <alltraps>

8010660b <vector239>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 ef 00 00 00       	push   $0xef
80106612:	e9 8e f1 ff ff       	jmp    801057a5 <alltraps>

80106617 <vector240>:
80106617:	6a 00                	push   $0x0
80106619:	68 f0 00 00 00       	push   $0xf0
8010661e:	e9 82 f1 ff ff       	jmp    801057a5 <alltraps>

80106623 <vector241>:
80106623:	6a 00                	push   $0x0
80106625:	68 f1 00 00 00       	push   $0xf1
8010662a:	e9 76 f1 ff ff       	jmp    801057a5 <alltraps>

8010662f <vector242>:
8010662f:	6a 00                	push   $0x0
80106631:	68 f2 00 00 00       	push   $0xf2
80106636:	e9 6a f1 ff ff       	jmp    801057a5 <alltraps>

8010663b <vector243>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 f3 00 00 00       	push   $0xf3
80106642:	e9 5e f1 ff ff       	jmp    801057a5 <alltraps>

80106647 <vector244>:
80106647:	6a 00                	push   $0x0
80106649:	68 f4 00 00 00       	push   $0xf4
8010664e:	e9 52 f1 ff ff       	jmp    801057a5 <alltraps>

80106653 <vector245>:
80106653:	6a 00                	push   $0x0
80106655:	68 f5 00 00 00       	push   $0xf5
8010665a:	e9 46 f1 ff ff       	jmp    801057a5 <alltraps>

8010665f <vector246>:
8010665f:	6a 00                	push   $0x0
80106661:	68 f6 00 00 00       	push   $0xf6
80106666:	e9 3a f1 ff ff       	jmp    801057a5 <alltraps>

8010666b <vector247>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 f7 00 00 00       	push   $0xf7
80106672:	e9 2e f1 ff ff       	jmp    801057a5 <alltraps>

80106677 <vector248>:
80106677:	6a 00                	push   $0x0
80106679:	68 f8 00 00 00       	push   $0xf8
8010667e:	e9 22 f1 ff ff       	jmp    801057a5 <alltraps>

80106683 <vector249>:
80106683:	6a 00                	push   $0x0
80106685:	68 f9 00 00 00       	push   $0xf9
8010668a:	e9 16 f1 ff ff       	jmp    801057a5 <alltraps>

8010668f <vector250>:
8010668f:	6a 00                	push   $0x0
80106691:	68 fa 00 00 00       	push   $0xfa
80106696:	e9 0a f1 ff ff       	jmp    801057a5 <alltraps>

8010669b <vector251>:
8010669b:	6a 00                	push   $0x0
8010669d:	68 fb 00 00 00       	push   $0xfb
801066a2:	e9 fe f0 ff ff       	jmp    801057a5 <alltraps>

801066a7 <vector252>:
801066a7:	6a 00                	push   $0x0
801066a9:	68 fc 00 00 00       	push   $0xfc
801066ae:	e9 f2 f0 ff ff       	jmp    801057a5 <alltraps>

801066b3 <vector253>:
801066b3:	6a 00                	push   $0x0
801066b5:	68 fd 00 00 00       	push   $0xfd
801066ba:	e9 e6 f0 ff ff       	jmp    801057a5 <alltraps>

801066bf <vector254>:
801066bf:	6a 00                	push   $0x0
801066c1:	68 fe 00 00 00       	push   $0xfe
801066c6:	e9 da f0 ff ff       	jmp    801057a5 <alltraps>

801066cb <vector255>:
801066cb:	6a 00                	push   $0x0
801066cd:	68 ff 00 00 00       	push   $0xff
801066d2:	e9 ce f0 ff ff       	jmp    801057a5 <alltraps>
801066d7:	66 90                	xchg   %ax,%ax
801066d9:	66 90                	xchg   %ax,%ax
801066db:	66 90                	xchg   %ax,%ax
801066dd:	66 90                	xchg   %ax,%ax
801066df:	90                   	nop

801066e0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801066e0:	55                   	push   %ebp
801066e1:	89 e5                	mov    %esp,%ebp
801066e3:	57                   	push   %edi
801066e4:	56                   	push   %esi
801066e5:	53                   	push   %ebx
801066e6:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801066e8:	c1 ea 16             	shr    $0x16,%edx
801066eb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801066ee:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
801066f1:	8b 07                	mov    (%edi),%eax
801066f3:	a8 01                	test   $0x1,%al
801066f5:	74 29                	je     80106720 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801066f7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801066fc:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106702:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106705:	c1 eb 0a             	shr    $0xa,%ebx
80106708:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010670e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106711:	5b                   	pop    %ebx
80106712:	5e                   	pop    %esi
80106713:	5f                   	pop    %edi
80106714:	5d                   	pop    %ebp
80106715:	c3                   	ret    
80106716:	8d 76 00             	lea    0x0(%esi),%esi
80106719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106720:	85 c9                	test   %ecx,%ecx
80106722:	74 2c                	je     80106750 <walkpgdir+0x70>
80106724:	e8 57 bd ff ff       	call   80102480 <kalloc>
80106729:	85 c0                	test   %eax,%eax
8010672b:	89 c6                	mov    %eax,%esi
8010672d:	74 21                	je     80106750 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010672f:	83 ec 04             	sub    $0x4,%esp
80106732:	68 00 10 00 00       	push   $0x1000
80106737:	6a 00                	push   $0x0
80106739:	50                   	push   %eax
8010673a:	e8 11 dd ff ff       	call   80104450 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010673f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106745:	83 c4 10             	add    $0x10,%esp
80106748:	83 c8 07             	or     $0x7,%eax
8010674b:	89 07                	mov    %eax,(%edi)
8010674d:	eb b3                	jmp    80106702 <walkpgdir+0x22>
8010674f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106750:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106753:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106755:	5b                   	pop    %ebx
80106756:	5e                   	pop    %esi
80106757:	5f                   	pop    %edi
80106758:	5d                   	pop    %ebp
80106759:	c3                   	ret    
8010675a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106760 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106760:	55                   	push   %ebp
80106761:	89 e5                	mov    %esp,%ebp
80106763:	57                   	push   %edi
80106764:	56                   	push   %esi
80106765:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106766:	89 d3                	mov    %edx,%ebx
80106768:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010676e:	83 ec 1c             	sub    $0x1c,%esp
80106771:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106774:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106778:	8b 7d 08             	mov    0x8(%ebp),%edi
8010677b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106780:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106783:	8b 45 0c             	mov    0xc(%ebp),%eax
80106786:	29 df                	sub    %ebx,%edi
80106788:	83 c8 01             	or     $0x1,%eax
8010678b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010678e:	eb 15                	jmp    801067a5 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106790:	f6 00 01             	testb  $0x1,(%eax)
80106793:	75 45                	jne    801067da <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106795:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106798:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010679b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010679d:	74 31                	je     801067d0 <mappages+0x70>
      break;
    a += PGSIZE;
8010679f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801067a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801067a8:	b9 01 00 00 00       	mov    $0x1,%ecx
801067ad:	89 da                	mov    %ebx,%edx
801067af:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801067b2:	e8 29 ff ff ff       	call   801066e0 <walkpgdir>
801067b7:	85 c0                	test   %eax,%eax
801067b9:	75 d5                	jne    80106790 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801067bb:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801067be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801067c3:	5b                   	pop    %ebx
801067c4:	5e                   	pop    %esi
801067c5:	5f                   	pop    %edi
801067c6:	5d                   	pop    %ebp
801067c7:	c3                   	ret    
801067c8:	90                   	nop
801067c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801067d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801067d3:	31 c0                	xor    %eax,%eax
}
801067d5:	5b                   	pop    %ebx
801067d6:	5e                   	pop    %esi
801067d7:	5f                   	pop    %edi
801067d8:	5d                   	pop    %ebp
801067d9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801067da:	83 ec 0c             	sub    $0xc,%esp
801067dd:	68 70 79 10 80       	push   $0x80107970
801067e2:	e8 89 9b ff ff       	call   80100370 <panic>
801067e7:	89 f6                	mov    %esi,%esi
801067e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801067f0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067f0:	55                   	push   %ebp
801067f1:	89 e5                	mov    %esp,%ebp
801067f3:	57                   	push   %edi
801067f4:	56                   	push   %esi
801067f5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801067f6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067fc:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801067fe:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106804:	83 ec 1c             	sub    $0x1c,%esp
80106807:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010680a:	39 d3                	cmp    %edx,%ebx
8010680c:	73 66                	jae    80106874 <deallocuvm.part.0+0x84>
8010680e:	89 d6                	mov    %edx,%esi
80106810:	eb 3d                	jmp    8010684f <deallocuvm.part.0+0x5f>
80106812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106818:	8b 10                	mov    (%eax),%edx
8010681a:	f6 c2 01             	test   $0x1,%dl
8010681d:	74 26                	je     80106845 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010681f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106825:	74 58                	je     8010687f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106827:	83 ec 0c             	sub    $0xc,%esp
8010682a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106830:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106833:	52                   	push   %edx
80106834:	e8 97 ba ff ff       	call   801022d0 <kfree>
      *pte = 0;
80106839:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010683c:	83 c4 10             	add    $0x10,%esp
8010683f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106845:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010684b:	39 f3                	cmp    %esi,%ebx
8010684d:	73 25                	jae    80106874 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010684f:	31 c9                	xor    %ecx,%ecx
80106851:	89 da                	mov    %ebx,%edx
80106853:	89 f8                	mov    %edi,%eax
80106855:	e8 86 fe ff ff       	call   801066e0 <walkpgdir>
    if(!pte)
8010685a:	85 c0                	test   %eax,%eax
8010685c:	75 ba                	jne    80106818 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010685e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106864:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010686a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106870:	39 f3                	cmp    %esi,%ebx
80106872:	72 db                	jb     8010684f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106874:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106877:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010687a:	5b                   	pop    %ebx
8010687b:	5e                   	pop    %esi
8010687c:	5f                   	pop    %edi
8010687d:	5d                   	pop    %ebp
8010687e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010687f:	83 ec 0c             	sub    $0xc,%esp
80106882:	68 c6 72 10 80       	push   $0x801072c6
80106887:	e8 e4 9a ff ff       	call   80100370 <panic>
8010688c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106890 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106890:	55                   	push   %ebp
80106891:	89 e5                	mov    %esp,%ebp
80106893:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106896:	e8 e5 ce ff ff       	call   80103780 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010689b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
801068a1:	31 c9                	xor    %ecx,%ecx
801068a3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801068a8:	66 89 90 f8 28 11 80 	mov    %dx,-0x7feed708(%eax)
801068af:	66 89 88 fa 28 11 80 	mov    %cx,-0x7feed706(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068b6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801068bb:	31 c9                	xor    %ecx,%ecx
801068bd:	66 89 90 00 29 11 80 	mov    %dx,-0x7feed700(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801068c4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068c9:	66 89 88 02 29 11 80 	mov    %cx,-0x7feed6fe(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801068d0:	31 c9                	xor    %ecx,%ecx
801068d2:	66 89 90 08 29 11 80 	mov    %dx,-0x7feed6f8(%eax)
801068d9:	66 89 88 0a 29 11 80 	mov    %cx,-0x7feed6f6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801068e0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801068e5:	31 c9                	xor    %ecx,%ecx
801068e7:	66 89 90 10 29 11 80 	mov    %dx,-0x7feed6f0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801068ee:	c6 80 fc 28 11 80 00 	movb   $0x0,-0x7feed704(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801068f5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801068fa:	c6 80 fd 28 11 80 9a 	movb   $0x9a,-0x7feed703(%eax)
80106901:	c6 80 fe 28 11 80 cf 	movb   $0xcf,-0x7feed702(%eax)
80106908:	c6 80 ff 28 11 80 00 	movb   $0x0,-0x7feed701(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010690f:	c6 80 04 29 11 80 00 	movb   $0x0,-0x7feed6fc(%eax)
80106916:	c6 80 05 29 11 80 92 	movb   $0x92,-0x7feed6fb(%eax)
8010691d:	c6 80 06 29 11 80 cf 	movb   $0xcf,-0x7feed6fa(%eax)
80106924:	c6 80 07 29 11 80 00 	movb   $0x0,-0x7feed6f9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010692b:	c6 80 0c 29 11 80 00 	movb   $0x0,-0x7feed6f4(%eax)
80106932:	c6 80 0d 29 11 80 fa 	movb   $0xfa,-0x7feed6f3(%eax)
80106939:	c6 80 0e 29 11 80 cf 	movb   $0xcf,-0x7feed6f2(%eax)
80106940:	c6 80 0f 29 11 80 00 	movb   $0x0,-0x7feed6f1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106947:	66 89 88 12 29 11 80 	mov    %cx,-0x7feed6ee(%eax)
8010694e:	c6 80 14 29 11 80 00 	movb   $0x0,-0x7feed6ec(%eax)
80106955:	c6 80 15 29 11 80 f2 	movb   $0xf2,-0x7feed6eb(%eax)
8010695c:	c6 80 16 29 11 80 cf 	movb   $0xcf,-0x7feed6ea(%eax)
80106963:	c6 80 17 29 11 80 00 	movb   $0x0,-0x7feed6e9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010696a:	05 f0 28 11 80       	add    $0x801128f0,%eax
8010696f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106973:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106977:	c1 e8 10             	shr    $0x10,%eax
8010697a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
8010697e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106981:	0f 01 10             	lgdtl  (%eax)
}
80106984:	c9                   	leave  
80106985:	c3                   	ret    
80106986:	8d 76 00             	lea    0x0(%esi),%esi
80106989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106990 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106990:	a1 a4 57 11 80       	mov    0x801157a4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106995:	55                   	push   %ebp
80106996:	89 e5                	mov    %esp,%ebp
80106998:	05 00 00 00 80       	add    $0x80000000,%eax
8010699d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
801069a0:	5d                   	pop    %ebp
801069a1:	c3                   	ret    
801069a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069b0 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
801069b0:	55                   	push   %ebp
801069b1:	89 e5                	mov    %esp,%ebp
801069b3:	57                   	push   %edi
801069b4:	56                   	push   %esi
801069b5:	53                   	push   %ebx
801069b6:	83 ec 1c             	sub    $0x1c,%esp
801069b9:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
801069bc:	85 f6                	test   %esi,%esi
801069be:	0f 84 cd 00 00 00    	je     80106a91 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
801069c4:	8b 46 08             	mov    0x8(%esi),%eax
801069c7:	85 c0                	test   %eax,%eax
801069c9:	0f 84 dc 00 00 00    	je     80106aab <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
801069cf:	8b 7e 04             	mov    0x4(%esi),%edi
801069d2:	85 ff                	test   %edi,%edi
801069d4:	0f 84 c4 00 00 00    	je     80106a9e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
801069da:	e8 91 d8 ff ff       	call   80104270 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
801069df:	e8 1c cd ff ff       	call   80103700 <mycpu>
801069e4:	89 c3                	mov    %eax,%ebx
801069e6:	e8 15 cd ff ff       	call   80103700 <mycpu>
801069eb:	89 c7                	mov    %eax,%edi
801069ed:	e8 0e cd ff ff       	call   80103700 <mycpu>
801069f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801069f5:	83 c7 08             	add    $0x8,%edi
801069f8:	e8 03 cd ff ff       	call   80103700 <mycpu>
801069fd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106a00:	83 c0 08             	add    $0x8,%eax
80106a03:	ba 67 00 00 00       	mov    $0x67,%edx
80106a08:	c1 e8 18             	shr    $0x18,%eax
80106a0b:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106a12:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106a19:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106a20:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106a27:	83 c1 08             	add    $0x8,%ecx
80106a2a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106a30:	c1 e9 10             	shr    $0x10,%ecx
80106a33:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106a39:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
80106a3e:	e8 bd cc ff ff       	call   80103700 <mycpu>
80106a43:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106a4a:	e8 b1 cc ff ff       	call   80103700 <mycpu>
80106a4f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106a54:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106a58:	e8 a3 cc ff ff       	call   80103700 <mycpu>
80106a5d:	8b 56 08             	mov    0x8(%esi),%edx
80106a60:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106a66:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106a69:	e8 92 cc ff ff       	call   80103700 <mycpu>
80106a6e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106a72:	b8 28 00 00 00       	mov    $0x28,%eax
80106a77:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106a7a:	8b 46 04             	mov    0x4(%esi),%eax
80106a7d:	05 00 00 00 80       	add    $0x80000000,%eax
80106a82:	0f 22 d8             	mov    %eax,%cr3
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106a85:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a88:	5b                   	pop    %ebx
80106a89:	5e                   	pop    %esi
80106a8a:	5f                   	pop    %edi
80106a8b:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106a8c:	e9 1f d8 ff ff       	jmp    801042b0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106a91:	83 ec 0c             	sub    $0xc,%esp
80106a94:	68 76 79 10 80       	push   $0x80107976
80106a99:	e8 d2 98 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106a9e:	83 ec 0c             	sub    $0xc,%esp
80106aa1:	68 a1 79 10 80       	push   $0x801079a1
80106aa6:	e8 c5 98 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106aab:	83 ec 0c             	sub    $0xc,%esp
80106aae:	68 8c 79 10 80       	push   $0x8010798c
80106ab3:	e8 b8 98 ff ff       	call   80100370 <panic>
80106ab8:	90                   	nop
80106ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106ac0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106ac0:	55                   	push   %ebp
80106ac1:	89 e5                	mov    %esp,%ebp
80106ac3:	57                   	push   %edi
80106ac4:	56                   	push   %esi
80106ac5:	53                   	push   %ebx
80106ac6:	83 ec 1c             	sub    $0x1c,%esp
80106ac9:	8b 75 10             	mov    0x10(%ebp),%esi
80106acc:	8b 45 08             	mov    0x8(%ebp),%eax
80106acf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106ad2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106ad8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106adb:	77 49                	ja     80106b26 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106add:	e8 9e b9 ff ff       	call   80102480 <kalloc>
  memset(mem, 0, PGSIZE);
80106ae2:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106ae5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106ae7:	68 00 10 00 00       	push   $0x1000
80106aec:	6a 00                	push   $0x0
80106aee:	50                   	push   %eax
80106aef:	e8 5c d9 ff ff       	call   80104450 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106af4:	58                   	pop    %eax
80106af5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106afb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b00:	5a                   	pop    %edx
80106b01:	6a 06                	push   $0x6
80106b03:	50                   	push   %eax
80106b04:	31 d2                	xor    %edx,%edx
80106b06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b09:	e8 52 fc ff ff       	call   80106760 <mappages>
  memmove(mem, init, sz);
80106b0e:	89 75 10             	mov    %esi,0x10(%ebp)
80106b11:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106b14:	83 c4 10             	add    $0x10,%esp
80106b17:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106b1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b1d:	5b                   	pop    %ebx
80106b1e:	5e                   	pop    %esi
80106b1f:	5f                   	pop    %edi
80106b20:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106b21:	e9 da d9 ff ff       	jmp    80104500 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106b26:	83 ec 0c             	sub    $0xc,%esp
80106b29:	68 b5 79 10 80       	push   $0x801079b5
80106b2e:	e8 3d 98 ff ff       	call   80100370 <panic>
80106b33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b40 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106b40:	55                   	push   %ebp
80106b41:	89 e5                	mov    %esp,%ebp
80106b43:	57                   	push   %edi
80106b44:	56                   	push   %esi
80106b45:	53                   	push   %ebx
80106b46:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106b49:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106b50:	0f 85 91 00 00 00    	jne    80106be7 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106b56:	8b 75 18             	mov    0x18(%ebp),%esi
80106b59:	31 db                	xor    %ebx,%ebx
80106b5b:	85 f6                	test   %esi,%esi
80106b5d:	75 1a                	jne    80106b79 <loaduvm+0x39>
80106b5f:	eb 6f                	jmp    80106bd0 <loaduvm+0x90>
80106b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b68:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b6e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b74:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b77:	76 57                	jbe    80106bd0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106b79:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b7c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b7f:	31 c9                	xor    %ecx,%ecx
80106b81:	01 da                	add    %ebx,%edx
80106b83:	e8 58 fb ff ff       	call   801066e0 <walkpgdir>
80106b88:	85 c0                	test   %eax,%eax
80106b8a:	74 4e                	je     80106bda <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106b8c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b8e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106b91:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106b96:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106b9b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ba1:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106ba4:	01 d9                	add    %ebx,%ecx
80106ba6:	05 00 00 00 80       	add    $0x80000000,%eax
80106bab:	57                   	push   %edi
80106bac:	51                   	push   %ecx
80106bad:	50                   	push   %eax
80106bae:	ff 75 10             	pushl  0x10(%ebp)
80106bb1:	e8 8a ad ff ff       	call   80101940 <readi>
80106bb6:	83 c4 10             	add    $0x10,%esp
80106bb9:	39 c7                	cmp    %eax,%edi
80106bbb:	74 ab                	je     80106b68 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106bbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106bc5:	5b                   	pop    %ebx
80106bc6:	5e                   	pop    %esi
80106bc7:	5f                   	pop    %edi
80106bc8:	5d                   	pop    %ebp
80106bc9:	c3                   	ret    
80106bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bd0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106bd3:	31 c0                	xor    %eax,%eax
}
80106bd5:	5b                   	pop    %ebx
80106bd6:	5e                   	pop    %esi
80106bd7:	5f                   	pop    %edi
80106bd8:	5d                   	pop    %ebp
80106bd9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106bda:	83 ec 0c             	sub    $0xc,%esp
80106bdd:	68 cf 79 10 80       	push   $0x801079cf
80106be2:	e8 89 97 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106be7:	83 ec 0c             	sub    $0xc,%esp
80106bea:	68 70 7a 10 80       	push   $0x80107a70
80106bef:	e8 7c 97 ff ff       	call   80100370 <panic>
80106bf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c00 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106c00:	55                   	push   %ebp
80106c01:	89 e5                	mov    %esp,%ebp
80106c03:	57                   	push   %edi
80106c04:	56                   	push   %esi
80106c05:	53                   	push   %ebx
80106c06:	83 ec 0c             	sub    $0xc,%esp
80106c09:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106c0c:	85 ff                	test   %edi,%edi
80106c0e:	0f 88 ca 00 00 00    	js     80106cde <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106c14:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106c17:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106c1a:	0f 82 82 00 00 00    	jb     80106ca2 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106c20:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106c26:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106c2c:	39 df                	cmp    %ebx,%edi
80106c2e:	77 43                	ja     80106c73 <allocuvm+0x73>
80106c30:	e9 bb 00 00 00       	jmp    80106cf0 <allocuvm+0xf0>
80106c35:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106c38:	83 ec 04             	sub    $0x4,%esp
80106c3b:	68 00 10 00 00       	push   $0x1000
80106c40:	6a 00                	push   $0x0
80106c42:	50                   	push   %eax
80106c43:	e8 08 d8 ff ff       	call   80104450 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106c48:	58                   	pop    %eax
80106c49:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106c4f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c54:	5a                   	pop    %edx
80106c55:	6a 06                	push   $0x6
80106c57:	50                   	push   %eax
80106c58:	89 da                	mov    %ebx,%edx
80106c5a:	8b 45 08             	mov    0x8(%ebp),%eax
80106c5d:	e8 fe fa ff ff       	call   80106760 <mappages>
80106c62:	83 c4 10             	add    $0x10,%esp
80106c65:	85 c0                	test   %eax,%eax
80106c67:	78 47                	js     80106cb0 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106c69:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c6f:	39 df                	cmp    %ebx,%edi
80106c71:	76 7d                	jbe    80106cf0 <allocuvm+0xf0>
    mem = kalloc();
80106c73:	e8 08 b8 ff ff       	call   80102480 <kalloc>
    if(mem == 0){
80106c78:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106c7a:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106c7c:	75 ba                	jne    80106c38 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106c7e:	83 ec 0c             	sub    $0xc,%esp
80106c81:	68 ed 79 10 80       	push   $0x801079ed
80106c86:	e8 d5 99 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106c8b:	83 c4 10             	add    $0x10,%esp
80106c8e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c91:	76 4b                	jbe    80106cde <allocuvm+0xde>
80106c93:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c96:	8b 45 08             	mov    0x8(%ebp),%eax
80106c99:	89 fa                	mov    %edi,%edx
80106c9b:	e8 50 fb ff ff       	call   801067f0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106ca0:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106ca2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ca5:	5b                   	pop    %ebx
80106ca6:	5e                   	pop    %esi
80106ca7:	5f                   	pop    %edi
80106ca8:	5d                   	pop    %ebp
80106ca9:	c3                   	ret    
80106caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106cb0:	83 ec 0c             	sub    $0xc,%esp
80106cb3:	68 05 7a 10 80       	push   $0x80107a05
80106cb8:	e8 a3 99 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106cbd:	83 c4 10             	add    $0x10,%esp
80106cc0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106cc3:	76 0d                	jbe    80106cd2 <allocuvm+0xd2>
80106cc5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106cc8:	8b 45 08             	mov    0x8(%ebp),%eax
80106ccb:	89 fa                	mov    %edi,%edx
80106ccd:	e8 1e fb ff ff       	call   801067f0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106cd2:	83 ec 0c             	sub    $0xc,%esp
80106cd5:	56                   	push   %esi
80106cd6:	e8 f5 b5 ff ff       	call   801022d0 <kfree>
      return 0;
80106cdb:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106cde:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106ce1:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106ce3:	5b                   	pop    %ebx
80106ce4:	5e                   	pop    %esi
80106ce5:	5f                   	pop    %edi
80106ce6:	5d                   	pop    %ebp
80106ce7:	c3                   	ret    
80106ce8:	90                   	nop
80106ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106cf3:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106cf5:	5b                   	pop    %ebx
80106cf6:	5e                   	pop    %esi
80106cf7:	5f                   	pop    %edi
80106cf8:	5d                   	pop    %ebp
80106cf9:	c3                   	ret    
80106cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d00 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106d00:	55                   	push   %ebp
80106d01:	89 e5                	mov    %esp,%ebp
80106d03:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d06:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106d09:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106d0c:	39 d1                	cmp    %edx,%ecx
80106d0e:	73 10                	jae    80106d20 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106d10:	5d                   	pop    %ebp
80106d11:	e9 da fa ff ff       	jmp    801067f0 <deallocuvm.part.0>
80106d16:	8d 76 00             	lea    0x0(%esi),%esi
80106d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106d20:	89 d0                	mov    %edx,%eax
80106d22:	5d                   	pop    %ebp
80106d23:	c3                   	ret    
80106d24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d30 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106d30:	55                   	push   %ebp
80106d31:	89 e5                	mov    %esp,%ebp
80106d33:	57                   	push   %edi
80106d34:	56                   	push   %esi
80106d35:	53                   	push   %ebx
80106d36:	83 ec 0c             	sub    $0xc,%esp
80106d39:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106d3c:	85 f6                	test   %esi,%esi
80106d3e:	74 59                	je     80106d99 <freevm+0x69>
80106d40:	31 c9                	xor    %ecx,%ecx
80106d42:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106d47:	89 f0                	mov    %esi,%eax
80106d49:	e8 a2 fa ff ff       	call   801067f0 <deallocuvm.part.0>
80106d4e:	89 f3                	mov    %esi,%ebx
80106d50:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106d56:	eb 0f                	jmp    80106d67 <freevm+0x37>
80106d58:	90                   	nop
80106d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d60:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d63:	39 fb                	cmp    %edi,%ebx
80106d65:	74 23                	je     80106d8a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106d67:	8b 03                	mov    (%ebx),%eax
80106d69:	a8 01                	test   $0x1,%al
80106d6b:	74 f3                	je     80106d60 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106d6d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d72:	83 ec 0c             	sub    $0xc,%esp
80106d75:	83 c3 04             	add    $0x4,%ebx
80106d78:	05 00 00 00 80       	add    $0x80000000,%eax
80106d7d:	50                   	push   %eax
80106d7e:	e8 4d b5 ff ff       	call   801022d0 <kfree>
80106d83:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d86:	39 fb                	cmp    %edi,%ebx
80106d88:	75 dd                	jne    80106d67 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106d8a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106d8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d90:	5b                   	pop    %ebx
80106d91:	5e                   	pop    %esi
80106d92:	5f                   	pop    %edi
80106d93:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106d94:	e9 37 b5 ff ff       	jmp    801022d0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106d99:	83 ec 0c             	sub    $0xc,%esp
80106d9c:	68 21 7a 10 80       	push   $0x80107a21
80106da1:	e8 ca 95 ff ff       	call   80100370 <panic>
80106da6:	8d 76 00             	lea    0x0(%esi),%esi
80106da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106db0 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106db0:	55                   	push   %ebp
80106db1:	89 e5                	mov    %esp,%ebp
80106db3:	56                   	push   %esi
80106db4:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106db5:	e8 c6 b6 ff ff       	call   80102480 <kalloc>
80106dba:	85 c0                	test   %eax,%eax
80106dbc:	74 6a                	je     80106e28 <setupkvm+0x78>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106dbe:	83 ec 04             	sub    $0x4,%esp
80106dc1:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106dc3:	bb 20 a5 10 80       	mov    $0x8010a520,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106dc8:	68 00 10 00 00       	push   $0x1000
80106dcd:	6a 00                	push   $0x0
80106dcf:	50                   	push   %eax
80106dd0:	e8 7b d6 ff ff       	call   80104450 <memset>
80106dd5:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106dd8:	8b 43 04             	mov    0x4(%ebx),%eax
80106ddb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106dde:	83 ec 08             	sub    $0x8,%esp
80106de1:	8b 13                	mov    (%ebx),%edx
80106de3:	ff 73 0c             	pushl  0xc(%ebx)
80106de6:	50                   	push   %eax
80106de7:	29 c1                	sub    %eax,%ecx
80106de9:	89 f0                	mov    %esi,%eax
80106deb:	e8 70 f9 ff ff       	call   80106760 <mappages>
80106df0:	83 c4 10             	add    $0x10,%esp
80106df3:	85 c0                	test   %eax,%eax
80106df5:	78 19                	js     80106e10 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106df7:	83 c3 10             	add    $0x10,%ebx
80106dfa:	81 fb 60 a5 10 80    	cmp    $0x8010a560,%ebx
80106e00:	75 d6                	jne    80106dd8 <setupkvm+0x28>
80106e02:	89 f0                	mov    %esi,%eax
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106e04:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106e07:	5b                   	pop    %ebx
80106e08:	5e                   	pop    %esi
80106e09:	5d                   	pop    %ebp
80106e0a:	c3                   	ret    
80106e0b:	90                   	nop
80106e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106e10:	83 ec 0c             	sub    $0xc,%esp
80106e13:	56                   	push   %esi
80106e14:	e8 17 ff ff ff       	call   80106d30 <freevm>
      return 0;
80106e19:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
80106e1c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
80106e1f:	31 c0                	xor    %eax,%eax
    }
  return pgdir;
}
80106e21:	5b                   	pop    %ebx
80106e22:	5e                   	pop    %esi
80106e23:	5d                   	pop    %ebp
80106e24:	c3                   	ret    
80106e25:	8d 76 00             	lea    0x0(%esi),%esi
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106e28:	31 c0                	xor    %eax,%eax
80106e2a:	eb d8                	jmp    80106e04 <setupkvm+0x54>
80106e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e30 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106e30:	55                   	push   %ebp
80106e31:	89 e5                	mov    %esp,%ebp
80106e33:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106e36:	e8 75 ff ff ff       	call   80106db0 <setupkvm>
80106e3b:	a3 a4 57 11 80       	mov    %eax,0x801157a4
80106e40:	05 00 00 00 80       	add    $0x80000000,%eax
80106e45:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106e48:	c9                   	leave  
80106e49:	c3                   	ret    
80106e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106e50 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106e50:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e51:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106e53:	89 e5                	mov    %esp,%ebp
80106e55:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e58:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e5b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e5e:	e8 7d f8 ff ff       	call   801066e0 <walkpgdir>
  if(pte == 0)
80106e63:	85 c0                	test   %eax,%eax
80106e65:	74 05                	je     80106e6c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106e67:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106e6a:	c9                   	leave  
80106e6b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106e6c:	83 ec 0c             	sub    $0xc,%esp
80106e6f:	68 32 7a 10 80       	push   $0x80107a32
80106e74:	e8 f7 94 ff ff       	call   80100370 <panic>
80106e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e80 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106e80:	55                   	push   %ebp
80106e81:	89 e5                	mov    %esp,%ebp
80106e83:	57                   	push   %edi
80106e84:	56                   	push   %esi
80106e85:	53                   	push   %ebx
80106e86:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106e89:	e8 22 ff ff ff       	call   80106db0 <setupkvm>
80106e8e:	85 c0                	test   %eax,%eax
80106e90:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106e93:	0f 84 c5 00 00 00    	je     80106f5e <copyuvm+0xde>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106e99:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106e9c:	85 c9                	test   %ecx,%ecx
80106e9e:	0f 84 9c 00 00 00    	je     80106f40 <copyuvm+0xc0>
80106ea4:	31 ff                	xor    %edi,%edi
80106ea6:	eb 4a                	jmp    80106ef2 <copyuvm+0x72>
80106ea8:	90                   	nop
80106ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106eb0:	83 ec 04             	sub    $0x4,%esp
80106eb3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106eb9:	68 00 10 00 00       	push   $0x1000
80106ebe:	53                   	push   %ebx
80106ebf:	50                   	push   %eax
80106ec0:	e8 3b d6 ff ff       	call   80104500 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106ec5:	58                   	pop    %eax
80106ec6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106ecc:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ed1:	5a                   	pop    %edx
80106ed2:	ff 75 e4             	pushl  -0x1c(%ebp)
80106ed5:	50                   	push   %eax
80106ed6:	89 fa                	mov    %edi,%edx
80106ed8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106edb:	e8 80 f8 ff ff       	call   80106760 <mappages>
80106ee0:	83 c4 10             	add    $0x10,%esp
80106ee3:	85 c0                	test   %eax,%eax
80106ee5:	78 69                	js     80106f50 <copyuvm+0xd0>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106ee7:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106eed:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106ef0:	76 4e                	jbe    80106f40 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106ef2:	8b 45 08             	mov    0x8(%ebp),%eax
80106ef5:	31 c9                	xor    %ecx,%ecx
80106ef7:	89 fa                	mov    %edi,%edx
80106ef9:	e8 e2 f7 ff ff       	call   801066e0 <walkpgdir>
80106efe:	85 c0                	test   %eax,%eax
80106f00:	74 6d                	je     80106f6f <copyuvm+0xef>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106f02:	8b 00                	mov    (%eax),%eax
80106f04:	a8 01                	test   $0x1,%al
80106f06:	74 5a                	je     80106f62 <copyuvm+0xe2>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106f08:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
80106f0a:	25 ff 0f 00 00       	and    $0xfff,%eax
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106f0f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80106f15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80106f18:	e8 63 b5 ff ff       	call   80102480 <kalloc>
80106f1d:	85 c0                	test   %eax,%eax
80106f1f:	89 c6                	mov    %eax,%esi
80106f21:	75 8d                	jne    80106eb0 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80106f23:	83 ec 0c             	sub    $0xc,%esp
80106f26:	ff 75 e0             	pushl  -0x20(%ebp)
80106f29:	e8 02 fe ff ff       	call   80106d30 <freevm>
  return 0;
80106f2e:	83 c4 10             	add    $0x10,%esp
80106f31:	31 c0                	xor    %eax,%eax
}
80106f33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f36:	5b                   	pop    %ebx
80106f37:	5e                   	pop    %esi
80106f38:	5f                   	pop    %edi
80106f39:	5d                   	pop    %ebp
80106f3a:	c3                   	ret    
80106f3b:	90                   	nop
80106f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f40:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106f43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f46:	5b                   	pop    %ebx
80106f47:	5e                   	pop    %esi
80106f48:	5f                   	pop    %edi
80106f49:	5d                   	pop    %ebp
80106f4a:	c3                   	ret    
80106f4b:	90                   	nop
80106f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
      kfree(mem);
80106f50:	83 ec 0c             	sub    $0xc,%esp
80106f53:	56                   	push   %esi
80106f54:	e8 77 b3 ff ff       	call   801022d0 <kfree>
      goto bad;
80106f59:	83 c4 10             	add    $0x10,%esp
80106f5c:	eb c5                	jmp    80106f23 <copyuvm+0xa3>
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106f5e:	31 c0                	xor    %eax,%eax
80106f60:	eb d1                	jmp    80106f33 <copyuvm+0xb3>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106f62:	83 ec 0c             	sub    $0xc,%esp
80106f65:	68 56 7a 10 80       	push   $0x80107a56
80106f6a:	e8 01 94 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106f6f:	83 ec 0c             	sub    $0xc,%esp
80106f72:	68 3c 7a 10 80       	push   $0x80107a3c
80106f77:	e8 f4 93 ff ff       	call   80100370 <panic>
80106f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106f80 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106f80:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f81:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106f83:	89 e5                	mov    %esp,%ebp
80106f85:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f88:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f8b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f8e:	e8 4d f7 ff ff       	call   801066e0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106f93:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80106f95:	89 c2                	mov    %eax,%edx
80106f97:	83 e2 05             	and    $0x5,%edx
80106f9a:	83 fa 05             	cmp    $0x5,%edx
80106f9d:	75 11                	jne    80106fb0 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106f9f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80106fa4:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106fa5:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106faa:	c3                   	ret    
80106fab:	90                   	nop
80106fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80106fb0:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80106fb2:	c9                   	leave  
80106fb3:	c3                   	ret    
80106fb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106fba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106fc0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106fc0:	55                   	push   %ebp
80106fc1:	89 e5                	mov    %esp,%ebp
80106fc3:	57                   	push   %edi
80106fc4:	56                   	push   %esi
80106fc5:	53                   	push   %ebx
80106fc6:	83 ec 1c             	sub    $0x1c,%esp
80106fc9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106fcc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106fcf:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106fd2:	85 db                	test   %ebx,%ebx
80106fd4:	75 40                	jne    80107016 <copyout+0x56>
80106fd6:	eb 70                	jmp    80107048 <copyout+0x88>
80106fd8:	90                   	nop
80106fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106fe0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106fe3:	89 f1                	mov    %esi,%ecx
80106fe5:	29 d1                	sub    %edx,%ecx
80106fe7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106fed:	39 d9                	cmp    %ebx,%ecx
80106fef:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106ff2:	29 f2                	sub    %esi,%edx
80106ff4:	83 ec 04             	sub    $0x4,%esp
80106ff7:	01 d0                	add    %edx,%eax
80106ff9:	51                   	push   %ecx
80106ffa:	57                   	push   %edi
80106ffb:	50                   	push   %eax
80106ffc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106fff:	e8 fc d4 ff ff       	call   80104500 <memmove>
    len -= n;
    buf += n;
80107004:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107007:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
8010700a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80107010:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107012:	29 cb                	sub    %ecx,%ebx
80107014:	74 32                	je     80107048 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107016:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107018:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
8010701b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010701e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107024:	56                   	push   %esi
80107025:	ff 75 08             	pushl  0x8(%ebp)
80107028:	e8 53 ff ff ff       	call   80106f80 <uva2ka>
    if(pa0 == 0)
8010702d:	83 c4 10             	add    $0x10,%esp
80107030:	85 c0                	test   %eax,%eax
80107032:	75 ac                	jne    80106fe0 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80107034:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80107037:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
8010703c:	5b                   	pop    %ebx
8010703d:	5e                   	pop    %esi
8010703e:	5f                   	pop    %edi
8010703f:	5d                   	pop    %ebp
80107040:	c3                   	ret    
80107041:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107048:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010704b:	31 c0                	xor    %eax,%eax
}
8010704d:	5b                   	pop    %ebx
8010704e:	5e                   	pop    %esi
8010704f:	5f                   	pop    %edi
80107050:	5d                   	pop    %ebp
80107051:	c3                   	ret    
