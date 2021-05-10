
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
80100015:	b8 00 c0 10 00       	mov    $0x10c000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc 60 4e 15 80       	mov    $0x80154e60,%esp
8010002d:	b8 60 3b 10 80       	mov    $0x80103b60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <block_until_arp_reply.isra.0>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	56                   	push   %esi
80100044:	53                   	push   %ebx
80100045:	8d 9d 10 fc ff ff    	lea    -0x3f0(%ebp),%ebx
8010004b:	be 0a 00 00 00       	mov    $0xa,%esi
80100050:	81 ec f0 03 00 00    	sub    $0x3f0,%esp
80100056:	8d 76 00             	lea    0x0(%esi),%esi
80100059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100060:	83 ec 08             	sub    $0x8,%esp
80100063:	68 e8 03 00 00       	push   $0x3e8
80100068:	53                   	push   %ebx
80100069:	e8 02 18 00 00       	call   80101870 <e1000_receive>
8010006e:	83 c4 10             	add    $0x10,%esp
80100071:	85 c0                	test   %eax,%eax
80100073:	78 eb                	js     80100060 <block_until_arp_reply.isra.0+0x20>
80100075:	83 ec 0c             	sub    $0xc,%esp
80100078:	68 40 8f 10 80       	push   $0x80108f40
8010007d:	e8 be 0b 00 00       	call   80100c40 <cprintf>
80100082:	c7 04 24 4c 8f 10 80 	movl   $0x80108f4c,(%esp)
80100089:	e8 b2 0b 00 00       	call   80100c40 <cprintf>
8010008e:	83 c4 10             	add    $0x10,%esp
80100091:	83 ee 01             	sub    $0x1,%esi
80100094:	75 ca                	jne    80100060 <block_until_arp_reply.isra.0+0x20>
80100096:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100099:	31 c0                	xor    %eax,%eax
8010009b:	5b                   	pop    %ebx
8010009c:	5e                   	pop    %esi
8010009d:	5d                   	pop    %ebp
8010009e:	c3                   	ret    
8010009f:	90                   	nop

801000a0 <send_arpRequest>:
801000a0:	55                   	push   %ebp
801000a1:	89 e5                	mov    %esp,%ebp
801000a3:	57                   	push   %edi
801000a4:	56                   	push   %esi
801000a5:	53                   	push   %ebx
801000a6:	8d 5d 90             	lea    -0x70(%ebp),%ebx
801000a9:	83 ec 70             	sub    $0x70,%esp
801000ac:	8b 75 0c             	mov    0xc(%ebp),%esi
801000af:	ff 75 08             	pushl  0x8(%ebp)
801000b2:	8b 7d 10             	mov    0x10(%ebp),%edi
801000b5:	56                   	push   %esi
801000b6:	68 5c 8f 10 80       	push   $0x80108f5c
801000bb:	e8 80 0b 00 00       	call   80100c40 <cprintf>
801000c0:	83 c4 0c             	add    $0xc,%esp
801000c3:	53                   	push   %ebx
801000c4:	56                   	push   %esi
801000c5:	68 4c 98 15 80       	push   $0x8015984c
801000ca:	e8 41 02 00 00       	call   80100310 <create_eth_arp_frame>
801000cf:	58                   	pop    %eax
801000d0:	5a                   	pop    %edx
801000d1:	6a 2a                	push   $0x2a
801000d3:	53                   	push   %ebx
801000d4:	e8 27 14 00 00       	call   80101500 <e1000_transmit>
801000d9:	e8 62 ff ff ff       	call   80100040 <block_until_arp_reply.isra.0>
801000de:	83 c4 10             	add    $0x10,%esp
801000e1:	85 c0                	test   %eax,%eax
801000e3:	78 23                	js     80100108 <send_arpRequest+0x68>
801000e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
801000e8:	83 ec 08             	sub    $0x8,%esp
801000eb:	57                   	push   %edi
801000ec:	50                   	push   %eax
801000ed:	e8 fe 02 00 00       	call   801003f0 <unpack_mac>
801000f2:	c6 47 11 00          	movb   $0x0,0x11(%edi)
801000f6:	83 c4 10             	add    $0x10,%esp
801000f9:	31 c0                	xor    %eax,%eax
801000fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801000fe:	5b                   	pop    %ebx
801000ff:	5e                   	pop    %esi
80100100:	5f                   	pop    %edi
80100101:	5d                   	pop    %ebp
80100102:	c3                   	ret    
80100103:	90                   	nop
80100104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100108:	83 ec 0c             	sub    $0xc,%esp
8010010b:	68 8c 8f 10 80       	push   $0x80108f8c
80100110:	e8 2b 0b 00 00       	call   80100c40 <cprintf>
80100115:	83 c4 10             	add    $0x10,%esp
80100118:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
8010011d:	eb dc                	jmp    801000fb <send_arpRequest+0x5b>
8010011f:	90                   	nop

80100120 <hex_to_int>:
80100120:	55                   	push   %ebp
80100121:	89 e5                	mov    %esp,%ebp
80100123:	8b 45 08             	mov    0x8(%ebp),%eax
80100126:	8d 50 d0             	lea    -0x30(%eax),%edx
80100129:	80 fa 09             	cmp    $0x9,%dl
8010012c:	76 32                	jbe    80100160 <hex_to_int+0x40>
8010012e:	8d 50 bf             	lea    -0x41(%eax),%edx
80100131:	80 fa 05             	cmp    $0x5,%dl
80100134:	76 1a                	jbe    80100150 <hex_to_int+0x30>
80100136:	8d 50 9f             	lea    -0x61(%eax),%edx
80100139:	0f be c0             	movsbl %al,%eax
8010013c:	83 e8 57             	sub    $0x57,%eax
8010013f:	80 fa 06             	cmp    $0x6,%dl
80100142:	ba 00 00 00 00       	mov    $0x0,%edx
80100147:	0f 43 c2             	cmovae %edx,%eax
8010014a:	5d                   	pop    %ebp
8010014b:	c3                   	ret    
8010014c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100150:	0f be c0             	movsbl %al,%eax
80100153:	83 e8 37             	sub    $0x37,%eax
80100156:	5d                   	pop    %ebp
80100157:	c3                   	ret    
80100158:	90                   	nop
80100159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100160:	0f be c0             	movsbl %al,%eax
80100163:	83 e8 30             	sub    $0x30,%eax
80100166:	5d                   	pop    %ebp
80100167:	c3                   	ret    
80100168:	90                   	nop
80100169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100170 <pack_mac>:
80100170:	55                   	push   %ebp
80100171:	89 e5                	mov    %esp,%ebp
80100173:	57                   	push   %edi
80100174:	56                   	push   %esi
80100175:	53                   	push   %ebx
80100176:	83 ec 08             	sub    $0x8,%esp
80100179:	8b 55 0c             	mov    0xc(%ebp),%edx
8010017c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010017f:	8d 42 12             	lea    0x12(%edx),%eax
80100182:	89 5d f0             	mov    %ebx,-0x10(%ebp)
80100185:	89 45 ec             	mov    %eax,-0x14(%ebp)
80100188:	eb 1f                	jmp    801001a9 <pack_mac+0x39>
8010018a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100190:	8d 44 30 d0          	lea    -0x30(%eax,%esi,1),%eax
80100194:	8b 7d f0             	mov    -0x10(%ebp),%edi
80100197:	83 c2 03             	add    $0x3,%edx
8010019a:	88 07                	mov    %al,(%edi)
8010019c:	89 f8                	mov    %edi,%eax
8010019e:	83 c0 01             	add    $0x1,%eax
801001a1:	39 55 ec             	cmp    %edx,-0x14(%ebp)
801001a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
801001a7:	74 7f                	je     80100228 <pack_mac+0xb8>
801001a9:	0f be 02             	movsbl (%edx),%eax
801001ac:	8d 70 d0             	lea    -0x30(%eax),%esi
801001af:	89 c1                	mov    %eax,%ecx
801001b1:	89 f3                	mov    %esi,%ebx
801001b3:	80 fb 09             	cmp    $0x9,%bl
801001b6:	76 0d                	jbe    801001c5 <pack_mac+0x55>
801001b8:	8d 70 bf             	lea    -0x41(%eax),%esi
801001bb:	89 f3                	mov    %esi,%ebx
801001bd:	80 fb 05             	cmp    $0x5,%bl
801001c0:	77 2e                	ja     801001f0 <pack_mac+0x80>
801001c2:	83 e8 37             	sub    $0x37,%eax
801001c5:	c1 e0 04             	shl    $0x4,%eax
801001c8:	0f be 72 01          	movsbl 0x1(%edx),%esi
801001cc:	8d 7e d0             	lea    -0x30(%esi),%edi
801001cf:	89 f1                	mov    %esi,%ecx
801001d1:	89 fb                	mov    %edi,%ebx
801001d3:	80 fb 09             	cmp    $0x9,%bl
801001d6:	76 b8                	jbe    80100190 <pack_mac+0x20>
801001d8:	8d 7e bf             	lea    -0x41(%esi),%edi
801001db:	89 fb                	mov    %edi,%ebx
801001dd:	80 fb 05             	cmp    $0x5,%bl
801001e0:	77 2e                	ja     80100210 <pack_mac+0xa0>
801001e2:	8d 44 30 c9          	lea    -0x37(%eax,%esi,1),%eax
801001e6:	eb ac                	jmp    80100194 <pack_mac+0x24>
801001e8:	90                   	nop
801001e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801001f0:	83 e8 57             	sub    $0x57,%eax
801001f3:	83 e9 61             	sub    $0x61,%ecx
801001f6:	bb 00 00 00 00       	mov    $0x0,%ebx
801001fb:	c1 e0 04             	shl    $0x4,%eax
801001fe:	80 f9 06             	cmp    $0x6,%cl
80100201:	0f 43 c3             	cmovae %ebx,%eax
80100204:	eb c2                	jmp    801001c8 <pack_mac+0x58>
80100206:	8d 76 00             	lea    0x0(%esi),%esi
80100209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100210:	83 e9 61             	sub    $0x61,%ecx
80100213:	8d 74 30 a9          	lea    -0x57(%eax,%esi,1),%esi
80100217:	80 f9 06             	cmp    $0x6,%cl
8010021a:	0f 42 c6             	cmovb  %esi,%eax
8010021d:	e9 72 ff ff ff       	jmp    80100194 <pack_mac+0x24>
80100222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100228:	83 c4 08             	add    $0x8,%esp
8010022b:	5b                   	pop    %ebx
8010022c:	5e                   	pop    %esi
8010022d:	5f                   	pop    %edi
8010022e:	5d                   	pop    %ebp
8010022f:	c3                   	ret    

80100230 <get_ip>:
80100230:	55                   	push   %ebp
80100231:	89 e5                	mov    %esp,%ebp
80100233:	57                   	push   %edi
80100234:	56                   	push   %esi
80100235:	53                   	push   %ebx
80100236:	83 ec 3c             	sub    $0x3c,%esp
80100239:	8b 75 0c             	mov    0xc(%ebp),%esi
8010023c:	85 f6                	test   %esi,%esi
8010023e:	0f 84 8c 00 00 00    	je     801002d0 <get_ip+0xa0>
80100244:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100247:	31 ff                	xor    %edi,%edi
80100249:	31 c0                	xor    %eax,%eax
8010024b:	8d 55 d4             	lea    -0x2c(%ebp),%edx
8010024e:	01 de                	add    %ebx,%esi
80100250:	eb 14                	jmp    80100266 <get_ip+0x36>
80100252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100258:	83 c3 01             	add    $0x1,%ebx
8010025b:	88 4c 05 d4          	mov    %cl,-0x2c(%ebp,%eax,1)
8010025f:	83 c0 01             	add    $0x1,%eax
80100262:	39 de                	cmp    %ebx,%esi
80100264:	74 2f                	je     80100295 <get_ip+0x65>
80100266:	0f b6 0b             	movzbl (%ebx),%ecx
80100269:	80 f9 2e             	cmp    $0x2e,%cl
8010026c:	75 ea                	jne    80100258 <get_ip+0x28>
8010026e:	83 ec 0c             	sub    $0xc,%esp
80100271:	83 c3 01             	add    $0x1,%ebx
80100274:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80100277:	52                   	push   %edx
80100278:	c6 44 05 d4 00       	movb   $0x0,-0x2c(%ebp,%eax,1)
8010027d:	e8 9e 78 00 00       	call   80107b20 <atoi>
80100282:	83 c4 10             	add    $0x10,%esp
80100285:	89 44 bd d8          	mov    %eax,-0x28(%ebp,%edi,4)
80100289:	83 c7 01             	add    $0x1,%edi
8010028c:	31 c0                	xor    %eax,%eax
8010028e:	39 de                	cmp    %ebx,%esi
80100290:	8b 55 c4             	mov    -0x3c(%ebp),%edx
80100293:	75 d1                	jne    80100266 <get_ip+0x36>
80100295:	83 ec 0c             	sub    $0xc,%esp
80100298:	c6 44 05 d4 00       	movb   $0x0,-0x2c(%ebp,%eax,1)
8010029d:	52                   	push   %edx
8010029e:	e8 7d 78 00 00       	call   80107b20 <atoi>
801002a3:	89 44 bd d8          	mov    %eax,-0x28(%ebp,%edi,4)
801002a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801002aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
801002ad:	c1 e0 18             	shl    $0x18,%eax
801002b0:	c1 e2 10             	shl    $0x10,%edx
801002b3:	01 d0                	add    %edx,%eax
801002b5:	8b 55 dc             	mov    -0x24(%ebp),%edx
801002b8:	03 45 d8             	add    -0x28(%ebp),%eax
801002bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002be:	c1 e2 08             	shl    $0x8,%edx
801002c1:	5b                   	pop    %ebx
801002c2:	01 d0                	add    %edx,%eax
801002c4:	5e                   	pop    %esi
801002c5:	5f                   	pop    %edi
801002c6:	5d                   	pop    %ebp
801002c7:	c3                   	ret    
801002c8:	90                   	nop
801002c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801002d0:	31 ff                	xor    %edi,%edi
801002d2:	31 c0                	xor    %eax,%eax
801002d4:	8d 55 d4             	lea    -0x2c(%ebp),%edx
801002d7:	eb bc                	jmp    80100295 <get_ip+0x65>
801002d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801002e0 <htons>:
801002e0:	55                   	push   %ebp
801002e1:	89 e5                	mov    %esp,%ebp
801002e3:	0f b7 45 08          	movzwl 0x8(%ebp),%eax
801002e7:	5d                   	pop    %ebp
801002e8:	66 c1 c0 08          	rol    $0x8,%ax
801002ec:	c3                   	ret    
801002ed:	8d 76 00             	lea    0x0(%esi),%esi

801002f0 <htonl>:
801002f0:	55                   	push   %ebp
801002f1:	89 e5                	mov    %esp,%ebp
801002f3:	8b 55 08             	mov    0x8(%ebp),%edx
801002f6:	5d                   	pop    %ebp
801002f7:	89 d0                	mov    %edx,%eax
801002f9:	c1 ea 10             	shr    $0x10,%edx
801002fc:	66 c1 c0 08          	rol    $0x8,%ax
80100300:	66 c1 c2 08          	rol    $0x8,%dx
80100304:	89 c1                	mov    %eax,%ecx
80100306:	0f b7 c2             	movzwl %dx,%eax
80100309:	c1 e1 10             	shl    $0x10,%ecx
8010030c:	09 c8                	or     %ecx,%eax
8010030e:	c3                   	ret    
8010030f:	90                   	nop

80100310 <create_eth_arp_frame>:
80100310:	55                   	push   %ebp
80100311:	89 e5                	mov    %esp,%ebp
80100313:	57                   	push   %edi
80100314:	56                   	push   %esi
80100315:	53                   	push   %ebx
80100316:	83 ec 18             	sub    $0x18,%esp
80100319:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010031c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010031f:	68 cc 8f 10 80       	push   $0x80108fcc
80100324:	8b 75 0c             	mov    0xc(%ebp),%esi
80100327:	e8 14 09 00 00       	call   80100c40 <cprintf>
8010032c:	58                   	pop    %eax
8010032d:	5a                   	pop    %edx
8010032e:	68 de 8f 10 80       	push   $0x80108fde
80100333:	53                   	push   %ebx
80100334:	e8 37 fe ff ff       	call   80100170 <pack_mac>
80100339:	8d 43 06             	lea    0x6(%ebx),%eax
8010033c:	83 c4 0c             	add    $0xc,%esp
8010033f:	6a 06                	push   $0x6
80100341:	57                   	push   %edi
80100342:	50                   	push   %eax
80100343:	e8 38 5b 00 00       	call   80105e80 <memmove>
80100348:	8d 43 16             	lea    0x16(%ebx),%eax
8010034b:	83 c4 0c             	add    $0xc,%esp
8010034e:	b9 00 01 00 00       	mov    $0x100,%ecx
80100353:	66 89 4b 14          	mov    %cx,0x14(%ebx)
80100357:	c7 43 0c 08 06 00 01 	movl   $0x1000608,0xc(%ebx)
8010035e:	c7 43 10 08 00 06 04 	movl   $0x4060008,0x10(%ebx)
80100365:	6a 06                	push   $0x6
80100367:	57                   	push   %edi
80100368:	50                   	push   %eax
80100369:	e8 12 5b 00 00       	call   80105e80 <memmove>
8010036e:	5f                   	pop    %edi
8010036f:	58                   	pop    %eax
80100370:	8d 43 20             	lea    0x20(%ebx),%eax
80100373:	68 de 8f 10 80       	push   $0x80108fde
80100378:	50                   	push   %eax
80100379:	e8 f2 fd ff ff       	call   80100170 <pack_mac>
8010037e:	c7 04 24 f0 8f 10 80 	movl   $0x80108ff0,(%esp)
80100385:	e8 66 5c 00 00       	call   80105ff0 <strlen>
8010038a:	5a                   	pop    %edx
8010038b:	59                   	pop    %ecx
8010038c:	50                   	push   %eax
8010038d:	68 f0 8f 10 80       	push   $0x80108ff0
80100392:	e8 99 fe ff ff       	call   80100230 <get_ip>
80100397:	89 43 1c             	mov    %eax,0x1c(%ebx)
8010039a:	89 34 24             	mov    %esi,(%esp)
8010039d:	e8 4e 5c 00 00       	call   80105ff0 <strlen>
801003a2:	5f                   	pop    %edi
801003a3:	5a                   	pop    %edx
801003a4:	50                   	push   %eax
801003a5:	56                   	push   %esi
801003a6:	e8 85 fe ff ff       	call   80100230 <get_ip>
801003ab:	89 43 26             	mov    %eax,0x26(%ebx)
801003ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
801003b1:	31 c0                	xor    %eax,%eax
801003b3:	5b                   	pop    %ebx
801003b4:	5e                   	pop    %esi
801003b5:	5f                   	pop    %edi
801003b6:	5d                   	pop    %ebp
801003b7:	c3                   	ret    
801003b8:	90                   	nop
801003b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801003c0 <int_to_hex>:
801003c0:	55                   	push   %ebp
801003c1:	89 e5                	mov    %esp,%ebp
801003c3:	8b 45 08             	mov    0x8(%ebp),%eax
801003c6:	83 f8 09             	cmp    $0x9,%eax
801003c9:	76 15                	jbe    801003e0 <int_to_hex+0x20>
801003cb:	8d 50 f6             	lea    -0xa(%eax),%edx
801003ce:	83 c0 37             	add    $0x37,%eax
801003d1:	5d                   	pop    %ebp
801003d2:	83 fa 06             	cmp    $0x6,%edx
801003d5:	ba 30 00 00 00       	mov    $0x30,%edx
801003da:	0f 43 c2             	cmovae %edx,%eax
801003dd:	c3                   	ret    
801003de:	66 90                	xchg   %ax,%ax
801003e0:	83 c0 30             	add    $0x30,%eax
801003e3:	5d                   	pop    %ebp
801003e4:	c3                   	ret    
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <unpack_mac>:
801003f0:	55                   	push   %ebp
801003f1:	89 e5                	mov    %esp,%ebp
801003f3:	57                   	push   %edi
801003f4:	56                   	push   %esi
801003f5:	53                   	push   %ebx
801003f6:	83 ec 04             	sub    $0x4,%esp
801003f9:	8b 55 0c             	mov    0xc(%ebp),%edx
801003fc:	8b 75 08             	mov    0x8(%ebp),%esi
801003ff:	89 d0                	mov    %edx,%eax
80100401:	83 c0 12             	add    $0x12,%eax
80100404:	89 45 f0             	mov    %eax,-0x10(%ebp)
80100407:	89 f6                	mov    %esi,%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100410:	0f b6 06             	movzbl (%esi),%eax
80100413:	c6 42 02 3a          	movb   $0x3a,0x2(%edx)
80100417:	89 c1                	mov    %eax,%ecx
80100419:	c1 e8 04             	shr    $0x4,%eax
8010041c:	8d 78 30             	lea    0x30(%eax),%edi
8010041f:	8d 58 37             	lea    0x37(%eax),%ebx
80100422:	83 e1 0f             	and    $0xf,%ecx
80100425:	83 f8 09             	cmp    $0x9,%eax
80100428:	8d 41 30             	lea    0x30(%ecx),%eax
8010042b:	0f 46 df             	cmovbe %edi,%ebx
8010042e:	80 f9 0a             	cmp    $0xa,%cl
80100431:	88 1a                	mov    %bl,(%edx)
80100433:	8d 59 37             	lea    0x37(%ecx),%ebx
80100436:	0f 43 c3             	cmovae %ebx,%eax
80100439:	83 c6 01             	add    $0x1,%esi
8010043c:	83 c2 03             	add    $0x3,%edx
8010043f:	88 42 fe             	mov    %al,-0x2(%edx)
80100442:	39 55 f0             	cmp    %edx,-0x10(%ebp)
80100445:	75 c9                	jne    80100410 <unpack_mac+0x20>
80100447:	8b 45 0c             	mov    0xc(%ebp),%eax
8010044a:	c6 40 11 00          	movb   $0x0,0x11(%eax)
8010044e:	83 c4 04             	add    $0x4,%esp
80100451:	5b                   	pop    %ebx
80100452:	5e                   	pop    %esi
80100453:	5f                   	pop    %edi
80100454:	5d                   	pop    %ebp
80100455:	c3                   	ret    
80100456:	8d 76 00             	lea    0x0(%esi),%esi
80100459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100460 <parse_ip>:
80100460:	55                   	push   %ebp
80100461:	31 c9                	xor    %ecx,%ecx
80100463:	89 e5                	mov    %esp,%ebp
80100465:	57                   	push   %edi
80100466:	56                   	push   %esi
80100467:	53                   	push   %ebx
80100468:	8d 75 e4             	lea    -0x1c(%ebp),%esi
8010046b:	83 ec 24             	sub    $0x24,%esp
8010046e:	8b 45 08             	mov    0x8(%ebp),%eax
80100471:	85 c0                	test   %eax,%eax
80100473:	0f 95 c1             	setne  %cl
80100476:	31 ff                	xor    %edi,%edi
80100478:	85 c9                	test   %ecx,%ecx
8010047a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010047d:	75 21                	jne    801004a0 <parse_ip+0x40>
8010047f:	8b 45 0c             	mov    0xc(%ebp),%eax
80100482:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80100485:	83 c6 04             	add    $0x4,%esi
80100488:	c6 04 38 30          	movb   $0x30,(%eax,%edi,1)
8010048c:	c6 44 38 01 3a       	movb   $0x3a,0x1(%eax,%edi,1)
80100491:	83 c7 02             	add    $0x2,%edi
80100494:	39 de                	cmp    %ebx,%esi
80100496:	89 f8                	mov    %edi,%eax
80100498:	74 7a                	je     80100514 <parse_ip+0xb4>
8010049a:	8b 0e                	mov    (%esi),%ecx
8010049c:	85 c9                	test   %ecx,%ecx
8010049e:	74 df                	je     8010047f <parse_ip+0x1f>
801004a0:	31 db                	xor    %ebx,%ebx
801004a2:	89 7d d0             	mov    %edi,-0x30(%ebp)
801004a5:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
801004aa:	8d 7b 01             	lea    0x1(%ebx),%edi
801004ad:	f7 e1                	mul    %ecx
801004af:	c1 ea 03             	shr    $0x3,%edx
801004b2:	8d 04 92             	lea    (%edx,%edx,4),%eax
801004b5:	01 c0                	add    %eax,%eax
801004b7:	29 c1                	sub    %eax,%ecx
801004b9:	85 d2                	test   %edx,%edx
801004bb:	8d 41 30             	lea    0x30(%ecx),%eax
801004be:	89 d1                	mov    %edx,%ecx
801004c0:	88 44 3d e0          	mov    %al,-0x20(%ebp,%edi,1)
801004c4:	74 0a                	je     801004d0 <parse_ip+0x70>
801004c6:	89 fb                	mov    %edi,%ebx
801004c8:	eb db                	jmp    801004a5 <parse_ip+0x45>
801004ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801004d0:	8b 7d d0             	mov    -0x30(%ebp),%edi
801004d3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801004d6:	89 da                	mov    %ebx,%edx
801004d8:	83 ea 01             	sub    $0x1,%edx
801004db:	01 f9                	add    %edi,%ecx
801004dd:	88 01                	mov    %al,(%ecx)
801004df:	83 c1 01             	add    $0x1,%ecx
801004e2:	83 fa ff             	cmp    $0xffffffff,%edx
801004e5:	74 13                	je     801004fa <parse_ip+0x9a>
801004e7:	0f b6 44 15 e1       	movzbl -0x1f(%ebp,%edx,1),%eax
801004ec:	83 ea 01             	sub    $0x1,%edx
801004ef:	83 c1 01             	add    $0x1,%ecx
801004f2:	88 41 ff             	mov    %al,-0x1(%ecx)
801004f5:	83 fa ff             	cmp    $0xffffffff,%edx
801004f8:	75 ed                	jne    801004e7 <parse_ip+0x87>
801004fa:	8d 54 1f 01          	lea    0x1(%edi,%ebx,1),%edx
801004fe:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80100501:	83 c6 04             	add    $0x4,%esi
80100504:	8d 7a 01             	lea    0x1(%edx),%edi
80100507:	c6 04 13 3a          	movb   $0x3a,(%ebx,%edx,1)
8010050b:	8d 5d f4             	lea    -0xc(%ebp),%ebx
8010050e:	89 f8                	mov    %edi,%eax
80100510:	39 de                	cmp    %ebx,%esi
80100512:	75 86                	jne    8010049a <parse_ip+0x3a>
80100514:	8b 75 0c             	mov    0xc(%ebp),%esi
80100517:	c6 44 06 ff 00       	movb   $0x0,-0x1(%esi,%eax,1)
8010051c:	83 c4 24             	add    $0x24,%esp
8010051f:	5b                   	pop    %ebx
80100520:	5e                   	pop    %esi
80100521:	5f                   	pop    %edi
80100522:	5d                   	pop    %ebp
80100523:	c3                   	ret    
80100524:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010052a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100530 <parse_arp_reply>:
80100530:	55                   	push   %ebp
80100531:	89 e5                	mov    %esp,%ebp
80100533:	53                   	push   %ebx
80100534:	83 ec 44             	sub    $0x44,%esp
80100537:	66 81 7d 14 06 08    	cmpw   $0x806,0x14(%ebp)
8010053d:	75 41                	jne    80100580 <parse_arp_reply+0x50>
8010053f:	66 81 7d 18 00 08    	cmpw   $0x800,0x18(%ebp)
80100545:	75 21                	jne    80100568 <parse_arp_reply+0x38>
80100547:	66 83 7d 1c 02       	cmpw   $0x2,0x1c(%ebp)
8010054c:	74 4a                	je     80100598 <parse_arp_reply+0x68>
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 1f 90 10 80       	push   $0x8010901f
80100556:	e8 e5 06 00 00       	call   80100c40 <cprintf>
8010055b:	83 c4 10             	add    $0x10,%esp
8010055e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100561:	c9                   	leave  
80100562:	c3                   	ret    
80100563:	90                   	nop
80100564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100568:	83 ec 0c             	sub    $0xc,%esp
8010056b:	68 0c 90 10 80       	push   $0x8010900c
80100570:	e8 cb 06 00 00       	call   80100c40 <cprintf>
80100575:	83 c4 10             	add    $0x10,%esp
80100578:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010057b:	c9                   	leave  
8010057c:	c3                   	ret    
8010057d:	8d 76 00             	lea    0x0(%esi),%esi
80100580:	83 ec 0c             	sub    $0xc,%esp
80100583:	68 fa 8f 10 80       	push   $0x80108ffa
80100588:	e8 b3 06 00 00       	call   80100c40 <cprintf>
8010058d:	83 c4 10             	add    $0x10,%esp
80100590:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100593:	c9                   	leave  
80100594:	c3                   	ret    
80100595:	8d 76 00             	lea    0x0(%esi),%esi
80100598:	8d 45 28             	lea    0x28(%ebp),%eax
8010059b:	8d 5d d4             	lea    -0x2c(%ebp),%ebx
8010059e:	83 ec 08             	sub    $0x8,%esp
801005a1:	53                   	push   %ebx
801005a2:	50                   	push   %eax
801005a3:	e8 48 fe ff ff       	call   801003f0 <unpack_mac>
801005a8:	59                   	pop    %ecx
801005a9:	58                   	pop    %eax
801005aa:	53                   	push   %ebx
801005ab:	68 31 90 10 80       	push   $0x80109031
801005b0:	e8 ab 75 00 00       	call   80107b60 <strcmp>
801005b5:	83 c4 10             	add    $0x10,%esp
801005b8:	85 c0                	test   %eax,%eax
801005ba:	75 4c                	jne    80100608 <parse_arp_reply+0xd8>
801005bc:	0f b7 45 2e          	movzwl 0x2e(%ebp),%eax
801005c0:	8d 5d c4             	lea    -0x3c(%ebp),%ebx
801005c3:	83 ec 08             	sub    $0x8,%esp
801005c6:	53                   	push   %ebx
801005c7:	50                   	push   %eax
801005c8:	e8 93 fe ff ff       	call   80100460 <parse_ip>
801005cd:	58                   	pop    %eax
801005ce:	5a                   	pop    %edx
801005cf:	53                   	push   %ebx
801005d0:	68 5f 90 10 80       	push   $0x8010905f
801005d5:	e8 86 75 00 00       	call   80107b60 <strcmp>
801005da:	83 c4 10             	add    $0x10,%esp
801005dd:	85 c0                	test   %eax,%eax
801005df:	75 27                	jne    80100608 <parse_arp_reply+0xd8>
801005e1:	8d 45 1e             	lea    0x1e(%ebp),%eax
801005e4:	8d 5d e6             	lea    -0x1a(%ebp),%ebx
801005e7:	83 ec 08             	sub    $0x8,%esp
801005ea:	53                   	push   %ebx
801005eb:	50                   	push   %eax
801005ec:	e8 ff fd ff ff       	call   801003f0 <unpack_mac>
801005f1:	89 1c 24             	mov    %ebx,(%esp)
801005f4:	e8 47 06 00 00       	call   80100c40 <cprintf>
801005f9:	83 c4 10             	add    $0x10,%esp
801005fc:	e9 77 ff ff ff       	jmp    80100578 <parse_arp_reply+0x48>
80100601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100608:	83 ec 0c             	sub    $0xc,%esp
8010060b:	68 43 90 10 80       	push   $0x80109043
80100610:	e8 2b 06 00 00       	call   80100c40 <cprintf>
80100615:	83 c4 10             	add    $0x10,%esp
80100618:	e9 5b ff ff ff       	jmp    80100578 <parse_arp_reply+0x48>
8010061d:	66 90                	xchg   %ax,%ax
8010061f:	90                   	nop

80100620 <binit>:
80100620:	55                   	push   %ebp
80100621:	89 e5                	mov    %esp,%ebp
80100623:	53                   	push   %ebx
80100624:	bb 94 4e 15 80       	mov    $0x80154e94,%ebx
80100629:	83 ec 0c             	sub    $0xc,%esp
8010062c:	68 6f 90 10 80       	push   $0x8010906f
80100631:	68 60 4e 15 80       	push   $0x80154e60
80100636:	e8 25 55 00 00       	call   80105b60 <initlock>
8010063b:	c7 05 ac 95 15 80 5c 	movl   $0x8015955c,0x801595ac
80100642:	95 15 80 
80100645:	c7 05 b0 95 15 80 5c 	movl   $0x8015955c,0x801595b0
8010064c:	95 15 80 
8010064f:	83 c4 10             	add    $0x10,%esp
80100652:	ba 5c 95 15 80       	mov    $0x8015955c,%edx
80100657:	eb 09                	jmp    80100662 <binit+0x42>
80100659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100660:	89 c3                	mov    %eax,%ebx
80100662:	8d 43 0c             	lea    0xc(%ebx),%eax
80100665:	83 ec 08             	sub    $0x8,%esp
80100668:	89 53 54             	mov    %edx,0x54(%ebx)
8010066b:	c7 43 50 5c 95 15 80 	movl   $0x8015955c,0x50(%ebx)
80100672:	68 76 90 10 80       	push   $0x80109076
80100677:	50                   	push   %eax
80100678:	e8 d3 53 00 00       	call   80105a50 <initsleeplock>
8010067d:	a1 b0 95 15 80       	mov    0x801595b0,%eax
80100682:	83 c4 10             	add    $0x10,%esp
80100685:	89 da                	mov    %ebx,%edx
80100687:	89 58 50             	mov    %ebx,0x50(%eax)
8010068a:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
80100690:	89 1d b0 95 15 80    	mov    %ebx,0x801595b0
80100696:	3d 5c 95 15 80       	cmp    $0x8015955c,%eax
8010069b:	72 c3                	jb     80100660 <binit+0x40>
8010069d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801006a0:	c9                   	leave  
801006a1:	c3                   	ret    
801006a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801006a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801006b0 <bread>:
801006b0:	55                   	push   %ebp
801006b1:	89 e5                	mov    %esp,%ebp
801006b3:	57                   	push   %edi
801006b4:	56                   	push   %esi
801006b5:	53                   	push   %ebx
801006b6:	83 ec 18             	sub    $0x18,%esp
801006b9:	8b 75 08             	mov    0x8(%ebp),%esi
801006bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801006bf:	68 60 4e 15 80       	push   $0x80154e60
801006c4:	e8 87 55 00 00       	call   80105c50 <acquire>
801006c9:	8b 1d b0 95 15 80    	mov    0x801595b0,%ebx
801006cf:	83 c4 10             	add    $0x10,%esp
801006d2:	81 fb 5c 95 15 80    	cmp    $0x8015955c,%ebx
801006d8:	75 11                	jne    801006eb <bread+0x3b>
801006da:	eb 24                	jmp    80100700 <bread+0x50>
801006dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801006e0:	8b 5b 54             	mov    0x54(%ebx),%ebx
801006e3:	81 fb 5c 95 15 80    	cmp    $0x8015955c,%ebx
801006e9:	74 15                	je     80100700 <bread+0x50>
801006eb:	3b 73 04             	cmp    0x4(%ebx),%esi
801006ee:	75 f0                	jne    801006e0 <bread+0x30>
801006f0:	3b 7b 08             	cmp    0x8(%ebx),%edi
801006f3:	75 eb                	jne    801006e0 <bread+0x30>
801006f5:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
801006f9:	eb 3f                	jmp    8010073a <bread+0x8a>
801006fb:	90                   	nop
801006fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100700:	8b 1d ac 95 15 80    	mov    0x801595ac,%ebx
80100706:	81 fb 5c 95 15 80    	cmp    $0x8015955c,%ebx
8010070c:	75 0d                	jne    8010071b <bread+0x6b>
8010070e:	eb 60                	jmp    80100770 <bread+0xc0>
80100710:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100713:	81 fb 5c 95 15 80    	cmp    $0x8015955c,%ebx
80100719:	74 55                	je     80100770 <bread+0xc0>
8010071b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010071e:	85 c0                	test   %eax,%eax
80100720:	75 ee                	jne    80100710 <bread+0x60>
80100722:	f6 03 04             	testb  $0x4,(%ebx)
80100725:	75 e9                	jne    80100710 <bread+0x60>
80100727:	89 73 04             	mov    %esi,0x4(%ebx)
8010072a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010072d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100733:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010073a:	83 ec 0c             	sub    $0xc,%esp
8010073d:	68 60 4e 15 80       	push   $0x80154e60
80100742:	e8 29 56 00 00       	call   80105d70 <release>
80100747:	8d 43 0c             	lea    0xc(%ebx),%eax
8010074a:	89 04 24             	mov    %eax,(%esp)
8010074d:	e8 3e 53 00 00       	call   80105a90 <acquiresleep>
80100752:	83 c4 10             	add    $0x10,%esp
80100755:	f6 03 02             	testb  $0x2,(%ebx)
80100758:	75 0c                	jne    80100766 <bread+0xb6>
8010075a:	83 ec 0c             	sub    $0xc,%esp
8010075d:	53                   	push   %ebx
8010075e:	e8 7d 26 00 00       	call   80102de0 <iderw>
80100763:	83 c4 10             	add    $0x10,%esp
80100766:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100769:	89 d8                	mov    %ebx,%eax
8010076b:	5b                   	pop    %ebx
8010076c:	5e                   	pop    %esi
8010076d:	5f                   	pop    %edi
8010076e:	5d                   	pop    %ebp
8010076f:	c3                   	ret    
80100770:	83 ec 0c             	sub    $0xc,%esp
80100773:	68 7d 90 10 80       	push   $0x8010907d
80100778:	e8 f3 01 00 00       	call   80100970 <panic>
8010077d:	8d 76 00             	lea    0x0(%esi),%esi

80100780 <bwrite>:
80100780:	55                   	push   %ebp
80100781:	89 e5                	mov    %esp,%ebp
80100783:	53                   	push   %ebx
80100784:	83 ec 10             	sub    $0x10,%esp
80100787:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010078a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010078d:	50                   	push   %eax
8010078e:	e8 9d 53 00 00       	call   80105b30 <holdingsleep>
80100793:	83 c4 10             	add    $0x10,%esp
80100796:	85 c0                	test   %eax,%eax
80100798:	74 0f                	je     801007a9 <bwrite+0x29>
8010079a:	83 0b 04             	orl    $0x4,(%ebx)
8010079d:	89 5d 08             	mov    %ebx,0x8(%ebp)
801007a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801007a3:	c9                   	leave  
801007a4:	e9 37 26 00 00       	jmp    80102de0 <iderw>
801007a9:	83 ec 0c             	sub    $0xc,%esp
801007ac:	68 8e 90 10 80       	push   $0x8010908e
801007b1:	e8 ba 01 00 00       	call   80100970 <panic>
801007b6:	8d 76 00             	lea    0x0(%esi),%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007c0 <brelse>:
801007c0:	55                   	push   %ebp
801007c1:	89 e5                	mov    %esp,%ebp
801007c3:	56                   	push   %esi
801007c4:	53                   	push   %ebx
801007c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007c8:	83 ec 0c             	sub    $0xc,%esp
801007cb:	8d 73 0c             	lea    0xc(%ebx),%esi
801007ce:	56                   	push   %esi
801007cf:	e8 5c 53 00 00       	call   80105b30 <holdingsleep>
801007d4:	83 c4 10             	add    $0x10,%esp
801007d7:	85 c0                	test   %eax,%eax
801007d9:	74 66                	je     80100841 <brelse+0x81>
801007db:	83 ec 0c             	sub    $0xc,%esp
801007de:	56                   	push   %esi
801007df:	e8 0c 53 00 00       	call   80105af0 <releasesleep>
801007e4:	c7 04 24 60 4e 15 80 	movl   $0x80154e60,(%esp)
801007eb:	e8 60 54 00 00       	call   80105c50 <acquire>
801007f0:	8b 43 4c             	mov    0x4c(%ebx),%eax
801007f3:	83 c4 10             	add    $0x10,%esp
801007f6:	83 e8 01             	sub    $0x1,%eax
801007f9:	85 c0                	test   %eax,%eax
801007fb:	89 43 4c             	mov    %eax,0x4c(%ebx)
801007fe:	75 2f                	jne    8010082f <brelse+0x6f>
80100800:	8b 43 54             	mov    0x54(%ebx),%eax
80100803:	8b 53 50             	mov    0x50(%ebx),%edx
80100806:	89 50 50             	mov    %edx,0x50(%eax)
80100809:	8b 43 50             	mov    0x50(%ebx),%eax
8010080c:	8b 53 54             	mov    0x54(%ebx),%edx
8010080f:	89 50 54             	mov    %edx,0x54(%eax)
80100812:	a1 b0 95 15 80       	mov    0x801595b0,%eax
80100817:	c7 43 50 5c 95 15 80 	movl   $0x8015955c,0x50(%ebx)
8010081e:	89 43 54             	mov    %eax,0x54(%ebx)
80100821:	a1 b0 95 15 80       	mov    0x801595b0,%eax
80100826:	89 58 50             	mov    %ebx,0x50(%eax)
80100829:	89 1d b0 95 15 80    	mov    %ebx,0x801595b0
8010082f:	c7 45 08 60 4e 15 80 	movl   $0x80154e60,0x8(%ebp)
80100836:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100839:	5b                   	pop    %ebx
8010083a:	5e                   	pop    %esi
8010083b:	5d                   	pop    %ebp
8010083c:	e9 2f 55 00 00       	jmp    80105d70 <release>
80100841:	83 ec 0c             	sub    $0xc,%esp
80100844:	68 95 90 10 80       	push   $0x80109095
80100849:	e8 22 01 00 00       	call   80100970 <panic>
8010084e:	66 90                	xchg   %ax,%ax

80100850 <consoleread>:
80100850:	55                   	push   %ebp
80100851:	89 e5                	mov    %esp,%ebp
80100853:	57                   	push   %edi
80100854:	56                   	push   %esi
80100855:	53                   	push   %ebx
80100856:	83 ec 28             	sub    $0x28,%esp
80100859:	8b 7d 08             	mov    0x8(%ebp),%edi
8010085c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010085f:	57                   	push   %edi
80100860:	e8 bb 1b 00 00       	call   80102420 <iunlock>
80100865:	c7 04 24 60 d5 10 80 	movl   $0x8010d560,(%esp)
8010086c:	e8 df 53 00 00       	call   80105c50 <acquire>
80100871:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100874:	83 c4 10             	add    $0x10,%esp
80100877:	31 c0                	xor    %eax,%eax
80100879:	85 db                	test   %ebx,%ebx
8010087b:	0f 8e a1 00 00 00    	jle    80100922 <consoleread+0xd2>
80100881:	8b 15 40 98 15 80    	mov    0x80159840,%edx
80100887:	39 15 44 98 15 80    	cmp    %edx,0x80159844
8010088d:	74 2c                	je     801008bb <consoleread+0x6b>
8010088f:	eb 5f                	jmp    801008f0 <consoleread+0xa0>
80100891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100898:	83 ec 08             	sub    $0x8,%esp
8010089b:	68 60 d5 10 80       	push   $0x8010d560
801008a0:	68 40 98 15 80       	push   $0x80159840
801008a5:	e8 56 4e 00 00       	call   80105700 <sleep>
801008aa:	8b 15 40 98 15 80    	mov    0x80159840,%edx
801008b0:	83 c4 10             	add    $0x10,%esp
801008b3:	3b 15 44 98 15 80    	cmp    0x80159844,%edx
801008b9:	75 35                	jne    801008f0 <consoleread+0xa0>
801008bb:	e8 a0 48 00 00       	call   80105160 <myproc>
801008c0:	8b 40 24             	mov    0x24(%eax),%eax
801008c3:	85 c0                	test   %eax,%eax
801008c5:	74 d1                	je     80100898 <consoleread+0x48>
801008c7:	83 ec 0c             	sub    $0xc,%esp
801008ca:	68 60 d5 10 80       	push   $0x8010d560
801008cf:	e8 9c 54 00 00       	call   80105d70 <release>
801008d4:	89 3c 24             	mov    %edi,(%esp)
801008d7:	e8 64 1a 00 00       	call   80102340 <ilock>
801008dc:	83 c4 10             	add    $0x10,%esp
801008df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801008e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801008e7:	5b                   	pop    %ebx
801008e8:	5e                   	pop    %esi
801008e9:	5f                   	pop    %edi
801008ea:	5d                   	pop    %ebp
801008eb:	c3                   	ret    
801008ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801008f0:	8d 42 01             	lea    0x1(%edx),%eax
801008f3:	a3 40 98 15 80       	mov    %eax,0x80159840
801008f8:	89 d0                	mov    %edx,%eax
801008fa:	83 e0 7f             	and    $0x7f,%eax
801008fd:	0f be 80 c0 97 15 80 	movsbl -0x7fea6840(%eax),%eax
80100904:	83 f8 04             	cmp    $0x4,%eax
80100907:	74 3f                	je     80100948 <consoleread+0xf8>
80100909:	83 c6 01             	add    $0x1,%esi
8010090c:	83 eb 01             	sub    $0x1,%ebx
8010090f:	83 f8 0a             	cmp    $0xa,%eax
80100912:	88 46 ff             	mov    %al,-0x1(%esi)
80100915:	74 43                	je     8010095a <consoleread+0x10a>
80100917:	85 db                	test   %ebx,%ebx
80100919:	0f 85 62 ff ff ff    	jne    80100881 <consoleread+0x31>
8010091f:	8b 45 10             	mov    0x10(%ebp),%eax
80100922:	83 ec 0c             	sub    $0xc,%esp
80100925:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100928:	68 60 d5 10 80       	push   $0x8010d560
8010092d:	e8 3e 54 00 00       	call   80105d70 <release>
80100932:	89 3c 24             	mov    %edi,(%esp)
80100935:	e8 06 1a 00 00       	call   80102340 <ilock>
8010093a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010093d:	83 c4 10             	add    $0x10,%esp
80100940:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100943:	5b                   	pop    %ebx
80100944:	5e                   	pop    %esi
80100945:	5f                   	pop    %edi
80100946:	5d                   	pop    %ebp
80100947:	c3                   	ret    
80100948:	8b 45 10             	mov    0x10(%ebp),%eax
8010094b:	29 d8                	sub    %ebx,%eax
8010094d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100950:	73 d0                	jae    80100922 <consoleread+0xd2>
80100952:	89 15 40 98 15 80    	mov    %edx,0x80159840
80100958:	eb c8                	jmp    80100922 <consoleread+0xd2>
8010095a:	8b 45 10             	mov    0x10(%ebp),%eax
8010095d:	29 d8                	sub    %ebx,%eax
8010095f:	eb c1                	jmp    80100922 <consoleread+0xd2>
80100961:	eb 0d                	jmp    80100970 <panic>
80100963:	90                   	nop
80100964:	90                   	nop
80100965:	90                   	nop
80100966:	90                   	nop
80100967:	90                   	nop
80100968:	90                   	nop
80100969:	90                   	nop
8010096a:	90                   	nop
8010096b:	90                   	nop
8010096c:	90                   	nop
8010096d:	90                   	nop
8010096e:	90                   	nop
8010096f:	90                   	nop

80100970 <panic>:
80100970:	55                   	push   %ebp
80100971:	89 e5                	mov    %esp,%ebp
80100973:	56                   	push   %esi
80100974:	53                   	push   %ebx
80100975:	83 ec 30             	sub    $0x30,%esp
80100978:	fa                   	cli    
80100979:	c7 05 94 d5 10 80 00 	movl   $0x0,0x8010d594
80100980:	00 00 00 
80100983:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100986:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100989:	e8 62 2a 00 00       	call   801033f0 <lapicid>
8010098e:	83 ec 08             	sub    $0x8,%esp
80100991:	50                   	push   %eax
80100992:	68 9c 90 10 80       	push   $0x8010909c
80100997:	e8 a4 02 00 00       	call   80100c40 <cprintf>
8010099c:	58                   	pop    %eax
8010099d:	ff 75 08             	pushl  0x8(%ebp)
801009a0:	e8 9b 02 00 00       	call   80100c40 <cprintf>
801009a5:	c7 04 24 37 a0 10 80 	movl   $0x8010a037,(%esp)
801009ac:	e8 8f 02 00 00       	call   80100c40 <cprintf>
801009b1:	5a                   	pop    %edx
801009b2:	8d 45 08             	lea    0x8(%ebp),%eax
801009b5:	59                   	pop    %ecx
801009b6:	53                   	push   %ebx
801009b7:	50                   	push   %eax
801009b8:	e8 c3 51 00 00       	call   80105b80 <getcallerpcs>
801009bd:	83 c4 10             	add    $0x10,%esp
801009c0:	83 ec 08             	sub    $0x8,%esp
801009c3:	ff 33                	pushl  (%ebx)
801009c5:	83 c3 04             	add    $0x4,%ebx
801009c8:	68 22 92 10 80       	push   $0x80109222
801009cd:	e8 6e 02 00 00       	call   80100c40 <cprintf>
801009d2:	83 c4 10             	add    $0x10,%esp
801009d5:	39 f3                	cmp    %esi,%ebx
801009d7:	75 e7                	jne    801009c0 <panic+0x50>
801009d9:	c7 05 98 d5 10 80 01 	movl   $0x1,0x8010d598
801009e0:	00 00 00 
801009e3:	eb fe                	jmp    801009e3 <panic+0x73>
801009e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801009e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009f0 <consputc>:
801009f0:	8b 0d 98 d5 10 80    	mov    0x8010d598,%ecx
801009f6:	85 c9                	test   %ecx,%ecx
801009f8:	74 06                	je     80100a00 <consputc+0x10>
801009fa:	fa                   	cli    
801009fb:	eb fe                	jmp    801009fb <consputc+0xb>
801009fd:	8d 76 00             	lea    0x0(%esi),%esi
80100a00:	55                   	push   %ebp
80100a01:	89 e5                	mov    %esp,%ebp
80100a03:	57                   	push   %edi
80100a04:	56                   	push   %esi
80100a05:	53                   	push   %ebx
80100a06:	89 c6                	mov    %eax,%esi
80100a08:	83 ec 0c             	sub    $0xc,%esp
80100a0b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100a10:	0f 84 b1 00 00 00    	je     80100ac7 <consputc+0xd7>
80100a16:	83 ec 0c             	sub    $0xc,%esp
80100a19:	50                   	push   %eax
80100a1a:	e8 b1 70 00 00       	call   80107ad0 <uartputc>
80100a1f:	83 c4 10             	add    $0x10,%esp
80100a22:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100a27:	b8 0e 00 00 00       	mov    $0xe,%eax
80100a2c:	89 da                	mov    %ebx,%edx
80100a2e:	ee                   	out    %al,(%dx)
80100a2f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100a34:	89 ca                	mov    %ecx,%edx
80100a36:	ec                   	in     (%dx),%al
80100a37:	0f b6 c0             	movzbl %al,%eax
80100a3a:	89 da                	mov    %ebx,%edx
80100a3c:	c1 e0 08             	shl    $0x8,%eax
80100a3f:	89 c7                	mov    %eax,%edi
80100a41:	b8 0f 00 00 00       	mov    $0xf,%eax
80100a46:	ee                   	out    %al,(%dx)
80100a47:	89 ca                	mov    %ecx,%edx
80100a49:	ec                   	in     (%dx),%al
80100a4a:	0f b6 d8             	movzbl %al,%ebx
80100a4d:	09 fb                	or     %edi,%ebx
80100a4f:	83 fe 0a             	cmp    $0xa,%esi
80100a52:	0f 84 f3 00 00 00    	je     80100b4b <consputc+0x15b>
80100a58:	81 fe 00 01 00 00    	cmp    $0x100,%esi
80100a5e:	0f 84 d7 00 00 00    	je     80100b3b <consputc+0x14b>
80100a64:	89 f0                	mov    %esi,%eax
80100a66:	0f b6 c0             	movzbl %al,%eax
80100a69:	80 cc 07             	or     $0x7,%ah
80100a6c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100a73:	80 
80100a74:	83 c3 01             	add    $0x1,%ebx
80100a77:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
80100a7d:	0f 8f ab 00 00 00    	jg     80100b2e <consputc+0x13e>
80100a83:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
80100a89:	7f 66                	jg     80100af1 <consputc+0x101>
80100a8b:	be d4 03 00 00       	mov    $0x3d4,%esi
80100a90:	b8 0e 00 00 00       	mov    $0xe,%eax
80100a95:	89 f2                	mov    %esi,%edx
80100a97:	ee                   	out    %al,(%dx)
80100a98:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100a9d:	89 d8                	mov    %ebx,%eax
80100a9f:	c1 f8 08             	sar    $0x8,%eax
80100aa2:	89 ca                	mov    %ecx,%edx
80100aa4:	ee                   	out    %al,(%dx)
80100aa5:	b8 0f 00 00 00       	mov    $0xf,%eax
80100aaa:	89 f2                	mov    %esi,%edx
80100aac:	ee                   	out    %al,(%dx)
80100aad:	89 d8                	mov    %ebx,%eax
80100aaf:	89 ca                	mov    %ecx,%edx
80100ab1:	ee                   	out    %al,(%dx)
80100ab2:	b8 20 07 00 00       	mov    $0x720,%eax
80100ab7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100abe:	80 
80100abf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ac2:	5b                   	pop    %ebx
80100ac3:	5e                   	pop    %esi
80100ac4:	5f                   	pop    %edi
80100ac5:	5d                   	pop    %ebp
80100ac6:	c3                   	ret    
80100ac7:	83 ec 0c             	sub    $0xc,%esp
80100aca:	6a 08                	push   $0x8
80100acc:	e8 ff 6f 00 00       	call   80107ad0 <uartputc>
80100ad1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100ad8:	e8 f3 6f 00 00       	call   80107ad0 <uartputc>
80100add:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100ae4:	e8 e7 6f 00 00       	call   80107ad0 <uartputc>
80100ae9:	83 c4 10             	add    $0x10,%esp
80100aec:	e9 31 ff ff ff       	jmp    80100a22 <consputc+0x32>
80100af1:	52                   	push   %edx
80100af2:	68 60 0e 00 00       	push   $0xe60
80100af7:	83 eb 50             	sub    $0x50,%ebx
80100afa:	68 a0 80 0b 80       	push   $0x800b80a0
80100aff:	68 00 80 0b 80       	push   $0x800b8000
80100b04:	e8 77 53 00 00       	call   80105e80 <memmove>
80100b09:	b8 80 07 00 00       	mov    $0x780,%eax
80100b0e:	83 c4 0c             	add    $0xc,%esp
80100b11:	29 d8                	sub    %ebx,%eax
80100b13:	01 c0                	add    %eax,%eax
80100b15:	50                   	push   %eax
80100b16:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100b19:	6a 00                	push   $0x0
80100b1b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100b20:	50                   	push   %eax
80100b21:	e8 aa 52 00 00       	call   80105dd0 <memset>
80100b26:	83 c4 10             	add    $0x10,%esp
80100b29:	e9 5d ff ff ff       	jmp    80100a8b <consputc+0x9b>
80100b2e:	83 ec 0c             	sub    $0xc,%esp
80100b31:	68 b0 90 10 80       	push   $0x801090b0
80100b36:	e8 35 fe ff ff       	call   80100970 <panic>
80100b3b:	85 db                	test   %ebx,%ebx
80100b3d:	0f 84 48 ff ff ff    	je     80100a8b <consputc+0x9b>
80100b43:	83 eb 01             	sub    $0x1,%ebx
80100b46:	e9 2c ff ff ff       	jmp    80100a77 <consputc+0x87>
80100b4b:	89 d8                	mov    %ebx,%eax
80100b4d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100b52:	99                   	cltd   
80100b53:	f7 f9                	idiv   %ecx
80100b55:	29 d1                	sub    %edx,%ecx
80100b57:	01 cb                	add    %ecx,%ebx
80100b59:	e9 19 ff ff ff       	jmp    80100a77 <consputc+0x87>
80100b5e:	66 90                	xchg   %ax,%ax

80100b60 <printint>:
80100b60:	55                   	push   %ebp
80100b61:	89 e5                	mov    %esp,%ebp
80100b63:	57                   	push   %edi
80100b64:	56                   	push   %esi
80100b65:	53                   	push   %ebx
80100b66:	89 d3                	mov    %edx,%ebx
80100b68:	83 ec 2c             	sub    $0x2c,%esp
80100b6b:	85 c9                	test   %ecx,%ecx
80100b6d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100b70:	74 04                	je     80100b76 <printint+0x16>
80100b72:	85 c0                	test   %eax,%eax
80100b74:	78 5a                	js     80100bd0 <printint+0x70>
80100b76:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
80100b7d:	31 c9                	xor    %ecx,%ecx
80100b7f:	8d 75 d7             	lea    -0x29(%ebp),%esi
80100b82:	eb 06                	jmp    80100b8a <printint+0x2a>
80100b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100b88:	89 f9                	mov    %edi,%ecx
80100b8a:	31 d2                	xor    %edx,%edx
80100b8c:	8d 79 01             	lea    0x1(%ecx),%edi
80100b8f:	f7 f3                	div    %ebx
80100b91:	0f b6 92 dc 90 10 80 	movzbl -0x7fef6f24(%edx),%edx
80100b98:	85 c0                	test   %eax,%eax
80100b9a:	88 14 3e             	mov    %dl,(%esi,%edi,1)
80100b9d:	75 e9                	jne    80100b88 <printint+0x28>
80100b9f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80100ba2:	85 c0                	test   %eax,%eax
80100ba4:	74 08                	je     80100bae <printint+0x4e>
80100ba6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
80100bab:	8d 79 02             	lea    0x2(%ecx),%edi
80100bae:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
80100bb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100bb8:	0f be 03             	movsbl (%ebx),%eax
80100bbb:	83 eb 01             	sub    $0x1,%ebx
80100bbe:	e8 2d fe ff ff       	call   801009f0 <consputc>
80100bc3:	39 f3                	cmp    %esi,%ebx
80100bc5:	75 f1                	jne    80100bb8 <printint+0x58>
80100bc7:	83 c4 2c             	add    $0x2c,%esp
80100bca:	5b                   	pop    %ebx
80100bcb:	5e                   	pop    %esi
80100bcc:	5f                   	pop    %edi
80100bcd:	5d                   	pop    %ebp
80100bce:	c3                   	ret    
80100bcf:	90                   	nop
80100bd0:	f7 d8                	neg    %eax
80100bd2:	eb a9                	jmp    80100b7d <printint+0x1d>
80100bd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100bda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100be0 <consolewrite>:
80100be0:	55                   	push   %ebp
80100be1:	89 e5                	mov    %esp,%ebp
80100be3:	57                   	push   %edi
80100be4:	56                   	push   %esi
80100be5:	53                   	push   %ebx
80100be6:	83 ec 18             	sub    $0x18,%esp
80100be9:	8b 75 10             	mov    0x10(%ebp),%esi
80100bec:	ff 75 08             	pushl  0x8(%ebp)
80100bef:	e8 2c 18 00 00       	call   80102420 <iunlock>
80100bf4:	c7 04 24 60 d5 10 80 	movl   $0x8010d560,(%esp)
80100bfb:	e8 50 50 00 00       	call   80105c50 <acquire>
80100c00:	83 c4 10             	add    $0x10,%esp
80100c03:	85 f6                	test   %esi,%esi
80100c05:	7e 18                	jle    80100c1f <consolewrite+0x3f>
80100c07:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100c0a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
80100c0d:	8d 76 00             	lea    0x0(%esi),%esi
80100c10:	0f b6 07             	movzbl (%edi),%eax
80100c13:	83 c7 01             	add    $0x1,%edi
80100c16:	e8 d5 fd ff ff       	call   801009f0 <consputc>
80100c1b:	39 fb                	cmp    %edi,%ebx
80100c1d:	75 f1                	jne    80100c10 <consolewrite+0x30>
80100c1f:	83 ec 0c             	sub    $0xc,%esp
80100c22:	68 60 d5 10 80       	push   $0x8010d560
80100c27:	e8 44 51 00 00       	call   80105d70 <release>
80100c2c:	58                   	pop    %eax
80100c2d:	ff 75 08             	pushl  0x8(%ebp)
80100c30:	e8 0b 17 00 00       	call   80102340 <ilock>
80100c35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100c38:	89 f0                	mov    %esi,%eax
80100c3a:	5b                   	pop    %ebx
80100c3b:	5e                   	pop    %esi
80100c3c:	5f                   	pop    %edi
80100c3d:	5d                   	pop    %ebp
80100c3e:	c3                   	ret    
80100c3f:	90                   	nop

80100c40 <cprintf>:
80100c40:	55                   	push   %ebp
80100c41:	89 e5                	mov    %esp,%ebp
80100c43:	57                   	push   %edi
80100c44:	56                   	push   %esi
80100c45:	53                   	push   %ebx
80100c46:	83 ec 1c             	sub    $0x1c,%esp
80100c49:	a1 94 d5 10 80       	mov    0x8010d594,%eax
80100c4e:	85 c0                	test   %eax,%eax
80100c50:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100c53:	0f 85 6f 01 00 00    	jne    80100dc8 <cprintf+0x188>
80100c59:	8b 45 08             	mov    0x8(%ebp),%eax
80100c5c:	85 c0                	test   %eax,%eax
80100c5e:	89 c7                	mov    %eax,%edi
80100c60:	0f 84 77 01 00 00    	je     80100ddd <cprintf+0x19d>
80100c66:	0f b6 00             	movzbl (%eax),%eax
80100c69:	8d 4d 0c             	lea    0xc(%ebp),%ecx
80100c6c:	31 db                	xor    %ebx,%ebx
80100c6e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100c71:	85 c0                	test   %eax,%eax
80100c73:	75 56                	jne    80100ccb <cprintf+0x8b>
80100c75:	eb 79                	jmp    80100cf0 <cprintf+0xb0>
80100c77:	89 f6                	mov    %esi,%esi
80100c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100c80:	0f b6 16             	movzbl (%esi),%edx
80100c83:	85 d2                	test   %edx,%edx
80100c85:	74 69                	je     80100cf0 <cprintf+0xb0>
80100c87:	83 c3 02             	add    $0x2,%ebx
80100c8a:	83 fa 70             	cmp    $0x70,%edx
80100c8d:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
80100c90:	0f 84 84 00 00 00    	je     80100d1a <cprintf+0xda>
80100c96:	7f 78                	jg     80100d10 <cprintf+0xd0>
80100c98:	83 fa 25             	cmp    $0x25,%edx
80100c9b:	0f 84 ff 00 00 00    	je     80100da0 <cprintf+0x160>
80100ca1:	83 fa 64             	cmp    $0x64,%edx
80100ca4:	0f 85 8e 00 00 00    	jne    80100d38 <cprintf+0xf8>
80100caa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100cad:	ba 0a 00 00 00       	mov    $0xa,%edx
80100cb2:	8d 48 04             	lea    0x4(%eax),%ecx
80100cb5:	8b 00                	mov    (%eax),%eax
80100cb7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100cba:	b9 01 00 00 00       	mov    $0x1,%ecx
80100cbf:	e8 9c fe ff ff       	call   80100b60 <printint>
80100cc4:	0f b6 06             	movzbl (%esi),%eax
80100cc7:	85 c0                	test   %eax,%eax
80100cc9:	74 25                	je     80100cf0 <cprintf+0xb0>
80100ccb:	8d 53 01             	lea    0x1(%ebx),%edx
80100cce:	83 f8 25             	cmp    $0x25,%eax
80100cd1:	8d 34 17             	lea    (%edi,%edx,1),%esi
80100cd4:	74 aa                	je     80100c80 <cprintf+0x40>
80100cd6:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100cd9:	e8 12 fd ff ff       	call   801009f0 <consputc>
80100cde:	0f b6 06             	movzbl (%esi),%eax
80100ce1:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100ce4:	89 d3                	mov    %edx,%ebx
80100ce6:	85 c0                	test   %eax,%eax
80100ce8:	75 e1                	jne    80100ccb <cprintf+0x8b>
80100cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100cf0:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100cf3:	85 c0                	test   %eax,%eax
80100cf5:	74 10                	je     80100d07 <cprintf+0xc7>
80100cf7:	83 ec 0c             	sub    $0xc,%esp
80100cfa:	68 60 d5 10 80       	push   $0x8010d560
80100cff:	e8 6c 50 00 00       	call   80105d70 <release>
80100d04:	83 c4 10             	add    $0x10,%esp
80100d07:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100d0a:	5b                   	pop    %ebx
80100d0b:	5e                   	pop    %esi
80100d0c:	5f                   	pop    %edi
80100d0d:	5d                   	pop    %ebp
80100d0e:	c3                   	ret    
80100d0f:	90                   	nop
80100d10:	83 fa 73             	cmp    $0x73,%edx
80100d13:	74 43                	je     80100d58 <cprintf+0x118>
80100d15:	83 fa 78             	cmp    $0x78,%edx
80100d18:	75 1e                	jne    80100d38 <cprintf+0xf8>
80100d1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100d1d:	ba 10 00 00 00       	mov    $0x10,%edx
80100d22:	8d 48 04             	lea    0x4(%eax),%ecx
80100d25:	8b 00                	mov    (%eax),%eax
80100d27:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100d2a:	31 c9                	xor    %ecx,%ecx
80100d2c:	e8 2f fe ff ff       	call   80100b60 <printint>
80100d31:	eb 91                	jmp    80100cc4 <cprintf+0x84>
80100d33:	90                   	nop
80100d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d38:	b8 25 00 00 00       	mov    $0x25,%eax
80100d3d:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100d40:	e8 ab fc ff ff       	call   801009f0 <consputc>
80100d45:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100d48:	89 d0                	mov    %edx,%eax
80100d4a:	e8 a1 fc ff ff       	call   801009f0 <consputc>
80100d4f:	e9 70 ff ff ff       	jmp    80100cc4 <cprintf+0x84>
80100d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d58:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100d5b:	8b 10                	mov    (%eax),%edx
80100d5d:	8d 48 04             	lea    0x4(%eax),%ecx
80100d60:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100d63:	85 d2                	test   %edx,%edx
80100d65:	74 49                	je     80100db0 <cprintf+0x170>
80100d67:	0f be 02             	movsbl (%edx),%eax
80100d6a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100d6d:	84 c0                	test   %al,%al
80100d6f:	0f 84 4f ff ff ff    	je     80100cc4 <cprintf+0x84>
80100d75:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100d78:	89 d3                	mov    %edx,%ebx
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100d80:	83 c3 01             	add    $0x1,%ebx
80100d83:	e8 68 fc ff ff       	call   801009f0 <consputc>
80100d88:	0f be 03             	movsbl (%ebx),%eax
80100d8b:	84 c0                	test   %al,%al
80100d8d:	75 f1                	jne    80100d80 <cprintf+0x140>
80100d8f:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d92:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80100d95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100d98:	e9 27 ff ff ff       	jmp    80100cc4 <cprintf+0x84>
80100d9d:	8d 76 00             	lea    0x0(%esi),%esi
80100da0:	b8 25 00 00 00       	mov    $0x25,%eax
80100da5:	e8 46 fc ff ff       	call   801009f0 <consputc>
80100daa:	e9 15 ff ff ff       	jmp    80100cc4 <cprintf+0x84>
80100daf:	90                   	nop
80100db0:	ba c3 90 10 80       	mov    $0x801090c3,%edx
80100db5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100db8:	b8 28 00 00 00       	mov    $0x28,%eax
80100dbd:	89 d3                	mov    %edx,%ebx
80100dbf:	eb bf                	jmp    80100d80 <cprintf+0x140>
80100dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100dc8:	83 ec 0c             	sub    $0xc,%esp
80100dcb:	68 60 d5 10 80       	push   $0x8010d560
80100dd0:	e8 7b 4e 00 00       	call   80105c50 <acquire>
80100dd5:	83 c4 10             	add    $0x10,%esp
80100dd8:	e9 7c fe ff ff       	jmp    80100c59 <cprintf+0x19>
80100ddd:	83 ec 0c             	sub    $0xc,%esp
80100de0:	68 ca 90 10 80       	push   $0x801090ca
80100de5:	e8 86 fb ff ff       	call   80100970 <panic>
80100dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100df0 <consoleintr>:
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	57                   	push   %edi
80100df4:	56                   	push   %esi
80100df5:	53                   	push   %ebx
80100df6:	31 f6                	xor    %esi,%esi
80100df8:	83 ec 18             	sub    $0x18,%esp
80100dfb:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dfe:	68 60 d5 10 80       	push   $0x8010d560
80100e03:	e8 48 4e 00 00       	call   80105c50 <acquire>
80100e08:	83 c4 10             	add    $0x10,%esp
80100e0b:	90                   	nop
80100e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e10:	ff d3                	call   *%ebx
80100e12:	85 c0                	test   %eax,%eax
80100e14:	89 c7                	mov    %eax,%edi
80100e16:	78 48                	js     80100e60 <consoleintr+0x70>
80100e18:	83 ff 10             	cmp    $0x10,%edi
80100e1b:	0f 84 e7 00 00 00    	je     80100f08 <consoleintr+0x118>
80100e21:	7e 5d                	jle    80100e80 <consoleintr+0x90>
80100e23:	83 ff 15             	cmp    $0x15,%edi
80100e26:	0f 84 ec 00 00 00    	je     80100f18 <consoleintr+0x128>
80100e2c:	83 ff 7f             	cmp    $0x7f,%edi
80100e2f:	75 54                	jne    80100e85 <consoleintr+0x95>
80100e31:	a1 48 98 15 80       	mov    0x80159848,%eax
80100e36:	3b 05 44 98 15 80    	cmp    0x80159844,%eax
80100e3c:	74 d2                	je     80100e10 <consoleintr+0x20>
80100e3e:	83 e8 01             	sub    $0x1,%eax
80100e41:	a3 48 98 15 80       	mov    %eax,0x80159848
80100e46:	b8 00 01 00 00       	mov    $0x100,%eax
80100e4b:	e8 a0 fb ff ff       	call   801009f0 <consputc>
80100e50:	ff d3                	call   *%ebx
80100e52:	85 c0                	test   %eax,%eax
80100e54:	89 c7                	mov    %eax,%edi
80100e56:	79 c0                	jns    80100e18 <consoleintr+0x28>
80100e58:	90                   	nop
80100e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e60:	83 ec 0c             	sub    $0xc,%esp
80100e63:	68 60 d5 10 80       	push   $0x8010d560
80100e68:	e8 03 4f 00 00       	call   80105d70 <release>
80100e6d:	83 c4 10             	add    $0x10,%esp
80100e70:	85 f6                	test   %esi,%esi
80100e72:	0f 85 f8 00 00 00    	jne    80100f70 <consoleintr+0x180>
80100e78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e7b:	5b                   	pop    %ebx
80100e7c:	5e                   	pop    %esi
80100e7d:	5f                   	pop    %edi
80100e7e:	5d                   	pop    %ebp
80100e7f:	c3                   	ret    
80100e80:	83 ff 08             	cmp    $0x8,%edi
80100e83:	74 ac                	je     80100e31 <consoleintr+0x41>
80100e85:	85 ff                	test   %edi,%edi
80100e87:	74 87                	je     80100e10 <consoleintr+0x20>
80100e89:	a1 48 98 15 80       	mov    0x80159848,%eax
80100e8e:	89 c2                	mov    %eax,%edx
80100e90:	2b 15 40 98 15 80    	sub    0x80159840,%edx
80100e96:	83 fa 7f             	cmp    $0x7f,%edx
80100e99:	0f 87 71 ff ff ff    	ja     80100e10 <consoleintr+0x20>
80100e9f:	8d 50 01             	lea    0x1(%eax),%edx
80100ea2:	83 e0 7f             	and    $0x7f,%eax
80100ea5:	83 ff 0d             	cmp    $0xd,%edi
80100ea8:	89 15 48 98 15 80    	mov    %edx,0x80159848
80100eae:	0f 84 cc 00 00 00    	je     80100f80 <consoleintr+0x190>
80100eb4:	89 f9                	mov    %edi,%ecx
80100eb6:	88 88 c0 97 15 80    	mov    %cl,-0x7fea6840(%eax)
80100ebc:	89 f8                	mov    %edi,%eax
80100ebe:	e8 2d fb ff ff       	call   801009f0 <consputc>
80100ec3:	83 ff 0a             	cmp    $0xa,%edi
80100ec6:	0f 84 c5 00 00 00    	je     80100f91 <consoleintr+0x1a1>
80100ecc:	83 ff 04             	cmp    $0x4,%edi
80100ecf:	0f 84 bc 00 00 00    	je     80100f91 <consoleintr+0x1a1>
80100ed5:	a1 40 98 15 80       	mov    0x80159840,%eax
80100eda:	83 e8 80             	sub    $0xffffff80,%eax
80100edd:	39 05 48 98 15 80    	cmp    %eax,0x80159848
80100ee3:	0f 85 27 ff ff ff    	jne    80100e10 <consoleintr+0x20>
80100ee9:	83 ec 0c             	sub    $0xc,%esp
80100eec:	a3 44 98 15 80       	mov    %eax,0x80159844
80100ef1:	68 40 98 15 80       	push   $0x80159840
80100ef6:	e8 b5 49 00 00       	call   801058b0 <wakeup>
80100efb:	83 c4 10             	add    $0x10,%esp
80100efe:	e9 0d ff ff ff       	jmp    80100e10 <consoleintr+0x20>
80100f03:	90                   	nop
80100f04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f08:	be 01 00 00 00       	mov    $0x1,%esi
80100f0d:	e9 fe fe ff ff       	jmp    80100e10 <consoleintr+0x20>
80100f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f18:	a1 48 98 15 80       	mov    0x80159848,%eax
80100f1d:	39 05 44 98 15 80    	cmp    %eax,0x80159844
80100f23:	75 2b                	jne    80100f50 <consoleintr+0x160>
80100f25:	e9 e6 fe ff ff       	jmp    80100e10 <consoleintr+0x20>
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f30:	a3 48 98 15 80       	mov    %eax,0x80159848
80100f35:	b8 00 01 00 00       	mov    $0x100,%eax
80100f3a:	e8 b1 fa ff ff       	call   801009f0 <consputc>
80100f3f:	a1 48 98 15 80       	mov    0x80159848,%eax
80100f44:	3b 05 44 98 15 80    	cmp    0x80159844,%eax
80100f4a:	0f 84 c0 fe ff ff    	je     80100e10 <consoleintr+0x20>
80100f50:	83 e8 01             	sub    $0x1,%eax
80100f53:	89 c2                	mov    %eax,%edx
80100f55:	83 e2 7f             	and    $0x7f,%edx
80100f58:	80 ba c0 97 15 80 0a 	cmpb   $0xa,-0x7fea6840(%edx)
80100f5f:	75 cf                	jne    80100f30 <consoleintr+0x140>
80100f61:	e9 aa fe ff ff       	jmp    80100e10 <consoleintr+0x20>
80100f66:	8d 76 00             	lea    0x0(%esi),%esi
80100f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100f70:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f73:	5b                   	pop    %ebx
80100f74:	5e                   	pop    %esi
80100f75:	5f                   	pop    %edi
80100f76:	5d                   	pop    %ebp
80100f77:	e9 14 4a 00 00       	jmp    80105990 <procdump>
80100f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f80:	c6 80 c0 97 15 80 0a 	movb   $0xa,-0x7fea6840(%eax)
80100f87:	b8 0a 00 00 00       	mov    $0xa,%eax
80100f8c:	e8 5f fa ff ff       	call   801009f0 <consputc>
80100f91:	a1 48 98 15 80       	mov    0x80159848,%eax
80100f96:	e9 4e ff ff ff       	jmp    80100ee9 <consoleintr+0xf9>
80100f9b:	90                   	nop
80100f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fa0 <consoleinit>:
80100fa0:	55                   	push   %ebp
80100fa1:	89 e5                	mov    %esp,%ebp
80100fa3:	83 ec 10             	sub    $0x10,%esp
80100fa6:	68 d3 90 10 80       	push   $0x801090d3
80100fab:	68 60 d5 10 80       	push   $0x8010d560
80100fb0:	e8 ab 4b 00 00       	call   80105b60 <initlock>
80100fb5:	58                   	pop    %eax
80100fb6:	5a                   	pop    %edx
80100fb7:	6a 00                	push   $0x0
80100fb9:	6a 01                	push   $0x1
80100fbb:	c7 05 2c a5 15 80 e0 	movl   $0x80100be0,0x8015a52c
80100fc2:	0b 10 80 
80100fc5:	c7 05 28 a5 15 80 50 	movl   $0x80100850,0x8015a528
80100fcc:	08 10 80 
80100fcf:	c7 05 94 d5 10 80 01 	movl   $0x1,0x8010d594
80100fd6:	00 00 00 
80100fd9:	e8 b2 1f 00 00       	call   80102f90 <ioapicenable>
80100fde:	83 c4 10             	add    $0x10,%esp
80100fe1:	c9                   	leave  
80100fe2:	c3                   	ret    
80100fe3:	66 90                	xchg   %ax,%ax
80100fe5:	66 90                	xchg   %ax,%ax
80100fe7:	66 90                	xchg   %ax,%ax
80100fe9:	66 90                	xchg   %ax,%ax
80100feb:	66 90                	xchg   %ax,%ax
80100fed:	66 90                	xchg   %ax,%ax
80100fef:	90                   	nop

80100ff0 <exec>:
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	57                   	push   %edi
80100ff4:	56                   	push   %esi
80100ff5:	53                   	push   %ebx
80100ff6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100ffc:	e8 5f 41 00 00       	call   80105160 <myproc>
80101001:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80101007:	e8 54 28 00 00       	call   80103860 <begin_op>
8010100c:	83 ec 0c             	sub    $0xc,%esp
8010100f:	ff 75 08             	pushl  0x8(%ebp)
80101012:	e8 89 1b 00 00       	call   80102ba0 <namei>
80101017:	83 c4 10             	add    $0x10,%esp
8010101a:	85 c0                	test   %eax,%eax
8010101c:	0f 84 91 01 00 00    	je     801011b3 <exec+0x1c3>
80101022:	83 ec 0c             	sub    $0xc,%esp
80101025:	89 c3                	mov    %eax,%ebx
80101027:	50                   	push   %eax
80101028:	e8 13 13 00 00       	call   80102340 <ilock>
8010102d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80101033:	6a 34                	push   $0x34
80101035:	6a 00                	push   $0x0
80101037:	50                   	push   %eax
80101038:	53                   	push   %ebx
80101039:	e8 e2 15 00 00       	call   80102620 <readi>
8010103e:	83 c4 20             	add    $0x20,%esp
80101041:	83 f8 34             	cmp    $0x34,%eax
80101044:	74 22                	je     80101068 <exec+0x78>
80101046:	83 ec 0c             	sub    $0xc,%esp
80101049:	53                   	push   %ebx
8010104a:	e8 81 15 00 00       	call   801025d0 <iunlockput>
8010104f:	e8 7c 28 00 00       	call   801038d0 <end_op>
80101054:	83 c4 10             	add    $0x10,%esp
80101057:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010105c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010105f:	5b                   	pop    %ebx
80101060:	5e                   	pop    %esi
80101061:	5f                   	pop    %edi
80101062:	5d                   	pop    %ebp
80101063:	c3                   	ret    
80101064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101068:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
8010106f:	45 4c 46 
80101072:	75 d2                	jne    80101046 <exec+0x56>
80101074:	e8 37 7c 00 00       	call   80108cb0 <setupkvm>
80101079:	85 c0                	test   %eax,%eax
8010107b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80101081:	74 c3                	je     80101046 <exec+0x56>
80101083:	31 ff                	xor    %edi,%edi
80101085:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
8010108c:	00 
8010108d:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80101093:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80101099:	0f 84 8c 02 00 00    	je     8010132b <exec+0x33b>
8010109f:	31 f6                	xor    %esi,%esi
801010a1:	eb 7f                	jmp    80101122 <exec+0x132>
801010a3:	90                   	nop
801010a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010a8:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
801010af:	75 63                	jne    80101114 <exec+0x124>
801010b1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
801010b7:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
801010bd:	0f 82 86 00 00 00    	jb     80101149 <exec+0x159>
801010c3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
801010c9:	72 7e                	jb     80101149 <exec+0x159>
801010cb:	83 ec 04             	sub    $0x4,%esp
801010ce:	50                   	push   %eax
801010cf:	57                   	push   %edi
801010d0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
801010d6:	e8 f5 79 00 00       	call   80108ad0 <allocuvm>
801010db:	83 c4 10             	add    $0x10,%esp
801010de:	85 c0                	test   %eax,%eax
801010e0:	89 c7                	mov    %eax,%edi
801010e2:	74 65                	je     80101149 <exec+0x159>
801010e4:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
801010ea:	a9 ff 0f 00 00       	test   $0xfff,%eax
801010ef:	75 58                	jne    80101149 <exec+0x159>
801010f1:	83 ec 0c             	sub    $0xc,%esp
801010f4:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
801010fa:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80101100:	53                   	push   %ebx
80101101:	50                   	push   %eax
80101102:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80101108:	e8 03 79 00 00       	call   80108a10 <loaduvm>
8010110d:	83 c4 20             	add    $0x20,%esp
80101110:	85 c0                	test   %eax,%eax
80101112:	78 35                	js     80101149 <exec+0x159>
80101114:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
8010111b:	83 c6 01             	add    $0x1,%esi
8010111e:	39 f0                	cmp    %esi,%eax
80101120:	7e 3d                	jle    8010115f <exec+0x16f>
80101122:	89 f0                	mov    %esi,%eax
80101124:	6a 20                	push   $0x20
80101126:	c1 e0 05             	shl    $0x5,%eax
80101129:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
8010112f:	50                   	push   %eax
80101130:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80101136:	50                   	push   %eax
80101137:	53                   	push   %ebx
80101138:	e8 e3 14 00 00       	call   80102620 <readi>
8010113d:	83 c4 10             	add    $0x10,%esp
80101140:	83 f8 20             	cmp    $0x20,%eax
80101143:	0f 84 5f ff ff ff    	je     801010a8 <exec+0xb8>
80101149:	83 ec 0c             	sub    $0xc,%esp
8010114c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80101152:	e8 d9 7a 00 00       	call   80108c30 <freevm>
80101157:	83 c4 10             	add    $0x10,%esp
8010115a:	e9 e7 fe ff ff       	jmp    80101046 <exec+0x56>
8010115f:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80101165:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
8010116b:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80101171:	83 ec 0c             	sub    $0xc,%esp
80101174:	53                   	push   %ebx
80101175:	e8 56 14 00 00       	call   801025d0 <iunlockput>
8010117a:	e8 51 27 00 00       	call   801038d0 <end_op>
8010117f:	83 c4 0c             	add    $0xc,%esp
80101182:	56                   	push   %esi
80101183:	57                   	push   %edi
80101184:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
8010118a:	e8 41 79 00 00       	call   80108ad0 <allocuvm>
8010118f:	83 c4 10             	add    $0x10,%esp
80101192:	85 c0                	test   %eax,%eax
80101194:	89 c6                	mov    %eax,%esi
80101196:	75 3a                	jne    801011d2 <exec+0x1e2>
80101198:	83 ec 0c             	sub    $0xc,%esp
8010119b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
801011a1:	e8 8a 7a 00 00       	call   80108c30 <freevm>
801011a6:	83 c4 10             	add    $0x10,%esp
801011a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801011ae:	e9 a9 fe ff ff       	jmp    8010105c <exec+0x6c>
801011b3:	e8 18 27 00 00       	call   801038d0 <end_op>
801011b8:	83 ec 0c             	sub    $0xc,%esp
801011bb:	68 ed 90 10 80       	push   $0x801090ed
801011c0:	e8 7b fa ff ff       	call   80100c40 <cprintf>
801011c5:	83 c4 10             	add    $0x10,%esp
801011c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801011cd:	e9 8a fe ff ff       	jmp    8010105c <exec+0x6c>
801011d2:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
801011d8:	83 ec 08             	sub    $0x8,%esp
801011db:	31 ff                	xor    %edi,%edi
801011dd:	89 f3                	mov    %esi,%ebx
801011df:	50                   	push   %eax
801011e0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
801011e6:	e8 65 7b 00 00       	call   80108d50 <clearpteu>
801011eb:	8b 45 0c             	mov    0xc(%ebp),%eax
801011ee:	83 c4 10             	add    $0x10,%esp
801011f1:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
801011f7:	8b 00                	mov    (%eax),%eax
801011f9:	85 c0                	test   %eax,%eax
801011fb:	74 70                	je     8010126d <exec+0x27d>
801011fd:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80101203:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80101209:	eb 0a                	jmp    80101215 <exec+0x225>
8010120b:	90                   	nop
8010120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101210:	83 ff 20             	cmp    $0x20,%edi
80101213:	74 83                	je     80101198 <exec+0x1a8>
80101215:	83 ec 0c             	sub    $0xc,%esp
80101218:	50                   	push   %eax
80101219:	e8 d2 4d 00 00       	call   80105ff0 <strlen>
8010121e:	f7 d0                	not    %eax
80101220:	01 c3                	add    %eax,%ebx
80101222:	8b 45 0c             	mov    0xc(%ebp),%eax
80101225:	5a                   	pop    %edx
80101226:	83 e3 fc             	and    $0xfffffffc,%ebx
80101229:	ff 34 b8             	pushl  (%eax,%edi,4)
8010122c:	e8 bf 4d 00 00       	call   80105ff0 <strlen>
80101231:	83 c0 01             	add    $0x1,%eax
80101234:	50                   	push   %eax
80101235:	8b 45 0c             	mov    0xc(%ebp),%eax
80101238:	ff 34 b8             	pushl  (%eax,%edi,4)
8010123b:	53                   	push   %ebx
8010123c:	56                   	push   %esi
8010123d:	e8 5e 7c 00 00       	call   80108ea0 <copyout>
80101242:	83 c4 20             	add    $0x20,%esp
80101245:	85 c0                	test   %eax,%eax
80101247:	0f 88 4b ff ff ff    	js     80101198 <exec+0x1a8>
8010124d:	8b 45 0c             	mov    0xc(%ebp),%eax
80101250:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80101257:	83 c7 01             	add    $0x1,%edi
8010125a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80101260:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80101263:	85 c0                	test   %eax,%eax
80101265:	75 a9                	jne    80101210 <exec+0x220>
80101267:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
8010126d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80101274:	89 d9                	mov    %ebx,%ecx
80101276:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
8010127d:	00 00 00 00 
80101281:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80101288:	ff ff ff 
8010128b:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80101291:	29 c1                	sub    %eax,%ecx
80101293:	83 c0 0c             	add    $0xc,%eax
80101296:	29 c3                	sub    %eax,%ebx
80101298:	50                   	push   %eax
80101299:	52                   	push   %edx
8010129a:	53                   	push   %ebx
8010129b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
801012a1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
801012a7:	e8 f4 7b 00 00       	call   80108ea0 <copyout>
801012ac:	83 c4 10             	add    $0x10,%esp
801012af:	85 c0                	test   %eax,%eax
801012b1:	0f 88 e1 fe ff ff    	js     80101198 <exec+0x1a8>
801012b7:	8b 45 08             	mov    0x8(%ebp),%eax
801012ba:	0f b6 00             	movzbl (%eax),%eax
801012bd:	84 c0                	test   %al,%al
801012bf:	74 17                	je     801012d8 <exec+0x2e8>
801012c1:	8b 55 08             	mov    0x8(%ebp),%edx
801012c4:	89 d1                	mov    %edx,%ecx
801012c6:	83 c1 01             	add    $0x1,%ecx
801012c9:	3c 2f                	cmp    $0x2f,%al
801012cb:	0f b6 01             	movzbl (%ecx),%eax
801012ce:	0f 44 d1             	cmove  %ecx,%edx
801012d1:	84 c0                	test   %al,%al
801012d3:	75 f1                	jne    801012c6 <exec+0x2d6>
801012d5:	89 55 08             	mov    %edx,0x8(%ebp)
801012d8:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
801012de:	50                   	push   %eax
801012df:	6a 10                	push   $0x10
801012e1:	ff 75 08             	pushl  0x8(%ebp)
801012e4:	89 f8                	mov    %edi,%eax
801012e6:	83 c0 6c             	add    $0x6c,%eax
801012e9:	50                   	push   %eax
801012ea:	e8 c1 4c 00 00       	call   80105fb0 <safestrcpy>
801012ef:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
801012f5:	89 f9                	mov    %edi,%ecx
801012f7:	8b 7f 04             	mov    0x4(%edi),%edi
801012fa:	8b 41 18             	mov    0x18(%ecx),%eax
801012fd:	89 31                	mov    %esi,(%ecx)
801012ff:	89 51 04             	mov    %edx,0x4(%ecx)
80101302:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80101308:	89 50 38             	mov    %edx,0x38(%eax)
8010130b:	8b 41 18             	mov    0x18(%ecx),%eax
8010130e:	89 58 44             	mov    %ebx,0x44(%eax)
80101311:	89 0c 24             	mov    %ecx,(%esp)
80101314:	e8 67 75 00 00       	call   80108880 <switchuvm>
80101319:	89 3c 24             	mov    %edi,(%esp)
8010131c:	e8 0f 79 00 00       	call   80108c30 <freevm>
80101321:	83 c4 10             	add    $0x10,%esp
80101324:	31 c0                	xor    %eax,%eax
80101326:	e9 31 fd ff ff       	jmp    8010105c <exec+0x6c>
8010132b:	be 00 20 00 00       	mov    $0x2000,%esi
80101330:	e9 3c fe ff ff       	jmp    80101171 <exec+0x181>
80101335:	66 90                	xchg   %ax,%ax
80101337:	66 90                	xchg   %ax,%ax
80101339:	66 90                	xchg   %ax,%ax
8010133b:	66 90                	xchg   %ax,%ax
8010133d:	66 90                	xchg   %ax,%ax
8010133f:	90                   	nop

80101340 <e1000_tx_init>:

uint8_t mac_addr[6];

int
e1000_tx_init(void) 
{
80101340:	55                   	push   %ebp
80101341:	89 e5                	mov    %esp,%ebp
80101343:	83 ec 0c             	sub    $0xc,%esp
    assert(sizeof(struct e1000_tx_desc) == 16);
    assert(((uint32_t)(&tx_queue[0]) & 0xf) == 0);
    assert(sizeof(tx_queue) % 128 == 0);
	
    // Initialize packet buffers
    memset(tx_queue, 0, sizeof(tx_queue));
80101346:	68 00 01 00 00       	push   $0x100
8010134b:	6a 00                	push   $0x0
8010134d:	68 80 3c 15 80       	push   $0x80153c80
80101352:	e8 79 4a 00 00       	call   80105dd0 <memset>
80101357:	b8 a0 dd 14 00       	mov    $0x14dda0,%eax
8010135c:	83 c4 10             	add    $0x10,%esp
8010135f:	ba 80 3c 15 80       	mov    $0x80153c80,%edx
80101364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i < NTXDESC; i++) 
        tx_queue[i].buff_addr = V2P(tx_buffs[i]);
80101368:	89 02                	mov    %eax,(%edx)
8010136a:	05 ee 05 00 00       	add    $0x5ee,%eax
8010136f:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
80101376:	83 c2 10             	add    $0x10,%edx
    assert(((uint32_t)(&tx_queue[0]) & 0xf) == 0);
    assert(sizeof(tx_queue) % 128 == 0);
	
    // Initialize packet buffers
    memset(tx_queue, 0, sizeof(tx_queue));
    for (i = 0; i < NTXDESC; i++) 
80101379:	3d 80 3c 15 00       	cmp    $0x153c80,%eax
8010137e:	75 e8                	jne    80101368 <e1000_tx_init+0x28>
        tx_queue[i].buff_addr = V2P(tx_buffs[i]);
    
    // Initialize regs of transmit descriptor ring (a.k.a. transmit queue)
    E1000_REG(E1000_TDBAL) = V2P(tx_queue); 
80101380:	a1 54 98 15 80       	mov    0x80159854,%eax
80101385:	c7 80 00 38 00 00 80 	movl   $0x153c80,0x3800(%eax)
8010138c:	3c 15 00 
    E1000_REG(E1000_TDBAH) = 0;
8010138f:	c7 80 04 38 00 00 00 	movl   $0x0,0x3804(%eax)
80101396:	00 00 00 
    E1000_REG(E1000_TDLEN) = sizeof(tx_queue);
80101399:	c7 80 08 38 00 00 00 	movl   $0x100,0x3808(%eax)
801013a0:	01 00 00 
    E1000_REG(E1000_TDH)   = 0;
801013a3:	c7 80 10 38 00 00 00 	movl   $0x0,0x3810(%eax)
801013aa:	00 00 00 
    E1000_REG(E1000_TDT)   = 0;
801013ad:	c7 80 18 38 00 00 00 	movl   $0x0,0x3818(%eax)
801013b4:	00 00 00 
    // Program TCTL & TIPG
//#define E1000_TCTL           0x00400    /* Transmit Control - R/W */
//#define E1000_TCTL_EN     0x00000002    /* enable */
//#define E1000_TCTL_PSP    0x00000008    /* pad short packets */
//#define E1000_TCTL_COLD   0x003ff000    /* collision distance */
    E1000_REG(E1000_TCTL) |= E1000_TCTL_EN;
801013b7:	8b 90 00 04 00 00    	mov    0x400(%eax),%edx
801013bd:	83 ca 02             	or     $0x2,%edx
801013c0:	89 90 00 04 00 00    	mov    %edx,0x400(%eax)
    E1000_REG(E1000_TCTL) |= E1000_TCTL_PSP;
801013c6:	8b 90 00 04 00 00    	mov    0x400(%eax),%edx
801013cc:	83 ca 08             	or     $0x8,%edx
801013cf:	89 90 00 04 00 00    	mov    %edx,0x400(%eax)

    E1000_REG(E1000_TCTL) &= ~E1000_TCTL_COLD;
801013d5:	8b 90 00 04 00 00    	mov    0x400(%eax),%edx
801013db:	81 e2 ff 0f c0 ff    	and    $0xffc00fff,%edx
801013e1:	89 90 00 04 00 00    	mov    %edx,0x400(%eax)
    E1000_REG(E1000_TCTL) |= 0x00040000; // TCTL.COLD: 40h
801013e7:	8b 90 00 04 00 00    	mov    0x400(%eax),%edx
801013ed:	81 ca 00 00 04 00    	or     $0x40000,%edx
801013f3:	89 90 00 04 00 00    	mov    %edx,0x400(%eax)

    E1000_REG(E1000_TIPG)  = 10;
801013f9:	c7 80 10 04 00 00 0a 	movl   $0xa,0x410(%eax)
80101400:	00 00 00 
    
    return 0;
}
80101403:	31 c0                	xor    %eax,%eax
80101405:	c9                   	leave  
80101406:	c3                   	ret    
80101407:	89 f6                	mov    %esi,%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101410 <e1000_rx_init>:

int
e1000_rx_init(void)
{
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	83 ec 0c             	sub    $0xc,%esp
    int i;
    memset(rx_queue, 0, sizeof(rx_queue));
80101416:	68 00 08 00 00       	push   $0x800
8010141b:	6a 00                	push   $0x0
8010141d:	68 a0 d5 14 80       	push   $0x8014d5a0
80101422:	e8 a9 49 00 00       	call   80105dd0 <memset>
80101427:	b8 a0 d5 10 00       	mov    $0x10d5a0,%eax
8010142c:	83 c4 10             	add    $0x10,%esp
8010142f:	ba a0 d5 14 80       	mov    $0x8014d5a0,%edx
80101434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i < NRXDESC; i++)
        rx_queue[i].buff_addr = V2P(rx_buffs[i]);
80101438:	89 02                	mov    %eax,(%edx)
8010143a:	05 00 08 00 00       	add    $0x800,%eax
8010143f:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
80101446:	83 c2 10             	add    $0x10,%edx
int
e1000_rx_init(void)
{
    int i;
    memset(rx_queue, 0, sizeof(rx_queue));
    for (i = 0; i < NRXDESC; i++)
80101449:	3d a0 d5 14 00       	cmp    $0x14d5a0,%eax
8010144e:	75 e8                	jne    80101438 <e1000_rx_init+0x28>
        rx_queue[i].buff_addr = V2P(rx_buffs[i]);
    
    // configure the Receive Adress Registers with the card's 
    // own MAC address ( 52:54:00:12:34:56 ) in order to accept
    // packets addressed to the card
    E1000_REG(E1000_RAL0)  = 0x12005452;
80101450:	a1 54 98 15 80       	mov    0x80159854,%eax
80101455:	c7 80 00 54 00 00 52 	movl   $0x12005452,0x5400(%eax)
8010145c:	54 00 12 
    E1000_REG(E1000_RAH0)  = 0x80005634;   
8010145f:	c7 80 04 54 00 00 34 	movl   $0x80005634,0x5404(%eax)
80101466:	56 00 80 
   uint32_t macaddr_l = E1000_REG(E1000_RAL0);
80101469:	8b 88 00 54 00 00    	mov    0x5400(%eax),%ecx
  uint32_t macaddr_h = E1000_REG(E1000_RAH0);
8010146f:	8b 90 04 54 00 00    	mov    0x5404(%eax),%edx
  *(uint32_t*)mac_addr = macaddr_l;
  *(uint16_t*)(&mac_addr[4]) = (uint16_t)macaddr_h;
  *(uint32_t*)mac_addr = macaddr_l;
  *(uint32_t*)(&mac_addr[4]) = (uint16_t)macaddr_h; 
80101475:	81 e2 ff ff 00 00    	and    $0xffff,%edx
    // packets addressed to the card
    E1000_REG(E1000_RAL0)  = 0x12005452;
    E1000_REG(E1000_RAH0)  = 0x80005634;   
   uint32_t macaddr_l = E1000_REG(E1000_RAL0);
  uint32_t macaddr_h = E1000_REG(E1000_RAH0);
  *(uint32_t*)mac_addr = macaddr_l;
8010147b:	89 0d 4c 98 15 80    	mov    %ecx,0x8015984c
  *(uint16_t*)(&mac_addr[4]) = (uint16_t)macaddr_h;
  *(uint32_t*)mac_addr = macaddr_l;
  *(uint32_t*)(&mac_addr[4]) = (uint16_t)macaddr_h; 
80101481:	89 15 50 98 15 80    	mov    %edx,0x80159850

    // initialize regs of receive descriptor ring
    E1000_REG(E1000_RDBAL) = V2P(rx_queue); 
80101487:	c7 80 00 28 00 00 a0 	movl   $0x14d5a0,0x2800(%eax)
8010148e:	d5 14 00 
    E1000_REG(E1000_RDBAH) = 0;
80101491:	c7 80 04 28 00 00 00 	movl   $0x0,0x2804(%eax)
80101498:	00 00 00 
    E1000_REG(E1000_RDLEN) = sizeof(rx_queue);
8010149b:	c7 80 08 28 00 00 00 	movl   $0x800,0x2808(%eax)
801014a2:	08 00 00 
    E1000_REG(E1000_RDH)   = 0;
801014a5:	c7 80 10 28 00 00 00 	movl   $0x0,0x2810(%eax)
801014ac:	00 00 00 
    E1000_REG(E1000_RDT)   = NRXDESC - 1;
801014af:	c7 80 18 28 00 00 7f 	movl   $0x7f,0x2818(%eax)
801014b6:	00 00 00 
    
    // enable receive
    E1000_REG(E1000_RCTL) |= E1000_RCTL_EN;
801014b9:	8b 90 00 01 00 00    	mov    0x100(%eax),%edx
801014bf:	83 ca 02             	or     $0x2,%edx
801014c2:	89 90 00 01 00 00    	mov    %edx,0x100(%eax)
    
    // configure e1000 to strip the Ethernet CRC
    E1000_REG(E1000_RCTL) |= E1000_RCTL_SECRC;
801014c8:	8b 90 00 01 00 00    	mov    0x100(%eax),%edx
801014ce:	81 ca 00 00 00 04    	or     $0x4000000,%edx
801014d4:	89 90 00 01 00 00    	mov    %edx,0x100(%eax)

    E1000_REG(E1000_RCTL) |=        E1000_RCTL_UPE;    /* unicast promiscuous enable */
801014da:	8b 90 00 01 00 00    	mov    0x100(%eax),%edx
801014e0:	83 ca 08             	or     $0x8,%edx
801014e3:	89 90 00 01 00 00    	mov    %edx,0x100(%eax)
    E1000_REG(E1000_RCTL) |=       E1000_RCTL_MPE;
801014e9:	8b 90 00 01 00 00    	mov    0x100(%eax),%edx
801014ef:	83 ca 10             	or     $0x10,%edx
801014f2:	89 90 00 01 00 00    	mov    %edx,0x100(%eax)
     
    return 0;
}
801014f8:	31 c0                	xor    %eax,%eax
801014fa:	c9                   	leave  
801014fb:	c3                   	ret    
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <e1000_transmit>:

int 
e1000_transmit(const void *data, size_t len) 
{
80101500:	55                   	push   %ebp
    uint32_t tail = E1000_REG(E1000_TDT);
80101501:	a1 54 98 15 80       	mov    0x80159854,%eax
    return 0;
}

int 
e1000_transmit(const void *data, size_t len) 
{
80101506:	89 e5                	mov    %esp,%ebp
80101508:	56                   	push   %esi
80101509:	53                   	push   %ebx
8010150a:	8b 75 0c             	mov    0xc(%ebp),%esi
    uint32_t tail = E1000_REG(E1000_TDT);
8010150d:	8b 98 18 38 00 00    	mov    0x3818(%eax),%ebx

    if (len > TX_PKT_BUFF_SIZE)
80101513:	81 fe ee 05 00 00    	cmp    $0x5ee,%esi
80101519:	77 65                	ja     80101580 <e1000_transmit+0x80>
        return -E_PKT_TOO_LONG;	

    if ((tx_queue[tail].cmd & E1000_TXD_CMD_RS) 
8010151b:	89 d8                	mov    %ebx,%eax
8010151d:	c1 e0 04             	shl    $0x4,%eax
80101520:	05 80 3c 15 80       	add    $0x80153c80,%eax
80101525:	f6 40 0b 08          	testb  $0x8,0xb(%eax)
80101529:	74 06                	je     80101531 <e1000_transmit+0x31>
        && !(tx_queue[tail].sta & E1000_TXD_STA_DD))
8010152b:	f6 40 0c 01          	testb  $0x1,0xc(%eax)
8010152f:	74 5f                	je     80101590 <e1000_transmit+0x90>
        return -E_TX_FULL;

    memcpy(tx_buffs[tail], data, len);
80101531:	69 c3 ee 05 00 00    	imul   $0x5ee,%ebx,%eax
80101537:	83 ec 04             	sub    $0x4,%esp
8010153a:	56                   	push   %esi
8010153b:	ff 75 08             	pushl  0x8(%ebp)
8010153e:	05 a0 dd 14 80       	add    $0x8014dda0,%eax
80101543:	50                   	push   %eax
80101544:	e8 97 49 00 00       	call   80105ee0 <memcpy>
    tx_queue[tail].length = len;
80101549:	89 d8                	mov    %ebx,%eax
    tx_queue[tail].cmd |= E1000_TXD_CMD_RS | E1000_TXD_CMD_EOP;
    tx_queue[tail].sta &= ~E1000_TXD_STA_DD;

    E1000_REG(E1000_TDT) = (tail + 1) % NTXDESC;
8010154b:	83 c3 01             	add    $0x1,%ebx
   
    return 0;
8010154e:	83 c4 10             	add    $0x10,%esp
    if ((tx_queue[tail].cmd & E1000_TXD_CMD_RS) 
        && !(tx_queue[tail].sta & E1000_TXD_STA_DD))
        return -E_TX_FULL;

    memcpy(tx_buffs[tail], data, len);
    tx_queue[tail].length = len;
80101551:	c1 e0 04             	shl    $0x4,%eax
    tx_queue[tail].cmd |= E1000_TXD_CMD_RS | E1000_TXD_CMD_EOP;
    tx_queue[tail].sta &= ~E1000_TXD_STA_DD;

    E1000_REG(E1000_TDT) = (tail + 1) % NTXDESC;
80101554:	83 e3 0f             	and    $0xf,%ebx
    if ((tx_queue[tail].cmd & E1000_TXD_CMD_RS) 
        && !(tx_queue[tail].sta & E1000_TXD_STA_DD))
        return -E_TX_FULL;

    memcpy(tx_buffs[tail], data, len);
    tx_queue[tail].length = len;
80101557:	66 89 b0 88 3c 15 80 	mov    %si,-0x7feac378(%eax)
8010155e:	05 80 3c 15 80       	add    $0x80153c80,%eax
    tx_queue[tail].cmd |= E1000_TXD_CMD_RS | E1000_TXD_CMD_EOP;
80101563:	80 48 0b 09          	orb    $0x9,0xb(%eax)
    tx_queue[tail].sta &= ~E1000_TXD_STA_DD;
80101567:	80 60 0c fe          	andb   $0xfe,0xc(%eax)

    E1000_REG(E1000_TDT) = (tail + 1) % NTXDESC;
8010156b:	a1 54 98 15 80       	mov    0x80159854,%eax
80101570:	89 98 18 38 00 00    	mov    %ebx,0x3818(%eax)
   
    return 0;
80101576:	31 c0                	xor    %eax,%eax
}
80101578:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010157b:	5b                   	pop    %ebx
8010157c:	5e                   	pop    %esi
8010157d:	5d                   	pop    %ebp
8010157e:	c3                   	ret    
8010157f:	90                   	nop
e1000_transmit(const void *data, size_t len) 
{
    uint32_t tail = E1000_REG(E1000_TDT);

    if (len > TX_PKT_BUFF_SIZE)
        return -E_PKT_TOO_LONG;	
80101580:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101585:	eb f1                	jmp    80101578 <e1000_transmit+0x78>
80101587:	89 f6                	mov    %esi,%esi
80101589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

    if ((tx_queue[tail].cmd & E1000_TXD_CMD_RS) 
        && !(tx_queue[tail].sta & E1000_TXD_STA_DD))
        return -E_TX_FULL;
80101590:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
80101595:	eb e1                	jmp    80101578 <e1000_transmit+0x78>
80101597:	89 f6                	mov    %esi,%esi
80101599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801015a0 <parse1>:
    "NS",
};



void parse1(char *packet, int len){
801015a0:	55                   	push   %ebp
801015a1:	89 e5                	mov    %esp,%ebp
801015a3:	57                   	push   %edi
801015a4:	56                   	push   %esi
801015a5:	53                   	push   %ebx
801015a6:	83 ec 24             	sub    $0x24,%esp
801015a9:	8b 75 08             	mov    0x8(%ebp),%esi

    int  j;
    printf("len =%d\n",len);
801015ac:	ff 75 0c             	pushl  0xc(%ebp)
801015af:	68 f9 90 10 80       	push   $0x801090f9
801015b4:	8d 7e 06             	lea    0x6(%esi),%edi
801015b7:	e8 84 f6 ff ff       	call   80100c40 <cprintf>

    // Exract the IP Layer - MAC header = 14 bytes
    ip = (struct ip_h *)(&packet[sizeof(*ethernet)]);

    // Print the MAC source address
    printf("\nMAC HEADER");
801015bc:	c7 04 24 02 91 10 80 	movl   $0x80109102,(%esp)
    printf("\nMAC src:\t");
801015c3:	89 fb                	mov    %edi,%ebx

    // Exract the IP Layer - MAC header = 14 bytes
    ip = (struct ip_h *)(&packet[sizeof(*ethernet)]);

    // Print the MAC source address
    printf("\nMAC HEADER");
801015c5:	e8 76 f6 ff ff       	call   80100c40 <cprintf>
    printf("\nMAC src:\t");
801015ca:	c7 04 24 0e 91 10 80 	movl   $0x8010910e,(%esp)
801015d1:	e8 6a f6 ff ff       	call   80100c40 <cprintf>
801015d6:	8d 46 0c             	lea    0xc(%esi),%eax
801015d9:	83 c4 10             	add    $0x10,%esp
801015dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801015df:	90                   	nop
    for(j=0;j<6;j++)
    {
        printf("%x:", ethernet->srcAddress[j]);
801015e0:	0f b6 13             	movzbl (%ebx),%edx
801015e3:	83 ec 08             	sub    $0x8,%esp
801015e6:	83 c3 01             	add    $0x1,%ebx
801015e9:	52                   	push   %edx
801015ea:	68 19 91 10 80       	push   $0x80109119
801015ef:	e8 4c f6 ff ff       	call   80100c40 <cprintf>
    ip = (struct ip_h *)(&packet[sizeof(*ethernet)]);

    // Print the MAC source address
    printf("\nMAC HEADER");
    printf("\nMAC src:\t");
    for(j=0;j<6;j++)
801015f4:	83 c4 10             	add    $0x10,%esp
801015f7:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
801015fa:	75 e4                	jne    801015e0 <parse1+0x40>
        printf("%x:", ethernet->srcAddress[j]);
        
    }
    
    // Print the MAC destination address
    printf("\nMAC dest:\t");
801015fc:	83 ec 0c             	sub    $0xc,%esp
801015ff:	89 f3                	mov    %esi,%ebx
80101601:	68 1d 91 10 80       	push   $0x8010911d
80101606:	e8 35 f6 ff ff       	call   80100c40 <cprintf>
8010160b:	83 c4 10             	add    $0x10,%esp
8010160e:	66 90                	xchg   %ax,%ax
    for(j=0;j<6;j++)
    {
        printf("%d:", ethernet->destAddress[j]);
80101610:	0f b6 03             	movzbl (%ebx),%eax
80101613:	83 ec 08             	sub    $0x8,%esp
80101616:	83 c3 01             	add    $0x1,%ebx
80101619:	50                   	push   %eax
8010161a:	68 29 91 10 80       	push   $0x80109129
8010161f:	e8 1c f6 ff ff       	call   80100c40 <cprintf>
        
    }
    
    // Print the MAC destination address
    printf("\nMAC dest:\t");
    for(j=0;j<6;j++)
80101624:	83 c4 10             	add    $0x10,%esp
80101627:	39 df                	cmp    %ebx,%edi
80101629:	75 e5                	jne    80101610 <parse1+0x70>
        printf("%d:", ethernet->destAddress[j]);
        
    }

    // Print the EtherType or an error
    printf("\nEtherType:\t");
8010162b:	83 ec 0c             	sub    $0xc,%esp
8010162e:	68 2d 91 10 80       	push   $0x8010912d
80101633:	e8 08 f6 ff ff       	call   80100c40 <cprintf>
80101638:	0f b6 46 0c          	movzbl 0xc(%esi),%eax
8010163c:	0f b6 56 0d          	movzbl 0xd(%esi),%edx
80101640:	83 c4 10             	add    $0x10,%esp
80101643:	01 c2                	add    %eax,%edx
    int foundEtherType = -1;
    for(j=0;j<8;j++)
80101645:	31 c0                	xor    %eax,%eax
80101647:	89 f6                	mov    %esi,%esi
80101649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    {
        // Compare the sum of the two etherType bytes with the above list, find the correct index
        if ((ethernet->etherType[0] + ethernet->etherType[1]) == etherType_HEX[j]){
80101650:	3b 14 85 c0 b1 10 80 	cmp    -0x7fef4e40(,%eax,4),%edx
80101657:	0f 84 cb 00 00 00    	je     80101728 <parse1+0x188>
    }

    // Print the EtherType or an error
    printf("\nEtherType:\t");
    int foundEtherType = -1;
    for(j=0;j<8;j++)
8010165d:	83 c0 01             	add    $0x1,%eax
80101660:	83 f8 08             	cmp    $0x8,%eax
80101663:	75 eb                	jne    80101650 <parse1+0xb0>
            break;
        }            
    }
    // Display an error if the EtherType wasn't found
    if (foundEtherType == -1){
        printf("Error Type Not Found\n");
80101665:	83 ec 0c             	sub    $0xc,%esp
80101668:	bf 58 b0 10 80       	mov    $0x8010b058,%edi
8010166d:	68 01 92 10 80       	push   $0x80109201
80101672:	e8 c9 f5 ff ff       	call   80100c40 <cprintf>
80101677:	83 c4 10             	add    $0x10,%esp
    }

    // Print the IP source address
    printf("\nIP LAYER");
8010167a:	83 ec 0c             	sub    $0xc,%esp
    printf("\nIP src: \t");
    for(j=0;j<4;j++)
8010167d:	31 db                	xor    %ebx,%ebx
    if (foundEtherType == -1){
        printf("Error Type Not Found\n");
    }

    // Print the IP source address
    printf("\nIP LAYER");
8010167f:	68 3a 91 10 80       	push   $0x8010913a
80101684:	e8 b7 f5 ff ff       	call   80100c40 <cprintf>
    printf("\nIP src: \t");
80101689:	c7 04 24 44 91 10 80 	movl   $0x80109144,(%esp)
80101690:	e8 ab f5 ff ff       	call   80100c40 <cprintf>
80101695:	83 c4 10             	add    $0x10,%esp
    for(j=0;j<4;j++)
    {
        printf("%d.", ip->srcAddress[j]);
80101698:	0f b6 44 1e 1a       	movzbl 0x1a(%esi,%ebx,1),%eax
8010169d:	83 ec 08             	sub    $0x8,%esp
    }

    // Print the IP source address
    printf("\nIP LAYER");
    printf("\nIP src: \t");
    for(j=0;j<4;j++)
801016a0:	83 c3 01             	add    $0x1,%ebx
    {
        printf("%d.", ip->srcAddress[j]);
801016a3:	50                   	push   %eax
801016a4:	68 4f 91 10 80       	push   $0x8010914f
801016a9:	e8 92 f5 ff ff       	call   80100c40 <cprintf>
    }

    // Print the IP source address
    printf("\nIP LAYER");
    printf("\nIP src: \t");
    for(j=0;j<4;j++)
801016ae:	83 c4 10             	add    $0x10,%esp
801016b1:	83 fb 04             	cmp    $0x4,%ebx
801016b4:	75 e2                	jne    80101698 <parse1+0xf8>
        printf("%d.", ip->srcAddress[j]);
        
    }

    // Print the IP destination address
    printf("\nIP dest:\t");
801016b6:	83 ec 0c             	sub    $0xc,%esp
    for(j=0;j<4;j++)
801016b9:	31 db                	xor    %ebx,%ebx
        printf("%d.", ip->srcAddress[j]);
        
    }

    // Print the IP destination address
    printf("\nIP dest:\t");
801016bb:	68 53 91 10 80       	push   $0x80109153
801016c0:	e8 7b f5 ff ff       	call   80100c40 <cprintf>
801016c5:	83 c4 10             	add    $0x10,%esp
    for(j=0;j<4;j++)
    {
        printf("%d.", ip->destAddress[j]);
801016c8:	0f b6 44 1e 1e       	movzbl 0x1e(%esi,%ebx,1),%eax
801016cd:	83 ec 08             	sub    $0x8,%esp
        
    }

    // Print the IP destination address
    printf("\nIP dest:\t");
    for(j=0;j<4;j++)
801016d0:	83 c3 01             	add    $0x1,%ebx
    {
        printf("%d.", ip->destAddress[j]);
801016d3:	50                   	push   %eax
801016d4:	68 4f 91 10 80       	push   $0x8010914f
801016d9:	e8 62 f5 ff ff       	call   80100c40 <cprintf>
        
    }

    // Print the IP destination address
    printf("\nIP dest:\t");
    for(j=0;j<4;j++)
801016de:	83 c4 10             	add    $0x10,%esp
801016e1:	83 fb 04             	cmp    $0x4,%ebx
801016e4:	75 e2                	jne    801016c8 <parse1+0x128>
        printf("%d.", ip->destAddress[j]);
        
    }
    
    // Check if we are using ARP else check for TCP or UDP
    if (etherType_STR[foundEtherType] == etherType_STR[4]){
801016e6:	81 ff 20 b1 10 80    	cmp    $0x8010b120,%edi
801016ec:	0f 84 53 01 00 00    	je     80101845 <parse1+0x2a5>
        printf("\nIP protocol:\tARP\n");
        printf("\nPacket Type:\tAddress Resolution Protocol\n\n");
    }
    else{
        // Print the IP protocol as either TCP, UDP or (Unknown) *hex_val*
        if (ip->protocol == 0x06){
801016f2:	0f b6 46 17          	movzbl 0x17(%esi),%eax
801016f6:	3c 06                	cmp    $0x6,%al
801016f8:	74 76                	je     80101770 <parse1+0x1d0>
            }
            if (flagIndex == -1){
                printf("\tERROR TCP Flag Missing\n");
            }           
        }
        else if (ip->protocol == 0x11){
801016fa:	3c 11                	cmp    $0x11,%al
801016fc:	74 52                	je     80101750 <parse1+0x1b0>
            printf("\nIP protocol:\tUDP\n");
            printf("\nPacket Type:\tUser Datagram Protocol\n\n");
        }
        else{
            printf("\nIP protocol:\t(Unknown) %x\n", ip->protocol);
801016fe:	83 ec 08             	sub    $0x8,%esp
80101701:	50                   	push   %eax
80101702:	68 e5 91 10 80       	push   $0x801091e5
80101707:	e8 34 f5 ff ff       	call   80100c40 <cprintf>
8010170c:	83 c4 10             	add    $0x10,%esp
        }
        else{
            printf("2. Packet is the last fragment or non fragmented\n");
        }
        */
        printf("\n");
8010170f:	c7 45 08 37 a0 10 80 	movl   $0x8010a037,0x8(%ebp)
    }
     
}
80101716:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101719:	5b                   	pop    %ebx
8010171a:	5e                   	pop    %esi
8010171b:	5f                   	pop    %edi
8010171c:	5d                   	pop    %ebp
        }
        else{
            printf("2. Packet is the last fragment or non fragmented\n");
        }
        */
        printf("\n");
8010171d:	e9 1e f5 ff ff       	jmp    80100c40 <cprintf>
80101722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int foundEtherType = -1;
    for(j=0;j<8;j++)
    {
        // Compare the sum of the two etherType bytes with the above list, find the correct index
        if ((ethernet->etherType[0] + ethernet->etherType[1]) == etherType_HEX[j]){
            printf("%s\n", etherType_STR[j]);
80101728:	8d 04 80             	lea    (%eax,%eax,4),%eax
8010172b:	83 ec 08             	sub    $0x8,%esp
8010172e:	8d 3c c5 80 b0 10 80 	lea    -0x7fef4f80(,%eax,8),%edi
80101735:	57                   	push   %edi
80101736:	68 b5 91 10 80       	push   $0x801091b5
8010173b:	e8 00 f5 ff ff       	call   80100c40 <cprintf>
80101740:	83 c4 10             	add    $0x10,%esp
80101743:	e9 32 ff ff ff       	jmp    8010167a <parse1+0xda>
80101748:	90                   	nop
80101749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            if (flagIndex == -1){
                printf("\tERROR TCP Flag Missing\n");
            }           
        }
        else if (ip->protocol == 0x11){
            printf("\nIP protocol:\tUDP\n");
80101750:	83 ec 0c             	sub    $0xc,%esp
80101753:	68 d2 91 10 80       	push   $0x801091d2
80101758:	e8 e3 f4 ff ff       	call   80100c40 <cprintf>
            printf("\nPacket Type:\tUser Datagram Protocol\n\n");
8010175d:	c7 04 24 80 92 10 80 	movl   $0x80109280,(%esp)
80101764:	e8 d7 f4 ff ff       	call   80100c40 <cprintf>
80101769:	83 c4 10             	add    $0x10,%esp
8010176c:	eb a1                	jmp    8010170f <parse1+0x16f>
8010176e:	66 90                	xchg   %ax,%ax
        printf("\nPacket Type:\tAddress Resolution Protocol\n\n");
    }
    else{
        // Print the IP protocol as either TCP, UDP or (Unknown) *hex_val*
        if (ip->protocol == 0x06){
            printf("\nIP protocol:\tTCP\n");
80101770:	83 ec 0c             	sub    $0xc,%esp
80101773:	bf 00 b0 10 80       	mov    $0x8010b000,%edi
80101778:	68 71 91 10 80       	push   $0x80109171
8010177d:	e8 be f4 ff ff       	call   80100c40 <cprintf>

            // Print the TCP Packet Info
            printf("\nPacket Type:\tTransmission Control Protocol");
80101782:	c7 04 24 54 92 10 80 	movl   $0x80109254,(%esp)
80101789:	e8 b2 f4 ff ff       	call   80100c40 <cprintf>

            // Exract the TCP Info - MAC header + IP Layer
            tcp = (struct tcp_h *)(&packet[sizeof(*ip)+sizeof(*ethernet)]);

            // Print Source Port
            printf("\nTCP src port:\t");
8010178e:	c7 04 24 84 91 10 80 	movl   $0x80109184,(%esp)
80101795:	e8 a6 f4 ff ff       	call   80100c40 <cprintf>
            uint16_t port = (tcp->src_port[0] << 8) | tcp->src_port[1];
            printf("%d", port);
8010179a:	58                   	pop    %eax
8010179b:	0f b6 46 22          	movzbl 0x22(%esi),%eax
8010179f:	5a                   	pop    %edx
801017a0:	0f b6 56 23          	movzbl 0x23(%esi),%edx
801017a4:	c1 e0 08             	shl    $0x8,%eax
801017a7:	09 d0                	or     %edx,%eax
801017a9:	0f b7 c0             	movzwl %ax,%eax
801017ac:	50                   	push   %eax
801017ad:	68 94 91 10 80       	push   $0x80109194
801017b2:	e8 89 f4 ff ff       	call   80100c40 <cprintf>

            // Print Destination Port
            printf("\nTCP dest port:\t");
801017b7:	c7 04 24 97 91 10 80 	movl   $0x80109197,(%esp)
801017be:	e8 7d f4 ff ff       	call   80100c40 <cprintf>
            port = (tcp->dest_port[0] << 8) | tcp->dest_port[1];
            printf("%d", port);
801017c3:	0f b6 46 24          	movzbl 0x24(%esi),%eax
801017c7:	0f b6 56 25          	movzbl 0x25(%esi),%edx
801017cb:	59                   	pop    %ecx
801017cc:	5b                   	pop    %ebx

            // Print Flags
            printf("\nTCP Flags:");
801017cd:	31 db                	xor    %ebx,%ebx
            printf("%d", port);

            // Print Destination Port
            printf("\nTCP dest port:\t");
            port = (tcp->dest_port[0] << 8) | tcp->dest_port[1];
            printf("%d", port);
801017cf:	c1 e0 08             	shl    $0x8,%eax
801017d2:	09 d0                	or     %edx,%eax
801017d4:	0f b7 c0             	movzwl %ax,%eax
801017d7:	50                   	push   %eax
801017d8:	68 94 91 10 80       	push   $0x80109194
801017dd:	e8 5e f4 ff ff       	call   80100c40 <cprintf>

            // Print Flags
            printf("\nTCP Flags:");
801017e2:	c7 04 24 a8 91 10 80 	movl   $0x801091a8,(%esp)
801017e9:	e8 52 f4 ff ff       	call   80100c40 <cprintf>
801017ee:	83 c4 10             	add    $0x10,%esp
801017f1:	ba ff ff ff ff       	mov    $0xffffffff,%edx
            int flagIndex = -1;
            for(j=0;j<sizeof(*tcp_flag_anding_vals);j++){
                if((tcp->offset_res_flag[1] & tcp_flag_anding_vals[j]) != 0){
801017f6:	0f b6 46 2f          	movzbl 0x2f(%esi),%eax
801017fa:	85 04 9d 40 b0 10 80 	test   %eax,-0x7fef4fc0(,%ebx,4)
80101801:	75 2d                	jne    80101830 <parse1+0x290>
            printf("%d", port);

            // Print Flags
            printf("\nTCP Flags:");
            int flagIndex = -1;
            for(j=0;j<sizeof(*tcp_flag_anding_vals);j++){
80101803:	83 c3 01             	add    $0x1,%ebx
80101806:	83 c7 04             	add    $0x4,%edi
80101809:	83 fb 04             	cmp    $0x4,%ebx
8010180c:	75 e8                	jne    801017f6 <parse1+0x256>
                if((tcp->offset_res_flag[1] & tcp_flag_anding_vals[j]) != 0){
                    printf("\t%s\n", tcp_flag_names[j]);
                    flagIndex = j;
                }
            }
            if (flagIndex == -1){
8010180e:	83 fa ff             	cmp    $0xffffffff,%edx
80101811:	0f 85 f8 fe ff ff    	jne    8010170f <parse1+0x16f>
                printf("\tERROR TCP Flag Missing\n");
80101817:	83 ec 0c             	sub    $0xc,%esp
8010181a:	68 b9 91 10 80       	push   $0x801091b9
8010181f:	e8 1c f4 ff ff       	call   80100c40 <cprintf>
80101824:	83 c4 10             	add    $0x10,%esp
80101827:	e9 e3 fe ff ff       	jmp    8010170f <parse1+0x16f>
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            // Print Flags
            printf("\nTCP Flags:");
            int flagIndex = -1;
            for(j=0;j<sizeof(*tcp_flag_anding_vals);j++){
                if((tcp->offset_res_flag[1] & tcp_flag_anding_vals[j]) != 0){
                    printf("\t%s\n", tcp_flag_names[j]);
80101830:	83 ec 08             	sub    $0x8,%esp
80101833:	57                   	push   %edi
80101834:	68 b4 91 10 80       	push   $0x801091b4
80101839:	e8 02 f4 ff ff       	call   80100c40 <cprintf>
8010183e:	83 c4 10             	add    $0x10,%esp
80101841:	89 da                	mov    %ebx,%edx
80101843:	eb be                	jmp    80101803 <parse1+0x263>
        
    }
    
    // Check if we are using ARP else check for TCP or UDP
    if (etherType_STR[foundEtherType] == etherType_STR[4]){
        printf("\nIP protocol:\tARP\n");
80101845:	83 ec 0c             	sub    $0xc,%esp
80101848:	68 5e 91 10 80       	push   $0x8010915e
8010184d:	e8 ee f3 ff ff       	call   80100c40 <cprintf>
        printf("\nPacket Type:\tAddress Resolution Protocol\n\n");
80101852:	83 c4 10             	add    $0x10,%esp
80101855:	c7 45 08 28 92 10 80 	movl   $0x80109228,0x8(%ebp)
8010185c:	e9 b5 fe ff ff       	jmp    80101716 <parse1+0x176>
80101861:	eb 0d                	jmp    80101870 <e1000_receive>
80101863:	90                   	nop
80101864:	90                   	nop
80101865:	90                   	nop
80101866:	90                   	nop
80101867:	90                   	nop
80101868:	90                   	nop
80101869:	90                   	nop
8010186a:	90                   	nop
8010186b:	90                   	nop
8010186c:	90                   	nop
8010186d:	90                   	nop
8010186e:	90                   	nop
8010186f:	90                   	nop

80101870 <e1000_receive>:


void net_rx(struct mbuf *m);
void
e1000_receive()
{
80101870:	55                   	push   %ebp
80101871:	89 e5                	mov    %esp,%ebp
80101873:	57                   	push   %edi
80101874:	56                   	push   %esi
80101875:	53                   	push   %ebx
80101876:	83 ec 1c             	sub    $0x1c,%esp
    uint32_t tail;
    uint32_t next;
    int len;
    struct mbuf *m;
while (1){
tail = E1000_REG(E1000_RDT);
80101879:	a1 54 98 15 80       	mov    0x80159854,%eax
8010187e:	8b 98 18 28 00 00    	mov    0x2818(%eax),%ebx
    next = (tail + 1) % NRXDESC;
80101884:	83 c3 01             	add    $0x1,%ebx
80101887:	83 e3 7f             	and    $0x7f,%ebx
    if (!(rx_queue[next].sta & E1000_RXD_STA_DD))
8010188a:	89 d8                	mov    %ebx,%eax
8010188c:	c1 e0 04             	shl    $0x4,%eax
8010188f:	f6 80 ac d5 14 80 01 	testb  $0x1,-0x7feb2a54(%eax)
80101896:	0f 84 9b 00 00 00    	je     80101937 <e1000_receive+0xc7>
8010189c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return;
 
    len = rx_queue[next].length;
801018a0:	89 da                	mov    %ebx,%edx
      //  return -E_PKT_TOO_LONG;

 
	    
	    
    m = mbufalloc(0);
801018a2:	83 ec 0c             	sub    $0xc,%esp
tail = E1000_REG(E1000_RDT);
    next = (tail + 1) % NRXDESC;
    if (!(rx_queue[next].sta & E1000_RXD_STA_DD))
        return;
 
    len = rx_queue[next].length;
801018a5:	c1 e2 04             	shl    $0x4,%edx
      //  return -E_PKT_TOO_LONG;

 
	    
	    
    m = mbufalloc(0);
801018a8:	6a 00                	push   $0x0
tail = E1000_REG(E1000_RDT);
    next = (tail + 1) % NRXDESC;
    if (!(rx_queue[next].sta & E1000_RXD_STA_DD))
        return;
 
    len = rx_queue[next].length;
801018aa:	0f b7 b2 a8 d5 14 80 	movzwl -0x7feb2a58(%edx),%esi
801018b1:	81 c2 a0 d5 14 80    	add    $0x8014d5a0,%edx
801018b7:	89 55 e0             	mov    %edx,-0x20(%ebp)
      //  return -E_PKT_TOO_LONG;

 
	    
	    
    m = mbufalloc(0);
801018ba:	e8 c1 27 00 00       	call   80104080 <mbufalloc>
801018bf:	89 c7                	mov    %eax,%edi
    m->len = len;
801018c1:	89 70 08             	mov    %esi,0x8(%eax)
	    
 parse1((char *)rx_buffs[next],len);
801018c4:	89 d8                	mov    %ebx,%eax
801018c6:	5a                   	pop    %edx
801018c7:	c1 e0 0b             	shl    $0xb,%eax
801018ca:	59                   	pop    %ecx
801018cb:	05 a0 d5 10 80       	add    $0x8010d5a0,%eax
801018d0:	56                   	push   %esi
801018d1:	50                   	push   %eax
801018d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018d5:	e8 c6 fc ff ff       	call   801015a0 <parse1>

    memcpy(m->head, rx_buffs[next], len);
801018da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801018dd:	83 c4 0c             	add    $0xc,%esp
801018e0:	56                   	push   %esi
801018e1:	50                   	push   %eax
801018e2:	ff 77 04             	pushl  0x4(%edi)
801018e5:	e8 f6 45 00 00       	call   80105ee0 <memcpy>
    rx_queue[next].sta &= ~E1000_RXD_STA_DD;
801018ea:	8b 55 e0             	mov    -0x20(%ebp),%edx

    E1000_REG(E1000_RDT) = next;
801018ed:	a1 54 98 15 80       	mov    0x80159854,%eax
    m->len = len;
	    
 parse1((char *)rx_buffs[next],len);

    memcpy(m->head, rx_buffs[next], len);
    rx_queue[next].sta &= ~E1000_RXD_STA_DD;
801018f2:	80 62 0c fe          	andb   $0xfe,0xc(%edx)

    E1000_REG(E1000_RDT) = next;
801018f6:	89 98 18 28 00 00    	mov    %ebx,0x2818(%eax)
cprintf("call net_rx %p",m);
801018fc:	5b                   	pop    %ebx
801018fd:	5e                   	pop    %esi
801018fe:	57                   	push   %edi
801018ff:	68 17 92 10 80       	push   $0x80109217
80101904:	e8 37 f3 ff ff       	call   80100c40 <cprintf>
    net_rx(m);
80101909:	89 3c 24             	mov    %edi,(%esp)
8010190c:	e8 4f 29 00 00       	call   80104260 <net_rx>
    uint32_t tail;
    uint32_t next;
    int len;
    struct mbuf *m;
while (1){
tail = E1000_REG(E1000_RDT);
80101911:	a1 54 98 15 80       	mov    0x80159854,%eax
    next = (tail + 1) % NRXDESC;
    if (!(rx_queue[next].sta & E1000_RXD_STA_DD))
80101916:	83 c4 10             	add    $0x10,%esp
    uint32_t tail;
    uint32_t next;
    int len;
    struct mbuf *m;
while (1){
tail = E1000_REG(E1000_RDT);
80101919:	8b 98 18 28 00 00    	mov    0x2818(%eax),%ebx
    next = (tail + 1) % NRXDESC;
8010191f:	83 c3 01             	add    $0x1,%ebx
80101922:	83 e3 7f             	and    $0x7f,%ebx
    if (!(rx_queue[next].sta & E1000_RXD_STA_DD))
80101925:	89 d8                	mov    %ebx,%eax
80101927:	c1 e0 04             	shl    $0x4,%eax
8010192a:	f6 80 ac d5 14 80 01 	testb  $0x1,-0x7feb2a54(%eax)
80101931:	0f 85 69 ff ff ff    	jne    801018a0 <e1000_receive+0x30>

    E1000_REG(E1000_RDT) = next;
cprintf("call net_rx %p",m);
    net_rx(m);
    }
}
80101937:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010193a:	5b                   	pop    %ebx
8010193b:	5e                   	pop    %esi
8010193c:	5f                   	pop    %edi
8010193d:	5d                   	pop    %ebp
8010193e:	c3                   	ret    
8010193f:	90                   	nop

80101940 <e1000_init>:

int e1000_init(){
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	83 ec 10             	sub    $0x10,%esp
	E1000_REG(E1000_IMS) = E1000_IMS_RXT0;
80101946:	a1 54 98 15 80       	mov    0x80159854,%eax
8010194b:	c7 80 d0 00 00 00 80 	movl   $0x80,0xd0(%eax)
80101952:	00 00 00 
	ioapicenable(IRQ_ETH, 0);
80101955:	6a 00                	push   $0x0
80101957:	6a 0b                	push   $0xb
80101959:	e8 32 16 00 00       	call   80102f90 <ioapicenable>
	return 1;
}
8010195e:	b8 01 00 00 00       	mov    $0x1,%eax
80101963:	c9                   	leave  
80101964:	c3                   	ret    
80101965:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101970 <ethintr>:
void ethintr(){
	
       
E1000_REG(E1000_ICR);
80101970:	a1 54 98 15 80       	mov    0x80159854,%eax
int e1000_init(){
	E1000_REG(E1000_IMS) = E1000_IMS_RXT0;
	ioapicenable(IRQ_ETH, 0);
	return 1;
}
void ethintr(){
80101975:	55                   	push   %ebp
80101976:	89 e5                	mov    %esp,%ebp
	
       
E1000_REG(E1000_ICR);
80101978:	8b 90 c0 00 00 00    	mov    0xc0(%eax),%edx
	E1000_REG(E1000_IMS) = E1000_IMS_RXT0;
8010197e:	c7 80 d0 00 00 00 80 	movl   $0x80,0xd0(%eax)
80101985:	00 00 00 
 e1000_receive();
}
80101988:	5d                   	pop    %ebp
void ethintr(){
	
       
E1000_REG(E1000_ICR);
	E1000_REG(E1000_IMS) = E1000_IMS_RXT0;
 e1000_receive();
80101989:	e9 e2 fe ff ff       	jmp    80101870 <e1000_receive>
8010198e:	66 90                	xchg   %ax,%ax

80101990 <fileinit>:
80101990:	55                   	push   %ebp
80101991:	89 e5                	mov    %esp,%ebp
80101993:	83 ec 10             	sub    $0x10,%esp
80101996:	68 a7 92 10 80       	push   $0x801092a7
8010199b:	68 60 98 15 80       	push   $0x80159860
801019a0:	e8 bb 41 00 00       	call   80105b60 <initlock>
801019a5:	83 c4 10             	add    $0x10,%esp
801019a8:	c9                   	leave  
801019a9:	c3                   	ret    
801019aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801019b0 <filealloc>:
801019b0:	55                   	push   %ebp
801019b1:	89 e5                	mov    %esp,%ebp
801019b3:	53                   	push   %ebx
801019b4:	bb 94 98 15 80       	mov    $0x80159894,%ebx
801019b9:	83 ec 10             	sub    $0x10,%esp
801019bc:	68 60 98 15 80       	push   $0x80159860
801019c1:	e8 8a 42 00 00       	call   80105c50 <acquire>
801019c6:	83 c4 10             	add    $0x10,%esp
801019c9:	eb 10                	jmp    801019db <filealloc+0x2b>
801019cb:	90                   	nop
801019cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801019d0:	83 c3 20             	add    $0x20,%ebx
801019d3:	81 fb 14 a5 15 80    	cmp    $0x8015a514,%ebx
801019d9:	73 25                	jae    80101a00 <filealloc+0x50>
801019db:	8b 43 04             	mov    0x4(%ebx),%eax
801019de:	85 c0                	test   %eax,%eax
801019e0:	75 ee                	jne    801019d0 <filealloc+0x20>
801019e2:	83 ec 0c             	sub    $0xc,%esp
801019e5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
801019ec:	68 60 98 15 80       	push   $0x80159860
801019f1:	e8 7a 43 00 00       	call   80105d70 <release>
801019f6:	89 d8                	mov    %ebx,%eax
801019f8:	83 c4 10             	add    $0x10,%esp
801019fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801019fe:	c9                   	leave  
801019ff:	c3                   	ret    
80101a00:	83 ec 0c             	sub    $0xc,%esp
80101a03:	31 db                	xor    %ebx,%ebx
80101a05:	68 60 98 15 80       	push   $0x80159860
80101a0a:	e8 61 43 00 00       	call   80105d70 <release>
80101a0f:	89 d8                	mov    %ebx,%eax
80101a11:	83 c4 10             	add    $0x10,%esp
80101a14:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101a17:	c9                   	leave  
80101a18:	c3                   	ret    
80101a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a20 <filedup>:
80101a20:	55                   	push   %ebp
80101a21:	89 e5                	mov    %esp,%ebp
80101a23:	53                   	push   %ebx
80101a24:	83 ec 10             	sub    $0x10,%esp
80101a27:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101a2a:	68 60 98 15 80       	push   $0x80159860
80101a2f:	e8 1c 42 00 00       	call   80105c50 <acquire>
80101a34:	8b 43 04             	mov    0x4(%ebx),%eax
80101a37:	83 c4 10             	add    $0x10,%esp
80101a3a:	85 c0                	test   %eax,%eax
80101a3c:	7e 1a                	jle    80101a58 <filedup+0x38>
80101a3e:	83 c0 01             	add    $0x1,%eax
80101a41:	83 ec 0c             	sub    $0xc,%esp
80101a44:	89 43 04             	mov    %eax,0x4(%ebx)
80101a47:	68 60 98 15 80       	push   $0x80159860
80101a4c:	e8 1f 43 00 00       	call   80105d70 <release>
80101a51:	89 d8                	mov    %ebx,%eax
80101a53:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101a56:	c9                   	leave  
80101a57:	c3                   	ret    
80101a58:	83 ec 0c             	sub    $0xc,%esp
80101a5b:	68 ae 92 10 80       	push   $0x801092ae
80101a60:	e8 0b ef ff ff       	call   80100970 <panic>
80101a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101a70 <fileclose>:
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 28             	sub    $0x28,%esp
80101a79:	8b 75 08             	mov    0x8(%ebp),%esi
80101a7c:	68 60 98 15 80       	push   $0x80159860
80101a81:	e8 ca 41 00 00       	call   80105c50 <acquire>
80101a86:	8b 46 04             	mov    0x4(%esi),%eax
80101a89:	83 c4 10             	add    $0x10,%esp
80101a8c:	85 c0                	test   %eax,%eax
80101a8e:	0f 8e bb 00 00 00    	jle    80101b4f <fileclose+0xdf>
80101a94:	83 e8 01             	sub    $0x1,%eax
80101a97:	85 c0                	test   %eax,%eax
80101a99:	89 46 04             	mov    %eax,0x4(%esi)
80101a9c:	74 1a                	je     80101ab8 <fileclose+0x48>
80101a9e:	c7 45 08 60 98 15 80 	movl   $0x80159860,0x8(%ebp)
80101aa5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101aa8:	5b                   	pop    %ebx
80101aa9:	5e                   	pop    %esi
80101aaa:	5f                   	pop    %edi
80101aab:	5d                   	pop    %ebp
80101aac:	e9 bf 42 00 00       	jmp    80105d70 <release>
80101ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ab8:	0f b6 46 09          	movzbl 0x9(%esi),%eax
80101abc:	8b 3e                	mov    (%esi),%edi
80101abe:	83 ec 0c             	sub    $0xc,%esp
80101ac1:	8b 5e 10             	mov    0x10(%esi),%ebx
80101ac4:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80101aca:	88 45 e7             	mov    %al,-0x19(%ebp)
80101acd:	8b 46 14             	mov    0x14(%esi),%eax
80101ad0:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101ad3:	8b 46 18             	mov    0x18(%esi),%eax
80101ad6:	68 60 98 15 80       	push   $0x80159860
80101adb:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101ade:	e8 8d 42 00 00       	call   80105d70 <release>
80101ae3:	83 c4 10             	add    $0x10,%esp
80101ae6:	83 ff 01             	cmp    $0x1,%edi
80101ae9:	74 15                	je     80101b00 <fileclose+0x90>
80101aeb:	83 ff 04             	cmp    $0x4,%edi
80101aee:	74 28                	je     80101b18 <fileclose+0xa8>
80101af0:	83 ff 02             	cmp    $0x2,%edi
80101af3:	74 3b                	je     80101b30 <fileclose+0xc0>
80101af5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101af8:	5b                   	pop    %ebx
80101af9:	5e                   	pop    %esi
80101afa:	5f                   	pop    %edi
80101afb:	5d                   	pop    %ebp
80101afc:	c3                   	ret    
80101afd:	8d 76 00             	lea    0x0(%esi),%esi
80101b00:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
80101b04:	83 ec 08             	sub    $0x8,%esp
80101b07:	50                   	push   %eax
80101b08:	53                   	push   %ebx
80101b09:	e8 c2 31 00 00       	call   80104cd0 <pipeclose>
80101b0e:	83 c4 10             	add    $0x10,%esp
80101b11:	eb e2                	jmp    80101af5 <fileclose+0x85>
80101b13:	90                   	nop
80101b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b18:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b1b:	89 45 08             	mov    %eax,0x8(%ebp)
80101b1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b21:	5b                   	pop    %ebx
80101b22:	5e                   	pop    %esi
80101b23:	5f                   	pop    %edi
80101b24:	5d                   	pop    %ebp
80101b25:	e9 d6 55 00 00       	jmp    80107100 <sockclose>
80101b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101b30:	e8 2b 1d 00 00       	call   80103860 <begin_op>
80101b35:	83 ec 0c             	sub    $0xc,%esp
80101b38:	ff 75 dc             	pushl  -0x24(%ebp)
80101b3b:	e8 30 09 00 00       	call   80102470 <iput>
80101b40:	83 c4 10             	add    $0x10,%esp
80101b43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b46:	5b                   	pop    %ebx
80101b47:	5e                   	pop    %esi
80101b48:	5f                   	pop    %edi
80101b49:	5d                   	pop    %ebp
80101b4a:	e9 81 1d 00 00       	jmp    801038d0 <end_op>
80101b4f:	83 ec 0c             	sub    $0xc,%esp
80101b52:	68 b6 92 10 80       	push   $0x801092b6
80101b57:	e8 14 ee ff ff       	call   80100970 <panic>
80101b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101b60 <filestat>:
80101b60:	55                   	push   %ebp
80101b61:	89 e5                	mov    %esp,%ebp
80101b63:	53                   	push   %ebx
80101b64:	83 ec 04             	sub    $0x4,%esp
80101b67:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b6a:	83 3b 02             	cmpl   $0x2,(%ebx)
80101b6d:	75 31                	jne    80101ba0 <filestat+0x40>
80101b6f:	83 ec 0c             	sub    $0xc,%esp
80101b72:	ff 73 14             	pushl  0x14(%ebx)
80101b75:	e8 c6 07 00 00       	call   80102340 <ilock>
80101b7a:	58                   	pop    %eax
80101b7b:	5a                   	pop    %edx
80101b7c:	ff 75 0c             	pushl  0xc(%ebp)
80101b7f:	ff 73 14             	pushl  0x14(%ebx)
80101b82:	e8 69 0a 00 00       	call   801025f0 <stati>
80101b87:	59                   	pop    %ecx
80101b88:	ff 73 14             	pushl  0x14(%ebx)
80101b8b:	e8 90 08 00 00       	call   80102420 <iunlock>
80101b90:	83 c4 10             	add    $0x10,%esp
80101b93:	31 c0                	xor    %eax,%eax
80101b95:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101b98:	c9                   	leave  
80101b99:	c3                   	ret    
80101b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ba5:	eb ee                	jmp    80101b95 <filestat+0x35>
80101ba7:	89 f6                	mov    %esi,%esi
80101ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bb0 <fileread>:
80101bb0:	55                   	push   %ebp
80101bb1:	89 e5                	mov    %esp,%ebp
80101bb3:	57                   	push   %edi
80101bb4:	56                   	push   %esi
80101bb5:	53                   	push   %ebx
80101bb6:	83 ec 0c             	sub    $0xc,%esp
80101bb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bbc:	8b 75 0c             	mov    0xc(%ebp),%esi
80101bbf:	8b 7d 10             	mov    0x10(%ebp),%edi
80101bc2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101bc6:	0f 84 84 00 00 00    	je     80101c50 <fileread+0xa0>
80101bcc:	8b 03                	mov    (%ebx),%eax
80101bce:	83 f8 01             	cmp    $0x1,%eax
80101bd1:	74 4d                	je     80101c20 <fileread+0x70>
80101bd3:	83 f8 04             	cmp    $0x4,%eax
80101bd6:	74 60                	je     80101c38 <fileread+0x88>
80101bd8:	83 f8 02             	cmp    $0x2,%eax
80101bdb:	75 7a                	jne    80101c57 <fileread+0xa7>
80101bdd:	83 ec 0c             	sub    $0xc,%esp
80101be0:	ff 73 14             	pushl  0x14(%ebx)
80101be3:	e8 58 07 00 00       	call   80102340 <ilock>
80101be8:	57                   	push   %edi
80101be9:	ff 73 1c             	pushl  0x1c(%ebx)
80101bec:	56                   	push   %esi
80101bed:	ff 73 14             	pushl  0x14(%ebx)
80101bf0:	e8 2b 0a 00 00       	call   80102620 <readi>
80101bf5:	83 c4 20             	add    $0x20,%esp
80101bf8:	85 c0                	test   %eax,%eax
80101bfa:	89 c6                	mov    %eax,%esi
80101bfc:	7e 03                	jle    80101c01 <fileread+0x51>
80101bfe:	01 43 1c             	add    %eax,0x1c(%ebx)
80101c01:	83 ec 0c             	sub    $0xc,%esp
80101c04:	ff 73 14             	pushl  0x14(%ebx)
80101c07:	e8 14 08 00 00       	call   80102420 <iunlock>
80101c0c:	83 c4 10             	add    $0x10,%esp
80101c0f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c12:	89 f0                	mov    %esi,%eax
80101c14:	5b                   	pop    %ebx
80101c15:	5e                   	pop    %esi
80101c16:	5f                   	pop    %edi
80101c17:	5d                   	pop    %ebp
80101c18:	c3                   	ret    
80101c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c20:	8b 43 10             	mov    0x10(%ebx),%eax
80101c23:	89 45 08             	mov    %eax,0x8(%ebp)
80101c26:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c29:	5b                   	pop    %ebx
80101c2a:	5e                   	pop    %esi
80101c2b:	5f                   	pop    %edi
80101c2c:	5d                   	pop    %ebp
80101c2d:	e9 4e 32 00 00       	jmp    80104e80 <piperead>
80101c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c38:	8b 43 18             	mov    0x18(%ebx),%eax
80101c3b:	89 45 08             	mov    %eax,0x8(%ebp)
80101c3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c41:	5b                   	pop    %ebx
80101c42:	5e                   	pop    %esi
80101c43:	5f                   	pop    %edi
80101c44:	5d                   	pop    %ebp
80101c45:	e9 26 56 00 00       	jmp    80107270 <sockread>
80101c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c50:	be ff ff ff ff       	mov    $0xffffffff,%esi
80101c55:	eb b8                	jmp    80101c0f <fileread+0x5f>
80101c57:	83 ec 0c             	sub    $0xc,%esp
80101c5a:	68 c0 92 10 80       	push   $0x801092c0
80101c5f:	e8 0c ed ff ff       	call   80100970 <panic>
80101c64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c70 <filewrite>:
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	83 ec 1c             	sub    $0x1c,%esp
80101c79:	8b 75 08             	mov    0x8(%ebp),%esi
80101c7c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c7f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101c83:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101c86:	8b 45 10             	mov    0x10(%ebp),%eax
80101c89:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101c8c:	0f 84 b2 00 00 00    	je     80101d44 <filewrite+0xd4>
80101c92:	8b 06                	mov    (%esi),%eax
80101c94:	83 f8 01             	cmp    $0x1,%eax
80101c97:	0f 84 d3 00 00 00    	je     80101d70 <filewrite+0x100>
80101c9d:	83 f8 04             	cmp    $0x4,%eax
80101ca0:	0f 84 e2 00 00 00    	je     80101d88 <filewrite+0x118>
80101ca6:	83 f8 02             	cmp    $0x2,%eax
80101ca9:	0f 85 f8 00 00 00    	jne    80101da7 <filewrite+0x137>
80101caf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101cb2:	31 ff                	xor    %edi,%edi
80101cb4:	85 c0                	test   %eax,%eax
80101cb6:	7f 33                	jg     80101ceb <filewrite+0x7b>
80101cb8:	e9 9b 00 00 00       	jmp    80101d58 <filewrite+0xe8>
80101cbd:	8d 76 00             	lea    0x0(%esi),%esi
80101cc0:	01 46 1c             	add    %eax,0x1c(%esi)
80101cc3:	83 ec 0c             	sub    $0xc,%esp
80101cc6:	ff 76 14             	pushl  0x14(%esi)
80101cc9:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101ccc:	e8 4f 07 00 00       	call   80102420 <iunlock>
80101cd1:	e8 fa 1b 00 00       	call   801038d0 <end_op>
80101cd6:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101cd9:	83 c4 10             	add    $0x10,%esp
80101cdc:	39 c3                	cmp    %eax,%ebx
80101cde:	0f 85 b6 00 00 00    	jne    80101d9a <filewrite+0x12a>
80101ce4:	01 df                	add    %ebx,%edi
80101ce6:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101ce9:	7e 6d                	jle    80101d58 <filewrite+0xe8>
80101ceb:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101cee:	b8 00 06 00 00       	mov    $0x600,%eax
80101cf3:	29 fb                	sub    %edi,%ebx
80101cf5:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101cfb:	0f 4f d8             	cmovg  %eax,%ebx
80101cfe:	e8 5d 1b 00 00       	call   80103860 <begin_op>
80101d03:	83 ec 0c             	sub    $0xc,%esp
80101d06:	ff 76 14             	pushl  0x14(%esi)
80101d09:	e8 32 06 00 00       	call   80102340 <ilock>
80101d0e:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101d11:	53                   	push   %ebx
80101d12:	ff 76 1c             	pushl  0x1c(%esi)
80101d15:	01 f8                	add    %edi,%eax
80101d17:	50                   	push   %eax
80101d18:	ff 76 14             	pushl  0x14(%esi)
80101d1b:	e8 00 0a 00 00       	call   80102720 <writei>
80101d20:	83 c4 20             	add    $0x20,%esp
80101d23:	85 c0                	test   %eax,%eax
80101d25:	7f 99                	jg     80101cc0 <filewrite+0x50>
80101d27:	83 ec 0c             	sub    $0xc,%esp
80101d2a:	ff 76 14             	pushl  0x14(%esi)
80101d2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101d30:	e8 eb 06 00 00       	call   80102420 <iunlock>
80101d35:	e8 96 1b 00 00       	call   801038d0 <end_op>
80101d3a:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d3d:	83 c4 10             	add    $0x10,%esp
80101d40:	85 c0                	test   %eax,%eax
80101d42:	74 98                	je     80101cdc <filewrite+0x6c>
80101d44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d47:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80101d4c:	89 f8                	mov    %edi,%eax
80101d4e:	5b                   	pop    %ebx
80101d4f:	5e                   	pop    %esi
80101d50:	5f                   	pop    %edi
80101d51:	5d                   	pop    %ebp
80101d52:	c3                   	ret    
80101d53:	90                   	nop
80101d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d58:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101d5b:	75 e7                	jne    80101d44 <filewrite+0xd4>
80101d5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d60:	89 f8                	mov    %edi,%eax
80101d62:	5b                   	pop    %ebx
80101d63:	5e                   	pop    %esi
80101d64:	5f                   	pop    %edi
80101d65:	5d                   	pop    %ebp
80101d66:	c3                   	ret    
80101d67:	89 f6                	mov    %esi,%esi
80101d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d70:	8b 46 10             	mov    0x10(%esi),%eax
80101d73:	89 45 08             	mov    %eax,0x8(%ebp)
80101d76:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d79:	5b                   	pop    %ebx
80101d7a:	5e                   	pop    %esi
80101d7b:	5f                   	pop    %edi
80101d7c:	5d                   	pop    %ebp
80101d7d:	e9 ee 2f 00 00       	jmp    80104d70 <pipewrite>
80101d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101d88:	8b 46 18             	mov    0x18(%esi),%eax
80101d8b:	89 45 08             	mov    %eax,0x8(%ebp)
80101d8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d91:	5b                   	pop    %ebx
80101d92:	5e                   	pop    %esi
80101d93:	5f                   	pop    %edi
80101d94:	5d                   	pop    %ebp
80101d95:	e9 36 54 00 00       	jmp    801071d0 <sockwrite>
80101d9a:	83 ec 0c             	sub    $0xc,%esp
80101d9d:	68 c9 92 10 80       	push   $0x801092c9
80101da2:	e8 c9 eb ff ff       	call   80100970 <panic>
80101da7:	83 ec 0c             	sub    $0xc,%esp
80101daa:	68 cf 92 10 80       	push   $0x801092cf
80101daf:	e8 bc eb ff ff       	call   80100970 <panic>
80101db4:	66 90                	xchg   %ax,%ax
80101db6:	66 90                	xchg   %ax,%ax
80101db8:	66 90                	xchg   %ax,%ax
80101dba:	66 90                	xchg   %ax,%ax
80101dbc:	66 90                	xchg   %ax,%ax
80101dbe:	66 90                	xchg   %ax,%ax

80101dc0 <balloc>:
80101dc0:	55                   	push   %ebp
80101dc1:	89 e5                	mov    %esp,%ebp
80101dc3:	57                   	push   %edi
80101dc4:	56                   	push   %esi
80101dc5:	53                   	push   %ebx
80101dc6:	83 ec 1c             	sub    $0x1c,%esp
80101dc9:	8b 0d 80 a5 15 80    	mov    0x8015a580,%ecx
80101dcf:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101dd2:	85 c9                	test   %ecx,%ecx
80101dd4:	0f 84 87 00 00 00    	je     80101e61 <balloc+0xa1>
80101dda:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101de1:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101de4:	83 ec 08             	sub    $0x8,%esp
80101de7:	89 f0                	mov    %esi,%eax
80101de9:	c1 f8 0c             	sar    $0xc,%eax
80101dec:	03 05 98 a5 15 80    	add    0x8015a598,%eax
80101df2:	50                   	push   %eax
80101df3:	ff 75 d8             	pushl  -0x28(%ebp)
80101df6:	e8 b5 e8 ff ff       	call   801006b0 <bread>
80101dfb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101dfe:	a1 80 a5 15 80       	mov    0x8015a580,%eax
80101e03:	83 c4 10             	add    $0x10,%esp
80101e06:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101e09:	31 c0                	xor    %eax,%eax
80101e0b:	eb 2f                	jmp    80101e3c <balloc+0x7c>
80101e0d:	8d 76 00             	lea    0x0(%esi),%esi
80101e10:	89 c1                	mov    %eax,%ecx
80101e12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101e15:	bb 01 00 00 00       	mov    $0x1,%ebx
80101e1a:	83 e1 07             	and    $0x7,%ecx
80101e1d:	d3 e3                	shl    %cl,%ebx
80101e1f:	89 c1                	mov    %eax,%ecx
80101e21:	c1 f9 03             	sar    $0x3,%ecx
80101e24:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101e29:	85 df                	test   %ebx,%edi
80101e2b:	89 fa                	mov    %edi,%edx
80101e2d:	74 41                	je     80101e70 <balloc+0xb0>
80101e2f:	83 c0 01             	add    $0x1,%eax
80101e32:	83 c6 01             	add    $0x1,%esi
80101e35:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101e3a:	74 05                	je     80101e41 <balloc+0x81>
80101e3c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
80101e3f:	77 cf                	ja     80101e10 <balloc+0x50>
80101e41:	83 ec 0c             	sub    $0xc,%esp
80101e44:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e47:	e8 74 e9 ff ff       	call   801007c0 <brelse>
80101e4c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101e53:	83 c4 10             	add    $0x10,%esp
80101e56:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101e59:	39 05 80 a5 15 80    	cmp    %eax,0x8015a580
80101e5f:	77 80                	ja     80101de1 <balloc+0x21>
80101e61:	83 ec 0c             	sub    $0xc,%esp
80101e64:	68 d9 92 10 80       	push   $0x801092d9
80101e69:	e8 02 eb ff ff       	call   80100970 <panic>
80101e6e:	66 90                	xchg   %ax,%ax
80101e70:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101e73:	83 ec 0c             	sub    $0xc,%esp
80101e76:	09 da                	or     %ebx,%edx
80101e78:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
80101e7c:	57                   	push   %edi
80101e7d:	e8 ae 1b 00 00       	call   80103a30 <log_write>
80101e82:	89 3c 24             	mov    %edi,(%esp)
80101e85:	e8 36 e9 ff ff       	call   801007c0 <brelse>
80101e8a:	58                   	pop    %eax
80101e8b:	5a                   	pop    %edx
80101e8c:	56                   	push   %esi
80101e8d:	ff 75 d8             	pushl  -0x28(%ebp)
80101e90:	e8 1b e8 ff ff       	call   801006b0 <bread>
80101e95:	89 c3                	mov    %eax,%ebx
80101e97:	8d 40 5c             	lea    0x5c(%eax),%eax
80101e9a:	83 c4 0c             	add    $0xc,%esp
80101e9d:	68 00 02 00 00       	push   $0x200
80101ea2:	6a 00                	push   $0x0
80101ea4:	50                   	push   %eax
80101ea5:	e8 26 3f 00 00       	call   80105dd0 <memset>
80101eaa:	89 1c 24             	mov    %ebx,(%esp)
80101ead:	e8 7e 1b 00 00       	call   80103a30 <log_write>
80101eb2:	89 1c 24             	mov    %ebx,(%esp)
80101eb5:	e8 06 e9 ff ff       	call   801007c0 <brelse>
80101eba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ebd:	89 f0                	mov    %esi,%eax
80101ebf:	5b                   	pop    %ebx
80101ec0:	5e                   	pop    %esi
80101ec1:	5f                   	pop    %edi
80101ec2:	5d                   	pop    %ebp
80101ec3:	c3                   	ret    
80101ec4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101eca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101ed0 <iget>:
80101ed0:	55                   	push   %ebp
80101ed1:	89 e5                	mov    %esp,%ebp
80101ed3:	57                   	push   %edi
80101ed4:	56                   	push   %esi
80101ed5:	53                   	push   %ebx
80101ed6:	89 c7                	mov    %eax,%edi
80101ed8:	31 f6                	xor    %esi,%esi
80101eda:	bb d4 a5 15 80       	mov    $0x8015a5d4,%ebx
80101edf:	83 ec 28             	sub    $0x28,%esp
80101ee2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ee5:	68 a0 a5 15 80       	push   $0x8015a5a0
80101eea:	e8 61 3d 00 00       	call   80105c50 <acquire>
80101eef:	83 c4 10             	add    $0x10,%esp
80101ef2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ef5:	eb 17                	jmp    80101f0e <iget+0x3e>
80101ef7:	89 f6                	mov    %esi,%esi
80101ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f00:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101f06:	81 fb f4 c1 15 80    	cmp    $0x8015c1f4,%ebx
80101f0c:	73 22                	jae    80101f30 <iget+0x60>
80101f0e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101f11:	85 c9                	test   %ecx,%ecx
80101f13:	7e 04                	jle    80101f19 <iget+0x49>
80101f15:	39 3b                	cmp    %edi,(%ebx)
80101f17:	74 4f                	je     80101f68 <iget+0x98>
80101f19:	85 f6                	test   %esi,%esi
80101f1b:	75 e3                	jne    80101f00 <iget+0x30>
80101f1d:	85 c9                	test   %ecx,%ecx
80101f1f:	0f 44 f3             	cmove  %ebx,%esi
80101f22:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101f28:	81 fb f4 c1 15 80    	cmp    $0x8015c1f4,%ebx
80101f2e:	72 de                	jb     80101f0e <iget+0x3e>
80101f30:	85 f6                	test   %esi,%esi
80101f32:	74 5b                	je     80101f8f <iget+0xbf>
80101f34:	83 ec 0c             	sub    $0xc,%esp
80101f37:	89 3e                	mov    %edi,(%esi)
80101f39:	89 56 04             	mov    %edx,0x4(%esi)
80101f3c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101f43:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101f4a:	68 a0 a5 15 80       	push   $0x8015a5a0
80101f4f:	e8 1c 3e 00 00       	call   80105d70 <release>
80101f54:	83 c4 10             	add    $0x10,%esp
80101f57:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f5a:	89 f0                	mov    %esi,%eax
80101f5c:	5b                   	pop    %ebx
80101f5d:	5e                   	pop    %esi
80101f5e:	5f                   	pop    %edi
80101f5f:	5d                   	pop    %ebp
80101f60:	c3                   	ret    
80101f61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f68:	39 53 04             	cmp    %edx,0x4(%ebx)
80101f6b:	75 ac                	jne    80101f19 <iget+0x49>
80101f6d:	83 ec 0c             	sub    $0xc,%esp
80101f70:	83 c1 01             	add    $0x1,%ecx
80101f73:	89 de                	mov    %ebx,%esi
80101f75:	68 a0 a5 15 80       	push   $0x8015a5a0
80101f7a:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101f7d:	e8 ee 3d 00 00       	call   80105d70 <release>
80101f82:	83 c4 10             	add    $0x10,%esp
80101f85:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f88:	89 f0                	mov    %esi,%eax
80101f8a:	5b                   	pop    %ebx
80101f8b:	5e                   	pop    %esi
80101f8c:	5f                   	pop    %edi
80101f8d:	5d                   	pop    %ebp
80101f8e:	c3                   	ret    
80101f8f:	83 ec 0c             	sub    $0xc,%esp
80101f92:	68 ef 92 10 80       	push   $0x801092ef
80101f97:	e8 d4 e9 ff ff       	call   80100970 <panic>
80101f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101fa0 <bmap>:
80101fa0:	55                   	push   %ebp
80101fa1:	89 e5                	mov    %esp,%ebp
80101fa3:	57                   	push   %edi
80101fa4:	56                   	push   %esi
80101fa5:	53                   	push   %ebx
80101fa6:	89 c6                	mov    %eax,%esi
80101fa8:	83 ec 1c             	sub    $0x1c,%esp
80101fab:	83 fa 0b             	cmp    $0xb,%edx
80101fae:	77 18                	ja     80101fc8 <bmap+0x28>
80101fb0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80101fb3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
80101fb6:	85 db                	test   %ebx,%ebx
80101fb8:	74 76                	je     80102030 <bmap+0x90>
80101fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fbd:	89 d8                	mov    %ebx,%eax
80101fbf:	5b                   	pop    %ebx
80101fc0:	5e                   	pop    %esi
80101fc1:	5f                   	pop    %edi
80101fc2:	5d                   	pop    %ebp
80101fc3:	c3                   	ret    
80101fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fc8:	8d 5a f4             	lea    -0xc(%edx),%ebx
80101fcb:	83 fb 7f             	cmp    $0x7f,%ebx
80101fce:	0f 87 90 00 00 00    	ja     80102064 <bmap+0xc4>
80101fd4:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
80101fda:	8b 00                	mov    (%eax),%eax
80101fdc:	85 d2                	test   %edx,%edx
80101fde:	74 70                	je     80102050 <bmap+0xb0>
80101fe0:	83 ec 08             	sub    $0x8,%esp
80101fe3:	52                   	push   %edx
80101fe4:	50                   	push   %eax
80101fe5:	e8 c6 e6 ff ff       	call   801006b0 <bread>
80101fea:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
80101fee:	83 c4 10             	add    $0x10,%esp
80101ff1:	89 c7                	mov    %eax,%edi
80101ff3:	8b 1a                	mov    (%edx),%ebx
80101ff5:	85 db                	test   %ebx,%ebx
80101ff7:	75 1d                	jne    80102016 <bmap+0x76>
80101ff9:	8b 06                	mov    (%esi),%eax
80101ffb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ffe:	e8 bd fd ff ff       	call   80101dc0 <balloc>
80102003:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80102006:	83 ec 0c             	sub    $0xc,%esp
80102009:	89 c3                	mov    %eax,%ebx
8010200b:	89 02                	mov    %eax,(%edx)
8010200d:	57                   	push   %edi
8010200e:	e8 1d 1a 00 00       	call   80103a30 <log_write>
80102013:	83 c4 10             	add    $0x10,%esp
80102016:	83 ec 0c             	sub    $0xc,%esp
80102019:	57                   	push   %edi
8010201a:	e8 a1 e7 ff ff       	call   801007c0 <brelse>
8010201f:	83 c4 10             	add    $0x10,%esp
80102022:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102025:	89 d8                	mov    %ebx,%eax
80102027:	5b                   	pop    %ebx
80102028:	5e                   	pop    %esi
80102029:	5f                   	pop    %edi
8010202a:	5d                   	pop    %ebp
8010202b:	c3                   	ret    
8010202c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102030:	8b 00                	mov    (%eax),%eax
80102032:	e8 89 fd ff ff       	call   80101dc0 <balloc>
80102037:	89 47 5c             	mov    %eax,0x5c(%edi)
8010203a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010203d:	89 c3                	mov    %eax,%ebx
8010203f:	89 d8                	mov    %ebx,%eax
80102041:	5b                   	pop    %ebx
80102042:	5e                   	pop    %esi
80102043:	5f                   	pop    %edi
80102044:	5d                   	pop    %ebp
80102045:	c3                   	ret    
80102046:	8d 76 00             	lea    0x0(%esi),%esi
80102049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102050:	e8 6b fd ff ff       	call   80101dc0 <balloc>
80102055:	89 c2                	mov    %eax,%edx
80102057:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010205d:	8b 06                	mov    (%esi),%eax
8010205f:	e9 7c ff ff ff       	jmp    80101fe0 <bmap+0x40>
80102064:	83 ec 0c             	sub    $0xc,%esp
80102067:	68 ff 92 10 80       	push   $0x801092ff
8010206c:	e8 ff e8 ff ff       	call   80100970 <panic>
80102071:	eb 0d                	jmp    80102080 <readsb>
80102073:	90                   	nop
80102074:	90                   	nop
80102075:	90                   	nop
80102076:	90                   	nop
80102077:	90                   	nop
80102078:	90                   	nop
80102079:	90                   	nop
8010207a:	90                   	nop
8010207b:	90                   	nop
8010207c:	90                   	nop
8010207d:	90                   	nop
8010207e:	90                   	nop
8010207f:	90                   	nop

80102080 <readsb>:
80102080:	55                   	push   %ebp
80102081:	89 e5                	mov    %esp,%ebp
80102083:	56                   	push   %esi
80102084:	53                   	push   %ebx
80102085:	8b 75 0c             	mov    0xc(%ebp),%esi
80102088:	83 ec 08             	sub    $0x8,%esp
8010208b:	6a 01                	push   $0x1
8010208d:	ff 75 08             	pushl  0x8(%ebp)
80102090:	e8 1b e6 ff ff       	call   801006b0 <bread>
80102095:	89 c3                	mov    %eax,%ebx
80102097:	8d 40 5c             	lea    0x5c(%eax),%eax
8010209a:	83 c4 0c             	add    $0xc,%esp
8010209d:	6a 1c                	push   $0x1c
8010209f:	50                   	push   %eax
801020a0:	56                   	push   %esi
801020a1:	e8 da 3d 00 00       	call   80105e80 <memmove>
801020a6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801020a9:	83 c4 10             	add    $0x10,%esp
801020ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
801020af:	5b                   	pop    %ebx
801020b0:	5e                   	pop    %esi
801020b1:	5d                   	pop    %ebp
801020b2:	e9 09 e7 ff ff       	jmp    801007c0 <brelse>
801020b7:	89 f6                	mov    %esi,%esi
801020b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801020c0 <bfree>:
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	56                   	push   %esi
801020c4:	53                   	push   %ebx
801020c5:	89 d3                	mov    %edx,%ebx
801020c7:	89 c6                	mov    %eax,%esi
801020c9:	83 ec 08             	sub    $0x8,%esp
801020cc:	68 80 a5 15 80       	push   $0x8015a580
801020d1:	50                   	push   %eax
801020d2:	e8 a9 ff ff ff       	call   80102080 <readsb>
801020d7:	58                   	pop    %eax
801020d8:	5a                   	pop    %edx
801020d9:	89 da                	mov    %ebx,%edx
801020db:	c1 ea 0c             	shr    $0xc,%edx
801020de:	03 15 98 a5 15 80    	add    0x8015a598,%edx
801020e4:	52                   	push   %edx
801020e5:	56                   	push   %esi
801020e6:	e8 c5 e5 ff ff       	call   801006b0 <bread>
801020eb:	89 d9                	mov    %ebx,%ecx
801020ed:	c1 fb 03             	sar    $0x3,%ebx
801020f0:	ba 01 00 00 00       	mov    $0x1,%edx
801020f5:	83 e1 07             	and    $0x7,%ecx
801020f8:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
801020fe:	83 c4 10             	add    $0x10,%esp
80102101:	d3 e2                	shl    %cl,%edx
80102103:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80102108:	85 d1                	test   %edx,%ecx
8010210a:	74 25                	je     80102131 <bfree+0x71>
8010210c:	f7 d2                	not    %edx
8010210e:	89 c6                	mov    %eax,%esi
80102110:	83 ec 0c             	sub    $0xc,%esp
80102113:	21 ca                	and    %ecx,%edx
80102115:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
80102119:	56                   	push   %esi
8010211a:	e8 11 19 00 00       	call   80103a30 <log_write>
8010211f:	89 34 24             	mov    %esi,(%esp)
80102122:	e8 99 e6 ff ff       	call   801007c0 <brelse>
80102127:	83 c4 10             	add    $0x10,%esp
8010212a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010212d:	5b                   	pop    %ebx
8010212e:	5e                   	pop    %esi
8010212f:	5d                   	pop    %ebp
80102130:	c3                   	ret    
80102131:	83 ec 0c             	sub    $0xc,%esp
80102134:	68 12 93 10 80       	push   $0x80109312
80102139:	e8 32 e8 ff ff       	call   80100970 <panic>
8010213e:	66 90                	xchg   %ax,%ax

80102140 <iinit>:
80102140:	55                   	push   %ebp
80102141:	89 e5                	mov    %esp,%ebp
80102143:	53                   	push   %ebx
80102144:	bb e0 a5 15 80       	mov    $0x8015a5e0,%ebx
80102149:	83 ec 0c             	sub    $0xc,%esp
8010214c:	68 25 93 10 80       	push   $0x80109325
80102151:	68 a0 a5 15 80       	push   $0x8015a5a0
80102156:	e8 05 3a 00 00       	call   80105b60 <initlock>
8010215b:	83 c4 10             	add    $0x10,%esp
8010215e:	66 90                	xchg   %ax,%ax
80102160:	83 ec 08             	sub    $0x8,%esp
80102163:	68 2c 93 10 80       	push   $0x8010932c
80102168:	53                   	push   %ebx
80102169:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010216f:	e8 dc 38 00 00       	call   80105a50 <initsleeplock>
80102174:	83 c4 10             	add    $0x10,%esp
80102177:	81 fb 00 c2 15 80    	cmp    $0x8015c200,%ebx
8010217d:	75 e1                	jne    80102160 <iinit+0x20>
8010217f:	83 ec 08             	sub    $0x8,%esp
80102182:	68 80 a5 15 80       	push   $0x8015a580
80102187:	ff 75 08             	pushl  0x8(%ebp)
8010218a:	e8 f1 fe ff ff       	call   80102080 <readsb>
8010218f:	ff 35 98 a5 15 80    	pushl  0x8015a598
80102195:	ff 35 94 a5 15 80    	pushl  0x8015a594
8010219b:	ff 35 90 a5 15 80    	pushl  0x8015a590
801021a1:	ff 35 8c a5 15 80    	pushl  0x8015a58c
801021a7:	ff 35 88 a5 15 80    	pushl  0x8015a588
801021ad:	ff 35 84 a5 15 80    	pushl  0x8015a584
801021b3:	ff 35 80 a5 15 80    	pushl  0x8015a580
801021b9:	68 90 93 10 80       	push   $0x80109390
801021be:	e8 7d ea ff ff       	call   80100c40 <cprintf>
801021c3:	83 c4 30             	add    $0x30,%esp
801021c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021c9:	c9                   	leave  
801021ca:	c3                   	ret    
801021cb:	90                   	nop
801021cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801021d0 <ialloc>:
801021d0:	55                   	push   %ebp
801021d1:	89 e5                	mov    %esp,%ebp
801021d3:	57                   	push   %edi
801021d4:	56                   	push   %esi
801021d5:	53                   	push   %ebx
801021d6:	83 ec 1c             	sub    $0x1c,%esp
801021d9:	83 3d 88 a5 15 80 01 	cmpl   $0x1,0x8015a588
801021e0:	8b 45 0c             	mov    0xc(%ebp),%eax
801021e3:	8b 75 08             	mov    0x8(%ebp),%esi
801021e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801021e9:	0f 86 91 00 00 00    	jbe    80102280 <ialloc+0xb0>
801021ef:	bb 01 00 00 00       	mov    $0x1,%ebx
801021f4:	eb 21                	jmp    80102217 <ialloc+0x47>
801021f6:	8d 76 00             	lea    0x0(%esi),%esi
801021f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102200:	83 ec 0c             	sub    $0xc,%esp
80102203:	83 c3 01             	add    $0x1,%ebx
80102206:	57                   	push   %edi
80102207:	e8 b4 e5 ff ff       	call   801007c0 <brelse>
8010220c:	83 c4 10             	add    $0x10,%esp
8010220f:	39 1d 88 a5 15 80    	cmp    %ebx,0x8015a588
80102215:	76 69                	jbe    80102280 <ialloc+0xb0>
80102217:	89 d8                	mov    %ebx,%eax
80102219:	83 ec 08             	sub    $0x8,%esp
8010221c:	c1 e8 03             	shr    $0x3,%eax
8010221f:	03 05 94 a5 15 80    	add    0x8015a594,%eax
80102225:	50                   	push   %eax
80102226:	56                   	push   %esi
80102227:	e8 84 e4 ff ff       	call   801006b0 <bread>
8010222c:	89 c7                	mov    %eax,%edi
8010222e:	89 d8                	mov    %ebx,%eax
80102230:	83 c4 10             	add    $0x10,%esp
80102233:	83 e0 07             	and    $0x7,%eax
80102236:	c1 e0 06             	shl    $0x6,%eax
80102239:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010223d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80102241:	75 bd                	jne    80102200 <ialloc+0x30>
80102243:	83 ec 04             	sub    $0x4,%esp
80102246:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80102249:	6a 40                	push   $0x40
8010224b:	6a 00                	push   $0x0
8010224d:	51                   	push   %ecx
8010224e:	e8 7d 3b 00 00       	call   80105dd0 <memset>
80102253:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80102257:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010225a:	66 89 01             	mov    %ax,(%ecx)
8010225d:	89 3c 24             	mov    %edi,(%esp)
80102260:	e8 cb 17 00 00       	call   80103a30 <log_write>
80102265:	89 3c 24             	mov    %edi,(%esp)
80102268:	e8 53 e5 ff ff       	call   801007c0 <brelse>
8010226d:	83 c4 10             	add    $0x10,%esp
80102270:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102273:	89 da                	mov    %ebx,%edx
80102275:	89 f0                	mov    %esi,%eax
80102277:	5b                   	pop    %ebx
80102278:	5e                   	pop    %esi
80102279:	5f                   	pop    %edi
8010227a:	5d                   	pop    %ebp
8010227b:	e9 50 fc ff ff       	jmp    80101ed0 <iget>
80102280:	83 ec 0c             	sub    $0xc,%esp
80102283:	68 32 93 10 80       	push   $0x80109332
80102288:	e8 e3 e6 ff ff       	call   80100970 <panic>
8010228d:	8d 76 00             	lea    0x0(%esi),%esi

80102290 <iupdate>:
80102290:	55                   	push   %ebp
80102291:	89 e5                	mov    %esp,%ebp
80102293:	56                   	push   %esi
80102294:	53                   	push   %ebx
80102295:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102298:	83 ec 08             	sub    $0x8,%esp
8010229b:	8b 43 04             	mov    0x4(%ebx),%eax
8010229e:	83 c3 5c             	add    $0x5c,%ebx
801022a1:	c1 e8 03             	shr    $0x3,%eax
801022a4:	03 05 94 a5 15 80    	add    0x8015a594,%eax
801022aa:	50                   	push   %eax
801022ab:	ff 73 a4             	pushl  -0x5c(%ebx)
801022ae:	e8 fd e3 ff ff       	call   801006b0 <bread>
801022b3:	89 c6                	mov    %eax,%esi
801022b5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801022b8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801022bc:	83 c4 0c             	add    $0xc,%esp
801022bf:	83 e0 07             	and    $0x7,%eax
801022c2:	c1 e0 06             	shl    $0x6,%eax
801022c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801022c9:	66 89 10             	mov    %dx,(%eax)
801022cc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
801022d0:	83 c0 0c             	add    $0xc,%eax
801022d3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
801022d7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801022db:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801022df:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801022e3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
801022e7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801022ea:	89 50 fc             	mov    %edx,-0x4(%eax)
801022ed:	6a 34                	push   $0x34
801022ef:	53                   	push   %ebx
801022f0:	50                   	push   %eax
801022f1:	e8 8a 3b 00 00       	call   80105e80 <memmove>
801022f6:	89 34 24             	mov    %esi,(%esp)
801022f9:	e8 32 17 00 00       	call   80103a30 <log_write>
801022fe:	89 75 08             	mov    %esi,0x8(%ebp)
80102301:	83 c4 10             	add    $0x10,%esp
80102304:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102307:	5b                   	pop    %ebx
80102308:	5e                   	pop    %esi
80102309:	5d                   	pop    %ebp
8010230a:	e9 b1 e4 ff ff       	jmp    801007c0 <brelse>
8010230f:	90                   	nop

80102310 <idup>:
80102310:	55                   	push   %ebp
80102311:	89 e5                	mov    %esp,%ebp
80102313:	53                   	push   %ebx
80102314:	83 ec 10             	sub    $0x10,%esp
80102317:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010231a:	68 a0 a5 15 80       	push   $0x8015a5a0
8010231f:	e8 2c 39 00 00       	call   80105c50 <acquire>
80102324:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80102328:	c7 04 24 a0 a5 15 80 	movl   $0x8015a5a0,(%esp)
8010232f:	e8 3c 3a 00 00       	call   80105d70 <release>
80102334:	89 d8                	mov    %ebx,%eax
80102336:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102339:	c9                   	leave  
8010233a:	c3                   	ret    
8010233b:	90                   	nop
8010233c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102340 <ilock>:
80102340:	55                   	push   %ebp
80102341:	89 e5                	mov    %esp,%ebp
80102343:	56                   	push   %esi
80102344:	53                   	push   %ebx
80102345:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102348:	85 db                	test   %ebx,%ebx
8010234a:	0f 84 b7 00 00 00    	je     80102407 <ilock+0xc7>
80102350:	8b 53 08             	mov    0x8(%ebx),%edx
80102353:	85 d2                	test   %edx,%edx
80102355:	0f 8e ac 00 00 00    	jle    80102407 <ilock+0xc7>
8010235b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010235e:	83 ec 0c             	sub    $0xc,%esp
80102361:	50                   	push   %eax
80102362:	e8 29 37 00 00       	call   80105a90 <acquiresleep>
80102367:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010236a:	83 c4 10             	add    $0x10,%esp
8010236d:	85 c0                	test   %eax,%eax
8010236f:	74 0f                	je     80102380 <ilock+0x40>
80102371:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102374:	5b                   	pop    %ebx
80102375:	5e                   	pop    %esi
80102376:	5d                   	pop    %ebp
80102377:	c3                   	ret    
80102378:	90                   	nop
80102379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102380:	8b 43 04             	mov    0x4(%ebx),%eax
80102383:	83 ec 08             	sub    $0x8,%esp
80102386:	c1 e8 03             	shr    $0x3,%eax
80102389:	03 05 94 a5 15 80    	add    0x8015a594,%eax
8010238f:	50                   	push   %eax
80102390:	ff 33                	pushl  (%ebx)
80102392:	e8 19 e3 ff ff       	call   801006b0 <bread>
80102397:	89 c6                	mov    %eax,%esi
80102399:	8b 43 04             	mov    0x4(%ebx),%eax
8010239c:	83 c4 0c             	add    $0xc,%esp
8010239f:	83 e0 07             	and    $0x7,%eax
801023a2:	c1 e0 06             	shl    $0x6,%eax
801023a5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801023a9:	0f b7 10             	movzwl (%eax),%edx
801023ac:	83 c0 0c             	add    $0xc,%eax
801023af:	66 89 53 50          	mov    %dx,0x50(%ebx)
801023b3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801023b7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801023bb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801023bf:	66 89 53 54          	mov    %dx,0x54(%ebx)
801023c3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801023c7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801023cb:	8b 50 fc             	mov    -0x4(%eax),%edx
801023ce:	89 53 58             	mov    %edx,0x58(%ebx)
801023d1:	6a 34                	push   $0x34
801023d3:	50                   	push   %eax
801023d4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801023d7:	50                   	push   %eax
801023d8:	e8 a3 3a 00 00       	call   80105e80 <memmove>
801023dd:	89 34 24             	mov    %esi,(%esp)
801023e0:	e8 db e3 ff ff       	call   801007c0 <brelse>
801023e5:	83 c4 10             	add    $0x10,%esp
801023e8:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
801023ed:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
801023f4:	0f 85 77 ff ff ff    	jne    80102371 <ilock+0x31>
801023fa:	83 ec 0c             	sub    $0xc,%esp
801023fd:	68 4a 93 10 80       	push   $0x8010934a
80102402:	e8 69 e5 ff ff       	call   80100970 <panic>
80102407:	83 ec 0c             	sub    $0xc,%esp
8010240a:	68 44 93 10 80       	push   $0x80109344
8010240f:	e8 5c e5 ff ff       	call   80100970 <panic>
80102414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010241a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102420 <iunlock>:
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx
80102425:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102428:	85 db                	test   %ebx,%ebx
8010242a:	74 28                	je     80102454 <iunlock+0x34>
8010242c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010242f:	83 ec 0c             	sub    $0xc,%esp
80102432:	56                   	push   %esi
80102433:	e8 f8 36 00 00       	call   80105b30 <holdingsleep>
80102438:	83 c4 10             	add    $0x10,%esp
8010243b:	85 c0                	test   %eax,%eax
8010243d:	74 15                	je     80102454 <iunlock+0x34>
8010243f:	8b 43 08             	mov    0x8(%ebx),%eax
80102442:	85 c0                	test   %eax,%eax
80102444:	7e 0e                	jle    80102454 <iunlock+0x34>
80102446:	89 75 08             	mov    %esi,0x8(%ebp)
80102449:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010244c:	5b                   	pop    %ebx
8010244d:	5e                   	pop    %esi
8010244e:	5d                   	pop    %ebp
8010244f:	e9 9c 36 00 00       	jmp    80105af0 <releasesleep>
80102454:	83 ec 0c             	sub    $0xc,%esp
80102457:	68 59 93 10 80       	push   $0x80109359
8010245c:	e8 0f e5 ff ff       	call   80100970 <panic>
80102461:	eb 0d                	jmp    80102470 <iput>
80102463:	90                   	nop
80102464:	90                   	nop
80102465:	90                   	nop
80102466:	90                   	nop
80102467:	90                   	nop
80102468:	90                   	nop
80102469:	90                   	nop
8010246a:	90                   	nop
8010246b:	90                   	nop
8010246c:	90                   	nop
8010246d:	90                   	nop
8010246e:	90                   	nop
8010246f:	90                   	nop

80102470 <iput>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	57                   	push   %edi
80102474:	56                   	push   %esi
80102475:	53                   	push   %ebx
80102476:	83 ec 28             	sub    $0x28,%esp
80102479:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010247c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010247f:	57                   	push   %edi
80102480:	e8 0b 36 00 00       	call   80105a90 <acquiresleep>
80102485:	8b 53 4c             	mov    0x4c(%ebx),%edx
80102488:	83 c4 10             	add    $0x10,%esp
8010248b:	85 d2                	test   %edx,%edx
8010248d:	74 07                	je     80102496 <iput+0x26>
8010248f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80102494:	74 32                	je     801024c8 <iput+0x58>
80102496:	83 ec 0c             	sub    $0xc,%esp
80102499:	57                   	push   %edi
8010249a:	e8 51 36 00 00       	call   80105af0 <releasesleep>
8010249f:	c7 04 24 a0 a5 15 80 	movl   $0x8015a5a0,(%esp)
801024a6:	e8 a5 37 00 00       	call   80105c50 <acquire>
801024ab:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
801024af:	83 c4 10             	add    $0x10,%esp
801024b2:	c7 45 08 a0 a5 15 80 	movl   $0x8015a5a0,0x8(%ebp)
801024b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801024bc:	5b                   	pop    %ebx
801024bd:	5e                   	pop    %esi
801024be:	5f                   	pop    %edi
801024bf:	5d                   	pop    %ebp
801024c0:	e9 ab 38 00 00       	jmp    80105d70 <release>
801024c5:	8d 76 00             	lea    0x0(%esi),%esi
801024c8:	83 ec 0c             	sub    $0xc,%esp
801024cb:	68 a0 a5 15 80       	push   $0x8015a5a0
801024d0:	e8 7b 37 00 00       	call   80105c50 <acquire>
801024d5:	8b 73 08             	mov    0x8(%ebx),%esi
801024d8:	c7 04 24 a0 a5 15 80 	movl   $0x8015a5a0,(%esp)
801024df:	e8 8c 38 00 00       	call   80105d70 <release>
801024e4:	83 c4 10             	add    $0x10,%esp
801024e7:	83 fe 01             	cmp    $0x1,%esi
801024ea:	75 aa                	jne    80102496 <iput+0x26>
801024ec:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
801024f2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801024f5:	8d 73 5c             	lea    0x5c(%ebx),%esi
801024f8:	89 cf                	mov    %ecx,%edi
801024fa:	eb 0b                	jmp    80102507 <iput+0x97>
801024fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102500:	83 c6 04             	add    $0x4,%esi
80102503:	39 fe                	cmp    %edi,%esi
80102505:	74 19                	je     80102520 <iput+0xb0>
80102507:	8b 16                	mov    (%esi),%edx
80102509:	85 d2                	test   %edx,%edx
8010250b:	74 f3                	je     80102500 <iput+0x90>
8010250d:	8b 03                	mov    (%ebx),%eax
8010250f:	e8 ac fb ff ff       	call   801020c0 <bfree>
80102514:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010251a:	eb e4                	jmp    80102500 <iput+0x90>
8010251c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102520:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80102526:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80102529:	85 c0                	test   %eax,%eax
8010252b:	75 33                	jne    80102560 <iput+0xf0>
8010252d:	83 ec 0c             	sub    $0xc,%esp
80102530:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80102537:	53                   	push   %ebx
80102538:	e8 53 fd ff ff       	call   80102290 <iupdate>
8010253d:	31 c0                	xor    %eax,%eax
8010253f:	66 89 43 50          	mov    %ax,0x50(%ebx)
80102543:	89 1c 24             	mov    %ebx,(%esp)
80102546:	e8 45 fd ff ff       	call   80102290 <iupdate>
8010254b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80102552:	83 c4 10             	add    $0x10,%esp
80102555:	e9 3c ff ff ff       	jmp    80102496 <iput+0x26>
8010255a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102560:	83 ec 08             	sub    $0x8,%esp
80102563:	50                   	push   %eax
80102564:	ff 33                	pushl  (%ebx)
80102566:	e8 45 e1 ff ff       	call   801006b0 <bread>
8010256b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80102571:	89 7d e0             	mov    %edi,-0x20(%ebp)
80102574:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102577:	8d 70 5c             	lea    0x5c(%eax),%esi
8010257a:	83 c4 10             	add    $0x10,%esp
8010257d:	89 cf                	mov    %ecx,%edi
8010257f:	eb 0e                	jmp    8010258f <iput+0x11f>
80102581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102588:	83 c6 04             	add    $0x4,%esi
8010258b:	39 fe                	cmp    %edi,%esi
8010258d:	74 0f                	je     8010259e <iput+0x12e>
8010258f:	8b 16                	mov    (%esi),%edx
80102591:	85 d2                	test   %edx,%edx
80102593:	74 f3                	je     80102588 <iput+0x118>
80102595:	8b 03                	mov    (%ebx),%eax
80102597:	e8 24 fb ff ff       	call   801020c0 <bfree>
8010259c:	eb ea                	jmp    80102588 <iput+0x118>
8010259e:	83 ec 0c             	sub    $0xc,%esp
801025a1:	ff 75 e4             	pushl  -0x1c(%ebp)
801025a4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801025a7:	e8 14 e2 ff ff       	call   801007c0 <brelse>
801025ac:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801025b2:	8b 03                	mov    (%ebx),%eax
801025b4:	e8 07 fb ff ff       	call   801020c0 <bfree>
801025b9:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801025c0:	00 00 00 
801025c3:	83 c4 10             	add    $0x10,%esp
801025c6:	e9 62 ff ff ff       	jmp    8010252d <iput+0xbd>
801025cb:	90                   	nop
801025cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801025d0 <iunlockput>:
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	53                   	push   %ebx
801025d4:	83 ec 10             	sub    $0x10,%esp
801025d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801025da:	53                   	push   %ebx
801025db:	e8 40 fe ff ff       	call   80102420 <iunlock>
801025e0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801025e3:	83 c4 10             	add    $0x10,%esp
801025e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801025e9:	c9                   	leave  
801025ea:	e9 81 fe ff ff       	jmp    80102470 <iput>
801025ef:	90                   	nop

801025f0 <stati>:
801025f0:	55                   	push   %ebp
801025f1:	89 e5                	mov    %esp,%ebp
801025f3:	8b 55 08             	mov    0x8(%ebp),%edx
801025f6:	8b 45 0c             	mov    0xc(%ebp),%eax
801025f9:	8b 0a                	mov    (%edx),%ecx
801025fb:	89 48 04             	mov    %ecx,0x4(%eax)
801025fe:	8b 4a 04             	mov    0x4(%edx),%ecx
80102601:	89 48 08             	mov    %ecx,0x8(%eax)
80102604:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80102608:	66 89 08             	mov    %cx,(%eax)
8010260b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010260f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80102613:	8b 52 58             	mov    0x58(%edx),%edx
80102616:	89 50 10             	mov    %edx,0x10(%eax)
80102619:	5d                   	pop    %ebp
8010261a:	c3                   	ret    
8010261b:	90                   	nop
8010261c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102620 <readi>:
80102620:	55                   	push   %ebp
80102621:	89 e5                	mov    %esp,%ebp
80102623:	57                   	push   %edi
80102624:	56                   	push   %esi
80102625:	53                   	push   %ebx
80102626:	83 ec 1c             	sub    $0x1c,%esp
80102629:	8b 45 08             	mov    0x8(%ebp),%eax
8010262c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010262f:	8b 7d 14             	mov    0x14(%ebp),%edi
80102632:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80102637:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010263a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010263d:	8b 75 10             	mov    0x10(%ebp),%esi
80102640:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80102643:	0f 84 a7 00 00 00    	je     801026f0 <readi+0xd0>
80102649:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010264c:	8b 40 58             	mov    0x58(%eax),%eax
8010264f:	39 c6                	cmp    %eax,%esi
80102651:	0f 87 ba 00 00 00    	ja     80102711 <readi+0xf1>
80102657:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010265a:	89 f9                	mov    %edi,%ecx
8010265c:	01 f1                	add    %esi,%ecx
8010265e:	0f 82 ad 00 00 00    	jb     80102711 <readi+0xf1>
80102664:	89 c2                	mov    %eax,%edx
80102666:	29 f2                	sub    %esi,%edx
80102668:	39 c8                	cmp    %ecx,%eax
8010266a:	0f 43 d7             	cmovae %edi,%edx
8010266d:	31 ff                	xor    %edi,%edi
8010266f:	85 d2                	test   %edx,%edx
80102671:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80102674:	74 6c                	je     801026e2 <readi+0xc2>
80102676:	8d 76 00             	lea    0x0(%esi),%esi
80102679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102680:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80102683:	89 f2                	mov    %esi,%edx
80102685:	c1 ea 09             	shr    $0x9,%edx
80102688:	89 d8                	mov    %ebx,%eax
8010268a:	e8 11 f9 ff ff       	call   80101fa0 <bmap>
8010268f:	83 ec 08             	sub    $0x8,%esp
80102692:	50                   	push   %eax
80102693:	ff 33                	pushl  (%ebx)
80102695:	e8 16 e0 ff ff       	call   801006b0 <bread>
8010269a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010269d:	89 c2                	mov    %eax,%edx
8010269f:	89 f0                	mov    %esi,%eax
801026a1:	25 ff 01 00 00       	and    $0x1ff,%eax
801026a6:	b9 00 02 00 00       	mov    $0x200,%ecx
801026ab:	83 c4 0c             	add    $0xc,%esp
801026ae:	29 c1                	sub    %eax,%ecx
801026b0:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801026b4:	89 55 dc             	mov    %edx,-0x24(%ebp)
801026b7:	29 fb                	sub    %edi,%ebx
801026b9:	39 d9                	cmp    %ebx,%ecx
801026bb:	0f 46 d9             	cmovbe %ecx,%ebx
801026be:	53                   	push   %ebx
801026bf:	50                   	push   %eax
801026c0:	01 df                	add    %ebx,%edi
801026c2:	ff 75 e0             	pushl  -0x20(%ebp)
801026c5:	01 de                	add    %ebx,%esi
801026c7:	e8 b4 37 00 00       	call   80105e80 <memmove>
801026cc:	8b 55 dc             	mov    -0x24(%ebp),%edx
801026cf:	89 14 24             	mov    %edx,(%esp)
801026d2:	e8 e9 e0 ff ff       	call   801007c0 <brelse>
801026d7:	01 5d e0             	add    %ebx,-0x20(%ebp)
801026da:	83 c4 10             	add    $0x10,%esp
801026dd:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801026e0:	77 9e                	ja     80102680 <readi+0x60>
801026e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801026e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801026e8:	5b                   	pop    %ebx
801026e9:	5e                   	pop    %esi
801026ea:	5f                   	pop    %edi
801026eb:	5d                   	pop    %ebp
801026ec:	c3                   	ret    
801026ed:	8d 76 00             	lea    0x0(%esi),%esi
801026f0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801026f4:	66 83 f8 09          	cmp    $0x9,%ax
801026f8:	77 17                	ja     80102711 <readi+0xf1>
801026fa:	8b 04 c5 20 a5 15 80 	mov    -0x7fea5ae0(,%eax,8),%eax
80102701:	85 c0                	test   %eax,%eax
80102703:	74 0c                	je     80102711 <readi+0xf1>
80102705:	89 7d 10             	mov    %edi,0x10(%ebp)
80102708:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010270b:	5b                   	pop    %ebx
8010270c:	5e                   	pop    %esi
8010270d:	5f                   	pop    %edi
8010270e:	5d                   	pop    %ebp
8010270f:	ff e0                	jmp    *%eax
80102711:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102716:	eb cd                	jmp    801026e5 <readi+0xc5>
80102718:	90                   	nop
80102719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102720 <writei>:
80102720:	55                   	push   %ebp
80102721:	89 e5                	mov    %esp,%ebp
80102723:	57                   	push   %edi
80102724:	56                   	push   %esi
80102725:	53                   	push   %ebx
80102726:	83 ec 1c             	sub    $0x1c,%esp
80102729:	8b 45 08             	mov    0x8(%ebp),%eax
8010272c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010272f:	8b 7d 14             	mov    0x14(%ebp),%edi
80102732:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80102737:	89 75 dc             	mov    %esi,-0x24(%ebp)
8010273a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010273d:	8b 75 10             	mov    0x10(%ebp),%esi
80102740:	89 7d e0             	mov    %edi,-0x20(%ebp)
80102743:	0f 84 b7 00 00 00    	je     80102800 <writei+0xe0>
80102749:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010274c:	39 70 58             	cmp    %esi,0x58(%eax)
8010274f:	0f 82 eb 00 00 00    	jb     80102840 <writei+0x120>
80102755:	8b 7d e0             	mov    -0x20(%ebp),%edi
80102758:	31 d2                	xor    %edx,%edx
8010275a:	89 f8                	mov    %edi,%eax
8010275c:	01 f0                	add    %esi,%eax
8010275e:	0f 92 c2             	setb   %dl
80102761:	3d 00 18 01 00       	cmp    $0x11800,%eax
80102766:	0f 87 d4 00 00 00    	ja     80102840 <writei+0x120>
8010276c:	85 d2                	test   %edx,%edx
8010276e:	0f 85 cc 00 00 00    	jne    80102840 <writei+0x120>
80102774:	85 ff                	test   %edi,%edi
80102776:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010277d:	74 72                	je     801027f1 <writei+0xd1>
8010277f:	90                   	nop
80102780:	8b 7d d8             	mov    -0x28(%ebp),%edi
80102783:	89 f2                	mov    %esi,%edx
80102785:	c1 ea 09             	shr    $0x9,%edx
80102788:	89 f8                	mov    %edi,%eax
8010278a:	e8 11 f8 ff ff       	call   80101fa0 <bmap>
8010278f:	83 ec 08             	sub    $0x8,%esp
80102792:	50                   	push   %eax
80102793:	ff 37                	pushl  (%edi)
80102795:	e8 16 df ff ff       	call   801006b0 <bread>
8010279a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
8010279d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
801027a0:	89 c7                	mov    %eax,%edi
801027a2:	89 f0                	mov    %esi,%eax
801027a4:	b9 00 02 00 00       	mov    $0x200,%ecx
801027a9:	83 c4 0c             	add    $0xc,%esp
801027ac:	25 ff 01 00 00       	and    $0x1ff,%eax
801027b1:	29 c1                	sub    %eax,%ecx
801027b3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
801027b7:	39 d9                	cmp    %ebx,%ecx
801027b9:	0f 46 d9             	cmovbe %ecx,%ebx
801027bc:	53                   	push   %ebx
801027bd:	ff 75 dc             	pushl  -0x24(%ebp)
801027c0:	01 de                	add    %ebx,%esi
801027c2:	50                   	push   %eax
801027c3:	e8 b8 36 00 00       	call   80105e80 <memmove>
801027c8:	89 3c 24             	mov    %edi,(%esp)
801027cb:	e8 60 12 00 00       	call   80103a30 <log_write>
801027d0:	89 3c 24             	mov    %edi,(%esp)
801027d3:	e8 e8 df ff ff       	call   801007c0 <brelse>
801027d8:	01 5d e4             	add    %ebx,-0x1c(%ebp)
801027db:	01 5d dc             	add    %ebx,-0x24(%ebp)
801027de:	83 c4 10             	add    $0x10,%esp
801027e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801027e4:	39 45 e0             	cmp    %eax,-0x20(%ebp)
801027e7:	77 97                	ja     80102780 <writei+0x60>
801027e9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801027ec:	3b 70 58             	cmp    0x58(%eax),%esi
801027ef:	77 37                	ja     80102828 <writei+0x108>
801027f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
801027f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801027f7:	5b                   	pop    %ebx
801027f8:	5e                   	pop    %esi
801027f9:	5f                   	pop    %edi
801027fa:	5d                   	pop    %ebp
801027fb:	c3                   	ret    
801027fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102800:	0f bf 40 52          	movswl 0x52(%eax),%eax
80102804:	66 83 f8 09          	cmp    $0x9,%ax
80102808:	77 36                	ja     80102840 <writei+0x120>
8010280a:	8b 04 c5 24 a5 15 80 	mov    -0x7fea5adc(,%eax,8),%eax
80102811:	85 c0                	test   %eax,%eax
80102813:	74 2b                	je     80102840 <writei+0x120>
80102815:	89 7d 10             	mov    %edi,0x10(%ebp)
80102818:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010281b:	5b                   	pop    %ebx
8010281c:	5e                   	pop    %esi
8010281d:	5f                   	pop    %edi
8010281e:	5d                   	pop    %ebp
8010281f:	ff e0                	jmp    *%eax
80102821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102828:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010282b:	83 ec 0c             	sub    $0xc,%esp
8010282e:	89 70 58             	mov    %esi,0x58(%eax)
80102831:	50                   	push   %eax
80102832:	e8 59 fa ff ff       	call   80102290 <iupdate>
80102837:	83 c4 10             	add    $0x10,%esp
8010283a:	eb b5                	jmp    801027f1 <writei+0xd1>
8010283c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102840:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102845:	eb ad                	jmp    801027f4 <writei+0xd4>
80102847:	89 f6                	mov    %esi,%esi
80102849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102850 <namecmp>:
80102850:	55                   	push   %ebp
80102851:	89 e5                	mov    %esp,%ebp
80102853:	83 ec 0c             	sub    $0xc,%esp
80102856:	6a 0e                	push   $0xe
80102858:	ff 75 0c             	pushl  0xc(%ebp)
8010285b:	ff 75 08             	pushl  0x8(%ebp)
8010285e:	e8 8d 36 00 00       	call   80105ef0 <strncmp>
80102863:	c9                   	leave  
80102864:	c3                   	ret    
80102865:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102870 <dirlookup>:
80102870:	55                   	push   %ebp
80102871:	89 e5                	mov    %esp,%ebp
80102873:	57                   	push   %edi
80102874:	56                   	push   %esi
80102875:	53                   	push   %ebx
80102876:	83 ec 1c             	sub    $0x1c,%esp
80102879:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010287c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80102881:	0f 85 85 00 00 00    	jne    8010290c <dirlookup+0x9c>
80102887:	8b 53 58             	mov    0x58(%ebx),%edx
8010288a:	31 ff                	xor    %edi,%edi
8010288c:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010288f:	85 d2                	test   %edx,%edx
80102891:	74 3e                	je     801028d1 <dirlookup+0x61>
80102893:	90                   	nop
80102894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102898:	6a 10                	push   $0x10
8010289a:	57                   	push   %edi
8010289b:	56                   	push   %esi
8010289c:	53                   	push   %ebx
8010289d:	e8 7e fd ff ff       	call   80102620 <readi>
801028a2:	83 c4 10             	add    $0x10,%esp
801028a5:	83 f8 10             	cmp    $0x10,%eax
801028a8:	75 55                	jne    801028ff <dirlookup+0x8f>
801028aa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801028af:	74 18                	je     801028c9 <dirlookup+0x59>
801028b1:	8d 45 da             	lea    -0x26(%ebp),%eax
801028b4:	83 ec 04             	sub    $0x4,%esp
801028b7:	6a 0e                	push   $0xe
801028b9:	50                   	push   %eax
801028ba:	ff 75 0c             	pushl  0xc(%ebp)
801028bd:	e8 2e 36 00 00       	call   80105ef0 <strncmp>
801028c2:	83 c4 10             	add    $0x10,%esp
801028c5:	85 c0                	test   %eax,%eax
801028c7:	74 17                	je     801028e0 <dirlookup+0x70>
801028c9:	83 c7 10             	add    $0x10,%edi
801028cc:	3b 7b 58             	cmp    0x58(%ebx),%edi
801028cf:	72 c7                	jb     80102898 <dirlookup+0x28>
801028d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801028d4:	31 c0                	xor    %eax,%eax
801028d6:	5b                   	pop    %ebx
801028d7:	5e                   	pop    %esi
801028d8:	5f                   	pop    %edi
801028d9:	5d                   	pop    %ebp
801028da:	c3                   	ret    
801028db:	90                   	nop
801028dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801028e0:	8b 45 10             	mov    0x10(%ebp),%eax
801028e3:	85 c0                	test   %eax,%eax
801028e5:	74 05                	je     801028ec <dirlookup+0x7c>
801028e7:	8b 45 10             	mov    0x10(%ebp),%eax
801028ea:	89 38                	mov    %edi,(%eax)
801028ec:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
801028f0:	8b 03                	mov    (%ebx),%eax
801028f2:	e8 d9 f5 ff ff       	call   80101ed0 <iget>
801028f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801028fa:	5b                   	pop    %ebx
801028fb:	5e                   	pop    %esi
801028fc:	5f                   	pop    %edi
801028fd:	5d                   	pop    %ebp
801028fe:	c3                   	ret    
801028ff:	83 ec 0c             	sub    $0xc,%esp
80102902:	68 73 93 10 80       	push   $0x80109373
80102907:	e8 64 e0 ff ff       	call   80100970 <panic>
8010290c:	83 ec 0c             	sub    $0xc,%esp
8010290f:	68 61 93 10 80       	push   $0x80109361
80102914:	e8 57 e0 ff ff       	call   80100970 <panic>
80102919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102920 <namex>:
80102920:	55                   	push   %ebp
80102921:	89 e5                	mov    %esp,%ebp
80102923:	57                   	push   %edi
80102924:	56                   	push   %esi
80102925:	53                   	push   %ebx
80102926:	89 cf                	mov    %ecx,%edi
80102928:	89 c3                	mov    %eax,%ebx
8010292a:	83 ec 1c             	sub    $0x1c,%esp
8010292d:	80 38 2f             	cmpb   $0x2f,(%eax)
80102930:	89 55 e0             	mov    %edx,-0x20(%ebp)
80102933:	0f 84 67 01 00 00    	je     80102aa0 <namex+0x180>
80102939:	e8 22 28 00 00       	call   80105160 <myproc>
8010293e:	83 ec 0c             	sub    $0xc,%esp
80102941:	8b 70 68             	mov    0x68(%eax),%esi
80102944:	68 a0 a5 15 80       	push   $0x8015a5a0
80102949:	e8 02 33 00 00       	call   80105c50 <acquire>
8010294e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80102952:	c7 04 24 a0 a5 15 80 	movl   $0x8015a5a0,(%esp)
80102959:	e8 12 34 00 00       	call   80105d70 <release>
8010295e:	83 c4 10             	add    $0x10,%esp
80102961:	eb 08                	jmp    8010296b <namex+0x4b>
80102963:	90                   	nop
80102964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102968:	83 c3 01             	add    $0x1,%ebx
8010296b:	0f b6 03             	movzbl (%ebx),%eax
8010296e:	3c 2f                	cmp    $0x2f,%al
80102970:	74 f6                	je     80102968 <namex+0x48>
80102972:	84 c0                	test   %al,%al
80102974:	0f 84 ee 00 00 00    	je     80102a68 <namex+0x148>
8010297a:	0f b6 03             	movzbl (%ebx),%eax
8010297d:	3c 2f                	cmp    $0x2f,%al
8010297f:	0f 84 b3 00 00 00    	je     80102a38 <namex+0x118>
80102985:	84 c0                	test   %al,%al
80102987:	89 da                	mov    %ebx,%edx
80102989:	75 09                	jne    80102994 <namex+0x74>
8010298b:	e9 a8 00 00 00       	jmp    80102a38 <namex+0x118>
80102990:	84 c0                	test   %al,%al
80102992:	74 0a                	je     8010299e <namex+0x7e>
80102994:	83 c2 01             	add    $0x1,%edx
80102997:	0f b6 02             	movzbl (%edx),%eax
8010299a:	3c 2f                	cmp    $0x2f,%al
8010299c:	75 f2                	jne    80102990 <namex+0x70>
8010299e:	89 d1                	mov    %edx,%ecx
801029a0:	29 d9                	sub    %ebx,%ecx
801029a2:	83 f9 0d             	cmp    $0xd,%ecx
801029a5:	0f 8e 91 00 00 00    	jle    80102a3c <namex+0x11c>
801029ab:	83 ec 04             	sub    $0x4,%esp
801029ae:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801029b1:	6a 0e                	push   $0xe
801029b3:	53                   	push   %ebx
801029b4:	57                   	push   %edi
801029b5:	e8 c6 34 00 00       	call   80105e80 <memmove>
801029ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801029bd:	83 c4 10             	add    $0x10,%esp
801029c0:	89 d3                	mov    %edx,%ebx
801029c2:	80 3a 2f             	cmpb   $0x2f,(%edx)
801029c5:	75 11                	jne    801029d8 <namex+0xb8>
801029c7:	89 f6                	mov    %esi,%esi
801029c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801029d0:	83 c3 01             	add    $0x1,%ebx
801029d3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
801029d6:	74 f8                	je     801029d0 <namex+0xb0>
801029d8:	83 ec 0c             	sub    $0xc,%esp
801029db:	56                   	push   %esi
801029dc:	e8 5f f9 ff ff       	call   80102340 <ilock>
801029e1:	83 c4 10             	add    $0x10,%esp
801029e4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801029e9:	0f 85 91 00 00 00    	jne    80102a80 <namex+0x160>
801029ef:	8b 55 e0             	mov    -0x20(%ebp),%edx
801029f2:	85 d2                	test   %edx,%edx
801029f4:	74 09                	je     801029ff <namex+0xdf>
801029f6:	80 3b 00             	cmpb   $0x0,(%ebx)
801029f9:	0f 84 b7 00 00 00    	je     80102ab6 <namex+0x196>
801029ff:	83 ec 04             	sub    $0x4,%esp
80102a02:	6a 00                	push   $0x0
80102a04:	57                   	push   %edi
80102a05:	56                   	push   %esi
80102a06:	e8 65 fe ff ff       	call   80102870 <dirlookup>
80102a0b:	83 c4 10             	add    $0x10,%esp
80102a0e:	85 c0                	test   %eax,%eax
80102a10:	74 6e                	je     80102a80 <namex+0x160>
80102a12:	83 ec 0c             	sub    $0xc,%esp
80102a15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102a18:	56                   	push   %esi
80102a19:	e8 02 fa ff ff       	call   80102420 <iunlock>
80102a1e:	89 34 24             	mov    %esi,(%esp)
80102a21:	e8 4a fa ff ff       	call   80102470 <iput>
80102a26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102a29:	83 c4 10             	add    $0x10,%esp
80102a2c:	89 c6                	mov    %eax,%esi
80102a2e:	e9 38 ff ff ff       	jmp    8010296b <namex+0x4b>
80102a33:	90                   	nop
80102a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a38:	89 da                	mov    %ebx,%edx
80102a3a:	31 c9                	xor    %ecx,%ecx
80102a3c:	83 ec 04             	sub    $0x4,%esp
80102a3f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80102a42:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80102a45:	51                   	push   %ecx
80102a46:	53                   	push   %ebx
80102a47:	57                   	push   %edi
80102a48:	e8 33 34 00 00       	call   80105e80 <memmove>
80102a4d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80102a50:	8b 55 dc             	mov    -0x24(%ebp),%edx
80102a53:	83 c4 10             	add    $0x10,%esp
80102a56:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80102a5a:	89 d3                	mov    %edx,%ebx
80102a5c:	e9 61 ff ff ff       	jmp    801029c2 <namex+0xa2>
80102a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a68:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102a6b:	85 c0                	test   %eax,%eax
80102a6d:	75 5d                	jne    80102acc <namex+0x1ac>
80102a6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a72:	89 f0                	mov    %esi,%eax
80102a74:	5b                   	pop    %ebx
80102a75:	5e                   	pop    %esi
80102a76:	5f                   	pop    %edi
80102a77:	5d                   	pop    %ebp
80102a78:	c3                   	ret    
80102a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a80:	83 ec 0c             	sub    $0xc,%esp
80102a83:	56                   	push   %esi
80102a84:	e8 97 f9 ff ff       	call   80102420 <iunlock>
80102a89:	89 34 24             	mov    %esi,(%esp)
80102a8c:	31 f6                	xor    %esi,%esi
80102a8e:	e8 dd f9 ff ff       	call   80102470 <iput>
80102a93:	83 c4 10             	add    $0x10,%esp
80102a96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a99:	89 f0                	mov    %esi,%eax
80102a9b:	5b                   	pop    %ebx
80102a9c:	5e                   	pop    %esi
80102a9d:	5f                   	pop    %edi
80102a9e:	5d                   	pop    %ebp
80102a9f:	c3                   	ret    
80102aa0:	ba 01 00 00 00       	mov    $0x1,%edx
80102aa5:	b8 01 00 00 00       	mov    $0x1,%eax
80102aaa:	e8 21 f4 ff ff       	call   80101ed0 <iget>
80102aaf:	89 c6                	mov    %eax,%esi
80102ab1:	e9 b5 fe ff ff       	jmp    8010296b <namex+0x4b>
80102ab6:	83 ec 0c             	sub    $0xc,%esp
80102ab9:	56                   	push   %esi
80102aba:	e8 61 f9 ff ff       	call   80102420 <iunlock>
80102abf:	83 c4 10             	add    $0x10,%esp
80102ac2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ac5:	89 f0                	mov    %esi,%eax
80102ac7:	5b                   	pop    %ebx
80102ac8:	5e                   	pop    %esi
80102ac9:	5f                   	pop    %edi
80102aca:	5d                   	pop    %ebp
80102acb:	c3                   	ret    
80102acc:	83 ec 0c             	sub    $0xc,%esp
80102acf:	56                   	push   %esi
80102ad0:	31 f6                	xor    %esi,%esi
80102ad2:	e8 99 f9 ff ff       	call   80102470 <iput>
80102ad7:	83 c4 10             	add    $0x10,%esp
80102ada:	eb 93                	jmp    80102a6f <namex+0x14f>
80102adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102ae0 <dirlink>:
80102ae0:	55                   	push   %ebp
80102ae1:	89 e5                	mov    %esp,%ebp
80102ae3:	57                   	push   %edi
80102ae4:	56                   	push   %esi
80102ae5:	53                   	push   %ebx
80102ae6:	83 ec 20             	sub    $0x20,%esp
80102ae9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aec:	6a 00                	push   $0x0
80102aee:	ff 75 0c             	pushl  0xc(%ebp)
80102af1:	53                   	push   %ebx
80102af2:	e8 79 fd ff ff       	call   80102870 <dirlookup>
80102af7:	83 c4 10             	add    $0x10,%esp
80102afa:	85 c0                	test   %eax,%eax
80102afc:	75 67                	jne    80102b65 <dirlink+0x85>
80102afe:	8b 7b 58             	mov    0x58(%ebx),%edi
80102b01:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102b04:	85 ff                	test   %edi,%edi
80102b06:	74 29                	je     80102b31 <dirlink+0x51>
80102b08:	31 ff                	xor    %edi,%edi
80102b0a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102b0d:	eb 09                	jmp    80102b18 <dirlink+0x38>
80102b0f:	90                   	nop
80102b10:	83 c7 10             	add    $0x10,%edi
80102b13:	3b 7b 58             	cmp    0x58(%ebx),%edi
80102b16:	73 19                	jae    80102b31 <dirlink+0x51>
80102b18:	6a 10                	push   $0x10
80102b1a:	57                   	push   %edi
80102b1b:	56                   	push   %esi
80102b1c:	53                   	push   %ebx
80102b1d:	e8 fe fa ff ff       	call   80102620 <readi>
80102b22:	83 c4 10             	add    $0x10,%esp
80102b25:	83 f8 10             	cmp    $0x10,%eax
80102b28:	75 4e                	jne    80102b78 <dirlink+0x98>
80102b2a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80102b2f:	75 df                	jne    80102b10 <dirlink+0x30>
80102b31:	8d 45 da             	lea    -0x26(%ebp),%eax
80102b34:	83 ec 04             	sub    $0x4,%esp
80102b37:	6a 0e                	push   $0xe
80102b39:	ff 75 0c             	pushl  0xc(%ebp)
80102b3c:	50                   	push   %eax
80102b3d:	e8 0e 34 00 00       	call   80105f50 <strncpy>
80102b42:	8b 45 10             	mov    0x10(%ebp),%eax
80102b45:	6a 10                	push   $0x10
80102b47:	57                   	push   %edi
80102b48:	56                   	push   %esi
80102b49:	53                   	push   %ebx
80102b4a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80102b4e:	e8 cd fb ff ff       	call   80102720 <writei>
80102b53:	83 c4 20             	add    $0x20,%esp
80102b56:	83 f8 10             	cmp    $0x10,%eax
80102b59:	75 2a                	jne    80102b85 <dirlink+0xa5>
80102b5b:	31 c0                	xor    %eax,%eax
80102b5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b60:	5b                   	pop    %ebx
80102b61:	5e                   	pop    %esi
80102b62:	5f                   	pop    %edi
80102b63:	5d                   	pop    %ebp
80102b64:	c3                   	ret    
80102b65:	83 ec 0c             	sub    $0xc,%esp
80102b68:	50                   	push   %eax
80102b69:	e8 02 f9 ff ff       	call   80102470 <iput>
80102b6e:	83 c4 10             	add    $0x10,%esp
80102b71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102b76:	eb e5                	jmp    80102b5d <dirlink+0x7d>
80102b78:	83 ec 0c             	sub    $0xc,%esp
80102b7b:	68 82 93 10 80       	push   $0x80109382
80102b80:	e8 eb dd ff ff       	call   80100970 <panic>
80102b85:	83 ec 0c             	sub    $0xc,%esp
80102b88:	68 e6 9c 10 80       	push   $0x80109ce6
80102b8d:	e8 de dd ff ff       	call   80100970 <panic>
80102b92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ba0 <namei>:
80102ba0:	55                   	push   %ebp
80102ba1:	31 d2                	xor    %edx,%edx
80102ba3:	89 e5                	mov    %esp,%ebp
80102ba5:	83 ec 18             	sub    $0x18,%esp
80102ba8:	8b 45 08             	mov    0x8(%ebp),%eax
80102bab:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80102bae:	e8 6d fd ff ff       	call   80102920 <namex>
80102bb3:	c9                   	leave  
80102bb4:	c3                   	ret    
80102bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bc0 <nameiparent>:
80102bc0:	55                   	push   %ebp
80102bc1:	ba 01 00 00 00       	mov    $0x1,%edx
80102bc6:	89 e5                	mov    %esp,%ebp
80102bc8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102bcb:	8b 45 08             	mov    0x8(%ebp),%eax
80102bce:	5d                   	pop    %ebp
80102bcf:	e9 4c fd ff ff       	jmp    80102920 <namex>
80102bd4:	66 90                	xchg   %ax,%ax
80102bd6:	66 90                	xchg   %ax,%ax
80102bd8:	66 90                	xchg   %ax,%ax
80102bda:	66 90                	xchg   %ax,%ax
80102bdc:	66 90                	xchg   %ax,%ax
80102bde:	66 90                	xchg   %ax,%ax

80102be0 <idestart>:
80102be0:	55                   	push   %ebp
80102be1:	89 e5                	mov    %esp,%ebp
80102be3:	57                   	push   %edi
80102be4:	56                   	push   %esi
80102be5:	53                   	push   %ebx
80102be6:	83 ec 0c             	sub    $0xc,%esp
80102be9:	85 c0                	test   %eax,%eax
80102beb:	0f 84 b4 00 00 00    	je     80102ca5 <idestart+0xc5>
80102bf1:	8b 58 08             	mov    0x8(%eax),%ebx
80102bf4:	89 c6                	mov    %eax,%esi
80102bf6:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80102bfc:	0f 87 96 00 00 00    	ja     80102c98 <idestart+0xb8>
80102c02:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102c07:	89 f6                	mov    %esi,%esi
80102c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102c10:	89 ca                	mov    %ecx,%edx
80102c12:	ec                   	in     (%dx),%al
80102c13:	83 e0 c0             	and    $0xffffffc0,%eax
80102c16:	3c 40                	cmp    $0x40,%al
80102c18:	75 f6                	jne    80102c10 <idestart+0x30>
80102c1a:	31 ff                	xor    %edi,%edi
80102c1c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102c21:	89 f8                	mov    %edi,%eax
80102c23:	ee                   	out    %al,(%dx)
80102c24:	b8 01 00 00 00       	mov    $0x1,%eax
80102c29:	ba f2 01 00 00       	mov    $0x1f2,%edx
80102c2e:	ee                   	out    %al,(%dx)
80102c2f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102c34:	89 d8                	mov    %ebx,%eax
80102c36:	ee                   	out    %al,(%dx)
80102c37:	89 d8                	mov    %ebx,%eax
80102c39:	ba f4 01 00 00       	mov    $0x1f4,%edx
80102c3e:	c1 f8 08             	sar    $0x8,%eax
80102c41:	ee                   	out    %al,(%dx)
80102c42:	ba f5 01 00 00       	mov    $0x1f5,%edx
80102c47:	89 f8                	mov    %edi,%eax
80102c49:	ee                   	out    %al,(%dx)
80102c4a:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80102c4e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102c53:	c1 e0 04             	shl    $0x4,%eax
80102c56:	83 e0 10             	and    $0x10,%eax
80102c59:	83 c8 e0             	or     $0xffffffe0,%eax
80102c5c:	ee                   	out    %al,(%dx)
80102c5d:	f6 06 04             	testb  $0x4,(%esi)
80102c60:	75 16                	jne    80102c78 <idestart+0x98>
80102c62:	b8 20 00 00 00       	mov    $0x20,%eax
80102c67:	89 ca                	mov    %ecx,%edx
80102c69:	ee                   	out    %al,(%dx)
80102c6a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c6d:	5b                   	pop    %ebx
80102c6e:	5e                   	pop    %esi
80102c6f:	5f                   	pop    %edi
80102c70:	5d                   	pop    %ebp
80102c71:	c3                   	ret    
80102c72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102c78:	b8 30 00 00 00       	mov    $0x30,%eax
80102c7d:	89 ca                	mov    %ecx,%edx
80102c7f:	ee                   	out    %al,(%dx)
80102c80:	b9 80 00 00 00       	mov    $0x80,%ecx
80102c85:	83 c6 5c             	add    $0x5c,%esi
80102c88:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102c8d:	fc                   	cld    
80102c8e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80102c90:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c93:	5b                   	pop    %ebx
80102c94:	5e                   	pop    %esi
80102c95:	5f                   	pop    %edi
80102c96:	5d                   	pop    %ebp
80102c97:	c3                   	ret    
80102c98:	83 ec 0c             	sub    $0xc,%esp
80102c9b:	68 ec 93 10 80       	push   $0x801093ec
80102ca0:	e8 cb dc ff ff       	call   80100970 <panic>
80102ca5:	83 ec 0c             	sub    $0xc,%esp
80102ca8:	68 e3 93 10 80       	push   $0x801093e3
80102cad:	e8 be dc ff ff       	call   80100970 <panic>
80102cb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102cc0 <ideinit>:
80102cc0:	55                   	push   %ebp
80102cc1:	89 e5                	mov    %esp,%ebp
80102cc3:	83 ec 10             	sub    $0x10,%esp
80102cc6:	68 fe 93 10 80       	push   $0x801093fe
80102ccb:	68 a0 3d 15 80       	push   $0x80153da0
80102cd0:	e8 8b 2e 00 00       	call   80105b60 <initlock>
80102cd5:	58                   	pop    %eax
80102cd6:	a1 c0 c8 15 80       	mov    0x8015c8c0,%eax
80102cdb:	5a                   	pop    %edx
80102cdc:	83 e8 01             	sub    $0x1,%eax
80102cdf:	50                   	push   %eax
80102ce0:	6a 0e                	push   $0xe
80102ce2:	e8 a9 02 00 00       	call   80102f90 <ioapicenable>
80102ce7:	83 c4 10             	add    $0x10,%esp
80102cea:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102cef:	90                   	nop
80102cf0:	ec                   	in     (%dx),%al
80102cf1:	83 e0 c0             	and    $0xffffffc0,%eax
80102cf4:	3c 40                	cmp    $0x40,%al
80102cf6:	75 f8                	jne    80102cf0 <ideinit+0x30>
80102cf8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102cfd:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102d02:	ee                   	out    %al,(%dx)
80102d03:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102d08:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102d0d:	eb 06                	jmp    80102d15 <ideinit+0x55>
80102d0f:	90                   	nop
80102d10:	83 e9 01             	sub    $0x1,%ecx
80102d13:	74 0f                	je     80102d24 <ideinit+0x64>
80102d15:	ec                   	in     (%dx),%al
80102d16:	84 c0                	test   %al,%al
80102d18:	74 f6                	je     80102d10 <ideinit+0x50>
80102d1a:	c7 05 80 3d 15 80 01 	movl   $0x1,0x80153d80
80102d21:	00 00 00 
80102d24:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102d29:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102d2e:	ee                   	out    %al,(%dx)
80102d2f:	c9                   	leave  
80102d30:	c3                   	ret    
80102d31:	eb 0d                	jmp    80102d40 <ideintr>
80102d33:	90                   	nop
80102d34:	90                   	nop
80102d35:	90                   	nop
80102d36:	90                   	nop
80102d37:	90                   	nop
80102d38:	90                   	nop
80102d39:	90                   	nop
80102d3a:	90                   	nop
80102d3b:	90                   	nop
80102d3c:	90                   	nop
80102d3d:	90                   	nop
80102d3e:	90                   	nop
80102d3f:	90                   	nop

80102d40 <ideintr>:
80102d40:	55                   	push   %ebp
80102d41:	89 e5                	mov    %esp,%ebp
80102d43:	57                   	push   %edi
80102d44:	56                   	push   %esi
80102d45:	53                   	push   %ebx
80102d46:	83 ec 18             	sub    $0x18,%esp
80102d49:	68 a0 3d 15 80       	push   $0x80153da0
80102d4e:	e8 fd 2e 00 00       	call   80105c50 <acquire>
80102d53:	8b 1d 84 3d 15 80    	mov    0x80153d84,%ebx
80102d59:	83 c4 10             	add    $0x10,%esp
80102d5c:	85 db                	test   %ebx,%ebx
80102d5e:	74 67                	je     80102dc7 <ideintr+0x87>
80102d60:	8b 43 58             	mov    0x58(%ebx),%eax
80102d63:	a3 84 3d 15 80       	mov    %eax,0x80153d84
80102d68:	8b 3b                	mov    (%ebx),%edi
80102d6a:	f7 c7 04 00 00 00    	test   $0x4,%edi
80102d70:	75 31                	jne    80102da3 <ideintr+0x63>
80102d72:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102d77:	89 f6                	mov    %esi,%esi
80102d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102d80:	ec                   	in     (%dx),%al
80102d81:	89 c6                	mov    %eax,%esi
80102d83:	83 e6 c0             	and    $0xffffffc0,%esi
80102d86:	89 f1                	mov    %esi,%ecx
80102d88:	80 f9 40             	cmp    $0x40,%cl
80102d8b:	75 f3                	jne    80102d80 <ideintr+0x40>
80102d8d:	a8 21                	test   $0x21,%al
80102d8f:	75 12                	jne    80102da3 <ideintr+0x63>
80102d91:	8d 7b 5c             	lea    0x5c(%ebx),%edi
80102d94:	b9 80 00 00 00       	mov    $0x80,%ecx
80102d99:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102d9e:	fc                   	cld    
80102d9f:	f3 6d                	rep insl (%dx),%es:(%edi)
80102da1:	8b 3b                	mov    (%ebx),%edi
80102da3:	83 e7 fb             	and    $0xfffffffb,%edi
80102da6:	83 ec 0c             	sub    $0xc,%esp
80102da9:	89 f9                	mov    %edi,%ecx
80102dab:	83 c9 02             	or     $0x2,%ecx
80102dae:	89 0b                	mov    %ecx,(%ebx)
80102db0:	53                   	push   %ebx
80102db1:	e8 fa 2a 00 00       	call   801058b0 <wakeup>
80102db6:	a1 84 3d 15 80       	mov    0x80153d84,%eax
80102dbb:	83 c4 10             	add    $0x10,%esp
80102dbe:	85 c0                	test   %eax,%eax
80102dc0:	74 05                	je     80102dc7 <ideintr+0x87>
80102dc2:	e8 19 fe ff ff       	call   80102be0 <idestart>
80102dc7:	83 ec 0c             	sub    $0xc,%esp
80102dca:	68 a0 3d 15 80       	push   $0x80153da0
80102dcf:	e8 9c 2f 00 00       	call   80105d70 <release>
80102dd4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dd7:	5b                   	pop    %ebx
80102dd8:	5e                   	pop    %esi
80102dd9:	5f                   	pop    %edi
80102dda:	5d                   	pop    %ebp
80102ddb:	c3                   	ret    
80102ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102de0 <iderw>:
80102de0:	55                   	push   %ebp
80102de1:	89 e5                	mov    %esp,%ebp
80102de3:	53                   	push   %ebx
80102de4:	83 ec 10             	sub    $0x10,%esp
80102de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102dea:	8d 43 0c             	lea    0xc(%ebx),%eax
80102ded:	50                   	push   %eax
80102dee:	e8 3d 2d 00 00       	call   80105b30 <holdingsleep>
80102df3:	83 c4 10             	add    $0x10,%esp
80102df6:	85 c0                	test   %eax,%eax
80102df8:	0f 84 c6 00 00 00    	je     80102ec4 <iderw+0xe4>
80102dfe:	8b 03                	mov    (%ebx),%eax
80102e00:	83 e0 06             	and    $0x6,%eax
80102e03:	83 f8 02             	cmp    $0x2,%eax
80102e06:	0f 84 ab 00 00 00    	je     80102eb7 <iderw+0xd7>
80102e0c:	8b 53 04             	mov    0x4(%ebx),%edx
80102e0f:	85 d2                	test   %edx,%edx
80102e11:	74 0d                	je     80102e20 <iderw+0x40>
80102e13:	a1 80 3d 15 80       	mov    0x80153d80,%eax
80102e18:	85 c0                	test   %eax,%eax
80102e1a:	0f 84 b1 00 00 00    	je     80102ed1 <iderw+0xf1>
80102e20:	83 ec 0c             	sub    $0xc,%esp
80102e23:	68 a0 3d 15 80       	push   $0x80153da0
80102e28:	e8 23 2e 00 00       	call   80105c50 <acquire>
80102e2d:	8b 15 84 3d 15 80    	mov    0x80153d84,%edx
80102e33:	83 c4 10             	add    $0x10,%esp
80102e36:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80102e3d:	85 d2                	test   %edx,%edx
80102e3f:	75 09                	jne    80102e4a <iderw+0x6a>
80102e41:	eb 6d                	jmp    80102eb0 <iderw+0xd0>
80102e43:	90                   	nop
80102e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e48:	89 c2                	mov    %eax,%edx
80102e4a:	8b 42 58             	mov    0x58(%edx),%eax
80102e4d:	85 c0                	test   %eax,%eax
80102e4f:	75 f7                	jne    80102e48 <iderw+0x68>
80102e51:	83 c2 58             	add    $0x58,%edx
80102e54:	89 1a                	mov    %ebx,(%edx)
80102e56:	39 1d 84 3d 15 80    	cmp    %ebx,0x80153d84
80102e5c:	74 42                	je     80102ea0 <iderw+0xc0>
80102e5e:	8b 03                	mov    (%ebx),%eax
80102e60:	83 e0 06             	and    $0x6,%eax
80102e63:	83 f8 02             	cmp    $0x2,%eax
80102e66:	74 23                	je     80102e8b <iderw+0xab>
80102e68:	90                   	nop
80102e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e70:	83 ec 08             	sub    $0x8,%esp
80102e73:	68 a0 3d 15 80       	push   $0x80153da0
80102e78:	53                   	push   %ebx
80102e79:	e8 82 28 00 00       	call   80105700 <sleep>
80102e7e:	8b 03                	mov    (%ebx),%eax
80102e80:	83 c4 10             	add    $0x10,%esp
80102e83:	83 e0 06             	and    $0x6,%eax
80102e86:	83 f8 02             	cmp    $0x2,%eax
80102e89:	75 e5                	jne    80102e70 <iderw+0x90>
80102e8b:	c7 45 08 a0 3d 15 80 	movl   $0x80153da0,0x8(%ebp)
80102e92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e95:	c9                   	leave  
80102e96:	e9 d5 2e 00 00       	jmp    80105d70 <release>
80102e9b:	90                   	nop
80102e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ea0:	89 d8                	mov    %ebx,%eax
80102ea2:	e8 39 fd ff ff       	call   80102be0 <idestart>
80102ea7:	eb b5                	jmp    80102e5e <iderw+0x7e>
80102ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102eb0:	ba 84 3d 15 80       	mov    $0x80153d84,%edx
80102eb5:	eb 9d                	jmp    80102e54 <iderw+0x74>
80102eb7:	83 ec 0c             	sub    $0xc,%esp
80102eba:	68 18 94 10 80       	push   $0x80109418
80102ebf:	e8 ac da ff ff       	call   80100970 <panic>
80102ec4:	83 ec 0c             	sub    $0xc,%esp
80102ec7:	68 02 94 10 80       	push   $0x80109402
80102ecc:	e8 9f da ff ff       	call   80100970 <panic>
80102ed1:	83 ec 0c             	sub    $0xc,%esp
80102ed4:	68 2d 94 10 80       	push   $0x8010942d
80102ed9:	e8 92 da ff ff       	call   80100970 <panic>
80102ede:	66 90                	xchg   %ax,%ax

80102ee0 <ioapicinit>:
80102ee0:	55                   	push   %ebp
80102ee1:	c7 05 f4 c1 15 80 00 	movl   $0xfec00000,0x8015c1f4
80102ee8:	00 c0 fe 
80102eeb:	89 e5                	mov    %esp,%ebp
80102eed:	56                   	push   %esi
80102eee:	53                   	push   %ebx
80102eef:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102ef6:	00 00 00 
80102ef9:	a1 f4 c1 15 80       	mov    0x8015c1f4,%eax
80102efe:	8b 58 10             	mov    0x10(%eax),%ebx
80102f01:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80102f07:	8b 0d f4 c1 15 80    	mov    0x8015c1f4,%ecx
80102f0d:	0f b6 15 20 c3 15 80 	movzbl 0x8015c320,%edx
80102f14:	c1 eb 10             	shr    $0x10,%ebx
80102f17:	8b 41 10             	mov    0x10(%ecx),%eax
80102f1a:	0f b6 db             	movzbl %bl,%ebx
80102f1d:	c1 e8 18             	shr    $0x18,%eax
80102f20:	39 c2                	cmp    %eax,%edx
80102f22:	74 16                	je     80102f3a <ioapicinit+0x5a>
80102f24:	83 ec 0c             	sub    $0xc,%esp
80102f27:	68 4c 94 10 80       	push   $0x8010944c
80102f2c:	e8 0f dd ff ff       	call   80100c40 <cprintf>
80102f31:	8b 0d f4 c1 15 80    	mov    0x8015c1f4,%ecx
80102f37:	83 c4 10             	add    $0x10,%esp
80102f3a:	83 c3 21             	add    $0x21,%ebx
80102f3d:	ba 10 00 00 00       	mov    $0x10,%edx
80102f42:	b8 20 00 00 00       	mov    $0x20,%eax
80102f47:	89 f6                	mov    %esi,%esi
80102f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102f50:	89 11                	mov    %edx,(%ecx)
80102f52:	8b 0d f4 c1 15 80    	mov    0x8015c1f4,%ecx
80102f58:	89 c6                	mov    %eax,%esi
80102f5a:	81 ce 00 00 01 00    	or     $0x10000,%esi
80102f60:	83 c0 01             	add    $0x1,%eax
80102f63:	89 71 10             	mov    %esi,0x10(%ecx)
80102f66:	8d 72 01             	lea    0x1(%edx),%esi
80102f69:	83 c2 02             	add    $0x2,%edx
80102f6c:	39 d8                	cmp    %ebx,%eax
80102f6e:	89 31                	mov    %esi,(%ecx)
80102f70:	8b 0d f4 c1 15 80    	mov    0x8015c1f4,%ecx
80102f76:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
80102f7d:	75 d1                	jne    80102f50 <ioapicinit+0x70>
80102f7f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102f82:	5b                   	pop    %ebx
80102f83:	5e                   	pop    %esi
80102f84:	5d                   	pop    %ebp
80102f85:	c3                   	ret    
80102f86:	8d 76 00             	lea    0x0(%esi),%esi
80102f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102f90 <ioapicenable>:
80102f90:	55                   	push   %ebp
80102f91:	8b 0d f4 c1 15 80    	mov    0x8015c1f4,%ecx
80102f97:	89 e5                	mov    %esp,%ebp
80102f99:	8b 45 08             	mov    0x8(%ebp),%eax
80102f9c:	8d 50 20             	lea    0x20(%eax),%edx
80102f9f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102fa3:	89 01                	mov    %eax,(%ecx)
80102fa5:	8b 0d f4 c1 15 80    	mov    0x8015c1f4,%ecx
80102fab:	83 c0 01             	add    $0x1,%eax
80102fae:	89 51 10             	mov    %edx,0x10(%ecx)
80102fb1:	8b 55 0c             	mov    0xc(%ebp),%edx
80102fb4:	89 01                	mov    %eax,(%ecx)
80102fb6:	a1 f4 c1 15 80       	mov    0x8015c1f4,%eax
80102fbb:	c1 e2 18             	shl    $0x18,%edx
80102fbe:	89 50 10             	mov    %edx,0x10(%eax)
80102fc1:	5d                   	pop    %ebp
80102fc2:	c3                   	ret    
80102fc3:	66 90                	xchg   %ax,%ax
80102fc5:	66 90                	xchg   %ax,%ax
80102fc7:	66 90                	xchg   %ax,%ax
80102fc9:	66 90                	xchg   %ax,%ax
80102fcb:	66 90                	xchg   %ax,%ax
80102fcd:	66 90                	xchg   %ax,%ax
80102fcf:	90                   	nop

80102fd0 <kfree>:
80102fd0:	55                   	push   %ebp
80102fd1:	89 e5                	mov    %esp,%ebp
80102fd3:	53                   	push   %ebx
80102fd4:	83 ec 04             	sub    $0x4,%esp
80102fd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102fda:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102fe0:	75 70                	jne    80103052 <kfree+0x82>
80102fe2:	81 fb 68 f0 15 80    	cmp    $0x8015f068,%ebx
80102fe8:	72 68                	jb     80103052 <kfree+0x82>
80102fea:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102ff0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102ff5:	77 5b                	ja     80103052 <kfree+0x82>
80102ff7:	83 ec 04             	sub    $0x4,%esp
80102ffa:	68 00 10 00 00       	push   $0x1000
80102fff:	6a 01                	push   $0x1
80103001:	53                   	push   %ebx
80103002:	e8 c9 2d 00 00       	call   80105dd0 <memset>
80103007:	8b 15 34 c2 15 80    	mov    0x8015c234,%edx
8010300d:	83 c4 10             	add    $0x10,%esp
80103010:	85 d2                	test   %edx,%edx
80103012:	75 2c                	jne    80103040 <kfree+0x70>
80103014:	a1 38 c2 15 80       	mov    0x8015c238,%eax
80103019:	89 03                	mov    %eax,(%ebx)
8010301b:	a1 34 c2 15 80       	mov    0x8015c234,%eax
80103020:	89 1d 38 c2 15 80    	mov    %ebx,0x8015c238
80103026:	85 c0                	test   %eax,%eax
80103028:	75 06                	jne    80103030 <kfree+0x60>
8010302a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010302d:	c9                   	leave  
8010302e:	c3                   	ret    
8010302f:	90                   	nop
80103030:	c7 45 08 00 c2 15 80 	movl   $0x8015c200,0x8(%ebp)
80103037:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010303a:	c9                   	leave  
8010303b:	e9 30 2d 00 00       	jmp    80105d70 <release>
80103040:	83 ec 0c             	sub    $0xc,%esp
80103043:	68 00 c2 15 80       	push   $0x8015c200
80103048:	e8 03 2c 00 00       	call   80105c50 <acquire>
8010304d:	83 c4 10             	add    $0x10,%esp
80103050:	eb c2                	jmp    80103014 <kfree+0x44>
80103052:	83 ec 0c             	sub    $0xc,%esp
80103055:	68 7e 94 10 80       	push   $0x8010947e
8010305a:	e8 11 d9 ff ff       	call   80100970 <panic>
8010305f:	90                   	nop

80103060 <freerange>:
80103060:	55                   	push   %ebp
80103061:	89 e5                	mov    %esp,%ebp
80103063:	56                   	push   %esi
80103064:	53                   	push   %ebx
80103065:	8b 45 08             	mov    0x8(%ebp),%eax
80103068:	8b 75 0c             	mov    0xc(%ebp),%esi
8010306b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80103071:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80103077:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010307d:	39 de                	cmp    %ebx,%esi
8010307f:	72 23                	jb     801030a4 <freerange+0x44>
80103081:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103088:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010308e:	83 ec 0c             	sub    $0xc,%esp
80103091:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80103097:	50                   	push   %eax
80103098:	e8 33 ff ff ff       	call   80102fd0 <kfree>
8010309d:	83 c4 10             	add    $0x10,%esp
801030a0:	39 f3                	cmp    %esi,%ebx
801030a2:	76 e4                	jbe    80103088 <freerange+0x28>
801030a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801030a7:	5b                   	pop    %ebx
801030a8:	5e                   	pop    %esi
801030a9:	5d                   	pop    %ebp
801030aa:	c3                   	ret    
801030ab:	90                   	nop
801030ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801030b0 <kinit1>:
801030b0:	55                   	push   %ebp
801030b1:	89 e5                	mov    %esp,%ebp
801030b3:	56                   	push   %esi
801030b4:	53                   	push   %ebx
801030b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801030b8:	83 ec 08             	sub    $0x8,%esp
801030bb:	68 84 94 10 80       	push   $0x80109484
801030c0:	68 00 c2 15 80       	push   $0x8015c200
801030c5:	e8 96 2a 00 00       	call   80105b60 <initlock>
801030ca:	8b 45 08             	mov    0x8(%ebp),%eax
801030cd:	83 c4 10             	add    $0x10,%esp
801030d0:	c7 05 34 c2 15 80 00 	movl   $0x0,0x8015c234
801030d7:	00 00 00 
801030da:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801030e0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801030e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801030ec:	39 de                	cmp    %ebx,%esi
801030ee:	72 1c                	jb     8010310c <kinit1+0x5c>
801030f0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801030f6:	83 ec 0c             	sub    $0xc,%esp
801030f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801030ff:	50                   	push   %eax
80103100:	e8 cb fe ff ff       	call   80102fd0 <kfree>
80103105:	83 c4 10             	add    $0x10,%esp
80103108:	39 de                	cmp    %ebx,%esi
8010310a:	73 e4                	jae    801030f0 <kinit1+0x40>
8010310c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010310f:	5b                   	pop    %ebx
80103110:	5e                   	pop    %esi
80103111:	5d                   	pop    %ebp
80103112:	c3                   	ret    
80103113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103120 <kinit2>:
80103120:	55                   	push   %ebp
80103121:	89 e5                	mov    %esp,%ebp
80103123:	56                   	push   %esi
80103124:	53                   	push   %ebx
80103125:	8b 45 08             	mov    0x8(%ebp),%eax
80103128:	8b 75 0c             	mov    0xc(%ebp),%esi
8010312b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80103131:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80103137:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010313d:	39 de                	cmp    %ebx,%esi
8010313f:	72 23                	jb     80103164 <kinit2+0x44>
80103141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103148:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010314e:	83 ec 0c             	sub    $0xc,%esp
80103151:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80103157:	50                   	push   %eax
80103158:	e8 73 fe ff ff       	call   80102fd0 <kfree>
8010315d:	83 c4 10             	add    $0x10,%esp
80103160:	39 de                	cmp    %ebx,%esi
80103162:	73 e4                	jae    80103148 <kinit2+0x28>
80103164:	c7 05 34 c2 15 80 01 	movl   $0x1,0x8015c234
8010316b:	00 00 00 
8010316e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103171:	5b                   	pop    %ebx
80103172:	5e                   	pop    %esi
80103173:	5d                   	pop    %ebp
80103174:	c3                   	ret    
80103175:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103180 <kalloc>:
80103180:	a1 34 c2 15 80       	mov    0x8015c234,%eax
80103185:	85 c0                	test   %eax,%eax
80103187:	75 1f                	jne    801031a8 <kalloc+0x28>
80103189:	a1 38 c2 15 80       	mov    0x8015c238,%eax
8010318e:	85 c0                	test   %eax,%eax
80103190:	74 0e                	je     801031a0 <kalloc+0x20>
80103192:	8b 10                	mov    (%eax),%edx
80103194:	89 15 38 c2 15 80    	mov    %edx,0x8015c238
8010319a:	c3                   	ret    
8010319b:	90                   	nop
8010319c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031a0:	f3 c3                	repz ret 
801031a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031a8:	55                   	push   %ebp
801031a9:	89 e5                	mov    %esp,%ebp
801031ab:	83 ec 24             	sub    $0x24,%esp
801031ae:	68 00 c2 15 80       	push   $0x8015c200
801031b3:	e8 98 2a 00 00       	call   80105c50 <acquire>
801031b8:	a1 38 c2 15 80       	mov    0x8015c238,%eax
801031bd:	83 c4 10             	add    $0x10,%esp
801031c0:	8b 15 34 c2 15 80    	mov    0x8015c234,%edx
801031c6:	85 c0                	test   %eax,%eax
801031c8:	74 08                	je     801031d2 <kalloc+0x52>
801031ca:	8b 08                	mov    (%eax),%ecx
801031cc:	89 0d 38 c2 15 80    	mov    %ecx,0x8015c238
801031d2:	85 d2                	test   %edx,%edx
801031d4:	74 16                	je     801031ec <kalloc+0x6c>
801031d6:	83 ec 0c             	sub    $0xc,%esp
801031d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
801031dc:	68 00 c2 15 80       	push   $0x8015c200
801031e1:	e8 8a 2b 00 00       	call   80105d70 <release>
801031e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801031e9:	83 c4 10             	add    $0x10,%esp
801031ec:	c9                   	leave  
801031ed:	c3                   	ret    
801031ee:	66 90                	xchg   %ax,%ax

801031f0 <kbdgetc>:
801031f0:	ba 64 00 00 00       	mov    $0x64,%edx
801031f5:	ec                   	in     (%dx),%al
801031f6:	a8 01                	test   $0x1,%al
801031f8:	0f 84 c2 00 00 00    	je     801032c0 <kbdgetc+0xd0>
801031fe:	ba 60 00 00 00       	mov    $0x60,%edx
80103203:	ec                   	in     (%dx),%al
80103204:	0f b6 d0             	movzbl %al,%edx
80103207:	8b 0d d4 3d 15 80    	mov    0x80153dd4,%ecx
8010320d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80103213:	0f 84 7f 00 00 00    	je     80103298 <kbdgetc+0xa8>
80103219:	55                   	push   %ebp
8010321a:	89 e5                	mov    %esp,%ebp
8010321c:	53                   	push   %ebx
8010321d:	89 cb                	mov    %ecx,%ebx
8010321f:	83 e3 40             	and    $0x40,%ebx
80103222:	84 c0                	test   %al,%al
80103224:	78 4a                	js     80103270 <kbdgetc+0x80>
80103226:	85 db                	test   %ebx,%ebx
80103228:	74 09                	je     80103233 <kbdgetc+0x43>
8010322a:	83 c8 80             	or     $0xffffff80,%eax
8010322d:	83 e1 bf             	and    $0xffffffbf,%ecx
80103230:	0f b6 d0             	movzbl %al,%edx
80103233:	0f b6 82 c0 95 10 80 	movzbl -0x7fef6a40(%edx),%eax
8010323a:	09 c1                	or     %eax,%ecx
8010323c:	0f b6 82 c0 94 10 80 	movzbl -0x7fef6b40(%edx),%eax
80103243:	31 c1                	xor    %eax,%ecx
80103245:	89 c8                	mov    %ecx,%eax
80103247:	89 0d d4 3d 15 80    	mov    %ecx,0x80153dd4
8010324d:	83 e0 03             	and    $0x3,%eax
80103250:	83 e1 08             	and    $0x8,%ecx
80103253:	8b 04 85 a0 94 10 80 	mov    -0x7fef6b60(,%eax,4),%eax
8010325a:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
8010325e:	74 31                	je     80103291 <kbdgetc+0xa1>
80103260:	8d 50 9f             	lea    -0x61(%eax),%edx
80103263:	83 fa 19             	cmp    $0x19,%edx
80103266:	77 40                	ja     801032a8 <kbdgetc+0xb8>
80103268:	83 e8 20             	sub    $0x20,%eax
8010326b:	5b                   	pop    %ebx
8010326c:	5d                   	pop    %ebp
8010326d:	c3                   	ret    
8010326e:	66 90                	xchg   %ax,%ax
80103270:	83 e0 7f             	and    $0x7f,%eax
80103273:	85 db                	test   %ebx,%ebx
80103275:	0f 44 d0             	cmove  %eax,%edx
80103278:	0f b6 82 c0 95 10 80 	movzbl -0x7fef6a40(%edx),%eax
8010327f:	83 c8 40             	or     $0x40,%eax
80103282:	0f b6 c0             	movzbl %al,%eax
80103285:	f7 d0                	not    %eax
80103287:	21 c1                	and    %eax,%ecx
80103289:	31 c0                	xor    %eax,%eax
8010328b:	89 0d d4 3d 15 80    	mov    %ecx,0x80153dd4
80103291:	5b                   	pop    %ebx
80103292:	5d                   	pop    %ebp
80103293:	c3                   	ret    
80103294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103298:	83 c9 40             	or     $0x40,%ecx
8010329b:	31 c0                	xor    %eax,%eax
8010329d:	89 0d d4 3d 15 80    	mov    %ecx,0x80153dd4
801032a3:	c3                   	ret    
801032a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801032a8:	8d 48 bf             	lea    -0x41(%eax),%ecx
801032ab:	8d 50 20             	lea    0x20(%eax),%edx
801032ae:	5b                   	pop    %ebx
801032af:	83 f9 1a             	cmp    $0x1a,%ecx
801032b2:	0f 42 c2             	cmovb  %edx,%eax
801032b5:	5d                   	pop    %ebp
801032b6:	c3                   	ret    
801032b7:	89 f6                	mov    %esi,%esi
801032b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801032c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032c5:	c3                   	ret    
801032c6:	8d 76 00             	lea    0x0(%esi),%esi
801032c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801032d0 <kbdintr>:
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	83 ec 14             	sub    $0x14,%esp
801032d6:	68 f0 31 10 80       	push   $0x801031f0
801032db:	e8 10 db ff ff       	call   80100df0 <consoleintr>
801032e0:	83 c4 10             	add    $0x10,%esp
801032e3:	c9                   	leave  
801032e4:	c3                   	ret    
801032e5:	66 90                	xchg   %ax,%ax
801032e7:	66 90                	xchg   %ax,%ax
801032e9:	66 90                	xchg   %ax,%ax
801032eb:	66 90                	xchg   %ax,%ax
801032ed:	66 90                	xchg   %ax,%ax
801032ef:	90                   	nop

801032f0 <lapicinit>:
801032f0:	a1 3c c2 15 80       	mov    0x8015c23c,%eax
801032f5:	55                   	push   %ebp
801032f6:	89 e5                	mov    %esp,%ebp
801032f8:	85 c0                	test   %eax,%eax
801032fa:	0f 84 c8 00 00 00    	je     801033c8 <lapicinit+0xd8>
80103300:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80103307:	01 00 00 
8010330a:	8b 50 20             	mov    0x20(%eax),%edx
8010330d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80103314:	00 00 00 
80103317:	8b 50 20             	mov    0x20(%eax),%edx
8010331a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80103321:	00 02 00 
80103324:	8b 50 20             	mov    0x20(%eax),%edx
80103327:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010332e:	96 98 00 
80103331:	8b 50 20             	mov    0x20(%eax),%edx
80103334:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010333b:	00 01 00 
8010333e:	8b 50 20             	mov    0x20(%eax),%edx
80103341:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80103348:	00 01 00 
8010334b:	8b 50 20             	mov    0x20(%eax),%edx
8010334e:	8b 50 30             	mov    0x30(%eax),%edx
80103351:	c1 ea 10             	shr    $0x10,%edx
80103354:	80 fa 03             	cmp    $0x3,%dl
80103357:	77 77                	ja     801033d0 <lapicinit+0xe0>
80103359:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80103360:	00 00 00 
80103363:	8b 50 20             	mov    0x20(%eax),%edx
80103366:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010336d:	00 00 00 
80103370:	8b 50 20             	mov    0x20(%eax),%edx
80103373:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010337a:	00 00 00 
8010337d:	8b 50 20             	mov    0x20(%eax),%edx
80103380:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80103387:	00 00 00 
8010338a:	8b 50 20             	mov    0x20(%eax),%edx
8010338d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80103394:	00 00 00 
80103397:	8b 50 20             	mov    0x20(%eax),%edx
8010339a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801033a1:	85 08 00 
801033a4:	8b 50 20             	mov    0x20(%eax),%edx
801033a7:	89 f6                	mov    %esi,%esi
801033a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801033b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801033b6:	80 e6 10             	and    $0x10,%dh
801033b9:	75 f5                	jne    801033b0 <lapicinit+0xc0>
801033bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801033c2:	00 00 00 
801033c5:	8b 40 20             	mov    0x20(%eax),%eax
801033c8:	5d                   	pop    %ebp
801033c9:	c3                   	ret    
801033ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801033d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801033d7:	00 01 00 
801033da:	8b 50 20             	mov    0x20(%eax),%edx
801033dd:	e9 77 ff ff ff       	jmp    80103359 <lapicinit+0x69>
801033e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801033f0 <lapicid>:
801033f0:	8b 15 3c c2 15 80    	mov    0x8015c23c,%edx
801033f6:	55                   	push   %ebp
801033f7:	31 c0                	xor    %eax,%eax
801033f9:	89 e5                	mov    %esp,%ebp
801033fb:	85 d2                	test   %edx,%edx
801033fd:	74 06                	je     80103405 <lapicid+0x15>
801033ff:	8b 42 20             	mov    0x20(%edx),%eax
80103402:	c1 e8 18             	shr    $0x18,%eax
80103405:	5d                   	pop    %ebp
80103406:	c3                   	ret    
80103407:	89 f6                	mov    %esi,%esi
80103409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103410 <lapiceoi>:
80103410:	a1 3c c2 15 80       	mov    0x8015c23c,%eax
80103415:	55                   	push   %ebp
80103416:	89 e5                	mov    %esp,%ebp
80103418:	85 c0                	test   %eax,%eax
8010341a:	74 0d                	je     80103429 <lapiceoi+0x19>
8010341c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80103423:	00 00 00 
80103426:	8b 40 20             	mov    0x20(%eax),%eax
80103429:	5d                   	pop    %ebp
8010342a:	c3                   	ret    
8010342b:	90                   	nop
8010342c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103430 <microdelay>:
80103430:	55                   	push   %ebp
80103431:	89 e5                	mov    %esp,%ebp
80103433:	5d                   	pop    %ebp
80103434:	c3                   	ret    
80103435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103440 <lapicstartap>:
80103440:	55                   	push   %ebp
80103441:	b8 0f 00 00 00       	mov    $0xf,%eax
80103446:	ba 70 00 00 00       	mov    $0x70,%edx
8010344b:	89 e5                	mov    %esp,%ebp
8010344d:	53                   	push   %ebx
8010344e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103451:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103454:	ee                   	out    %al,(%dx)
80103455:	b8 0a 00 00 00       	mov    $0xa,%eax
8010345a:	ba 71 00 00 00       	mov    $0x71,%edx
8010345f:	ee                   	out    %al,(%dx)
80103460:	31 c0                	xor    %eax,%eax
80103462:	c1 e3 18             	shl    $0x18,%ebx
80103465:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010346b:	89 c8                	mov    %ecx,%eax
8010346d:	c1 e9 0c             	shr    $0xc,%ecx
80103470:	c1 e8 04             	shr    $0x4,%eax
80103473:	89 da                	mov    %ebx,%edx
80103475:	80 cd 06             	or     $0x6,%ch
80103478:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010347e:	a1 3c c2 15 80       	mov    0x8015c23c,%eax
80103483:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80103489:	8b 58 20             	mov    0x20(%eax),%ebx
8010348c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80103493:	c5 00 00 
80103496:	8b 58 20             	mov    0x20(%eax),%ebx
80103499:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801034a0:	85 00 00 
801034a3:	8b 58 20             	mov    0x20(%eax),%ebx
801034a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801034ac:	8b 58 20             	mov    0x20(%eax),%ebx
801034af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801034b5:	8b 58 20             	mov    0x20(%eax),%ebx
801034b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801034be:	8b 50 20             	mov    0x20(%eax),%edx
801034c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801034c7:	8b 40 20             	mov    0x20(%eax),%eax
801034ca:	5b                   	pop    %ebx
801034cb:	5d                   	pop    %ebp
801034cc:	c3                   	ret    
801034cd:	8d 76 00             	lea    0x0(%esi),%esi

801034d0 <cmostime>:
801034d0:	55                   	push   %ebp
801034d1:	b8 0b 00 00 00       	mov    $0xb,%eax
801034d6:	ba 70 00 00 00       	mov    $0x70,%edx
801034db:	89 e5                	mov    %esp,%ebp
801034dd:	57                   	push   %edi
801034de:	56                   	push   %esi
801034df:	53                   	push   %ebx
801034e0:	83 ec 4c             	sub    $0x4c,%esp
801034e3:	ee                   	out    %al,(%dx)
801034e4:	ba 71 00 00 00       	mov    $0x71,%edx
801034e9:	ec                   	in     (%dx),%al
801034ea:	83 e0 04             	and    $0x4,%eax
801034ed:	bb 70 00 00 00       	mov    $0x70,%ebx
801034f2:	88 45 b3             	mov    %al,-0x4d(%ebp)
801034f5:	8d 76 00             	lea    0x0(%esi),%esi
801034f8:	31 c0                	xor    %eax,%eax
801034fa:	89 da                	mov    %ebx,%edx
801034fc:	ee                   	out    %al,(%dx)
801034fd:	b9 71 00 00 00       	mov    $0x71,%ecx
80103502:	89 ca                	mov    %ecx,%edx
80103504:	ec                   	in     (%dx),%al
80103505:	88 45 b7             	mov    %al,-0x49(%ebp)
80103508:	89 da                	mov    %ebx,%edx
8010350a:	b8 02 00 00 00       	mov    $0x2,%eax
8010350f:	ee                   	out    %al,(%dx)
80103510:	89 ca                	mov    %ecx,%edx
80103512:	ec                   	in     (%dx),%al
80103513:	88 45 b6             	mov    %al,-0x4a(%ebp)
80103516:	89 da                	mov    %ebx,%edx
80103518:	b8 04 00 00 00       	mov    $0x4,%eax
8010351d:	ee                   	out    %al,(%dx)
8010351e:	89 ca                	mov    %ecx,%edx
80103520:	ec                   	in     (%dx),%al
80103521:	88 45 b5             	mov    %al,-0x4b(%ebp)
80103524:	89 da                	mov    %ebx,%edx
80103526:	b8 07 00 00 00       	mov    $0x7,%eax
8010352b:	ee                   	out    %al,(%dx)
8010352c:	89 ca                	mov    %ecx,%edx
8010352e:	ec                   	in     (%dx),%al
8010352f:	88 45 b4             	mov    %al,-0x4c(%ebp)
80103532:	89 da                	mov    %ebx,%edx
80103534:	b8 08 00 00 00       	mov    $0x8,%eax
80103539:	ee                   	out    %al,(%dx)
8010353a:	89 ca                	mov    %ecx,%edx
8010353c:	ec                   	in     (%dx),%al
8010353d:	89 c7                	mov    %eax,%edi
8010353f:	89 da                	mov    %ebx,%edx
80103541:	b8 09 00 00 00       	mov    $0x9,%eax
80103546:	ee                   	out    %al,(%dx)
80103547:	89 ca                	mov    %ecx,%edx
80103549:	ec                   	in     (%dx),%al
8010354a:	89 c6                	mov    %eax,%esi
8010354c:	89 da                	mov    %ebx,%edx
8010354e:	b8 0a 00 00 00       	mov    $0xa,%eax
80103553:	ee                   	out    %al,(%dx)
80103554:	89 ca                	mov    %ecx,%edx
80103556:	ec                   	in     (%dx),%al
80103557:	84 c0                	test   %al,%al
80103559:	78 9d                	js     801034f8 <cmostime+0x28>
8010355b:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
8010355f:	89 fa                	mov    %edi,%edx
80103561:	0f b6 fa             	movzbl %dl,%edi
80103564:	89 f2                	mov    %esi,%edx
80103566:	0f b6 f2             	movzbl %dl,%esi
80103569:	89 7d c8             	mov    %edi,-0x38(%ebp)
8010356c:	89 da                	mov    %ebx,%edx
8010356e:	89 75 cc             	mov    %esi,-0x34(%ebp)
80103571:	89 45 b8             	mov    %eax,-0x48(%ebp)
80103574:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80103578:	89 45 bc             	mov    %eax,-0x44(%ebp)
8010357b:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
8010357f:	89 45 c0             	mov    %eax,-0x40(%ebp)
80103582:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80103586:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80103589:	31 c0                	xor    %eax,%eax
8010358b:	ee                   	out    %al,(%dx)
8010358c:	89 ca                	mov    %ecx,%edx
8010358e:	ec                   	in     (%dx),%al
8010358f:	0f b6 c0             	movzbl %al,%eax
80103592:	89 da                	mov    %ebx,%edx
80103594:	89 45 d0             	mov    %eax,-0x30(%ebp)
80103597:	b8 02 00 00 00       	mov    $0x2,%eax
8010359c:	ee                   	out    %al,(%dx)
8010359d:	89 ca                	mov    %ecx,%edx
8010359f:	ec                   	in     (%dx),%al
801035a0:	0f b6 c0             	movzbl %al,%eax
801035a3:	89 da                	mov    %ebx,%edx
801035a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801035a8:	b8 04 00 00 00       	mov    $0x4,%eax
801035ad:	ee                   	out    %al,(%dx)
801035ae:	89 ca                	mov    %ecx,%edx
801035b0:	ec                   	in     (%dx),%al
801035b1:	0f b6 c0             	movzbl %al,%eax
801035b4:	89 da                	mov    %ebx,%edx
801035b6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801035b9:	b8 07 00 00 00       	mov    $0x7,%eax
801035be:	ee                   	out    %al,(%dx)
801035bf:	89 ca                	mov    %ecx,%edx
801035c1:	ec                   	in     (%dx),%al
801035c2:	0f b6 c0             	movzbl %al,%eax
801035c5:	89 da                	mov    %ebx,%edx
801035c7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801035ca:	b8 08 00 00 00       	mov    $0x8,%eax
801035cf:	ee                   	out    %al,(%dx)
801035d0:	89 ca                	mov    %ecx,%edx
801035d2:	ec                   	in     (%dx),%al
801035d3:	0f b6 c0             	movzbl %al,%eax
801035d6:	89 da                	mov    %ebx,%edx
801035d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801035db:	b8 09 00 00 00       	mov    $0x9,%eax
801035e0:	ee                   	out    %al,(%dx)
801035e1:	89 ca                	mov    %ecx,%edx
801035e3:	ec                   	in     (%dx),%al
801035e4:	0f b6 c0             	movzbl %al,%eax
801035e7:	83 ec 04             	sub    $0x4,%esp
801035ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801035ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
801035f0:	6a 18                	push   $0x18
801035f2:	50                   	push   %eax
801035f3:	8d 45 b8             	lea    -0x48(%ebp),%eax
801035f6:	50                   	push   %eax
801035f7:	e8 24 28 00 00       	call   80105e20 <memcmp>
801035fc:	83 c4 10             	add    $0x10,%esp
801035ff:	85 c0                	test   %eax,%eax
80103601:	0f 85 f1 fe ff ff    	jne    801034f8 <cmostime+0x28>
80103607:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010360b:	75 78                	jne    80103685 <cmostime+0x1b5>
8010360d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80103610:	89 c2                	mov    %eax,%edx
80103612:	83 e0 0f             	and    $0xf,%eax
80103615:	c1 ea 04             	shr    $0x4,%edx
80103618:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010361b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010361e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80103621:	8b 45 bc             	mov    -0x44(%ebp),%eax
80103624:	89 c2                	mov    %eax,%edx
80103626:	83 e0 0f             	and    $0xf,%eax
80103629:	c1 ea 04             	shr    $0x4,%edx
8010362c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010362f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80103632:	89 45 bc             	mov    %eax,-0x44(%ebp)
80103635:	8b 45 c0             	mov    -0x40(%ebp),%eax
80103638:	89 c2                	mov    %eax,%edx
8010363a:	83 e0 0f             	and    $0xf,%eax
8010363d:	c1 ea 04             	shr    $0x4,%edx
80103640:	8d 14 92             	lea    (%edx,%edx,4),%edx
80103643:	8d 04 50             	lea    (%eax,%edx,2),%eax
80103646:	89 45 c0             	mov    %eax,-0x40(%ebp)
80103649:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010364c:	89 c2                	mov    %eax,%edx
8010364e:	83 e0 0f             	and    $0xf,%eax
80103651:	c1 ea 04             	shr    $0x4,%edx
80103654:	8d 14 92             	lea    (%edx,%edx,4),%edx
80103657:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010365a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010365d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80103660:	89 c2                	mov    %eax,%edx
80103662:	83 e0 0f             	and    $0xf,%eax
80103665:	c1 ea 04             	shr    $0x4,%edx
80103668:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010366b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010366e:	89 45 c8             	mov    %eax,-0x38(%ebp)
80103671:	8b 45 cc             	mov    -0x34(%ebp),%eax
80103674:	89 c2                	mov    %eax,%edx
80103676:	83 e0 0f             	and    $0xf,%eax
80103679:	c1 ea 04             	shr    $0x4,%edx
8010367c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010367f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80103682:	89 45 cc             	mov    %eax,-0x34(%ebp)
80103685:	8b 75 08             	mov    0x8(%ebp),%esi
80103688:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010368b:	89 06                	mov    %eax,(%esi)
8010368d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80103690:	89 46 04             	mov    %eax,0x4(%esi)
80103693:	8b 45 c0             	mov    -0x40(%ebp),%eax
80103696:	89 46 08             	mov    %eax,0x8(%esi)
80103699:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010369c:	89 46 0c             	mov    %eax,0xc(%esi)
8010369f:	8b 45 c8             	mov    -0x38(%ebp),%eax
801036a2:	89 46 10             	mov    %eax,0x10(%esi)
801036a5:	8b 45 cc             	mov    -0x34(%ebp),%eax
801036a8:	89 46 14             	mov    %eax,0x14(%esi)
801036ab:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
801036b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036b5:	5b                   	pop    %ebx
801036b6:	5e                   	pop    %esi
801036b7:	5f                   	pop    %edi
801036b8:	5d                   	pop    %ebp
801036b9:	c3                   	ret    
801036ba:	66 90                	xchg   %ax,%ax
801036bc:	66 90                	xchg   %ax,%ax
801036be:	66 90                	xchg   %ax,%ax

801036c0 <install_trans>:
801036c0:	8b 0d 88 c2 15 80    	mov    0x8015c288,%ecx
801036c6:	85 c9                	test   %ecx,%ecx
801036c8:	0f 8e 8a 00 00 00    	jle    80103758 <install_trans+0x98>
801036ce:	55                   	push   %ebp
801036cf:	89 e5                	mov    %esp,%ebp
801036d1:	57                   	push   %edi
801036d2:	56                   	push   %esi
801036d3:	53                   	push   %ebx
801036d4:	31 db                	xor    %ebx,%ebx
801036d6:	83 ec 0c             	sub    $0xc,%esp
801036d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801036e0:	a1 74 c2 15 80       	mov    0x8015c274,%eax
801036e5:	83 ec 08             	sub    $0x8,%esp
801036e8:	01 d8                	add    %ebx,%eax
801036ea:	83 c0 01             	add    $0x1,%eax
801036ed:	50                   	push   %eax
801036ee:	ff 35 84 c2 15 80    	pushl  0x8015c284
801036f4:	e8 b7 cf ff ff       	call   801006b0 <bread>
801036f9:	89 c7                	mov    %eax,%edi
801036fb:	58                   	pop    %eax
801036fc:	5a                   	pop    %edx
801036fd:	ff 34 9d 8c c2 15 80 	pushl  -0x7fea3d74(,%ebx,4)
80103704:	ff 35 84 c2 15 80    	pushl  0x8015c284
8010370a:	83 c3 01             	add    $0x1,%ebx
8010370d:	e8 9e cf ff ff       	call   801006b0 <bread>
80103712:	89 c6                	mov    %eax,%esi
80103714:	8d 47 5c             	lea    0x5c(%edi),%eax
80103717:	83 c4 0c             	add    $0xc,%esp
8010371a:	68 00 02 00 00       	push   $0x200
8010371f:	50                   	push   %eax
80103720:	8d 46 5c             	lea    0x5c(%esi),%eax
80103723:	50                   	push   %eax
80103724:	e8 57 27 00 00       	call   80105e80 <memmove>
80103729:	89 34 24             	mov    %esi,(%esp)
8010372c:	e8 4f d0 ff ff       	call   80100780 <bwrite>
80103731:	89 3c 24             	mov    %edi,(%esp)
80103734:	e8 87 d0 ff ff       	call   801007c0 <brelse>
80103739:	89 34 24             	mov    %esi,(%esp)
8010373c:	e8 7f d0 ff ff       	call   801007c0 <brelse>
80103741:	83 c4 10             	add    $0x10,%esp
80103744:	39 1d 88 c2 15 80    	cmp    %ebx,0x8015c288
8010374a:	7f 94                	jg     801036e0 <install_trans+0x20>
8010374c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010374f:	5b                   	pop    %ebx
80103750:	5e                   	pop    %esi
80103751:	5f                   	pop    %edi
80103752:	5d                   	pop    %ebp
80103753:	c3                   	ret    
80103754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103758:	f3 c3                	repz ret 
8010375a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103760 <write_head>:
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	56                   	push   %esi
80103764:	53                   	push   %ebx
80103765:	83 ec 08             	sub    $0x8,%esp
80103768:	ff 35 74 c2 15 80    	pushl  0x8015c274
8010376e:	ff 35 84 c2 15 80    	pushl  0x8015c284
80103774:	e8 37 cf ff ff       	call   801006b0 <bread>
80103779:	8b 1d 88 c2 15 80    	mov    0x8015c288,%ebx
8010377f:	83 c4 10             	add    $0x10,%esp
80103782:	89 c6                	mov    %eax,%esi
80103784:	85 db                	test   %ebx,%ebx
80103786:	89 58 5c             	mov    %ebx,0x5c(%eax)
80103789:	7e 16                	jle    801037a1 <write_head+0x41>
8010378b:	c1 e3 02             	shl    $0x2,%ebx
8010378e:	31 d2                	xor    %edx,%edx
80103790:	8b 8a 8c c2 15 80    	mov    -0x7fea3d74(%edx),%ecx
80103796:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
8010379a:	83 c2 04             	add    $0x4,%edx
8010379d:	39 da                	cmp    %ebx,%edx
8010379f:	75 ef                	jne    80103790 <write_head+0x30>
801037a1:	83 ec 0c             	sub    $0xc,%esp
801037a4:	56                   	push   %esi
801037a5:	e8 d6 cf ff ff       	call   80100780 <bwrite>
801037aa:	89 34 24             	mov    %esi,(%esp)
801037ad:	e8 0e d0 ff ff       	call   801007c0 <brelse>
801037b2:	83 c4 10             	add    $0x10,%esp
801037b5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801037b8:	5b                   	pop    %ebx
801037b9:	5e                   	pop    %esi
801037ba:	5d                   	pop    %ebp
801037bb:	c3                   	ret    
801037bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037c0 <initlog>:
801037c0:	55                   	push   %ebp
801037c1:	89 e5                	mov    %esp,%ebp
801037c3:	53                   	push   %ebx
801037c4:	83 ec 2c             	sub    $0x2c,%esp
801037c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801037ca:	68 c0 96 10 80       	push   $0x801096c0
801037cf:	68 40 c2 15 80       	push   $0x8015c240
801037d4:	e8 87 23 00 00       	call   80105b60 <initlock>
801037d9:	58                   	pop    %eax
801037da:	8d 45 dc             	lea    -0x24(%ebp),%eax
801037dd:	5a                   	pop    %edx
801037de:	50                   	push   %eax
801037df:	53                   	push   %ebx
801037e0:	e8 9b e8 ff ff       	call   80102080 <readsb>
801037e5:	8b 55 e8             	mov    -0x18(%ebp),%edx
801037e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
801037eb:	59                   	pop    %ecx
801037ec:	89 1d 84 c2 15 80    	mov    %ebx,0x8015c284
801037f2:	89 15 78 c2 15 80    	mov    %edx,0x8015c278
801037f8:	a3 74 c2 15 80       	mov    %eax,0x8015c274
801037fd:	5a                   	pop    %edx
801037fe:	50                   	push   %eax
801037ff:	53                   	push   %ebx
80103800:	e8 ab ce ff ff       	call   801006b0 <bread>
80103805:	8b 58 5c             	mov    0x5c(%eax),%ebx
80103808:	83 c4 10             	add    $0x10,%esp
8010380b:	85 db                	test   %ebx,%ebx
8010380d:	89 1d 88 c2 15 80    	mov    %ebx,0x8015c288
80103813:	7e 1c                	jle    80103831 <initlog+0x71>
80103815:	c1 e3 02             	shl    $0x2,%ebx
80103818:	31 d2                	xor    %edx,%edx
8010381a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103820:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80103824:	83 c2 04             	add    $0x4,%edx
80103827:	89 8a 88 c2 15 80    	mov    %ecx,-0x7fea3d78(%edx)
8010382d:	39 d3                	cmp    %edx,%ebx
8010382f:	75 ef                	jne    80103820 <initlog+0x60>
80103831:	83 ec 0c             	sub    $0xc,%esp
80103834:	50                   	push   %eax
80103835:	e8 86 cf ff ff       	call   801007c0 <brelse>
8010383a:	e8 81 fe ff ff       	call   801036c0 <install_trans>
8010383f:	c7 05 88 c2 15 80 00 	movl   $0x0,0x8015c288
80103846:	00 00 00 
80103849:	e8 12 ff ff ff       	call   80103760 <write_head>
8010384e:	83 c4 10             	add    $0x10,%esp
80103851:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103854:	c9                   	leave  
80103855:	c3                   	ret    
80103856:	8d 76 00             	lea    0x0(%esi),%esi
80103859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103860 <begin_op>:
80103860:	55                   	push   %ebp
80103861:	89 e5                	mov    %esp,%ebp
80103863:	83 ec 14             	sub    $0x14,%esp
80103866:	68 40 c2 15 80       	push   $0x8015c240
8010386b:	e8 e0 23 00 00       	call   80105c50 <acquire>
80103870:	83 c4 10             	add    $0x10,%esp
80103873:	eb 18                	jmp    8010388d <begin_op+0x2d>
80103875:	8d 76 00             	lea    0x0(%esi),%esi
80103878:	83 ec 08             	sub    $0x8,%esp
8010387b:	68 40 c2 15 80       	push   $0x8015c240
80103880:	68 40 c2 15 80       	push   $0x8015c240
80103885:	e8 76 1e 00 00       	call   80105700 <sleep>
8010388a:	83 c4 10             	add    $0x10,%esp
8010388d:	a1 80 c2 15 80       	mov    0x8015c280,%eax
80103892:	85 c0                	test   %eax,%eax
80103894:	75 e2                	jne    80103878 <begin_op+0x18>
80103896:	a1 7c c2 15 80       	mov    0x8015c27c,%eax
8010389b:	8b 15 88 c2 15 80    	mov    0x8015c288,%edx
801038a1:	83 c0 01             	add    $0x1,%eax
801038a4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
801038a7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
801038aa:	83 fa 1e             	cmp    $0x1e,%edx
801038ad:	7f c9                	jg     80103878 <begin_op+0x18>
801038af:	83 ec 0c             	sub    $0xc,%esp
801038b2:	a3 7c c2 15 80       	mov    %eax,0x8015c27c
801038b7:	68 40 c2 15 80       	push   $0x8015c240
801038bc:	e8 af 24 00 00       	call   80105d70 <release>
801038c1:	83 c4 10             	add    $0x10,%esp
801038c4:	c9                   	leave  
801038c5:	c3                   	ret    
801038c6:	8d 76 00             	lea    0x0(%esi),%esi
801038c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038d0 <end_op>:
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	57                   	push   %edi
801038d4:	56                   	push   %esi
801038d5:	53                   	push   %ebx
801038d6:	83 ec 18             	sub    $0x18,%esp
801038d9:	68 40 c2 15 80       	push   $0x8015c240
801038de:	e8 6d 23 00 00       	call   80105c50 <acquire>
801038e3:	a1 7c c2 15 80       	mov    0x8015c27c,%eax
801038e8:	8b 35 80 c2 15 80    	mov    0x8015c280,%esi
801038ee:	83 c4 10             	add    $0x10,%esp
801038f1:	8d 58 ff             	lea    -0x1(%eax),%ebx
801038f4:	85 f6                	test   %esi,%esi
801038f6:	89 1d 7c c2 15 80    	mov    %ebx,0x8015c27c
801038fc:	0f 85 1a 01 00 00    	jne    80103a1c <end_op+0x14c>
80103902:	85 db                	test   %ebx,%ebx
80103904:	0f 85 ee 00 00 00    	jne    801039f8 <end_op+0x128>
8010390a:	83 ec 0c             	sub    $0xc,%esp
8010390d:	c7 05 80 c2 15 80 01 	movl   $0x1,0x8015c280
80103914:	00 00 00 
80103917:	68 40 c2 15 80       	push   $0x8015c240
8010391c:	e8 4f 24 00 00       	call   80105d70 <release>
80103921:	8b 0d 88 c2 15 80    	mov    0x8015c288,%ecx
80103927:	83 c4 10             	add    $0x10,%esp
8010392a:	85 c9                	test   %ecx,%ecx
8010392c:	0f 8e 85 00 00 00    	jle    801039b7 <end_op+0xe7>
80103932:	a1 74 c2 15 80       	mov    0x8015c274,%eax
80103937:	83 ec 08             	sub    $0x8,%esp
8010393a:	01 d8                	add    %ebx,%eax
8010393c:	83 c0 01             	add    $0x1,%eax
8010393f:	50                   	push   %eax
80103940:	ff 35 84 c2 15 80    	pushl  0x8015c284
80103946:	e8 65 cd ff ff       	call   801006b0 <bread>
8010394b:	89 c6                	mov    %eax,%esi
8010394d:	58                   	pop    %eax
8010394e:	5a                   	pop    %edx
8010394f:	ff 34 9d 8c c2 15 80 	pushl  -0x7fea3d74(,%ebx,4)
80103956:	ff 35 84 c2 15 80    	pushl  0x8015c284
8010395c:	83 c3 01             	add    $0x1,%ebx
8010395f:	e8 4c cd ff ff       	call   801006b0 <bread>
80103964:	89 c7                	mov    %eax,%edi
80103966:	8d 40 5c             	lea    0x5c(%eax),%eax
80103969:	83 c4 0c             	add    $0xc,%esp
8010396c:	68 00 02 00 00       	push   $0x200
80103971:	50                   	push   %eax
80103972:	8d 46 5c             	lea    0x5c(%esi),%eax
80103975:	50                   	push   %eax
80103976:	e8 05 25 00 00       	call   80105e80 <memmove>
8010397b:	89 34 24             	mov    %esi,(%esp)
8010397e:	e8 fd cd ff ff       	call   80100780 <bwrite>
80103983:	89 3c 24             	mov    %edi,(%esp)
80103986:	e8 35 ce ff ff       	call   801007c0 <brelse>
8010398b:	89 34 24             	mov    %esi,(%esp)
8010398e:	e8 2d ce ff ff       	call   801007c0 <brelse>
80103993:	83 c4 10             	add    $0x10,%esp
80103996:	3b 1d 88 c2 15 80    	cmp    0x8015c288,%ebx
8010399c:	7c 94                	jl     80103932 <end_op+0x62>
8010399e:	e8 bd fd ff ff       	call   80103760 <write_head>
801039a3:	e8 18 fd ff ff       	call   801036c0 <install_trans>
801039a8:	c7 05 88 c2 15 80 00 	movl   $0x0,0x8015c288
801039af:	00 00 00 
801039b2:	e8 a9 fd ff ff       	call   80103760 <write_head>
801039b7:	83 ec 0c             	sub    $0xc,%esp
801039ba:	68 40 c2 15 80       	push   $0x8015c240
801039bf:	e8 8c 22 00 00       	call   80105c50 <acquire>
801039c4:	c7 04 24 40 c2 15 80 	movl   $0x8015c240,(%esp)
801039cb:	c7 05 80 c2 15 80 00 	movl   $0x0,0x8015c280
801039d2:	00 00 00 
801039d5:	e8 d6 1e 00 00       	call   801058b0 <wakeup>
801039da:	c7 04 24 40 c2 15 80 	movl   $0x8015c240,(%esp)
801039e1:	e8 8a 23 00 00       	call   80105d70 <release>
801039e6:	83 c4 10             	add    $0x10,%esp
801039e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801039ec:	5b                   	pop    %ebx
801039ed:	5e                   	pop    %esi
801039ee:	5f                   	pop    %edi
801039ef:	5d                   	pop    %ebp
801039f0:	c3                   	ret    
801039f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801039f8:	83 ec 0c             	sub    $0xc,%esp
801039fb:	68 40 c2 15 80       	push   $0x8015c240
80103a00:	e8 ab 1e 00 00       	call   801058b0 <wakeup>
80103a05:	c7 04 24 40 c2 15 80 	movl   $0x8015c240,(%esp)
80103a0c:	e8 5f 23 00 00       	call   80105d70 <release>
80103a11:	83 c4 10             	add    $0x10,%esp
80103a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a17:	5b                   	pop    %ebx
80103a18:	5e                   	pop    %esi
80103a19:	5f                   	pop    %edi
80103a1a:	5d                   	pop    %ebp
80103a1b:	c3                   	ret    
80103a1c:	83 ec 0c             	sub    $0xc,%esp
80103a1f:	68 c4 96 10 80       	push   $0x801096c4
80103a24:	e8 47 cf ff ff       	call   80100970 <panic>
80103a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a30 <log_write>:
80103a30:	55                   	push   %ebp
80103a31:	89 e5                	mov    %esp,%ebp
80103a33:	53                   	push   %ebx
80103a34:	83 ec 04             	sub    $0x4,%esp
80103a37:	8b 15 88 c2 15 80    	mov    0x8015c288,%edx
80103a3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103a40:	83 fa 1d             	cmp    $0x1d,%edx
80103a43:	0f 8f 9d 00 00 00    	jg     80103ae6 <log_write+0xb6>
80103a49:	a1 78 c2 15 80       	mov    0x8015c278,%eax
80103a4e:	83 e8 01             	sub    $0x1,%eax
80103a51:	39 c2                	cmp    %eax,%edx
80103a53:	0f 8d 8d 00 00 00    	jge    80103ae6 <log_write+0xb6>
80103a59:	a1 7c c2 15 80       	mov    0x8015c27c,%eax
80103a5e:	85 c0                	test   %eax,%eax
80103a60:	0f 8e 8d 00 00 00    	jle    80103af3 <log_write+0xc3>
80103a66:	83 ec 0c             	sub    $0xc,%esp
80103a69:	68 40 c2 15 80       	push   $0x8015c240
80103a6e:	e8 dd 21 00 00       	call   80105c50 <acquire>
80103a73:	8b 0d 88 c2 15 80    	mov    0x8015c288,%ecx
80103a79:	83 c4 10             	add    $0x10,%esp
80103a7c:	83 f9 00             	cmp    $0x0,%ecx
80103a7f:	7e 57                	jle    80103ad8 <log_write+0xa8>
80103a81:	8b 53 08             	mov    0x8(%ebx),%edx
80103a84:	31 c0                	xor    %eax,%eax
80103a86:	3b 15 8c c2 15 80    	cmp    0x8015c28c,%edx
80103a8c:	75 0b                	jne    80103a99 <log_write+0x69>
80103a8e:	eb 38                	jmp    80103ac8 <log_write+0x98>
80103a90:	39 14 85 8c c2 15 80 	cmp    %edx,-0x7fea3d74(,%eax,4)
80103a97:	74 2f                	je     80103ac8 <log_write+0x98>
80103a99:	83 c0 01             	add    $0x1,%eax
80103a9c:	39 c1                	cmp    %eax,%ecx
80103a9e:	75 f0                	jne    80103a90 <log_write+0x60>
80103aa0:	89 14 85 8c c2 15 80 	mov    %edx,-0x7fea3d74(,%eax,4)
80103aa7:	83 c0 01             	add    $0x1,%eax
80103aaa:	a3 88 c2 15 80       	mov    %eax,0x8015c288
80103aaf:	83 0b 04             	orl    $0x4,(%ebx)
80103ab2:	c7 45 08 40 c2 15 80 	movl   $0x8015c240,0x8(%ebp)
80103ab9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103abc:	c9                   	leave  
80103abd:	e9 ae 22 00 00       	jmp    80105d70 <release>
80103ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103ac8:	89 14 85 8c c2 15 80 	mov    %edx,-0x7fea3d74(,%eax,4)
80103acf:	eb de                	jmp    80103aaf <log_write+0x7f>
80103ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ad8:	8b 43 08             	mov    0x8(%ebx),%eax
80103adb:	a3 8c c2 15 80       	mov    %eax,0x8015c28c
80103ae0:	75 cd                	jne    80103aaf <log_write+0x7f>
80103ae2:	31 c0                	xor    %eax,%eax
80103ae4:	eb c1                	jmp    80103aa7 <log_write+0x77>
80103ae6:	83 ec 0c             	sub    $0xc,%esp
80103ae9:	68 d3 96 10 80       	push   $0x801096d3
80103aee:	e8 7d ce ff ff       	call   80100970 <panic>
80103af3:	83 ec 0c             	sub    $0xc,%esp
80103af6:	68 e9 96 10 80       	push   $0x801096e9
80103afb:	e8 70 ce ff ff       	call   80100970 <panic>

80103b00 <mpmain>:
80103b00:	55                   	push   %ebp
80103b01:	89 e5                	mov    %esp,%ebp
80103b03:	53                   	push   %ebx
80103b04:	83 ec 04             	sub    $0x4,%esp
80103b07:	e8 34 16 00 00       	call   80105140 <cpuid>
80103b0c:	89 c3                	mov    %eax,%ebx
80103b0e:	e8 2d 16 00 00       	call   80105140 <cpuid>
80103b13:	83 ec 04             	sub    $0x4,%esp
80103b16:	53                   	push   %ebx
80103b17:	50                   	push   %eax
80103b18:	68 04 97 10 80       	push   $0x80109704
80103b1d:	e8 1e d1 ff ff       	call   80100c40 <cprintf>
80103b22:	e8 a9 3b 00 00       	call   801076d0 <idtinit>
80103b27:	e8 94 15 00 00       	call   801050c0 <mycpu>
80103b2c:	89 c2                	mov    %eax,%edx
80103b2e:	b8 01 00 00 00       	mov    $0x1,%eax
80103b33:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80103b3a:	e8 e1 18 00 00       	call   80105420 <scheduler>
80103b3f:	90                   	nop

80103b40 <mpenter>:
80103b40:	55                   	push   %ebp
80103b41:	89 e5                	mov    %esp,%ebp
80103b43:	83 ec 08             	sub    $0x8,%esp
80103b46:	e8 15 4d 00 00       	call   80108860 <switchkvm>
80103b4b:	e8 80 4c 00 00       	call   801087d0 <seginit>
80103b50:	e8 9b f7 ff ff       	call   801032f0 <lapicinit>
80103b55:	e8 a6 ff ff ff       	call   80103b00 <mpmain>
80103b5a:	66 90                	xchg   %ax,%ax
80103b5c:	66 90                	xchg   %ax,%ax
80103b5e:	66 90                	xchg   %ax,%ax

80103b60 <main>:
80103b60:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103b64:	83 e4 f0             	and    $0xfffffff0,%esp
80103b67:	ff 71 fc             	pushl  -0x4(%ecx)
80103b6a:	55                   	push   %ebp
80103b6b:	89 e5                	mov    %esp,%ebp
80103b6d:	53                   	push   %ebx
80103b6e:	51                   	push   %ecx
80103b6f:	83 ec 08             	sub    $0x8,%esp
80103b72:	68 00 00 40 80       	push   $0x80400000
80103b77:	68 68 f0 15 80       	push   $0x8015f068
80103b7c:	e8 2f f5 ff ff       	call   801030b0 <kinit1>
80103b81:	e8 aa 51 00 00       	call   80108d30 <kvmalloc>
80103b86:	e8 85 01 00 00       	call   80103d10 <mpinit>
80103b8b:	e8 60 f7 ff ff       	call   801032f0 <lapicinit>
80103b90:	e8 3b 4c 00 00       	call   801087d0 <seginit>
80103b95:	e8 06 10 00 00       	call   80104ba0 <picinit>
80103b9a:	e8 41 f3 ff ff       	call   80102ee0 <ioapicinit>
80103b9f:	e8 fc d3 ff ff       	call   80100fa0 <consoleinit>
80103ba4:	e8 67 3e 00 00       	call   80107a10 <uartinit>
80103ba9:	e8 f2 14 00 00       	call   801050a0 <pinit>
80103bae:	e8 9d 3a 00 00       	call   80107650 <tvinit>
80103bb3:	e8 68 ca ff ff       	call   80100620 <binit>
80103bb8:	e8 d3 dd ff ff       	call   80101990 <fileinit>
80103bbd:	e8 fe f0 ff ff       	call   80102cc0 <ideinit>
80103bc2:	83 c4 0c             	add    $0xc,%esp
80103bc5:	68 8a 00 00 00       	push   $0x8a
80103bca:	68 cc d4 10 80       	push   $0x8010d4cc
80103bcf:	68 00 70 00 80       	push   $0x80007000
80103bd4:	e8 a7 22 00 00       	call   80105e80 <memmove>
80103bd9:	69 05 c0 c8 15 80 b0 	imul   $0xb0,0x8015c8c0,%eax
80103be0:	00 00 00 
80103be3:	83 c4 10             	add    $0x10,%esp
80103be6:	05 40 c3 15 80       	add    $0x8015c340,%eax
80103beb:	3d 40 c3 15 80       	cmp    $0x8015c340,%eax
80103bf0:	76 71                	jbe    80103c63 <main+0x103>
80103bf2:	bb 40 c3 15 80       	mov    $0x8015c340,%ebx
80103bf7:	89 f6                	mov    %esi,%esi
80103bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103c00:	e8 bb 14 00 00       	call   801050c0 <mycpu>
80103c05:	39 d8                	cmp    %ebx,%eax
80103c07:	74 41                	je     80103c4a <main+0xea>
80103c09:	e8 72 f5 ff ff       	call   80103180 <kalloc>
80103c0e:	05 00 10 00 00       	add    $0x1000,%eax
80103c13:	c7 05 f8 6f 00 80 40 	movl   $0x80103b40,0x80006ff8
80103c1a:	3b 10 80 
80103c1d:	c7 05 f4 6f 00 80 00 	movl   $0x10c000,0x80006ff4
80103c24:	c0 10 00 
80103c27:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80103c2c:	0f b6 03             	movzbl (%ebx),%eax
80103c2f:	83 ec 08             	sub    $0x8,%esp
80103c32:	68 00 70 00 00       	push   $0x7000
80103c37:	50                   	push   %eax
80103c38:	e8 03 f8 ff ff       	call   80103440 <lapicstartap>
80103c3d:	83 c4 10             	add    $0x10,%esp
80103c40:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103c46:	85 c0                	test   %eax,%eax
80103c48:	74 f6                	je     80103c40 <main+0xe0>
80103c4a:	69 05 c0 c8 15 80 b0 	imul   $0xb0,0x8015c8c0,%eax
80103c51:	00 00 00 
80103c54:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80103c5a:	05 40 c3 15 80       	add    $0x8015c340,%eax
80103c5f:	39 c3                	cmp    %eax,%ebx
80103c61:	72 9d                	jb     80103c00 <main+0xa0>
80103c63:	83 ec 08             	sub    $0x8,%esp
80103c66:	68 00 00 00 8e       	push   $0x8e000000
80103c6b:	68 00 00 40 80       	push   $0x80400000
80103c70:	e8 ab f4 ff ff       	call   80103120 <kinit2>
80103c75:	e8 f6 0e 00 00       	call   80104b70 <pci_init>
80103c7a:	e8 f1 32 00 00       	call   80106f70 <sockinit>
80103c7f:	e8 0c 15 00 00       	call   80105190 <userinit>
80103c84:	e8 77 fe ff ff       	call   80103b00 <mpmain>
80103c89:	66 90                	xchg   %ax,%ax
80103c8b:	66 90                	xchg   %ax,%ax
80103c8d:	66 90                	xchg   %ax,%ax
80103c8f:	90                   	nop

80103c90 <mpsearch1>:
80103c90:	55                   	push   %ebp
80103c91:	89 e5                	mov    %esp,%ebp
80103c93:	57                   	push   %edi
80103c94:	56                   	push   %esi
80103c95:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80103c9b:	53                   	push   %ebx
80103c9c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80103c9f:	83 ec 0c             	sub    $0xc,%esp
80103ca2:	39 de                	cmp    %ebx,%esi
80103ca4:	72 10                	jb     80103cb6 <mpsearch1+0x26>
80103ca6:	eb 50                	jmp    80103cf8 <mpsearch1+0x68>
80103ca8:	90                   	nop
80103ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103cb0:	39 fb                	cmp    %edi,%ebx
80103cb2:	89 fe                	mov    %edi,%esi
80103cb4:	76 42                	jbe    80103cf8 <mpsearch1+0x68>
80103cb6:	83 ec 04             	sub    $0x4,%esp
80103cb9:	8d 7e 10             	lea    0x10(%esi),%edi
80103cbc:	6a 04                	push   $0x4
80103cbe:	68 18 97 10 80       	push   $0x80109718
80103cc3:	56                   	push   %esi
80103cc4:	e8 57 21 00 00       	call   80105e20 <memcmp>
80103cc9:	83 c4 10             	add    $0x10,%esp
80103ccc:	85 c0                	test   %eax,%eax
80103cce:	75 e0                	jne    80103cb0 <mpsearch1+0x20>
80103cd0:	89 f1                	mov    %esi,%ecx
80103cd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cd8:	0f b6 11             	movzbl (%ecx),%edx
80103cdb:	83 c1 01             	add    $0x1,%ecx
80103cde:	01 d0                	add    %edx,%eax
80103ce0:	39 f9                	cmp    %edi,%ecx
80103ce2:	75 f4                	jne    80103cd8 <mpsearch1+0x48>
80103ce4:	84 c0                	test   %al,%al
80103ce6:	75 c8                	jne    80103cb0 <mpsearch1+0x20>
80103ce8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ceb:	89 f0                	mov    %esi,%eax
80103ced:	5b                   	pop    %ebx
80103cee:	5e                   	pop    %esi
80103cef:	5f                   	pop    %edi
80103cf0:	5d                   	pop    %ebp
80103cf1:	c3                   	ret    
80103cf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cf8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103cfb:	31 f6                	xor    %esi,%esi
80103cfd:	89 f0                	mov    %esi,%eax
80103cff:	5b                   	pop    %ebx
80103d00:	5e                   	pop    %esi
80103d01:	5f                   	pop    %edi
80103d02:	5d                   	pop    %ebp
80103d03:	c3                   	ret    
80103d04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d10 <mpinit>:
80103d10:	55                   	push   %ebp
80103d11:	89 e5                	mov    %esp,%ebp
80103d13:	57                   	push   %edi
80103d14:	56                   	push   %esi
80103d15:	53                   	push   %ebx
80103d16:	83 ec 1c             	sub    $0x1c,%esp
80103d19:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103d20:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103d27:	c1 e0 08             	shl    $0x8,%eax
80103d2a:	09 d0                	or     %edx,%eax
80103d2c:	c1 e0 04             	shl    $0x4,%eax
80103d2f:	85 c0                	test   %eax,%eax
80103d31:	75 1b                	jne    80103d4e <mpinit+0x3e>
80103d33:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80103d3a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103d41:	c1 e0 08             	shl    $0x8,%eax
80103d44:	09 d0                	or     %edx,%eax
80103d46:	c1 e0 0a             	shl    $0xa,%eax
80103d49:	2d 00 04 00 00       	sub    $0x400,%eax
80103d4e:	ba 00 04 00 00       	mov    $0x400,%edx
80103d53:	e8 38 ff ff ff       	call   80103c90 <mpsearch1>
80103d58:	85 c0                	test   %eax,%eax
80103d5a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103d5d:	0f 84 3d 01 00 00    	je     80103ea0 <mpinit+0x190>
80103d63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103d66:	8b 58 04             	mov    0x4(%eax),%ebx
80103d69:	85 db                	test   %ebx,%ebx
80103d6b:	0f 84 4f 01 00 00    	je     80103ec0 <mpinit+0x1b0>
80103d71:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80103d77:	83 ec 04             	sub    $0x4,%esp
80103d7a:	6a 04                	push   $0x4
80103d7c:	68 35 97 10 80       	push   $0x80109735
80103d81:	56                   	push   %esi
80103d82:	e8 99 20 00 00       	call   80105e20 <memcmp>
80103d87:	83 c4 10             	add    $0x10,%esp
80103d8a:	85 c0                	test   %eax,%eax
80103d8c:	0f 85 2e 01 00 00    	jne    80103ec0 <mpinit+0x1b0>
80103d92:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103d99:	3c 01                	cmp    $0x1,%al
80103d9b:	0f 95 c2             	setne  %dl
80103d9e:	3c 04                	cmp    $0x4,%al
80103da0:	0f 95 c0             	setne  %al
80103da3:	20 c2                	and    %al,%dl
80103da5:	0f 85 15 01 00 00    	jne    80103ec0 <mpinit+0x1b0>
80103dab:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
80103db2:	66 85 ff             	test   %di,%di
80103db5:	74 1a                	je     80103dd1 <mpinit+0xc1>
80103db7:	89 f0                	mov    %esi,%eax
80103db9:	01 f7                	add    %esi,%edi
80103dbb:	31 d2                	xor    %edx,%edx
80103dbd:	8d 76 00             	lea    0x0(%esi),%esi
80103dc0:	0f b6 08             	movzbl (%eax),%ecx
80103dc3:	83 c0 01             	add    $0x1,%eax
80103dc6:	01 ca                	add    %ecx,%edx
80103dc8:	39 c7                	cmp    %eax,%edi
80103dca:	75 f4                	jne    80103dc0 <mpinit+0xb0>
80103dcc:	84 d2                	test   %dl,%dl
80103dce:	0f 95 c2             	setne  %dl
80103dd1:	85 f6                	test   %esi,%esi
80103dd3:	0f 84 e7 00 00 00    	je     80103ec0 <mpinit+0x1b0>
80103dd9:	84 d2                	test   %dl,%dl
80103ddb:	0f 85 df 00 00 00    	jne    80103ec0 <mpinit+0x1b0>
80103de1:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103de7:	a3 3c c2 15 80       	mov    %eax,0x8015c23c
80103dec:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103df3:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103df9:	bb 01 00 00 00       	mov    $0x1,%ebx
80103dfe:	01 d6                	add    %edx,%esi
80103e00:	39 c6                	cmp    %eax,%esi
80103e02:	76 23                	jbe    80103e27 <mpinit+0x117>
80103e04:	0f b6 10             	movzbl (%eax),%edx
80103e07:	80 fa 04             	cmp    $0x4,%dl
80103e0a:	0f 87 ca 00 00 00    	ja     80103eda <mpinit+0x1ca>
80103e10:	ff 24 95 5c 97 10 80 	jmp    *-0x7fef68a4(,%edx,4)
80103e17:	89 f6                	mov    %esi,%esi
80103e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103e20:	83 c0 08             	add    $0x8,%eax
80103e23:	39 c6                	cmp    %eax,%esi
80103e25:	77 dd                	ja     80103e04 <mpinit+0xf4>
80103e27:	85 db                	test   %ebx,%ebx
80103e29:	0f 84 9e 00 00 00    	je     80103ecd <mpinit+0x1bd>
80103e2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103e32:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103e36:	74 15                	je     80103e4d <mpinit+0x13d>
80103e38:	b8 70 00 00 00       	mov    $0x70,%eax
80103e3d:	ba 22 00 00 00       	mov    $0x22,%edx
80103e42:	ee                   	out    %al,(%dx)
80103e43:	ba 23 00 00 00       	mov    $0x23,%edx
80103e48:	ec                   	in     (%dx),%al
80103e49:	83 c8 01             	or     $0x1,%eax
80103e4c:	ee                   	out    %al,(%dx)
80103e4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e50:	5b                   	pop    %ebx
80103e51:	5e                   	pop    %esi
80103e52:	5f                   	pop    %edi
80103e53:	5d                   	pop    %ebp
80103e54:	c3                   	ret    
80103e55:	8d 76 00             	lea    0x0(%esi),%esi
80103e58:	8b 0d c0 c8 15 80    	mov    0x8015c8c0,%ecx
80103e5e:	83 f9 07             	cmp    $0x7,%ecx
80103e61:	7f 19                	jg     80103e7c <mpinit+0x16c>
80103e63:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103e67:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
80103e6d:	83 c1 01             	add    $0x1,%ecx
80103e70:	89 0d c0 c8 15 80    	mov    %ecx,0x8015c8c0
80103e76:	88 97 40 c3 15 80    	mov    %dl,-0x7fea3cc0(%edi)
80103e7c:	83 c0 14             	add    $0x14,%eax
80103e7f:	e9 7c ff ff ff       	jmp    80103e00 <mpinit+0xf0>
80103e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e88:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103e8c:	83 c0 08             	add    $0x8,%eax
80103e8f:	88 15 20 c3 15 80    	mov    %dl,0x8015c320
80103e95:	e9 66 ff ff ff       	jmp    80103e00 <mpinit+0xf0>
80103e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103ea0:	ba 00 00 01 00       	mov    $0x10000,%edx
80103ea5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103eaa:	e8 e1 fd ff ff       	call   80103c90 <mpsearch1>
80103eaf:	85 c0                	test   %eax,%eax
80103eb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103eb4:	0f 85 a9 fe ff ff    	jne    80103d63 <mpinit+0x53>
80103eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103ec0:	83 ec 0c             	sub    $0xc,%esp
80103ec3:	68 1d 97 10 80       	push   $0x8010971d
80103ec8:	e8 a3 ca ff ff       	call   80100970 <panic>
80103ecd:	83 ec 0c             	sub    $0xc,%esp
80103ed0:	68 3c 97 10 80       	push   $0x8010973c
80103ed5:	e8 96 ca ff ff       	call   80100970 <panic>
80103eda:	31 db                	xor    %ebx,%ebx
80103edc:	e9 26 ff ff ff       	jmp    80103e07 <mpinit+0xf7>
80103ee1:	66 90                	xchg   %ax,%ax
80103ee3:	66 90                	xchg   %ax,%ax
80103ee5:	66 90                	xchg   %ax,%ax
80103ee7:	66 90                	xchg   %ax,%ax
80103ee9:	66 90                	xchg   %ax,%ax
80103eeb:	66 90                	xchg   %ax,%ax
80103eed:	66 90                	xchg   %ax,%ax
80103eef:	90                   	nop

80103ef0 <net_tx_eth>:
80103ef0:	55                   	push   %ebp
80103ef1:	89 e5                	mov    %esp,%ebp
80103ef3:	57                   	push   %edi
80103ef4:	56                   	push   %esi
80103ef5:	53                   	push   %ebx
80103ef6:	89 c3                	mov    %eax,%ebx
80103ef8:	83 c0 0c             	add    $0xc,%eax
80103efb:	83 ec 1c             	sub    $0x1c,%esp
80103efe:	8b 78 f8             	mov    -0x8(%eax),%edi
80103f01:	8d 77 f2             	lea    -0xe(%edi),%esi
80103f04:	89 70 f8             	mov    %esi,-0x8(%eax)
80103f07:	39 c6                	cmp    %eax,%esi
80103f09:	72 55                	jb     80103f60 <net_tx_eth+0x70>
80103f0b:	8d 47 f8             	lea    -0x8(%edi),%eax
80103f0e:	83 43 08 0e          	addl   $0xe,0x8(%ebx)
80103f12:	83 ec 04             	sub    $0x4,%esp
80103f15:	6a 06                	push   $0x6
80103f17:	68 08 d0 10 80       	push   $0x8010d008
80103f1c:	50                   	push   %eax
80103f1d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80103f20:	e8 5b 1f 00 00       	call   80105e80 <memmove>
80103f25:	83 c4 0c             	add    $0xc,%esp
80103f28:	6a 06                	push   $0x6
80103f2a:	68 00 d0 10 80       	push   $0x8010d000
80103f2f:	56                   	push   %esi
80103f30:	e8 4b 1f 00 00       	call   80105e80 <memmove>
80103f35:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103f38:	66 c1 c2 08          	rol    $0x8,%dx
80103f3c:	66 89 57 fe          	mov    %dx,-0x2(%edi)
80103f40:	58                   	pop    %eax
80103f41:	5a                   	pop    %edx
80103f42:	ff 73 08             	pushl  0x8(%ebx)
80103f45:	ff 73 04             	pushl  0x4(%ebx)
80103f48:	e8 b3 d5 ff ff       	call   80101500 <e1000_transmit>
80103f4d:	89 1c 24             	mov    %ebx,(%esp)
80103f50:	e8 7b f0 ff ff       	call   80102fd0 <kfree>
80103f55:	83 c4 10             	add    $0x10,%esp
80103f58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f5b:	5b                   	pop    %ebx
80103f5c:	5e                   	pop    %esi
80103f5d:	5f                   	pop    %edi
80103f5e:	5d                   	pop    %ebp
80103f5f:	c3                   	ret    
80103f60:	83 ec 0c             	sub    $0xc,%esp
80103f63:	68 70 97 10 80       	push   $0x80109770
80103f68:	e8 03 ca ff ff       	call   80100970 <panic>
80103f6d:	8d 76 00             	lea    0x0(%esi),%esi

80103f70 <in_cksum.constprop.2>:
80103f70:	55                   	push   %ebp
80103f71:	31 d2                	xor    %edx,%edx
80103f73:	89 e5                	mov    %esp,%ebp
80103f75:	53                   	push   %ebx
80103f76:	8d 58 14             	lea    0x14(%eax),%ebx
80103f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f80:	83 c0 02             	add    $0x2,%eax
80103f83:	0f b7 48 fe          	movzwl -0x2(%eax),%ecx
80103f87:	01 ca                	add    %ecx,%edx
80103f89:	39 d8                	cmp    %ebx,%eax
80103f8b:	75 f3                	jne    80103f80 <in_cksum.constprop.2+0x10>
80103f8d:	0f b7 c2             	movzwl %dx,%eax
80103f90:	c1 ea 10             	shr    $0x10,%edx
80103f93:	01 c2                	add    %eax,%edx
80103f95:	89 d0                	mov    %edx,%eax
80103f97:	c1 e8 10             	shr    $0x10,%eax
80103f9a:	01 d0                	add    %edx,%eax
80103f9c:	f7 d0                	not    %eax
80103f9e:	5b                   	pop    %ebx
80103f9f:	5d                   	pop    %ebp
80103fa0:	c3                   	ret    
80103fa1:	eb 0d                	jmp    80103fb0 <mbufpull>
80103fa3:	90                   	nop
80103fa4:	90                   	nop
80103fa5:	90                   	nop
80103fa6:	90                   	nop
80103fa7:	90                   	nop
80103fa8:	90                   	nop
80103fa9:	90                   	nop
80103faa:	90                   	nop
80103fab:	90                   	nop
80103fac:	90                   	nop
80103fad:	90                   	nop
80103fae:	90                   	nop
80103faf:	90                   	nop

80103fb0 <mbufpull>:
80103fb0:	55                   	push   %ebp
80103fb1:	89 e5                	mov    %esp,%ebp
80103fb3:	53                   	push   %ebx
80103fb4:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103fb7:	8b 55 0c             	mov    0xc(%ebp),%edx
80103fba:	8b 59 08             	mov    0x8(%ecx),%ebx
80103fbd:	8b 41 04             	mov    0x4(%ecx),%eax
80103fc0:	39 d3                	cmp    %edx,%ebx
80103fc2:	72 14                	jb     80103fd8 <mbufpull+0x28>
80103fc4:	29 d3                	sub    %edx,%ebx
80103fc6:	01 c2                	add    %eax,%edx
80103fc8:	89 59 08             	mov    %ebx,0x8(%ecx)
80103fcb:	89 51 04             	mov    %edx,0x4(%ecx)
80103fce:	5b                   	pop    %ebx
80103fcf:	5d                   	pop    %ebp
80103fd0:	c3                   	ret    
80103fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fd8:	31 c0                	xor    %eax,%eax
80103fda:	eb f2                	jmp    80103fce <mbufpull+0x1e>
80103fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103fe0 <mbufpush>:
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	53                   	push   %ebx
80103fe4:	83 ec 04             	sub    $0x4,%esp
80103fe7:	8b 55 08             	mov    0x8(%ebp),%edx
80103fea:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103fed:	8b 42 04             	mov    0x4(%edx),%eax
80103ff0:	8d 5a 0c             	lea    0xc(%edx),%ebx
80103ff3:	29 c8                	sub    %ecx,%eax
80103ff5:	39 d8                	cmp    %ebx,%eax
80103ff7:	89 42 04             	mov    %eax,0x4(%edx)
80103ffa:	72 08                	jb     80104004 <mbufpush+0x24>
80103ffc:	01 4a 08             	add    %ecx,0x8(%edx)
80103fff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104002:	c9                   	leave  
80104003:	c3                   	ret    
80104004:	83 ec 0c             	sub    $0xc,%esp
80104007:	68 70 97 10 80       	push   $0x80109770
8010400c:	e8 5f c9 ff ff       	call   80100970 <panic>
80104011:	eb 0d                	jmp    80104020 <mbufput>
80104013:	90                   	nop
80104014:	90                   	nop
80104015:	90                   	nop
80104016:	90                   	nop
80104017:	90                   	nop
80104018:	90                   	nop
80104019:	90                   	nop
8010401a:	90                   	nop
8010401b:	90                   	nop
8010401c:	90                   	nop
8010401d:	90                   	nop
8010401e:	90                   	nop
8010401f:	90                   	nop

80104020 <mbufput>:
80104020:	55                   	push   %ebp
80104021:	89 e5                	mov    %esp,%ebp
80104023:	83 ec 08             	sub    $0x8,%esp
80104026:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104029:	8b 51 08             	mov    0x8(%ecx),%edx
8010402c:	8b 41 04             	mov    0x4(%ecx),%eax
8010402f:	01 d0                	add    %edx,%eax
80104031:	03 55 0c             	add    0xc(%ebp),%edx
80104034:	81 fa 00 08 00 00    	cmp    $0x800,%edx
8010403a:	89 51 08             	mov    %edx,0x8(%ecx)
8010403d:	77 02                	ja     80104041 <mbufput+0x21>
8010403f:	c9                   	leave  
80104040:	c3                   	ret    
80104041:	83 ec 0c             	sub    $0xc,%esp
80104044:	68 79 97 10 80       	push   $0x80109779
80104049:	e8 22 c9 ff ff       	call   80100970 <panic>
8010404e:	66 90                	xchg   %ax,%ax

80104050 <mbuftrim>:
80104050:	55                   	push   %ebp
80104051:	89 e5                	mov    %esp,%ebp
80104053:	8b 55 08             	mov    0x8(%ebp),%edx
80104056:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104059:	8b 42 08             	mov    0x8(%edx),%eax
8010405c:	39 c8                	cmp    %ecx,%eax
8010405e:	72 10                	jb     80104070 <mbuftrim+0x20>
80104060:	29 c8                	sub    %ecx,%eax
80104062:	89 42 08             	mov    %eax,0x8(%edx)
80104065:	03 42 04             	add    0x4(%edx),%eax
80104068:	5d                   	pop    %ebp
80104069:	c3                   	ret    
8010406a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104070:	31 c0                	xor    %eax,%eax
80104072:	5d                   	pop    %ebp
80104073:	c3                   	ret    
80104074:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010407a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104080 <mbufalloc>:
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	56                   	push   %esi
80104084:	53                   	push   %ebx
80104085:	8b 75 08             	mov    0x8(%ebp),%esi
80104088:	81 fe 00 08 00 00    	cmp    $0x800,%esi
8010408e:	77 40                	ja     801040d0 <mbufalloc+0x50>
80104090:	e8 eb f0 ff ff       	call   80103180 <kalloc>
80104095:	85 c0                	test   %eax,%eax
80104097:	89 c3                	mov    %eax,%ebx
80104099:	74 28                	je     801040c3 <mbufalloc+0x43>
8010409b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801040a1:	8d 40 0c             	lea    0xc(%eax),%eax
801040a4:	83 ec 04             	sub    $0x4,%esp
801040a7:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801040ae:	01 c6                	add    %eax,%esi
801040b0:	89 73 04             	mov    %esi,0x4(%ebx)
801040b3:	68 00 08 00 00       	push   $0x800
801040b8:	6a 00                	push   $0x0
801040ba:	50                   	push   %eax
801040bb:	e8 10 1d 00 00       	call   80105dd0 <memset>
801040c0:	83 c4 10             	add    $0x10,%esp
801040c3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040c6:	89 d8                	mov    %ebx,%eax
801040c8:	5b                   	pop    %ebx
801040c9:	5e                   	pop    %esi
801040ca:	5d                   	pop    %ebp
801040cb:	c3                   	ret    
801040cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801040d0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040d3:	31 db                	xor    %ebx,%ebx
801040d5:	89 d8                	mov    %ebx,%eax
801040d7:	5b                   	pop    %ebx
801040d8:	5e                   	pop    %esi
801040d9:	5d                   	pop    %ebp
801040da:	c3                   	ret    
801040db:	90                   	nop
801040dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801040e0 <mbuffree>:
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	5d                   	pop    %ebp
801040e4:	e9 e7 ee ff ff       	jmp    80102fd0 <kfree>
801040e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801040f0 <mbufq_pushtail>:
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	8b 45 08             	mov    0x8(%ebp),%eax
801040f6:	8b 55 0c             	mov    0xc(%ebp),%edx
801040f9:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
801040ff:	8b 08                	mov    (%eax),%ecx
80104101:	85 c9                	test   %ecx,%ecx
80104103:	74 0b                	je     80104110 <mbufq_pushtail+0x20>
80104105:	8b 48 04             	mov    0x4(%eax),%ecx
80104108:	89 11                	mov    %edx,(%ecx)
8010410a:	89 50 04             	mov    %edx,0x4(%eax)
8010410d:	5d                   	pop    %ebp
8010410e:	c3                   	ret    
8010410f:	90                   	nop
80104110:	89 50 04             	mov    %edx,0x4(%eax)
80104113:	89 10                	mov    %edx,(%eax)
80104115:	5d                   	pop    %ebp
80104116:	c3                   	ret    
80104117:	89 f6                	mov    %esi,%esi
80104119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104120 <mbufq_pushhead>:
80104120:	55                   	push   %ebp
80104121:	89 e5                	mov    %esp,%ebp
80104123:	8b 45 08             	mov    0x8(%ebp),%eax
80104126:	8b 55 0c             	mov    0xc(%ebp),%edx
80104129:	8b 08                	mov    (%eax),%ecx
8010412b:	89 10                	mov    %edx,(%eax)
8010412d:	85 c9                	test   %ecx,%ecx
8010412f:	74 07                	je     80104138 <mbufq_pushhead+0x18>
80104131:	89 0a                	mov    %ecx,(%edx)
80104133:	5d                   	pop    %ebp
80104134:	c3                   	ret    
80104135:	8d 76 00             	lea    0x0(%esi),%esi
80104138:	89 50 04             	mov    %edx,0x4(%eax)
8010413b:	5d                   	pop    %ebp
8010413c:	c3                   	ret    
8010413d:	8d 76 00             	lea    0x0(%esi),%esi

80104140 <mbufq_pophead>:
80104140:	55                   	push   %ebp
80104141:	89 e5                	mov    %esp,%ebp
80104143:	8b 55 08             	mov    0x8(%ebp),%edx
80104146:	8b 02                	mov    (%edx),%eax
80104148:	85 c0                	test   %eax,%eax
8010414a:	74 04                	je     80104150 <mbufq_pophead+0x10>
8010414c:	8b 08                	mov    (%eax),%ecx
8010414e:	89 0a                	mov    %ecx,(%edx)
80104150:	5d                   	pop    %ebp
80104151:	c3                   	ret    
80104152:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104160 <mbufq_empty>:
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	8b 45 08             	mov    0x8(%ebp),%eax
80104166:	5d                   	pop    %ebp
80104167:	8b 00                	mov    (%eax),%eax
80104169:	85 c0                	test   %eax,%eax
8010416b:	0f 94 c0             	sete   %al
8010416e:	0f b6 c0             	movzbl %al,%eax
80104171:	c3                   	ret    
80104172:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104180 <mbufq_init>:
80104180:	55                   	push   %ebp
80104181:	89 e5                	mov    %esp,%ebp
80104183:	8b 45 08             	mov    0x8(%ebp),%eax
80104186:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010418c:	5d                   	pop    %ebp
8010418d:	c3                   	ret    
8010418e:	66 90                	xchg   %ax,%ax

80104190 <net_tx_udp>:
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	57                   	push   %edi
80104194:	56                   	push   %esi
80104195:	53                   	push   %ebx
80104196:	83 ec 1c             	sub    $0x1c,%esp
80104199:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010419c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010419f:	8b 55 10             	mov    0x10(%ebp),%edx
801041a2:	8b 7d 14             	mov    0x14(%ebp),%edi
801041a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801041a8:	8b 43 04             	mov    0x4(%ebx),%eax
801041ab:	8d 73 0c             	lea    0xc(%ebx),%esi
801041ae:	8d 48 f8             	lea    -0x8(%eax),%ecx
801041b1:	39 f1                	cmp    %esi,%ecx
801041b3:	89 4b 04             	mov    %ecx,0x4(%ebx)
801041b6:	0f 82 94 00 00 00    	jb     80104250 <net_tx_udp+0xc0>
801041bc:	66 c1 c2 08          	rol    $0x8,%dx
801041c0:	83 43 08 08          	addl   $0x8,0x8(%ebx)
801041c4:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801041c8:	89 fa                	mov    %edi,%edx
801041ca:	66 c1 c2 08          	rol    $0x8,%dx
801041ce:	66 89 50 fa          	mov    %dx,-0x6(%eax)
801041d2:	0f b7 53 08          	movzwl 0x8(%ebx),%edx
801041d6:	66 c1 c2 08          	rol    $0x8,%dx
801041da:	66 89 50 fc          	mov    %dx,-0x4(%eax)
801041de:	31 d2                	xor    %edx,%edx
801041e0:	66 89 50 fe          	mov    %dx,-0x2(%eax)
801041e4:	8b 7b 04             	mov    0x4(%ebx),%edi
801041e7:	8d 4f ec             	lea    -0x14(%edi),%ecx
801041ea:	39 ce                	cmp    %ecx,%esi
801041ec:	89 4b 04             	mov    %ecx,0x4(%ebx)
801041ef:	77 5f                	ja     80104250 <net_tx_udp+0xc0>
801041f1:	83 43 08 14          	addl   $0x14,0x8(%ebx)
801041f5:	83 ec 04             	sub    $0x4,%esp
801041f8:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801041fb:	6a 14                	push   $0x14
801041fd:	6a 00                	push   $0x0
801041ff:	51                   	push   %ecx
80104200:	e8 cb 1b 00 00       	call   80105dd0 <memset>
80104205:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80104208:	c6 47 ec 45          	movb   $0x45,-0x14(%edi)
8010420c:	c6 47 f5 11          	movb   $0x11,-0xb(%edi)
80104210:	c7 47 f8 0a 00 02 0f 	movl   $0xf02000a,-0x8(%edi)
80104217:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010421a:	0f ce                	bswap  %esi
8010421c:	89 77 fc             	mov    %esi,-0x4(%edi)
8010421f:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
80104223:	c6 47 f4 64          	movb   $0x64,-0xc(%edi)
80104227:	66 c1 c0 08          	rol    $0x8,%ax
8010422b:	66 89 47 ee          	mov    %ax,-0x12(%edi)
8010422f:	89 c8                	mov    %ecx,%eax
80104231:	e8 3a fd ff ff       	call   80103f70 <in_cksum.constprop.2>
80104236:	83 c4 10             	add    $0x10,%esp
80104239:	66 89 47 f6          	mov    %ax,-0xa(%edi)
8010423d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104240:	89 d8                	mov    %ebx,%eax
80104242:	ba 00 08 00 00       	mov    $0x800,%edx
80104247:	5b                   	pop    %ebx
80104248:	5e                   	pop    %esi
80104249:	5f                   	pop    %edi
8010424a:	5d                   	pop    %ebp
8010424b:	e9 a0 fc ff ff       	jmp    80103ef0 <net_tx_eth>
80104250:	83 ec 0c             	sub    $0xc,%esp
80104253:	68 70 97 10 80       	push   $0x80109770
80104258:	e8 13 c7 ff ff       	call   80100970 <panic>
8010425d:	8d 76 00             	lea    0x0(%esi),%esi

80104260 <net_rx>:
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	57                   	push   %edi
80104264:	56                   	push   %esi
80104265:	53                   	push   %ebx
80104266:	83 ec 2c             	sub    $0x2c,%esp
80104269:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010426c:	8b 43 08             	mov    0x8(%ebx),%eax
8010426f:	83 f8 0d             	cmp    $0xd,%eax
80104272:	76 5c                	jbe    801042d0 <net_rx+0x70>
80104274:	8b 53 04             	mov    0x4(%ebx),%edx
80104277:	83 e8 0e             	sub    $0xe,%eax
8010427a:	89 43 08             	mov    %eax,0x8(%ebx)
8010427d:	8d 42 0e             	lea    0xe(%edx),%eax
80104280:	85 d2                	test   %edx,%edx
80104282:	89 43 04             	mov    %eax,0x4(%ebx)
80104285:	74 49                	je     801042d0 <net_rx+0x70>
80104287:	0f b7 72 0c          	movzwl 0xc(%edx),%esi
8010428b:	83 ec 08             	sub    $0x8,%esp
8010428e:	66 c1 c6 08          	rol    $0x8,%si
80104292:	0f b7 c6             	movzwl %si,%eax
80104295:	50                   	push   %eax
80104296:	68 91 97 10 80       	push   $0x80109791
8010429b:	e8 a0 c9 ff ff       	call   80100c40 <cprintf>
801042a0:	83 c4 10             	add    $0x10,%esp
801042a3:	66 81 fe 00 08       	cmp    $0x800,%si
801042a8:	0f 84 72 01 00 00    	je     80104420 <net_rx+0x1c0>
801042ae:	66 81 fe 06 08       	cmp    $0x806,%si
801042b3:	74 3b                	je     801042f0 <net_rx+0x90>
801042b5:	83 ec 0c             	sub    $0xc,%esp
801042b8:	53                   	push   %ebx
801042b9:	e8 12 ed ff ff       	call   80102fd0 <kfree>
801042be:	83 c4 10             	add    $0x10,%esp
801042c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042c4:	5b                   	pop    %ebx
801042c5:	5e                   	pop    %esi
801042c6:	5f                   	pop    %edi
801042c7:	5d                   	pop    %ebp
801042c8:	c3                   	ret    
801042c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042d0:	83 ec 0c             	sub    $0xc,%esp
801042d3:	68 81 97 10 80       	push   $0x80109781
801042d8:	e8 63 c9 ff ff       	call   80100c40 <cprintf>
801042dd:	89 1c 24             	mov    %ebx,(%esp)
801042e0:	e8 eb ec ff ff       	call   80102fd0 <kfree>
801042e5:	83 c4 10             	add    $0x10,%esp
801042e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042eb:	5b                   	pop    %ebx
801042ec:	5e                   	pop    %esi
801042ed:	5f                   	pop    %edi
801042ee:	5d                   	pop    %ebp
801042ef:	c3                   	ret    
801042f0:	8b 43 08             	mov    0x8(%ebx),%eax
801042f3:	83 f8 1b             	cmp    $0x1b,%eax
801042f6:	76 bd                	jbe    801042b5 <net_rx+0x55>
801042f8:	8b 73 04             	mov    0x4(%ebx),%esi
801042fb:	83 e8 1c             	sub    $0x1c,%eax
801042fe:	89 43 08             	mov    %eax,0x8(%ebx)
80104301:	8d 46 1c             	lea    0x1c(%esi),%eax
80104304:	85 f6                	test   %esi,%esi
80104306:	89 43 04             	mov    %eax,0x4(%ebx)
80104309:	74 aa                	je     801042b5 <net_rx+0x55>
8010430b:	83 ec 0c             	sub    $0xc,%esp
8010430e:	68 e9 97 10 80       	push   $0x801097e9
80104313:	e8 28 c9 ff ff       	call   80100c40 <cprintf>
80104318:	83 c4 10             	add    $0x10,%esp
8010431b:	66 81 3e 00 01       	cmpw   $0x100,(%esi)
80104320:	75 93                	jne    801042b5 <net_rx+0x55>
80104322:	66 83 7e 02 08       	cmpw   $0x8,0x2(%esi)
80104327:	75 8c                	jne    801042b5 <net_rx+0x55>
80104329:	80 7e 04 06          	cmpb   $0x6,0x4(%esi)
8010432d:	75 86                	jne    801042b5 <net_rx+0x55>
8010432f:	80 7e 05 04          	cmpb   $0x4,0x5(%esi)
80104333:	75 80                	jne    801042b5 <net_rx+0x55>
80104335:	83 ec 0c             	sub    $0xc,%esp
80104338:	68 ef 97 10 80       	push   $0x801097ef
8010433d:	e8 fe c8 ff ff       	call   80100c40 <cprintf>
80104342:	83 c4 10             	add    $0x10,%esp
80104345:	66 81 7e 06 00 01    	cmpw   $0x100,0x6(%esi)
8010434b:	8b 46 18             	mov    0x18(%esi),%eax
8010434e:	0f c8                	bswap  %eax
80104350:	0f 85 5f ff ff ff    	jne    801042b5 <net_rx+0x55>
80104356:	3d 0f 02 00 0a       	cmp    $0xa00020f,%eax
8010435b:	0f 85 54 ff ff ff    	jne    801042b5 <net_rx+0x55>
80104361:	83 ec 0c             	sub    $0xc,%esp
80104364:	8d 7d e2             	lea    -0x1e(%ebp),%edi
80104367:	68 f5 97 10 80       	push   $0x801097f5
8010436c:	e8 cf c8 ff ff       	call   80100c40 <cprintf>
80104371:	8d 46 08             	lea    0x8(%esi),%eax
80104374:	83 c4 0c             	add    $0xc,%esp
80104377:	6a 06                	push   $0x6
80104379:	50                   	push   %eax
8010437a:	57                   	push   %edi
8010437b:	e8 00 1b 00 00       	call   80105e80 <memmove>
80104380:	8b 46 0e             	mov    0xe(%esi),%eax
80104383:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
8010438a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
8010438d:	e8 ee fc ff ff       	call   80104080 <mbufalloc>
80104392:	83 c4 10             	add    $0x10,%esp
80104395:	85 c0                	test   %eax,%eax
80104397:	89 c1                	mov    %eax,%ecx
80104399:	74 68                	je     80104403 <net_rx+0x1a3>
8010439b:	8b 40 08             	mov    0x8(%eax),%eax
8010439e:	8b 71 04             	mov    0x4(%ecx),%esi
801043a1:	01 c6                	add    %eax,%esi
801043a3:	83 c0 1c             	add    $0x1c,%eax
801043a6:	3d 00 08 00 00       	cmp    $0x800,%eax
801043ab:	89 41 08             	mov    %eax,0x8(%ecx)
801043ae:	0f 87 95 01 00 00    	ja     80104549 <net_rx+0x2e9>
801043b4:	8d 46 08             	lea    0x8(%esi),%eax
801043b7:	c7 06 00 01 08 00    	movl   $0x80100,(%esi)
801043bd:	c7 46 04 06 04 00 02 	movl   $0x2000406,0x4(%esi)
801043c4:	52                   	push   %edx
801043c5:	6a 06                	push   $0x6
801043c7:	68 08 d0 10 80       	push   $0x8010d008
801043cc:	50                   	push   %eax
801043cd:	89 4d d0             	mov    %ecx,-0x30(%ebp)
801043d0:	e8 ab 1a 00 00       	call   80105e80 <memmove>
801043d5:	8d 46 12             	lea    0x12(%esi),%eax
801043d8:	83 c4 0c             	add    $0xc,%esp
801043db:	c7 46 0e 0a 00 02 0f 	movl   $0xf02000a,0xe(%esi)
801043e2:	6a 06                	push   $0x6
801043e4:	57                   	push   %edi
801043e5:	50                   	push   %eax
801043e6:	e8 95 1a 00 00       	call   80105e80 <memmove>
801043eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801043ee:	8b 4d d0             	mov    -0x30(%ebp),%ecx
801043f1:	ba 06 08 00 00       	mov    $0x806,%edx
801043f6:	89 46 18             	mov    %eax,0x18(%esi)
801043f9:	89 c8                	mov    %ecx,%eax
801043fb:	e8 f0 fa ff ff       	call   80103ef0 <net_tx_eth>
80104400:	83 c4 10             	add    $0x10,%esp
80104403:	50                   	push   %eax
80104404:	50                   	push   %eax
80104405:	53                   	push   %ebx
80104406:	68 0b 98 10 80       	push   $0x8010980b
8010440b:	e8 30 c8 ff ff       	call   80100c40 <cprintf>
80104410:	83 c4 10             	add    $0x10,%esp
80104413:	e9 9d fe ff ff       	jmp    801042b5 <net_rx+0x55>
80104418:	90                   	nop
80104419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104420:	83 ec 0c             	sub    $0xc,%esp
80104423:	68 9c 97 10 80       	push   $0x8010979c
80104428:	e8 13 c8 ff ff       	call   80100c40 <cprintf>
8010442d:	8b 43 08             	mov    0x8(%ebx),%eax
80104430:	83 c4 10             	add    $0x10,%esp
80104433:	83 f8 13             	cmp    $0x13,%eax
80104436:	0f 86 79 fe ff ff    	jbe    801042b5 <net_rx+0x55>
8010443c:	8b 73 04             	mov    0x4(%ebx),%esi
8010443f:	83 e8 14             	sub    $0x14,%eax
80104442:	89 43 08             	mov    %eax,0x8(%ebx)
80104445:	8d 46 14             	lea    0x14(%esi),%eax
80104448:	85 f6                	test   %esi,%esi
8010444a:	89 43 04             	mov    %eax,0x4(%ebx)
8010444d:	0f 84 62 fe ff ff    	je     801042b5 <net_rx+0x55>
80104453:	0f b7 46 02          	movzwl 0x2(%esi),%eax
80104457:	83 ec 08             	sub    $0x8,%esp
8010445a:	50                   	push   %eax
8010445b:	68 ac 97 10 80       	push   $0x801097ac
80104460:	e8 db c7 ff ff       	call   80100c40 <cprintf>
80104465:	83 c4 10             	add    $0x10,%esp
80104468:	80 3e 45             	cmpb   $0x45,(%esi)
8010446b:	0f 85 44 fe ff ff    	jne    801042b5 <net_rx+0x55>
80104471:	89 f0                	mov    %esi,%eax
80104473:	e8 f8 fa ff ff       	call   80103f70 <in_cksum.constprop.2>
80104478:	66 85 c0             	test   %ax,%ax
8010447b:	0f 85 34 fe ff ff    	jne    801042b5 <net_rx+0x55>
80104481:	66 83 7e 06 00       	cmpw   $0x0,0x6(%esi)
80104486:	0f 85 29 fe ff ff    	jne    801042b5 <net_rx+0x55>
8010448c:	81 7e 10 0a 00 02 0f 	cmpl   $0xf02000a,0x10(%esi)
80104493:	0f 85 1c fe ff ff    	jne    801042b5 <net_rx+0x55>
80104499:	80 7e 09 11          	cmpb   $0x11,0x9(%esi)
8010449d:	0f 85 12 fe ff ff    	jne    801042b5 <net_rx+0x55>
801044a3:	0f b7 7e 02          	movzwl 0x2(%esi),%edi
801044a7:	51                   	push   %ecx
801044a8:	51                   	push   %ecx
801044a9:	66 c1 c7 08          	rol    $0x8,%di
801044ad:	8d 47 ec             	lea    -0x14(%edi),%eax
801044b0:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
801044b4:	0f b7 c0             	movzwl %ax,%eax
801044b7:	50                   	push   %eax
801044b8:	68 bf 97 10 80       	push   $0x801097bf
801044bd:	e8 7e c7 ff ff       	call   80100c40 <cprintf>
801044c2:	8b 53 08             	mov    0x8(%ebx),%edx
801044c5:	83 c4 10             	add    $0x10,%esp
801044c8:	8b 43 04             	mov    0x4(%ebx),%eax
801044cb:	83 fa 07             	cmp    $0x7,%edx
801044ce:	0f 86 e1 fd ff ff    	jbe    801042b5 <net_rx+0x55>
801044d4:	8d 48 08             	lea    0x8(%eax),%ecx
801044d7:	83 ea 08             	sub    $0x8,%edx
801044da:	85 c0                	test   %eax,%eax
801044dc:	89 53 08             	mov    %edx,0x8(%ebx)
801044df:	89 4b 04             	mov    %ecx,0x4(%ebx)
801044e2:	0f 84 cd fd ff ff    	je     801042b5 <net_rx+0x55>
801044e8:	0f b7 48 04          	movzwl 0x4(%eax),%ecx
801044ec:	66 c1 c1 08          	rol    $0x8,%cx
801044f0:	66 39 4d d4          	cmp    %cx,-0x2c(%ebp)
801044f4:	0f 85 bb fd ff ff    	jne    801042b5 <net_rx+0x55>
801044fa:	8d 4f e4             	lea    -0x1c(%edi),%ecx
801044fd:	0f b7 c9             	movzwl %cx,%ecx
80104500:	39 ca                	cmp    %ecx,%edx
80104502:	0f 82 ad fd ff ff    	jb     801042b5 <net_rx+0x55>
80104508:	89 4b 08             	mov    %ecx,0x8(%ebx)
8010450b:	8b 56 0c             	mov    0xc(%esi),%edx
8010450e:	83 ec 0c             	sub    $0xc,%esp
80104511:	0f b7 30             	movzwl (%eax),%esi
80104514:	0f b7 78 02          	movzwl 0x2(%eax),%edi
80104518:	68 d7 97 10 80       	push   $0x801097d7
8010451d:	0f ca                	bswap  %edx
8010451f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104522:	e8 19 c7 ff ff       	call   80100c40 <cprintf>
80104527:	8b 55 d4             	mov    -0x2c(%ebp),%edx
8010452a:	66 c1 c6 08          	rol    $0x8,%si
8010452e:	66 c1 c7 08          	rol    $0x8,%di
80104532:	0f b7 f6             	movzwl %si,%esi
80104535:	0f b7 ff             	movzwl %di,%edi
80104538:	56                   	push   %esi
80104539:	57                   	push   %edi
8010453a:	52                   	push   %edx
8010453b:	53                   	push   %ebx
8010453c:	e8 4f 2e 00 00       	call   80107390 <sockrecvudp>
80104541:	83 c4 20             	add    $0x20,%esp
80104544:	e9 9f fd ff ff       	jmp    801042e8 <net_rx+0x88>
80104549:	83 ec 0c             	sub    $0xc,%esp
8010454c:	68 79 97 10 80       	push   $0x80109779
80104551:	e8 1a c4 ff ff       	call   80100970 <panic>
80104556:	66 90                	xchg   %ax,%ax
80104558:	66 90                	xchg   %ax,%ax
8010455a:	66 90                	xchg   %ax,%ax
8010455c:	66 90                	xchg   %ax,%ax
8010455e:	66 90                	xchg   %ax,%ax

80104560 <pci_attach_match>:
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	57                   	push   %edi
80104564:	56                   	push   %esi
80104565:	53                   	push   %ebx
80104566:	83 ec 0c             	sub    $0xc,%esp
80104569:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010456c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010456f:	8b 75 0c             	mov    0xc(%ebp),%esi
80104572:	8b 43 08             	mov    0x8(%ebx),%eax
80104575:	85 c0                	test   %eax,%eax
80104577:	75 11                	jne    8010458a <pci_attach_match+0x2a>
80104579:	eb 4d                	jmp    801045c8 <pci_attach_match+0x68>
8010457b:	90                   	nop
8010457c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104580:	83 c3 0c             	add    $0xc,%ebx
80104583:	8b 43 08             	mov    0x8(%ebx),%eax
80104586:	85 c0                	test   %eax,%eax
80104588:	74 3e                	je     801045c8 <pci_attach_match+0x68>
8010458a:	39 3b                	cmp    %edi,(%ebx)
8010458c:	75 f2                	jne    80104580 <pci_attach_match+0x20>
8010458e:	39 73 04             	cmp    %esi,0x4(%ebx)
80104591:	75 ed                	jne    80104580 <pci_attach_match+0x20>
80104593:	83 ec 0c             	sub    $0xc,%esp
80104596:	ff 75 14             	pushl  0x14(%ebp)
80104599:	ff d0                	call   *%eax
8010459b:	83 c4 10             	add    $0x10,%esp
8010459e:	83 f8 00             	cmp    $0x0,%eax
801045a1:	7f 27                	jg     801045ca <pci_attach_match+0x6a>
801045a3:	74 db                	je     80104580 <pci_attach_match+0x20>
801045a5:	83 ec 0c             	sub    $0xc,%esp
801045a8:	83 c3 0c             	add    $0xc,%ebx
801045ab:	50                   	push   %eax
801045ac:	ff 73 fc             	pushl  -0x4(%ebx)
801045af:	56                   	push   %esi
801045b0:	57                   	push   %edi
801045b1:	68 24 98 10 80       	push   $0x80109824
801045b6:	e8 85 c6 ff ff       	call   80100c40 <cprintf>
801045bb:	8b 43 08             	mov    0x8(%ebx),%eax
801045be:	83 c4 20             	add    $0x20,%esp
801045c1:	85 c0                	test   %eax,%eax
801045c3:	75 c5                	jne    8010458a <pci_attach_match+0x2a>
801045c5:	8d 76 00             	lea    0x0(%esi),%esi
801045c8:	31 c0                	xor    %eax,%eax
801045ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
801045cd:	5b                   	pop    %ebx
801045ce:	5e                   	pop    %esi
801045cf:	5f                   	pop    %edi
801045d0:	5d                   	pop    %ebp
801045d1:	c3                   	ret    
801045d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045e0 <pci_conf1_set_addr>:
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	53                   	push   %ebx
801045e4:	83 ec 04             	sub    $0x4,%esp
801045e7:	3d ff 00 00 00       	cmp    $0xff,%eax
801045ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045ef:	77 32                	ja     80104623 <pci_conf1_set_addr+0x43>
801045f1:	83 fa 1f             	cmp    $0x1f,%edx
801045f4:	77 2d                	ja     80104623 <pci_conf1_set_addr+0x43>
801045f6:	83 f9 07             	cmp    $0x7,%ecx
801045f9:	77 28                	ja     80104623 <pci_conf1_set_addr+0x43>
801045fb:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
80104601:	77 20                	ja     80104623 <pci_conf1_set_addr+0x43>
80104603:	c1 e1 08             	shl    $0x8,%ecx
80104606:	81 cb 00 00 00 80    	or     $0x80000000,%ebx
8010460c:	c1 e2 0b             	shl    $0xb,%edx
8010460f:	09 d9                	or     %ebx,%ecx
80104611:	c1 e0 10             	shl    $0x10,%eax
80104614:	09 d1                	or     %edx,%ecx
80104616:	ba f8 0c 00 00       	mov    $0xcf8,%edx
8010461b:	09 c8                	or     %ecx,%eax
8010461d:	ef                   	out    %eax,(%dx)
8010461e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104621:	c9                   	leave  
80104622:	c3                   	ret    
80104623:	83 ec 0c             	sub    $0xc,%esp
80104626:	68 89 99 10 80       	push   $0x80109989
8010462b:	e8 40 c3 ff ff       	call   80100970 <panic>

80104630 <pci_attach>:
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	53                   	push   %ebx
80104634:	83 ec 04             	sub    $0x4,%esp
80104637:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010463a:	8b 43 10             	mov    0x10(%ebx),%eax
8010463d:	53                   	push   %ebx
8010463e:	68 28 d0 10 80       	push   $0x8010d028
80104643:	89 c2                	mov    %eax,%edx
80104645:	c1 e8 18             	shr    $0x18,%eax
80104648:	c1 ea 10             	shr    $0x10,%edx
8010464b:	0f b6 d2             	movzbl %dl,%edx
8010464e:	52                   	push   %edx
8010464f:	50                   	push   %eax
80104650:	e8 0b ff ff ff       	call   80104560 <pci_attach_match>
80104655:	83 c4 10             	add    $0x10,%esp
80104658:	85 c0                	test   %eax,%eax
8010465a:	ba 01 00 00 00       	mov    $0x1,%edx
8010465f:	75 22                	jne    80104683 <pci_attach+0x53>
80104661:	8b 43 0c             	mov    0xc(%ebx),%eax
80104664:	53                   	push   %ebx
80104665:	68 10 d0 10 80       	push   $0x8010d010
8010466a:	89 c2                	mov    %eax,%edx
8010466c:	0f b7 c0             	movzwl %ax,%eax
8010466f:	c1 ea 10             	shr    $0x10,%edx
80104672:	52                   	push   %edx
80104673:	50                   	push   %eax
80104674:	e8 e7 fe ff ff       	call   80104560 <pci_attach_match>
80104679:	31 d2                	xor    %edx,%edx
8010467b:	83 c4 10             	add    $0x10,%esp
8010467e:	85 c0                	test   %eax,%eax
80104680:	0f 95 c2             	setne  %dl
80104683:	89 d0                	mov    %edx,%eax
80104685:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104688:	c9                   	leave  
80104689:	c3                   	ret    
8010468a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104690 <pci_scan_bus>:
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	57                   	push   %edi
80104694:	56                   	push   %esi
80104695:	53                   	push   %ebx
80104696:	89 c3                	mov    %eax,%ebx
80104698:	8d 85 10 ff ff ff    	lea    -0xf0(%ebp),%eax
8010469e:	81 ec 00 01 00 00    	sub    $0x100,%esp
801046a4:	6a 48                	push   $0x48
801046a6:	6a 00                	push   $0x0
801046a8:	50                   	push   %eax
801046a9:	e8 22 17 00 00       	call   80105dd0 <memset>
801046ae:	89 9d 10 ff ff ff    	mov    %ebx,-0xf0(%ebp)
801046b4:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
801046bb:	00 00 00 
801046be:	83 c4 10             	add    $0x10,%esp
801046c1:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%ebp)
801046c8:	00 00 00 
801046cb:	31 d2                	xor    %edx,%edx
801046cd:	eb 1f                	jmp    801046ee <pci_scan_bus+0x5e>
801046cf:	90                   	nop
801046d0:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
801046d6:	8d 50 01             	lea    0x1(%eax),%edx
801046d9:	83 fa 1f             	cmp    $0x1f,%edx
801046dc:	89 95 14 ff ff ff    	mov    %edx,-0xec(%ebp)
801046e2:	0f 87 98 01 00 00    	ja     80104880 <pci_scan_bus+0x1f0>
801046e8:	8b 9d 10 ff ff ff    	mov    -0xf0(%ebp),%ebx
801046ee:	8b 43 04             	mov    0x4(%ebx),%eax
801046f1:	83 ec 0c             	sub    $0xc,%esp
801046f4:	8b 8d 18 ff ff ff    	mov    -0xe8(%ebp),%ecx
801046fa:	6a 0c                	push   $0xc
801046fc:	e8 df fe ff ff       	call   801045e0 <pci_conf1_set_addr>
80104701:	ba fc 0c 00 00       	mov    $0xcfc,%edx
80104706:	ed                   	in     (%dx),%eax
80104707:	89 c2                	mov    %eax,%edx
80104709:	83 c4 10             	add    $0x10,%esp
8010470c:	c1 ea 10             	shr    $0x10,%edx
8010470f:	83 e2 7f             	and    $0x7f,%edx
80104712:	83 fa 01             	cmp    $0x1,%edx
80104715:	77 b9                	ja     801046d0 <pci_scan_bus+0x40>
80104717:	b9 12 00 00 00       	mov    $0x12,%ecx
8010471c:	8d bd 58 ff ff ff    	lea    -0xa8(%ebp),%edi
80104722:	8d b5 10 ff ff ff    	lea    -0xf0(%ebp),%esi
80104728:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
8010472a:	8b b5 10 ff ff ff    	mov    -0xf0(%ebp),%esi
80104730:	25 00 00 80 00       	and    $0x800000,%eax
80104735:	83 85 f8 fe ff ff 01 	addl   $0x1,-0x108(%ebp)
8010473c:	83 f8 01             	cmp    $0x1,%eax
8010473f:	19 c0                	sbb    %eax,%eax
80104741:	31 db                	xor    %ebx,%ebx
80104743:	89 b5 fc fe ff ff    	mov    %esi,-0x104(%ebp)
80104749:	83 e0 f9             	and    $0xfffffff9,%eax
8010474c:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
80104752:	83 c0 08             	add    $0x8,%eax
80104755:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
8010475b:	89 b5 00 ff ff ff    	mov    %esi,-0x100(%ebp)
80104761:	e9 00 01 00 00       	jmp    80104866 <pci_scan_bus+0x1d6>
80104766:	8d 76 00             	lea    0x0(%esi),%esi
80104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104770:	8b 85 fc fe ff ff    	mov    -0x104(%ebp),%eax
80104776:	8b 95 00 ff ff ff    	mov    -0x100(%ebp),%edx
8010477c:	8d 7d a0             	lea    -0x60(%ebp),%edi
8010477f:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
80104785:	8d b5 58 ff ff ff    	lea    -0xa8(%ebp),%esi
8010478b:	b9 12 00 00 00       	mov    $0x12,%ecx
80104790:	83 ec 0c             	sub    $0xc,%esp
80104793:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
80104799:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
8010479f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
801047a1:	89 d9                	mov    %ebx,%ecx
801047a3:	8b 40 04             	mov    0x4(%eax),%eax
801047a6:	6a 00                	push   $0x0
801047a8:	e8 33 fe ff ff       	call   801045e0 <pci_conf1_set_addr>
801047ad:	ba fc 0c 00 00       	mov    $0xcfc,%edx
801047b2:	ed                   	in     (%dx),%eax
801047b3:	89 45 ac             	mov    %eax,-0x54(%ebp)
801047b6:	0f b7 c0             	movzwl %ax,%eax
801047b9:	83 c4 10             	add    $0x10,%esp
801047bc:	3d ff ff 00 00       	cmp    $0xffff,%eax
801047c1:	0f 84 9c 00 00 00    	je     80104863 <pci_scan_bus+0x1d3>
801047c7:	8b 45 a0             	mov    -0x60(%ebp),%eax
801047ca:	83 ec 0c             	sub    $0xc,%esp
801047cd:	8b 55 a4             	mov    -0x5c(%ebp),%edx
801047d0:	8b 4d a8             	mov    -0x58(%ebp),%ecx
801047d3:	8b 40 04             	mov    0x4(%eax),%eax
801047d6:	6a 3c                	push   $0x3c
801047d8:	e8 03 fe ff ff       	call   801045e0 <pci_conf1_set_addr>
801047dd:	ba fc 0c 00 00       	mov    $0xcfc,%edx
801047e2:	ed                   	in     (%dx),%eax
801047e3:	88 45 e4             	mov    %al,-0x1c(%ebp)
801047e6:	8b 45 a0             	mov    -0x60(%ebp),%eax
801047e9:	8b 55 a4             	mov    -0x5c(%ebp),%edx
801047ec:	8b 4d a8             	mov    -0x58(%ebp),%ecx
801047ef:	8b 40 04             	mov    0x4(%eax),%eax
801047f2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801047f9:	e8 e2 fd ff ff       	call   801045e0 <pci_conf1_set_addr>
801047fe:	ba fc 0c 00 00       	mov    $0xcfc,%edx
80104803:	ed                   	in     (%dx),%eax
80104804:	89 c1                	mov    %eax,%ecx
80104806:	83 c4 10             	add    $0x10,%esp
80104809:	89 45 b0             	mov    %eax,-0x50(%ebp)
8010480c:	c1 e9 18             	shr    $0x18,%ecx
8010480f:	be 9e 99 10 80       	mov    $0x8010999e,%esi
80104814:	83 f9 06             	cmp    $0x6,%ecx
80104817:	77 07                	ja     80104820 <pci_scan_bus+0x190>
80104819:	8b 34 8d 48 9a 10 80 	mov    -0x7fef65b8(,%ecx,4),%esi
80104820:	0f b6 7d e4          	movzbl -0x1c(%ebp),%edi
80104824:	8b 55 ac             	mov    -0x54(%ebp),%edx
80104827:	c1 e8 10             	shr    $0x10,%eax
8010482a:	83 ec 08             	sub    $0x8,%esp
8010482d:	0f b6 c0             	movzbl %al,%eax
80104830:	57                   	push   %edi
80104831:	56                   	push   %esi
80104832:	50                   	push   %eax
80104833:	89 d0                	mov    %edx,%eax
80104835:	51                   	push   %ecx
80104836:	c1 e8 10             	shr    $0x10,%eax
80104839:	0f b7 d2             	movzwl %dx,%edx
8010483c:	50                   	push   %eax
8010483d:	8b 45 a0             	mov    -0x60(%ebp),%eax
80104840:	52                   	push   %edx
80104841:	ff 75 a8             	pushl  -0x58(%ebp)
80104844:	ff 75 a4             	pushl  -0x5c(%ebp)
80104847:	ff 70 04             	pushl  0x4(%eax)
8010484a:	68 50 98 10 80       	push   $0x80109850
8010484f:	e8 ec c3 ff ff       	call   80100c40 <cprintf>
80104854:	8d 45 a0             	lea    -0x60(%ebp),%eax
80104857:	83 c4 24             	add    $0x24,%esp
8010485a:	50                   	push   %eax
8010485b:	e8 d0 fd ff ff       	call   80104630 <pci_attach>
80104860:	83 c4 10             	add    $0x10,%esp
80104863:	83 c3 01             	add    $0x1,%ebx
80104866:	3b 9d 04 ff ff ff    	cmp    -0xfc(%ebp),%ebx
8010486c:	0f 85 fe fe ff ff    	jne    80104770 <pci_scan_bus+0xe0>
80104872:	e9 59 fe ff ff       	jmp    801046d0 <pci_scan_bus+0x40>
80104877:	89 f6                	mov    %esi,%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104880:	8b 85 f8 fe ff ff    	mov    -0x108(%ebp),%eax
80104886:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104889:	5b                   	pop    %ebx
8010488a:	5e                   	pop    %esi
8010488b:	5f                   	pop    %edi
8010488c:	5d                   	pop    %ebp
8010488d:	c3                   	ret    
8010488e:	66 90                	xchg   %ax,%ax

80104890 <pci_bridge_attach>:
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	57                   	push   %edi
80104894:	56                   	push   %esi
80104895:	53                   	push   %ebx
80104896:	be fc 0c 00 00       	mov    $0xcfc,%esi
8010489b:	83 ec 28             	sub    $0x28,%esp
8010489e:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048a1:	8b 03                	mov    (%ebx),%eax
801048a3:	8b 53 04             	mov    0x4(%ebx),%edx
801048a6:	8b 4b 08             	mov    0x8(%ebx),%ecx
801048a9:	8b 40 04             	mov    0x4(%eax),%eax
801048ac:	6a 1c                	push   $0x1c
801048ae:	e8 2d fd ff ff       	call   801045e0 <pci_conf1_set_addr>
801048b3:	89 f2                	mov    %esi,%edx
801048b5:	ed                   	in     (%dx),%eax
801048b6:	89 c7                	mov    %eax,%edi
801048b8:	8b 03                	mov    (%ebx),%eax
801048ba:	8b 53 04             	mov    0x4(%ebx),%edx
801048bd:	8b 4b 08             	mov    0x8(%ebx),%ecx
801048c0:	8b 40 04             	mov    0x4(%eax),%eax
801048c3:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
801048ca:	e8 11 fd ff ff       	call   801045e0 <pci_conf1_set_addr>
801048cf:	89 f2                	mov    %esi,%edx
801048d1:	ed                   	in     (%dx),%eax
801048d2:	89 c6                	mov    %eax,%esi
801048d4:	89 f8                	mov    %edi,%eax
801048d6:	83 c4 10             	add    $0x10,%esp
801048d9:	83 e0 0f             	and    $0xf,%eax
801048dc:	83 f8 01             	cmp    $0x1,%eax
801048df:	74 57                	je     80104938 <pci_bridge_attach+0xa8>
801048e1:	8d 7d e0             	lea    -0x20(%ebp),%edi
801048e4:	83 ec 04             	sub    $0x4,%esp
801048e7:	6a 08                	push   $0x8
801048e9:	6a 00                	push   $0x0
801048eb:	57                   	push   %edi
801048ec:	e8 df 14 00 00       	call   80105dd0 <memset>
801048f1:	89 f0                	mov    %esi,%eax
801048f3:	89 5d e0             	mov    %ebx,-0x20(%ebp)
801048f6:	0f b6 d4             	movzbl %ah,%edx
801048f9:	c1 e8 10             	shr    $0x10,%eax
801048fc:	0f b6 c0             	movzbl %al,%eax
801048ff:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80104902:	59                   	pop    %ecx
80104903:	5e                   	pop    %esi
80104904:	50                   	push   %eax
80104905:	52                   	push   %edx
80104906:	ff 73 08             	pushl  0x8(%ebx)
80104909:	ff 73 04             	pushl  0x4(%ebx)
8010490c:	8b 03                	mov    (%ebx),%eax
8010490e:	ff 70 04             	pushl  0x4(%eax)
80104911:	68 b8 98 10 80       	push   $0x801098b8
80104916:	e8 25 c3 ff ff       	call   80100c40 <cprintf>
8010491b:	83 c4 20             	add    $0x20,%esp
8010491e:	89 f8                	mov    %edi,%eax
80104920:	e8 6b fd ff ff       	call   80104690 <pci_scan_bus>
80104925:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104928:	b8 01 00 00 00       	mov    $0x1,%eax
8010492d:	5b                   	pop    %ebx
8010492e:	5e                   	pop    %esi
8010492f:	5f                   	pop    %edi
80104930:	5d                   	pop    %ebp
80104931:	c3                   	ret    
80104932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104938:	ff 73 08             	pushl  0x8(%ebx)
8010493b:	ff 73 04             	pushl  0x4(%ebx)
8010493e:	8b 03                	mov    (%ebx),%eax
80104940:	ff 70 04             	pushl  0x4(%eax)
80104943:	68 84 98 10 80       	push   $0x80109884
80104948:	e8 f3 c2 ff ff       	call   80100c40 <cprintf>
8010494d:	83 c4 10             	add    $0x10,%esp
80104950:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104953:	31 c0                	xor    %eax,%eax
80104955:	5b                   	pop    %ebx
80104956:	5e                   	pop    %esi
80104957:	5f                   	pop    %edi
80104958:	5d                   	pop    %ebp
80104959:	c3                   	ret    
8010495a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104960 <pci_func_enable>:
80104960:	55                   	push   %ebp
80104961:	89 e5                	mov    %esp,%ebp
80104963:	57                   	push   %edi
80104964:	56                   	push   %esi
80104965:	53                   	push   %ebx
80104966:	83 ec 28             	sub    $0x28,%esp
80104969:	8b 7d 08             	mov    0x8(%ebp),%edi
8010496c:	8b 07                	mov    (%edi),%eax
8010496e:	8b 57 04             	mov    0x4(%edi),%edx
80104971:	8b 4f 08             	mov    0x8(%edi),%ecx
80104974:	8b 40 04             	mov    0x4(%eax),%eax
80104977:	6a 04                	push   $0x4
80104979:	e8 62 fc ff ff       	call   801045e0 <pci_conf1_set_addr>
8010497e:	b8 07 00 00 00       	mov    $0x7,%eax
80104983:	ba fc 0c 00 00       	mov    $0xcfc,%edx
80104988:	ef                   	out    %eax,(%dx)
80104989:	be 10 00 00 00       	mov    $0x10,%esi
8010498e:	83 c4 10             	add    $0x10,%esp
80104991:	e9 a4 00 00 00       	jmp    80104a3a <pci_func_enable+0xda>
80104996:	8d 76 00             	lea    0x0(%esi),%esi
80104999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801049a0:	83 e2 06             	and    $0x6,%edx
801049a3:	31 db                	xor    %ebx,%ebx
801049a5:	83 fa 04             	cmp    $0x4,%edx
801049a8:	89 c2                	mov    %eax,%edx
801049aa:	0f 94 c3             	sete   %bl
801049ad:	83 e2 f0             	and    $0xfffffff0,%edx
801049b0:	f7 da                	neg    %edx
801049b2:	8d 1c 9d 04 00 00 00 	lea    0x4(,%ebx,4),%ebx
801049b9:	21 c2                	and    %eax,%edx
801049bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801049be:	89 55 dc             	mov    %edx,-0x24(%ebp)
801049c1:	83 e0 f0             	and    $0xfffffff0,%eax
801049c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
801049c7:	8b 07                	mov    (%edi),%eax
801049c9:	8b 57 04             	mov    0x4(%edi),%edx
801049cc:	83 ec 0c             	sub    $0xc,%esp
801049cf:	8b 4f 08             	mov    0x8(%edi),%ecx
801049d2:	8b 40 04             	mov    0x4(%eax),%eax
801049d5:	56                   	push   %esi
801049d6:	e8 05 fc ff ff       	call   801045e0 <pci_conf1_set_addr>
801049db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801049de:	ba fc 0c 00 00       	mov    $0xcfc,%edx
801049e3:	ef                   	out    %eax,(%dx)
801049e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
801049e7:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801049ea:	83 c4 10             	add    $0x10,%esp
801049ed:	8b 55 d8             	mov    -0x28(%ebp),%edx
801049f0:	8d 04 87             	lea    (%edi,%eax,4),%eax
801049f3:	85 c9                	test   %ecx,%ecx
801049f5:	89 50 14             	mov    %edx,0x14(%eax)
801049f8:	89 48 2c             	mov    %ecx,0x2c(%eax)
801049fb:	74 32                	je     80104a2f <pci_func_enable+0xcf>
801049fd:	85 d2                	test   %edx,%edx
801049ff:	75 2e                	jne    80104a2f <pci_func_enable+0xcf>
80104a01:	8b 47 0c             	mov    0xc(%edi),%eax
80104a04:	83 ec 0c             	sub    $0xc,%esp
80104a07:	51                   	push   %ecx
80104a08:	6a 00                	push   $0x0
80104a0a:	ff 75 e0             	pushl  -0x20(%ebp)
80104a0d:	89 c2                	mov    %eax,%edx
80104a0f:	0f b7 c0             	movzwl %ax,%eax
80104a12:	c1 ea 10             	shr    $0x10,%edx
80104a15:	52                   	push   %edx
80104a16:	50                   	push   %eax
80104a17:	ff 77 08             	pushl  0x8(%edi)
80104a1a:	ff 77 04             	pushl  0x4(%edi)
80104a1d:	8b 07                	mov    (%edi),%eax
80104a1f:	ff 70 04             	pushl  0x4(%eax)
80104a22:	68 e4 98 10 80       	push   $0x801098e4
80104a27:	e8 14 c2 ff ff       	call   80100c40 <cprintf>
80104a2c:	83 c4 30             	add    $0x30,%esp
80104a2f:	01 de                	add    %ebx,%esi
80104a31:	83 fe 27             	cmp    $0x27,%esi
80104a34:	0f 87 8e 00 00 00    	ja     80104ac8 <pci_func_enable+0x168>
80104a3a:	8b 07                	mov    (%edi),%eax
80104a3c:	8b 57 04             	mov    0x4(%edi),%edx
80104a3f:	83 ec 0c             	sub    $0xc,%esp
80104a42:	8b 4f 08             	mov    0x8(%edi),%ecx
80104a45:	8b 40 04             	mov    0x4(%eax),%eax
80104a48:	56                   	push   %esi
80104a49:	e8 92 fb ff ff       	call   801045e0 <pci_conf1_set_addr>
80104a4e:	ba fc 0c 00 00       	mov    $0xcfc,%edx
80104a53:	ed                   	in     (%dx),%eax
80104a54:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80104a57:	8b 07                	mov    (%edi),%eax
80104a59:	8b 57 04             	mov    0x4(%edi),%edx
80104a5c:	8b 4f 08             	mov    0x8(%edi),%ecx
80104a5f:	8b 40 04             	mov    0x4(%eax),%eax
80104a62:	89 34 24             	mov    %esi,(%esp)
80104a65:	e8 76 fb ff ff       	call   801045e0 <pci_conf1_set_addr>
80104a6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a6f:	ba fc 0c 00 00       	mov    $0xcfc,%edx
80104a74:	ef                   	out    %eax,(%dx)
80104a75:	8b 07                	mov    (%edi),%eax
80104a77:	8b 57 04             	mov    0x4(%edi),%edx
80104a7a:	8b 4f 08             	mov    0x8(%edi),%ecx
80104a7d:	8b 40 04             	mov    0x4(%eax),%eax
80104a80:	89 34 24             	mov    %esi,(%esp)
80104a83:	e8 58 fb ff ff       	call   801045e0 <pci_conf1_set_addr>
80104a88:	ba fc 0c 00 00       	mov    $0xcfc,%edx
80104a8d:	ed                   	in     (%dx),%eax
80104a8e:	83 c4 10             	add    $0x10,%esp
80104a91:	85 c0                	test   %eax,%eax
80104a93:	bb 04 00 00 00       	mov    $0x4,%ebx
80104a98:	74 95                	je     80104a2f <pci_func_enable+0xcf>
80104a9a:	8d 56 f0             	lea    -0x10(%esi),%edx
80104a9d:	c1 ea 02             	shr    $0x2,%edx
80104aa0:	a8 01                	test   $0x1,%al
80104aa2:	89 55 e0             	mov    %edx,-0x20(%ebp)
80104aa5:	89 c2                	mov    %eax,%edx
80104aa7:	0f 84 f3 fe ff ff    	je     801049a0 <pci_func_enable+0x40>
80104aad:	83 e2 fc             	and    $0xfffffffc,%edx
80104ab0:	f7 da                	neg    %edx
80104ab2:	21 c2                	and    %eax,%edx
80104ab4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104ab7:	89 55 dc             	mov    %edx,-0x24(%ebp)
80104aba:	83 e0 fc             	and    $0xfffffffc,%eax
80104abd:	89 45 d8             	mov    %eax,-0x28(%ebp)
80104ac0:	e9 02 ff ff ff       	jmp    801049c7 <pci_func_enable+0x67>
80104ac5:	8d 76 00             	lea    0x0(%esi),%esi
80104ac8:	8b 47 0c             	mov    0xc(%edi),%eax
80104acb:	83 ec 08             	sub    $0x8,%esp
80104ace:	89 c2                	mov    %eax,%edx
80104ad0:	0f b7 c0             	movzwl %ax,%eax
80104ad3:	c1 ea 10             	shr    $0x10,%edx
80104ad6:	52                   	push   %edx
80104ad7:	50                   	push   %eax
80104ad8:	ff 77 08             	pushl  0x8(%edi)
80104adb:	ff 77 04             	pushl  0x4(%edi)
80104ade:	8b 07                	mov    (%edi),%eax
80104ae0:	ff 70 04             	pushl  0x4(%eax)
80104ae3:	68 38 99 10 80       	push   $0x80109938
80104ae8:	e8 53 c1 ff ff       	call   80100c40 <cprintf>
80104aed:	83 c4 20             	add    $0x20,%esp
80104af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104af3:	5b                   	pop    %ebx
80104af4:	5e                   	pop    %esi
80104af5:	5f                   	pop    %edi
80104af6:	5d                   	pop    %ebp
80104af7:	c3                   	ret    
80104af8:	90                   	nop
80104af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104b00 <pci_e1000_attach>:
80104b00:	55                   	push   %ebp
80104b01:	89 e5                	mov    %esp,%ebp
80104b03:	53                   	push   %ebx
80104b04:	83 ec 10             	sub    $0x10,%esp
80104b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b0a:	53                   	push   %ebx
80104b0b:	e8 50 fe ff ff       	call   80104960 <pci_func_enable>
80104b10:	8b 43 14             	mov    0x14(%ebx),%eax
80104b13:	5a                   	pop    %edx
80104b14:	59                   	pop    %ecx
80104b15:	50                   	push   %eax
80104b16:	68 a6 99 10 80       	push   $0x801099a6
80104b1b:	a3 54 98 15 80       	mov    %eax,0x80159854
80104b20:	e8 1b c1 ff ff       	call   80100c40 <cprintf>
80104b25:	58                   	pop    %eax
80104b26:	5a                   	pop    %edx
80104b27:	ff 73 14             	pushl  0x14(%ebx)
80104b2a:	68 c3 99 10 80       	push   $0x801099c3
80104b2f:	e8 0c c1 ff ff       	call   80100c40 <cprintf>
80104b34:	a1 54 98 15 80       	mov    0x80159854,%eax
80104b39:	59                   	pop    %ecx
80104b3a:	5b                   	pop    %ebx
80104b3b:	8b 40 08             	mov    0x8(%eax),%eax
80104b3e:	50                   	push   %eax
80104b3f:	68 60 99 10 80       	push   $0x80109960
80104b44:	e8 f7 c0 ff ff       	call   80100c40 <cprintf>
80104b49:	e8 f2 c7 ff ff       	call   80101340 <e1000_tx_init>
80104b4e:	e8 bd c8 ff ff       	call   80101410 <e1000_rx_init>
80104b53:	e8 e8 cd ff ff       	call   80101940 <e1000_init>
80104b58:	b8 01 00 00 00       	mov    $0x1,%eax
80104b5d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b60:	c9                   	leave  
80104b61:	c3                   	ret    
80104b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b70 <pci_init>:
80104b70:	55                   	push   %ebp
80104b71:	89 e5                	mov    %esp,%ebp
80104b73:	83 ec 0c             	sub    $0xc,%esp
80104b76:	6a 08                	push   $0x8
80104b78:	6a 00                	push   $0x0
80104b7a:	68 d8 3d 15 80       	push   $0x80153dd8
80104b7f:	e8 4c 12 00 00       	call   80105dd0 <memset>
80104b84:	83 c4 10             	add    $0x10,%esp
80104b87:	c9                   	leave  
80104b88:	b8 d8 3d 15 80       	mov    $0x80153dd8,%eax
80104b8d:	e9 fe fa ff ff       	jmp    80104690 <pci_scan_bus>
80104b92:	66 90                	xchg   %ax,%ax
80104b94:	66 90                	xchg   %ax,%ax
80104b96:	66 90                	xchg   %ax,%ax
80104b98:	66 90                	xchg   %ax,%ax
80104b9a:	66 90                	xchg   %ax,%ax
80104b9c:	66 90                	xchg   %ax,%ax
80104b9e:	66 90                	xchg   %ax,%ax

80104ba0 <picinit>:
80104ba0:	55                   	push   %ebp
80104ba1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ba6:	ba 21 00 00 00       	mov    $0x21,%edx
80104bab:	89 e5                	mov    %esp,%ebp
80104bad:	ee                   	out    %al,(%dx)
80104bae:	ba a1 00 00 00       	mov    $0xa1,%edx
80104bb3:	ee                   	out    %al,(%dx)
80104bb4:	5d                   	pop    %ebp
80104bb5:	c3                   	ret    
80104bb6:	66 90                	xchg   %ax,%ax
80104bb8:	66 90                	xchg   %ax,%ax
80104bba:	66 90                	xchg   %ax,%ax
80104bbc:	66 90                	xchg   %ax,%ax
80104bbe:	66 90                	xchg   %ax,%ax

80104bc0 <pipealloc>:
80104bc0:	55                   	push   %ebp
80104bc1:	89 e5                	mov    %esp,%ebp
80104bc3:	57                   	push   %edi
80104bc4:	56                   	push   %esi
80104bc5:	53                   	push   %ebx
80104bc6:	83 ec 0c             	sub    $0xc,%esp
80104bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104bcc:	8b 75 0c             	mov    0xc(%ebp),%esi
80104bcf:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80104bd5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104bdb:	e8 d0 cd ff ff       	call   801019b0 <filealloc>
80104be0:	85 c0                	test   %eax,%eax
80104be2:	89 03                	mov    %eax,(%ebx)
80104be4:	74 22                	je     80104c08 <pipealloc+0x48>
80104be6:	e8 c5 cd ff ff       	call   801019b0 <filealloc>
80104beb:	85 c0                	test   %eax,%eax
80104bed:	89 06                	mov    %eax,(%esi)
80104bef:	74 3f                	je     80104c30 <pipealloc+0x70>
80104bf1:	e8 8a e5 ff ff       	call   80103180 <kalloc>
80104bf6:	85 c0                	test   %eax,%eax
80104bf8:	89 c7                	mov    %eax,%edi
80104bfa:	75 54                	jne    80104c50 <pipealloc+0x90>
80104bfc:	8b 03                	mov    (%ebx),%eax
80104bfe:	85 c0                	test   %eax,%eax
80104c00:	75 34                	jne    80104c36 <pipealloc+0x76>
80104c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c08:	8b 06                	mov    (%esi),%eax
80104c0a:	85 c0                	test   %eax,%eax
80104c0c:	74 0c                	je     80104c1a <pipealloc+0x5a>
80104c0e:	83 ec 0c             	sub    $0xc,%esp
80104c11:	50                   	push   %eax
80104c12:	e8 59 ce ff ff       	call   80101a70 <fileclose>
80104c17:	83 c4 10             	add    $0x10,%esp
80104c1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c22:	5b                   	pop    %ebx
80104c23:	5e                   	pop    %esi
80104c24:	5f                   	pop    %edi
80104c25:	5d                   	pop    %ebp
80104c26:	c3                   	ret    
80104c27:	89 f6                	mov    %esi,%esi
80104c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c30:	8b 03                	mov    (%ebx),%eax
80104c32:	85 c0                	test   %eax,%eax
80104c34:	74 e4                	je     80104c1a <pipealloc+0x5a>
80104c36:	83 ec 0c             	sub    $0xc,%esp
80104c39:	50                   	push   %eax
80104c3a:	e8 31 ce ff ff       	call   80101a70 <fileclose>
80104c3f:	8b 06                	mov    (%esi),%eax
80104c41:	83 c4 10             	add    $0x10,%esp
80104c44:	85 c0                	test   %eax,%eax
80104c46:	75 c6                	jne    80104c0e <pipealloc+0x4e>
80104c48:	eb d0                	jmp    80104c1a <pipealloc+0x5a>
80104c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c50:	83 ec 08             	sub    $0x8,%esp
80104c53:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80104c5a:	00 00 00 
80104c5d:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80104c64:	00 00 00 
80104c67:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80104c6e:	00 00 00 
80104c71:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80104c78:	00 00 00 
80104c7b:	68 64 9a 10 80       	push   $0x80109a64
80104c80:	50                   	push   %eax
80104c81:	e8 da 0e 00 00       	call   80105b60 <initlock>
80104c86:	8b 03                	mov    (%ebx),%eax
80104c88:	83 c4 10             	add    $0x10,%esp
80104c8b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80104c91:	8b 03                	mov    (%ebx),%eax
80104c93:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80104c97:	8b 03                	mov    (%ebx),%eax
80104c99:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80104c9d:	8b 03                	mov    (%ebx),%eax
80104c9f:	89 78 10             	mov    %edi,0x10(%eax)
80104ca2:	8b 06                	mov    (%esi),%eax
80104ca4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80104caa:	8b 06                	mov    (%esi),%eax
80104cac:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80104cb0:	8b 06                	mov    (%esi),%eax
80104cb2:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80104cb6:	8b 06                	mov    (%esi),%eax
80104cb8:	89 78 10             	mov    %edi,0x10(%eax)
80104cbb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104cbe:	31 c0                	xor    %eax,%eax
80104cc0:	5b                   	pop    %ebx
80104cc1:	5e                   	pop    %esi
80104cc2:	5f                   	pop    %edi
80104cc3:	5d                   	pop    %ebp
80104cc4:	c3                   	ret    
80104cc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cd0 <pipeclose>:
80104cd0:	55                   	push   %ebp
80104cd1:	89 e5                	mov    %esp,%ebp
80104cd3:	56                   	push   %esi
80104cd4:	53                   	push   %ebx
80104cd5:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104cd8:	8b 75 0c             	mov    0xc(%ebp),%esi
80104cdb:	83 ec 0c             	sub    $0xc,%esp
80104cde:	53                   	push   %ebx
80104cdf:	e8 6c 0f 00 00       	call   80105c50 <acquire>
80104ce4:	83 c4 10             	add    $0x10,%esp
80104ce7:	85 f6                	test   %esi,%esi
80104ce9:	74 45                	je     80104d30 <pipeclose+0x60>
80104ceb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80104cf1:	83 ec 0c             	sub    $0xc,%esp
80104cf4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80104cfb:	00 00 00 
80104cfe:	50                   	push   %eax
80104cff:	e8 ac 0b 00 00       	call   801058b0 <wakeup>
80104d04:	83 c4 10             	add    $0x10,%esp
80104d07:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80104d0d:	85 d2                	test   %edx,%edx
80104d0f:	75 0a                	jne    80104d1b <pipeclose+0x4b>
80104d11:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80104d17:	85 c0                	test   %eax,%eax
80104d19:	74 35                	je     80104d50 <pipeclose+0x80>
80104d1b:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104d1e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d21:	5b                   	pop    %ebx
80104d22:	5e                   	pop    %esi
80104d23:	5d                   	pop    %ebp
80104d24:	e9 47 10 00 00       	jmp    80105d70 <release>
80104d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d30:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80104d36:	83 ec 0c             	sub    $0xc,%esp
80104d39:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80104d40:	00 00 00 
80104d43:	50                   	push   %eax
80104d44:	e8 67 0b 00 00       	call   801058b0 <wakeup>
80104d49:	83 c4 10             	add    $0x10,%esp
80104d4c:	eb b9                	jmp    80104d07 <pipeclose+0x37>
80104d4e:	66 90                	xchg   %ax,%ax
80104d50:	83 ec 0c             	sub    $0xc,%esp
80104d53:	53                   	push   %ebx
80104d54:	e8 17 10 00 00       	call   80105d70 <release>
80104d59:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104d5c:	83 c4 10             	add    $0x10,%esp
80104d5f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d62:	5b                   	pop    %ebx
80104d63:	5e                   	pop    %esi
80104d64:	5d                   	pop    %ebp
80104d65:	e9 66 e2 ff ff       	jmp    80102fd0 <kfree>
80104d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104d70 <pipewrite>:
80104d70:	55                   	push   %ebp
80104d71:	89 e5                	mov    %esp,%ebp
80104d73:	57                   	push   %edi
80104d74:	56                   	push   %esi
80104d75:	53                   	push   %ebx
80104d76:	83 ec 28             	sub    $0x28,%esp
80104d79:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104d7c:	53                   	push   %ebx
80104d7d:	e8 ce 0e 00 00       	call   80105c50 <acquire>
80104d82:	8b 45 10             	mov    0x10(%ebp),%eax
80104d85:	83 c4 10             	add    $0x10,%esp
80104d88:	85 c0                	test   %eax,%eax
80104d8a:	0f 8e c9 00 00 00    	jle    80104e59 <pipewrite+0xe9>
80104d90:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104d93:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80104d99:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
80104d9f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80104da2:	03 4d 10             	add    0x10(%ebp),%ecx
80104da5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80104da8:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
80104dae:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80104db4:	39 d0                	cmp    %edx,%eax
80104db6:	75 71                	jne    80104e29 <pipewrite+0xb9>
80104db8:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80104dbe:	85 c0                	test   %eax,%eax
80104dc0:	74 4e                	je     80104e10 <pipewrite+0xa0>
80104dc2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80104dc8:	eb 3a                	jmp    80104e04 <pipewrite+0x94>
80104dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104dd0:	83 ec 0c             	sub    $0xc,%esp
80104dd3:	57                   	push   %edi
80104dd4:	e8 d7 0a 00 00       	call   801058b0 <wakeup>
80104dd9:	5a                   	pop    %edx
80104dda:	59                   	pop    %ecx
80104ddb:	53                   	push   %ebx
80104ddc:	56                   	push   %esi
80104ddd:	e8 1e 09 00 00       	call   80105700 <sleep>
80104de2:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80104de8:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80104dee:	83 c4 10             	add    $0x10,%esp
80104df1:	05 00 02 00 00       	add    $0x200,%eax
80104df6:	39 c2                	cmp    %eax,%edx
80104df8:	75 36                	jne    80104e30 <pipewrite+0xc0>
80104dfa:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80104e00:	85 c0                	test   %eax,%eax
80104e02:	74 0c                	je     80104e10 <pipewrite+0xa0>
80104e04:	e8 57 03 00 00       	call   80105160 <myproc>
80104e09:	8b 40 24             	mov    0x24(%eax),%eax
80104e0c:	85 c0                	test   %eax,%eax
80104e0e:	74 c0                	je     80104dd0 <pipewrite+0x60>
80104e10:	83 ec 0c             	sub    $0xc,%esp
80104e13:	53                   	push   %ebx
80104e14:	e8 57 0f 00 00       	call   80105d70 <release>
80104e19:	83 c4 10             	add    $0x10,%esp
80104e1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e24:	5b                   	pop    %ebx
80104e25:	5e                   	pop    %esi
80104e26:	5f                   	pop    %edi
80104e27:	5d                   	pop    %ebp
80104e28:	c3                   	ret    
80104e29:	89 c2                	mov    %eax,%edx
80104e2b:	90                   	nop
80104e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104e30:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80104e33:	8d 42 01             	lea    0x1(%edx),%eax
80104e36:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80104e3c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80104e42:	83 c6 01             	add    $0x1,%esi
80104e45:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
80104e49:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80104e4c:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80104e4f:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
80104e53:	0f 85 4f ff ff ff    	jne    80104da8 <pipewrite+0x38>
80104e59:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80104e5f:	83 ec 0c             	sub    $0xc,%esp
80104e62:	50                   	push   %eax
80104e63:	e8 48 0a 00 00       	call   801058b0 <wakeup>
80104e68:	89 1c 24             	mov    %ebx,(%esp)
80104e6b:	e8 00 0f 00 00       	call   80105d70 <release>
80104e70:	83 c4 10             	add    $0x10,%esp
80104e73:	8b 45 10             	mov    0x10(%ebp),%eax
80104e76:	eb a9                	jmp    80104e21 <pipewrite+0xb1>
80104e78:	90                   	nop
80104e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104e80 <piperead>:
80104e80:	55                   	push   %ebp
80104e81:	89 e5                	mov    %esp,%ebp
80104e83:	57                   	push   %edi
80104e84:	56                   	push   %esi
80104e85:	53                   	push   %ebx
80104e86:	83 ec 18             	sub    $0x18,%esp
80104e89:	8b 75 08             	mov    0x8(%ebp),%esi
80104e8c:	8b 7d 0c             	mov    0xc(%ebp),%edi
80104e8f:	56                   	push   %esi
80104e90:	e8 bb 0d 00 00       	call   80105c50 <acquire>
80104e95:	83 c4 10             	add    $0x10,%esp
80104e98:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80104e9e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80104ea4:	75 6a                	jne    80104f10 <piperead+0x90>
80104ea6:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
80104eac:	85 db                	test   %ebx,%ebx
80104eae:	0f 84 c4 00 00 00    	je     80104f78 <piperead+0xf8>
80104eb4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
80104eba:	eb 2d                	jmp    80104ee9 <piperead+0x69>
80104ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ec0:	83 ec 08             	sub    $0x8,%esp
80104ec3:	56                   	push   %esi
80104ec4:	53                   	push   %ebx
80104ec5:	e8 36 08 00 00       	call   80105700 <sleep>
80104eca:	83 c4 10             	add    $0x10,%esp
80104ecd:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80104ed3:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80104ed9:	75 35                	jne    80104f10 <piperead+0x90>
80104edb:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80104ee1:	85 d2                	test   %edx,%edx
80104ee3:	0f 84 8f 00 00 00    	je     80104f78 <piperead+0xf8>
80104ee9:	e8 72 02 00 00       	call   80105160 <myproc>
80104eee:	8b 48 24             	mov    0x24(%eax),%ecx
80104ef1:	85 c9                	test   %ecx,%ecx
80104ef3:	74 cb                	je     80104ec0 <piperead+0x40>
80104ef5:	83 ec 0c             	sub    $0xc,%esp
80104ef8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104efd:	56                   	push   %esi
80104efe:	e8 6d 0e 00 00       	call   80105d70 <release>
80104f03:	83 c4 10             	add    $0x10,%esp
80104f06:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f09:	89 d8                	mov    %ebx,%eax
80104f0b:	5b                   	pop    %ebx
80104f0c:	5e                   	pop    %esi
80104f0d:	5f                   	pop    %edi
80104f0e:	5d                   	pop    %ebp
80104f0f:	c3                   	ret    
80104f10:	8b 45 10             	mov    0x10(%ebp),%eax
80104f13:	85 c0                	test   %eax,%eax
80104f15:	7e 61                	jle    80104f78 <piperead+0xf8>
80104f17:	31 db                	xor    %ebx,%ebx
80104f19:	eb 13                	jmp    80104f2e <piperead+0xae>
80104f1b:	90                   	nop
80104f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104f20:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80104f26:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80104f2c:	74 1f                	je     80104f4d <piperead+0xcd>
80104f2e:	8d 41 01             	lea    0x1(%ecx),%eax
80104f31:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80104f37:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
80104f3d:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80104f42:	88 04 1f             	mov    %al,(%edi,%ebx,1)
80104f45:	83 c3 01             	add    $0x1,%ebx
80104f48:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80104f4b:	75 d3                	jne    80104f20 <piperead+0xa0>
80104f4d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80104f53:	83 ec 0c             	sub    $0xc,%esp
80104f56:	50                   	push   %eax
80104f57:	e8 54 09 00 00       	call   801058b0 <wakeup>
80104f5c:	89 34 24             	mov    %esi,(%esp)
80104f5f:	e8 0c 0e 00 00       	call   80105d70 <release>
80104f64:	83 c4 10             	add    $0x10,%esp
80104f67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f6a:	89 d8                	mov    %ebx,%eax
80104f6c:	5b                   	pop    %ebx
80104f6d:	5e                   	pop    %esi
80104f6e:	5f                   	pop    %edi
80104f6f:	5d                   	pop    %ebp
80104f70:	c3                   	ret    
80104f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104f78:	31 db                	xor    %ebx,%ebx
80104f7a:	eb d1                	jmp    80104f4d <piperead+0xcd>
80104f7c:	66 90                	xchg   %ax,%ax
80104f7e:	66 90                	xchg   %ax,%ax

80104f80 <allocproc>:
80104f80:	55                   	push   %ebp
80104f81:	89 e5                	mov    %esp,%ebp
80104f83:	53                   	push   %ebx
80104f84:	bb 14 c9 15 80       	mov    $0x8015c914,%ebx
80104f89:	83 ec 10             	sub    $0x10,%esp
80104f8c:	68 e0 c8 15 80       	push   $0x8015c8e0
80104f91:	e8 ba 0c 00 00       	call   80105c50 <acquire>
80104f96:	83 c4 10             	add    $0x10,%esp
80104f99:	eb 10                	jmp    80104fab <allocproc+0x2b>
80104f9b:	90                   	nop
80104f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104fa0:	83 c3 7c             	add    $0x7c,%ebx
80104fa3:	81 fb 14 e8 15 80    	cmp    $0x8015e814,%ebx
80104fa9:	73 75                	jae    80105020 <allocproc+0xa0>
80104fab:	8b 43 0c             	mov    0xc(%ebx),%eax
80104fae:	85 c0                	test   %eax,%eax
80104fb0:	75 ee                	jne    80104fa0 <allocproc+0x20>
80104fb2:	a1 44 d0 10 80       	mov    0x8010d044,%eax
80104fb7:	83 ec 0c             	sub    $0xc,%esp
80104fba:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80104fc1:	8d 50 01             	lea    0x1(%eax),%edx
80104fc4:	89 43 10             	mov    %eax,0x10(%ebx)
80104fc7:	68 e0 c8 15 80       	push   $0x8015c8e0
80104fcc:	89 15 44 d0 10 80    	mov    %edx,0x8010d044
80104fd2:	e8 99 0d 00 00       	call   80105d70 <release>
80104fd7:	e8 a4 e1 ff ff       	call   80103180 <kalloc>
80104fdc:	83 c4 10             	add    $0x10,%esp
80104fdf:	85 c0                	test   %eax,%eax
80104fe1:	89 43 08             	mov    %eax,0x8(%ebx)
80104fe4:	74 53                	je     80105039 <allocproc+0xb9>
80104fe6:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
80104fec:	83 ec 04             	sub    $0x4,%esp
80104fef:	05 9c 0f 00 00       	add    $0xf9c,%eax
80104ff4:	89 53 18             	mov    %edx,0x18(%ebx)
80104ff7:	c7 40 14 42 76 10 80 	movl   $0x80107642,0x14(%eax)
80104ffe:	89 43 1c             	mov    %eax,0x1c(%ebx)
80105001:	6a 14                	push   $0x14
80105003:	6a 00                	push   $0x0
80105005:	50                   	push   %eax
80105006:	e8 c5 0d 00 00       	call   80105dd0 <memset>
8010500b:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010500e:	83 c4 10             	add    $0x10,%esp
80105011:	c7 40 10 50 50 10 80 	movl   $0x80105050,0x10(%eax)
80105018:	89 d8                	mov    %ebx,%eax
8010501a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010501d:	c9                   	leave  
8010501e:	c3                   	ret    
8010501f:	90                   	nop
80105020:	83 ec 0c             	sub    $0xc,%esp
80105023:	31 db                	xor    %ebx,%ebx
80105025:	68 e0 c8 15 80       	push   $0x8015c8e0
8010502a:	e8 41 0d 00 00       	call   80105d70 <release>
8010502f:	89 d8                	mov    %ebx,%eax
80105031:	83 c4 10             	add    $0x10,%esp
80105034:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105037:	c9                   	leave  
80105038:	c3                   	ret    
80105039:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80105040:	31 db                	xor    %ebx,%ebx
80105042:	eb d4                	jmp    80105018 <allocproc+0x98>
80105044:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010504a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105050 <forkret>:
80105050:	55                   	push   %ebp
80105051:	89 e5                	mov    %esp,%ebp
80105053:	83 ec 14             	sub    $0x14,%esp
80105056:	68 e0 c8 15 80       	push   $0x8015c8e0
8010505b:	e8 10 0d 00 00       	call   80105d70 <release>
80105060:	a1 40 d0 10 80       	mov    0x8010d040,%eax
80105065:	83 c4 10             	add    $0x10,%esp
80105068:	85 c0                	test   %eax,%eax
8010506a:	75 04                	jne    80105070 <forkret+0x20>
8010506c:	c9                   	leave  
8010506d:	c3                   	ret    
8010506e:	66 90                	xchg   %ax,%ax
80105070:	83 ec 0c             	sub    $0xc,%esp
80105073:	c7 05 40 d0 10 80 00 	movl   $0x0,0x8010d040
8010507a:	00 00 00 
8010507d:	6a 01                	push   $0x1
8010507f:	e8 bc d0 ff ff       	call   80102140 <iinit>
80105084:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010508b:	e8 30 e7 ff ff       	call   801037c0 <initlog>
80105090:	83 c4 10             	add    $0x10,%esp
80105093:	c9                   	leave  
80105094:	c3                   	ret    
80105095:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050a0 <pinit>:
801050a0:	55                   	push   %ebp
801050a1:	89 e5                	mov    %esp,%ebp
801050a3:	83 ec 10             	sub    $0x10,%esp
801050a6:	68 69 9a 10 80       	push   $0x80109a69
801050ab:	68 e0 c8 15 80       	push   $0x8015c8e0
801050b0:	e8 ab 0a 00 00       	call   80105b60 <initlock>
801050b5:	83 c4 10             	add    $0x10,%esp
801050b8:	c9                   	leave  
801050b9:	c3                   	ret    
801050ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801050c0 <mycpu>:
801050c0:	55                   	push   %ebp
801050c1:	89 e5                	mov    %esp,%ebp
801050c3:	56                   	push   %esi
801050c4:	53                   	push   %ebx
801050c5:	9c                   	pushf  
801050c6:	58                   	pop    %eax
801050c7:	f6 c4 02             	test   $0x2,%ah
801050ca:	75 5e                	jne    8010512a <mycpu+0x6a>
801050cc:	e8 1f e3 ff ff       	call   801033f0 <lapicid>
801050d1:	8b 35 c0 c8 15 80    	mov    0x8015c8c0,%esi
801050d7:	85 f6                	test   %esi,%esi
801050d9:	7e 42                	jle    8010511d <mycpu+0x5d>
801050db:	0f b6 15 40 c3 15 80 	movzbl 0x8015c340,%edx
801050e2:	39 d0                	cmp    %edx,%eax
801050e4:	74 30                	je     80105116 <mycpu+0x56>
801050e6:	b9 f0 c3 15 80       	mov    $0x8015c3f0,%ecx
801050eb:	31 d2                	xor    %edx,%edx
801050ed:	8d 76 00             	lea    0x0(%esi),%esi
801050f0:	83 c2 01             	add    $0x1,%edx
801050f3:	39 f2                	cmp    %esi,%edx
801050f5:	74 26                	je     8010511d <mycpu+0x5d>
801050f7:	0f b6 19             	movzbl (%ecx),%ebx
801050fa:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80105100:	39 c3                	cmp    %eax,%ebx
80105102:	75 ec                	jne    801050f0 <mycpu+0x30>
80105104:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010510a:	05 40 c3 15 80       	add    $0x8015c340,%eax
8010510f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105112:	5b                   	pop    %ebx
80105113:	5e                   	pop    %esi
80105114:	5d                   	pop    %ebp
80105115:	c3                   	ret    
80105116:	b8 40 c3 15 80       	mov    $0x8015c340,%eax
8010511b:	eb f2                	jmp    8010510f <mycpu+0x4f>
8010511d:	83 ec 0c             	sub    $0xc,%esp
80105120:	68 70 9a 10 80       	push   $0x80109a70
80105125:	e8 46 b8 ff ff       	call   80100970 <panic>
8010512a:	83 ec 0c             	sub    $0xc,%esp
8010512d:	68 4c 9b 10 80       	push   $0x80109b4c
80105132:	e8 39 b8 ff ff       	call   80100970 <panic>
80105137:	89 f6                	mov    %esi,%esi
80105139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105140 <cpuid>:
80105140:	55                   	push   %ebp
80105141:	89 e5                	mov    %esp,%ebp
80105143:	83 ec 08             	sub    $0x8,%esp
80105146:	e8 75 ff ff ff       	call   801050c0 <mycpu>
8010514b:	2d 40 c3 15 80       	sub    $0x8015c340,%eax
80105150:	c9                   	leave  
80105151:	c1 f8 04             	sar    $0x4,%eax
80105154:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
8010515a:	c3                   	ret    
8010515b:	90                   	nop
8010515c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105160 <myproc>:
80105160:	55                   	push   %ebp
80105161:	89 e5                	mov    %esp,%ebp
80105163:	53                   	push   %ebx
80105164:	83 ec 04             	sub    $0x4,%esp
80105167:	e8 a4 0a 00 00       	call   80105c10 <pushcli>
8010516c:	e8 4f ff ff ff       	call   801050c0 <mycpu>
80105171:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80105177:	e8 94 0b 00 00       	call   80105d10 <popcli>
8010517c:	83 c4 04             	add    $0x4,%esp
8010517f:	89 d8                	mov    %ebx,%eax
80105181:	5b                   	pop    %ebx
80105182:	5d                   	pop    %ebp
80105183:	c3                   	ret    
80105184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010518a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105190 <userinit>:
80105190:	55                   	push   %ebp
80105191:	89 e5                	mov    %esp,%ebp
80105193:	53                   	push   %ebx
80105194:	83 ec 04             	sub    $0x4,%esp
80105197:	e8 e4 fd ff ff       	call   80104f80 <allocproc>
8010519c:	89 c3                	mov    %eax,%ebx
8010519e:	a3 e0 3d 15 80       	mov    %eax,0x80153de0
801051a3:	e8 08 3b 00 00       	call   80108cb0 <setupkvm>
801051a8:	85 c0                	test   %eax,%eax
801051aa:	89 43 04             	mov    %eax,0x4(%ebx)
801051ad:	0f 84 bd 00 00 00    	je     80105270 <userinit+0xe0>
801051b3:	83 ec 04             	sub    $0x4,%esp
801051b6:	68 2c 00 00 00       	push   $0x2c
801051bb:	68 a0 d4 10 80       	push   $0x8010d4a0
801051c0:	50                   	push   %eax
801051c1:	e8 ca 37 00 00       	call   80108990 <inituvm>
801051c6:	83 c4 0c             	add    $0xc,%esp
801051c9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
801051cf:	6a 4c                	push   $0x4c
801051d1:	6a 00                	push   $0x0
801051d3:	ff 73 18             	pushl  0x18(%ebx)
801051d6:	e8 f5 0b 00 00       	call   80105dd0 <memset>
801051db:	8b 43 18             	mov    0x18(%ebx),%eax
801051de:	ba 1b 00 00 00       	mov    $0x1b,%edx
801051e3:	b9 23 00 00 00       	mov    $0x23,%ecx
801051e8:	83 c4 0c             	add    $0xc,%esp
801051eb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
801051ef:	8b 43 18             	mov    0x18(%ebx),%eax
801051f2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
801051f6:	8b 43 18             	mov    0x18(%ebx),%eax
801051f9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801051fd:	66 89 50 28          	mov    %dx,0x28(%eax)
80105201:	8b 43 18             	mov    0x18(%ebx),%eax
80105204:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80105208:	66 89 50 48          	mov    %dx,0x48(%eax)
8010520c:	8b 43 18             	mov    0x18(%ebx),%eax
8010520f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80105216:	8b 43 18             	mov    0x18(%ebx),%eax
80105219:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80105220:	8b 43 18             	mov    0x18(%ebx),%eax
80105223:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010522a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010522d:	6a 10                	push   $0x10
8010522f:	68 99 9a 10 80       	push   $0x80109a99
80105234:	50                   	push   %eax
80105235:	e8 76 0d 00 00       	call   80105fb0 <safestrcpy>
8010523a:	c7 04 24 a2 9a 10 80 	movl   $0x80109aa2,(%esp)
80105241:	e8 5a d9 ff ff       	call   80102ba0 <namei>
80105246:	89 43 68             	mov    %eax,0x68(%ebx)
80105249:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
80105250:	e8 fb 09 00 00       	call   80105c50 <acquire>
80105255:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
8010525c:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
80105263:	e8 08 0b 00 00       	call   80105d70 <release>
80105268:	83 c4 10             	add    $0x10,%esp
8010526b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010526e:	c9                   	leave  
8010526f:	c3                   	ret    
80105270:	83 ec 0c             	sub    $0xc,%esp
80105273:	68 80 9a 10 80       	push   $0x80109a80
80105278:	e8 f3 b6 ff ff       	call   80100970 <panic>
8010527d:	8d 76 00             	lea    0x0(%esi),%esi

80105280 <growproc>:
80105280:	55                   	push   %ebp
80105281:	89 e5                	mov    %esp,%ebp
80105283:	56                   	push   %esi
80105284:	53                   	push   %ebx
80105285:	8b 75 08             	mov    0x8(%ebp),%esi
80105288:	e8 83 09 00 00       	call   80105c10 <pushcli>
8010528d:	e8 2e fe ff ff       	call   801050c0 <mycpu>
80105292:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80105298:	e8 73 0a 00 00       	call   80105d10 <popcli>
8010529d:	83 fe 00             	cmp    $0x0,%esi
801052a0:	8b 03                	mov    (%ebx),%eax
801052a2:	7f 1c                	jg     801052c0 <growproc+0x40>
801052a4:	75 3a                	jne    801052e0 <growproc+0x60>
801052a6:	83 ec 0c             	sub    $0xc,%esp
801052a9:	89 03                	mov    %eax,(%ebx)
801052ab:	53                   	push   %ebx
801052ac:	e8 cf 35 00 00       	call   80108880 <switchuvm>
801052b1:	83 c4 10             	add    $0x10,%esp
801052b4:	31 c0                	xor    %eax,%eax
801052b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801052b9:	5b                   	pop    %ebx
801052ba:	5e                   	pop    %esi
801052bb:	5d                   	pop    %ebp
801052bc:	c3                   	ret    
801052bd:	8d 76 00             	lea    0x0(%esi),%esi
801052c0:	83 ec 04             	sub    $0x4,%esp
801052c3:	01 c6                	add    %eax,%esi
801052c5:	56                   	push   %esi
801052c6:	50                   	push   %eax
801052c7:	ff 73 04             	pushl  0x4(%ebx)
801052ca:	e8 01 38 00 00       	call   80108ad0 <allocuvm>
801052cf:	83 c4 10             	add    $0x10,%esp
801052d2:	85 c0                	test   %eax,%eax
801052d4:	75 d0                	jne    801052a6 <growproc+0x26>
801052d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052db:	eb d9                	jmp    801052b6 <growproc+0x36>
801052dd:	8d 76 00             	lea    0x0(%esi),%esi
801052e0:	83 ec 04             	sub    $0x4,%esp
801052e3:	01 c6                	add    %eax,%esi
801052e5:	56                   	push   %esi
801052e6:	50                   	push   %eax
801052e7:	ff 73 04             	pushl  0x4(%ebx)
801052ea:	e8 11 39 00 00       	call   80108c00 <deallocuvm>
801052ef:	83 c4 10             	add    $0x10,%esp
801052f2:	85 c0                	test   %eax,%eax
801052f4:	75 b0                	jne    801052a6 <growproc+0x26>
801052f6:	eb de                	jmp    801052d6 <growproc+0x56>
801052f8:	90                   	nop
801052f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105300 <fork>:
80105300:	55                   	push   %ebp
80105301:	89 e5                	mov    %esp,%ebp
80105303:	57                   	push   %edi
80105304:	56                   	push   %esi
80105305:	53                   	push   %ebx
80105306:	83 ec 1c             	sub    $0x1c,%esp
80105309:	e8 02 09 00 00       	call   80105c10 <pushcli>
8010530e:	e8 ad fd ff ff       	call   801050c0 <mycpu>
80105313:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80105319:	e8 f2 09 00 00       	call   80105d10 <popcli>
8010531e:	e8 5d fc ff ff       	call   80104f80 <allocproc>
80105323:	85 c0                	test   %eax,%eax
80105325:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105328:	0f 84 b7 00 00 00    	je     801053e5 <fork+0xe5>
8010532e:	83 ec 08             	sub    $0x8,%esp
80105331:	ff 33                	pushl  (%ebx)
80105333:	ff 73 04             	pushl  0x4(%ebx)
80105336:	89 c7                	mov    %eax,%edi
80105338:	e8 43 3a 00 00       	call   80108d80 <copyuvm>
8010533d:	83 c4 10             	add    $0x10,%esp
80105340:	85 c0                	test   %eax,%eax
80105342:	89 47 04             	mov    %eax,0x4(%edi)
80105345:	0f 84 a1 00 00 00    	je     801053ec <fork+0xec>
8010534b:	8b 03                	mov    (%ebx),%eax
8010534d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105350:	89 01                	mov    %eax,(%ecx)
80105352:	89 59 14             	mov    %ebx,0x14(%ecx)
80105355:	89 c8                	mov    %ecx,%eax
80105357:	8b 79 18             	mov    0x18(%ecx),%edi
8010535a:	8b 73 18             	mov    0x18(%ebx),%esi
8010535d:	b9 13 00 00 00       	mov    $0x13,%ecx
80105362:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80105364:	31 f6                	xor    %esi,%esi
80105366:	8b 40 18             	mov    0x18(%eax),%eax
80105369:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80105370:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80105374:	85 c0                	test   %eax,%eax
80105376:	74 13                	je     8010538b <fork+0x8b>
80105378:	83 ec 0c             	sub    $0xc,%esp
8010537b:	50                   	push   %eax
8010537c:	e8 9f c6 ff ff       	call   80101a20 <filedup>
80105381:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105384:	83 c4 10             	add    $0x10,%esp
80105387:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
8010538b:	83 c6 01             	add    $0x1,%esi
8010538e:	83 fe 10             	cmp    $0x10,%esi
80105391:	75 dd                	jne    80105370 <fork+0x70>
80105393:	83 ec 0c             	sub    $0xc,%esp
80105396:	ff 73 68             	pushl  0x68(%ebx)
80105399:	83 c3 6c             	add    $0x6c,%ebx
8010539c:	e8 6f cf ff ff       	call   80102310 <idup>
801053a1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801053a4:	83 c4 0c             	add    $0xc,%esp
801053a7:	89 47 68             	mov    %eax,0x68(%edi)
801053aa:	8d 47 6c             	lea    0x6c(%edi),%eax
801053ad:	6a 10                	push   $0x10
801053af:	53                   	push   %ebx
801053b0:	50                   	push   %eax
801053b1:	e8 fa 0b 00 00       	call   80105fb0 <safestrcpy>
801053b6:	8b 5f 10             	mov    0x10(%edi),%ebx
801053b9:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
801053c0:	e8 8b 08 00 00       	call   80105c50 <acquire>
801053c5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
801053cc:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
801053d3:	e8 98 09 00 00       	call   80105d70 <release>
801053d8:	83 c4 10             	add    $0x10,%esp
801053db:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053de:	89 d8                	mov    %ebx,%eax
801053e0:	5b                   	pop    %ebx
801053e1:	5e                   	pop    %esi
801053e2:	5f                   	pop    %edi
801053e3:	5d                   	pop    %ebp
801053e4:	c3                   	ret    
801053e5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801053ea:	eb ef                	jmp    801053db <fork+0xdb>
801053ec:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801053ef:	83 ec 0c             	sub    $0xc,%esp
801053f2:	ff 73 08             	pushl  0x8(%ebx)
801053f5:	e8 d6 db ff ff       	call   80102fd0 <kfree>
801053fa:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80105401:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80105408:	83 c4 10             	add    $0x10,%esp
8010540b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105410:	eb c9                	jmp    801053db <fork+0xdb>
80105412:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105420 <scheduler>:
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	57                   	push   %edi
80105424:	56                   	push   %esi
80105425:	53                   	push   %ebx
80105426:	83 ec 0c             	sub    $0xc,%esp
80105429:	e8 92 fc ff ff       	call   801050c0 <mycpu>
8010542e:	8d 78 04             	lea    0x4(%eax),%edi
80105431:	89 c6                	mov    %eax,%esi
80105433:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
8010543a:	00 00 00 
8010543d:	8d 76 00             	lea    0x0(%esi),%esi
80105440:	fb                   	sti    
80105441:	83 ec 0c             	sub    $0xc,%esp
80105444:	bb 14 c9 15 80       	mov    $0x8015c914,%ebx
80105449:	68 e0 c8 15 80       	push   $0x8015c8e0
8010544e:	e8 fd 07 00 00       	call   80105c50 <acquire>
80105453:	83 c4 10             	add    $0x10,%esp
80105456:	8d 76 00             	lea    0x0(%esi),%esi
80105459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105460:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80105464:	75 33                	jne    80105499 <scheduler+0x79>
80105466:	83 ec 0c             	sub    $0xc,%esp
80105469:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
8010546f:	53                   	push   %ebx
80105470:	e8 0b 34 00 00       	call   80108880 <switchuvm>
80105475:	58                   	pop    %eax
80105476:	5a                   	pop    %edx
80105477:	ff 73 1c             	pushl  0x1c(%ebx)
8010547a:	57                   	push   %edi
8010547b:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
80105482:	e8 84 0b 00 00       	call   8010600b <swtch>
80105487:	e8 d4 33 00 00       	call   80108860 <switchkvm>
8010548c:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80105493:	00 00 00 
80105496:	83 c4 10             	add    $0x10,%esp
80105499:	83 c3 7c             	add    $0x7c,%ebx
8010549c:	81 fb 14 e8 15 80    	cmp    $0x8015e814,%ebx
801054a2:	72 bc                	jb     80105460 <scheduler+0x40>
801054a4:	83 ec 0c             	sub    $0xc,%esp
801054a7:	68 e0 c8 15 80       	push   $0x8015c8e0
801054ac:	e8 bf 08 00 00       	call   80105d70 <release>
801054b1:	83 c4 10             	add    $0x10,%esp
801054b4:	eb 8a                	jmp    80105440 <scheduler+0x20>
801054b6:	8d 76 00             	lea    0x0(%esi),%esi
801054b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801054c0 <sched>:
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	56                   	push   %esi
801054c4:	53                   	push   %ebx
801054c5:	e8 46 07 00 00       	call   80105c10 <pushcli>
801054ca:	e8 f1 fb ff ff       	call   801050c0 <mycpu>
801054cf:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801054d5:	e8 36 08 00 00       	call   80105d10 <popcli>
801054da:	83 ec 0c             	sub    $0xc,%esp
801054dd:	68 e0 c8 15 80       	push   $0x8015c8e0
801054e2:	e8 e9 06 00 00       	call   80105bd0 <holding>
801054e7:	83 c4 10             	add    $0x10,%esp
801054ea:	85 c0                	test   %eax,%eax
801054ec:	74 4f                	je     8010553d <sched+0x7d>
801054ee:	e8 cd fb ff ff       	call   801050c0 <mycpu>
801054f3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
801054fa:	75 68                	jne    80105564 <sched+0xa4>
801054fc:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80105500:	74 55                	je     80105557 <sched+0x97>
80105502:	9c                   	pushf  
80105503:	58                   	pop    %eax
80105504:	f6 c4 02             	test   $0x2,%ah
80105507:	75 41                	jne    8010554a <sched+0x8a>
80105509:	e8 b2 fb ff ff       	call   801050c0 <mycpu>
8010550e:	83 c3 1c             	add    $0x1c,%ebx
80105511:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80105517:	e8 a4 fb ff ff       	call   801050c0 <mycpu>
8010551c:	83 ec 08             	sub    $0x8,%esp
8010551f:	ff 70 04             	pushl  0x4(%eax)
80105522:	53                   	push   %ebx
80105523:	e8 e3 0a 00 00       	call   8010600b <swtch>
80105528:	e8 93 fb ff ff       	call   801050c0 <mycpu>
8010552d:	83 c4 10             	add    $0x10,%esp
80105530:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80105536:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105539:	5b                   	pop    %ebx
8010553a:	5e                   	pop    %esi
8010553b:	5d                   	pop    %ebp
8010553c:	c3                   	ret    
8010553d:	83 ec 0c             	sub    $0xc,%esp
80105540:	68 a4 9a 10 80       	push   $0x80109aa4
80105545:	e8 26 b4 ff ff       	call   80100970 <panic>
8010554a:	83 ec 0c             	sub    $0xc,%esp
8010554d:	68 d0 9a 10 80       	push   $0x80109ad0
80105552:	e8 19 b4 ff ff       	call   80100970 <panic>
80105557:	83 ec 0c             	sub    $0xc,%esp
8010555a:	68 c2 9a 10 80       	push   $0x80109ac2
8010555f:	e8 0c b4 ff ff       	call   80100970 <panic>
80105564:	83 ec 0c             	sub    $0xc,%esp
80105567:	68 b6 9a 10 80       	push   $0x80109ab6
8010556c:	e8 ff b3 ff ff       	call   80100970 <panic>
80105571:	eb 0d                	jmp    80105580 <exit>
80105573:	90                   	nop
80105574:	90                   	nop
80105575:	90                   	nop
80105576:	90                   	nop
80105577:	90                   	nop
80105578:	90                   	nop
80105579:	90                   	nop
8010557a:	90                   	nop
8010557b:	90                   	nop
8010557c:	90                   	nop
8010557d:	90                   	nop
8010557e:	90                   	nop
8010557f:	90                   	nop

80105580 <exit>:
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	57                   	push   %edi
80105584:	56                   	push   %esi
80105585:	53                   	push   %ebx
80105586:	83 ec 0c             	sub    $0xc,%esp
80105589:	e8 82 06 00 00       	call   80105c10 <pushcli>
8010558e:	e8 2d fb ff ff       	call   801050c0 <mycpu>
80105593:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80105599:	e8 72 07 00 00       	call   80105d10 <popcli>
8010559e:	39 35 e0 3d 15 80    	cmp    %esi,0x80153de0
801055a4:	8d 5e 28             	lea    0x28(%esi),%ebx
801055a7:	8d 7e 68             	lea    0x68(%esi),%edi
801055aa:	0f 84 e7 00 00 00    	je     80105697 <exit+0x117>
801055b0:	8b 03                	mov    (%ebx),%eax
801055b2:	85 c0                	test   %eax,%eax
801055b4:	74 12                	je     801055c8 <exit+0x48>
801055b6:	83 ec 0c             	sub    $0xc,%esp
801055b9:	50                   	push   %eax
801055ba:	e8 b1 c4 ff ff       	call   80101a70 <fileclose>
801055bf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801055c5:	83 c4 10             	add    $0x10,%esp
801055c8:	83 c3 04             	add    $0x4,%ebx
801055cb:	39 fb                	cmp    %edi,%ebx
801055cd:	75 e1                	jne    801055b0 <exit+0x30>
801055cf:	e8 8c e2 ff ff       	call   80103860 <begin_op>
801055d4:	83 ec 0c             	sub    $0xc,%esp
801055d7:	ff 76 68             	pushl  0x68(%esi)
801055da:	e8 91 ce ff ff       	call   80102470 <iput>
801055df:	e8 ec e2 ff ff       	call   801038d0 <end_op>
801055e4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
801055eb:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
801055f2:	e8 59 06 00 00       	call   80105c50 <acquire>
801055f7:	8b 56 14             	mov    0x14(%esi),%edx
801055fa:	83 c4 10             	add    $0x10,%esp
801055fd:	b8 14 c9 15 80       	mov    $0x8015c914,%eax
80105602:	eb 0e                	jmp    80105612 <exit+0x92>
80105604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105608:	83 c0 7c             	add    $0x7c,%eax
8010560b:	3d 14 e8 15 80       	cmp    $0x8015e814,%eax
80105610:	73 1c                	jae    8010562e <exit+0xae>
80105612:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80105616:	75 f0                	jne    80105608 <exit+0x88>
80105618:	3b 50 20             	cmp    0x20(%eax),%edx
8010561b:	75 eb                	jne    80105608 <exit+0x88>
8010561d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80105624:	83 c0 7c             	add    $0x7c,%eax
80105627:	3d 14 e8 15 80       	cmp    $0x8015e814,%eax
8010562c:	72 e4                	jb     80105612 <exit+0x92>
8010562e:	8b 0d e0 3d 15 80    	mov    0x80153de0,%ecx
80105634:	ba 14 c9 15 80       	mov    $0x8015c914,%edx
80105639:	eb 10                	jmp    8010564b <exit+0xcb>
8010563b:	90                   	nop
8010563c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105640:	83 c2 7c             	add    $0x7c,%edx
80105643:	81 fa 14 e8 15 80    	cmp    $0x8015e814,%edx
80105649:	73 33                	jae    8010567e <exit+0xfe>
8010564b:	39 72 14             	cmp    %esi,0x14(%edx)
8010564e:	75 f0                	jne    80105640 <exit+0xc0>
80105650:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80105654:	89 4a 14             	mov    %ecx,0x14(%edx)
80105657:	75 e7                	jne    80105640 <exit+0xc0>
80105659:	b8 14 c9 15 80       	mov    $0x8015c914,%eax
8010565e:	eb 0a                	jmp    8010566a <exit+0xea>
80105660:	83 c0 7c             	add    $0x7c,%eax
80105663:	3d 14 e8 15 80       	cmp    $0x8015e814,%eax
80105668:	73 d6                	jae    80105640 <exit+0xc0>
8010566a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010566e:	75 f0                	jne    80105660 <exit+0xe0>
80105670:	3b 48 20             	cmp    0x20(%eax),%ecx
80105673:	75 eb                	jne    80105660 <exit+0xe0>
80105675:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010567c:	eb e2                	jmp    80105660 <exit+0xe0>
8010567e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
80105685:	e8 36 fe ff ff       	call   801054c0 <sched>
8010568a:	83 ec 0c             	sub    $0xc,%esp
8010568d:	68 f1 9a 10 80       	push   $0x80109af1
80105692:	e8 d9 b2 ff ff       	call   80100970 <panic>
80105697:	83 ec 0c             	sub    $0xc,%esp
8010569a:	68 e4 9a 10 80       	push   $0x80109ae4
8010569f:	e8 cc b2 ff ff       	call   80100970 <panic>
801056a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801056aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801056b0 <yield>:
801056b0:	55                   	push   %ebp
801056b1:	89 e5                	mov    %esp,%ebp
801056b3:	53                   	push   %ebx
801056b4:	83 ec 10             	sub    $0x10,%esp
801056b7:	68 e0 c8 15 80       	push   $0x8015c8e0
801056bc:	e8 8f 05 00 00       	call   80105c50 <acquire>
801056c1:	e8 4a 05 00 00       	call   80105c10 <pushcli>
801056c6:	e8 f5 f9 ff ff       	call   801050c0 <mycpu>
801056cb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801056d1:	e8 3a 06 00 00       	call   80105d10 <popcli>
801056d6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
801056dd:	e8 de fd ff ff       	call   801054c0 <sched>
801056e2:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
801056e9:	e8 82 06 00 00       	call   80105d70 <release>
801056ee:	83 c4 10             	add    $0x10,%esp
801056f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056f4:	c9                   	leave  
801056f5:	c3                   	ret    
801056f6:	8d 76 00             	lea    0x0(%esi),%esi
801056f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105700 <sleep>:
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	57                   	push   %edi
80105704:	56                   	push   %esi
80105705:	53                   	push   %ebx
80105706:	83 ec 0c             	sub    $0xc,%esp
80105709:	8b 7d 08             	mov    0x8(%ebp),%edi
8010570c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010570f:	e8 fc 04 00 00       	call   80105c10 <pushcli>
80105714:	e8 a7 f9 ff ff       	call   801050c0 <mycpu>
80105719:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
8010571f:	e8 ec 05 00 00       	call   80105d10 <popcli>
80105724:	85 db                	test   %ebx,%ebx
80105726:	0f 84 87 00 00 00    	je     801057b3 <sleep+0xb3>
8010572c:	85 f6                	test   %esi,%esi
8010572e:	74 76                	je     801057a6 <sleep+0xa6>
80105730:	81 fe e0 c8 15 80    	cmp    $0x8015c8e0,%esi
80105736:	74 50                	je     80105788 <sleep+0x88>
80105738:	83 ec 0c             	sub    $0xc,%esp
8010573b:	68 e0 c8 15 80       	push   $0x8015c8e0
80105740:	e8 0b 05 00 00       	call   80105c50 <acquire>
80105745:	89 34 24             	mov    %esi,(%esp)
80105748:	e8 23 06 00 00       	call   80105d70 <release>
8010574d:	89 7b 20             	mov    %edi,0x20(%ebx)
80105750:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80105757:	e8 64 fd ff ff       	call   801054c0 <sched>
8010575c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80105763:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
8010576a:	e8 01 06 00 00       	call   80105d70 <release>
8010576f:	89 75 08             	mov    %esi,0x8(%ebp)
80105772:	83 c4 10             	add    $0x10,%esp
80105775:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105778:	5b                   	pop    %ebx
80105779:	5e                   	pop    %esi
8010577a:	5f                   	pop    %edi
8010577b:	5d                   	pop    %ebp
8010577c:	e9 cf 04 00 00       	jmp    80105c50 <acquire>
80105781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105788:	89 7b 20             	mov    %edi,0x20(%ebx)
8010578b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80105792:	e8 29 fd ff ff       	call   801054c0 <sched>
80105797:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
8010579e:	8d 65 f4             	lea    -0xc(%ebp),%esp
801057a1:	5b                   	pop    %ebx
801057a2:	5e                   	pop    %esi
801057a3:	5f                   	pop    %edi
801057a4:	5d                   	pop    %ebp
801057a5:	c3                   	ret    
801057a6:	83 ec 0c             	sub    $0xc,%esp
801057a9:	68 03 9b 10 80       	push   $0x80109b03
801057ae:	e8 bd b1 ff ff       	call   80100970 <panic>
801057b3:	83 ec 0c             	sub    $0xc,%esp
801057b6:	68 fd 9a 10 80       	push   $0x80109afd
801057bb:	e8 b0 b1 ff ff       	call   80100970 <panic>

801057c0 <wait>:
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	56                   	push   %esi
801057c4:	53                   	push   %ebx
801057c5:	e8 46 04 00 00       	call   80105c10 <pushcli>
801057ca:	e8 f1 f8 ff ff       	call   801050c0 <mycpu>
801057cf:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
801057d5:	e8 36 05 00 00       	call   80105d10 <popcli>
801057da:	83 ec 0c             	sub    $0xc,%esp
801057dd:	68 e0 c8 15 80       	push   $0x8015c8e0
801057e2:	e8 69 04 00 00       	call   80105c50 <acquire>
801057e7:	83 c4 10             	add    $0x10,%esp
801057ea:	31 c0                	xor    %eax,%eax
801057ec:	bb 14 c9 15 80       	mov    $0x8015c914,%ebx
801057f1:	eb 10                	jmp    80105803 <wait+0x43>
801057f3:	90                   	nop
801057f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801057f8:	83 c3 7c             	add    $0x7c,%ebx
801057fb:	81 fb 14 e8 15 80    	cmp    $0x8015e814,%ebx
80105801:	73 1b                	jae    8010581e <wait+0x5e>
80105803:	39 73 14             	cmp    %esi,0x14(%ebx)
80105806:	75 f0                	jne    801057f8 <wait+0x38>
80105808:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010580c:	74 32                	je     80105840 <wait+0x80>
8010580e:	83 c3 7c             	add    $0x7c,%ebx
80105811:	b8 01 00 00 00       	mov    $0x1,%eax
80105816:	81 fb 14 e8 15 80    	cmp    $0x8015e814,%ebx
8010581c:	72 e5                	jb     80105803 <wait+0x43>
8010581e:	85 c0                	test   %eax,%eax
80105820:	74 74                	je     80105896 <wait+0xd6>
80105822:	8b 46 24             	mov    0x24(%esi),%eax
80105825:	85 c0                	test   %eax,%eax
80105827:	75 6d                	jne    80105896 <wait+0xd6>
80105829:	83 ec 08             	sub    $0x8,%esp
8010582c:	68 e0 c8 15 80       	push   $0x8015c8e0
80105831:	56                   	push   %esi
80105832:	e8 c9 fe ff ff       	call   80105700 <sleep>
80105837:	83 c4 10             	add    $0x10,%esp
8010583a:	eb ae                	jmp    801057ea <wait+0x2a>
8010583c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105840:	83 ec 0c             	sub    $0xc,%esp
80105843:	ff 73 08             	pushl  0x8(%ebx)
80105846:	8b 73 10             	mov    0x10(%ebx),%esi
80105849:	e8 82 d7 ff ff       	call   80102fd0 <kfree>
8010584e:	5a                   	pop    %edx
8010584f:	ff 73 04             	pushl  0x4(%ebx)
80105852:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80105859:	e8 d2 33 00 00       	call   80108c30 <freevm>
8010585e:	c7 04 24 e0 c8 15 80 	movl   $0x8015c8e0,(%esp)
80105865:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
8010586c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80105873:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80105877:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
8010587e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80105885:	e8 e6 04 00 00       	call   80105d70 <release>
8010588a:	83 c4 10             	add    $0x10,%esp
8010588d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105890:	89 f0                	mov    %esi,%eax
80105892:	5b                   	pop    %ebx
80105893:	5e                   	pop    %esi
80105894:	5d                   	pop    %ebp
80105895:	c3                   	ret    
80105896:	83 ec 0c             	sub    $0xc,%esp
80105899:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010589e:	68 e0 c8 15 80       	push   $0x8015c8e0
801058a3:	e8 c8 04 00 00       	call   80105d70 <release>
801058a8:	83 c4 10             	add    $0x10,%esp
801058ab:	eb e0                	jmp    8010588d <wait+0xcd>
801058ad:	8d 76 00             	lea    0x0(%esi),%esi

801058b0 <wakeup>:
801058b0:	55                   	push   %ebp
801058b1:	89 e5                	mov    %esp,%ebp
801058b3:	53                   	push   %ebx
801058b4:	83 ec 10             	sub    $0x10,%esp
801058b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801058ba:	68 e0 c8 15 80       	push   $0x8015c8e0
801058bf:	e8 8c 03 00 00       	call   80105c50 <acquire>
801058c4:	83 c4 10             	add    $0x10,%esp
801058c7:	b8 14 c9 15 80       	mov    $0x8015c914,%eax
801058cc:	eb 0c                	jmp    801058da <wakeup+0x2a>
801058ce:	66 90                	xchg   %ax,%ax
801058d0:	83 c0 7c             	add    $0x7c,%eax
801058d3:	3d 14 e8 15 80       	cmp    $0x8015e814,%eax
801058d8:	73 1c                	jae    801058f6 <wakeup+0x46>
801058da:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801058de:	75 f0                	jne    801058d0 <wakeup+0x20>
801058e0:	3b 58 20             	cmp    0x20(%eax),%ebx
801058e3:	75 eb                	jne    801058d0 <wakeup+0x20>
801058e5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801058ec:	83 c0 7c             	add    $0x7c,%eax
801058ef:	3d 14 e8 15 80       	cmp    $0x8015e814,%eax
801058f4:	72 e4                	jb     801058da <wakeup+0x2a>
801058f6:	c7 45 08 e0 c8 15 80 	movl   $0x8015c8e0,0x8(%ebp)
801058fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105900:	c9                   	leave  
80105901:	e9 6a 04 00 00       	jmp    80105d70 <release>
80105906:	8d 76 00             	lea    0x0(%esi),%esi
80105909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105910 <kill>:
80105910:	55                   	push   %ebp
80105911:	89 e5                	mov    %esp,%ebp
80105913:	53                   	push   %ebx
80105914:	83 ec 10             	sub    $0x10,%esp
80105917:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010591a:	68 e0 c8 15 80       	push   $0x8015c8e0
8010591f:	e8 2c 03 00 00       	call   80105c50 <acquire>
80105924:	83 c4 10             	add    $0x10,%esp
80105927:	b8 14 c9 15 80       	mov    $0x8015c914,%eax
8010592c:	eb 0c                	jmp    8010593a <kill+0x2a>
8010592e:	66 90                	xchg   %ax,%ax
80105930:	83 c0 7c             	add    $0x7c,%eax
80105933:	3d 14 e8 15 80       	cmp    $0x8015e814,%eax
80105938:	73 36                	jae    80105970 <kill+0x60>
8010593a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010593d:	75 f1                	jne    80105930 <kill+0x20>
8010593f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80105943:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010594a:	75 07                	jne    80105953 <kill+0x43>
8010594c:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80105953:	83 ec 0c             	sub    $0xc,%esp
80105956:	68 e0 c8 15 80       	push   $0x8015c8e0
8010595b:	e8 10 04 00 00       	call   80105d70 <release>
80105960:	83 c4 10             	add    $0x10,%esp
80105963:	31 c0                	xor    %eax,%eax
80105965:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105968:	c9                   	leave  
80105969:	c3                   	ret    
8010596a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105970:	83 ec 0c             	sub    $0xc,%esp
80105973:	68 e0 c8 15 80       	push   $0x8015c8e0
80105978:	e8 f3 03 00 00       	call   80105d70 <release>
8010597d:	83 c4 10             	add    $0x10,%esp
80105980:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105985:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105988:	c9                   	leave  
80105989:	c3                   	ret    
8010598a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105990 <procdump>:
80105990:	55                   	push   %ebp
80105991:	89 e5                	mov    %esp,%ebp
80105993:	57                   	push   %edi
80105994:	56                   	push   %esi
80105995:	53                   	push   %ebx
80105996:	8d 75 e8             	lea    -0x18(%ebp),%esi
80105999:	bb 14 c9 15 80       	mov    $0x8015c914,%ebx
8010599e:	83 ec 3c             	sub    $0x3c,%esp
801059a1:	eb 24                	jmp    801059c7 <procdump+0x37>
801059a3:	90                   	nop
801059a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801059a8:	83 ec 0c             	sub    $0xc,%esp
801059ab:	68 37 a0 10 80       	push   $0x8010a037
801059b0:	e8 8b b2 ff ff       	call   80100c40 <cprintf>
801059b5:	83 c4 10             	add    $0x10,%esp
801059b8:	83 c3 7c             	add    $0x7c,%ebx
801059bb:	81 fb 14 e8 15 80    	cmp    $0x8015e814,%ebx
801059c1:	0f 83 81 00 00 00    	jae    80105a48 <procdump+0xb8>
801059c7:	8b 43 0c             	mov    0xc(%ebx),%eax
801059ca:	85 c0                	test   %eax,%eax
801059cc:	74 ea                	je     801059b8 <procdump+0x28>
801059ce:	83 f8 05             	cmp    $0x5,%eax
801059d1:	ba 14 9b 10 80       	mov    $0x80109b14,%edx
801059d6:	77 11                	ja     801059e9 <procdump+0x59>
801059d8:	8b 14 85 74 9b 10 80 	mov    -0x7fef648c(,%eax,4),%edx
801059df:	b8 14 9b 10 80       	mov    $0x80109b14,%eax
801059e4:	85 d2                	test   %edx,%edx
801059e6:	0f 44 d0             	cmove  %eax,%edx
801059e9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801059ec:	50                   	push   %eax
801059ed:	52                   	push   %edx
801059ee:	ff 73 10             	pushl  0x10(%ebx)
801059f1:	68 18 9b 10 80       	push   $0x80109b18
801059f6:	e8 45 b2 ff ff       	call   80100c40 <cprintf>
801059fb:	83 c4 10             	add    $0x10,%esp
801059fe:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80105a02:	75 a4                	jne    801059a8 <procdump+0x18>
80105a04:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105a07:	83 ec 08             	sub    $0x8,%esp
80105a0a:	8d 7d c0             	lea    -0x40(%ebp),%edi
80105a0d:	50                   	push   %eax
80105a0e:	8b 43 1c             	mov    0x1c(%ebx),%eax
80105a11:	8b 40 0c             	mov    0xc(%eax),%eax
80105a14:	83 c0 08             	add    $0x8,%eax
80105a17:	50                   	push   %eax
80105a18:	e8 63 01 00 00       	call   80105b80 <getcallerpcs>
80105a1d:	83 c4 10             	add    $0x10,%esp
80105a20:	8b 17                	mov    (%edi),%edx
80105a22:	85 d2                	test   %edx,%edx
80105a24:	74 82                	je     801059a8 <procdump+0x18>
80105a26:	83 ec 08             	sub    $0x8,%esp
80105a29:	83 c7 04             	add    $0x4,%edi
80105a2c:	52                   	push   %edx
80105a2d:	68 22 92 10 80       	push   $0x80109222
80105a32:	e8 09 b2 ff ff       	call   80100c40 <cprintf>
80105a37:	83 c4 10             	add    $0x10,%esp
80105a3a:	39 fe                	cmp    %edi,%esi
80105a3c:	75 e2                	jne    80105a20 <procdump+0x90>
80105a3e:	e9 65 ff ff ff       	jmp    801059a8 <procdump+0x18>
80105a43:	90                   	nop
80105a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a4b:	5b                   	pop    %ebx
80105a4c:	5e                   	pop    %esi
80105a4d:	5f                   	pop    %edi
80105a4e:	5d                   	pop    %ebp
80105a4f:	c3                   	ret    

80105a50 <initsleeplock>:
80105a50:	55                   	push   %ebp
80105a51:	89 e5                	mov    %esp,%ebp
80105a53:	53                   	push   %ebx
80105a54:	83 ec 0c             	sub    $0xc,%esp
80105a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105a5a:	68 8c 9b 10 80       	push   $0x80109b8c
80105a5f:	8d 43 04             	lea    0x4(%ebx),%eax
80105a62:	50                   	push   %eax
80105a63:	e8 f8 00 00 00       	call   80105b60 <initlock>
80105a68:	8b 45 0c             	mov    0xc(%ebp),%eax
80105a6b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80105a71:	83 c4 10             	add    $0x10,%esp
80105a74:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80105a7b:	89 43 38             	mov    %eax,0x38(%ebx)
80105a7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a81:	c9                   	leave  
80105a82:	c3                   	ret    
80105a83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a90 <acquiresleep>:
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	56                   	push   %esi
80105a94:	53                   	push   %ebx
80105a95:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105a98:	83 ec 0c             	sub    $0xc,%esp
80105a9b:	8d 73 04             	lea    0x4(%ebx),%esi
80105a9e:	56                   	push   %esi
80105a9f:	e8 ac 01 00 00       	call   80105c50 <acquire>
80105aa4:	8b 13                	mov    (%ebx),%edx
80105aa6:	83 c4 10             	add    $0x10,%esp
80105aa9:	85 d2                	test   %edx,%edx
80105aab:	74 16                	je     80105ac3 <acquiresleep+0x33>
80105aad:	8d 76 00             	lea    0x0(%esi),%esi
80105ab0:	83 ec 08             	sub    $0x8,%esp
80105ab3:	56                   	push   %esi
80105ab4:	53                   	push   %ebx
80105ab5:	e8 46 fc ff ff       	call   80105700 <sleep>
80105aba:	8b 03                	mov    (%ebx),%eax
80105abc:	83 c4 10             	add    $0x10,%esp
80105abf:	85 c0                	test   %eax,%eax
80105ac1:	75 ed                	jne    80105ab0 <acquiresleep+0x20>
80105ac3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80105ac9:	e8 92 f6 ff ff       	call   80105160 <myproc>
80105ace:	8b 40 10             	mov    0x10(%eax),%eax
80105ad1:	89 43 3c             	mov    %eax,0x3c(%ebx)
80105ad4:	89 75 08             	mov    %esi,0x8(%ebp)
80105ad7:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105ada:	5b                   	pop    %ebx
80105adb:	5e                   	pop    %esi
80105adc:	5d                   	pop    %ebp
80105add:	e9 8e 02 00 00       	jmp    80105d70 <release>
80105ae2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105af0 <releasesleep>:
80105af0:	55                   	push   %ebp
80105af1:	89 e5                	mov    %esp,%ebp
80105af3:	56                   	push   %esi
80105af4:	53                   	push   %ebx
80105af5:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105af8:	83 ec 0c             	sub    $0xc,%esp
80105afb:	8d 73 04             	lea    0x4(%ebx),%esi
80105afe:	56                   	push   %esi
80105aff:	e8 4c 01 00 00       	call   80105c50 <acquire>
80105b04:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80105b0a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80105b11:	89 1c 24             	mov    %ebx,(%esp)
80105b14:	e8 97 fd ff ff       	call   801058b0 <wakeup>
80105b19:	89 75 08             	mov    %esi,0x8(%ebp)
80105b1c:	83 c4 10             	add    $0x10,%esp
80105b1f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105b22:	5b                   	pop    %ebx
80105b23:	5e                   	pop    %esi
80105b24:	5d                   	pop    %ebp
80105b25:	e9 46 02 00 00       	jmp    80105d70 <release>
80105b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105b30 <holdingsleep>:
80105b30:	55                   	push   %ebp
80105b31:	89 e5                	mov    %esp,%ebp
80105b33:	56                   	push   %esi
80105b34:	53                   	push   %ebx
80105b35:	8b 75 08             	mov    0x8(%ebp),%esi
80105b38:	83 ec 0c             	sub    $0xc,%esp
80105b3b:	8d 5e 04             	lea    0x4(%esi),%ebx
80105b3e:	53                   	push   %ebx
80105b3f:	e8 0c 01 00 00       	call   80105c50 <acquire>
80105b44:	8b 36                	mov    (%esi),%esi
80105b46:	89 1c 24             	mov    %ebx,(%esp)
80105b49:	e8 22 02 00 00       	call   80105d70 <release>
80105b4e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105b51:	89 f0                	mov    %esi,%eax
80105b53:	5b                   	pop    %ebx
80105b54:	5e                   	pop    %esi
80105b55:	5d                   	pop    %ebp
80105b56:	c3                   	ret    
80105b57:	66 90                	xchg   %ax,%ax
80105b59:	66 90                	xchg   %ax,%ax
80105b5b:	66 90                	xchg   %ax,%ax
80105b5d:	66 90                	xchg   %ax,%ax
80105b5f:	90                   	nop

80105b60 <initlock>:
80105b60:	55                   	push   %ebp
80105b61:	89 e5                	mov    %esp,%ebp
80105b63:	8b 45 08             	mov    0x8(%ebp),%eax
80105b66:	8b 55 0c             	mov    0xc(%ebp),%edx
80105b69:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80105b6f:	89 50 04             	mov    %edx,0x4(%eax)
80105b72:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80105b79:	5d                   	pop    %ebp
80105b7a:	c3                   	ret    
80105b7b:	90                   	nop
80105b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b80 <getcallerpcs>:
80105b80:	55                   	push   %ebp
80105b81:	31 d2                	xor    %edx,%edx
80105b83:	89 e5                	mov    %esp,%ebp
80105b85:	53                   	push   %ebx
80105b86:	8b 45 08             	mov    0x8(%ebp),%eax
80105b89:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80105b8c:	83 e8 08             	sub    $0x8,%eax
80105b8f:	90                   	nop
80105b90:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80105b96:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80105b9c:	77 1a                	ja     80105bb8 <getcallerpcs+0x38>
80105b9e:	8b 58 04             	mov    0x4(%eax),%ebx
80105ba1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80105ba4:	83 c2 01             	add    $0x1,%edx
80105ba7:	8b 00                	mov    (%eax),%eax
80105ba9:	83 fa 0a             	cmp    $0xa,%edx
80105bac:	75 e2                	jne    80105b90 <getcallerpcs+0x10>
80105bae:	5b                   	pop    %ebx
80105baf:	5d                   	pop    %ebp
80105bb0:	c3                   	ret    
80105bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bb8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
80105bbb:	83 c1 28             	add    $0x28,%ecx
80105bbe:	66 90                	xchg   %ax,%ax
80105bc0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80105bc6:	83 c0 04             	add    $0x4,%eax
80105bc9:	39 c1                	cmp    %eax,%ecx
80105bcb:	75 f3                	jne    80105bc0 <getcallerpcs+0x40>
80105bcd:	5b                   	pop    %ebx
80105bce:	5d                   	pop    %ebp
80105bcf:	c3                   	ret    

80105bd0 <holding>:
80105bd0:	55                   	push   %ebp
80105bd1:	89 e5                	mov    %esp,%ebp
80105bd3:	53                   	push   %ebx
80105bd4:	83 ec 04             	sub    $0x4,%esp
80105bd7:	8b 55 08             	mov    0x8(%ebp),%edx
80105bda:	8b 02                	mov    (%edx),%eax
80105bdc:	85 c0                	test   %eax,%eax
80105bde:	75 10                	jne    80105bf0 <holding+0x20>
80105be0:	83 c4 04             	add    $0x4,%esp
80105be3:	31 c0                	xor    %eax,%eax
80105be5:	5b                   	pop    %ebx
80105be6:	5d                   	pop    %ebp
80105be7:	c3                   	ret    
80105be8:	90                   	nop
80105be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bf0:	8b 5a 08             	mov    0x8(%edx),%ebx
80105bf3:	e8 c8 f4 ff ff       	call   801050c0 <mycpu>
80105bf8:	39 c3                	cmp    %eax,%ebx
80105bfa:	0f 94 c0             	sete   %al
80105bfd:	83 c4 04             	add    $0x4,%esp
80105c00:	0f b6 c0             	movzbl %al,%eax
80105c03:	5b                   	pop    %ebx
80105c04:	5d                   	pop    %ebp
80105c05:	c3                   	ret    
80105c06:	8d 76 00             	lea    0x0(%esi),%esi
80105c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c10 <pushcli>:
80105c10:	55                   	push   %ebp
80105c11:	89 e5                	mov    %esp,%ebp
80105c13:	53                   	push   %ebx
80105c14:	83 ec 04             	sub    $0x4,%esp
80105c17:	9c                   	pushf  
80105c18:	5b                   	pop    %ebx
80105c19:	fa                   	cli    
80105c1a:	e8 a1 f4 ff ff       	call   801050c0 <mycpu>
80105c1f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80105c25:	85 c0                	test   %eax,%eax
80105c27:	75 11                	jne    80105c3a <pushcli+0x2a>
80105c29:	81 e3 00 02 00 00    	and    $0x200,%ebx
80105c2f:	e8 8c f4 ff ff       	call   801050c0 <mycpu>
80105c34:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80105c3a:	e8 81 f4 ff ff       	call   801050c0 <mycpu>
80105c3f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80105c46:	83 c4 04             	add    $0x4,%esp
80105c49:	5b                   	pop    %ebx
80105c4a:	5d                   	pop    %ebp
80105c4b:	c3                   	ret    
80105c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105c50 <acquire>:
80105c50:	55                   	push   %ebp
80105c51:	89 e5                	mov    %esp,%ebp
80105c53:	56                   	push   %esi
80105c54:	53                   	push   %ebx
80105c55:	e8 b6 ff ff ff       	call   80105c10 <pushcli>
80105c5a:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105c5d:	8b 03                	mov    (%ebx),%eax
80105c5f:	85 c0                	test   %eax,%eax
80105c61:	0f 85 81 00 00 00    	jne    80105ce8 <acquire+0x98>
80105c67:	ba 01 00 00 00       	mov    $0x1,%edx
80105c6c:	eb 05                	jmp    80105c73 <acquire+0x23>
80105c6e:	66 90                	xchg   %ax,%ax
80105c70:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105c73:	89 d0                	mov    %edx,%eax
80105c75:	f0 87 03             	lock xchg %eax,(%ebx)
80105c78:	85 c0                	test   %eax,%eax
80105c7a:	75 f4                	jne    80105c70 <acquire+0x20>
80105c7c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80105c81:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105c84:	e8 37 f4 ff ff       	call   801050c0 <mycpu>
80105c89:	31 d2                	xor    %edx,%edx
80105c8b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
80105c8e:	89 43 08             	mov    %eax,0x8(%ebx)
80105c91:	89 e8                	mov    %ebp,%eax
80105c93:	90                   	nop
80105c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105c98:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80105c9e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80105ca4:	77 1a                	ja     80105cc0 <acquire+0x70>
80105ca6:	8b 58 04             	mov    0x4(%eax),%ebx
80105ca9:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80105cac:	83 c2 01             	add    $0x1,%edx
80105caf:	8b 00                	mov    (%eax),%eax
80105cb1:	83 fa 0a             	cmp    $0xa,%edx
80105cb4:	75 e2                	jne    80105c98 <acquire+0x48>
80105cb6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105cb9:	5b                   	pop    %ebx
80105cba:	5e                   	pop    %esi
80105cbb:	5d                   	pop    %ebp
80105cbc:	c3                   	ret    
80105cbd:	8d 76 00             	lea    0x0(%esi),%esi
80105cc0:	8d 04 91             	lea    (%ecx,%edx,4),%eax
80105cc3:	83 c1 28             	add    $0x28,%ecx
80105cc6:	8d 76 00             	lea    0x0(%esi),%esi
80105cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105cd0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80105cd6:	83 c0 04             	add    $0x4,%eax
80105cd9:	39 c8                	cmp    %ecx,%eax
80105cdb:	75 f3                	jne    80105cd0 <acquire+0x80>
80105cdd:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105ce0:	5b                   	pop    %ebx
80105ce1:	5e                   	pop    %esi
80105ce2:	5d                   	pop    %ebp
80105ce3:	c3                   	ret    
80105ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105ce8:	8b 73 08             	mov    0x8(%ebx),%esi
80105ceb:	e8 d0 f3 ff ff       	call   801050c0 <mycpu>
80105cf0:	39 c6                	cmp    %eax,%esi
80105cf2:	0f 85 6f ff ff ff    	jne    80105c67 <acquire+0x17>
80105cf8:	83 ec 0c             	sub    $0xc,%esp
80105cfb:	68 97 9b 10 80       	push   $0x80109b97
80105d00:	e8 6b ac ff ff       	call   80100970 <panic>
80105d05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d10 <popcli>:
80105d10:	55                   	push   %ebp
80105d11:	89 e5                	mov    %esp,%ebp
80105d13:	83 ec 08             	sub    $0x8,%esp
80105d16:	9c                   	pushf  
80105d17:	58                   	pop    %eax
80105d18:	f6 c4 02             	test   $0x2,%ah
80105d1b:	75 35                	jne    80105d52 <popcli+0x42>
80105d1d:	e8 9e f3 ff ff       	call   801050c0 <mycpu>
80105d22:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80105d29:	78 34                	js     80105d5f <popcli+0x4f>
80105d2b:	e8 90 f3 ff ff       	call   801050c0 <mycpu>
80105d30:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80105d36:	85 d2                	test   %edx,%edx
80105d38:	74 06                	je     80105d40 <popcli+0x30>
80105d3a:	c9                   	leave  
80105d3b:	c3                   	ret    
80105d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105d40:	e8 7b f3 ff ff       	call   801050c0 <mycpu>
80105d45:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
80105d4b:	85 c0                	test   %eax,%eax
80105d4d:	74 eb                	je     80105d3a <popcli+0x2a>
80105d4f:	fb                   	sti    
80105d50:	c9                   	leave  
80105d51:	c3                   	ret    
80105d52:	83 ec 0c             	sub    $0xc,%esp
80105d55:	68 9f 9b 10 80       	push   $0x80109b9f
80105d5a:	e8 11 ac ff ff       	call   80100970 <panic>
80105d5f:	83 ec 0c             	sub    $0xc,%esp
80105d62:	68 b6 9b 10 80       	push   $0x80109bb6
80105d67:	e8 04 ac ff ff       	call   80100970 <panic>
80105d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105d70 <release>:
80105d70:	55                   	push   %ebp
80105d71:	89 e5                	mov    %esp,%ebp
80105d73:	56                   	push   %esi
80105d74:	53                   	push   %ebx
80105d75:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105d78:	8b 03                	mov    (%ebx),%eax
80105d7a:	85 c0                	test   %eax,%eax
80105d7c:	74 0c                	je     80105d8a <release+0x1a>
80105d7e:	8b 73 08             	mov    0x8(%ebx),%esi
80105d81:	e8 3a f3 ff ff       	call   801050c0 <mycpu>
80105d86:	39 c6                	cmp    %eax,%esi
80105d88:	74 16                	je     80105da0 <release+0x30>
80105d8a:	83 ec 0c             	sub    $0xc,%esp
80105d8d:	68 bd 9b 10 80       	push   $0x80109bbd
80105d92:	e8 d9 ab ff ff       	call   80100970 <panic>
80105d97:	89 f6                	mov    %esi,%esi
80105d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105da0:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80105da7:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80105dae:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80105db3:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80105db9:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105dbc:	5b                   	pop    %ebx
80105dbd:	5e                   	pop    %esi
80105dbe:	5d                   	pop    %ebp
80105dbf:	e9 4c ff ff ff       	jmp    80105d10 <popcli>
80105dc4:	66 90                	xchg   %ax,%ax
80105dc6:	66 90                	xchg   %ax,%ax
80105dc8:	66 90                	xchg   %ax,%ax
80105dca:	66 90                	xchg   %ax,%ax
80105dcc:	66 90                	xchg   %ax,%ax
80105dce:	66 90                	xchg   %ax,%ax

80105dd0 <memset>:
80105dd0:	55                   	push   %ebp
80105dd1:	89 e5                	mov    %esp,%ebp
80105dd3:	57                   	push   %edi
80105dd4:	53                   	push   %ebx
80105dd5:	8b 55 08             	mov    0x8(%ebp),%edx
80105dd8:	8b 4d 10             	mov    0x10(%ebp),%ecx
80105ddb:	f6 c2 03             	test   $0x3,%dl
80105dde:	75 05                	jne    80105de5 <memset+0x15>
80105de0:	f6 c1 03             	test   $0x3,%cl
80105de3:	74 13                	je     80105df8 <memset+0x28>
80105de5:	89 d7                	mov    %edx,%edi
80105de7:	8b 45 0c             	mov    0xc(%ebp),%eax
80105dea:	fc                   	cld    
80105deb:	f3 aa                	rep stos %al,%es:(%edi)
80105ded:	5b                   	pop    %ebx
80105dee:	89 d0                	mov    %edx,%eax
80105df0:	5f                   	pop    %edi
80105df1:	5d                   	pop    %ebp
80105df2:	c3                   	ret    
80105df3:	90                   	nop
80105df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105df8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
80105dfc:	c1 e9 02             	shr    $0x2,%ecx
80105dff:	89 f8                	mov    %edi,%eax
80105e01:	89 fb                	mov    %edi,%ebx
80105e03:	c1 e0 18             	shl    $0x18,%eax
80105e06:	c1 e3 10             	shl    $0x10,%ebx
80105e09:	09 d8                	or     %ebx,%eax
80105e0b:	09 f8                	or     %edi,%eax
80105e0d:	c1 e7 08             	shl    $0x8,%edi
80105e10:	09 f8                	or     %edi,%eax
80105e12:	89 d7                	mov    %edx,%edi
80105e14:	fc                   	cld    
80105e15:	f3 ab                	rep stos %eax,%es:(%edi)
80105e17:	5b                   	pop    %ebx
80105e18:	89 d0                	mov    %edx,%eax
80105e1a:	5f                   	pop    %edi
80105e1b:	5d                   	pop    %ebp
80105e1c:	c3                   	ret    
80105e1d:	8d 76 00             	lea    0x0(%esi),%esi

80105e20 <memcmp>:
80105e20:	55                   	push   %ebp
80105e21:	89 e5                	mov    %esp,%ebp
80105e23:	57                   	push   %edi
80105e24:	56                   	push   %esi
80105e25:	53                   	push   %ebx
80105e26:	8b 5d 10             	mov    0x10(%ebp),%ebx
80105e29:	8b 75 08             	mov    0x8(%ebp),%esi
80105e2c:	8b 7d 0c             	mov    0xc(%ebp),%edi
80105e2f:	85 db                	test   %ebx,%ebx
80105e31:	74 29                	je     80105e5c <memcmp+0x3c>
80105e33:	0f b6 16             	movzbl (%esi),%edx
80105e36:	0f b6 0f             	movzbl (%edi),%ecx
80105e39:	38 d1                	cmp    %dl,%cl
80105e3b:	75 2b                	jne    80105e68 <memcmp+0x48>
80105e3d:	b8 01 00 00 00       	mov    $0x1,%eax
80105e42:	eb 14                	jmp    80105e58 <memcmp+0x38>
80105e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105e48:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
80105e4c:	83 c0 01             	add    $0x1,%eax
80105e4f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80105e54:	38 ca                	cmp    %cl,%dl
80105e56:	75 10                	jne    80105e68 <memcmp+0x48>
80105e58:	39 d8                	cmp    %ebx,%eax
80105e5a:	75 ec                	jne    80105e48 <memcmp+0x28>
80105e5c:	5b                   	pop    %ebx
80105e5d:	31 c0                	xor    %eax,%eax
80105e5f:	5e                   	pop    %esi
80105e60:	5f                   	pop    %edi
80105e61:	5d                   	pop    %ebp
80105e62:	c3                   	ret    
80105e63:	90                   	nop
80105e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105e68:	0f b6 c2             	movzbl %dl,%eax
80105e6b:	5b                   	pop    %ebx
80105e6c:	29 c8                	sub    %ecx,%eax
80105e6e:	5e                   	pop    %esi
80105e6f:	5f                   	pop    %edi
80105e70:	5d                   	pop    %ebp
80105e71:	c3                   	ret    
80105e72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e80 <memmove>:
80105e80:	55                   	push   %ebp
80105e81:	89 e5                	mov    %esp,%ebp
80105e83:	56                   	push   %esi
80105e84:	53                   	push   %ebx
80105e85:	8b 45 08             	mov    0x8(%ebp),%eax
80105e88:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80105e8b:	8b 75 10             	mov    0x10(%ebp),%esi
80105e8e:	39 c3                	cmp    %eax,%ebx
80105e90:	73 26                	jae    80105eb8 <memmove+0x38>
80105e92:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80105e95:	39 c8                	cmp    %ecx,%eax
80105e97:	73 1f                	jae    80105eb8 <memmove+0x38>
80105e99:	85 f6                	test   %esi,%esi
80105e9b:	8d 56 ff             	lea    -0x1(%esi),%edx
80105e9e:	74 0f                	je     80105eaf <memmove+0x2f>
80105ea0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80105ea4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80105ea7:	83 ea 01             	sub    $0x1,%edx
80105eaa:	83 fa ff             	cmp    $0xffffffff,%edx
80105ead:	75 f1                	jne    80105ea0 <memmove+0x20>
80105eaf:	5b                   	pop    %ebx
80105eb0:	5e                   	pop    %esi
80105eb1:	5d                   	pop    %ebp
80105eb2:	c3                   	ret    
80105eb3:	90                   	nop
80105eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105eb8:	31 d2                	xor    %edx,%edx
80105eba:	85 f6                	test   %esi,%esi
80105ebc:	74 f1                	je     80105eaf <memmove+0x2f>
80105ebe:	66 90                	xchg   %ax,%ax
80105ec0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80105ec4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80105ec7:	83 c2 01             	add    $0x1,%edx
80105eca:	39 d6                	cmp    %edx,%esi
80105ecc:	75 f2                	jne    80105ec0 <memmove+0x40>
80105ece:	5b                   	pop    %ebx
80105ecf:	5e                   	pop    %esi
80105ed0:	5d                   	pop    %ebp
80105ed1:	c3                   	ret    
80105ed2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ee0 <memcpy>:
80105ee0:	55                   	push   %ebp
80105ee1:	89 e5                	mov    %esp,%ebp
80105ee3:	5d                   	pop    %ebp
80105ee4:	eb 9a                	jmp    80105e80 <memmove>
80105ee6:	8d 76 00             	lea    0x0(%esi),%esi
80105ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ef0 <strncmp>:
80105ef0:	55                   	push   %ebp
80105ef1:	89 e5                	mov    %esp,%ebp
80105ef3:	57                   	push   %edi
80105ef4:	56                   	push   %esi
80105ef5:	8b 7d 10             	mov    0x10(%ebp),%edi
80105ef8:	53                   	push   %ebx
80105ef9:	8b 4d 08             	mov    0x8(%ebp),%ecx
80105efc:	8b 75 0c             	mov    0xc(%ebp),%esi
80105eff:	85 ff                	test   %edi,%edi
80105f01:	74 2f                	je     80105f32 <strncmp+0x42>
80105f03:	0f b6 01             	movzbl (%ecx),%eax
80105f06:	0f b6 1e             	movzbl (%esi),%ebx
80105f09:	84 c0                	test   %al,%al
80105f0b:	74 37                	je     80105f44 <strncmp+0x54>
80105f0d:	38 c3                	cmp    %al,%bl
80105f0f:	75 33                	jne    80105f44 <strncmp+0x54>
80105f11:	01 f7                	add    %esi,%edi
80105f13:	eb 13                	jmp    80105f28 <strncmp+0x38>
80105f15:	8d 76 00             	lea    0x0(%esi),%esi
80105f18:	0f b6 01             	movzbl (%ecx),%eax
80105f1b:	84 c0                	test   %al,%al
80105f1d:	74 21                	je     80105f40 <strncmp+0x50>
80105f1f:	0f b6 1a             	movzbl (%edx),%ebx
80105f22:	89 d6                	mov    %edx,%esi
80105f24:	38 d8                	cmp    %bl,%al
80105f26:	75 1c                	jne    80105f44 <strncmp+0x54>
80105f28:	8d 56 01             	lea    0x1(%esi),%edx
80105f2b:	83 c1 01             	add    $0x1,%ecx
80105f2e:	39 fa                	cmp    %edi,%edx
80105f30:	75 e6                	jne    80105f18 <strncmp+0x28>
80105f32:	5b                   	pop    %ebx
80105f33:	31 c0                	xor    %eax,%eax
80105f35:	5e                   	pop    %esi
80105f36:	5f                   	pop    %edi
80105f37:	5d                   	pop    %ebp
80105f38:	c3                   	ret    
80105f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105f40:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80105f44:	29 d8                	sub    %ebx,%eax
80105f46:	5b                   	pop    %ebx
80105f47:	5e                   	pop    %esi
80105f48:	5f                   	pop    %edi
80105f49:	5d                   	pop    %ebp
80105f4a:	c3                   	ret    
80105f4b:	90                   	nop
80105f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105f50 <strncpy>:
80105f50:	55                   	push   %ebp
80105f51:	89 e5                	mov    %esp,%ebp
80105f53:	56                   	push   %esi
80105f54:	53                   	push   %ebx
80105f55:	8b 45 08             	mov    0x8(%ebp),%eax
80105f58:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80105f5b:	8b 4d 10             	mov    0x10(%ebp),%ecx
80105f5e:	89 c2                	mov    %eax,%edx
80105f60:	eb 19                	jmp    80105f7b <strncpy+0x2b>
80105f62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105f68:	83 c3 01             	add    $0x1,%ebx
80105f6b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
80105f6f:	83 c2 01             	add    $0x1,%edx
80105f72:	84 c9                	test   %cl,%cl
80105f74:	88 4a ff             	mov    %cl,-0x1(%edx)
80105f77:	74 09                	je     80105f82 <strncpy+0x32>
80105f79:	89 f1                	mov    %esi,%ecx
80105f7b:	85 c9                	test   %ecx,%ecx
80105f7d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80105f80:	7f e6                	jg     80105f68 <strncpy+0x18>
80105f82:	31 c9                	xor    %ecx,%ecx
80105f84:	85 f6                	test   %esi,%esi
80105f86:	7e 17                	jle    80105f9f <strncpy+0x4f>
80105f88:	90                   	nop
80105f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105f90:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80105f94:	89 f3                	mov    %esi,%ebx
80105f96:	83 c1 01             	add    $0x1,%ecx
80105f99:	29 cb                	sub    %ecx,%ebx
80105f9b:	85 db                	test   %ebx,%ebx
80105f9d:	7f f1                	jg     80105f90 <strncpy+0x40>
80105f9f:	5b                   	pop    %ebx
80105fa0:	5e                   	pop    %esi
80105fa1:	5d                   	pop    %ebp
80105fa2:	c3                   	ret    
80105fa3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105fb0 <safestrcpy>:
80105fb0:	55                   	push   %ebp
80105fb1:	89 e5                	mov    %esp,%ebp
80105fb3:	56                   	push   %esi
80105fb4:	53                   	push   %ebx
80105fb5:	8b 4d 10             	mov    0x10(%ebp),%ecx
80105fb8:	8b 45 08             	mov    0x8(%ebp),%eax
80105fbb:	8b 55 0c             	mov    0xc(%ebp),%edx
80105fbe:	85 c9                	test   %ecx,%ecx
80105fc0:	7e 26                	jle    80105fe8 <safestrcpy+0x38>
80105fc2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80105fc6:	89 c1                	mov    %eax,%ecx
80105fc8:	eb 17                	jmp    80105fe1 <safestrcpy+0x31>
80105fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105fd0:	83 c2 01             	add    $0x1,%edx
80105fd3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80105fd7:	83 c1 01             	add    $0x1,%ecx
80105fda:	84 db                	test   %bl,%bl
80105fdc:	88 59 ff             	mov    %bl,-0x1(%ecx)
80105fdf:	74 04                	je     80105fe5 <safestrcpy+0x35>
80105fe1:	39 f2                	cmp    %esi,%edx
80105fe3:	75 eb                	jne    80105fd0 <safestrcpy+0x20>
80105fe5:	c6 01 00             	movb   $0x0,(%ecx)
80105fe8:	5b                   	pop    %ebx
80105fe9:	5e                   	pop    %esi
80105fea:	5d                   	pop    %ebp
80105feb:	c3                   	ret    
80105fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105ff0 <strlen>:
80105ff0:	55                   	push   %ebp
80105ff1:	31 c0                	xor    %eax,%eax
80105ff3:	89 e5                	mov    %esp,%ebp
80105ff5:	8b 55 08             	mov    0x8(%ebp),%edx
80105ff8:	80 3a 00             	cmpb   $0x0,(%edx)
80105ffb:	74 0c                	je     80106009 <strlen+0x19>
80105ffd:	8d 76 00             	lea    0x0(%esi),%esi
80106000:	83 c0 01             	add    $0x1,%eax
80106003:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80106007:	75 f7                	jne    80106000 <strlen+0x10>
80106009:	5d                   	pop    %ebp
8010600a:	c3                   	ret    

8010600b <swtch>:
8010600b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010600f:	8b 54 24 08          	mov    0x8(%esp),%edx
80106013:	55                   	push   %ebp
80106014:	53                   	push   %ebx
80106015:	56                   	push   %esi
80106016:	57                   	push   %edi
80106017:	89 20                	mov    %esp,(%eax)
80106019:	89 d4                	mov    %edx,%esp
8010601b:	5f                   	pop    %edi
8010601c:	5e                   	pop    %esi
8010601d:	5b                   	pop    %ebx
8010601e:	5d                   	pop    %ebp
8010601f:	c3                   	ret    

80106020 <sys_arp>:
80106020:	55                   	push   %ebp
80106021:	89 e5                	mov    %esp,%ebp
80106023:	83 ec 20             	sub    $0x20,%esp
80106026:	8d 45 ec             	lea    -0x14(%ebp),%eax
80106029:	50                   	push   %eax
8010602a:	6a 00                	push   $0x0
8010602c:	e8 0f 02 00 00       	call   80106240 <argstr>
80106031:	83 c4 10             	add    $0x10,%esp
80106034:	85 c0                	test   %eax,%eax
80106036:	78 68                	js     801060a0 <sys_arp+0x80>
80106038:	8d 45 e8             	lea    -0x18(%ebp),%eax
8010603b:	83 ec 08             	sub    $0x8,%esp
8010603e:	50                   	push   %eax
8010603f:	6a 01                	push   $0x1
80106041:	e8 fa 01 00 00       	call   80106240 <argstr>
80106046:	83 c4 10             	add    $0x10,%esp
80106049:	85 c0                	test   %eax,%eax
8010604b:	78 53                	js     801060a0 <sys_arp+0x80>
8010604d:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106050:	83 ec 08             	sub    $0x8,%esp
80106053:	50                   	push   %eax
80106054:	6a 03                	push   $0x3
80106056:	e8 35 01 00 00       	call   80106190 <argint>
8010605b:	83 c4 10             	add    $0x10,%esp
8010605e:	85 c0                	test   %eax,%eax
80106060:	78 3e                	js     801060a0 <sys_arp+0x80>
80106062:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106065:	83 ec 04             	sub    $0x4,%esp
80106068:	ff 75 f4             	pushl  -0xc(%ebp)
8010606b:	50                   	push   %eax
8010606c:	6a 02                	push   $0x2
8010606e:	e8 6d 01 00 00       	call   801061e0 <argptr>
80106073:	83 c4 10             	add    $0x10,%esp
80106076:	85 c0                	test   %eax,%eax
80106078:	78 26                	js     801060a0 <sys_arp+0x80>
8010607a:	83 ec 04             	sub    $0x4,%esp
8010607d:	ff 75 f0             	pushl  -0x10(%ebp)
80106080:	ff 75 e8             	pushl  -0x18(%ebp)
80106083:	ff 75 ec             	pushl  -0x14(%ebp)
80106086:	e8 15 a0 ff ff       	call   801000a0 <send_arpRequest>
8010608b:	83 c4 10             	add    $0x10,%esp
8010608e:	85 c0                	test   %eax,%eax
80106090:	78 25                	js     801060b7 <sys_arp+0x97>
80106092:	31 c0                	xor    %eax,%eax
80106094:	c9                   	leave  
80106095:	c3                   	ret    
80106096:	8d 76 00             	lea    0x0(%esi),%esi
80106099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801060a0:	83 ec 0c             	sub    $0xc,%esp
801060a3:	68 c8 9b 10 80       	push   $0x80109bc8
801060a8:	e8 93 ab ff ff       	call   80100c40 <cprintf>
801060ad:	83 c4 10             	add    $0x10,%esp
801060b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801060b5:	c9                   	leave  
801060b6:	c3                   	ret    
801060b7:	83 ec 08             	sub    $0x8,%esp
801060ba:	ff 75 e8             	pushl  -0x18(%ebp)
801060bd:	68 f8 9b 10 80       	push   $0x80109bf8
801060c2:	e8 79 ab ff ff       	call   80100c40 <cprintf>
801060c7:	83 c4 10             	add    $0x10,%esp
801060ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801060cf:	c9                   	leave  
801060d0:	c3                   	ret    
801060d1:	66 90                	xchg   %ax,%ax
801060d3:	66 90                	xchg   %ax,%ax
801060d5:	66 90                	xchg   %ax,%ax
801060d7:	66 90                	xchg   %ax,%ax
801060d9:	66 90                	xchg   %ax,%ax
801060db:	66 90                	xchg   %ax,%ax
801060dd:	66 90                	xchg   %ax,%ax
801060df:	90                   	nop

801060e0 <fetchint>:
801060e0:	55                   	push   %ebp
801060e1:	89 e5                	mov    %esp,%ebp
801060e3:	53                   	push   %ebx
801060e4:	83 ec 04             	sub    $0x4,%esp
801060e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801060ea:	e8 71 f0 ff ff       	call   80105160 <myproc>
801060ef:	8b 00                	mov    (%eax),%eax
801060f1:	39 d8                	cmp    %ebx,%eax
801060f3:	76 1b                	jbe    80106110 <fetchint+0x30>
801060f5:	8d 53 04             	lea    0x4(%ebx),%edx
801060f8:	39 d0                	cmp    %edx,%eax
801060fa:	72 14                	jb     80106110 <fetchint+0x30>
801060fc:	8b 45 0c             	mov    0xc(%ebp),%eax
801060ff:	8b 13                	mov    (%ebx),%edx
80106101:	89 10                	mov    %edx,(%eax)
80106103:	31 c0                	xor    %eax,%eax
80106105:	83 c4 04             	add    $0x4,%esp
80106108:	5b                   	pop    %ebx
80106109:	5d                   	pop    %ebp
8010610a:	c3                   	ret    
8010610b:	90                   	nop
8010610c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106110:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106115:	eb ee                	jmp    80106105 <fetchint+0x25>
80106117:	89 f6                	mov    %esi,%esi
80106119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106120 <fetchstr>:
80106120:	55                   	push   %ebp
80106121:	89 e5                	mov    %esp,%ebp
80106123:	53                   	push   %ebx
80106124:	83 ec 04             	sub    $0x4,%esp
80106127:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010612a:	e8 31 f0 ff ff       	call   80105160 <myproc>
8010612f:	39 18                	cmp    %ebx,(%eax)
80106131:	76 29                	jbe    8010615c <fetchstr+0x3c>
80106133:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106136:	89 da                	mov    %ebx,%edx
80106138:	89 19                	mov    %ebx,(%ecx)
8010613a:	8b 00                	mov    (%eax),%eax
8010613c:	39 c3                	cmp    %eax,%ebx
8010613e:	73 1c                	jae    8010615c <fetchstr+0x3c>
80106140:	80 3b 00             	cmpb   $0x0,(%ebx)
80106143:	75 10                	jne    80106155 <fetchstr+0x35>
80106145:	eb 39                	jmp    80106180 <fetchstr+0x60>
80106147:	89 f6                	mov    %esi,%esi
80106149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106150:	80 3a 00             	cmpb   $0x0,(%edx)
80106153:	74 1b                	je     80106170 <fetchstr+0x50>
80106155:	83 c2 01             	add    $0x1,%edx
80106158:	39 d0                	cmp    %edx,%eax
8010615a:	77 f4                	ja     80106150 <fetchstr+0x30>
8010615c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106161:	83 c4 04             	add    $0x4,%esp
80106164:	5b                   	pop    %ebx
80106165:	5d                   	pop    %ebp
80106166:	c3                   	ret    
80106167:	89 f6                	mov    %esi,%esi
80106169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106170:	83 c4 04             	add    $0x4,%esp
80106173:	89 d0                	mov    %edx,%eax
80106175:	29 d8                	sub    %ebx,%eax
80106177:	5b                   	pop    %ebx
80106178:	5d                   	pop    %ebp
80106179:	c3                   	ret    
8010617a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106180:	31 c0                	xor    %eax,%eax
80106182:	eb dd                	jmp    80106161 <fetchstr+0x41>
80106184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010618a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106190 <argint>:
80106190:	55                   	push   %ebp
80106191:	89 e5                	mov    %esp,%ebp
80106193:	56                   	push   %esi
80106194:	53                   	push   %ebx
80106195:	e8 c6 ef ff ff       	call   80105160 <myproc>
8010619a:	8b 40 18             	mov    0x18(%eax),%eax
8010619d:	8b 55 08             	mov    0x8(%ebp),%edx
801061a0:	8b 40 44             	mov    0x44(%eax),%eax
801061a3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801061a6:	e8 b5 ef ff ff       	call   80105160 <myproc>
801061ab:	8b 00                	mov    (%eax),%eax
801061ad:	8d 73 04             	lea    0x4(%ebx),%esi
801061b0:	39 c6                	cmp    %eax,%esi
801061b2:	73 1c                	jae    801061d0 <argint+0x40>
801061b4:	8d 53 08             	lea    0x8(%ebx),%edx
801061b7:	39 d0                	cmp    %edx,%eax
801061b9:	72 15                	jb     801061d0 <argint+0x40>
801061bb:	8b 45 0c             	mov    0xc(%ebp),%eax
801061be:	8b 53 04             	mov    0x4(%ebx),%edx
801061c1:	89 10                	mov    %edx,(%eax)
801061c3:	31 c0                	xor    %eax,%eax
801061c5:	5b                   	pop    %ebx
801061c6:	5e                   	pop    %esi
801061c7:	5d                   	pop    %ebp
801061c8:	c3                   	ret    
801061c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801061d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801061d5:	eb ee                	jmp    801061c5 <argint+0x35>
801061d7:	89 f6                	mov    %esi,%esi
801061d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801061e0 <argptr>:
801061e0:	55                   	push   %ebp
801061e1:	89 e5                	mov    %esp,%ebp
801061e3:	56                   	push   %esi
801061e4:	53                   	push   %ebx
801061e5:	83 ec 10             	sub    $0x10,%esp
801061e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
801061eb:	e8 70 ef ff ff       	call   80105160 <myproc>
801061f0:	89 c6                	mov    %eax,%esi
801061f2:	8d 45 f4             	lea    -0xc(%ebp),%eax
801061f5:	83 ec 08             	sub    $0x8,%esp
801061f8:	50                   	push   %eax
801061f9:	ff 75 08             	pushl  0x8(%ebp)
801061fc:	e8 8f ff ff ff       	call   80106190 <argint>
80106201:	83 c4 10             	add    $0x10,%esp
80106204:	85 c0                	test   %eax,%eax
80106206:	78 28                	js     80106230 <argptr+0x50>
80106208:	85 db                	test   %ebx,%ebx
8010620a:	78 24                	js     80106230 <argptr+0x50>
8010620c:	8b 16                	mov    (%esi),%edx
8010620e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106211:	39 c2                	cmp    %eax,%edx
80106213:	76 1b                	jbe    80106230 <argptr+0x50>
80106215:	01 c3                	add    %eax,%ebx
80106217:	39 da                	cmp    %ebx,%edx
80106219:	72 15                	jb     80106230 <argptr+0x50>
8010621b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010621e:	89 02                	mov    %eax,(%edx)
80106220:	31 c0                	xor    %eax,%eax
80106222:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106225:	5b                   	pop    %ebx
80106226:	5e                   	pop    %esi
80106227:	5d                   	pop    %ebp
80106228:	c3                   	ret    
80106229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106230:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106235:	eb eb                	jmp    80106222 <argptr+0x42>
80106237:	89 f6                	mov    %esi,%esi
80106239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106240 <argstr>:
80106240:	55                   	push   %ebp
80106241:	89 e5                	mov    %esp,%ebp
80106243:	83 ec 20             	sub    $0x20,%esp
80106246:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106249:	50                   	push   %eax
8010624a:	ff 75 08             	pushl  0x8(%ebp)
8010624d:	e8 3e ff ff ff       	call   80106190 <argint>
80106252:	83 c4 10             	add    $0x10,%esp
80106255:	85 c0                	test   %eax,%eax
80106257:	78 17                	js     80106270 <argstr+0x30>
80106259:	83 ec 08             	sub    $0x8,%esp
8010625c:	ff 75 0c             	pushl  0xc(%ebp)
8010625f:	ff 75 f4             	pushl  -0xc(%ebp)
80106262:	e8 b9 fe ff ff       	call   80106120 <fetchstr>
80106267:	83 c4 10             	add    $0x10,%esp
8010626a:	c9                   	leave  
8010626b:	c3                   	ret    
8010626c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106270:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106275:	c9                   	leave  
80106276:	c3                   	ret    
80106277:	89 f6                	mov    %esi,%esi
80106279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106280 <syscall>:
80106280:	55                   	push   %ebp
80106281:	89 e5                	mov    %esp,%ebp
80106283:	53                   	push   %ebx
80106284:	83 ec 04             	sub    $0x4,%esp
80106287:	e8 d4 ee ff ff       	call   80105160 <myproc>
8010628c:	89 c3                	mov    %eax,%ebx
8010628e:	8b 40 18             	mov    0x18(%eax),%eax
80106291:	8b 40 1c             	mov    0x1c(%eax),%eax
80106294:	8d 50 ff             	lea    -0x1(%eax),%edx
80106297:	83 fa 16             	cmp    $0x16,%edx
8010629a:	77 1c                	ja     801062b8 <syscall+0x38>
8010629c:	8b 14 85 60 9c 10 80 	mov    -0x7fef63a0(,%eax,4),%edx
801062a3:	85 d2                	test   %edx,%edx
801062a5:	74 11                	je     801062b8 <syscall+0x38>
801062a7:	ff d2                	call   *%edx
801062a9:	8b 53 18             	mov    0x18(%ebx),%edx
801062ac:	89 42 1c             	mov    %eax,0x1c(%edx)
801062af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801062b2:	c9                   	leave  
801062b3:	c3                   	ret    
801062b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801062b8:	50                   	push   %eax
801062b9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801062bc:	50                   	push   %eax
801062bd:	ff 73 10             	pushl  0x10(%ebx)
801062c0:	68 31 9c 10 80       	push   $0x80109c31
801062c5:	e8 76 a9 ff ff       	call   80100c40 <cprintf>
801062ca:	8b 43 18             	mov    0x18(%ebx),%eax
801062cd:	83 c4 10             	add    $0x10,%esp
801062d0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
801062d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801062da:	c9                   	leave  
801062db:	c3                   	ret    
801062dc:	66 90                	xchg   %ax,%ax
801062de:	66 90                	xchg   %ax,%ax

801062e0 <create>:
801062e0:	55                   	push   %ebp
801062e1:	89 e5                	mov    %esp,%ebp
801062e3:	57                   	push   %edi
801062e4:	56                   	push   %esi
801062e5:	53                   	push   %ebx
801062e6:	8d 75 da             	lea    -0x26(%ebp),%esi
801062e9:	83 ec 44             	sub    $0x44,%esp
801062ec:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801062ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
801062f2:	56                   	push   %esi
801062f3:	50                   	push   %eax
801062f4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801062f7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
801062fa:	e8 c1 c8 ff ff       	call   80102bc0 <nameiparent>
801062ff:	83 c4 10             	add    $0x10,%esp
80106302:	85 c0                	test   %eax,%eax
80106304:	0f 84 46 01 00 00    	je     80106450 <create+0x170>
8010630a:	83 ec 0c             	sub    $0xc,%esp
8010630d:	89 c3                	mov    %eax,%ebx
8010630f:	50                   	push   %eax
80106310:	e8 2b c0 ff ff       	call   80102340 <ilock>
80106315:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80106318:	83 c4 0c             	add    $0xc,%esp
8010631b:	50                   	push   %eax
8010631c:	56                   	push   %esi
8010631d:	53                   	push   %ebx
8010631e:	e8 4d c5 ff ff       	call   80102870 <dirlookup>
80106323:	83 c4 10             	add    $0x10,%esp
80106326:	85 c0                	test   %eax,%eax
80106328:	89 c7                	mov    %eax,%edi
8010632a:	74 34                	je     80106360 <create+0x80>
8010632c:	83 ec 0c             	sub    $0xc,%esp
8010632f:	53                   	push   %ebx
80106330:	e8 9b c2 ff ff       	call   801025d0 <iunlockput>
80106335:	89 3c 24             	mov    %edi,(%esp)
80106338:	e8 03 c0 ff ff       	call   80102340 <ilock>
8010633d:	83 c4 10             	add    $0x10,%esp
80106340:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80106345:	0f 85 95 00 00 00    	jne    801063e0 <create+0x100>
8010634b:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80106350:	0f 85 8a 00 00 00    	jne    801063e0 <create+0x100>
80106356:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106359:	89 f8                	mov    %edi,%eax
8010635b:	5b                   	pop    %ebx
8010635c:	5e                   	pop    %esi
8010635d:	5f                   	pop    %edi
8010635e:	5d                   	pop    %ebp
8010635f:	c3                   	ret    
80106360:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80106364:	83 ec 08             	sub    $0x8,%esp
80106367:	50                   	push   %eax
80106368:	ff 33                	pushl  (%ebx)
8010636a:	e8 61 be ff ff       	call   801021d0 <ialloc>
8010636f:	83 c4 10             	add    $0x10,%esp
80106372:	85 c0                	test   %eax,%eax
80106374:	89 c7                	mov    %eax,%edi
80106376:	0f 84 e8 00 00 00    	je     80106464 <create+0x184>
8010637c:	83 ec 0c             	sub    $0xc,%esp
8010637f:	50                   	push   %eax
80106380:	e8 bb bf ff ff       	call   80102340 <ilock>
80106385:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80106389:	66 89 47 52          	mov    %ax,0x52(%edi)
8010638d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80106391:	66 89 47 54          	mov    %ax,0x54(%edi)
80106395:	b8 01 00 00 00       	mov    $0x1,%eax
8010639a:	66 89 47 56          	mov    %ax,0x56(%edi)
8010639e:	89 3c 24             	mov    %edi,(%esp)
801063a1:	e8 ea be ff ff       	call   80102290 <iupdate>
801063a6:	83 c4 10             	add    $0x10,%esp
801063a9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801063ae:	74 50                	je     80106400 <create+0x120>
801063b0:	83 ec 04             	sub    $0x4,%esp
801063b3:	ff 77 04             	pushl  0x4(%edi)
801063b6:	56                   	push   %esi
801063b7:	53                   	push   %ebx
801063b8:	e8 23 c7 ff ff       	call   80102ae0 <dirlink>
801063bd:	83 c4 10             	add    $0x10,%esp
801063c0:	85 c0                	test   %eax,%eax
801063c2:	0f 88 8f 00 00 00    	js     80106457 <create+0x177>
801063c8:	83 ec 0c             	sub    $0xc,%esp
801063cb:	53                   	push   %ebx
801063cc:	e8 ff c1 ff ff       	call   801025d0 <iunlockput>
801063d1:	83 c4 10             	add    $0x10,%esp
801063d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801063d7:	89 f8                	mov    %edi,%eax
801063d9:	5b                   	pop    %ebx
801063da:	5e                   	pop    %esi
801063db:	5f                   	pop    %edi
801063dc:	5d                   	pop    %ebp
801063dd:	c3                   	ret    
801063de:	66 90                	xchg   %ax,%ax
801063e0:	83 ec 0c             	sub    $0xc,%esp
801063e3:	57                   	push   %edi
801063e4:	31 ff                	xor    %edi,%edi
801063e6:	e8 e5 c1 ff ff       	call   801025d0 <iunlockput>
801063eb:	83 c4 10             	add    $0x10,%esp
801063ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
801063f1:	89 f8                	mov    %edi,%eax
801063f3:	5b                   	pop    %ebx
801063f4:	5e                   	pop    %esi
801063f5:	5f                   	pop    %edi
801063f6:	5d                   	pop    %ebp
801063f7:	c3                   	ret    
801063f8:	90                   	nop
801063f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106400:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80106405:	83 ec 0c             	sub    $0xc,%esp
80106408:	53                   	push   %ebx
80106409:	e8 82 be ff ff       	call   80102290 <iupdate>
8010640e:	83 c4 0c             	add    $0xc,%esp
80106411:	ff 77 04             	pushl  0x4(%edi)
80106414:	68 dc 9c 10 80       	push   $0x80109cdc
80106419:	57                   	push   %edi
8010641a:	e8 c1 c6 ff ff       	call   80102ae0 <dirlink>
8010641f:	83 c4 10             	add    $0x10,%esp
80106422:	85 c0                	test   %eax,%eax
80106424:	78 1c                	js     80106442 <create+0x162>
80106426:	83 ec 04             	sub    $0x4,%esp
80106429:	ff 73 04             	pushl  0x4(%ebx)
8010642c:	68 db 9c 10 80       	push   $0x80109cdb
80106431:	57                   	push   %edi
80106432:	e8 a9 c6 ff ff       	call   80102ae0 <dirlink>
80106437:	83 c4 10             	add    $0x10,%esp
8010643a:	85 c0                	test   %eax,%eax
8010643c:	0f 89 6e ff ff ff    	jns    801063b0 <create+0xd0>
80106442:	83 ec 0c             	sub    $0xc,%esp
80106445:	68 cf 9c 10 80       	push   $0x80109ccf
8010644a:	e8 21 a5 ff ff       	call   80100970 <panic>
8010644f:	90                   	nop
80106450:	31 ff                	xor    %edi,%edi
80106452:	e9 ff fe ff ff       	jmp    80106356 <create+0x76>
80106457:	83 ec 0c             	sub    $0xc,%esp
8010645a:	68 de 9c 10 80       	push   $0x80109cde
8010645f:	e8 0c a5 ff ff       	call   80100970 <panic>
80106464:	83 ec 0c             	sub    $0xc,%esp
80106467:	68 c0 9c 10 80       	push   $0x80109cc0
8010646c:	e8 ff a4 ff ff       	call   80100970 <panic>
80106471:	eb 0d                	jmp    80106480 <argfd.constprop.0>
80106473:	90                   	nop
80106474:	90                   	nop
80106475:	90                   	nop
80106476:	90                   	nop
80106477:	90                   	nop
80106478:	90                   	nop
80106479:	90                   	nop
8010647a:	90                   	nop
8010647b:	90                   	nop
8010647c:	90                   	nop
8010647d:	90                   	nop
8010647e:	90                   	nop
8010647f:	90                   	nop

80106480 <argfd.constprop.0>:
80106480:	55                   	push   %ebp
80106481:	89 e5                	mov    %esp,%ebp
80106483:	56                   	push   %esi
80106484:	53                   	push   %ebx
80106485:	89 c3                	mov    %eax,%ebx
80106487:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010648a:	89 d6                	mov    %edx,%esi
8010648c:	83 ec 18             	sub    $0x18,%esp
8010648f:	50                   	push   %eax
80106490:	6a 00                	push   $0x0
80106492:	e8 f9 fc ff ff       	call   80106190 <argint>
80106497:	83 c4 10             	add    $0x10,%esp
8010649a:	85 c0                	test   %eax,%eax
8010649c:	78 2a                	js     801064c8 <argfd.constprop.0+0x48>
8010649e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801064a2:	77 24                	ja     801064c8 <argfd.constprop.0+0x48>
801064a4:	e8 b7 ec ff ff       	call   80105160 <myproc>
801064a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
801064ac:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
801064b0:	85 c0                	test   %eax,%eax
801064b2:	74 14                	je     801064c8 <argfd.constprop.0+0x48>
801064b4:	85 db                	test   %ebx,%ebx
801064b6:	74 02                	je     801064ba <argfd.constprop.0+0x3a>
801064b8:	89 13                	mov    %edx,(%ebx)
801064ba:	89 06                	mov    %eax,(%esi)
801064bc:	31 c0                	xor    %eax,%eax
801064be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801064c1:	5b                   	pop    %ebx
801064c2:	5e                   	pop    %esi
801064c3:	5d                   	pop    %ebp
801064c4:	c3                   	ret    
801064c5:	8d 76 00             	lea    0x0(%esi),%esi
801064c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801064cd:	eb ef                	jmp    801064be <argfd.constprop.0+0x3e>
801064cf:	90                   	nop

801064d0 <sys_dup>:
801064d0:	55                   	push   %ebp
801064d1:	31 c0                	xor    %eax,%eax
801064d3:	89 e5                	mov    %esp,%ebp
801064d5:	56                   	push   %esi
801064d6:	53                   	push   %ebx
801064d7:	8d 55 f4             	lea    -0xc(%ebp),%edx
801064da:	83 ec 10             	sub    $0x10,%esp
801064dd:	e8 9e ff ff ff       	call   80106480 <argfd.constprop.0>
801064e2:	85 c0                	test   %eax,%eax
801064e4:	78 42                	js     80106528 <sys_dup+0x58>
801064e6:	8b 75 f4             	mov    -0xc(%ebp),%esi
801064e9:	31 db                	xor    %ebx,%ebx
801064eb:	e8 70 ec ff ff       	call   80105160 <myproc>
801064f0:	eb 0e                	jmp    80106500 <sys_dup+0x30>
801064f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801064f8:	83 c3 01             	add    $0x1,%ebx
801064fb:	83 fb 10             	cmp    $0x10,%ebx
801064fe:	74 28                	je     80106528 <sys_dup+0x58>
80106500:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80106504:	85 d2                	test   %edx,%edx
80106506:	75 f0                	jne    801064f8 <sys_dup+0x28>
80106508:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
8010650c:	83 ec 0c             	sub    $0xc,%esp
8010650f:	ff 75 f4             	pushl  -0xc(%ebp)
80106512:	e8 09 b5 ff ff       	call   80101a20 <filedup>
80106517:	83 c4 10             	add    $0x10,%esp
8010651a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010651d:	89 d8                	mov    %ebx,%eax
8010651f:	5b                   	pop    %ebx
80106520:	5e                   	pop    %esi
80106521:	5d                   	pop    %ebp
80106522:	c3                   	ret    
80106523:	90                   	nop
80106524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106528:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010652b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80106530:	89 d8                	mov    %ebx,%eax
80106532:	5b                   	pop    %ebx
80106533:	5e                   	pop    %esi
80106534:	5d                   	pop    %ebp
80106535:	c3                   	ret    
80106536:	8d 76 00             	lea    0x0(%esi),%esi
80106539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106540 <sys_read>:
80106540:	55                   	push   %ebp
80106541:	31 c0                	xor    %eax,%eax
80106543:	89 e5                	mov    %esp,%ebp
80106545:	83 ec 18             	sub    $0x18,%esp
80106548:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010654b:	e8 30 ff ff ff       	call   80106480 <argfd.constprop.0>
80106550:	85 c0                	test   %eax,%eax
80106552:	78 4c                	js     801065a0 <sys_read+0x60>
80106554:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106557:	83 ec 08             	sub    $0x8,%esp
8010655a:	50                   	push   %eax
8010655b:	6a 02                	push   $0x2
8010655d:	e8 2e fc ff ff       	call   80106190 <argint>
80106562:	83 c4 10             	add    $0x10,%esp
80106565:	85 c0                	test   %eax,%eax
80106567:	78 37                	js     801065a0 <sys_read+0x60>
80106569:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010656c:	83 ec 04             	sub    $0x4,%esp
8010656f:	ff 75 f0             	pushl  -0x10(%ebp)
80106572:	50                   	push   %eax
80106573:	6a 01                	push   $0x1
80106575:	e8 66 fc ff ff       	call   801061e0 <argptr>
8010657a:	83 c4 10             	add    $0x10,%esp
8010657d:	85 c0                	test   %eax,%eax
8010657f:	78 1f                	js     801065a0 <sys_read+0x60>
80106581:	83 ec 04             	sub    $0x4,%esp
80106584:	ff 75 f0             	pushl  -0x10(%ebp)
80106587:	ff 75 f4             	pushl  -0xc(%ebp)
8010658a:	ff 75 ec             	pushl  -0x14(%ebp)
8010658d:	e8 1e b6 ff ff       	call   80101bb0 <fileread>
80106592:	83 c4 10             	add    $0x10,%esp
80106595:	c9                   	leave  
80106596:	c3                   	ret    
80106597:	89 f6                	mov    %esi,%esi
80106599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801065a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801065a5:	c9                   	leave  
801065a6:	c3                   	ret    
801065a7:	89 f6                	mov    %esi,%esi
801065a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801065b0 <sys_write>:
801065b0:	55                   	push   %ebp
801065b1:	31 c0                	xor    %eax,%eax
801065b3:	89 e5                	mov    %esp,%ebp
801065b5:	83 ec 18             	sub    $0x18,%esp
801065b8:	8d 55 ec             	lea    -0x14(%ebp),%edx
801065bb:	e8 c0 fe ff ff       	call   80106480 <argfd.constprop.0>
801065c0:	85 c0                	test   %eax,%eax
801065c2:	78 4c                	js     80106610 <sys_write+0x60>
801065c4:	8d 45 f0             	lea    -0x10(%ebp),%eax
801065c7:	83 ec 08             	sub    $0x8,%esp
801065ca:	50                   	push   %eax
801065cb:	6a 02                	push   $0x2
801065cd:	e8 be fb ff ff       	call   80106190 <argint>
801065d2:	83 c4 10             	add    $0x10,%esp
801065d5:	85 c0                	test   %eax,%eax
801065d7:	78 37                	js     80106610 <sys_write+0x60>
801065d9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801065dc:	83 ec 04             	sub    $0x4,%esp
801065df:	ff 75 f0             	pushl  -0x10(%ebp)
801065e2:	50                   	push   %eax
801065e3:	6a 01                	push   $0x1
801065e5:	e8 f6 fb ff ff       	call   801061e0 <argptr>
801065ea:	83 c4 10             	add    $0x10,%esp
801065ed:	85 c0                	test   %eax,%eax
801065ef:	78 1f                	js     80106610 <sys_write+0x60>
801065f1:	83 ec 04             	sub    $0x4,%esp
801065f4:	ff 75 f0             	pushl  -0x10(%ebp)
801065f7:	ff 75 f4             	pushl  -0xc(%ebp)
801065fa:	ff 75 ec             	pushl  -0x14(%ebp)
801065fd:	e8 6e b6 ff ff       	call   80101c70 <filewrite>
80106602:	83 c4 10             	add    $0x10,%esp
80106605:	c9                   	leave  
80106606:	c3                   	ret    
80106607:	89 f6                	mov    %esi,%esi
80106609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106615:	c9                   	leave  
80106616:	c3                   	ret    
80106617:	89 f6                	mov    %esi,%esi
80106619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106620 <sys_close>:
80106620:	55                   	push   %ebp
80106621:	89 e5                	mov    %esp,%ebp
80106623:	83 ec 18             	sub    $0x18,%esp
80106626:	8d 55 f4             	lea    -0xc(%ebp),%edx
80106629:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010662c:	e8 4f fe ff ff       	call   80106480 <argfd.constprop.0>
80106631:	85 c0                	test   %eax,%eax
80106633:	78 2b                	js     80106660 <sys_close+0x40>
80106635:	e8 26 eb ff ff       	call   80105160 <myproc>
8010663a:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010663d:	83 ec 0c             	sub    $0xc,%esp
80106640:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80106647:	00 
80106648:	ff 75 f4             	pushl  -0xc(%ebp)
8010664b:	e8 20 b4 ff ff       	call   80101a70 <fileclose>
80106650:	83 c4 10             	add    $0x10,%esp
80106653:	31 c0                	xor    %eax,%eax
80106655:	c9                   	leave  
80106656:	c3                   	ret    
80106657:	89 f6                	mov    %esi,%esi
80106659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106660:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106665:	c9                   	leave  
80106666:	c3                   	ret    
80106667:	89 f6                	mov    %esi,%esi
80106669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106670 <sys_fstat>:
80106670:	55                   	push   %ebp
80106671:	31 c0                	xor    %eax,%eax
80106673:	89 e5                	mov    %esp,%ebp
80106675:	83 ec 18             	sub    $0x18,%esp
80106678:	8d 55 f0             	lea    -0x10(%ebp),%edx
8010667b:	e8 00 fe ff ff       	call   80106480 <argfd.constprop.0>
80106680:	85 c0                	test   %eax,%eax
80106682:	78 2c                	js     801066b0 <sys_fstat+0x40>
80106684:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106687:	83 ec 04             	sub    $0x4,%esp
8010668a:	6a 14                	push   $0x14
8010668c:	50                   	push   %eax
8010668d:	6a 01                	push   $0x1
8010668f:	e8 4c fb ff ff       	call   801061e0 <argptr>
80106694:	83 c4 10             	add    $0x10,%esp
80106697:	85 c0                	test   %eax,%eax
80106699:	78 15                	js     801066b0 <sys_fstat+0x40>
8010669b:	83 ec 08             	sub    $0x8,%esp
8010669e:	ff 75 f4             	pushl  -0xc(%ebp)
801066a1:	ff 75 f0             	pushl  -0x10(%ebp)
801066a4:	e8 b7 b4 ff ff       	call   80101b60 <filestat>
801066a9:	83 c4 10             	add    $0x10,%esp
801066ac:	c9                   	leave  
801066ad:	c3                   	ret    
801066ae:	66 90                	xchg   %ax,%ax
801066b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801066b5:	c9                   	leave  
801066b6:	c3                   	ret    
801066b7:	89 f6                	mov    %esi,%esi
801066b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801066c0 <sys_link>:
801066c0:	55                   	push   %ebp
801066c1:	89 e5                	mov    %esp,%ebp
801066c3:	57                   	push   %edi
801066c4:	56                   	push   %esi
801066c5:	53                   	push   %ebx
801066c6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801066c9:	83 ec 34             	sub    $0x34,%esp
801066cc:	50                   	push   %eax
801066cd:	6a 00                	push   $0x0
801066cf:	e8 6c fb ff ff       	call   80106240 <argstr>
801066d4:	83 c4 10             	add    $0x10,%esp
801066d7:	85 c0                	test   %eax,%eax
801066d9:	0f 88 fb 00 00 00    	js     801067da <sys_link+0x11a>
801066df:	8d 45 d0             	lea    -0x30(%ebp),%eax
801066e2:	83 ec 08             	sub    $0x8,%esp
801066e5:	50                   	push   %eax
801066e6:	6a 01                	push   $0x1
801066e8:	e8 53 fb ff ff       	call   80106240 <argstr>
801066ed:	83 c4 10             	add    $0x10,%esp
801066f0:	85 c0                	test   %eax,%eax
801066f2:	0f 88 e2 00 00 00    	js     801067da <sys_link+0x11a>
801066f8:	e8 63 d1 ff ff       	call   80103860 <begin_op>
801066fd:	83 ec 0c             	sub    $0xc,%esp
80106700:	ff 75 d4             	pushl  -0x2c(%ebp)
80106703:	e8 98 c4 ff ff       	call   80102ba0 <namei>
80106708:	83 c4 10             	add    $0x10,%esp
8010670b:	85 c0                	test   %eax,%eax
8010670d:	89 c3                	mov    %eax,%ebx
8010670f:	0f 84 ea 00 00 00    	je     801067ff <sys_link+0x13f>
80106715:	83 ec 0c             	sub    $0xc,%esp
80106718:	50                   	push   %eax
80106719:	e8 22 bc ff ff       	call   80102340 <ilock>
8010671e:	83 c4 10             	add    $0x10,%esp
80106721:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80106726:	0f 84 bb 00 00 00    	je     801067e7 <sys_link+0x127>
8010672c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80106731:	83 ec 0c             	sub    $0xc,%esp
80106734:	8d 7d da             	lea    -0x26(%ebp),%edi
80106737:	53                   	push   %ebx
80106738:	e8 53 bb ff ff       	call   80102290 <iupdate>
8010673d:	89 1c 24             	mov    %ebx,(%esp)
80106740:	e8 db bc ff ff       	call   80102420 <iunlock>
80106745:	58                   	pop    %eax
80106746:	5a                   	pop    %edx
80106747:	57                   	push   %edi
80106748:	ff 75 d0             	pushl  -0x30(%ebp)
8010674b:	e8 70 c4 ff ff       	call   80102bc0 <nameiparent>
80106750:	83 c4 10             	add    $0x10,%esp
80106753:	85 c0                	test   %eax,%eax
80106755:	89 c6                	mov    %eax,%esi
80106757:	74 5b                	je     801067b4 <sys_link+0xf4>
80106759:	83 ec 0c             	sub    $0xc,%esp
8010675c:	50                   	push   %eax
8010675d:	e8 de bb ff ff       	call   80102340 <ilock>
80106762:	83 c4 10             	add    $0x10,%esp
80106765:	8b 03                	mov    (%ebx),%eax
80106767:	39 06                	cmp    %eax,(%esi)
80106769:	75 3d                	jne    801067a8 <sys_link+0xe8>
8010676b:	83 ec 04             	sub    $0x4,%esp
8010676e:	ff 73 04             	pushl  0x4(%ebx)
80106771:	57                   	push   %edi
80106772:	56                   	push   %esi
80106773:	e8 68 c3 ff ff       	call   80102ae0 <dirlink>
80106778:	83 c4 10             	add    $0x10,%esp
8010677b:	85 c0                	test   %eax,%eax
8010677d:	78 29                	js     801067a8 <sys_link+0xe8>
8010677f:	83 ec 0c             	sub    $0xc,%esp
80106782:	56                   	push   %esi
80106783:	e8 48 be ff ff       	call   801025d0 <iunlockput>
80106788:	89 1c 24             	mov    %ebx,(%esp)
8010678b:	e8 e0 bc ff ff       	call   80102470 <iput>
80106790:	e8 3b d1 ff ff       	call   801038d0 <end_op>
80106795:	83 c4 10             	add    $0x10,%esp
80106798:	31 c0                	xor    %eax,%eax
8010679a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010679d:	5b                   	pop    %ebx
8010679e:	5e                   	pop    %esi
8010679f:	5f                   	pop    %edi
801067a0:	5d                   	pop    %ebp
801067a1:	c3                   	ret    
801067a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801067a8:	83 ec 0c             	sub    $0xc,%esp
801067ab:	56                   	push   %esi
801067ac:	e8 1f be ff ff       	call   801025d0 <iunlockput>
801067b1:	83 c4 10             	add    $0x10,%esp
801067b4:	83 ec 0c             	sub    $0xc,%esp
801067b7:	53                   	push   %ebx
801067b8:	e8 83 bb ff ff       	call   80102340 <ilock>
801067bd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
801067c2:	89 1c 24             	mov    %ebx,(%esp)
801067c5:	e8 c6 ba ff ff       	call   80102290 <iupdate>
801067ca:	89 1c 24             	mov    %ebx,(%esp)
801067cd:	e8 fe bd ff ff       	call   801025d0 <iunlockput>
801067d2:	e8 f9 d0 ff ff       	call   801038d0 <end_op>
801067d7:	83 c4 10             	add    $0x10,%esp
801067da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801067dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801067e2:	5b                   	pop    %ebx
801067e3:	5e                   	pop    %esi
801067e4:	5f                   	pop    %edi
801067e5:	5d                   	pop    %ebp
801067e6:	c3                   	ret    
801067e7:	83 ec 0c             	sub    $0xc,%esp
801067ea:	53                   	push   %ebx
801067eb:	e8 e0 bd ff ff       	call   801025d0 <iunlockput>
801067f0:	e8 db d0 ff ff       	call   801038d0 <end_op>
801067f5:	83 c4 10             	add    $0x10,%esp
801067f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801067fd:	eb 9b                	jmp    8010679a <sys_link+0xda>
801067ff:	e8 cc d0 ff ff       	call   801038d0 <end_op>
80106804:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106809:	eb 8f                	jmp    8010679a <sys_link+0xda>
8010680b:	90                   	nop
8010680c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106810 <sys_unlink>:
80106810:	55                   	push   %ebp
80106811:	89 e5                	mov    %esp,%ebp
80106813:	57                   	push   %edi
80106814:	56                   	push   %esi
80106815:	53                   	push   %ebx
80106816:	8d 45 c0             	lea    -0x40(%ebp),%eax
80106819:	83 ec 44             	sub    $0x44,%esp
8010681c:	50                   	push   %eax
8010681d:	6a 00                	push   $0x0
8010681f:	e8 1c fa ff ff       	call   80106240 <argstr>
80106824:	83 c4 10             	add    $0x10,%esp
80106827:	85 c0                	test   %eax,%eax
80106829:	0f 88 77 01 00 00    	js     801069a6 <sys_unlink+0x196>
8010682f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80106832:	e8 29 d0 ff ff       	call   80103860 <begin_op>
80106837:	83 ec 08             	sub    $0x8,%esp
8010683a:	53                   	push   %ebx
8010683b:	ff 75 c0             	pushl  -0x40(%ebp)
8010683e:	e8 7d c3 ff ff       	call   80102bc0 <nameiparent>
80106843:	83 c4 10             	add    $0x10,%esp
80106846:	85 c0                	test   %eax,%eax
80106848:	89 c6                	mov    %eax,%esi
8010684a:	0f 84 60 01 00 00    	je     801069b0 <sys_unlink+0x1a0>
80106850:	83 ec 0c             	sub    $0xc,%esp
80106853:	50                   	push   %eax
80106854:	e8 e7 ba ff ff       	call   80102340 <ilock>
80106859:	58                   	pop    %eax
8010685a:	5a                   	pop    %edx
8010685b:	68 dc 9c 10 80       	push   $0x80109cdc
80106860:	53                   	push   %ebx
80106861:	e8 ea bf ff ff       	call   80102850 <namecmp>
80106866:	83 c4 10             	add    $0x10,%esp
80106869:	85 c0                	test   %eax,%eax
8010686b:	0f 84 03 01 00 00    	je     80106974 <sys_unlink+0x164>
80106871:	83 ec 08             	sub    $0x8,%esp
80106874:	68 db 9c 10 80       	push   $0x80109cdb
80106879:	53                   	push   %ebx
8010687a:	e8 d1 bf ff ff       	call   80102850 <namecmp>
8010687f:	83 c4 10             	add    $0x10,%esp
80106882:	85 c0                	test   %eax,%eax
80106884:	0f 84 ea 00 00 00    	je     80106974 <sys_unlink+0x164>
8010688a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010688d:	83 ec 04             	sub    $0x4,%esp
80106890:	50                   	push   %eax
80106891:	53                   	push   %ebx
80106892:	56                   	push   %esi
80106893:	e8 d8 bf ff ff       	call   80102870 <dirlookup>
80106898:	83 c4 10             	add    $0x10,%esp
8010689b:	85 c0                	test   %eax,%eax
8010689d:	89 c3                	mov    %eax,%ebx
8010689f:	0f 84 cf 00 00 00    	je     80106974 <sys_unlink+0x164>
801068a5:	83 ec 0c             	sub    $0xc,%esp
801068a8:	50                   	push   %eax
801068a9:	e8 92 ba ff ff       	call   80102340 <ilock>
801068ae:	83 c4 10             	add    $0x10,%esp
801068b1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801068b6:	0f 8e 10 01 00 00    	jle    801069cc <sys_unlink+0x1bc>
801068bc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801068c1:	74 6d                	je     80106930 <sys_unlink+0x120>
801068c3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801068c6:	83 ec 04             	sub    $0x4,%esp
801068c9:	6a 10                	push   $0x10
801068cb:	6a 00                	push   $0x0
801068cd:	50                   	push   %eax
801068ce:	e8 fd f4 ff ff       	call   80105dd0 <memset>
801068d3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801068d6:	6a 10                	push   $0x10
801068d8:	ff 75 c4             	pushl  -0x3c(%ebp)
801068db:	50                   	push   %eax
801068dc:	56                   	push   %esi
801068dd:	e8 3e be ff ff       	call   80102720 <writei>
801068e2:	83 c4 20             	add    $0x20,%esp
801068e5:	83 f8 10             	cmp    $0x10,%eax
801068e8:	0f 85 eb 00 00 00    	jne    801069d9 <sys_unlink+0x1c9>
801068ee:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801068f3:	0f 84 97 00 00 00    	je     80106990 <sys_unlink+0x180>
801068f9:	83 ec 0c             	sub    $0xc,%esp
801068fc:	56                   	push   %esi
801068fd:	e8 ce bc ff ff       	call   801025d0 <iunlockput>
80106902:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80106907:	89 1c 24             	mov    %ebx,(%esp)
8010690a:	e8 81 b9 ff ff       	call   80102290 <iupdate>
8010690f:	89 1c 24             	mov    %ebx,(%esp)
80106912:	e8 b9 bc ff ff       	call   801025d0 <iunlockput>
80106917:	e8 b4 cf ff ff       	call   801038d0 <end_op>
8010691c:	83 c4 10             	add    $0x10,%esp
8010691f:	31 c0                	xor    %eax,%eax
80106921:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106924:	5b                   	pop    %ebx
80106925:	5e                   	pop    %esi
80106926:	5f                   	pop    %edi
80106927:	5d                   	pop    %ebp
80106928:	c3                   	ret    
80106929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106930:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80106934:	76 8d                	jbe    801068c3 <sys_unlink+0xb3>
80106936:	bf 20 00 00 00       	mov    $0x20,%edi
8010693b:	eb 0f                	jmp    8010694c <sys_unlink+0x13c>
8010693d:	8d 76 00             	lea    0x0(%esi),%esi
80106940:	83 c7 10             	add    $0x10,%edi
80106943:	3b 7b 58             	cmp    0x58(%ebx),%edi
80106946:	0f 83 77 ff ff ff    	jae    801068c3 <sys_unlink+0xb3>
8010694c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010694f:	6a 10                	push   $0x10
80106951:	57                   	push   %edi
80106952:	50                   	push   %eax
80106953:	53                   	push   %ebx
80106954:	e8 c7 bc ff ff       	call   80102620 <readi>
80106959:	83 c4 10             	add    $0x10,%esp
8010695c:	83 f8 10             	cmp    $0x10,%eax
8010695f:	75 5e                	jne    801069bf <sys_unlink+0x1af>
80106961:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80106966:	74 d8                	je     80106940 <sys_unlink+0x130>
80106968:	83 ec 0c             	sub    $0xc,%esp
8010696b:	53                   	push   %ebx
8010696c:	e8 5f bc ff ff       	call   801025d0 <iunlockput>
80106971:	83 c4 10             	add    $0x10,%esp
80106974:	83 ec 0c             	sub    $0xc,%esp
80106977:	56                   	push   %esi
80106978:	e8 53 bc ff ff       	call   801025d0 <iunlockput>
8010697d:	e8 4e cf ff ff       	call   801038d0 <end_op>
80106982:	83 c4 10             	add    $0x10,%esp
80106985:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010698a:	eb 95                	jmp    80106921 <sys_unlink+0x111>
8010698c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106990:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
80106995:	83 ec 0c             	sub    $0xc,%esp
80106998:	56                   	push   %esi
80106999:	e8 f2 b8 ff ff       	call   80102290 <iupdate>
8010699e:	83 c4 10             	add    $0x10,%esp
801069a1:	e9 53 ff ff ff       	jmp    801068f9 <sys_unlink+0xe9>
801069a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801069ab:	e9 71 ff ff ff       	jmp    80106921 <sys_unlink+0x111>
801069b0:	e8 1b cf ff ff       	call   801038d0 <end_op>
801069b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801069ba:	e9 62 ff ff ff       	jmp    80106921 <sys_unlink+0x111>
801069bf:	83 ec 0c             	sub    $0xc,%esp
801069c2:	68 00 9d 10 80       	push   $0x80109d00
801069c7:	e8 a4 9f ff ff       	call   80100970 <panic>
801069cc:	83 ec 0c             	sub    $0xc,%esp
801069cf:	68 ee 9c 10 80       	push   $0x80109cee
801069d4:	e8 97 9f ff ff       	call   80100970 <panic>
801069d9:	83 ec 0c             	sub    $0xc,%esp
801069dc:	68 12 9d 10 80       	push   $0x80109d12
801069e1:	e8 8a 9f ff ff       	call   80100970 <panic>
801069e6:	8d 76 00             	lea    0x0(%esi),%esi
801069e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069f0 <sys_open>:
801069f0:	55                   	push   %ebp
801069f1:	89 e5                	mov    %esp,%ebp
801069f3:	57                   	push   %edi
801069f4:	56                   	push   %esi
801069f5:	53                   	push   %ebx
801069f6:	8d 45 e0             	lea    -0x20(%ebp),%eax
801069f9:	83 ec 24             	sub    $0x24,%esp
801069fc:	50                   	push   %eax
801069fd:	6a 00                	push   $0x0
801069ff:	e8 3c f8 ff ff       	call   80106240 <argstr>
80106a04:	83 c4 10             	add    $0x10,%esp
80106a07:	85 c0                	test   %eax,%eax
80106a09:	0f 88 1d 01 00 00    	js     80106b2c <sys_open+0x13c>
80106a0f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80106a12:	83 ec 08             	sub    $0x8,%esp
80106a15:	50                   	push   %eax
80106a16:	6a 01                	push   $0x1
80106a18:	e8 73 f7 ff ff       	call   80106190 <argint>
80106a1d:	83 c4 10             	add    $0x10,%esp
80106a20:	85 c0                	test   %eax,%eax
80106a22:	0f 88 04 01 00 00    	js     80106b2c <sys_open+0x13c>
80106a28:	e8 33 ce ff ff       	call   80103860 <begin_op>
80106a2d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80106a31:	0f 85 a9 00 00 00    	jne    80106ae0 <sys_open+0xf0>
80106a37:	83 ec 0c             	sub    $0xc,%esp
80106a3a:	ff 75 e0             	pushl  -0x20(%ebp)
80106a3d:	e8 5e c1 ff ff       	call   80102ba0 <namei>
80106a42:	83 c4 10             	add    $0x10,%esp
80106a45:	85 c0                	test   %eax,%eax
80106a47:	89 c6                	mov    %eax,%esi
80106a49:	0f 84 b2 00 00 00    	je     80106b01 <sys_open+0x111>
80106a4f:	83 ec 0c             	sub    $0xc,%esp
80106a52:	50                   	push   %eax
80106a53:	e8 e8 b8 ff ff       	call   80102340 <ilock>
80106a58:	83 c4 10             	add    $0x10,%esp
80106a5b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80106a60:	0f 84 aa 00 00 00    	je     80106b10 <sys_open+0x120>
80106a66:	e8 45 af ff ff       	call   801019b0 <filealloc>
80106a6b:	85 c0                	test   %eax,%eax
80106a6d:	89 c7                	mov    %eax,%edi
80106a6f:	0f 84 a6 00 00 00    	je     80106b1b <sys_open+0x12b>
80106a75:	e8 e6 e6 ff ff       	call   80105160 <myproc>
80106a7a:	31 db                	xor    %ebx,%ebx
80106a7c:	eb 0e                	jmp    80106a8c <sys_open+0x9c>
80106a7e:	66 90                	xchg   %ax,%ax
80106a80:	83 c3 01             	add    $0x1,%ebx
80106a83:	83 fb 10             	cmp    $0x10,%ebx
80106a86:	0f 84 ac 00 00 00    	je     80106b38 <sys_open+0x148>
80106a8c:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80106a90:	85 d2                	test   %edx,%edx
80106a92:	75 ec                	jne    80106a80 <sys_open+0x90>
80106a94:	83 ec 0c             	sub    $0xc,%esp
80106a97:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
80106a9b:	56                   	push   %esi
80106a9c:	e8 7f b9 ff ff       	call   80102420 <iunlock>
80106aa1:	e8 2a ce ff ff       	call   801038d0 <end_op>
80106aa6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
80106aac:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106aaf:	83 c4 10             	add    $0x10,%esp
80106ab2:	89 77 14             	mov    %esi,0x14(%edi)
80106ab5:	c7 47 1c 00 00 00 00 	movl   $0x0,0x1c(%edi)
80106abc:	89 d0                	mov    %edx,%eax
80106abe:	f7 d0                	not    %eax
80106ac0:	83 e0 01             	and    $0x1,%eax
80106ac3:	83 e2 03             	and    $0x3,%edx
80106ac6:	88 47 08             	mov    %al,0x8(%edi)
80106ac9:	0f 95 47 09          	setne  0x9(%edi)
80106acd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ad0:	89 d8                	mov    %ebx,%eax
80106ad2:	5b                   	pop    %ebx
80106ad3:	5e                   	pop    %esi
80106ad4:	5f                   	pop    %edi
80106ad5:	5d                   	pop    %ebp
80106ad6:	c3                   	ret    
80106ad7:	89 f6                	mov    %esi,%esi
80106ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106ae0:	83 ec 0c             	sub    $0xc,%esp
80106ae3:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ae6:	31 c9                	xor    %ecx,%ecx
80106ae8:	6a 00                	push   $0x0
80106aea:	ba 02 00 00 00       	mov    $0x2,%edx
80106aef:	e8 ec f7 ff ff       	call   801062e0 <create>
80106af4:	83 c4 10             	add    $0x10,%esp
80106af7:	85 c0                	test   %eax,%eax
80106af9:	89 c6                	mov    %eax,%esi
80106afb:	0f 85 65 ff ff ff    	jne    80106a66 <sys_open+0x76>
80106b01:	e8 ca cd ff ff       	call   801038d0 <end_op>
80106b06:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80106b0b:	eb c0                	jmp    80106acd <sys_open+0xdd>
80106b0d:	8d 76 00             	lea    0x0(%esi),%esi
80106b10:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106b13:	85 c9                	test   %ecx,%ecx
80106b15:	0f 84 4b ff ff ff    	je     80106a66 <sys_open+0x76>
80106b1b:	83 ec 0c             	sub    $0xc,%esp
80106b1e:	56                   	push   %esi
80106b1f:	e8 ac ba ff ff       	call   801025d0 <iunlockput>
80106b24:	e8 a7 cd ff ff       	call   801038d0 <end_op>
80106b29:	83 c4 10             	add    $0x10,%esp
80106b2c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80106b31:	eb 9a                	jmp    80106acd <sys_open+0xdd>
80106b33:	90                   	nop
80106b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106b38:	83 ec 0c             	sub    $0xc,%esp
80106b3b:	57                   	push   %edi
80106b3c:	e8 2f af ff ff       	call   80101a70 <fileclose>
80106b41:	83 c4 10             	add    $0x10,%esp
80106b44:	eb d5                	jmp    80106b1b <sys_open+0x12b>
80106b46:	8d 76 00             	lea    0x0(%esi),%esi
80106b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b50 <sys_mkdir>:
80106b50:	55                   	push   %ebp
80106b51:	89 e5                	mov    %esp,%ebp
80106b53:	83 ec 18             	sub    $0x18,%esp
80106b56:	e8 05 cd ff ff       	call   80103860 <begin_op>
80106b5b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106b5e:	83 ec 08             	sub    $0x8,%esp
80106b61:	50                   	push   %eax
80106b62:	6a 00                	push   $0x0
80106b64:	e8 d7 f6 ff ff       	call   80106240 <argstr>
80106b69:	83 c4 10             	add    $0x10,%esp
80106b6c:	85 c0                	test   %eax,%eax
80106b6e:	78 30                	js     80106ba0 <sys_mkdir+0x50>
80106b70:	83 ec 0c             	sub    $0xc,%esp
80106b73:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106b76:	31 c9                	xor    %ecx,%ecx
80106b78:	6a 00                	push   $0x0
80106b7a:	ba 01 00 00 00       	mov    $0x1,%edx
80106b7f:	e8 5c f7 ff ff       	call   801062e0 <create>
80106b84:	83 c4 10             	add    $0x10,%esp
80106b87:	85 c0                	test   %eax,%eax
80106b89:	74 15                	je     80106ba0 <sys_mkdir+0x50>
80106b8b:	83 ec 0c             	sub    $0xc,%esp
80106b8e:	50                   	push   %eax
80106b8f:	e8 3c ba ff ff       	call   801025d0 <iunlockput>
80106b94:	e8 37 cd ff ff       	call   801038d0 <end_op>
80106b99:	83 c4 10             	add    $0x10,%esp
80106b9c:	31 c0                	xor    %eax,%eax
80106b9e:	c9                   	leave  
80106b9f:	c3                   	ret    
80106ba0:	e8 2b cd ff ff       	call   801038d0 <end_op>
80106ba5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106baa:	c9                   	leave  
80106bab:	c3                   	ret    
80106bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106bb0 <sys_mknod>:
80106bb0:	55                   	push   %ebp
80106bb1:	89 e5                	mov    %esp,%ebp
80106bb3:	83 ec 18             	sub    $0x18,%esp
80106bb6:	e8 a5 cc ff ff       	call   80103860 <begin_op>
80106bbb:	8d 45 ec             	lea    -0x14(%ebp),%eax
80106bbe:	83 ec 08             	sub    $0x8,%esp
80106bc1:	50                   	push   %eax
80106bc2:	6a 00                	push   $0x0
80106bc4:	e8 77 f6 ff ff       	call   80106240 <argstr>
80106bc9:	83 c4 10             	add    $0x10,%esp
80106bcc:	85 c0                	test   %eax,%eax
80106bce:	78 60                	js     80106c30 <sys_mknod+0x80>
80106bd0:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106bd3:	83 ec 08             	sub    $0x8,%esp
80106bd6:	50                   	push   %eax
80106bd7:	6a 01                	push   $0x1
80106bd9:	e8 b2 f5 ff ff       	call   80106190 <argint>
80106bde:	83 c4 10             	add    $0x10,%esp
80106be1:	85 c0                	test   %eax,%eax
80106be3:	78 4b                	js     80106c30 <sys_mknod+0x80>
80106be5:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106be8:	83 ec 08             	sub    $0x8,%esp
80106beb:	50                   	push   %eax
80106bec:	6a 02                	push   $0x2
80106bee:	e8 9d f5 ff ff       	call   80106190 <argint>
80106bf3:	83 c4 10             	add    $0x10,%esp
80106bf6:	85 c0                	test   %eax,%eax
80106bf8:	78 36                	js     80106c30 <sys_mknod+0x80>
80106bfa:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
80106bfe:	83 ec 0c             	sub    $0xc,%esp
80106c01:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80106c05:	ba 03 00 00 00       	mov    $0x3,%edx
80106c0a:	50                   	push   %eax
80106c0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80106c0e:	e8 cd f6 ff ff       	call   801062e0 <create>
80106c13:	83 c4 10             	add    $0x10,%esp
80106c16:	85 c0                	test   %eax,%eax
80106c18:	74 16                	je     80106c30 <sys_mknod+0x80>
80106c1a:	83 ec 0c             	sub    $0xc,%esp
80106c1d:	50                   	push   %eax
80106c1e:	e8 ad b9 ff ff       	call   801025d0 <iunlockput>
80106c23:	e8 a8 cc ff ff       	call   801038d0 <end_op>
80106c28:	83 c4 10             	add    $0x10,%esp
80106c2b:	31 c0                	xor    %eax,%eax
80106c2d:	c9                   	leave  
80106c2e:	c3                   	ret    
80106c2f:	90                   	nop
80106c30:	e8 9b cc ff ff       	call   801038d0 <end_op>
80106c35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106c3a:	c9                   	leave  
80106c3b:	c3                   	ret    
80106c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106c40 <sys_chdir>:
80106c40:	55                   	push   %ebp
80106c41:	89 e5                	mov    %esp,%ebp
80106c43:	56                   	push   %esi
80106c44:	53                   	push   %ebx
80106c45:	83 ec 10             	sub    $0x10,%esp
80106c48:	e8 13 e5 ff ff       	call   80105160 <myproc>
80106c4d:	89 c6                	mov    %eax,%esi
80106c4f:	e8 0c cc ff ff       	call   80103860 <begin_op>
80106c54:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106c57:	83 ec 08             	sub    $0x8,%esp
80106c5a:	50                   	push   %eax
80106c5b:	6a 00                	push   $0x0
80106c5d:	e8 de f5 ff ff       	call   80106240 <argstr>
80106c62:	83 c4 10             	add    $0x10,%esp
80106c65:	85 c0                	test   %eax,%eax
80106c67:	78 77                	js     80106ce0 <sys_chdir+0xa0>
80106c69:	83 ec 0c             	sub    $0xc,%esp
80106c6c:	ff 75 f4             	pushl  -0xc(%ebp)
80106c6f:	e8 2c bf ff ff       	call   80102ba0 <namei>
80106c74:	83 c4 10             	add    $0x10,%esp
80106c77:	85 c0                	test   %eax,%eax
80106c79:	89 c3                	mov    %eax,%ebx
80106c7b:	74 63                	je     80106ce0 <sys_chdir+0xa0>
80106c7d:	83 ec 0c             	sub    $0xc,%esp
80106c80:	50                   	push   %eax
80106c81:	e8 ba b6 ff ff       	call   80102340 <ilock>
80106c86:	83 c4 10             	add    $0x10,%esp
80106c89:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80106c8e:	75 30                	jne    80106cc0 <sys_chdir+0x80>
80106c90:	83 ec 0c             	sub    $0xc,%esp
80106c93:	53                   	push   %ebx
80106c94:	e8 87 b7 ff ff       	call   80102420 <iunlock>
80106c99:	58                   	pop    %eax
80106c9a:	ff 76 68             	pushl  0x68(%esi)
80106c9d:	e8 ce b7 ff ff       	call   80102470 <iput>
80106ca2:	e8 29 cc ff ff       	call   801038d0 <end_op>
80106ca7:	89 5e 68             	mov    %ebx,0x68(%esi)
80106caa:	83 c4 10             	add    $0x10,%esp
80106cad:	31 c0                	xor    %eax,%eax
80106caf:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106cb2:	5b                   	pop    %ebx
80106cb3:	5e                   	pop    %esi
80106cb4:	5d                   	pop    %ebp
80106cb5:	c3                   	ret    
80106cb6:	8d 76 00             	lea    0x0(%esi),%esi
80106cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106cc0:	83 ec 0c             	sub    $0xc,%esp
80106cc3:	53                   	push   %ebx
80106cc4:	e8 07 b9 ff ff       	call   801025d0 <iunlockput>
80106cc9:	e8 02 cc ff ff       	call   801038d0 <end_op>
80106cce:	83 c4 10             	add    $0x10,%esp
80106cd1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106cd6:	eb d7                	jmp    80106caf <sys_chdir+0x6f>
80106cd8:	90                   	nop
80106cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ce0:	e8 eb cb ff ff       	call   801038d0 <end_op>
80106ce5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106cea:	eb c3                	jmp    80106caf <sys_chdir+0x6f>
80106cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106cf0 <sys_exec>:
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	57                   	push   %edi
80106cf4:	56                   	push   %esi
80106cf5:	53                   	push   %ebx
80106cf6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80106cfc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80106d02:	50                   	push   %eax
80106d03:	6a 00                	push   $0x0
80106d05:	e8 36 f5 ff ff       	call   80106240 <argstr>
80106d0a:	83 c4 10             	add    $0x10,%esp
80106d0d:	85 c0                	test   %eax,%eax
80106d0f:	0f 88 87 00 00 00    	js     80106d9c <sys_exec+0xac>
80106d15:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80106d1b:	83 ec 08             	sub    $0x8,%esp
80106d1e:	50                   	push   %eax
80106d1f:	6a 01                	push   $0x1
80106d21:	e8 6a f4 ff ff       	call   80106190 <argint>
80106d26:	83 c4 10             	add    $0x10,%esp
80106d29:	85 c0                	test   %eax,%eax
80106d2b:	78 6f                	js     80106d9c <sys_exec+0xac>
80106d2d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80106d33:	83 ec 04             	sub    $0x4,%esp
80106d36:	31 db                	xor    %ebx,%ebx
80106d38:	68 80 00 00 00       	push   $0x80
80106d3d:	6a 00                	push   $0x0
80106d3f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80106d45:	50                   	push   %eax
80106d46:	e8 85 f0 ff ff       	call   80105dd0 <memset>
80106d4b:	83 c4 10             	add    $0x10,%esp
80106d4e:	eb 2c                	jmp    80106d7c <sys_exec+0x8c>
80106d50:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80106d56:	85 c0                	test   %eax,%eax
80106d58:	74 56                	je     80106db0 <sys_exec+0xc0>
80106d5a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80106d60:	83 ec 08             	sub    $0x8,%esp
80106d63:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80106d66:	52                   	push   %edx
80106d67:	50                   	push   %eax
80106d68:	e8 b3 f3 ff ff       	call   80106120 <fetchstr>
80106d6d:	83 c4 10             	add    $0x10,%esp
80106d70:	85 c0                	test   %eax,%eax
80106d72:	78 28                	js     80106d9c <sys_exec+0xac>
80106d74:	83 c3 01             	add    $0x1,%ebx
80106d77:	83 fb 20             	cmp    $0x20,%ebx
80106d7a:	74 20                	je     80106d9c <sys_exec+0xac>
80106d7c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80106d82:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80106d89:	83 ec 08             	sub    $0x8,%esp
80106d8c:	57                   	push   %edi
80106d8d:	01 f0                	add    %esi,%eax
80106d8f:	50                   	push   %eax
80106d90:	e8 4b f3 ff ff       	call   801060e0 <fetchint>
80106d95:	83 c4 10             	add    $0x10,%esp
80106d98:	85 c0                	test   %eax,%eax
80106d9a:	79 b4                	jns    80106d50 <sys_exec+0x60>
80106d9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d9f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106da4:	5b                   	pop    %ebx
80106da5:	5e                   	pop    %esi
80106da6:	5f                   	pop    %edi
80106da7:	5d                   	pop    %ebp
80106da8:	c3                   	ret    
80106da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106db0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80106db6:	83 ec 08             	sub    $0x8,%esp
80106db9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80106dc0:	00 00 00 00 
80106dc4:	50                   	push   %eax
80106dc5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
80106dcb:	e8 20 a2 ff ff       	call   80100ff0 <exec>
80106dd0:	83 c4 10             	add    $0x10,%esp
80106dd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dd6:	5b                   	pop    %ebx
80106dd7:	5e                   	pop    %esi
80106dd8:	5f                   	pop    %edi
80106dd9:	5d                   	pop    %ebp
80106dda:	c3                   	ret    
80106ddb:	90                   	nop
80106ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106de0 <sys_pipe>:
80106de0:	55                   	push   %ebp
80106de1:	89 e5                	mov    %esp,%ebp
80106de3:	57                   	push   %edi
80106de4:	56                   	push   %esi
80106de5:	53                   	push   %ebx
80106de6:	8d 45 dc             	lea    -0x24(%ebp),%eax
80106de9:	83 ec 20             	sub    $0x20,%esp
80106dec:	6a 08                	push   $0x8
80106dee:	50                   	push   %eax
80106def:	6a 00                	push   $0x0
80106df1:	e8 ea f3 ff ff       	call   801061e0 <argptr>
80106df6:	83 c4 10             	add    $0x10,%esp
80106df9:	85 c0                	test   %eax,%eax
80106dfb:	0f 88 ae 00 00 00    	js     80106eaf <sys_pipe+0xcf>
80106e01:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80106e04:	83 ec 08             	sub    $0x8,%esp
80106e07:	50                   	push   %eax
80106e08:	8d 45 e0             	lea    -0x20(%ebp),%eax
80106e0b:	50                   	push   %eax
80106e0c:	e8 af dd ff ff       	call   80104bc0 <pipealloc>
80106e11:	83 c4 10             	add    $0x10,%esp
80106e14:	85 c0                	test   %eax,%eax
80106e16:	0f 88 93 00 00 00    	js     80106eaf <sys_pipe+0xcf>
80106e1c:	8b 7d e0             	mov    -0x20(%ebp),%edi
80106e1f:	31 db                	xor    %ebx,%ebx
80106e21:	e8 3a e3 ff ff       	call   80105160 <myproc>
80106e26:	eb 10                	jmp    80106e38 <sys_pipe+0x58>
80106e28:	90                   	nop
80106e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e30:	83 c3 01             	add    $0x1,%ebx
80106e33:	83 fb 10             	cmp    $0x10,%ebx
80106e36:	74 60                	je     80106e98 <sys_pipe+0xb8>
80106e38:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80106e3c:	85 f6                	test   %esi,%esi
80106e3e:	75 f0                	jne    80106e30 <sys_pipe+0x50>
80106e40:	8d 73 08             	lea    0x8(%ebx),%esi
80106e43:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80106e47:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106e4a:	e8 11 e3 ff ff       	call   80105160 <myproc>
80106e4f:	31 d2                	xor    %edx,%edx
80106e51:	eb 0d                	jmp    80106e60 <sys_pipe+0x80>
80106e53:	90                   	nop
80106e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e58:	83 c2 01             	add    $0x1,%edx
80106e5b:	83 fa 10             	cmp    $0x10,%edx
80106e5e:	74 28                	je     80106e88 <sys_pipe+0xa8>
80106e60:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80106e64:	85 c9                	test   %ecx,%ecx
80106e66:	75 f0                	jne    80106e58 <sys_pipe+0x78>
80106e68:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80106e6c:	8b 45 dc             	mov    -0x24(%ebp),%eax
80106e6f:	89 18                	mov    %ebx,(%eax)
80106e71:	8b 45 dc             	mov    -0x24(%ebp),%eax
80106e74:	89 50 04             	mov    %edx,0x4(%eax)
80106e77:	31 c0                	xor    %eax,%eax
80106e79:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e7c:	5b                   	pop    %ebx
80106e7d:	5e                   	pop    %esi
80106e7e:	5f                   	pop    %edi
80106e7f:	5d                   	pop    %ebp
80106e80:	c3                   	ret    
80106e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e88:	e8 d3 e2 ff ff       	call   80105160 <myproc>
80106e8d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80106e94:	00 
80106e95:	8d 76 00             	lea    0x0(%esi),%esi
80106e98:	83 ec 0c             	sub    $0xc,%esp
80106e9b:	ff 75 e0             	pushl  -0x20(%ebp)
80106e9e:	e8 cd ab ff ff       	call   80101a70 <fileclose>
80106ea3:	58                   	pop    %eax
80106ea4:	ff 75 e4             	pushl  -0x1c(%ebp)
80106ea7:	e8 c4 ab ff ff       	call   80101a70 <fileclose>
80106eac:	83 c4 10             	add    $0x10,%esp
80106eaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106eb4:	eb c3                	jmp    80106e79 <sys_pipe+0x99>
80106eb6:	8d 76 00             	lea    0x0(%esi),%esi
80106eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ec0 <sys_connect>:
80106ec0:	55                   	push   %ebp
80106ec1:	89 e5                	mov    %esp,%ebp
80106ec3:	53                   	push   %ebx
80106ec4:	8d 45 ec             	lea    -0x14(%ebp),%eax
80106ec7:	83 ec 1c             	sub    $0x1c,%esp
80106eca:	50                   	push   %eax
80106ecb:	6a 00                	push   $0x0
80106ecd:	e8 be f2 ff ff       	call   80106190 <argint>
80106ed2:	83 c4 10             	add    $0x10,%esp
80106ed5:	85 c0                	test   %eax,%eax
80106ed7:	0f 88 81 00 00 00    	js     80106f5e <sys_connect+0x9e>
80106edd:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106ee0:	83 ec 08             	sub    $0x8,%esp
80106ee3:	50                   	push   %eax
80106ee4:	6a 01                	push   $0x1
80106ee6:	e8 a5 f2 ff ff       	call   80106190 <argint>
80106eeb:	83 c4 10             	add    $0x10,%esp
80106eee:	85 c0                	test   %eax,%eax
80106ef0:	78 6c                	js     80106f5e <sys_connect+0x9e>
80106ef2:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106ef5:	83 ec 08             	sub    $0x8,%esp
80106ef8:	50                   	push   %eax
80106ef9:	6a 02                	push   $0x2
80106efb:	e8 90 f2 ff ff       	call   80106190 <argint>
80106f00:	83 c4 10             	add    $0x10,%esp
80106f03:	85 c0                	test   %eax,%eax
80106f05:	78 57                	js     80106f5e <sys_connect+0x9e>
80106f07:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
80106f0b:	50                   	push   %eax
80106f0c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
80106f10:	50                   	push   %eax
80106f11:	8d 45 e8             	lea    -0x18(%ebp),%eax
80106f14:	ff 75 ec             	pushl  -0x14(%ebp)
80106f17:	50                   	push   %eax
80106f18:	e8 73 00 00 00       	call   80106f90 <sockalloc>
80106f1d:	83 c4 10             	add    $0x10,%esp
80106f20:	85 c0                	test   %eax,%eax
80106f22:	78 3a                	js     80106f5e <sys_connect+0x9e>
80106f24:	8b 5d e8             	mov    -0x18(%ebp),%ebx
80106f27:	e8 34 e2 ff ff       	call   80105160 <myproc>
80106f2c:	31 d2                	xor    %edx,%edx
80106f2e:	eb 08                	jmp    80106f38 <sys_connect+0x78>
80106f30:	83 c2 01             	add    $0x1,%edx
80106f33:	83 fa 10             	cmp    $0x10,%edx
80106f36:	74 18                	je     80106f50 <sys_connect+0x90>
80106f38:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80106f3c:	85 c9                	test   %ecx,%ecx
80106f3e:	75 f0                	jne    80106f30 <sys_connect+0x70>
80106f40:	89 5c 90 28          	mov    %ebx,0x28(%eax,%edx,4)
80106f44:	89 d0                	mov    %edx,%eax
80106f46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106f49:	c9                   	leave  
80106f4a:	c3                   	ret    
80106f4b:	90                   	nop
80106f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106f50:	83 ec 0c             	sub    $0xc,%esp
80106f53:	ff 75 e8             	pushl  -0x18(%ebp)
80106f56:	e8 15 ab ff ff       	call   80101a70 <fileclose>
80106f5b:	83 c4 10             	add    $0x10,%esp
80106f5e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106f63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106f66:	89 d0                	mov    %edx,%eax
80106f68:	c9                   	leave  
80106f69:	c3                   	ret    
80106f6a:	66 90                	xchg   %ax,%ax
80106f6c:	66 90                	xchg   %ax,%ax
80106f6e:	66 90                	xchg   %ax,%ax

80106f70 <sockinit>:
80106f70:	55                   	push   %ebp
80106f71:	89 e5                	mov    %esp,%ebp
80106f73:	83 ec 10             	sub    $0x10,%esp
80106f76:	68 21 9d 10 80       	push   $0x80109d21
80106f7b:	68 20 3e 15 80       	push   $0x80153e20
80106f80:	e8 db eb ff ff       	call   80105b60 <initlock>
80106f85:	83 c4 10             	add    $0x10,%esp
80106f88:	c9                   	leave  
80106f89:	c3                   	ret    
80106f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f90 <sockalloc>:
80106f90:	55                   	push   %ebp
80106f91:	89 e5                	mov    %esp,%ebp
80106f93:	57                   	push   %edi
80106f94:	56                   	push   %esi
80106f95:	53                   	push   %ebx
80106f96:	83 ec 1c             	sub    $0x1c,%esp
80106f99:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106f9c:	8b 45 14             	mov    0x14(%ebp),%eax
80106f9f:	8b 7d 10             	mov    0x10(%ebp),%edi
80106fa2:	8b 75 0c             	mov    0xc(%ebp),%esi
80106fa5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80106fab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106fae:	66 89 7d e0          	mov    %di,-0x20(%ebp)
80106fb2:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
80106fb6:	e8 f5 a9 ff ff       	call   801019b0 <filealloc>
80106fbb:	85 c0                	test   %eax,%eax
80106fbd:	89 03                	mov    %eax,(%ebx)
80106fbf:	0f 84 e9 00 00 00    	je     801070ae <sockalloc+0x11e>
80106fc5:	e8 b6 c1 ff ff       	call   80103180 <kalloc>
80106fca:	85 c0                	test   %eax,%eax
80106fcc:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106fcf:	0f 84 c7 00 00 00    	je     8010709c <sockalloc+0x10c>
80106fd5:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
80106fd9:	52                   	push   %edx
80106fda:	0f b7 d7             	movzwl %di,%edx
80106fdd:	52                   	push   %edx
80106fde:	56                   	push   %esi
80106fdf:	68 d4 9d 10 80       	push   $0x80109dd4
80106fe4:	e8 57 9c ff ff       	call   80100c40 <cprintf>
80106fe9:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
80106fed:	8b 45 dc             	mov    -0x24(%ebp),%eax
80106ff0:	89 70 04             	mov    %esi,0x4(%eax)
80106ff3:	66 89 78 08          	mov    %di,0x8(%eax)
80106ff7:	66 89 48 0a          	mov    %cx,0xa(%eax)
80106ffb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ffe:	5a                   	pop    %edx
80106fff:	8d 50 0c             	lea    0xc(%eax),%edx
80107002:	59                   	pop    %ecx
80107003:	68 29 9d 10 80       	push   $0x80109d29
80107008:	52                   	push   %edx
80107009:	e8 52 eb ff ff       	call   80105b60 <initlock>
8010700e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107011:	8d 50 40             	lea    0x40(%eax),%edx
80107014:	89 14 24             	mov    %edx,(%esp)
80107017:	e8 64 d1 ff ff       	call   80104180 <mbufq_init>
8010701c:	8b 13                	mov    (%ebx),%edx
8010701e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107021:	c7 02 04 00 00 00    	movl   $0x4,(%edx)
80107027:	8b 13                	mov    (%ebx),%edx
80107029:	c6 42 08 01          	movb   $0x1,0x8(%edx)
8010702d:	8b 13                	mov    (%ebx),%edx
8010702f:	c6 42 09 01          	movb   $0x1,0x9(%edx)
80107033:	8b 13                	mov    (%ebx),%edx
80107035:	89 42 18             	mov    %eax,0x18(%edx)
80107038:	c7 04 24 20 3e 15 80 	movl   $0x80153e20,(%esp)
8010703f:	e8 0c ec ff ff       	call   80105c50 <acquire>
80107044:	8b 0d 00 3e 15 80    	mov    0x80153e00,%ecx
8010704a:	83 c4 10             	add    $0x10,%esp
8010704d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107050:	85 c9                	test   %ecx,%ecx
80107052:	74 6c                	je     801070c0 <sockalloc+0x130>
80107054:	89 ca                	mov    %ecx,%edx
80107056:	89 5d 08             	mov    %ebx,0x8(%ebp)
80107059:	0f b7 7d e0          	movzwl -0x20(%ebp),%edi
8010705d:	eb 07                	jmp    80107066 <sockalloc+0xd6>
8010705f:	90                   	nop
80107060:	8b 12                	mov    (%edx),%edx
80107062:	85 d2                	test   %edx,%edx
80107064:	74 5a                	je     801070c0 <sockalloc+0x130>
80107066:	39 72 04             	cmp    %esi,0x4(%edx)
80107069:	75 f5                	jne    80107060 <sockalloc+0xd0>
8010706b:	66 39 7a 08          	cmp    %di,0x8(%edx)
8010706f:	75 ef                	jne    80107060 <sockalloc+0xd0>
80107071:	0f b7 5d e2          	movzwl -0x1e(%ebp),%ebx
80107075:	66 39 5a 0a          	cmp    %bx,0xa(%edx)
80107079:	75 e5                	jne    80107060 <sockalloc+0xd0>
8010707b:	83 ec 0c             	sub    $0xc,%esp
8010707e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107081:	8b 5d 08             	mov    0x8(%ebp),%ebx
80107084:	68 20 3e 15 80       	push   $0x80153e20
80107089:	e8 e2 ec ff ff       	call   80105d70 <release>
8010708e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107091:	89 04 24             	mov    %eax,(%esp)
80107094:	e8 37 bf ff ff       	call   80102fd0 <kfree>
80107099:	83 c4 10             	add    $0x10,%esp
8010709c:	8b 03                	mov    (%ebx),%eax
8010709e:	85 c0                	test   %eax,%eax
801070a0:	74 0c                	je     801070ae <sockalloc+0x11e>
801070a2:	83 ec 0c             	sub    $0xc,%esp
801070a5:	50                   	push   %eax
801070a6:	e8 c5 a9 ff ff       	call   80101a70 <fileclose>
801070ab:	83 c4 10             	add    $0x10,%esp
801070ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801070b6:	5b                   	pop    %ebx
801070b7:	5e                   	pop    %esi
801070b8:	5f                   	pop    %edi
801070b9:	5d                   	pop    %ebp
801070ba:	c3                   	ret    
801070bb:	90                   	nop
801070bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801070c0:	0f b7 50 0a          	movzwl 0xa(%eax),%edx
801070c4:	89 08                	mov    %ecx,(%eax)
801070c6:	a3 00 3e 15 80       	mov    %eax,0x80153e00
801070cb:	52                   	push   %edx
801070cc:	0f b7 50 08          	movzwl 0x8(%eax),%edx
801070d0:	52                   	push   %edx
801070d1:	ff 70 04             	pushl  0x4(%eax)
801070d4:	68 f8 9d 10 80       	push   $0x80109df8
801070d9:	e8 62 9b ff ff       	call   80100c40 <cprintf>
801070de:	c7 04 24 20 3e 15 80 	movl   $0x80153e20,(%esp)
801070e5:	e8 86 ec ff ff       	call   80105d70 <release>
801070ea:	83 c4 10             	add    $0x10,%esp
801070ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070f0:	31 c0                	xor    %eax,%eax
801070f2:	5b                   	pop    %ebx
801070f3:	5e                   	pop    %esi
801070f4:	5f                   	pop    %edi
801070f5:	5d                   	pop    %ebp
801070f6:	c3                   	ret    
801070f7:	89 f6                	mov    %esi,%esi
801070f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107100 <sockclose>:
80107100:	55                   	push   %ebp
80107101:	89 e5                	mov    %esp,%ebp
80107103:	57                   	push   %edi
80107104:	56                   	push   %esi
80107105:	53                   	push   %ebx
80107106:	83 ec 1c             	sub    $0x1c,%esp
80107109:	8b 7d 08             	mov    0x8(%ebp),%edi
8010710c:	85 ff                	test   %edi,%edi
8010710e:	0f 84 ac 00 00 00    	je     801071c0 <sockclose+0xc0>
80107114:	83 ec 0c             	sub    $0xc,%esp
80107117:	68 20 3e 15 80       	push   $0x80153e20
8010711c:	e8 2f eb ff ff       	call   80105c50 <acquire>
80107121:	8b 35 00 3e 15 80    	mov    0x80153e00,%esi
80107127:	83 c4 10             	add    $0x10,%esp
8010712a:	85 f6                	test   %esi,%esi
8010712c:	74 7e                	je     801071ac <sockclose+0xac>
8010712e:	8b 4f 04             	mov    0x4(%edi),%ecx
80107131:	89 f3                	mov    %esi,%ebx
80107133:	eb 0d                	jmp    80107142 <sockclose+0x42>
80107135:	8d 76 00             	lea    0x0(%esi),%esi
80107138:	8b 03                	mov    (%ebx),%eax
8010713a:	89 de                	mov    %ebx,%esi
8010713c:	85 c0                	test   %eax,%eax
8010713e:	74 6c                	je     801071ac <sockclose+0xac>
80107140:	89 c3                	mov    %eax,%ebx
80107142:	39 4b 04             	cmp    %ecx,0x4(%ebx)
80107145:	75 f1                	jne    80107138 <sockclose+0x38>
80107147:	8b 47 08             	mov    0x8(%edi),%eax
8010714a:	39 43 08             	cmp    %eax,0x8(%ebx)
8010714d:	75 e9                	jne    80107138 <sockclose+0x38>
8010714f:	8d 47 40             	lea    0x40(%edi),%eax
80107152:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107155:	eb 15                	jmp    8010716c <sockclose+0x6c>
80107157:	89 f6                	mov    %esi,%esi
80107159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107160:	83 ec 0c             	sub    $0xc,%esp
80107163:	50                   	push   %eax
80107164:	e8 77 cf ff ff       	call   801040e0 <mbuffree>
80107169:	83 c4 10             	add    $0x10,%esp
8010716c:	83 ec 0c             	sub    $0xc,%esp
8010716f:	ff 75 e4             	pushl  -0x1c(%ebp)
80107172:	e8 c9 cf ff ff       	call   80104140 <mbufq_pophead>
80107177:	83 c4 10             	add    $0x10,%esp
8010717a:	85 c0                	test   %eax,%eax
8010717c:	75 e2                	jne    80107160 <sockclose+0x60>
8010717e:	39 1d 00 3e 15 80    	cmp    %ebx,0x80153e00
80107184:	8b 03                	mov    (%ebx),%eax
80107186:	74 40                	je     801071c8 <sockclose+0xc8>
80107188:	89 06                	mov    %eax,(%esi)
8010718a:	0f b7 47 0a          	movzwl 0xa(%edi),%eax
8010718e:	50                   	push   %eax
8010718f:	0f b7 47 08          	movzwl 0x8(%edi),%eax
80107193:	50                   	push   %eax
80107194:	ff 77 04             	pushl  0x4(%edi)
80107197:	68 2e 9d 10 80       	push   $0x80109d2e
8010719c:	e8 9f 9a ff ff       	call   80100c40 <cprintf>
801071a1:	89 3c 24             	mov    %edi,(%esp)
801071a4:	e8 27 be ff ff       	call   80102fd0 <kfree>
801071a9:	83 c4 10             	add    $0x10,%esp
801071ac:	c7 45 08 20 3e 15 80 	movl   $0x80153e20,0x8(%ebp)
801071b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071b6:	5b                   	pop    %ebx
801071b7:	5e                   	pop    %esi
801071b8:	5f                   	pop    %edi
801071b9:	5d                   	pop    %ebp
801071ba:	e9 b1 eb ff ff       	jmp    80105d70 <release>
801071bf:	90                   	nop
801071c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071c3:	5b                   	pop    %ebx
801071c4:	5e                   	pop    %esi
801071c5:	5f                   	pop    %edi
801071c6:	5d                   	pop    %ebp
801071c7:	c3                   	ret    
801071c8:	a3 00 3e 15 80       	mov    %eax,0x80153e00
801071cd:	eb bb                	jmp    8010718a <sockclose+0x8a>
801071cf:	90                   	nop

801071d0 <sockwrite>:
801071d0:	55                   	push   %ebp
801071d1:	89 e5                	mov    %esp,%ebp
801071d3:	57                   	push   %edi
801071d4:	56                   	push   %esi
801071d5:	53                   	push   %ebx
801071d6:	83 ec 18             	sub    $0x18,%esp
801071d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801071dc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801071df:	57                   	push   %edi
801071e0:	e8 6b ea ff ff       	call   80105c50 <acquire>
801071e5:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
801071ec:	e8 8f ce ff ff       	call   80104080 <mbufalloc>
801071f1:	83 c4 10             	add    $0x10,%esp
801071f4:	85 c0                	test   %eax,%eax
801071f6:	74 5c                	je     80107254 <sockwrite+0x84>
801071f8:	83 ec 04             	sub    $0x4,%esp
801071fb:	ff 75 10             	pushl  0x10(%ebp)
801071fe:	ff 75 0c             	pushl  0xc(%ebp)
80107201:	ff 70 04             	pushl  0x4(%eax)
80107204:	89 c6                	mov    %eax,%esi
80107206:	e8 75 ec ff ff       	call   80105e80 <memmove>
8010720b:	8b 45 10             	mov    0x10(%ebp),%eax
8010720e:	89 46 08             	mov    %eax,0x8(%esi)
80107211:	0f b7 43 0a          	movzwl 0xa(%ebx),%eax
80107215:	50                   	push   %eax
80107216:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
8010721a:	50                   	push   %eax
8010721b:	ff 73 04             	pushl  0x4(%ebx)
8010721e:	68 4b 9d 10 80       	push   $0x80109d4b
80107223:	e8 18 9a ff ff       	call   80100c40 <cprintf>
80107228:	0f b7 43 0a          	movzwl 0xa(%ebx),%eax
8010722c:	83 c4 20             	add    $0x20,%esp
8010722f:	50                   	push   %eax
80107230:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
80107234:	50                   	push   %eax
80107235:	ff 73 04             	pushl  0x4(%ebx)
80107238:	56                   	push   %esi
80107239:	e8 52 cf ff ff       	call   80104190 <net_tx_udp>
8010723e:	89 3c 24             	mov    %edi,(%esp)
80107241:	e8 2a eb ff ff       	call   80105d70 <release>
80107246:	8b 45 10             	mov    0x10(%ebp),%eax
80107249:	83 c4 10             	add    $0x10,%esp
8010724c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010724f:	5b                   	pop    %ebx
80107250:	5e                   	pop    %esi
80107251:	5f                   	pop    %edi
80107252:	5d                   	pop    %ebp
80107253:	c3                   	ret    
80107254:	83 ec 0c             	sub    $0xc,%esp
80107257:	57                   	push   %edi
80107258:	e8 13 eb ff ff       	call   80105d70 <release>
8010725d:	83 c4 10             	add    $0x10,%esp
80107260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107265:	eb e5                	jmp    8010724c <sockwrite+0x7c>
80107267:	89 f6                	mov    %esi,%esi
80107269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107270 <sockread>:
80107270:	55                   	push   %ebp
80107271:	89 e5                	mov    %esp,%ebp
80107273:	57                   	push   %edi
80107274:	56                   	push   %esi
80107275:	53                   	push   %ebx
80107276:	83 ec 28             	sub    $0x28,%esp
80107279:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010727c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010727f:	83 c3 40             	add    $0x40,%ebx
80107282:	57                   	push   %edi
80107283:	e8 c8 e9 ff ff       	call   80105c50 <acquire>
80107288:	83 c4 10             	add    $0x10,%esp
8010728b:	eb 20                	jmp    801072ad <sockread+0x3d>
8010728d:	8d 76 00             	lea    0x0(%esi),%esi
80107290:	e8 cb de ff ff       	call   80105160 <myproc>
80107295:	8b 40 24             	mov    0x24(%eax),%eax
80107298:	85 c0                	test   %eax,%eax
8010729a:	0f 85 a0 00 00 00    	jne    80107340 <sockread+0xd0>
801072a0:	83 ec 08             	sub    $0x8,%esp
801072a3:	57                   	push   %edi
801072a4:	53                   	push   %ebx
801072a5:	e8 56 e4 ff ff       	call   80105700 <sleep>
801072aa:	83 c4 10             	add    $0x10,%esp
801072ad:	83 ec 0c             	sub    $0xc,%esp
801072b0:	53                   	push   %ebx
801072b1:	e8 aa ce ff ff       	call   80104160 <mbufq_empty>
801072b6:	83 c4 10             	add    $0x10,%esp
801072b9:	85 c0                	test   %eax,%eax
801072bb:	89 c6                	mov    %eax,%esi
801072bd:	75 d1                	jne    80107290 <sockread+0x20>
801072bf:	83 ec 0c             	sub    $0xc,%esp
801072c2:	53                   	push   %ebx
801072c3:	e8 78 ce ff ff       	call   80104140 <mbufq_pophead>
801072c8:	83 c4 10             	add    $0x10,%esp
801072cb:	85 c0                	test   %eax,%eax
801072cd:	74 52                	je     80107321 <sockread+0xb1>
801072cf:	83 ec 08             	sub    $0x8,%esp
801072d2:	ff 70 08             	pushl  0x8(%eax)
801072d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801072d8:	68 69 9d 10 80       	push   $0x80109d69
801072dd:	e8 5e 99 ff ff       	call   80100c40 <cprintf>
801072e2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801072e5:	83 c4 10             	add    $0x10,%esp
801072e8:	8b 42 08             	mov    0x8(%edx),%eax
801072eb:	3b 45 10             	cmp    0x10(%ebp),%eax
801072ee:	76 70                	jbe    80107360 <sockread+0xf0>
801072f0:	83 ec 04             	sub    $0x4,%esp
801072f3:	ff 75 10             	pushl  0x10(%ebp)
801072f6:	ff 72 04             	pushl  0x4(%edx)
801072f9:	ff 75 0c             	pushl  0xc(%ebp)
801072fc:	e8 7f eb ff ff       	call   80105e80 <memmove>
80107301:	58                   	pop    %eax
80107302:	5a                   	pop    %edx
80107303:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107306:	ff 75 10             	pushl  0x10(%ebp)
80107309:	52                   	push   %edx
8010730a:	e8 a1 cc ff ff       	call   80103fb0 <mbufpull>
8010730f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107312:	59                   	pop    %ecx
80107313:	5e                   	pop    %esi
80107314:	52                   	push   %edx
80107315:	53                   	push   %ebx
80107316:	e8 05 ce ff ff       	call   80104120 <mbufq_pushhead>
8010731b:	8b 75 10             	mov    0x10(%ebp),%esi
8010731e:	83 c4 10             	add    $0x10,%esp
80107321:	83 ec 0c             	sub    $0xc,%esp
80107324:	57                   	push   %edi
80107325:	e8 46 ea ff ff       	call   80105d70 <release>
8010732a:	83 c4 10             	add    $0x10,%esp
8010732d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107330:	89 f0                	mov    %esi,%eax
80107332:	5b                   	pop    %ebx
80107333:	5e                   	pop    %esi
80107334:	5f                   	pop    %edi
80107335:	5d                   	pop    %ebp
80107336:	c3                   	ret    
80107337:	89 f6                	mov    %esi,%esi
80107339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107340:	83 ec 0c             	sub    $0xc,%esp
80107343:	be ff ff ff ff       	mov    $0xffffffff,%esi
80107348:	57                   	push   %edi
80107349:	e8 22 ea ff ff       	call   80105d70 <release>
8010734e:	83 c4 10             	add    $0x10,%esp
80107351:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107354:	89 f0                	mov    %esi,%eax
80107356:	5b                   	pop    %ebx
80107357:	5e                   	pop    %esi
80107358:	5f                   	pop    %edi
80107359:	5d                   	pop    %ebp
8010735a:	c3                   	ret    
8010735b:	90                   	nop
8010735c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107360:	83 ec 04             	sub    $0x4,%esp
80107363:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80107366:	50                   	push   %eax
80107367:	ff 72 04             	pushl  0x4(%edx)
8010736a:	ff 75 0c             	pushl  0xc(%ebp)
8010736d:	e8 0e eb ff ff       	call   80105e80 <memmove>
80107372:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107375:	8b 72 08             	mov    0x8(%edx),%esi
80107378:	89 14 24             	mov    %edx,(%esp)
8010737b:	e8 60 cd ff ff       	call   801040e0 <mbuffree>
80107380:	83 c4 10             	add    $0x10,%esp
80107383:	eb 9c                	jmp    80107321 <sockread+0xb1>
80107385:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107390 <sockrecvudp>:
80107390:	55                   	push   %ebp
80107391:	89 e5                	mov    %esp,%ebp
80107393:	57                   	push   %edi
80107394:	56                   	push   %esi
80107395:	53                   	push   %ebx
80107396:	83 ec 28             	sub    $0x28,%esp
80107399:	8b 55 10             	mov    0x10(%ebp),%edx
8010739c:	8b 45 08             	mov    0x8(%ebp),%eax
8010739f:	8b 75 14             	mov    0x14(%ebp),%esi
801073a2:	68 20 3e 15 80       	push   $0x80153e20
801073a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801073aa:	89 45 d8             	mov    %eax,-0x28(%ebp)
801073ad:	66 89 55 e4          	mov    %dx,-0x1c(%ebp)
801073b1:	89 55 e0             	mov    %edx,-0x20(%ebp)
801073b4:	66 89 75 e6          	mov    %si,-0x1a(%ebp)
801073b8:	0f b7 f6             	movzwl %si,%esi
801073bb:	e8 90 e8 ff ff       	call   80105c50 <acquire>
801073c0:	8b 55 e0             	mov    -0x20(%ebp),%edx
801073c3:	8b 3d 00 3e 15 80    	mov    0x80153e00,%edi
801073c9:	56                   	push   %esi
801073ca:	0f b7 c2             	movzwl %dx,%eax
801073cd:	50                   	push   %eax
801073ce:	53                   	push   %ebx
801073cf:	68 85 9d 10 80       	push   $0x80109d85
801073d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
801073d7:	e8 64 98 ff ff       	call   80100c40 <cprintf>
801073dc:	83 c4 20             	add    $0x20,%esp
801073df:	85 ff                	test   %edi,%edi
801073e1:	74 78                	je     8010745b <sockrecvudp+0xcb>
801073e3:	89 75 dc             	mov    %esi,-0x24(%ebp)
801073e6:	89 fe                	mov    %edi,%esi
801073e8:	0f b7 7d e4          	movzwl -0x1c(%ebp),%edi
801073ec:	eb 08                	jmp    801073f6 <sockrecvudp+0x66>
801073ee:	66 90                	xchg   %ax,%ax
801073f0:	8b 36                	mov    (%esi),%esi
801073f2:	85 f6                	test   %esi,%esi
801073f4:	74 62                	je     80107458 <sockrecvudp+0xc8>
801073f6:	0f b7 56 0a          	movzwl 0xa(%esi),%edx
801073fa:	52                   	push   %edx
801073fb:	0f b7 56 08          	movzwl 0x8(%esi),%edx
801073ff:	52                   	push   %edx
80107400:	ff 76 04             	pushl  0x4(%esi)
80107403:	68 9e 9d 10 80       	push   $0x80109d9e
80107408:	e8 33 98 ff ff       	call   80100c40 <cprintf>
8010740d:	83 c4 10             	add    $0x10,%esp
80107410:	39 5e 04             	cmp    %ebx,0x4(%esi)
80107413:	75 db                	jne    801073f0 <sockrecvudp+0x60>
80107415:	66 39 7e 08          	cmp    %di,0x8(%esi)
80107419:	75 d5                	jne    801073f0 <sockrecvudp+0x60>
8010741b:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
8010741f:	66 39 46 0a          	cmp    %ax,0xa(%esi)
80107423:	75 cb                	jne    801073f0 <sockrecvudp+0x60>
80107425:	89 f7                	mov    %esi,%edi
80107427:	8b 75 dc             	mov    -0x24(%ebp),%esi
8010742a:	56                   	push   %esi
8010742b:	ff 75 e0             	pushl  -0x20(%ebp)
8010742e:	53                   	push   %ebx
8010742f:	68 1c 9e 10 80       	push   $0x80109e1c
80107434:	8d 5f 40             	lea    0x40(%edi),%ebx
80107437:	e8 04 98 ff ff       	call   80100c40 <cprintf>
8010743c:	58                   	pop    %eax
8010743d:	5a                   	pop    %edx
8010743e:	ff 75 d8             	pushl  -0x28(%ebp)
80107441:	53                   	push   %ebx
80107442:	e8 a9 cc ff ff       	call   801040f0 <mbufq_pushtail>
80107447:	89 1c 24             	mov    %ebx,(%esp)
8010744a:	e8 61 e4 ff ff       	call   801058b0 <wakeup>
8010744f:	eb 19                	jmp    8010746a <sockrecvudp+0xda>
80107451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107458:	8b 75 dc             	mov    -0x24(%ebp),%esi
8010745b:	56                   	push   %esi
8010745c:	ff 75 e0             	pushl  -0x20(%ebp)
8010745f:	53                   	push   %ebx
80107460:	68 b6 9d 10 80       	push   $0x80109db6
80107465:	e8 d6 97 ff ff       	call   80100c40 <cprintf>
8010746a:	c7 45 08 20 3e 15 80 	movl   $0x80153e20,0x8(%ebp)
80107471:	83 c4 10             	add    $0x10,%esp
80107474:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107477:	5b                   	pop    %ebx
80107478:	5e                   	pop    %esi
80107479:	5f                   	pop    %edi
8010747a:	5d                   	pop    %ebp
8010747b:	e9 f0 e8 ff ff       	jmp    80105d70 <release>

80107480 <sys_fork>:
80107480:	55                   	push   %ebp
80107481:	89 e5                	mov    %esp,%ebp
80107483:	5d                   	pop    %ebp
80107484:	e9 77 de ff ff       	jmp    80105300 <fork>
80107489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107490 <sys_exit>:
80107490:	55                   	push   %ebp
80107491:	89 e5                	mov    %esp,%ebp
80107493:	83 ec 08             	sub    $0x8,%esp
80107496:	e8 e5 e0 ff ff       	call   80105580 <exit>
8010749b:	31 c0                	xor    %eax,%eax
8010749d:	c9                   	leave  
8010749e:	c3                   	ret    
8010749f:	90                   	nop

801074a0 <sys_wait>:
801074a0:	55                   	push   %ebp
801074a1:	89 e5                	mov    %esp,%ebp
801074a3:	5d                   	pop    %ebp
801074a4:	e9 17 e3 ff ff       	jmp    801057c0 <wait>
801074a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801074b0 <sys_kill>:
801074b0:	55                   	push   %ebp
801074b1:	89 e5                	mov    %esp,%ebp
801074b3:	83 ec 20             	sub    $0x20,%esp
801074b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801074b9:	50                   	push   %eax
801074ba:	6a 00                	push   $0x0
801074bc:	e8 cf ec ff ff       	call   80106190 <argint>
801074c1:	83 c4 10             	add    $0x10,%esp
801074c4:	85 c0                	test   %eax,%eax
801074c6:	78 18                	js     801074e0 <sys_kill+0x30>
801074c8:	83 ec 0c             	sub    $0xc,%esp
801074cb:	ff 75 f4             	pushl  -0xc(%ebp)
801074ce:	e8 3d e4 ff ff       	call   80105910 <kill>
801074d3:	83 c4 10             	add    $0x10,%esp
801074d6:	c9                   	leave  
801074d7:	c3                   	ret    
801074d8:	90                   	nop
801074d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801074e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801074e5:	c9                   	leave  
801074e6:	c3                   	ret    
801074e7:	89 f6                	mov    %esi,%esi
801074e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801074f0 <sys_getpid>:
801074f0:	55                   	push   %ebp
801074f1:	89 e5                	mov    %esp,%ebp
801074f3:	83 ec 08             	sub    $0x8,%esp
801074f6:	e8 65 dc ff ff       	call   80105160 <myproc>
801074fb:	8b 40 10             	mov    0x10(%eax),%eax
801074fe:	c9                   	leave  
801074ff:	c3                   	ret    

80107500 <sys_sbrk>:
80107500:	55                   	push   %ebp
80107501:	89 e5                	mov    %esp,%ebp
80107503:	53                   	push   %ebx
80107504:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107507:	83 ec 1c             	sub    $0x1c,%esp
8010750a:	50                   	push   %eax
8010750b:	6a 00                	push   $0x0
8010750d:	e8 7e ec ff ff       	call   80106190 <argint>
80107512:	83 c4 10             	add    $0x10,%esp
80107515:	85 c0                	test   %eax,%eax
80107517:	78 27                	js     80107540 <sys_sbrk+0x40>
80107519:	e8 42 dc ff ff       	call   80105160 <myproc>
8010751e:	83 ec 0c             	sub    $0xc,%esp
80107521:	8b 18                	mov    (%eax),%ebx
80107523:	ff 75 f4             	pushl  -0xc(%ebp)
80107526:	e8 55 dd ff ff       	call   80105280 <growproc>
8010752b:	83 c4 10             	add    $0x10,%esp
8010752e:	85 c0                	test   %eax,%eax
80107530:	78 0e                	js     80107540 <sys_sbrk+0x40>
80107532:	89 d8                	mov    %ebx,%eax
80107534:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107537:	c9                   	leave  
80107538:	c3                   	ret    
80107539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107540:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80107545:	eb eb                	jmp    80107532 <sys_sbrk+0x32>
80107547:	89 f6                	mov    %esi,%esi
80107549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107550 <sys_sleep>:
80107550:	55                   	push   %ebp
80107551:	89 e5                	mov    %esp,%ebp
80107553:	53                   	push   %ebx
80107554:	8d 45 f4             	lea    -0xc(%ebp),%eax
80107557:	83 ec 1c             	sub    $0x1c,%esp
8010755a:	50                   	push   %eax
8010755b:	6a 00                	push   $0x0
8010755d:	e8 2e ec ff ff       	call   80106190 <argint>
80107562:	83 c4 10             	add    $0x10,%esp
80107565:	85 c0                	test   %eax,%eax
80107567:	0f 88 8a 00 00 00    	js     801075f7 <sys_sleep+0xa7>
8010756d:	83 ec 0c             	sub    $0xc,%esp
80107570:	68 20 e8 15 80       	push   $0x8015e820
80107575:	e8 d6 e6 ff ff       	call   80105c50 <acquire>
8010757a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010757d:	83 c4 10             	add    $0x10,%esp
80107580:	8b 1d 60 f0 15 80    	mov    0x8015f060,%ebx
80107586:	85 d2                	test   %edx,%edx
80107588:	75 27                	jne    801075b1 <sys_sleep+0x61>
8010758a:	eb 54                	jmp    801075e0 <sys_sleep+0x90>
8010758c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107590:	83 ec 08             	sub    $0x8,%esp
80107593:	68 20 e8 15 80       	push   $0x8015e820
80107598:	68 60 f0 15 80       	push   $0x8015f060
8010759d:	e8 5e e1 ff ff       	call   80105700 <sleep>
801075a2:	a1 60 f0 15 80       	mov    0x8015f060,%eax
801075a7:	83 c4 10             	add    $0x10,%esp
801075aa:	29 d8                	sub    %ebx,%eax
801075ac:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801075af:	73 2f                	jae    801075e0 <sys_sleep+0x90>
801075b1:	e8 aa db ff ff       	call   80105160 <myproc>
801075b6:	8b 40 24             	mov    0x24(%eax),%eax
801075b9:	85 c0                	test   %eax,%eax
801075bb:	74 d3                	je     80107590 <sys_sleep+0x40>
801075bd:	83 ec 0c             	sub    $0xc,%esp
801075c0:	68 20 e8 15 80       	push   $0x8015e820
801075c5:	e8 a6 e7 ff ff       	call   80105d70 <release>
801075ca:	83 c4 10             	add    $0x10,%esp
801075cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801075d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801075d5:	c9                   	leave  
801075d6:	c3                   	ret    
801075d7:	89 f6                	mov    %esi,%esi
801075d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801075e0:	83 ec 0c             	sub    $0xc,%esp
801075e3:	68 20 e8 15 80       	push   $0x8015e820
801075e8:	e8 83 e7 ff ff       	call   80105d70 <release>
801075ed:	83 c4 10             	add    $0x10,%esp
801075f0:	31 c0                	xor    %eax,%eax
801075f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801075f5:	c9                   	leave  
801075f6:	c3                   	ret    
801075f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801075fc:	eb f4                	jmp    801075f2 <sys_sleep+0xa2>
801075fe:	66 90                	xchg   %ax,%ax

80107600 <sys_uptime>:
80107600:	55                   	push   %ebp
80107601:	89 e5                	mov    %esp,%ebp
80107603:	53                   	push   %ebx
80107604:	83 ec 10             	sub    $0x10,%esp
80107607:	68 20 e8 15 80       	push   $0x8015e820
8010760c:	e8 3f e6 ff ff       	call   80105c50 <acquire>
80107611:	8b 1d 60 f0 15 80    	mov    0x8015f060,%ebx
80107617:	c7 04 24 20 e8 15 80 	movl   $0x8015e820,(%esp)
8010761e:	e8 4d e7 ff ff       	call   80105d70 <release>
80107623:	89 d8                	mov    %ebx,%eax
80107625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80107628:	c9                   	leave  
80107629:	c3                   	ret    

8010762a <alltraps>:
8010762a:	1e                   	push   %ds
8010762b:	06                   	push   %es
8010762c:	0f a0                	push   %fs
8010762e:	0f a8                	push   %gs
80107630:	60                   	pusha  
80107631:	66 b8 10 00          	mov    $0x10,%ax
80107635:	8e d8                	mov    %eax,%ds
80107637:	8e c0                	mov    %eax,%es
80107639:	54                   	push   %esp
8010763a:	e8 c1 00 00 00       	call   80107700 <trap>
8010763f:	83 c4 04             	add    $0x4,%esp

80107642 <trapret>:
80107642:	61                   	popa   
80107643:	0f a9                	pop    %gs
80107645:	0f a1                	pop    %fs
80107647:	07                   	pop    %es
80107648:	1f                   	pop    %ds
80107649:	83 c4 08             	add    $0x8,%esp
8010764c:	cf                   	iret   
8010764d:	66 90                	xchg   %ax,%ax
8010764f:	90                   	nop

80107650 <tvinit>:
80107650:	55                   	push   %ebp
80107651:	31 c0                	xor    %eax,%eax
80107653:	89 e5                	mov    %esp,%ebp
80107655:	83 ec 08             	sub    $0x8,%esp
80107658:	90                   	nop
80107659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107660:	8b 14 85 48 d0 10 80 	mov    -0x7fef2fb8(,%eax,4),%edx
80107667:	c7 04 c5 62 e8 15 80 	movl   $0x8e000008,-0x7fea179e(,%eax,8)
8010766e:	08 00 00 8e 
80107672:	66 89 14 c5 60 e8 15 	mov    %dx,-0x7fea17a0(,%eax,8)
80107679:	80 
8010767a:	c1 ea 10             	shr    $0x10,%edx
8010767d:	66 89 14 c5 66 e8 15 	mov    %dx,-0x7fea179a(,%eax,8)
80107684:	80 
80107685:	83 c0 01             	add    $0x1,%eax
80107688:	3d 00 01 00 00       	cmp    $0x100,%eax
8010768d:	75 d1                	jne    80107660 <tvinit+0x10>
8010768f:	a1 48 d1 10 80       	mov    0x8010d148,%eax
80107694:	83 ec 08             	sub    $0x8,%esp
80107697:	c7 05 62 ea 15 80 08 	movl   $0xef000008,0x8015ea62
8010769e:	00 00 ef 
801076a1:	68 46 9e 10 80       	push   $0x80109e46
801076a6:	68 20 e8 15 80       	push   $0x8015e820
801076ab:	66 a3 60 ea 15 80    	mov    %ax,0x8015ea60
801076b1:	c1 e8 10             	shr    $0x10,%eax
801076b4:	66 a3 66 ea 15 80    	mov    %ax,0x8015ea66
801076ba:	e8 a1 e4 ff ff       	call   80105b60 <initlock>
801076bf:	83 c4 10             	add    $0x10,%esp
801076c2:	c9                   	leave  
801076c3:	c3                   	ret    
801076c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801076ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801076d0 <idtinit>:
801076d0:	55                   	push   %ebp
801076d1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801076d6:	89 e5                	mov    %esp,%ebp
801076d8:	83 ec 10             	sub    $0x10,%esp
801076db:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
801076df:	b8 60 e8 15 80       	mov    $0x8015e860,%eax
801076e4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
801076e8:	c1 e8 10             	shr    $0x10,%eax
801076eb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
801076ef:	8d 45 fa             	lea    -0x6(%ebp),%eax
801076f2:	0f 01 18             	lidtl  (%eax)
801076f5:	c9                   	leave  
801076f6:	c3                   	ret    
801076f7:	89 f6                	mov    %esi,%esi
801076f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107700 <trap>:
80107700:	55                   	push   %ebp
80107701:	89 e5                	mov    %esp,%ebp
80107703:	57                   	push   %edi
80107704:	56                   	push   %esi
80107705:	53                   	push   %ebx
80107706:	83 ec 1c             	sub    $0x1c,%esp
80107709:	8b 7d 08             	mov    0x8(%ebp),%edi
8010770c:	8b 47 30             	mov    0x30(%edi),%eax
8010770f:	83 f8 40             	cmp    $0x40,%eax
80107712:	0f 84 f0 00 00 00    	je     80107808 <trap+0x108>
80107718:	83 e8 20             	sub    $0x20,%eax
8010771b:	83 f8 1f             	cmp    $0x1f,%eax
8010771e:	77 10                	ja     80107730 <trap+0x30>
80107720:	ff 24 85 00 9f 10 80 	jmp    *-0x7fef6100(,%eax,4)
80107727:	89 f6                	mov    %esi,%esi
80107729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107730:	e8 2b da ff ff       	call   80105160 <myproc>
80107735:	85 c0                	test   %eax,%eax
80107737:	8b 5f 38             	mov    0x38(%edi),%ebx
8010773a:	0f 84 24 02 00 00    	je     80107964 <trap+0x264>
80107740:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80107744:	0f 84 1a 02 00 00    	je     80107964 <trap+0x264>
8010774a:	0f 20 d1             	mov    %cr2,%ecx
8010774d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80107750:	e8 eb d9 ff ff       	call   80105140 <cpuid>
80107755:	89 45 dc             	mov    %eax,-0x24(%ebp)
80107758:	8b 47 34             	mov    0x34(%edi),%eax
8010775b:	8b 77 30             	mov    0x30(%edi),%esi
8010775e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107761:	e8 fa d9 ff ff       	call   80105160 <myproc>
80107766:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107769:	e8 f2 d9 ff ff       	call   80105160 <myproc>
8010776e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80107771:	8b 55 dc             	mov    -0x24(%ebp),%edx
80107774:	51                   	push   %ecx
80107775:	53                   	push   %ebx
80107776:	52                   	push   %edx
80107777:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010777a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010777d:	56                   	push   %esi
8010777e:	83 c2 6c             	add    $0x6c,%edx
80107781:	52                   	push   %edx
80107782:	ff 70 10             	pushl  0x10(%eax)
80107785:	68 bc 9e 10 80       	push   $0x80109ebc
8010778a:	e8 b1 94 ff ff       	call   80100c40 <cprintf>
8010778f:	83 c4 20             	add    $0x20,%esp
80107792:	e8 c9 d9 ff ff       	call   80105160 <myproc>
80107797:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010779e:	66 90                	xchg   %ax,%ax
801077a0:	e8 bb d9 ff ff       	call   80105160 <myproc>
801077a5:	85 c0                	test   %eax,%eax
801077a7:	74 1d                	je     801077c6 <trap+0xc6>
801077a9:	e8 b2 d9 ff ff       	call   80105160 <myproc>
801077ae:	8b 50 24             	mov    0x24(%eax),%edx
801077b1:	85 d2                	test   %edx,%edx
801077b3:	74 11                	je     801077c6 <trap+0xc6>
801077b5:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801077b9:	83 e0 03             	and    $0x3,%eax
801077bc:	66 83 f8 03          	cmp    $0x3,%ax
801077c0:	0f 84 5a 01 00 00    	je     80107920 <trap+0x220>
801077c6:	e8 95 d9 ff ff       	call   80105160 <myproc>
801077cb:	85 c0                	test   %eax,%eax
801077cd:	74 0b                	je     801077da <trap+0xda>
801077cf:	e8 8c d9 ff ff       	call   80105160 <myproc>
801077d4:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801077d8:	74 66                	je     80107840 <trap+0x140>
801077da:	e8 81 d9 ff ff       	call   80105160 <myproc>
801077df:	85 c0                	test   %eax,%eax
801077e1:	74 19                	je     801077fc <trap+0xfc>
801077e3:	e8 78 d9 ff ff       	call   80105160 <myproc>
801077e8:	8b 40 24             	mov    0x24(%eax),%eax
801077eb:	85 c0                	test   %eax,%eax
801077ed:	74 0d                	je     801077fc <trap+0xfc>
801077ef:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801077f3:	83 e0 03             	and    $0x3,%eax
801077f6:	66 83 f8 03          	cmp    $0x3,%ax
801077fa:	74 35                	je     80107831 <trap+0x131>
801077fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801077ff:	5b                   	pop    %ebx
80107800:	5e                   	pop    %esi
80107801:	5f                   	pop    %edi
80107802:	5d                   	pop    %ebp
80107803:	c3                   	ret    
80107804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107808:	e8 53 d9 ff ff       	call   80105160 <myproc>
8010780d:	8b 40 24             	mov    0x24(%eax),%eax
80107810:	85 c0                	test   %eax,%eax
80107812:	0f 85 f8 00 00 00    	jne    80107910 <trap+0x210>
80107818:	e8 43 d9 ff ff       	call   80105160 <myproc>
8010781d:	89 78 18             	mov    %edi,0x18(%eax)
80107820:	e8 5b ea ff ff       	call   80106280 <syscall>
80107825:	e8 36 d9 ff ff       	call   80105160 <myproc>
8010782a:	8b 70 24             	mov    0x24(%eax),%esi
8010782d:	85 f6                	test   %esi,%esi
8010782f:	74 cb                	je     801077fc <trap+0xfc>
80107831:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107834:	5b                   	pop    %ebx
80107835:	5e                   	pop    %esi
80107836:	5f                   	pop    %edi
80107837:	5d                   	pop    %ebp
80107838:	e9 43 dd ff ff       	jmp    80105580 <exit>
8010783d:	8d 76 00             	lea    0x0(%esi),%esi
80107840:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80107844:	75 94                	jne    801077da <trap+0xda>
80107846:	e8 65 de ff ff       	call   801056b0 <yield>
8010784b:	eb 8d                	jmp    801077da <trap+0xda>
8010784d:	8d 76 00             	lea    0x0(%esi),%esi
80107850:	e8 eb d8 ff ff       	call   80105140 <cpuid>
80107855:	85 c0                	test   %eax,%eax
80107857:	0f 84 d3 00 00 00    	je     80107930 <trap+0x230>
8010785d:	e8 ae bb ff ff       	call   80103410 <lapiceoi>
80107862:	e8 f9 d8 ff ff       	call   80105160 <myproc>
80107867:	85 c0                	test   %eax,%eax
80107869:	0f 85 3a ff ff ff    	jne    801077a9 <trap+0xa9>
8010786f:	e9 52 ff ff ff       	jmp    801077c6 <trap+0xc6>
80107874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107878:	e8 53 ba ff ff       	call   801032d0 <kbdintr>
8010787d:	e8 8e bb ff ff       	call   80103410 <lapiceoi>
80107882:	e9 19 ff ff ff       	jmp    801077a0 <trap+0xa0>
80107887:	89 f6                	mov    %esi,%esi
80107889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107890:	e8 6b 02 00 00       	call   80107b00 <uartintr>
80107895:	e8 76 bb ff ff       	call   80103410 <lapiceoi>
8010789a:	e9 01 ff ff ff       	jmp    801077a0 <trap+0xa0>
8010789f:	90                   	nop
801078a0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
801078a4:	8b 77 38             	mov    0x38(%edi),%esi
801078a7:	e8 94 d8 ff ff       	call   80105140 <cpuid>
801078ac:	56                   	push   %esi
801078ad:	53                   	push   %ebx
801078ae:	50                   	push   %eax
801078af:	68 64 9e 10 80       	push   $0x80109e64
801078b4:	e8 87 93 ff ff       	call   80100c40 <cprintf>
801078b9:	e8 52 bb ff ff       	call   80103410 <lapiceoi>
801078be:	83 c4 10             	add    $0x10,%esp
801078c1:	e9 da fe ff ff       	jmp    801077a0 <trap+0xa0>
801078c6:	8d 76 00             	lea    0x0(%esi),%esi
801078c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801078d0:	83 ec 0c             	sub    $0xc,%esp
801078d3:	68 4b 9e 10 80       	push   $0x80109e4b
801078d8:	e8 63 93 ff ff       	call   80100c40 <cprintf>
801078dd:	e8 8e a0 ff ff       	call   80101970 <ethintr>
801078e2:	e8 29 bb ff ff       	call   80103410 <lapiceoi>
801078e7:	59                   	pop    %ecx
801078e8:	5b                   	pop    %ebx
801078e9:	6a 00                	push   $0x0
801078eb:	6a 0b                	push   $0xb
801078ed:	e8 9e b6 ff ff       	call   80102f90 <ioapicenable>
801078f2:	83 c4 10             	add    $0x10,%esp
801078f5:	e9 a6 fe ff ff       	jmp    801077a0 <trap+0xa0>
801078fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107900:	e8 3b b4 ff ff       	call   80102d40 <ideintr>
80107905:	e9 53 ff ff ff       	jmp    8010785d <trap+0x15d>
8010790a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107910:	e8 6b dc ff ff       	call   80105580 <exit>
80107915:	e9 fe fe ff ff       	jmp    80107818 <trap+0x118>
8010791a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107920:	e8 5b dc ff ff       	call   80105580 <exit>
80107925:	e9 9c fe ff ff       	jmp    801077c6 <trap+0xc6>
8010792a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107930:	83 ec 0c             	sub    $0xc,%esp
80107933:	68 20 e8 15 80       	push   $0x8015e820
80107938:	e8 13 e3 ff ff       	call   80105c50 <acquire>
8010793d:	c7 04 24 60 f0 15 80 	movl   $0x8015f060,(%esp)
80107944:	83 05 60 f0 15 80 01 	addl   $0x1,0x8015f060
8010794b:	e8 60 df ff ff       	call   801058b0 <wakeup>
80107950:	c7 04 24 20 e8 15 80 	movl   $0x8015e820,(%esp)
80107957:	e8 14 e4 ff ff       	call   80105d70 <release>
8010795c:	83 c4 10             	add    $0x10,%esp
8010795f:	e9 f9 fe ff ff       	jmp    8010785d <trap+0x15d>
80107964:	0f 20 d6             	mov    %cr2,%esi
80107967:	e8 d4 d7 ff ff       	call   80105140 <cpuid>
8010796c:	83 ec 0c             	sub    $0xc,%esp
8010796f:	56                   	push   %esi
80107970:	53                   	push   %ebx
80107971:	50                   	push   %eax
80107972:	ff 77 30             	pushl  0x30(%edi)
80107975:	68 88 9e 10 80       	push   $0x80109e88
8010797a:	e8 c1 92 ff ff       	call   80100c40 <cprintf>
8010797f:	83 c4 14             	add    $0x14,%esp
80107982:	68 5f 9e 10 80       	push   $0x80109e5f
80107987:	e8 e4 8f ff ff       	call   80100970 <panic>
8010798c:	66 90                	xchg   %ax,%ax
8010798e:	66 90                	xchg   %ax,%ax

80107990 <uartgetc>:
80107990:	a1 54 3e 15 80       	mov    0x80153e54,%eax
80107995:	55                   	push   %ebp
80107996:	89 e5                	mov    %esp,%ebp
80107998:	85 c0                	test   %eax,%eax
8010799a:	74 1c                	je     801079b8 <uartgetc+0x28>
8010799c:	ba fd 03 00 00       	mov    $0x3fd,%edx
801079a1:	ec                   	in     (%dx),%al
801079a2:	a8 01                	test   $0x1,%al
801079a4:	74 12                	je     801079b8 <uartgetc+0x28>
801079a6:	ba f8 03 00 00       	mov    $0x3f8,%edx
801079ab:	ec                   	in     (%dx),%al
801079ac:	0f b6 c0             	movzbl %al,%eax
801079af:	5d                   	pop    %ebp
801079b0:	c3                   	ret    
801079b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801079b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801079bd:	5d                   	pop    %ebp
801079be:	c3                   	ret    
801079bf:	90                   	nop

801079c0 <uartputc.part.0>:
801079c0:	55                   	push   %ebp
801079c1:	89 e5                	mov    %esp,%ebp
801079c3:	57                   	push   %edi
801079c4:	56                   	push   %esi
801079c5:	53                   	push   %ebx
801079c6:	89 c7                	mov    %eax,%edi
801079c8:	bb 80 00 00 00       	mov    $0x80,%ebx
801079cd:	be fd 03 00 00       	mov    $0x3fd,%esi
801079d2:	83 ec 0c             	sub    $0xc,%esp
801079d5:	eb 1b                	jmp    801079f2 <uartputc.part.0+0x32>
801079d7:	89 f6                	mov    %esi,%esi
801079d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801079e0:	83 ec 0c             	sub    $0xc,%esp
801079e3:	6a 0a                	push   $0xa
801079e5:	e8 46 ba ff ff       	call   80103430 <microdelay>
801079ea:	83 c4 10             	add    $0x10,%esp
801079ed:	83 eb 01             	sub    $0x1,%ebx
801079f0:	74 07                	je     801079f9 <uartputc.part.0+0x39>
801079f2:	89 f2                	mov    %esi,%edx
801079f4:	ec                   	in     (%dx),%al
801079f5:	a8 20                	test   $0x20,%al
801079f7:	74 e7                	je     801079e0 <uartputc.part.0+0x20>
801079f9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801079fe:	89 f8                	mov    %edi,%eax
80107a00:	ee                   	out    %al,(%dx)
80107a01:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107a04:	5b                   	pop    %ebx
80107a05:	5e                   	pop    %esi
80107a06:	5f                   	pop    %edi
80107a07:	5d                   	pop    %ebp
80107a08:	c3                   	ret    
80107a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107a10 <uartinit>:
80107a10:	55                   	push   %ebp
80107a11:	31 c9                	xor    %ecx,%ecx
80107a13:	89 c8                	mov    %ecx,%eax
80107a15:	89 e5                	mov    %esp,%ebp
80107a17:	57                   	push   %edi
80107a18:	56                   	push   %esi
80107a19:	53                   	push   %ebx
80107a1a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80107a1f:	89 da                	mov    %ebx,%edx
80107a21:	83 ec 0c             	sub    $0xc,%esp
80107a24:	ee                   	out    %al,(%dx)
80107a25:	bf fb 03 00 00       	mov    $0x3fb,%edi
80107a2a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80107a2f:	89 fa                	mov    %edi,%edx
80107a31:	ee                   	out    %al,(%dx)
80107a32:	b8 0c 00 00 00       	mov    $0xc,%eax
80107a37:	ba f8 03 00 00       	mov    $0x3f8,%edx
80107a3c:	ee                   	out    %al,(%dx)
80107a3d:	be f9 03 00 00       	mov    $0x3f9,%esi
80107a42:	89 c8                	mov    %ecx,%eax
80107a44:	89 f2                	mov    %esi,%edx
80107a46:	ee                   	out    %al,(%dx)
80107a47:	b8 03 00 00 00       	mov    $0x3,%eax
80107a4c:	89 fa                	mov    %edi,%edx
80107a4e:	ee                   	out    %al,(%dx)
80107a4f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80107a54:	89 c8                	mov    %ecx,%eax
80107a56:	ee                   	out    %al,(%dx)
80107a57:	b8 01 00 00 00       	mov    $0x1,%eax
80107a5c:	89 f2                	mov    %esi,%edx
80107a5e:	ee                   	out    %al,(%dx)
80107a5f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80107a64:	ec                   	in     (%dx),%al
80107a65:	3c ff                	cmp    $0xff,%al
80107a67:	74 5a                	je     80107ac3 <uartinit+0xb3>
80107a69:	c7 05 54 3e 15 80 01 	movl   $0x1,0x80153e54
80107a70:	00 00 00 
80107a73:	89 da                	mov    %ebx,%edx
80107a75:	ec                   	in     (%dx),%al
80107a76:	ba f8 03 00 00       	mov    $0x3f8,%edx
80107a7b:	ec                   	in     (%dx),%al
80107a7c:	83 ec 08             	sub    $0x8,%esp
80107a7f:	bb 80 9f 10 80       	mov    $0x80109f80,%ebx
80107a84:	6a 00                	push   $0x0
80107a86:	6a 04                	push   $0x4
80107a88:	e8 03 b5 ff ff       	call   80102f90 <ioapicenable>
80107a8d:	83 c4 10             	add    $0x10,%esp
80107a90:	b8 78 00 00 00       	mov    $0x78,%eax
80107a95:	eb 13                	jmp    80107aaa <uartinit+0x9a>
80107a97:	89 f6                	mov    %esi,%esi
80107a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107aa0:	83 c3 01             	add    $0x1,%ebx
80107aa3:	0f be 03             	movsbl (%ebx),%eax
80107aa6:	84 c0                	test   %al,%al
80107aa8:	74 19                	je     80107ac3 <uartinit+0xb3>
80107aaa:	8b 15 54 3e 15 80    	mov    0x80153e54,%edx
80107ab0:	85 d2                	test   %edx,%edx
80107ab2:	74 ec                	je     80107aa0 <uartinit+0x90>
80107ab4:	83 c3 01             	add    $0x1,%ebx
80107ab7:	e8 04 ff ff ff       	call   801079c0 <uartputc.part.0>
80107abc:	0f be 03             	movsbl (%ebx),%eax
80107abf:	84 c0                	test   %al,%al
80107ac1:	75 e7                	jne    80107aaa <uartinit+0x9a>
80107ac3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107ac6:	5b                   	pop    %ebx
80107ac7:	5e                   	pop    %esi
80107ac8:	5f                   	pop    %edi
80107ac9:	5d                   	pop    %ebp
80107aca:	c3                   	ret    
80107acb:	90                   	nop
80107acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107ad0 <uartputc>:
80107ad0:	8b 15 54 3e 15 80    	mov    0x80153e54,%edx
80107ad6:	55                   	push   %ebp
80107ad7:	89 e5                	mov    %esp,%ebp
80107ad9:	85 d2                	test   %edx,%edx
80107adb:	8b 45 08             	mov    0x8(%ebp),%eax
80107ade:	74 10                	je     80107af0 <uartputc+0x20>
80107ae0:	5d                   	pop    %ebp
80107ae1:	e9 da fe ff ff       	jmp    801079c0 <uartputc.part.0>
80107ae6:	8d 76 00             	lea    0x0(%esi),%esi
80107ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107af0:	5d                   	pop    %ebp
80107af1:	c3                   	ret    
80107af2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107b00 <uartintr>:
80107b00:	55                   	push   %ebp
80107b01:	89 e5                	mov    %esp,%ebp
80107b03:	83 ec 14             	sub    $0x14,%esp
80107b06:	68 90 79 10 80       	push   $0x80107990
80107b0b:	e8 e0 92 ff ff       	call   80100df0 <consoleintr>
80107b10:	83 c4 10             	add    $0x10,%esp
80107b13:	c9                   	leave  
80107b14:	c3                   	ret    
80107b15:	66 90                	xchg   %ax,%ax
80107b17:	66 90                	xchg   %ax,%ax
80107b19:	66 90                	xchg   %ax,%ax
80107b1b:	66 90                	xchg   %ax,%ax
80107b1d:	66 90                	xchg   %ax,%ax
80107b1f:	90                   	nop

80107b20 <atoi>:
80107b20:	55                   	push   %ebp
80107b21:	89 e5                	mov    %esp,%ebp
80107b23:	53                   	push   %ebx
80107b24:	8b 4d 08             	mov    0x8(%ebp),%ecx
80107b27:	0f be 11             	movsbl (%ecx),%edx
80107b2a:	8d 42 d0             	lea    -0x30(%edx),%eax
80107b2d:	3c 09                	cmp    $0x9,%al
80107b2f:	b8 00 00 00 00       	mov    $0x0,%eax
80107b34:	77 1f                	ja     80107b55 <atoi+0x35>
80107b36:	8d 76 00             	lea    0x0(%esi),%esi
80107b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107b40:	8d 04 80             	lea    (%eax,%eax,4),%eax
80107b43:	83 c1 01             	add    $0x1,%ecx
80107b46:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
80107b4a:	0f be 11             	movsbl (%ecx),%edx
80107b4d:	8d 5a d0             	lea    -0x30(%edx),%ebx
80107b50:	80 fb 09             	cmp    $0x9,%bl
80107b53:	76 eb                	jbe    80107b40 <atoi+0x20>
80107b55:	5b                   	pop    %ebx
80107b56:	5d                   	pop    %ebp
80107b57:	c3                   	ret    
80107b58:	90                   	nop
80107b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107b60 <strcmp>:
80107b60:	55                   	push   %ebp
80107b61:	89 e5                	mov    %esp,%ebp
80107b63:	53                   	push   %ebx
80107b64:	8b 55 08             	mov    0x8(%ebp),%edx
80107b67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80107b6a:	0f b6 02             	movzbl (%edx),%eax
80107b6d:	0f b6 19             	movzbl (%ecx),%ebx
80107b70:	84 c0                	test   %al,%al
80107b72:	75 1c                	jne    80107b90 <strcmp+0x30>
80107b74:	eb 2a                	jmp    80107ba0 <strcmp+0x40>
80107b76:	8d 76 00             	lea    0x0(%esi),%esi
80107b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107b80:	83 c2 01             	add    $0x1,%edx
80107b83:	0f b6 02             	movzbl (%edx),%eax
80107b86:	83 c1 01             	add    $0x1,%ecx
80107b89:	0f b6 19             	movzbl (%ecx),%ebx
80107b8c:	84 c0                	test   %al,%al
80107b8e:	74 10                	je     80107ba0 <strcmp+0x40>
80107b90:	38 d8                	cmp    %bl,%al
80107b92:	74 ec                	je     80107b80 <strcmp+0x20>
80107b94:	29 d8                	sub    %ebx,%eax
80107b96:	5b                   	pop    %ebx
80107b97:	5d                   	pop    %ebp
80107b98:	c3                   	ret    
80107b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107ba0:	31 c0                	xor    %eax,%eax
80107ba2:	29 d8                	sub    %ebx,%eax
80107ba4:	5b                   	pop    %ebx
80107ba5:	5d                   	pop    %ebp
80107ba6:	c3                   	ret    

80107ba7 <vector0>:
80107ba7:	6a 00                	push   $0x0
80107ba9:	6a 00                	push   $0x0
80107bab:	e9 7a fa ff ff       	jmp    8010762a <alltraps>

80107bb0 <vector1>:
80107bb0:	6a 00                	push   $0x0
80107bb2:	6a 01                	push   $0x1
80107bb4:	e9 71 fa ff ff       	jmp    8010762a <alltraps>

80107bb9 <vector2>:
80107bb9:	6a 00                	push   $0x0
80107bbb:	6a 02                	push   $0x2
80107bbd:	e9 68 fa ff ff       	jmp    8010762a <alltraps>

80107bc2 <vector3>:
80107bc2:	6a 00                	push   $0x0
80107bc4:	6a 03                	push   $0x3
80107bc6:	e9 5f fa ff ff       	jmp    8010762a <alltraps>

80107bcb <vector4>:
80107bcb:	6a 00                	push   $0x0
80107bcd:	6a 04                	push   $0x4
80107bcf:	e9 56 fa ff ff       	jmp    8010762a <alltraps>

80107bd4 <vector5>:
80107bd4:	6a 00                	push   $0x0
80107bd6:	6a 05                	push   $0x5
80107bd8:	e9 4d fa ff ff       	jmp    8010762a <alltraps>

80107bdd <vector6>:
80107bdd:	6a 00                	push   $0x0
80107bdf:	6a 06                	push   $0x6
80107be1:	e9 44 fa ff ff       	jmp    8010762a <alltraps>

80107be6 <vector7>:
80107be6:	6a 00                	push   $0x0
80107be8:	6a 07                	push   $0x7
80107bea:	e9 3b fa ff ff       	jmp    8010762a <alltraps>

80107bef <vector8>:
80107bef:	6a 08                	push   $0x8
80107bf1:	e9 34 fa ff ff       	jmp    8010762a <alltraps>

80107bf6 <vector9>:
80107bf6:	6a 00                	push   $0x0
80107bf8:	6a 09                	push   $0x9
80107bfa:	e9 2b fa ff ff       	jmp    8010762a <alltraps>

80107bff <vector10>:
80107bff:	6a 0a                	push   $0xa
80107c01:	e9 24 fa ff ff       	jmp    8010762a <alltraps>

80107c06 <vector11>:
80107c06:	6a 0b                	push   $0xb
80107c08:	e9 1d fa ff ff       	jmp    8010762a <alltraps>

80107c0d <vector12>:
80107c0d:	6a 0c                	push   $0xc
80107c0f:	e9 16 fa ff ff       	jmp    8010762a <alltraps>

80107c14 <vector13>:
80107c14:	6a 0d                	push   $0xd
80107c16:	e9 0f fa ff ff       	jmp    8010762a <alltraps>

80107c1b <vector14>:
80107c1b:	6a 0e                	push   $0xe
80107c1d:	e9 08 fa ff ff       	jmp    8010762a <alltraps>

80107c22 <vector15>:
80107c22:	6a 00                	push   $0x0
80107c24:	6a 0f                	push   $0xf
80107c26:	e9 ff f9 ff ff       	jmp    8010762a <alltraps>

80107c2b <vector16>:
80107c2b:	6a 00                	push   $0x0
80107c2d:	6a 10                	push   $0x10
80107c2f:	e9 f6 f9 ff ff       	jmp    8010762a <alltraps>

80107c34 <vector17>:
80107c34:	6a 11                	push   $0x11
80107c36:	e9 ef f9 ff ff       	jmp    8010762a <alltraps>

80107c3b <vector18>:
80107c3b:	6a 00                	push   $0x0
80107c3d:	6a 12                	push   $0x12
80107c3f:	e9 e6 f9 ff ff       	jmp    8010762a <alltraps>

80107c44 <vector19>:
80107c44:	6a 00                	push   $0x0
80107c46:	6a 13                	push   $0x13
80107c48:	e9 dd f9 ff ff       	jmp    8010762a <alltraps>

80107c4d <vector20>:
80107c4d:	6a 00                	push   $0x0
80107c4f:	6a 14                	push   $0x14
80107c51:	e9 d4 f9 ff ff       	jmp    8010762a <alltraps>

80107c56 <vector21>:
80107c56:	6a 00                	push   $0x0
80107c58:	6a 15                	push   $0x15
80107c5a:	e9 cb f9 ff ff       	jmp    8010762a <alltraps>

80107c5f <vector22>:
80107c5f:	6a 00                	push   $0x0
80107c61:	6a 16                	push   $0x16
80107c63:	e9 c2 f9 ff ff       	jmp    8010762a <alltraps>

80107c68 <vector23>:
80107c68:	6a 00                	push   $0x0
80107c6a:	6a 17                	push   $0x17
80107c6c:	e9 b9 f9 ff ff       	jmp    8010762a <alltraps>

80107c71 <vector24>:
80107c71:	6a 00                	push   $0x0
80107c73:	6a 18                	push   $0x18
80107c75:	e9 b0 f9 ff ff       	jmp    8010762a <alltraps>

80107c7a <vector25>:
80107c7a:	6a 00                	push   $0x0
80107c7c:	6a 19                	push   $0x19
80107c7e:	e9 a7 f9 ff ff       	jmp    8010762a <alltraps>

80107c83 <vector26>:
80107c83:	6a 00                	push   $0x0
80107c85:	6a 1a                	push   $0x1a
80107c87:	e9 9e f9 ff ff       	jmp    8010762a <alltraps>

80107c8c <vector27>:
80107c8c:	6a 00                	push   $0x0
80107c8e:	6a 1b                	push   $0x1b
80107c90:	e9 95 f9 ff ff       	jmp    8010762a <alltraps>

80107c95 <vector28>:
80107c95:	6a 00                	push   $0x0
80107c97:	6a 1c                	push   $0x1c
80107c99:	e9 8c f9 ff ff       	jmp    8010762a <alltraps>

80107c9e <vector29>:
80107c9e:	6a 00                	push   $0x0
80107ca0:	6a 1d                	push   $0x1d
80107ca2:	e9 83 f9 ff ff       	jmp    8010762a <alltraps>

80107ca7 <vector30>:
80107ca7:	6a 00                	push   $0x0
80107ca9:	6a 1e                	push   $0x1e
80107cab:	e9 7a f9 ff ff       	jmp    8010762a <alltraps>

80107cb0 <vector31>:
80107cb0:	6a 00                	push   $0x0
80107cb2:	6a 1f                	push   $0x1f
80107cb4:	e9 71 f9 ff ff       	jmp    8010762a <alltraps>

80107cb9 <vector32>:
80107cb9:	6a 00                	push   $0x0
80107cbb:	6a 20                	push   $0x20
80107cbd:	e9 68 f9 ff ff       	jmp    8010762a <alltraps>

80107cc2 <vector33>:
80107cc2:	6a 00                	push   $0x0
80107cc4:	6a 21                	push   $0x21
80107cc6:	e9 5f f9 ff ff       	jmp    8010762a <alltraps>

80107ccb <vector34>:
80107ccb:	6a 00                	push   $0x0
80107ccd:	6a 22                	push   $0x22
80107ccf:	e9 56 f9 ff ff       	jmp    8010762a <alltraps>

80107cd4 <vector35>:
80107cd4:	6a 00                	push   $0x0
80107cd6:	6a 23                	push   $0x23
80107cd8:	e9 4d f9 ff ff       	jmp    8010762a <alltraps>

80107cdd <vector36>:
80107cdd:	6a 00                	push   $0x0
80107cdf:	6a 24                	push   $0x24
80107ce1:	e9 44 f9 ff ff       	jmp    8010762a <alltraps>

80107ce6 <vector37>:
80107ce6:	6a 00                	push   $0x0
80107ce8:	6a 25                	push   $0x25
80107cea:	e9 3b f9 ff ff       	jmp    8010762a <alltraps>

80107cef <vector38>:
80107cef:	6a 00                	push   $0x0
80107cf1:	6a 26                	push   $0x26
80107cf3:	e9 32 f9 ff ff       	jmp    8010762a <alltraps>

80107cf8 <vector39>:
80107cf8:	6a 00                	push   $0x0
80107cfa:	6a 27                	push   $0x27
80107cfc:	e9 29 f9 ff ff       	jmp    8010762a <alltraps>

80107d01 <vector40>:
80107d01:	6a 00                	push   $0x0
80107d03:	6a 28                	push   $0x28
80107d05:	e9 20 f9 ff ff       	jmp    8010762a <alltraps>

80107d0a <vector41>:
80107d0a:	6a 00                	push   $0x0
80107d0c:	6a 29                	push   $0x29
80107d0e:	e9 17 f9 ff ff       	jmp    8010762a <alltraps>

80107d13 <vector42>:
80107d13:	6a 00                	push   $0x0
80107d15:	6a 2a                	push   $0x2a
80107d17:	e9 0e f9 ff ff       	jmp    8010762a <alltraps>

80107d1c <vector43>:
80107d1c:	6a 00                	push   $0x0
80107d1e:	6a 2b                	push   $0x2b
80107d20:	e9 05 f9 ff ff       	jmp    8010762a <alltraps>

80107d25 <vector44>:
80107d25:	6a 00                	push   $0x0
80107d27:	6a 2c                	push   $0x2c
80107d29:	e9 fc f8 ff ff       	jmp    8010762a <alltraps>

80107d2e <vector45>:
80107d2e:	6a 00                	push   $0x0
80107d30:	6a 2d                	push   $0x2d
80107d32:	e9 f3 f8 ff ff       	jmp    8010762a <alltraps>

80107d37 <vector46>:
80107d37:	6a 00                	push   $0x0
80107d39:	6a 2e                	push   $0x2e
80107d3b:	e9 ea f8 ff ff       	jmp    8010762a <alltraps>

80107d40 <vector47>:
80107d40:	6a 00                	push   $0x0
80107d42:	6a 2f                	push   $0x2f
80107d44:	e9 e1 f8 ff ff       	jmp    8010762a <alltraps>

80107d49 <vector48>:
80107d49:	6a 00                	push   $0x0
80107d4b:	6a 30                	push   $0x30
80107d4d:	e9 d8 f8 ff ff       	jmp    8010762a <alltraps>

80107d52 <vector49>:
80107d52:	6a 00                	push   $0x0
80107d54:	6a 31                	push   $0x31
80107d56:	e9 cf f8 ff ff       	jmp    8010762a <alltraps>

80107d5b <vector50>:
80107d5b:	6a 00                	push   $0x0
80107d5d:	6a 32                	push   $0x32
80107d5f:	e9 c6 f8 ff ff       	jmp    8010762a <alltraps>

80107d64 <vector51>:
80107d64:	6a 00                	push   $0x0
80107d66:	6a 33                	push   $0x33
80107d68:	e9 bd f8 ff ff       	jmp    8010762a <alltraps>

80107d6d <vector52>:
80107d6d:	6a 00                	push   $0x0
80107d6f:	6a 34                	push   $0x34
80107d71:	e9 b4 f8 ff ff       	jmp    8010762a <alltraps>

80107d76 <vector53>:
80107d76:	6a 00                	push   $0x0
80107d78:	6a 35                	push   $0x35
80107d7a:	e9 ab f8 ff ff       	jmp    8010762a <alltraps>

80107d7f <vector54>:
80107d7f:	6a 00                	push   $0x0
80107d81:	6a 36                	push   $0x36
80107d83:	e9 a2 f8 ff ff       	jmp    8010762a <alltraps>

80107d88 <vector55>:
80107d88:	6a 00                	push   $0x0
80107d8a:	6a 37                	push   $0x37
80107d8c:	e9 99 f8 ff ff       	jmp    8010762a <alltraps>

80107d91 <vector56>:
80107d91:	6a 00                	push   $0x0
80107d93:	6a 38                	push   $0x38
80107d95:	e9 90 f8 ff ff       	jmp    8010762a <alltraps>

80107d9a <vector57>:
80107d9a:	6a 00                	push   $0x0
80107d9c:	6a 39                	push   $0x39
80107d9e:	e9 87 f8 ff ff       	jmp    8010762a <alltraps>

80107da3 <vector58>:
80107da3:	6a 00                	push   $0x0
80107da5:	6a 3a                	push   $0x3a
80107da7:	e9 7e f8 ff ff       	jmp    8010762a <alltraps>

80107dac <vector59>:
80107dac:	6a 00                	push   $0x0
80107dae:	6a 3b                	push   $0x3b
80107db0:	e9 75 f8 ff ff       	jmp    8010762a <alltraps>

80107db5 <vector60>:
80107db5:	6a 00                	push   $0x0
80107db7:	6a 3c                	push   $0x3c
80107db9:	e9 6c f8 ff ff       	jmp    8010762a <alltraps>

80107dbe <vector61>:
80107dbe:	6a 00                	push   $0x0
80107dc0:	6a 3d                	push   $0x3d
80107dc2:	e9 63 f8 ff ff       	jmp    8010762a <alltraps>

80107dc7 <vector62>:
80107dc7:	6a 00                	push   $0x0
80107dc9:	6a 3e                	push   $0x3e
80107dcb:	e9 5a f8 ff ff       	jmp    8010762a <alltraps>

80107dd0 <vector63>:
80107dd0:	6a 00                	push   $0x0
80107dd2:	6a 3f                	push   $0x3f
80107dd4:	e9 51 f8 ff ff       	jmp    8010762a <alltraps>

80107dd9 <vector64>:
80107dd9:	6a 00                	push   $0x0
80107ddb:	6a 40                	push   $0x40
80107ddd:	e9 48 f8 ff ff       	jmp    8010762a <alltraps>

80107de2 <vector65>:
80107de2:	6a 00                	push   $0x0
80107de4:	6a 41                	push   $0x41
80107de6:	e9 3f f8 ff ff       	jmp    8010762a <alltraps>

80107deb <vector66>:
80107deb:	6a 00                	push   $0x0
80107ded:	6a 42                	push   $0x42
80107def:	e9 36 f8 ff ff       	jmp    8010762a <alltraps>

80107df4 <vector67>:
80107df4:	6a 00                	push   $0x0
80107df6:	6a 43                	push   $0x43
80107df8:	e9 2d f8 ff ff       	jmp    8010762a <alltraps>

80107dfd <vector68>:
80107dfd:	6a 00                	push   $0x0
80107dff:	6a 44                	push   $0x44
80107e01:	e9 24 f8 ff ff       	jmp    8010762a <alltraps>

80107e06 <vector69>:
80107e06:	6a 00                	push   $0x0
80107e08:	6a 45                	push   $0x45
80107e0a:	e9 1b f8 ff ff       	jmp    8010762a <alltraps>

80107e0f <vector70>:
80107e0f:	6a 00                	push   $0x0
80107e11:	6a 46                	push   $0x46
80107e13:	e9 12 f8 ff ff       	jmp    8010762a <alltraps>

80107e18 <vector71>:
80107e18:	6a 00                	push   $0x0
80107e1a:	6a 47                	push   $0x47
80107e1c:	e9 09 f8 ff ff       	jmp    8010762a <alltraps>

80107e21 <vector72>:
80107e21:	6a 00                	push   $0x0
80107e23:	6a 48                	push   $0x48
80107e25:	e9 00 f8 ff ff       	jmp    8010762a <alltraps>

80107e2a <vector73>:
80107e2a:	6a 00                	push   $0x0
80107e2c:	6a 49                	push   $0x49
80107e2e:	e9 f7 f7 ff ff       	jmp    8010762a <alltraps>

80107e33 <vector74>:
80107e33:	6a 00                	push   $0x0
80107e35:	6a 4a                	push   $0x4a
80107e37:	e9 ee f7 ff ff       	jmp    8010762a <alltraps>

80107e3c <vector75>:
80107e3c:	6a 00                	push   $0x0
80107e3e:	6a 4b                	push   $0x4b
80107e40:	e9 e5 f7 ff ff       	jmp    8010762a <alltraps>

80107e45 <vector76>:
80107e45:	6a 00                	push   $0x0
80107e47:	6a 4c                	push   $0x4c
80107e49:	e9 dc f7 ff ff       	jmp    8010762a <alltraps>

80107e4e <vector77>:
80107e4e:	6a 00                	push   $0x0
80107e50:	6a 4d                	push   $0x4d
80107e52:	e9 d3 f7 ff ff       	jmp    8010762a <alltraps>

80107e57 <vector78>:
80107e57:	6a 00                	push   $0x0
80107e59:	6a 4e                	push   $0x4e
80107e5b:	e9 ca f7 ff ff       	jmp    8010762a <alltraps>

80107e60 <vector79>:
80107e60:	6a 00                	push   $0x0
80107e62:	6a 4f                	push   $0x4f
80107e64:	e9 c1 f7 ff ff       	jmp    8010762a <alltraps>

80107e69 <vector80>:
80107e69:	6a 00                	push   $0x0
80107e6b:	6a 50                	push   $0x50
80107e6d:	e9 b8 f7 ff ff       	jmp    8010762a <alltraps>

80107e72 <vector81>:
80107e72:	6a 00                	push   $0x0
80107e74:	6a 51                	push   $0x51
80107e76:	e9 af f7 ff ff       	jmp    8010762a <alltraps>

80107e7b <vector82>:
80107e7b:	6a 00                	push   $0x0
80107e7d:	6a 52                	push   $0x52
80107e7f:	e9 a6 f7 ff ff       	jmp    8010762a <alltraps>

80107e84 <vector83>:
80107e84:	6a 00                	push   $0x0
80107e86:	6a 53                	push   $0x53
80107e88:	e9 9d f7 ff ff       	jmp    8010762a <alltraps>

80107e8d <vector84>:
80107e8d:	6a 00                	push   $0x0
80107e8f:	6a 54                	push   $0x54
80107e91:	e9 94 f7 ff ff       	jmp    8010762a <alltraps>

80107e96 <vector85>:
80107e96:	6a 00                	push   $0x0
80107e98:	6a 55                	push   $0x55
80107e9a:	e9 8b f7 ff ff       	jmp    8010762a <alltraps>

80107e9f <vector86>:
80107e9f:	6a 00                	push   $0x0
80107ea1:	6a 56                	push   $0x56
80107ea3:	e9 82 f7 ff ff       	jmp    8010762a <alltraps>

80107ea8 <vector87>:
80107ea8:	6a 00                	push   $0x0
80107eaa:	6a 57                	push   $0x57
80107eac:	e9 79 f7 ff ff       	jmp    8010762a <alltraps>

80107eb1 <vector88>:
80107eb1:	6a 00                	push   $0x0
80107eb3:	6a 58                	push   $0x58
80107eb5:	e9 70 f7 ff ff       	jmp    8010762a <alltraps>

80107eba <vector89>:
80107eba:	6a 00                	push   $0x0
80107ebc:	6a 59                	push   $0x59
80107ebe:	e9 67 f7 ff ff       	jmp    8010762a <alltraps>

80107ec3 <vector90>:
80107ec3:	6a 00                	push   $0x0
80107ec5:	6a 5a                	push   $0x5a
80107ec7:	e9 5e f7 ff ff       	jmp    8010762a <alltraps>

80107ecc <vector91>:
80107ecc:	6a 00                	push   $0x0
80107ece:	6a 5b                	push   $0x5b
80107ed0:	e9 55 f7 ff ff       	jmp    8010762a <alltraps>

80107ed5 <vector92>:
80107ed5:	6a 00                	push   $0x0
80107ed7:	6a 5c                	push   $0x5c
80107ed9:	e9 4c f7 ff ff       	jmp    8010762a <alltraps>

80107ede <vector93>:
80107ede:	6a 00                	push   $0x0
80107ee0:	6a 5d                	push   $0x5d
80107ee2:	e9 43 f7 ff ff       	jmp    8010762a <alltraps>

80107ee7 <vector94>:
80107ee7:	6a 00                	push   $0x0
80107ee9:	6a 5e                	push   $0x5e
80107eeb:	e9 3a f7 ff ff       	jmp    8010762a <alltraps>

80107ef0 <vector95>:
80107ef0:	6a 00                	push   $0x0
80107ef2:	6a 5f                	push   $0x5f
80107ef4:	e9 31 f7 ff ff       	jmp    8010762a <alltraps>

80107ef9 <vector96>:
80107ef9:	6a 00                	push   $0x0
80107efb:	6a 60                	push   $0x60
80107efd:	e9 28 f7 ff ff       	jmp    8010762a <alltraps>

80107f02 <vector97>:
80107f02:	6a 00                	push   $0x0
80107f04:	6a 61                	push   $0x61
80107f06:	e9 1f f7 ff ff       	jmp    8010762a <alltraps>

80107f0b <vector98>:
80107f0b:	6a 00                	push   $0x0
80107f0d:	6a 62                	push   $0x62
80107f0f:	e9 16 f7 ff ff       	jmp    8010762a <alltraps>

80107f14 <vector99>:
80107f14:	6a 00                	push   $0x0
80107f16:	6a 63                	push   $0x63
80107f18:	e9 0d f7 ff ff       	jmp    8010762a <alltraps>

80107f1d <vector100>:
80107f1d:	6a 00                	push   $0x0
80107f1f:	6a 64                	push   $0x64
80107f21:	e9 04 f7 ff ff       	jmp    8010762a <alltraps>

80107f26 <vector101>:
80107f26:	6a 00                	push   $0x0
80107f28:	6a 65                	push   $0x65
80107f2a:	e9 fb f6 ff ff       	jmp    8010762a <alltraps>

80107f2f <vector102>:
80107f2f:	6a 00                	push   $0x0
80107f31:	6a 66                	push   $0x66
80107f33:	e9 f2 f6 ff ff       	jmp    8010762a <alltraps>

80107f38 <vector103>:
80107f38:	6a 00                	push   $0x0
80107f3a:	6a 67                	push   $0x67
80107f3c:	e9 e9 f6 ff ff       	jmp    8010762a <alltraps>

80107f41 <vector104>:
80107f41:	6a 00                	push   $0x0
80107f43:	6a 68                	push   $0x68
80107f45:	e9 e0 f6 ff ff       	jmp    8010762a <alltraps>

80107f4a <vector105>:
80107f4a:	6a 00                	push   $0x0
80107f4c:	6a 69                	push   $0x69
80107f4e:	e9 d7 f6 ff ff       	jmp    8010762a <alltraps>

80107f53 <vector106>:
80107f53:	6a 00                	push   $0x0
80107f55:	6a 6a                	push   $0x6a
80107f57:	e9 ce f6 ff ff       	jmp    8010762a <alltraps>

80107f5c <vector107>:
80107f5c:	6a 00                	push   $0x0
80107f5e:	6a 6b                	push   $0x6b
80107f60:	e9 c5 f6 ff ff       	jmp    8010762a <alltraps>

80107f65 <vector108>:
80107f65:	6a 00                	push   $0x0
80107f67:	6a 6c                	push   $0x6c
80107f69:	e9 bc f6 ff ff       	jmp    8010762a <alltraps>

80107f6e <vector109>:
80107f6e:	6a 00                	push   $0x0
80107f70:	6a 6d                	push   $0x6d
80107f72:	e9 b3 f6 ff ff       	jmp    8010762a <alltraps>

80107f77 <vector110>:
80107f77:	6a 00                	push   $0x0
80107f79:	6a 6e                	push   $0x6e
80107f7b:	e9 aa f6 ff ff       	jmp    8010762a <alltraps>

80107f80 <vector111>:
80107f80:	6a 00                	push   $0x0
80107f82:	6a 6f                	push   $0x6f
80107f84:	e9 a1 f6 ff ff       	jmp    8010762a <alltraps>

80107f89 <vector112>:
80107f89:	6a 00                	push   $0x0
80107f8b:	6a 70                	push   $0x70
80107f8d:	e9 98 f6 ff ff       	jmp    8010762a <alltraps>

80107f92 <vector113>:
80107f92:	6a 00                	push   $0x0
80107f94:	6a 71                	push   $0x71
80107f96:	e9 8f f6 ff ff       	jmp    8010762a <alltraps>

80107f9b <vector114>:
80107f9b:	6a 00                	push   $0x0
80107f9d:	6a 72                	push   $0x72
80107f9f:	e9 86 f6 ff ff       	jmp    8010762a <alltraps>

80107fa4 <vector115>:
80107fa4:	6a 00                	push   $0x0
80107fa6:	6a 73                	push   $0x73
80107fa8:	e9 7d f6 ff ff       	jmp    8010762a <alltraps>

80107fad <vector116>:
80107fad:	6a 00                	push   $0x0
80107faf:	6a 74                	push   $0x74
80107fb1:	e9 74 f6 ff ff       	jmp    8010762a <alltraps>

80107fb6 <vector117>:
80107fb6:	6a 00                	push   $0x0
80107fb8:	6a 75                	push   $0x75
80107fba:	e9 6b f6 ff ff       	jmp    8010762a <alltraps>

80107fbf <vector118>:
80107fbf:	6a 00                	push   $0x0
80107fc1:	6a 76                	push   $0x76
80107fc3:	e9 62 f6 ff ff       	jmp    8010762a <alltraps>

80107fc8 <vector119>:
80107fc8:	6a 00                	push   $0x0
80107fca:	6a 77                	push   $0x77
80107fcc:	e9 59 f6 ff ff       	jmp    8010762a <alltraps>

80107fd1 <vector120>:
80107fd1:	6a 00                	push   $0x0
80107fd3:	6a 78                	push   $0x78
80107fd5:	e9 50 f6 ff ff       	jmp    8010762a <alltraps>

80107fda <vector121>:
80107fda:	6a 00                	push   $0x0
80107fdc:	6a 79                	push   $0x79
80107fde:	e9 47 f6 ff ff       	jmp    8010762a <alltraps>

80107fe3 <vector122>:
80107fe3:	6a 00                	push   $0x0
80107fe5:	6a 7a                	push   $0x7a
80107fe7:	e9 3e f6 ff ff       	jmp    8010762a <alltraps>

80107fec <vector123>:
80107fec:	6a 00                	push   $0x0
80107fee:	6a 7b                	push   $0x7b
80107ff0:	e9 35 f6 ff ff       	jmp    8010762a <alltraps>

80107ff5 <vector124>:
80107ff5:	6a 00                	push   $0x0
80107ff7:	6a 7c                	push   $0x7c
80107ff9:	e9 2c f6 ff ff       	jmp    8010762a <alltraps>

80107ffe <vector125>:
80107ffe:	6a 00                	push   $0x0
80108000:	6a 7d                	push   $0x7d
80108002:	e9 23 f6 ff ff       	jmp    8010762a <alltraps>

80108007 <vector126>:
80108007:	6a 00                	push   $0x0
80108009:	6a 7e                	push   $0x7e
8010800b:	e9 1a f6 ff ff       	jmp    8010762a <alltraps>

80108010 <vector127>:
80108010:	6a 00                	push   $0x0
80108012:	6a 7f                	push   $0x7f
80108014:	e9 11 f6 ff ff       	jmp    8010762a <alltraps>

80108019 <vector128>:
80108019:	6a 00                	push   $0x0
8010801b:	68 80 00 00 00       	push   $0x80
80108020:	e9 05 f6 ff ff       	jmp    8010762a <alltraps>

80108025 <vector129>:
80108025:	6a 00                	push   $0x0
80108027:	68 81 00 00 00       	push   $0x81
8010802c:	e9 f9 f5 ff ff       	jmp    8010762a <alltraps>

80108031 <vector130>:
80108031:	6a 00                	push   $0x0
80108033:	68 82 00 00 00       	push   $0x82
80108038:	e9 ed f5 ff ff       	jmp    8010762a <alltraps>

8010803d <vector131>:
8010803d:	6a 00                	push   $0x0
8010803f:	68 83 00 00 00       	push   $0x83
80108044:	e9 e1 f5 ff ff       	jmp    8010762a <alltraps>

80108049 <vector132>:
80108049:	6a 00                	push   $0x0
8010804b:	68 84 00 00 00       	push   $0x84
80108050:	e9 d5 f5 ff ff       	jmp    8010762a <alltraps>

80108055 <vector133>:
80108055:	6a 00                	push   $0x0
80108057:	68 85 00 00 00       	push   $0x85
8010805c:	e9 c9 f5 ff ff       	jmp    8010762a <alltraps>

80108061 <vector134>:
80108061:	6a 00                	push   $0x0
80108063:	68 86 00 00 00       	push   $0x86
80108068:	e9 bd f5 ff ff       	jmp    8010762a <alltraps>

8010806d <vector135>:
8010806d:	6a 00                	push   $0x0
8010806f:	68 87 00 00 00       	push   $0x87
80108074:	e9 b1 f5 ff ff       	jmp    8010762a <alltraps>

80108079 <vector136>:
80108079:	6a 00                	push   $0x0
8010807b:	68 88 00 00 00       	push   $0x88
80108080:	e9 a5 f5 ff ff       	jmp    8010762a <alltraps>

80108085 <vector137>:
80108085:	6a 00                	push   $0x0
80108087:	68 89 00 00 00       	push   $0x89
8010808c:	e9 99 f5 ff ff       	jmp    8010762a <alltraps>

80108091 <vector138>:
80108091:	6a 00                	push   $0x0
80108093:	68 8a 00 00 00       	push   $0x8a
80108098:	e9 8d f5 ff ff       	jmp    8010762a <alltraps>

8010809d <vector139>:
8010809d:	6a 00                	push   $0x0
8010809f:	68 8b 00 00 00       	push   $0x8b
801080a4:	e9 81 f5 ff ff       	jmp    8010762a <alltraps>

801080a9 <vector140>:
801080a9:	6a 00                	push   $0x0
801080ab:	68 8c 00 00 00       	push   $0x8c
801080b0:	e9 75 f5 ff ff       	jmp    8010762a <alltraps>

801080b5 <vector141>:
801080b5:	6a 00                	push   $0x0
801080b7:	68 8d 00 00 00       	push   $0x8d
801080bc:	e9 69 f5 ff ff       	jmp    8010762a <alltraps>

801080c1 <vector142>:
801080c1:	6a 00                	push   $0x0
801080c3:	68 8e 00 00 00       	push   $0x8e
801080c8:	e9 5d f5 ff ff       	jmp    8010762a <alltraps>

801080cd <vector143>:
801080cd:	6a 00                	push   $0x0
801080cf:	68 8f 00 00 00       	push   $0x8f
801080d4:	e9 51 f5 ff ff       	jmp    8010762a <alltraps>

801080d9 <vector144>:
801080d9:	6a 00                	push   $0x0
801080db:	68 90 00 00 00       	push   $0x90
801080e0:	e9 45 f5 ff ff       	jmp    8010762a <alltraps>

801080e5 <vector145>:
801080e5:	6a 00                	push   $0x0
801080e7:	68 91 00 00 00       	push   $0x91
801080ec:	e9 39 f5 ff ff       	jmp    8010762a <alltraps>

801080f1 <vector146>:
801080f1:	6a 00                	push   $0x0
801080f3:	68 92 00 00 00       	push   $0x92
801080f8:	e9 2d f5 ff ff       	jmp    8010762a <alltraps>

801080fd <vector147>:
801080fd:	6a 00                	push   $0x0
801080ff:	68 93 00 00 00       	push   $0x93
80108104:	e9 21 f5 ff ff       	jmp    8010762a <alltraps>

80108109 <vector148>:
80108109:	6a 00                	push   $0x0
8010810b:	68 94 00 00 00       	push   $0x94
80108110:	e9 15 f5 ff ff       	jmp    8010762a <alltraps>

80108115 <vector149>:
80108115:	6a 00                	push   $0x0
80108117:	68 95 00 00 00       	push   $0x95
8010811c:	e9 09 f5 ff ff       	jmp    8010762a <alltraps>

80108121 <vector150>:
80108121:	6a 00                	push   $0x0
80108123:	68 96 00 00 00       	push   $0x96
80108128:	e9 fd f4 ff ff       	jmp    8010762a <alltraps>

8010812d <vector151>:
8010812d:	6a 00                	push   $0x0
8010812f:	68 97 00 00 00       	push   $0x97
80108134:	e9 f1 f4 ff ff       	jmp    8010762a <alltraps>

80108139 <vector152>:
80108139:	6a 00                	push   $0x0
8010813b:	68 98 00 00 00       	push   $0x98
80108140:	e9 e5 f4 ff ff       	jmp    8010762a <alltraps>

80108145 <vector153>:
80108145:	6a 00                	push   $0x0
80108147:	68 99 00 00 00       	push   $0x99
8010814c:	e9 d9 f4 ff ff       	jmp    8010762a <alltraps>

80108151 <vector154>:
80108151:	6a 00                	push   $0x0
80108153:	68 9a 00 00 00       	push   $0x9a
80108158:	e9 cd f4 ff ff       	jmp    8010762a <alltraps>

8010815d <vector155>:
8010815d:	6a 00                	push   $0x0
8010815f:	68 9b 00 00 00       	push   $0x9b
80108164:	e9 c1 f4 ff ff       	jmp    8010762a <alltraps>

80108169 <vector156>:
80108169:	6a 00                	push   $0x0
8010816b:	68 9c 00 00 00       	push   $0x9c
80108170:	e9 b5 f4 ff ff       	jmp    8010762a <alltraps>

80108175 <vector157>:
80108175:	6a 00                	push   $0x0
80108177:	68 9d 00 00 00       	push   $0x9d
8010817c:	e9 a9 f4 ff ff       	jmp    8010762a <alltraps>

80108181 <vector158>:
80108181:	6a 00                	push   $0x0
80108183:	68 9e 00 00 00       	push   $0x9e
80108188:	e9 9d f4 ff ff       	jmp    8010762a <alltraps>

8010818d <vector159>:
8010818d:	6a 00                	push   $0x0
8010818f:	68 9f 00 00 00       	push   $0x9f
80108194:	e9 91 f4 ff ff       	jmp    8010762a <alltraps>

80108199 <vector160>:
80108199:	6a 00                	push   $0x0
8010819b:	68 a0 00 00 00       	push   $0xa0
801081a0:	e9 85 f4 ff ff       	jmp    8010762a <alltraps>

801081a5 <vector161>:
801081a5:	6a 00                	push   $0x0
801081a7:	68 a1 00 00 00       	push   $0xa1
801081ac:	e9 79 f4 ff ff       	jmp    8010762a <alltraps>

801081b1 <vector162>:
801081b1:	6a 00                	push   $0x0
801081b3:	68 a2 00 00 00       	push   $0xa2
801081b8:	e9 6d f4 ff ff       	jmp    8010762a <alltraps>

801081bd <vector163>:
801081bd:	6a 00                	push   $0x0
801081bf:	68 a3 00 00 00       	push   $0xa3
801081c4:	e9 61 f4 ff ff       	jmp    8010762a <alltraps>

801081c9 <vector164>:
801081c9:	6a 00                	push   $0x0
801081cb:	68 a4 00 00 00       	push   $0xa4
801081d0:	e9 55 f4 ff ff       	jmp    8010762a <alltraps>

801081d5 <vector165>:
801081d5:	6a 00                	push   $0x0
801081d7:	68 a5 00 00 00       	push   $0xa5
801081dc:	e9 49 f4 ff ff       	jmp    8010762a <alltraps>

801081e1 <vector166>:
801081e1:	6a 00                	push   $0x0
801081e3:	68 a6 00 00 00       	push   $0xa6
801081e8:	e9 3d f4 ff ff       	jmp    8010762a <alltraps>

801081ed <vector167>:
801081ed:	6a 00                	push   $0x0
801081ef:	68 a7 00 00 00       	push   $0xa7
801081f4:	e9 31 f4 ff ff       	jmp    8010762a <alltraps>

801081f9 <vector168>:
801081f9:	6a 00                	push   $0x0
801081fb:	68 a8 00 00 00       	push   $0xa8
80108200:	e9 25 f4 ff ff       	jmp    8010762a <alltraps>

80108205 <vector169>:
80108205:	6a 00                	push   $0x0
80108207:	68 a9 00 00 00       	push   $0xa9
8010820c:	e9 19 f4 ff ff       	jmp    8010762a <alltraps>

80108211 <vector170>:
80108211:	6a 00                	push   $0x0
80108213:	68 aa 00 00 00       	push   $0xaa
80108218:	e9 0d f4 ff ff       	jmp    8010762a <alltraps>

8010821d <vector171>:
8010821d:	6a 00                	push   $0x0
8010821f:	68 ab 00 00 00       	push   $0xab
80108224:	e9 01 f4 ff ff       	jmp    8010762a <alltraps>

80108229 <vector172>:
80108229:	6a 00                	push   $0x0
8010822b:	68 ac 00 00 00       	push   $0xac
80108230:	e9 f5 f3 ff ff       	jmp    8010762a <alltraps>

80108235 <vector173>:
80108235:	6a 00                	push   $0x0
80108237:	68 ad 00 00 00       	push   $0xad
8010823c:	e9 e9 f3 ff ff       	jmp    8010762a <alltraps>

80108241 <vector174>:
80108241:	6a 00                	push   $0x0
80108243:	68 ae 00 00 00       	push   $0xae
80108248:	e9 dd f3 ff ff       	jmp    8010762a <alltraps>

8010824d <vector175>:
8010824d:	6a 00                	push   $0x0
8010824f:	68 af 00 00 00       	push   $0xaf
80108254:	e9 d1 f3 ff ff       	jmp    8010762a <alltraps>

80108259 <vector176>:
80108259:	6a 00                	push   $0x0
8010825b:	68 b0 00 00 00       	push   $0xb0
80108260:	e9 c5 f3 ff ff       	jmp    8010762a <alltraps>

80108265 <vector177>:
80108265:	6a 00                	push   $0x0
80108267:	68 b1 00 00 00       	push   $0xb1
8010826c:	e9 b9 f3 ff ff       	jmp    8010762a <alltraps>

80108271 <vector178>:
80108271:	6a 00                	push   $0x0
80108273:	68 b2 00 00 00       	push   $0xb2
80108278:	e9 ad f3 ff ff       	jmp    8010762a <alltraps>

8010827d <vector179>:
8010827d:	6a 00                	push   $0x0
8010827f:	68 b3 00 00 00       	push   $0xb3
80108284:	e9 a1 f3 ff ff       	jmp    8010762a <alltraps>

80108289 <vector180>:
80108289:	6a 00                	push   $0x0
8010828b:	68 b4 00 00 00       	push   $0xb4
80108290:	e9 95 f3 ff ff       	jmp    8010762a <alltraps>

80108295 <vector181>:
80108295:	6a 00                	push   $0x0
80108297:	68 b5 00 00 00       	push   $0xb5
8010829c:	e9 89 f3 ff ff       	jmp    8010762a <alltraps>

801082a1 <vector182>:
801082a1:	6a 00                	push   $0x0
801082a3:	68 b6 00 00 00       	push   $0xb6
801082a8:	e9 7d f3 ff ff       	jmp    8010762a <alltraps>

801082ad <vector183>:
801082ad:	6a 00                	push   $0x0
801082af:	68 b7 00 00 00       	push   $0xb7
801082b4:	e9 71 f3 ff ff       	jmp    8010762a <alltraps>

801082b9 <vector184>:
801082b9:	6a 00                	push   $0x0
801082bb:	68 b8 00 00 00       	push   $0xb8
801082c0:	e9 65 f3 ff ff       	jmp    8010762a <alltraps>

801082c5 <vector185>:
801082c5:	6a 00                	push   $0x0
801082c7:	68 b9 00 00 00       	push   $0xb9
801082cc:	e9 59 f3 ff ff       	jmp    8010762a <alltraps>

801082d1 <vector186>:
801082d1:	6a 00                	push   $0x0
801082d3:	68 ba 00 00 00       	push   $0xba
801082d8:	e9 4d f3 ff ff       	jmp    8010762a <alltraps>

801082dd <vector187>:
801082dd:	6a 00                	push   $0x0
801082df:	68 bb 00 00 00       	push   $0xbb
801082e4:	e9 41 f3 ff ff       	jmp    8010762a <alltraps>

801082e9 <vector188>:
801082e9:	6a 00                	push   $0x0
801082eb:	68 bc 00 00 00       	push   $0xbc
801082f0:	e9 35 f3 ff ff       	jmp    8010762a <alltraps>

801082f5 <vector189>:
801082f5:	6a 00                	push   $0x0
801082f7:	68 bd 00 00 00       	push   $0xbd
801082fc:	e9 29 f3 ff ff       	jmp    8010762a <alltraps>

80108301 <vector190>:
80108301:	6a 00                	push   $0x0
80108303:	68 be 00 00 00       	push   $0xbe
80108308:	e9 1d f3 ff ff       	jmp    8010762a <alltraps>

8010830d <vector191>:
8010830d:	6a 00                	push   $0x0
8010830f:	68 bf 00 00 00       	push   $0xbf
80108314:	e9 11 f3 ff ff       	jmp    8010762a <alltraps>

80108319 <vector192>:
80108319:	6a 00                	push   $0x0
8010831b:	68 c0 00 00 00       	push   $0xc0
80108320:	e9 05 f3 ff ff       	jmp    8010762a <alltraps>

80108325 <vector193>:
80108325:	6a 00                	push   $0x0
80108327:	68 c1 00 00 00       	push   $0xc1
8010832c:	e9 f9 f2 ff ff       	jmp    8010762a <alltraps>

80108331 <vector194>:
80108331:	6a 00                	push   $0x0
80108333:	68 c2 00 00 00       	push   $0xc2
80108338:	e9 ed f2 ff ff       	jmp    8010762a <alltraps>

8010833d <vector195>:
8010833d:	6a 00                	push   $0x0
8010833f:	68 c3 00 00 00       	push   $0xc3
80108344:	e9 e1 f2 ff ff       	jmp    8010762a <alltraps>

80108349 <vector196>:
80108349:	6a 00                	push   $0x0
8010834b:	68 c4 00 00 00       	push   $0xc4
80108350:	e9 d5 f2 ff ff       	jmp    8010762a <alltraps>

80108355 <vector197>:
80108355:	6a 00                	push   $0x0
80108357:	68 c5 00 00 00       	push   $0xc5
8010835c:	e9 c9 f2 ff ff       	jmp    8010762a <alltraps>

80108361 <vector198>:
80108361:	6a 00                	push   $0x0
80108363:	68 c6 00 00 00       	push   $0xc6
80108368:	e9 bd f2 ff ff       	jmp    8010762a <alltraps>

8010836d <vector199>:
8010836d:	6a 00                	push   $0x0
8010836f:	68 c7 00 00 00       	push   $0xc7
80108374:	e9 b1 f2 ff ff       	jmp    8010762a <alltraps>

80108379 <vector200>:
80108379:	6a 00                	push   $0x0
8010837b:	68 c8 00 00 00       	push   $0xc8
80108380:	e9 a5 f2 ff ff       	jmp    8010762a <alltraps>

80108385 <vector201>:
80108385:	6a 00                	push   $0x0
80108387:	68 c9 00 00 00       	push   $0xc9
8010838c:	e9 99 f2 ff ff       	jmp    8010762a <alltraps>

80108391 <vector202>:
80108391:	6a 00                	push   $0x0
80108393:	68 ca 00 00 00       	push   $0xca
80108398:	e9 8d f2 ff ff       	jmp    8010762a <alltraps>

8010839d <vector203>:
8010839d:	6a 00                	push   $0x0
8010839f:	68 cb 00 00 00       	push   $0xcb
801083a4:	e9 81 f2 ff ff       	jmp    8010762a <alltraps>

801083a9 <vector204>:
801083a9:	6a 00                	push   $0x0
801083ab:	68 cc 00 00 00       	push   $0xcc
801083b0:	e9 75 f2 ff ff       	jmp    8010762a <alltraps>

801083b5 <vector205>:
801083b5:	6a 00                	push   $0x0
801083b7:	68 cd 00 00 00       	push   $0xcd
801083bc:	e9 69 f2 ff ff       	jmp    8010762a <alltraps>

801083c1 <vector206>:
801083c1:	6a 00                	push   $0x0
801083c3:	68 ce 00 00 00       	push   $0xce
801083c8:	e9 5d f2 ff ff       	jmp    8010762a <alltraps>

801083cd <vector207>:
801083cd:	6a 00                	push   $0x0
801083cf:	68 cf 00 00 00       	push   $0xcf
801083d4:	e9 51 f2 ff ff       	jmp    8010762a <alltraps>

801083d9 <vector208>:
801083d9:	6a 00                	push   $0x0
801083db:	68 d0 00 00 00       	push   $0xd0
801083e0:	e9 45 f2 ff ff       	jmp    8010762a <alltraps>

801083e5 <vector209>:
801083e5:	6a 00                	push   $0x0
801083e7:	68 d1 00 00 00       	push   $0xd1
801083ec:	e9 39 f2 ff ff       	jmp    8010762a <alltraps>

801083f1 <vector210>:
801083f1:	6a 00                	push   $0x0
801083f3:	68 d2 00 00 00       	push   $0xd2
801083f8:	e9 2d f2 ff ff       	jmp    8010762a <alltraps>

801083fd <vector211>:
801083fd:	6a 00                	push   $0x0
801083ff:	68 d3 00 00 00       	push   $0xd3
80108404:	e9 21 f2 ff ff       	jmp    8010762a <alltraps>

80108409 <vector212>:
80108409:	6a 00                	push   $0x0
8010840b:	68 d4 00 00 00       	push   $0xd4
80108410:	e9 15 f2 ff ff       	jmp    8010762a <alltraps>

80108415 <vector213>:
80108415:	6a 00                	push   $0x0
80108417:	68 d5 00 00 00       	push   $0xd5
8010841c:	e9 09 f2 ff ff       	jmp    8010762a <alltraps>

80108421 <vector214>:
80108421:	6a 00                	push   $0x0
80108423:	68 d6 00 00 00       	push   $0xd6
80108428:	e9 fd f1 ff ff       	jmp    8010762a <alltraps>

8010842d <vector215>:
8010842d:	6a 00                	push   $0x0
8010842f:	68 d7 00 00 00       	push   $0xd7
80108434:	e9 f1 f1 ff ff       	jmp    8010762a <alltraps>

80108439 <vector216>:
80108439:	6a 00                	push   $0x0
8010843b:	68 d8 00 00 00       	push   $0xd8
80108440:	e9 e5 f1 ff ff       	jmp    8010762a <alltraps>

80108445 <vector217>:
80108445:	6a 00                	push   $0x0
80108447:	68 d9 00 00 00       	push   $0xd9
8010844c:	e9 d9 f1 ff ff       	jmp    8010762a <alltraps>

80108451 <vector218>:
80108451:	6a 00                	push   $0x0
80108453:	68 da 00 00 00       	push   $0xda
80108458:	e9 cd f1 ff ff       	jmp    8010762a <alltraps>

8010845d <vector219>:
8010845d:	6a 00                	push   $0x0
8010845f:	68 db 00 00 00       	push   $0xdb
80108464:	e9 c1 f1 ff ff       	jmp    8010762a <alltraps>

80108469 <vector220>:
80108469:	6a 00                	push   $0x0
8010846b:	68 dc 00 00 00       	push   $0xdc
80108470:	e9 b5 f1 ff ff       	jmp    8010762a <alltraps>

80108475 <vector221>:
80108475:	6a 00                	push   $0x0
80108477:	68 dd 00 00 00       	push   $0xdd
8010847c:	e9 a9 f1 ff ff       	jmp    8010762a <alltraps>

80108481 <vector222>:
80108481:	6a 00                	push   $0x0
80108483:	68 de 00 00 00       	push   $0xde
80108488:	e9 9d f1 ff ff       	jmp    8010762a <alltraps>

8010848d <vector223>:
8010848d:	6a 00                	push   $0x0
8010848f:	68 df 00 00 00       	push   $0xdf
80108494:	e9 91 f1 ff ff       	jmp    8010762a <alltraps>

80108499 <vector224>:
80108499:	6a 00                	push   $0x0
8010849b:	68 e0 00 00 00       	push   $0xe0
801084a0:	e9 85 f1 ff ff       	jmp    8010762a <alltraps>

801084a5 <vector225>:
801084a5:	6a 00                	push   $0x0
801084a7:	68 e1 00 00 00       	push   $0xe1
801084ac:	e9 79 f1 ff ff       	jmp    8010762a <alltraps>

801084b1 <vector226>:
801084b1:	6a 00                	push   $0x0
801084b3:	68 e2 00 00 00       	push   $0xe2
801084b8:	e9 6d f1 ff ff       	jmp    8010762a <alltraps>

801084bd <vector227>:
801084bd:	6a 00                	push   $0x0
801084bf:	68 e3 00 00 00       	push   $0xe3
801084c4:	e9 61 f1 ff ff       	jmp    8010762a <alltraps>

801084c9 <vector228>:
801084c9:	6a 00                	push   $0x0
801084cb:	68 e4 00 00 00       	push   $0xe4
801084d0:	e9 55 f1 ff ff       	jmp    8010762a <alltraps>

801084d5 <vector229>:
801084d5:	6a 00                	push   $0x0
801084d7:	68 e5 00 00 00       	push   $0xe5
801084dc:	e9 49 f1 ff ff       	jmp    8010762a <alltraps>

801084e1 <vector230>:
801084e1:	6a 00                	push   $0x0
801084e3:	68 e6 00 00 00       	push   $0xe6
801084e8:	e9 3d f1 ff ff       	jmp    8010762a <alltraps>

801084ed <vector231>:
801084ed:	6a 00                	push   $0x0
801084ef:	68 e7 00 00 00       	push   $0xe7
801084f4:	e9 31 f1 ff ff       	jmp    8010762a <alltraps>

801084f9 <vector232>:
801084f9:	6a 00                	push   $0x0
801084fb:	68 e8 00 00 00       	push   $0xe8
80108500:	e9 25 f1 ff ff       	jmp    8010762a <alltraps>

80108505 <vector233>:
80108505:	6a 00                	push   $0x0
80108507:	68 e9 00 00 00       	push   $0xe9
8010850c:	e9 19 f1 ff ff       	jmp    8010762a <alltraps>

80108511 <vector234>:
80108511:	6a 00                	push   $0x0
80108513:	68 ea 00 00 00       	push   $0xea
80108518:	e9 0d f1 ff ff       	jmp    8010762a <alltraps>

8010851d <vector235>:
8010851d:	6a 00                	push   $0x0
8010851f:	68 eb 00 00 00       	push   $0xeb
80108524:	e9 01 f1 ff ff       	jmp    8010762a <alltraps>

80108529 <vector236>:
80108529:	6a 00                	push   $0x0
8010852b:	68 ec 00 00 00       	push   $0xec
80108530:	e9 f5 f0 ff ff       	jmp    8010762a <alltraps>

80108535 <vector237>:
80108535:	6a 00                	push   $0x0
80108537:	68 ed 00 00 00       	push   $0xed
8010853c:	e9 e9 f0 ff ff       	jmp    8010762a <alltraps>

80108541 <vector238>:
80108541:	6a 00                	push   $0x0
80108543:	68 ee 00 00 00       	push   $0xee
80108548:	e9 dd f0 ff ff       	jmp    8010762a <alltraps>

8010854d <vector239>:
8010854d:	6a 00                	push   $0x0
8010854f:	68 ef 00 00 00       	push   $0xef
80108554:	e9 d1 f0 ff ff       	jmp    8010762a <alltraps>

80108559 <vector240>:
80108559:	6a 00                	push   $0x0
8010855b:	68 f0 00 00 00       	push   $0xf0
80108560:	e9 c5 f0 ff ff       	jmp    8010762a <alltraps>

80108565 <vector241>:
80108565:	6a 00                	push   $0x0
80108567:	68 f1 00 00 00       	push   $0xf1
8010856c:	e9 b9 f0 ff ff       	jmp    8010762a <alltraps>

80108571 <vector242>:
80108571:	6a 00                	push   $0x0
80108573:	68 f2 00 00 00       	push   $0xf2
80108578:	e9 ad f0 ff ff       	jmp    8010762a <alltraps>

8010857d <vector243>:
8010857d:	6a 00                	push   $0x0
8010857f:	68 f3 00 00 00       	push   $0xf3
80108584:	e9 a1 f0 ff ff       	jmp    8010762a <alltraps>

80108589 <vector244>:
80108589:	6a 00                	push   $0x0
8010858b:	68 f4 00 00 00       	push   $0xf4
80108590:	e9 95 f0 ff ff       	jmp    8010762a <alltraps>

80108595 <vector245>:
80108595:	6a 00                	push   $0x0
80108597:	68 f5 00 00 00       	push   $0xf5
8010859c:	e9 89 f0 ff ff       	jmp    8010762a <alltraps>

801085a1 <vector246>:
801085a1:	6a 00                	push   $0x0
801085a3:	68 f6 00 00 00       	push   $0xf6
801085a8:	e9 7d f0 ff ff       	jmp    8010762a <alltraps>

801085ad <vector247>:
801085ad:	6a 00                	push   $0x0
801085af:	68 f7 00 00 00       	push   $0xf7
801085b4:	e9 71 f0 ff ff       	jmp    8010762a <alltraps>

801085b9 <vector248>:
801085b9:	6a 00                	push   $0x0
801085bb:	68 f8 00 00 00       	push   $0xf8
801085c0:	e9 65 f0 ff ff       	jmp    8010762a <alltraps>

801085c5 <vector249>:
801085c5:	6a 00                	push   $0x0
801085c7:	68 f9 00 00 00       	push   $0xf9
801085cc:	e9 59 f0 ff ff       	jmp    8010762a <alltraps>

801085d1 <vector250>:
801085d1:	6a 00                	push   $0x0
801085d3:	68 fa 00 00 00       	push   $0xfa
801085d8:	e9 4d f0 ff ff       	jmp    8010762a <alltraps>

801085dd <vector251>:
801085dd:	6a 00                	push   $0x0
801085df:	68 fb 00 00 00       	push   $0xfb
801085e4:	e9 41 f0 ff ff       	jmp    8010762a <alltraps>

801085e9 <vector252>:
801085e9:	6a 00                	push   $0x0
801085eb:	68 fc 00 00 00       	push   $0xfc
801085f0:	e9 35 f0 ff ff       	jmp    8010762a <alltraps>

801085f5 <vector253>:
801085f5:	6a 00                	push   $0x0
801085f7:	68 fd 00 00 00       	push   $0xfd
801085fc:	e9 29 f0 ff ff       	jmp    8010762a <alltraps>

80108601 <vector254>:
80108601:	6a 00                	push   $0x0
80108603:	68 fe 00 00 00       	push   $0xfe
80108608:	e9 1d f0 ff ff       	jmp    8010762a <alltraps>

8010860d <vector255>:
8010860d:	6a 00                	push   $0x0
8010860f:	68 ff 00 00 00       	push   $0xff
80108614:	e9 11 f0 ff ff       	jmp    8010762a <alltraps>
80108619:	66 90                	xchg   %ax,%ax
8010861b:	66 90                	xchg   %ax,%ax
8010861d:	66 90                	xchg   %ax,%ax
8010861f:	90                   	nop

80108620 <walkpgdir>:
80108620:	55                   	push   %ebp
80108621:	89 e5                	mov    %esp,%ebp
80108623:	57                   	push   %edi
80108624:	56                   	push   %esi
80108625:	53                   	push   %ebx
80108626:	89 d3                	mov    %edx,%ebx
80108628:	89 d7                	mov    %edx,%edi
8010862a:	c1 eb 16             	shr    $0x16,%ebx
8010862d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
80108630:	83 ec 0c             	sub    $0xc,%esp
80108633:	8b 06                	mov    (%esi),%eax
80108635:	a8 01                	test   $0x1,%al
80108637:	74 27                	je     80108660 <walkpgdir+0x40>
80108639:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010863e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80108644:	c1 ef 0a             	shr    $0xa,%edi
80108647:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010864a:	89 fa                	mov    %edi,%edx
8010864c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80108652:	8d 04 13             	lea    (%ebx,%edx,1),%eax
80108655:	5b                   	pop    %ebx
80108656:	5e                   	pop    %esi
80108657:	5f                   	pop    %edi
80108658:	5d                   	pop    %ebp
80108659:	c3                   	ret    
8010865a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80108660:	85 c9                	test   %ecx,%ecx
80108662:	74 2c                	je     80108690 <walkpgdir+0x70>
80108664:	e8 17 ab ff ff       	call   80103180 <kalloc>
80108669:	85 c0                	test   %eax,%eax
8010866b:	89 c3                	mov    %eax,%ebx
8010866d:	74 21                	je     80108690 <walkpgdir+0x70>
8010866f:	83 ec 04             	sub    $0x4,%esp
80108672:	68 00 10 00 00       	push   $0x1000
80108677:	6a 00                	push   $0x0
80108679:	50                   	push   %eax
8010867a:	e8 51 d7 ff ff       	call   80105dd0 <memset>
8010867f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80108685:	83 c4 10             	add    $0x10,%esp
80108688:	83 c8 07             	or     $0x7,%eax
8010868b:	89 06                	mov    %eax,(%esi)
8010868d:	eb b5                	jmp    80108644 <walkpgdir+0x24>
8010868f:	90                   	nop
80108690:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108693:	31 c0                	xor    %eax,%eax
80108695:	5b                   	pop    %ebx
80108696:	5e                   	pop    %esi
80108697:	5f                   	pop    %edi
80108698:	5d                   	pop    %ebp
80108699:	c3                   	ret    
8010869a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801086a0 <mappages>:
801086a0:	55                   	push   %ebp
801086a1:	89 e5                	mov    %esp,%ebp
801086a3:	57                   	push   %edi
801086a4:	56                   	push   %esi
801086a5:	53                   	push   %ebx
801086a6:	89 d3                	mov    %edx,%ebx
801086a8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801086ae:	83 ec 1c             	sub    $0x1c,%esp
801086b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801086b4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801086b8:	8b 7d 08             	mov    0x8(%ebp),%edi
801086bb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801086c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801086c3:	8b 45 0c             	mov    0xc(%ebp),%eax
801086c6:	29 df                	sub    %ebx,%edi
801086c8:	83 c8 01             	or     $0x1,%eax
801086cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801086ce:	eb 15                	jmp    801086e5 <mappages+0x45>
801086d0:	f6 00 01             	testb  $0x1,(%eax)
801086d3:	75 45                	jne    8010871a <mappages+0x7a>
801086d5:	0b 75 dc             	or     -0x24(%ebp),%esi
801086d8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
801086db:	89 30                	mov    %esi,(%eax)
801086dd:	74 31                	je     80108710 <mappages+0x70>
801086df:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801086e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801086e8:	b9 01 00 00 00       	mov    $0x1,%ecx
801086ed:	89 da                	mov    %ebx,%edx
801086ef:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801086f2:	e8 29 ff ff ff       	call   80108620 <walkpgdir>
801086f7:	85 c0                	test   %eax,%eax
801086f9:	75 d5                	jne    801086d0 <mappages+0x30>
801086fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801086fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80108703:	5b                   	pop    %ebx
80108704:	5e                   	pop    %esi
80108705:	5f                   	pop    %edi
80108706:	5d                   	pop    %ebp
80108707:	c3                   	ret    
80108708:	90                   	nop
80108709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108710:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108713:	31 c0                	xor    %eax,%eax
80108715:	5b                   	pop    %ebx
80108716:	5e                   	pop    %esi
80108717:	5f                   	pop    %edi
80108718:	5d                   	pop    %ebp
80108719:	c3                   	ret    
8010871a:	83 ec 0c             	sub    $0xc,%esp
8010871d:	68 88 9f 10 80       	push   $0x80109f88
80108722:	e8 49 82 ff ff       	call   80100970 <panic>
80108727:	89 f6                	mov    %esi,%esi
80108729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80108730 <deallocuvm.part.0>:
80108730:	55                   	push   %ebp
80108731:	89 e5                	mov    %esp,%ebp
80108733:	57                   	push   %edi
80108734:	56                   	push   %esi
80108735:	53                   	push   %ebx
80108736:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010873c:	89 c7                	mov    %eax,%edi
8010873e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80108744:	83 ec 1c             	sub    $0x1c,%esp
80108747:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010874a:	39 d3                	cmp    %edx,%ebx
8010874c:	73 66                	jae    801087b4 <deallocuvm.part.0+0x84>
8010874e:	89 d6                	mov    %edx,%esi
80108750:	eb 3d                	jmp    8010878f <deallocuvm.part.0+0x5f>
80108752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80108758:	8b 10                	mov    (%eax),%edx
8010875a:	f6 c2 01             	test   $0x1,%dl
8010875d:	74 26                	je     80108785 <deallocuvm.part.0+0x55>
8010875f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80108765:	74 58                	je     801087bf <deallocuvm.part.0+0x8f>
80108767:	83 ec 0c             	sub    $0xc,%esp
8010876a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80108770:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80108773:	52                   	push   %edx
80108774:	e8 57 a8 ff ff       	call   80102fd0 <kfree>
80108779:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010877c:	83 c4 10             	add    $0x10,%esp
8010877f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80108785:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010878b:	39 f3                	cmp    %esi,%ebx
8010878d:	73 25                	jae    801087b4 <deallocuvm.part.0+0x84>
8010878f:	31 c9                	xor    %ecx,%ecx
80108791:	89 da                	mov    %ebx,%edx
80108793:	89 f8                	mov    %edi,%eax
80108795:	e8 86 fe ff ff       	call   80108620 <walkpgdir>
8010879a:	85 c0                	test   %eax,%eax
8010879c:	75 ba                	jne    80108758 <deallocuvm.part.0+0x28>
8010879e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
801087a4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
801087aa:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801087b0:	39 f3                	cmp    %esi,%ebx
801087b2:	72 db                	jb     8010878f <deallocuvm.part.0+0x5f>
801087b4:	8b 45 e0             	mov    -0x20(%ebp),%eax
801087b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801087ba:	5b                   	pop    %ebx
801087bb:	5e                   	pop    %esi
801087bc:	5f                   	pop    %edi
801087bd:	5d                   	pop    %ebp
801087be:	c3                   	ret    
801087bf:	83 ec 0c             	sub    $0xc,%esp
801087c2:	68 7e 94 10 80       	push   $0x8010947e
801087c7:	e8 a4 81 ff ff       	call   80100970 <panic>
801087cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801087d0 <seginit>:
801087d0:	55                   	push   %ebp
801087d1:	89 e5                	mov    %esp,%ebp
801087d3:	83 ec 18             	sub    $0x18,%esp
801087d6:	e8 65 c9 ff ff       	call   80105140 <cpuid>
801087db:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
801087e1:	ba 2f 00 00 00       	mov    $0x2f,%edx
801087e6:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
801087ea:	c7 80 b8 c3 15 80 ff 	movl   $0xffff,-0x7fea3c48(%eax)
801087f1:	ff 00 00 
801087f4:	c7 80 bc c3 15 80 00 	movl   $0xcf9a00,-0x7fea3c44(%eax)
801087fb:	9a cf 00 
801087fe:	c7 80 c0 c3 15 80 ff 	movl   $0xffff,-0x7fea3c40(%eax)
80108805:	ff 00 00 
80108808:	c7 80 c4 c3 15 80 00 	movl   $0xcf9200,-0x7fea3c3c(%eax)
8010880f:	92 cf 00 
80108812:	c7 80 c8 c3 15 80 ff 	movl   $0xffff,-0x7fea3c38(%eax)
80108819:	ff 00 00 
8010881c:	c7 80 cc c3 15 80 00 	movl   $0xcffa00,-0x7fea3c34(%eax)
80108823:	fa cf 00 
80108826:	c7 80 d0 c3 15 80 ff 	movl   $0xffff,-0x7fea3c30(%eax)
8010882d:	ff 00 00 
80108830:	c7 80 d4 c3 15 80 00 	movl   $0xcff200,-0x7fea3c2c(%eax)
80108837:	f2 cf 00 
8010883a:	05 b0 c3 15 80       	add    $0x8015c3b0,%eax
8010883f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80108843:	c1 e8 10             	shr    $0x10,%eax
80108846:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
8010884a:	8d 45 f2             	lea    -0xe(%ebp),%eax
8010884d:	0f 01 10             	lgdtl  (%eax)
80108850:	c9                   	leave  
80108851:	c3                   	ret    
80108852:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80108860 <switchkvm>:
80108860:	a1 64 f0 15 80       	mov    0x8015f064,%eax
80108865:	55                   	push   %ebp
80108866:	89 e5                	mov    %esp,%ebp
80108868:	05 00 00 00 80       	add    $0x80000000,%eax
8010886d:	0f 22 d8             	mov    %eax,%cr3
80108870:	5d                   	pop    %ebp
80108871:	c3                   	ret    
80108872:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80108880 <switchuvm>:
80108880:	55                   	push   %ebp
80108881:	89 e5                	mov    %esp,%ebp
80108883:	57                   	push   %edi
80108884:	56                   	push   %esi
80108885:	53                   	push   %ebx
80108886:	83 ec 1c             	sub    $0x1c,%esp
80108889:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010888c:	85 db                	test   %ebx,%ebx
8010888e:	0f 84 cb 00 00 00    	je     8010895f <switchuvm+0xdf>
80108894:	8b 43 08             	mov    0x8(%ebx),%eax
80108897:	85 c0                	test   %eax,%eax
80108899:	0f 84 da 00 00 00    	je     80108979 <switchuvm+0xf9>
8010889f:	8b 43 04             	mov    0x4(%ebx),%eax
801088a2:	85 c0                	test   %eax,%eax
801088a4:	0f 84 c2 00 00 00    	je     8010896c <switchuvm+0xec>
801088aa:	e8 61 d3 ff ff       	call   80105c10 <pushcli>
801088af:	e8 0c c8 ff ff       	call   801050c0 <mycpu>
801088b4:	89 c6                	mov    %eax,%esi
801088b6:	e8 05 c8 ff ff       	call   801050c0 <mycpu>
801088bb:	89 c7                	mov    %eax,%edi
801088bd:	e8 fe c7 ff ff       	call   801050c0 <mycpu>
801088c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801088c5:	83 c7 08             	add    $0x8,%edi
801088c8:	e8 f3 c7 ff ff       	call   801050c0 <mycpu>
801088cd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801088d0:	83 c0 08             	add    $0x8,%eax
801088d3:	ba 67 00 00 00       	mov    $0x67,%edx
801088d8:	c1 e8 18             	shr    $0x18,%eax
801088db:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
801088e2:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
801088e9:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
801088ef:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801088f4:	83 c1 08             	add    $0x8,%ecx
801088f7:	c1 e9 10             	shr    $0x10,%ecx
801088fa:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80108900:	b9 99 40 00 00       	mov    $0x4099,%ecx
80108905:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
8010890c:	be 10 00 00 00       	mov    $0x10,%esi
80108911:	e8 aa c7 ff ff       	call   801050c0 <mycpu>
80108916:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
8010891d:	e8 9e c7 ff ff       	call   801050c0 <mycpu>
80108922:	66 89 70 10          	mov    %si,0x10(%eax)
80108926:	8b 73 08             	mov    0x8(%ebx),%esi
80108929:	e8 92 c7 ff ff       	call   801050c0 <mycpu>
8010892e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80108934:	89 70 0c             	mov    %esi,0xc(%eax)
80108937:	e8 84 c7 ff ff       	call   801050c0 <mycpu>
8010893c:	66 89 78 6e          	mov    %di,0x6e(%eax)
80108940:	b8 28 00 00 00       	mov    $0x28,%eax
80108945:	0f 00 d8             	ltr    %ax
80108948:	8b 43 04             	mov    0x4(%ebx),%eax
8010894b:	05 00 00 00 80       	add    $0x80000000,%eax
80108950:	0f 22 d8             	mov    %eax,%cr3
80108953:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108956:	5b                   	pop    %ebx
80108957:	5e                   	pop    %esi
80108958:	5f                   	pop    %edi
80108959:	5d                   	pop    %ebp
8010895a:	e9 b1 d3 ff ff       	jmp    80105d10 <popcli>
8010895f:	83 ec 0c             	sub    $0xc,%esp
80108962:	68 8e 9f 10 80       	push   $0x80109f8e
80108967:	e8 04 80 ff ff       	call   80100970 <panic>
8010896c:	83 ec 0c             	sub    $0xc,%esp
8010896f:	68 b9 9f 10 80       	push   $0x80109fb9
80108974:	e8 f7 7f ff ff       	call   80100970 <panic>
80108979:	83 ec 0c             	sub    $0xc,%esp
8010897c:	68 a4 9f 10 80       	push   $0x80109fa4
80108981:	e8 ea 7f ff ff       	call   80100970 <panic>
80108986:	8d 76 00             	lea    0x0(%esi),%esi
80108989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80108990 <inituvm>:
80108990:	55                   	push   %ebp
80108991:	89 e5                	mov    %esp,%ebp
80108993:	57                   	push   %edi
80108994:	56                   	push   %esi
80108995:	53                   	push   %ebx
80108996:	83 ec 1c             	sub    $0x1c,%esp
80108999:	8b 75 10             	mov    0x10(%ebp),%esi
8010899c:	8b 45 08             	mov    0x8(%ebp),%eax
8010899f:	8b 7d 0c             	mov    0xc(%ebp),%edi
801089a2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801089a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801089ab:	77 49                	ja     801089f6 <inituvm+0x66>
801089ad:	e8 ce a7 ff ff       	call   80103180 <kalloc>
801089b2:	83 ec 04             	sub    $0x4,%esp
801089b5:	89 c3                	mov    %eax,%ebx
801089b7:	68 00 10 00 00       	push   $0x1000
801089bc:	6a 00                	push   $0x0
801089be:	50                   	push   %eax
801089bf:	e8 0c d4 ff ff       	call   80105dd0 <memset>
801089c4:	58                   	pop    %eax
801089c5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801089cb:	b9 00 10 00 00       	mov    $0x1000,%ecx
801089d0:	5a                   	pop    %edx
801089d1:	6a 06                	push   $0x6
801089d3:	50                   	push   %eax
801089d4:	31 d2                	xor    %edx,%edx
801089d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801089d9:	e8 c2 fc ff ff       	call   801086a0 <mappages>
801089de:	89 75 10             	mov    %esi,0x10(%ebp)
801089e1:	89 7d 0c             	mov    %edi,0xc(%ebp)
801089e4:	83 c4 10             	add    $0x10,%esp
801089e7:	89 5d 08             	mov    %ebx,0x8(%ebp)
801089ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801089ed:	5b                   	pop    %ebx
801089ee:	5e                   	pop    %esi
801089ef:	5f                   	pop    %edi
801089f0:	5d                   	pop    %ebp
801089f1:	e9 8a d4 ff ff       	jmp    80105e80 <memmove>
801089f6:	83 ec 0c             	sub    $0xc,%esp
801089f9:	68 cd 9f 10 80       	push   $0x80109fcd
801089fe:	e8 6d 7f ff ff       	call   80100970 <panic>
80108a03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80108a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80108a10 <loaduvm>:
80108a10:	55                   	push   %ebp
80108a11:	89 e5                	mov    %esp,%ebp
80108a13:	57                   	push   %edi
80108a14:	56                   	push   %esi
80108a15:	53                   	push   %ebx
80108a16:	83 ec 0c             	sub    $0xc,%esp
80108a19:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80108a20:	0f 85 91 00 00 00    	jne    80108ab7 <loaduvm+0xa7>
80108a26:	8b 75 18             	mov    0x18(%ebp),%esi
80108a29:	31 db                	xor    %ebx,%ebx
80108a2b:	85 f6                	test   %esi,%esi
80108a2d:	75 1a                	jne    80108a49 <loaduvm+0x39>
80108a2f:	eb 6f                	jmp    80108aa0 <loaduvm+0x90>
80108a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108a38:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80108a3e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80108a44:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80108a47:	76 57                	jbe    80108aa0 <loaduvm+0x90>
80108a49:	8b 55 0c             	mov    0xc(%ebp),%edx
80108a4c:	8b 45 08             	mov    0x8(%ebp),%eax
80108a4f:	31 c9                	xor    %ecx,%ecx
80108a51:	01 da                	add    %ebx,%edx
80108a53:	e8 c8 fb ff ff       	call   80108620 <walkpgdir>
80108a58:	85 c0                	test   %eax,%eax
80108a5a:	74 4e                	je     80108aaa <loaduvm+0x9a>
80108a5c:	8b 00                	mov    (%eax),%eax
80108a5e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80108a61:	bf 00 10 00 00       	mov    $0x1000,%edi
80108a66:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108a6b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80108a71:	0f 46 fe             	cmovbe %esi,%edi
80108a74:	01 d9                	add    %ebx,%ecx
80108a76:	05 00 00 00 80       	add    $0x80000000,%eax
80108a7b:	57                   	push   %edi
80108a7c:	51                   	push   %ecx
80108a7d:	50                   	push   %eax
80108a7e:	ff 75 10             	pushl  0x10(%ebp)
80108a81:	e8 9a 9b ff ff       	call   80102620 <readi>
80108a86:	83 c4 10             	add    $0x10,%esp
80108a89:	39 f8                	cmp    %edi,%eax
80108a8b:	74 ab                	je     80108a38 <loaduvm+0x28>
80108a8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108a90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80108a95:	5b                   	pop    %ebx
80108a96:	5e                   	pop    %esi
80108a97:	5f                   	pop    %edi
80108a98:	5d                   	pop    %ebp
80108a99:	c3                   	ret    
80108a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80108aa0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108aa3:	31 c0                	xor    %eax,%eax
80108aa5:	5b                   	pop    %ebx
80108aa6:	5e                   	pop    %esi
80108aa7:	5f                   	pop    %edi
80108aa8:	5d                   	pop    %ebp
80108aa9:	c3                   	ret    
80108aaa:	83 ec 0c             	sub    $0xc,%esp
80108aad:	68 e7 9f 10 80       	push   $0x80109fe7
80108ab2:	e8 b9 7e ff ff       	call   80100970 <panic>
80108ab7:	83 ec 0c             	sub    $0xc,%esp
80108aba:	68 88 a0 10 80       	push   $0x8010a088
80108abf:	e8 ac 7e ff ff       	call   80100970 <panic>
80108ac4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80108aca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80108ad0 <allocuvm>:
80108ad0:	55                   	push   %ebp
80108ad1:	89 e5                	mov    %esp,%ebp
80108ad3:	57                   	push   %edi
80108ad4:	56                   	push   %esi
80108ad5:	53                   	push   %ebx
80108ad6:	83 ec 1c             	sub    $0x1c,%esp
80108ad9:	8b 7d 10             	mov    0x10(%ebp),%edi
80108adc:	85 ff                	test   %edi,%edi
80108ade:	0f 88 8e 00 00 00    	js     80108b72 <allocuvm+0xa2>
80108ae4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80108ae7:	0f 82 93 00 00 00    	jb     80108b80 <allocuvm+0xb0>
80108aed:	8b 45 0c             	mov    0xc(%ebp),%eax
80108af0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80108af6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80108afc:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80108aff:	0f 86 7e 00 00 00    	jbe    80108b83 <allocuvm+0xb3>
80108b05:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80108b08:	8b 7d 08             	mov    0x8(%ebp),%edi
80108b0b:	eb 42                	jmp    80108b4f <allocuvm+0x7f>
80108b0d:	8d 76 00             	lea    0x0(%esi),%esi
80108b10:	83 ec 04             	sub    $0x4,%esp
80108b13:	68 00 10 00 00       	push   $0x1000
80108b18:	6a 00                	push   $0x0
80108b1a:	50                   	push   %eax
80108b1b:	e8 b0 d2 ff ff       	call   80105dd0 <memset>
80108b20:	58                   	pop    %eax
80108b21:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80108b27:	b9 00 10 00 00       	mov    $0x1000,%ecx
80108b2c:	5a                   	pop    %edx
80108b2d:	6a 06                	push   $0x6
80108b2f:	50                   	push   %eax
80108b30:	89 da                	mov    %ebx,%edx
80108b32:	89 f8                	mov    %edi,%eax
80108b34:	e8 67 fb ff ff       	call   801086a0 <mappages>
80108b39:	83 c4 10             	add    $0x10,%esp
80108b3c:	85 c0                	test   %eax,%eax
80108b3e:	78 50                	js     80108b90 <allocuvm+0xc0>
80108b40:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80108b46:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80108b49:	0f 86 81 00 00 00    	jbe    80108bd0 <allocuvm+0x100>
80108b4f:	e8 2c a6 ff ff       	call   80103180 <kalloc>
80108b54:	85 c0                	test   %eax,%eax
80108b56:	89 c6                	mov    %eax,%esi
80108b58:	75 b6                	jne    80108b10 <allocuvm+0x40>
80108b5a:	83 ec 0c             	sub    $0xc,%esp
80108b5d:	68 05 a0 10 80       	push   $0x8010a005
80108b62:	e8 d9 80 ff ff       	call   80100c40 <cprintf>
80108b67:	83 c4 10             	add    $0x10,%esp
80108b6a:	8b 45 0c             	mov    0xc(%ebp),%eax
80108b6d:	39 45 10             	cmp    %eax,0x10(%ebp)
80108b70:	77 6e                	ja     80108be0 <allocuvm+0x110>
80108b72:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108b75:	31 ff                	xor    %edi,%edi
80108b77:	89 f8                	mov    %edi,%eax
80108b79:	5b                   	pop    %ebx
80108b7a:	5e                   	pop    %esi
80108b7b:	5f                   	pop    %edi
80108b7c:	5d                   	pop    %ebp
80108b7d:	c3                   	ret    
80108b7e:	66 90                	xchg   %ax,%ax
80108b80:	8b 7d 0c             	mov    0xc(%ebp),%edi
80108b83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108b86:	89 f8                	mov    %edi,%eax
80108b88:	5b                   	pop    %ebx
80108b89:	5e                   	pop    %esi
80108b8a:	5f                   	pop    %edi
80108b8b:	5d                   	pop    %ebp
80108b8c:	c3                   	ret    
80108b8d:	8d 76 00             	lea    0x0(%esi),%esi
80108b90:	83 ec 0c             	sub    $0xc,%esp
80108b93:	68 1d a0 10 80       	push   $0x8010a01d
80108b98:	e8 a3 80 ff ff       	call   80100c40 <cprintf>
80108b9d:	83 c4 10             	add    $0x10,%esp
80108ba0:	8b 45 0c             	mov    0xc(%ebp),%eax
80108ba3:	39 45 10             	cmp    %eax,0x10(%ebp)
80108ba6:	76 0d                	jbe    80108bb5 <allocuvm+0xe5>
80108ba8:	89 c1                	mov    %eax,%ecx
80108baa:	8b 55 10             	mov    0x10(%ebp),%edx
80108bad:	8b 45 08             	mov    0x8(%ebp),%eax
80108bb0:	e8 7b fb ff ff       	call   80108730 <deallocuvm.part.0>
80108bb5:	83 ec 0c             	sub    $0xc,%esp
80108bb8:	31 ff                	xor    %edi,%edi
80108bba:	56                   	push   %esi
80108bbb:	e8 10 a4 ff ff       	call   80102fd0 <kfree>
80108bc0:	83 c4 10             	add    $0x10,%esp
80108bc3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108bc6:	89 f8                	mov    %edi,%eax
80108bc8:	5b                   	pop    %ebx
80108bc9:	5e                   	pop    %esi
80108bca:	5f                   	pop    %edi
80108bcb:	5d                   	pop    %ebp
80108bcc:	c3                   	ret    
80108bcd:	8d 76 00             	lea    0x0(%esi),%esi
80108bd0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80108bd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108bd6:	5b                   	pop    %ebx
80108bd7:	89 f8                	mov    %edi,%eax
80108bd9:	5e                   	pop    %esi
80108bda:	5f                   	pop    %edi
80108bdb:	5d                   	pop    %ebp
80108bdc:	c3                   	ret    
80108bdd:	8d 76 00             	lea    0x0(%esi),%esi
80108be0:	89 c1                	mov    %eax,%ecx
80108be2:	8b 55 10             	mov    0x10(%ebp),%edx
80108be5:	8b 45 08             	mov    0x8(%ebp),%eax
80108be8:	31 ff                	xor    %edi,%edi
80108bea:	e8 41 fb ff ff       	call   80108730 <deallocuvm.part.0>
80108bef:	eb 92                	jmp    80108b83 <allocuvm+0xb3>
80108bf1:	eb 0d                	jmp    80108c00 <deallocuvm>
80108bf3:	90                   	nop
80108bf4:	90                   	nop
80108bf5:	90                   	nop
80108bf6:	90                   	nop
80108bf7:	90                   	nop
80108bf8:	90                   	nop
80108bf9:	90                   	nop
80108bfa:	90                   	nop
80108bfb:	90                   	nop
80108bfc:	90                   	nop
80108bfd:	90                   	nop
80108bfe:	90                   	nop
80108bff:	90                   	nop

80108c00 <deallocuvm>:
80108c00:	55                   	push   %ebp
80108c01:	89 e5                	mov    %esp,%ebp
80108c03:	8b 55 0c             	mov    0xc(%ebp),%edx
80108c06:	8b 4d 10             	mov    0x10(%ebp),%ecx
80108c09:	8b 45 08             	mov    0x8(%ebp),%eax
80108c0c:	39 d1                	cmp    %edx,%ecx
80108c0e:	73 10                	jae    80108c20 <deallocuvm+0x20>
80108c10:	5d                   	pop    %ebp
80108c11:	e9 1a fb ff ff       	jmp    80108730 <deallocuvm.part.0>
80108c16:	8d 76 00             	lea    0x0(%esi),%esi
80108c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80108c20:	89 d0                	mov    %edx,%eax
80108c22:	5d                   	pop    %ebp
80108c23:	c3                   	ret    
80108c24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80108c2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80108c30 <freevm>:
80108c30:	55                   	push   %ebp
80108c31:	89 e5                	mov    %esp,%ebp
80108c33:	57                   	push   %edi
80108c34:	56                   	push   %esi
80108c35:	53                   	push   %ebx
80108c36:	83 ec 0c             	sub    $0xc,%esp
80108c39:	8b 75 08             	mov    0x8(%ebp),%esi
80108c3c:	85 f6                	test   %esi,%esi
80108c3e:	74 59                	je     80108c99 <freevm+0x69>
80108c40:	31 c9                	xor    %ecx,%ecx
80108c42:	ba 00 00 00 80       	mov    $0x80000000,%edx
80108c47:	89 f0                	mov    %esi,%eax
80108c49:	e8 e2 fa ff ff       	call   80108730 <deallocuvm.part.0>
80108c4e:	89 f3                	mov    %esi,%ebx
80108c50:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80108c56:	eb 0f                	jmp    80108c67 <freevm+0x37>
80108c58:	90                   	nop
80108c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108c60:	83 c3 04             	add    $0x4,%ebx
80108c63:	39 fb                	cmp    %edi,%ebx
80108c65:	74 23                	je     80108c8a <freevm+0x5a>
80108c67:	8b 03                	mov    (%ebx),%eax
80108c69:	a8 01                	test   $0x1,%al
80108c6b:	74 f3                	je     80108c60 <freevm+0x30>
80108c6d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108c72:	83 ec 0c             	sub    $0xc,%esp
80108c75:	83 c3 04             	add    $0x4,%ebx
80108c78:	05 00 00 00 80       	add    $0x80000000,%eax
80108c7d:	50                   	push   %eax
80108c7e:	e8 4d a3 ff ff       	call   80102fd0 <kfree>
80108c83:	83 c4 10             	add    $0x10,%esp
80108c86:	39 fb                	cmp    %edi,%ebx
80108c88:	75 dd                	jne    80108c67 <freevm+0x37>
80108c8a:	89 75 08             	mov    %esi,0x8(%ebp)
80108c8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108c90:	5b                   	pop    %ebx
80108c91:	5e                   	pop    %esi
80108c92:	5f                   	pop    %edi
80108c93:	5d                   	pop    %ebp
80108c94:	e9 37 a3 ff ff       	jmp    80102fd0 <kfree>
80108c99:	83 ec 0c             	sub    $0xc,%esp
80108c9c:	68 39 a0 10 80       	push   $0x8010a039
80108ca1:	e8 ca 7c ff ff       	call   80100970 <panic>
80108ca6:	8d 76 00             	lea    0x0(%esi),%esi
80108ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80108cb0 <setupkvm>:
80108cb0:	55                   	push   %ebp
80108cb1:	89 e5                	mov    %esp,%ebp
80108cb3:	56                   	push   %esi
80108cb4:	53                   	push   %ebx
80108cb5:	e8 c6 a4 ff ff       	call   80103180 <kalloc>
80108cba:	85 c0                	test   %eax,%eax
80108cbc:	89 c6                	mov    %eax,%esi
80108cbe:	74 42                	je     80108d02 <setupkvm+0x52>
80108cc0:	83 ec 04             	sub    $0x4,%esp
80108cc3:	bb 60 d4 10 80       	mov    $0x8010d460,%ebx
80108cc8:	68 00 10 00 00       	push   $0x1000
80108ccd:	6a 00                	push   $0x0
80108ccf:	50                   	push   %eax
80108cd0:	e8 fb d0 ff ff       	call   80105dd0 <memset>
80108cd5:	83 c4 10             	add    $0x10,%esp
80108cd8:	8b 43 04             	mov    0x4(%ebx),%eax
80108cdb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80108cde:	83 ec 08             	sub    $0x8,%esp
80108ce1:	8b 13                	mov    (%ebx),%edx
80108ce3:	ff 73 0c             	pushl  0xc(%ebx)
80108ce6:	50                   	push   %eax
80108ce7:	29 c1                	sub    %eax,%ecx
80108ce9:	89 f0                	mov    %esi,%eax
80108ceb:	e8 b0 f9 ff ff       	call   801086a0 <mappages>
80108cf0:	83 c4 10             	add    $0x10,%esp
80108cf3:	85 c0                	test   %eax,%eax
80108cf5:	78 19                	js     80108d10 <setupkvm+0x60>
80108cf7:	83 c3 10             	add    $0x10,%ebx
80108cfa:	81 fb a0 d4 10 80    	cmp    $0x8010d4a0,%ebx
80108d00:	75 d6                	jne    80108cd8 <setupkvm+0x28>
80108d02:	8d 65 f8             	lea    -0x8(%ebp),%esp
80108d05:	89 f0                	mov    %esi,%eax
80108d07:	5b                   	pop    %ebx
80108d08:	5e                   	pop    %esi
80108d09:	5d                   	pop    %ebp
80108d0a:	c3                   	ret    
80108d0b:	90                   	nop
80108d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80108d10:	83 ec 0c             	sub    $0xc,%esp
80108d13:	56                   	push   %esi
80108d14:	31 f6                	xor    %esi,%esi
80108d16:	e8 15 ff ff ff       	call   80108c30 <freevm>
80108d1b:	83 c4 10             	add    $0x10,%esp
80108d1e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80108d21:	89 f0                	mov    %esi,%eax
80108d23:	5b                   	pop    %ebx
80108d24:	5e                   	pop    %esi
80108d25:	5d                   	pop    %ebp
80108d26:	c3                   	ret    
80108d27:	89 f6                	mov    %esi,%esi
80108d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80108d30 <kvmalloc>:
80108d30:	55                   	push   %ebp
80108d31:	89 e5                	mov    %esp,%ebp
80108d33:	83 ec 08             	sub    $0x8,%esp
80108d36:	e8 75 ff ff ff       	call   80108cb0 <setupkvm>
80108d3b:	a3 64 f0 15 80       	mov    %eax,0x8015f064
80108d40:	05 00 00 00 80       	add    $0x80000000,%eax
80108d45:	0f 22 d8             	mov    %eax,%cr3
80108d48:	c9                   	leave  
80108d49:	c3                   	ret    
80108d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80108d50 <clearpteu>:
80108d50:	55                   	push   %ebp
80108d51:	31 c9                	xor    %ecx,%ecx
80108d53:	89 e5                	mov    %esp,%ebp
80108d55:	83 ec 08             	sub    $0x8,%esp
80108d58:	8b 55 0c             	mov    0xc(%ebp),%edx
80108d5b:	8b 45 08             	mov    0x8(%ebp),%eax
80108d5e:	e8 bd f8 ff ff       	call   80108620 <walkpgdir>
80108d63:	85 c0                	test   %eax,%eax
80108d65:	74 05                	je     80108d6c <clearpteu+0x1c>
80108d67:	83 20 fb             	andl   $0xfffffffb,(%eax)
80108d6a:	c9                   	leave  
80108d6b:	c3                   	ret    
80108d6c:	83 ec 0c             	sub    $0xc,%esp
80108d6f:	68 4a a0 10 80       	push   $0x8010a04a
80108d74:	e8 f7 7b ff ff       	call   80100970 <panic>
80108d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80108d80 <copyuvm>:
80108d80:	55                   	push   %ebp
80108d81:	89 e5                	mov    %esp,%ebp
80108d83:	57                   	push   %edi
80108d84:	56                   	push   %esi
80108d85:	53                   	push   %ebx
80108d86:	83 ec 1c             	sub    $0x1c,%esp
80108d89:	e8 22 ff ff ff       	call   80108cb0 <setupkvm>
80108d8e:	85 c0                	test   %eax,%eax
80108d90:	89 45 e0             	mov    %eax,-0x20(%ebp)
80108d93:	0f 84 a0 00 00 00    	je     80108e39 <copyuvm+0xb9>
80108d99:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80108d9c:	85 c9                	test   %ecx,%ecx
80108d9e:	0f 84 95 00 00 00    	je     80108e39 <copyuvm+0xb9>
80108da4:	31 f6                	xor    %esi,%esi
80108da6:	eb 4e                	jmp    80108df6 <copyuvm+0x76>
80108da8:	90                   	nop
80108da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108db0:	83 ec 04             	sub    $0x4,%esp
80108db3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80108db9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80108dbc:	68 00 10 00 00       	push   $0x1000
80108dc1:	57                   	push   %edi
80108dc2:	50                   	push   %eax
80108dc3:	e8 b8 d0 ff ff       	call   80105e80 <memmove>
80108dc8:	58                   	pop    %eax
80108dc9:	5a                   	pop    %edx
80108dca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80108dcd:	8b 45 e0             	mov    -0x20(%ebp),%eax
80108dd0:	b9 00 10 00 00       	mov    $0x1000,%ecx
80108dd5:	53                   	push   %ebx
80108dd6:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80108ddc:	52                   	push   %edx
80108ddd:	89 f2                	mov    %esi,%edx
80108ddf:	e8 bc f8 ff ff       	call   801086a0 <mappages>
80108de4:	83 c4 10             	add    $0x10,%esp
80108de7:	85 c0                	test   %eax,%eax
80108de9:	78 39                	js     80108e24 <copyuvm+0xa4>
80108deb:	81 c6 00 10 00 00    	add    $0x1000,%esi
80108df1:	39 75 0c             	cmp    %esi,0xc(%ebp)
80108df4:	76 43                	jbe    80108e39 <copyuvm+0xb9>
80108df6:	8b 45 08             	mov    0x8(%ebp),%eax
80108df9:	31 c9                	xor    %ecx,%ecx
80108dfb:	89 f2                	mov    %esi,%edx
80108dfd:	e8 1e f8 ff ff       	call   80108620 <walkpgdir>
80108e02:	85 c0                	test   %eax,%eax
80108e04:	74 3e                	je     80108e44 <copyuvm+0xc4>
80108e06:	8b 18                	mov    (%eax),%ebx
80108e08:	f6 c3 01             	test   $0x1,%bl
80108e0b:	74 44                	je     80108e51 <copyuvm+0xd1>
80108e0d:	89 df                	mov    %ebx,%edi
80108e0f:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80108e15:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80108e1b:	e8 60 a3 ff ff       	call   80103180 <kalloc>
80108e20:	85 c0                	test   %eax,%eax
80108e22:	75 8c                	jne    80108db0 <copyuvm+0x30>
80108e24:	83 ec 0c             	sub    $0xc,%esp
80108e27:	ff 75 e0             	pushl  -0x20(%ebp)
80108e2a:	e8 01 fe ff ff       	call   80108c30 <freevm>
80108e2f:	83 c4 10             	add    $0x10,%esp
80108e32:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80108e39:	8b 45 e0             	mov    -0x20(%ebp),%eax
80108e3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108e3f:	5b                   	pop    %ebx
80108e40:	5e                   	pop    %esi
80108e41:	5f                   	pop    %edi
80108e42:	5d                   	pop    %ebp
80108e43:	c3                   	ret    
80108e44:	83 ec 0c             	sub    $0xc,%esp
80108e47:	68 54 a0 10 80       	push   $0x8010a054
80108e4c:	e8 1f 7b ff ff       	call   80100970 <panic>
80108e51:	83 ec 0c             	sub    $0xc,%esp
80108e54:	68 6e a0 10 80       	push   $0x8010a06e
80108e59:	e8 12 7b ff ff       	call   80100970 <panic>
80108e5e:	66 90                	xchg   %ax,%ax

80108e60 <uva2ka>:
80108e60:	55                   	push   %ebp
80108e61:	31 c9                	xor    %ecx,%ecx
80108e63:	89 e5                	mov    %esp,%ebp
80108e65:	83 ec 08             	sub    $0x8,%esp
80108e68:	8b 55 0c             	mov    0xc(%ebp),%edx
80108e6b:	8b 45 08             	mov    0x8(%ebp),%eax
80108e6e:	e8 ad f7 ff ff       	call   80108620 <walkpgdir>
80108e73:	8b 00                	mov    (%eax),%eax
80108e75:	c9                   	leave  
80108e76:	89 c2                	mov    %eax,%edx
80108e78:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108e7d:	83 e2 05             	and    $0x5,%edx
80108e80:	05 00 00 00 80       	add    $0x80000000,%eax
80108e85:	83 fa 05             	cmp    $0x5,%edx
80108e88:	ba 00 00 00 00       	mov    $0x0,%edx
80108e8d:	0f 45 c2             	cmovne %edx,%eax
80108e90:	c3                   	ret    
80108e91:	eb 0d                	jmp    80108ea0 <copyout>
80108e93:	90                   	nop
80108e94:	90                   	nop
80108e95:	90                   	nop
80108e96:	90                   	nop
80108e97:	90                   	nop
80108e98:	90                   	nop
80108e99:	90                   	nop
80108e9a:	90                   	nop
80108e9b:	90                   	nop
80108e9c:	90                   	nop
80108e9d:	90                   	nop
80108e9e:	90                   	nop
80108e9f:	90                   	nop

80108ea0 <copyout>:
80108ea0:	55                   	push   %ebp
80108ea1:	89 e5                	mov    %esp,%ebp
80108ea3:	57                   	push   %edi
80108ea4:	56                   	push   %esi
80108ea5:	53                   	push   %ebx
80108ea6:	83 ec 1c             	sub    $0x1c,%esp
80108ea9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80108eac:	8b 55 0c             	mov    0xc(%ebp),%edx
80108eaf:	8b 7d 10             	mov    0x10(%ebp),%edi
80108eb2:	85 db                	test   %ebx,%ebx
80108eb4:	75 40                	jne    80108ef6 <copyout+0x56>
80108eb6:	eb 70                	jmp    80108f28 <copyout+0x88>
80108eb8:	90                   	nop
80108eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108ec0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80108ec3:	89 f1                	mov    %esi,%ecx
80108ec5:	29 d1                	sub    %edx,%ecx
80108ec7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80108ecd:	39 d9                	cmp    %ebx,%ecx
80108ecf:	0f 47 cb             	cmova  %ebx,%ecx
80108ed2:	29 f2                	sub    %esi,%edx
80108ed4:	83 ec 04             	sub    $0x4,%esp
80108ed7:	01 d0                	add    %edx,%eax
80108ed9:	51                   	push   %ecx
80108eda:	57                   	push   %edi
80108edb:	50                   	push   %eax
80108edc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80108edf:	e8 9c cf ff ff       	call   80105e80 <memmove>
80108ee4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80108ee7:	83 c4 10             	add    $0x10,%esp
80108eea:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80108ef0:	01 cf                	add    %ecx,%edi
80108ef2:	29 cb                	sub    %ecx,%ebx
80108ef4:	74 32                	je     80108f28 <copyout+0x88>
80108ef6:	89 d6                	mov    %edx,%esi
80108ef8:	83 ec 08             	sub    $0x8,%esp
80108efb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80108efe:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80108f04:	56                   	push   %esi
80108f05:	ff 75 08             	pushl  0x8(%ebp)
80108f08:	e8 53 ff ff ff       	call   80108e60 <uva2ka>
80108f0d:	83 c4 10             	add    $0x10,%esp
80108f10:	85 c0                	test   %eax,%eax
80108f12:	75 ac                	jne    80108ec0 <copyout+0x20>
80108f14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108f17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80108f1c:	5b                   	pop    %ebx
80108f1d:	5e                   	pop    %esi
80108f1e:	5f                   	pop    %edi
80108f1f:	5d                   	pop    %ebp
80108f20:	c3                   	ret    
80108f21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80108f28:	8d 65 f4             	lea    -0xc(%ebp),%esp
80108f2b:	31 c0                	xor    %eax,%eax
80108f2d:	5b                   	pop    %ebx
80108f2e:	5e                   	pop    %esi
80108f2f:	5f                   	pop    %edi
80108f30:	5d                   	pop    %ebp
80108f31:	c3                   	ret    
