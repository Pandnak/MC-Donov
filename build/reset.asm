
build/reset.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             00001104  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           0000002c  080011c4  080011c4  000111c4  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  080011f0  080011f0  000111f0  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  080011f8  080011f8  000111f8  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000438  20000000  080011fc  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              0000001c  20000438  08001634  00020438  2**2  ALLOC
  7 ._user_heap_stack 00000604  20000454  08001634  00020454  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020438  2**0  CONTENTS, READONLY
  9 .comment          00000059  00000000  00000000  00020460  2**0  CONTENTS, READONLY
 10 .debug_info       00003bc4  00000000  00000000  000204b9  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 11 .debug_abbrev     00000eb0  00000000  00000000  0002407d  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 12 .debug_loc        00000d54  00000000  00000000  00024f2d  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 13 .debug_aranges    000002b0  00000000  00000000  00025c88  2**3  CONTENTS, READONLY, DEBUGGING, OCTETS
 14 .debug_ranges     000001c0  00000000  00000000  00025f38  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 15 .debug_line       00001385  00000000  00000000  000260f8  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 16 .debug_str        0000119a  00000000  00000000  0002747d  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 17 .debug_frame      000006a8  00000000  00000000  00028618  2**2  CONTENTS, READONLY, DEBUGGING, OCTETS

Disassembly of section .text:

080000c0 <deregister_tm_clones>:
 80000c0:	4804      	ldr	r0, [pc, #16]	; (80000d4 <deregister_tm_clones+0x14>)
 80000c2:	4b05      	ldr	r3, [pc, #20]	; (80000d8 <deregister_tm_clones+0x18>)
 80000c4:	b510      	push	{r4, lr}
 80000c6:	4283      	cmp	r3, r0
 80000c8:	d003      	beq.n	80000d2 <deregister_tm_clones+0x12>
 80000ca:	4b04      	ldr	r3, [pc, #16]	; (80000dc <deregister_tm_clones+0x1c>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d000      	beq.n	80000d2 <deregister_tm_clones+0x12>
 80000d0:	4798      	blx	r3
 80000d2:	bd10      	pop	{r4, pc}
 80000d4:	20000438 	.word	0x20000438
 80000d8:	20000438 	.word	0x20000438
 80000dc:	00000000 	.word	0x00000000

080000e0 <register_tm_clones>:
 80000e0:	4806      	ldr	r0, [pc, #24]	; (80000fc <register_tm_clones+0x1c>)
 80000e2:	4907      	ldr	r1, [pc, #28]	; (8000100 <register_tm_clones+0x20>)
 80000e4:	1a09      	subs	r1, r1, r0
 80000e6:	108b      	asrs	r3, r1, #2
 80000e8:	0fc9      	lsrs	r1, r1, #31
 80000ea:	18c9      	adds	r1, r1, r3
 80000ec:	b510      	push	{r4, lr}
 80000ee:	1049      	asrs	r1, r1, #1
 80000f0:	d003      	beq.n	80000fa <register_tm_clones+0x1a>
 80000f2:	4b04      	ldr	r3, [pc, #16]	; (8000104 <register_tm_clones+0x24>)
 80000f4:	2b00      	cmp	r3, #0
 80000f6:	d000      	beq.n	80000fa <register_tm_clones+0x1a>
 80000f8:	4798      	blx	r3
 80000fa:	bd10      	pop	{r4, pc}
 80000fc:	20000438 	.word	0x20000438
 8000100:	20000438 	.word	0x20000438
 8000104:	00000000 	.word	0x00000000

08000108 <__do_global_dtors_aux>:
 8000108:	b510      	push	{r4, lr}
 800010a:	4c07      	ldr	r4, [pc, #28]	; (8000128 <__do_global_dtors_aux+0x20>)
 800010c:	7823      	ldrb	r3, [r4, #0]
 800010e:	2b00      	cmp	r3, #0
 8000110:	d109      	bne.n	8000126 <__do_global_dtors_aux+0x1e>
 8000112:	f7ff ffd5 	bl	80000c0 <deregister_tm_clones>
 8000116:	4b05      	ldr	r3, [pc, #20]	; (800012c <__do_global_dtors_aux+0x24>)
 8000118:	2b00      	cmp	r3, #0
 800011a:	d002      	beq.n	8000122 <__do_global_dtors_aux+0x1a>
 800011c:	4804      	ldr	r0, [pc, #16]	; (8000130 <__do_global_dtors_aux+0x28>)
 800011e:	e000      	b.n	8000122 <__do_global_dtors_aux+0x1a>
 8000120:	bf00      	nop
 8000122:	2301      	movs	r3, #1
 8000124:	7023      	strb	r3, [r4, #0]
 8000126:	bd10      	pop	{r4, pc}
 8000128:	20000438 	.word	0x20000438
 800012c:	00000000 	.word	0x00000000
 8000130:	080011ac 	.word	0x080011ac

08000134 <frame_dummy>:
 8000134:	4b05      	ldr	r3, [pc, #20]	; (800014c <frame_dummy+0x18>)
 8000136:	b510      	push	{r4, lr}
 8000138:	2b00      	cmp	r3, #0
 800013a:	d003      	beq.n	8000144 <frame_dummy+0x10>
 800013c:	4904      	ldr	r1, [pc, #16]	; (8000150 <frame_dummy+0x1c>)
 800013e:	4805      	ldr	r0, [pc, #20]	; (8000154 <frame_dummy+0x20>)
 8000140:	e000      	b.n	8000144 <frame_dummy+0x10>
 8000142:	bf00      	nop
 8000144:	f7ff ffcc 	bl	80000e0 <register_tm_clones>
 8000148:	bd10      	pop	{r4, pc}
 800014a:	46c0      	nop			; (mov r8, r8)
 800014c:	00000000 	.word	0x00000000
 8000150:	2000043c 	.word	0x2000043c
 8000154:	080011ac 	.word	0x080011ac

08000158 <__divsi3>:
 8000158:	4603      	mov	r3, r0
 800015a:	430b      	orrs	r3, r1
 800015c:	d47f      	bmi.n	800025e <__divsi3+0x106>
 800015e:	2200      	movs	r2, #0
 8000160:	0843      	lsrs	r3, r0, #1
 8000162:	428b      	cmp	r3, r1
 8000164:	d374      	bcc.n	8000250 <__divsi3+0xf8>
 8000166:	0903      	lsrs	r3, r0, #4
 8000168:	428b      	cmp	r3, r1
 800016a:	d35f      	bcc.n	800022c <__divsi3+0xd4>
 800016c:	0a03      	lsrs	r3, r0, #8
 800016e:	428b      	cmp	r3, r1
 8000170:	d344      	bcc.n	80001fc <__divsi3+0xa4>
 8000172:	0b03      	lsrs	r3, r0, #12
 8000174:	428b      	cmp	r3, r1
 8000176:	d328      	bcc.n	80001ca <__divsi3+0x72>
 8000178:	0c03      	lsrs	r3, r0, #16
 800017a:	428b      	cmp	r3, r1
 800017c:	d30d      	bcc.n	800019a <__divsi3+0x42>
 800017e:	22ff      	movs	r2, #255	; 0xff
 8000180:	0209      	lsls	r1, r1, #8
 8000182:	ba12      	rev	r2, r2
 8000184:	0c03      	lsrs	r3, r0, #16
 8000186:	428b      	cmp	r3, r1
 8000188:	d302      	bcc.n	8000190 <__divsi3+0x38>
 800018a:	1212      	asrs	r2, r2, #8
 800018c:	0209      	lsls	r1, r1, #8
 800018e:	d065      	beq.n	800025c <__divsi3+0x104>
 8000190:	0b03      	lsrs	r3, r0, #12
 8000192:	428b      	cmp	r3, r1
 8000194:	d319      	bcc.n	80001ca <__divsi3+0x72>
 8000196:	e000      	b.n	800019a <__divsi3+0x42>
 8000198:	0a09      	lsrs	r1, r1, #8
 800019a:	0bc3      	lsrs	r3, r0, #15
 800019c:	428b      	cmp	r3, r1
 800019e:	d301      	bcc.n	80001a4 <__divsi3+0x4c>
 80001a0:	03cb      	lsls	r3, r1, #15
 80001a2:	1ac0      	subs	r0, r0, r3
 80001a4:	4152      	adcs	r2, r2
 80001a6:	0b83      	lsrs	r3, r0, #14
 80001a8:	428b      	cmp	r3, r1
 80001aa:	d301      	bcc.n	80001b0 <__divsi3+0x58>
 80001ac:	038b      	lsls	r3, r1, #14
 80001ae:	1ac0      	subs	r0, r0, r3
 80001b0:	4152      	adcs	r2, r2
 80001b2:	0b43      	lsrs	r3, r0, #13
 80001b4:	428b      	cmp	r3, r1
 80001b6:	d301      	bcc.n	80001bc <__divsi3+0x64>
 80001b8:	034b      	lsls	r3, r1, #13
 80001ba:	1ac0      	subs	r0, r0, r3
 80001bc:	4152      	adcs	r2, r2
 80001be:	0b03      	lsrs	r3, r0, #12
 80001c0:	428b      	cmp	r3, r1
 80001c2:	d301      	bcc.n	80001c8 <__divsi3+0x70>
 80001c4:	030b      	lsls	r3, r1, #12
 80001c6:	1ac0      	subs	r0, r0, r3
 80001c8:	4152      	adcs	r2, r2
 80001ca:	0ac3      	lsrs	r3, r0, #11
 80001cc:	428b      	cmp	r3, r1
 80001ce:	d301      	bcc.n	80001d4 <__divsi3+0x7c>
 80001d0:	02cb      	lsls	r3, r1, #11
 80001d2:	1ac0      	subs	r0, r0, r3
 80001d4:	4152      	adcs	r2, r2
 80001d6:	0a83      	lsrs	r3, r0, #10
 80001d8:	428b      	cmp	r3, r1
 80001da:	d301      	bcc.n	80001e0 <__divsi3+0x88>
 80001dc:	028b      	lsls	r3, r1, #10
 80001de:	1ac0      	subs	r0, r0, r3
 80001e0:	4152      	adcs	r2, r2
 80001e2:	0a43      	lsrs	r3, r0, #9
 80001e4:	428b      	cmp	r3, r1
 80001e6:	d301      	bcc.n	80001ec <__divsi3+0x94>
 80001e8:	024b      	lsls	r3, r1, #9
 80001ea:	1ac0      	subs	r0, r0, r3
 80001ec:	4152      	adcs	r2, r2
 80001ee:	0a03      	lsrs	r3, r0, #8
 80001f0:	428b      	cmp	r3, r1
 80001f2:	d301      	bcc.n	80001f8 <__divsi3+0xa0>
 80001f4:	020b      	lsls	r3, r1, #8
 80001f6:	1ac0      	subs	r0, r0, r3
 80001f8:	4152      	adcs	r2, r2
 80001fa:	d2cd      	bcs.n	8000198 <__divsi3+0x40>
 80001fc:	09c3      	lsrs	r3, r0, #7
 80001fe:	428b      	cmp	r3, r1
 8000200:	d301      	bcc.n	8000206 <__divsi3+0xae>
 8000202:	01cb      	lsls	r3, r1, #7
 8000204:	1ac0      	subs	r0, r0, r3
 8000206:	4152      	adcs	r2, r2
 8000208:	0983      	lsrs	r3, r0, #6
 800020a:	428b      	cmp	r3, r1
 800020c:	d301      	bcc.n	8000212 <__divsi3+0xba>
 800020e:	018b      	lsls	r3, r1, #6
 8000210:	1ac0      	subs	r0, r0, r3
 8000212:	4152      	adcs	r2, r2
 8000214:	0943      	lsrs	r3, r0, #5
 8000216:	428b      	cmp	r3, r1
 8000218:	d301      	bcc.n	800021e <__divsi3+0xc6>
 800021a:	014b      	lsls	r3, r1, #5
 800021c:	1ac0      	subs	r0, r0, r3
 800021e:	4152      	adcs	r2, r2
 8000220:	0903      	lsrs	r3, r0, #4
 8000222:	428b      	cmp	r3, r1
 8000224:	d301      	bcc.n	800022a <__divsi3+0xd2>
 8000226:	010b      	lsls	r3, r1, #4
 8000228:	1ac0      	subs	r0, r0, r3
 800022a:	4152      	adcs	r2, r2
 800022c:	08c3      	lsrs	r3, r0, #3
 800022e:	428b      	cmp	r3, r1
 8000230:	d301      	bcc.n	8000236 <__divsi3+0xde>
 8000232:	00cb      	lsls	r3, r1, #3
 8000234:	1ac0      	subs	r0, r0, r3
 8000236:	4152      	adcs	r2, r2
 8000238:	0883      	lsrs	r3, r0, #2
 800023a:	428b      	cmp	r3, r1
 800023c:	d301      	bcc.n	8000242 <__divsi3+0xea>
 800023e:	008b      	lsls	r3, r1, #2
 8000240:	1ac0      	subs	r0, r0, r3
 8000242:	4152      	adcs	r2, r2
 8000244:	0843      	lsrs	r3, r0, #1
 8000246:	428b      	cmp	r3, r1
 8000248:	d301      	bcc.n	800024e <__divsi3+0xf6>
 800024a:	004b      	lsls	r3, r1, #1
 800024c:	1ac0      	subs	r0, r0, r3
 800024e:	4152      	adcs	r2, r2
 8000250:	1a41      	subs	r1, r0, r1
 8000252:	d200      	bcs.n	8000256 <__divsi3+0xfe>
 8000254:	4601      	mov	r1, r0
 8000256:	4152      	adcs	r2, r2
 8000258:	4610      	mov	r0, r2
 800025a:	4770      	bx	lr
 800025c:	e05d      	b.n	800031a <__divsi3+0x1c2>
 800025e:	0fca      	lsrs	r2, r1, #31
 8000260:	d000      	beq.n	8000264 <__divsi3+0x10c>
 8000262:	4249      	negs	r1, r1
 8000264:	1003      	asrs	r3, r0, #32
 8000266:	d300      	bcc.n	800026a <__divsi3+0x112>
 8000268:	4240      	negs	r0, r0
 800026a:	4053      	eors	r3, r2
 800026c:	2200      	movs	r2, #0
 800026e:	469c      	mov	ip, r3
 8000270:	0903      	lsrs	r3, r0, #4
 8000272:	428b      	cmp	r3, r1
 8000274:	d32d      	bcc.n	80002d2 <__divsi3+0x17a>
 8000276:	0a03      	lsrs	r3, r0, #8
 8000278:	428b      	cmp	r3, r1
 800027a:	d312      	bcc.n	80002a2 <__divsi3+0x14a>
 800027c:	22fc      	movs	r2, #252	; 0xfc
 800027e:	0189      	lsls	r1, r1, #6
 8000280:	ba12      	rev	r2, r2
 8000282:	0a03      	lsrs	r3, r0, #8
 8000284:	428b      	cmp	r3, r1
 8000286:	d30c      	bcc.n	80002a2 <__divsi3+0x14a>
 8000288:	0189      	lsls	r1, r1, #6
 800028a:	1192      	asrs	r2, r2, #6
 800028c:	428b      	cmp	r3, r1
 800028e:	d308      	bcc.n	80002a2 <__divsi3+0x14a>
 8000290:	0189      	lsls	r1, r1, #6
 8000292:	1192      	asrs	r2, r2, #6
 8000294:	428b      	cmp	r3, r1
 8000296:	d304      	bcc.n	80002a2 <__divsi3+0x14a>
 8000298:	0189      	lsls	r1, r1, #6
 800029a:	d03a      	beq.n	8000312 <__divsi3+0x1ba>
 800029c:	1192      	asrs	r2, r2, #6
 800029e:	e000      	b.n	80002a2 <__divsi3+0x14a>
 80002a0:	0989      	lsrs	r1, r1, #6
 80002a2:	09c3      	lsrs	r3, r0, #7
 80002a4:	428b      	cmp	r3, r1
 80002a6:	d301      	bcc.n	80002ac <__divsi3+0x154>
 80002a8:	01cb      	lsls	r3, r1, #7
 80002aa:	1ac0      	subs	r0, r0, r3
 80002ac:	4152      	adcs	r2, r2
 80002ae:	0983      	lsrs	r3, r0, #6
 80002b0:	428b      	cmp	r3, r1
 80002b2:	d301      	bcc.n	80002b8 <__divsi3+0x160>
 80002b4:	018b      	lsls	r3, r1, #6
 80002b6:	1ac0      	subs	r0, r0, r3
 80002b8:	4152      	adcs	r2, r2
 80002ba:	0943      	lsrs	r3, r0, #5
 80002bc:	428b      	cmp	r3, r1
 80002be:	d301      	bcc.n	80002c4 <__divsi3+0x16c>
 80002c0:	014b      	lsls	r3, r1, #5
 80002c2:	1ac0      	subs	r0, r0, r3
 80002c4:	4152      	adcs	r2, r2
 80002c6:	0903      	lsrs	r3, r0, #4
 80002c8:	428b      	cmp	r3, r1
 80002ca:	d301      	bcc.n	80002d0 <__divsi3+0x178>
 80002cc:	010b      	lsls	r3, r1, #4
 80002ce:	1ac0      	subs	r0, r0, r3
 80002d0:	4152      	adcs	r2, r2
 80002d2:	08c3      	lsrs	r3, r0, #3
 80002d4:	428b      	cmp	r3, r1
 80002d6:	d301      	bcc.n	80002dc <__divsi3+0x184>
 80002d8:	00cb      	lsls	r3, r1, #3
 80002da:	1ac0      	subs	r0, r0, r3
 80002dc:	4152      	adcs	r2, r2
 80002de:	0883      	lsrs	r3, r0, #2
 80002e0:	428b      	cmp	r3, r1
 80002e2:	d301      	bcc.n	80002e8 <__divsi3+0x190>
 80002e4:	008b      	lsls	r3, r1, #2
 80002e6:	1ac0      	subs	r0, r0, r3
 80002e8:	4152      	adcs	r2, r2
 80002ea:	d2d9      	bcs.n	80002a0 <__divsi3+0x148>
 80002ec:	0843      	lsrs	r3, r0, #1
 80002ee:	428b      	cmp	r3, r1
 80002f0:	d301      	bcc.n	80002f6 <__divsi3+0x19e>
 80002f2:	004b      	lsls	r3, r1, #1
 80002f4:	1ac0      	subs	r0, r0, r3
 80002f6:	4152      	adcs	r2, r2
 80002f8:	1a41      	subs	r1, r0, r1
 80002fa:	d200      	bcs.n	80002fe <__divsi3+0x1a6>
 80002fc:	4601      	mov	r1, r0
 80002fe:	4663      	mov	r3, ip
 8000300:	4152      	adcs	r2, r2
 8000302:	105b      	asrs	r3, r3, #1
 8000304:	4610      	mov	r0, r2
 8000306:	d301      	bcc.n	800030c <__divsi3+0x1b4>
 8000308:	4240      	negs	r0, r0
 800030a:	2b00      	cmp	r3, #0
 800030c:	d500      	bpl.n	8000310 <__divsi3+0x1b8>
 800030e:	4249      	negs	r1, r1
 8000310:	4770      	bx	lr
 8000312:	4663      	mov	r3, ip
 8000314:	105b      	asrs	r3, r3, #1
 8000316:	d300      	bcc.n	800031a <__divsi3+0x1c2>
 8000318:	4240      	negs	r0, r0
 800031a:	b501      	push	{r0, lr}
 800031c:	2000      	movs	r0, #0
 800031e:	f000 f805 	bl	800032c <__aeabi_idiv0>
 8000322:	bd02      	pop	{r1, pc}

08000324 <__aeabi_idivmod>:
 8000324:	2900      	cmp	r1, #0
 8000326:	d0f8      	beq.n	800031a <__divsi3+0x1c2>
 8000328:	e716      	b.n	8000158 <__divsi3>
 800032a:	4770      	bx	lr

0800032c <__aeabi_idiv0>:
 800032c:	4770      	bx	lr
 800032e:	46c0      	nop			; (mov r8, r8)

08000330 <atexit>:
 8000330:	b510      	push	{r4, lr}
 8000332:	0001      	movs	r1, r0
 8000334:	2300      	movs	r3, #0
 8000336:	2200      	movs	r2, #0
 8000338:	2000      	movs	r0, #0
 800033a:	f000 f837 	bl	80003ac <__register_exitproc>
 800033e:	bd10      	pop	{r4, pc}

08000340 <__libc_fini_array>:
 8000340:	b570      	push	{r4, r5, r6, lr}
 8000342:	4d07      	ldr	r5, [pc, #28]	; (8000360 <__libc_fini_array+0x20>)
 8000344:	4c07      	ldr	r4, [pc, #28]	; (8000364 <__libc_fini_array+0x24>)
 8000346:	1b64      	subs	r4, r4, r5
 8000348:	10a4      	asrs	r4, r4, #2
 800034a:	d005      	beq.n	8000358 <__libc_fini_array+0x18>
 800034c:	3c01      	subs	r4, #1
 800034e:	00a3      	lsls	r3, r4, #2
 8000350:	58eb      	ldr	r3, [r5, r3]
 8000352:	4798      	blx	r3
 8000354:	2c00      	cmp	r4, #0
 8000356:	d1f9      	bne.n	800034c <__libc_fini_array+0xc>
 8000358:	f000 ff2e 	bl	80011b8 <_fini>
 800035c:	bd70      	pop	{r4, r5, r6, pc}
 800035e:	46c0      	nop			; (mov r8, r8)
 8000360:	080011f8 	.word	0x080011f8
 8000364:	080011fc 	.word	0x080011fc

08000368 <__libc_init_array>:
 8000368:	b570      	push	{r4, r5, r6, lr}
 800036a:	4d0c      	ldr	r5, [pc, #48]	; (800039c <__libc_init_array+0x34>)
 800036c:	4e0c      	ldr	r6, [pc, #48]	; (80003a0 <__libc_init_array+0x38>)
 800036e:	1b76      	subs	r6, r6, r5
 8000370:	10b6      	asrs	r6, r6, #2
 8000372:	d005      	beq.n	8000380 <__libc_init_array+0x18>
 8000374:	2400      	movs	r4, #0
 8000376:	cd08      	ldmia	r5!, {r3}
 8000378:	3401      	adds	r4, #1
 800037a:	4798      	blx	r3
 800037c:	42a6      	cmp	r6, r4
 800037e:	d1fa      	bne.n	8000376 <__libc_init_array+0xe>
 8000380:	f000 ff14 	bl	80011ac <_init>
 8000384:	4d07      	ldr	r5, [pc, #28]	; (80003a4 <__libc_init_array+0x3c>)
 8000386:	4e08      	ldr	r6, [pc, #32]	; (80003a8 <__libc_init_array+0x40>)
 8000388:	1b76      	subs	r6, r6, r5
 800038a:	10b6      	asrs	r6, r6, #2
 800038c:	d005      	beq.n	800039a <__libc_init_array+0x32>
 800038e:	2400      	movs	r4, #0
 8000390:	cd08      	ldmia	r5!, {r3}
 8000392:	3401      	adds	r4, #1
 8000394:	4798      	blx	r3
 8000396:	42a6      	cmp	r6, r4
 8000398:	d1fa      	bne.n	8000390 <__libc_init_array+0x28>
 800039a:	bd70      	pop	{r4, r5, r6, pc}
 800039c:	080011f0 	.word	0x080011f0
 80003a0:	080011f0 	.word	0x080011f0
 80003a4:	080011f0 	.word	0x080011f0
 80003a8:	080011f8 	.word	0x080011f8

080003ac <__register_exitproc>:
 80003ac:	b5f0      	push	{r4, r5, r6, r7, lr}
 80003ae:	46c6      	mov	lr, r8
 80003b0:	b500      	push	{lr}
 80003b2:	4c1f      	ldr	r4, [pc, #124]	; (8000430 <__register_exitproc+0x84>)
 80003b4:	b082      	sub	sp, #8
 80003b6:	6824      	ldr	r4, [r4, #0]
 80003b8:	9401      	str	r4, [sp, #4]
 80003ba:	24a4      	movs	r4, #164	; 0xa4
 80003bc:	9d01      	ldr	r5, [sp, #4]
 80003be:	0064      	lsls	r4, r4, #1
 80003c0:	592d      	ldr	r5, [r5, r4]
 80003c2:	2d00      	cmp	r5, #0
 80003c4:	d02b      	beq.n	800041e <__register_exitproc+0x72>
 80003c6:	686c      	ldr	r4, [r5, #4]
 80003c8:	2c1f      	cmp	r4, #31
 80003ca:	dc2e      	bgt.n	800042a <__register_exitproc+0x7e>
 80003cc:	2800      	cmp	r0, #0
 80003ce:	d109      	bne.n	80003e4 <__register_exitproc+0x38>
 80003d0:	2000      	movs	r0, #0
 80003d2:	1c63      	adds	r3, r4, #1
 80003d4:	3402      	adds	r4, #2
 80003d6:	00a4      	lsls	r4, r4, #2
 80003d8:	606b      	str	r3, [r5, #4]
 80003da:	5161      	str	r1, [r4, r5]
 80003dc:	b002      	add	sp, #8
 80003de:	bc04      	pop	{r2}
 80003e0:	4690      	mov	r8, r2
 80003e2:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80003e4:	2788      	movs	r7, #136	; 0x88
 80003e6:	00a6      	lsls	r6, r4, #2
 80003e8:	19ae      	adds	r6, r5, r6
 80003ea:	51f2      	str	r2, [r6, r7]
 80003ec:	3701      	adds	r7, #1
 80003ee:	37ff      	adds	r7, #255	; 0xff
 80003f0:	46bc      	mov	ip, r7
 80003f2:	2201      	movs	r2, #1
 80003f4:	44ac      	add	ip, r5
 80003f6:	4667      	mov	r7, ip
 80003f8:	40a2      	lsls	r2, r4
 80003fa:	683f      	ldr	r7, [r7, #0]
 80003fc:	4690      	mov	r8, r2
 80003fe:	4317      	orrs	r7, r2
 8000400:	4662      	mov	r2, ip
 8000402:	6017      	str	r7, [r2, #0]
 8000404:	2784      	movs	r7, #132	; 0x84
 8000406:	007f      	lsls	r7, r7, #1
 8000408:	51f3      	str	r3, [r6, r7]
 800040a:	2802      	cmp	r0, #2
 800040c:	d1e0      	bne.n	80003d0 <__register_exitproc+0x24>
 800040e:	002b      	movs	r3, r5
 8000410:	4640      	mov	r0, r8
 8000412:	338d      	adds	r3, #141	; 0x8d
 8000414:	33ff      	adds	r3, #255	; 0xff
 8000416:	681a      	ldr	r2, [r3, #0]
 8000418:	4310      	orrs	r0, r2
 800041a:	6018      	str	r0, [r3, #0]
 800041c:	e7d8      	b.n	80003d0 <__register_exitproc+0x24>
 800041e:	9d01      	ldr	r5, [sp, #4]
 8000420:	9e01      	ldr	r6, [sp, #4]
 8000422:	354d      	adds	r5, #77	; 0x4d
 8000424:	35ff      	adds	r5, #255	; 0xff
 8000426:	5135      	str	r5, [r6, r4]
 8000428:	e7cd      	b.n	80003c6 <__register_exitproc+0x1a>
 800042a:	2001      	movs	r0, #1
 800042c:	4240      	negs	r0, r0
 800042e:	e7d5      	b.n	80003dc <__register_exitproc+0x30>
 8000430:	080011c4 	.word	0x080011c4

08000434 <Reset_Handler>:
 8000434:	480d      	ldr	r0, [pc, #52]	; (800046c <LoopForever+0x2>)
 8000436:	4685      	mov	sp, r0
 8000438:	480d      	ldr	r0, [pc, #52]	; (8000470 <LoopForever+0x6>)
 800043a:	490e      	ldr	r1, [pc, #56]	; (8000474 <LoopForever+0xa>)
 800043c:	4a0e      	ldr	r2, [pc, #56]	; (8000478 <LoopForever+0xe>)
 800043e:	2300      	movs	r3, #0
 8000440:	e002      	b.n	8000448 <LoopCopyDataInit>

08000442 <CopyDataInit>:
 8000442:	58d4      	ldr	r4, [r2, r3]
 8000444:	50c4      	str	r4, [r0, r3]
 8000446:	3304      	adds	r3, #4

08000448 <LoopCopyDataInit>:
 8000448:	18c4      	adds	r4, r0, r3
 800044a:	428c      	cmp	r4, r1
 800044c:	d3f9      	bcc.n	8000442 <CopyDataInit>
 800044e:	4a0b      	ldr	r2, [pc, #44]	; (800047c <LoopForever+0x12>)
 8000450:	4c0b      	ldr	r4, [pc, #44]	; (8000480 <LoopForever+0x16>)
 8000452:	2300      	movs	r3, #0
 8000454:	e001      	b.n	800045a <LoopFillZerobss>

08000456 <FillZerobss>:
 8000456:	6013      	str	r3, [r2, #0]
 8000458:	3204      	adds	r2, #4

0800045a <LoopFillZerobss>:
 800045a:	42a2      	cmp	r2, r4
 800045c:	d3fb      	bcc.n	8000456 <FillZerobss>
 800045e:	f000 fe43 	bl	80010e8 <SystemInit>
 8000462:	f7ff ff81 	bl	8000368 <__libc_init_array>
 8000466:	f000 fe2d 	bl	80010c4 <main>

0800046a <LoopForever>:
 800046a:	e7fe      	b.n	800046a <LoopForever>
 800046c:	20002000 	.word	0x20002000
 8000470:	20000000 	.word	0x20000000
 8000474:	20000438 	.word	0x20000438
 8000478:	080011fc 	.word	0x080011fc
 800047c:	20000438 	.word	0x20000438
 8000480:	20000454 	.word	0x20000454

08000484 <ADC1_COMP_IRQHandler>:
 8000484:	e7fe      	b.n	8000484 <ADC1_COMP_IRQHandler>
	...

08000488 <NVIC_EnableIRQ>:
 8000488:	b580      	push	{r7, lr}
 800048a:	b082      	sub	sp, #8
 800048c:	af00      	add	r7, sp, #0
 800048e:	0002      	movs	r2, r0
 8000490:	1dfb      	adds	r3, r7, #7
 8000492:	701a      	strb	r2, [r3, #0]
 8000494:	1dfb      	adds	r3, r7, #7
 8000496:	781b      	ldrb	r3, [r3, #0]
 8000498:	001a      	movs	r2, r3
 800049a:	231f      	movs	r3, #31
 800049c:	401a      	ands	r2, r3
 800049e:	4b04      	ldr	r3, [pc, #16]	; (80004b0 <NVIC_EnableIRQ+0x28>)
 80004a0:	2101      	movs	r1, #1
 80004a2:	4091      	lsls	r1, r2
 80004a4:	000a      	movs	r2, r1
 80004a6:	601a      	str	r2, [r3, #0]
 80004a8:	46c0      	nop			; (mov r8, r8)
 80004aa:	46bd      	mov	sp, r7
 80004ac:	b002      	add	sp, #8
 80004ae:	bd80      	pop	{r7, pc}
 80004b0:	e000e100 	.word	0xe000e100

080004b4 <NVIC_SetPriority>:
 80004b4:	b590      	push	{r4, r7, lr}
 80004b6:	b083      	sub	sp, #12
 80004b8:	af00      	add	r7, sp, #0
 80004ba:	0002      	movs	r2, r0
 80004bc:	6039      	str	r1, [r7, #0]
 80004be:	1dfb      	adds	r3, r7, #7
 80004c0:	701a      	strb	r2, [r3, #0]
 80004c2:	1dfb      	adds	r3, r7, #7
 80004c4:	781b      	ldrb	r3, [r3, #0]
 80004c6:	2b7f      	cmp	r3, #127	; 0x7f
 80004c8:	d932      	bls.n	8000530 <NVIC_SetPriority+0x7c>
 80004ca:	4a2f      	ldr	r2, [pc, #188]	; (8000588 <NVIC_SetPriority+0xd4>)
 80004cc:	1dfb      	adds	r3, r7, #7
 80004ce:	781b      	ldrb	r3, [r3, #0]
 80004d0:	0019      	movs	r1, r3
 80004d2:	230f      	movs	r3, #15
 80004d4:	400b      	ands	r3, r1
 80004d6:	3b08      	subs	r3, #8
 80004d8:	089b      	lsrs	r3, r3, #2
 80004da:	3306      	adds	r3, #6
 80004dc:	009b      	lsls	r3, r3, #2
 80004de:	18d3      	adds	r3, r2, r3
 80004e0:	3304      	adds	r3, #4
 80004e2:	681b      	ldr	r3, [r3, #0]
 80004e4:	1dfa      	adds	r2, r7, #7
 80004e6:	7812      	ldrb	r2, [r2, #0]
 80004e8:	0011      	movs	r1, r2
 80004ea:	2203      	movs	r2, #3
 80004ec:	400a      	ands	r2, r1
 80004ee:	00d2      	lsls	r2, r2, #3
 80004f0:	21ff      	movs	r1, #255	; 0xff
 80004f2:	4091      	lsls	r1, r2
 80004f4:	000a      	movs	r2, r1
 80004f6:	43d2      	mvns	r2, r2
 80004f8:	401a      	ands	r2, r3
 80004fa:	0011      	movs	r1, r2
 80004fc:	683b      	ldr	r3, [r7, #0]
 80004fe:	019b      	lsls	r3, r3, #6
 8000500:	22ff      	movs	r2, #255	; 0xff
 8000502:	401a      	ands	r2, r3
 8000504:	1dfb      	adds	r3, r7, #7
 8000506:	781b      	ldrb	r3, [r3, #0]
 8000508:	0018      	movs	r0, r3
 800050a:	2303      	movs	r3, #3
 800050c:	4003      	ands	r3, r0
 800050e:	00db      	lsls	r3, r3, #3
 8000510:	409a      	lsls	r2, r3
 8000512:	481d      	ldr	r0, [pc, #116]	; (8000588 <NVIC_SetPriority+0xd4>)
 8000514:	1dfb      	adds	r3, r7, #7
 8000516:	781b      	ldrb	r3, [r3, #0]
 8000518:	001c      	movs	r4, r3
 800051a:	230f      	movs	r3, #15
 800051c:	4023      	ands	r3, r4
 800051e:	3b08      	subs	r3, #8
 8000520:	089b      	lsrs	r3, r3, #2
 8000522:	430a      	orrs	r2, r1
 8000524:	3306      	adds	r3, #6
 8000526:	009b      	lsls	r3, r3, #2
 8000528:	18c3      	adds	r3, r0, r3
 800052a:	3304      	adds	r3, #4
 800052c:	601a      	str	r2, [r3, #0]
 800052e:	e027      	b.n	8000580 <NVIC_SetPriority+0xcc>
 8000530:	4a16      	ldr	r2, [pc, #88]	; (800058c <NVIC_SetPriority+0xd8>)
 8000532:	1dfb      	adds	r3, r7, #7
 8000534:	781b      	ldrb	r3, [r3, #0]
 8000536:	b25b      	sxtb	r3, r3
 8000538:	089b      	lsrs	r3, r3, #2
 800053a:	33c0      	adds	r3, #192	; 0xc0
 800053c:	009b      	lsls	r3, r3, #2
 800053e:	589b      	ldr	r3, [r3, r2]
 8000540:	1dfa      	adds	r2, r7, #7
 8000542:	7812      	ldrb	r2, [r2, #0]
 8000544:	0011      	movs	r1, r2
 8000546:	2203      	movs	r2, #3
 8000548:	400a      	ands	r2, r1
 800054a:	00d2      	lsls	r2, r2, #3
 800054c:	21ff      	movs	r1, #255	; 0xff
 800054e:	4091      	lsls	r1, r2
 8000550:	000a      	movs	r2, r1
 8000552:	43d2      	mvns	r2, r2
 8000554:	401a      	ands	r2, r3
 8000556:	0011      	movs	r1, r2
 8000558:	683b      	ldr	r3, [r7, #0]
 800055a:	019b      	lsls	r3, r3, #6
 800055c:	22ff      	movs	r2, #255	; 0xff
 800055e:	401a      	ands	r2, r3
 8000560:	1dfb      	adds	r3, r7, #7
 8000562:	781b      	ldrb	r3, [r3, #0]
 8000564:	0018      	movs	r0, r3
 8000566:	2303      	movs	r3, #3
 8000568:	4003      	ands	r3, r0
 800056a:	00db      	lsls	r3, r3, #3
 800056c:	409a      	lsls	r2, r3
 800056e:	4807      	ldr	r0, [pc, #28]	; (800058c <NVIC_SetPriority+0xd8>)
 8000570:	1dfb      	adds	r3, r7, #7
 8000572:	781b      	ldrb	r3, [r3, #0]
 8000574:	b25b      	sxtb	r3, r3
 8000576:	089b      	lsrs	r3, r3, #2
 8000578:	430a      	orrs	r2, r1
 800057a:	33c0      	adds	r3, #192	; 0xc0
 800057c:	009b      	lsls	r3, r3, #2
 800057e:	501a      	str	r2, [r3, r0]
 8000580:	46c0      	nop			; (mov r8, r8)
 8000582:	46bd      	mov	sp, r7
 8000584:	b003      	add	sp, #12
 8000586:	bd90      	pop	{r4, r7, pc}
 8000588:	e000ed00 	.word	0xe000ed00
 800058c:	e000e100 	.word	0xe000e100

08000590 <LL_RCC_HSI_Enable>:
 8000590:	b580      	push	{r7, lr}
 8000592:	af00      	add	r7, sp, #0
 8000594:	4b04      	ldr	r3, [pc, #16]	; (80005a8 <LL_RCC_HSI_Enable+0x18>)
 8000596:	681a      	ldr	r2, [r3, #0]
 8000598:	4b03      	ldr	r3, [pc, #12]	; (80005a8 <LL_RCC_HSI_Enable+0x18>)
 800059a:	2101      	movs	r1, #1
 800059c:	430a      	orrs	r2, r1
 800059e:	601a      	str	r2, [r3, #0]
 80005a0:	46c0      	nop			; (mov r8, r8)
 80005a2:	46bd      	mov	sp, r7
 80005a4:	bd80      	pop	{r7, pc}
 80005a6:	46c0      	nop			; (mov r8, r8)
 80005a8:	40021000 	.word	0x40021000

080005ac <LL_RCC_HSI_IsReady>:
 80005ac:	b580      	push	{r7, lr}
 80005ae:	af00      	add	r7, sp, #0
 80005b0:	4b05      	ldr	r3, [pc, #20]	; (80005c8 <LL_RCC_HSI_IsReady+0x1c>)
 80005b2:	681b      	ldr	r3, [r3, #0]
 80005b4:	2202      	movs	r2, #2
 80005b6:	4013      	ands	r3, r2
 80005b8:	3b02      	subs	r3, #2
 80005ba:	425a      	negs	r2, r3
 80005bc:	4153      	adcs	r3, r2
 80005be:	b2db      	uxtb	r3, r3
 80005c0:	0018      	movs	r0, r3
 80005c2:	46bd      	mov	sp, r7
 80005c4:	bd80      	pop	{r7, pc}
 80005c6:	46c0      	nop			; (mov r8, r8)
 80005c8:	40021000 	.word	0x40021000

080005cc <LL_RCC_SetSysClkSource>:
 80005cc:	b580      	push	{r7, lr}
 80005ce:	b082      	sub	sp, #8
 80005d0:	af00      	add	r7, sp, #0
 80005d2:	6078      	str	r0, [r7, #4]
 80005d4:	4b06      	ldr	r3, [pc, #24]	; (80005f0 <LL_RCC_SetSysClkSource+0x24>)
 80005d6:	685b      	ldr	r3, [r3, #4]
 80005d8:	2203      	movs	r2, #3
 80005da:	4393      	bics	r3, r2
 80005dc:	0019      	movs	r1, r3
 80005de:	4b04      	ldr	r3, [pc, #16]	; (80005f0 <LL_RCC_SetSysClkSource+0x24>)
 80005e0:	687a      	ldr	r2, [r7, #4]
 80005e2:	430a      	orrs	r2, r1
 80005e4:	605a      	str	r2, [r3, #4]
 80005e6:	46c0      	nop			; (mov r8, r8)
 80005e8:	46bd      	mov	sp, r7
 80005ea:	b002      	add	sp, #8
 80005ec:	bd80      	pop	{r7, pc}
 80005ee:	46c0      	nop			; (mov r8, r8)
 80005f0:	40021000 	.word	0x40021000

080005f4 <LL_RCC_GetSysClkSource>:
 80005f4:	b580      	push	{r7, lr}
 80005f6:	af00      	add	r7, sp, #0
 80005f8:	4b03      	ldr	r3, [pc, #12]	; (8000608 <LL_RCC_GetSysClkSource+0x14>)
 80005fa:	685b      	ldr	r3, [r3, #4]
 80005fc:	220c      	movs	r2, #12
 80005fe:	4013      	ands	r3, r2
 8000600:	0018      	movs	r0, r3
 8000602:	46bd      	mov	sp, r7
 8000604:	bd80      	pop	{r7, pc}
 8000606:	46c0      	nop			; (mov r8, r8)
 8000608:	40021000 	.word	0x40021000

0800060c <LL_RCC_SetAHBPrescaler>:
 800060c:	b580      	push	{r7, lr}
 800060e:	b082      	sub	sp, #8
 8000610:	af00      	add	r7, sp, #0
 8000612:	6078      	str	r0, [r7, #4]
 8000614:	4b06      	ldr	r3, [pc, #24]	; (8000630 <LL_RCC_SetAHBPrescaler+0x24>)
 8000616:	685b      	ldr	r3, [r3, #4]
 8000618:	22f0      	movs	r2, #240	; 0xf0
 800061a:	4393      	bics	r3, r2
 800061c:	0019      	movs	r1, r3
 800061e:	4b04      	ldr	r3, [pc, #16]	; (8000630 <LL_RCC_SetAHBPrescaler+0x24>)
 8000620:	687a      	ldr	r2, [r7, #4]
 8000622:	430a      	orrs	r2, r1
 8000624:	605a      	str	r2, [r3, #4]
 8000626:	46c0      	nop			; (mov r8, r8)
 8000628:	46bd      	mov	sp, r7
 800062a:	b002      	add	sp, #8
 800062c:	bd80      	pop	{r7, pc}
 800062e:	46c0      	nop			; (mov r8, r8)
 8000630:	40021000 	.word	0x40021000

08000634 <LL_RCC_SetAPB1Prescaler>:
 8000634:	b580      	push	{r7, lr}
 8000636:	b082      	sub	sp, #8
 8000638:	af00      	add	r7, sp, #0
 800063a:	6078      	str	r0, [r7, #4]
 800063c:	4b06      	ldr	r3, [pc, #24]	; (8000658 <LL_RCC_SetAPB1Prescaler+0x24>)
 800063e:	685b      	ldr	r3, [r3, #4]
 8000640:	4a06      	ldr	r2, [pc, #24]	; (800065c <LL_RCC_SetAPB1Prescaler+0x28>)
 8000642:	4013      	ands	r3, r2
 8000644:	0019      	movs	r1, r3
 8000646:	4b04      	ldr	r3, [pc, #16]	; (8000658 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000648:	687a      	ldr	r2, [r7, #4]
 800064a:	430a      	orrs	r2, r1
 800064c:	605a      	str	r2, [r3, #4]
 800064e:	46c0      	nop			; (mov r8, r8)
 8000650:	46bd      	mov	sp, r7
 8000652:	b002      	add	sp, #8
 8000654:	bd80      	pop	{r7, pc}
 8000656:	46c0      	nop			; (mov r8, r8)
 8000658:	40021000 	.word	0x40021000
 800065c:	fffff8ff 	.word	0xfffff8ff

08000660 <LL_RCC_PLL_Enable>:
 8000660:	b580      	push	{r7, lr}
 8000662:	af00      	add	r7, sp, #0
 8000664:	4b04      	ldr	r3, [pc, #16]	; (8000678 <LL_RCC_PLL_Enable+0x18>)
 8000666:	681a      	ldr	r2, [r3, #0]
 8000668:	4b03      	ldr	r3, [pc, #12]	; (8000678 <LL_RCC_PLL_Enable+0x18>)
 800066a:	2180      	movs	r1, #128	; 0x80
 800066c:	0449      	lsls	r1, r1, #17
 800066e:	430a      	orrs	r2, r1
 8000670:	601a      	str	r2, [r3, #0]
 8000672:	46c0      	nop			; (mov r8, r8)
 8000674:	46bd      	mov	sp, r7
 8000676:	bd80      	pop	{r7, pc}
 8000678:	40021000 	.word	0x40021000

0800067c <LL_RCC_PLL_IsReady>:
 800067c:	b580      	push	{r7, lr}
 800067e:	af00      	add	r7, sp, #0
 8000680:	4b07      	ldr	r3, [pc, #28]	; (80006a0 <LL_RCC_PLL_IsReady+0x24>)
 8000682:	681a      	ldr	r2, [r3, #0]
 8000684:	2380      	movs	r3, #128	; 0x80
 8000686:	049b      	lsls	r3, r3, #18
 8000688:	4013      	ands	r3, r2
 800068a:	22fe      	movs	r2, #254	; 0xfe
 800068c:	0612      	lsls	r2, r2, #24
 800068e:	4694      	mov	ip, r2
 8000690:	4463      	add	r3, ip
 8000692:	425a      	negs	r2, r3
 8000694:	4153      	adcs	r3, r2
 8000696:	b2db      	uxtb	r3, r3
 8000698:	0018      	movs	r0, r3
 800069a:	46bd      	mov	sp, r7
 800069c:	bd80      	pop	{r7, pc}
 800069e:	46c0      	nop			; (mov r8, r8)
 80006a0:	40021000 	.word	0x40021000

080006a4 <LL_RCC_PLL_ConfigDomain_SYS>:
 80006a4:	b580      	push	{r7, lr}
 80006a6:	b082      	sub	sp, #8
 80006a8:	af00      	add	r7, sp, #0
 80006aa:	6078      	str	r0, [r7, #4]
 80006ac:	6039      	str	r1, [r7, #0]
 80006ae:	4b0e      	ldr	r3, [pc, #56]	; (80006e8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80006b0:	685b      	ldr	r3, [r3, #4]
 80006b2:	4a0e      	ldr	r2, [pc, #56]	; (80006ec <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 80006b4:	4013      	ands	r3, r2
 80006b6:	0019      	movs	r1, r3
 80006b8:	687a      	ldr	r2, [r7, #4]
 80006ba:	2380      	movs	r3, #128	; 0x80
 80006bc:	025b      	lsls	r3, r3, #9
 80006be:	401a      	ands	r2, r3
 80006c0:	683b      	ldr	r3, [r7, #0]
 80006c2:	431a      	orrs	r2, r3
 80006c4:	4b08      	ldr	r3, [pc, #32]	; (80006e8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80006c6:	430a      	orrs	r2, r1
 80006c8:	605a      	str	r2, [r3, #4]
 80006ca:	4b07      	ldr	r3, [pc, #28]	; (80006e8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80006cc:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80006ce:	220f      	movs	r2, #15
 80006d0:	4393      	bics	r3, r2
 80006d2:	0019      	movs	r1, r3
 80006d4:	687b      	ldr	r3, [r7, #4]
 80006d6:	220f      	movs	r2, #15
 80006d8:	401a      	ands	r2, r3
 80006da:	4b03      	ldr	r3, [pc, #12]	; (80006e8 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80006dc:	430a      	orrs	r2, r1
 80006de:	62da      	str	r2, [r3, #44]	; 0x2c
 80006e0:	46c0      	nop			; (mov r8, r8)
 80006e2:	46bd      	mov	sp, r7
 80006e4:	b002      	add	sp, #8
 80006e6:	bd80      	pop	{r7, pc}
 80006e8:	40021000 	.word	0x40021000
 80006ec:	ffc2ffff 	.word	0xffc2ffff

080006f0 <LL_SYSCFG_SetEXTISource>:
 80006f0:	b590      	push	{r4, r7, lr}
 80006f2:	b083      	sub	sp, #12
 80006f4:	af00      	add	r7, sp, #0
 80006f6:	6078      	str	r0, [r7, #4]
 80006f8:	6039      	str	r1, [r7, #0]
 80006fa:	4a0f      	ldr	r2, [pc, #60]	; (8000738 <LL_SYSCFG_SetEXTISource+0x48>)
 80006fc:	683b      	ldr	r3, [r7, #0]
 80006fe:	21ff      	movs	r1, #255	; 0xff
 8000700:	400b      	ands	r3, r1
 8000702:	3302      	adds	r3, #2
 8000704:	009b      	lsls	r3, r3, #2
 8000706:	589b      	ldr	r3, [r3, r2]
 8000708:	683a      	ldr	r2, [r7, #0]
 800070a:	0c12      	lsrs	r2, r2, #16
 800070c:	210f      	movs	r1, #15
 800070e:	4091      	lsls	r1, r2
 8000710:	000a      	movs	r2, r1
 8000712:	43d2      	mvns	r2, r2
 8000714:	401a      	ands	r2, r3
 8000716:	0011      	movs	r1, r2
 8000718:	683b      	ldr	r3, [r7, #0]
 800071a:	0c1b      	lsrs	r3, r3, #16
 800071c:	687a      	ldr	r2, [r7, #4]
 800071e:	409a      	lsls	r2, r3
 8000720:	4805      	ldr	r0, [pc, #20]	; (8000738 <LL_SYSCFG_SetEXTISource+0x48>)
 8000722:	683b      	ldr	r3, [r7, #0]
 8000724:	24ff      	movs	r4, #255	; 0xff
 8000726:	4023      	ands	r3, r4
 8000728:	430a      	orrs	r2, r1
 800072a:	3302      	adds	r3, #2
 800072c:	009b      	lsls	r3, r3, #2
 800072e:	501a      	str	r2, [r3, r0]
 8000730:	46c0      	nop			; (mov r8, r8)
 8000732:	46bd      	mov	sp, r7
 8000734:	b003      	add	sp, #12
 8000736:	bd90      	pop	{r4, r7, pc}
 8000738:	40010000 	.word	0x40010000

0800073c <LL_FLASH_SetLatency>:
 800073c:	b580      	push	{r7, lr}
 800073e:	b082      	sub	sp, #8
 8000740:	af00      	add	r7, sp, #0
 8000742:	6078      	str	r0, [r7, #4]
 8000744:	4b06      	ldr	r3, [pc, #24]	; (8000760 <LL_FLASH_SetLatency+0x24>)
 8000746:	681b      	ldr	r3, [r3, #0]
 8000748:	2201      	movs	r2, #1
 800074a:	4393      	bics	r3, r2
 800074c:	0019      	movs	r1, r3
 800074e:	4b04      	ldr	r3, [pc, #16]	; (8000760 <LL_FLASH_SetLatency+0x24>)
 8000750:	687a      	ldr	r2, [r7, #4]
 8000752:	430a      	orrs	r2, r1
 8000754:	601a      	str	r2, [r3, #0]
 8000756:	46c0      	nop			; (mov r8, r8)
 8000758:	46bd      	mov	sp, r7
 800075a:	b002      	add	sp, #8
 800075c:	bd80      	pop	{r7, pc}
 800075e:	46c0      	nop			; (mov r8, r8)
 8000760:	40022000 	.word	0x40022000

08000764 <LL_AHB1_GRP1_EnableClock>:
 8000764:	b580      	push	{r7, lr}
 8000766:	b084      	sub	sp, #16
 8000768:	af00      	add	r7, sp, #0
 800076a:	6078      	str	r0, [r7, #4]
 800076c:	4b07      	ldr	r3, [pc, #28]	; (800078c <LL_AHB1_GRP1_EnableClock+0x28>)
 800076e:	6959      	ldr	r1, [r3, #20]
 8000770:	4b06      	ldr	r3, [pc, #24]	; (800078c <LL_AHB1_GRP1_EnableClock+0x28>)
 8000772:	687a      	ldr	r2, [r7, #4]
 8000774:	430a      	orrs	r2, r1
 8000776:	615a      	str	r2, [r3, #20]
 8000778:	4b04      	ldr	r3, [pc, #16]	; (800078c <LL_AHB1_GRP1_EnableClock+0x28>)
 800077a:	695b      	ldr	r3, [r3, #20]
 800077c:	687a      	ldr	r2, [r7, #4]
 800077e:	4013      	ands	r3, r2
 8000780:	60fb      	str	r3, [r7, #12]
 8000782:	68fb      	ldr	r3, [r7, #12]
 8000784:	46c0      	nop			; (mov r8, r8)
 8000786:	46bd      	mov	sp, r7
 8000788:	b004      	add	sp, #16
 800078a:	bd80      	pop	{r7, pc}
 800078c:	40021000 	.word	0x40021000

08000790 <LL_APB1_GRP1_EnableClock>:
 8000790:	b580      	push	{r7, lr}
 8000792:	b084      	sub	sp, #16
 8000794:	af00      	add	r7, sp, #0
 8000796:	6078      	str	r0, [r7, #4]
 8000798:	4b07      	ldr	r3, [pc, #28]	; (80007b8 <LL_APB1_GRP1_EnableClock+0x28>)
 800079a:	69d9      	ldr	r1, [r3, #28]
 800079c:	4b06      	ldr	r3, [pc, #24]	; (80007b8 <LL_APB1_GRP1_EnableClock+0x28>)
 800079e:	687a      	ldr	r2, [r7, #4]
 80007a0:	430a      	orrs	r2, r1
 80007a2:	61da      	str	r2, [r3, #28]
 80007a4:	4b04      	ldr	r3, [pc, #16]	; (80007b8 <LL_APB1_GRP1_EnableClock+0x28>)
 80007a6:	69db      	ldr	r3, [r3, #28]
 80007a8:	687a      	ldr	r2, [r7, #4]
 80007aa:	4013      	ands	r3, r2
 80007ac:	60fb      	str	r3, [r7, #12]
 80007ae:	68fb      	ldr	r3, [r7, #12]
 80007b0:	46c0      	nop			; (mov r8, r8)
 80007b2:	46bd      	mov	sp, r7
 80007b4:	b004      	add	sp, #16
 80007b6:	bd80      	pop	{r7, pc}
 80007b8:	40021000 	.word	0x40021000

080007bc <LL_APB1_GRP2_EnableClock>:
 80007bc:	b580      	push	{r7, lr}
 80007be:	b084      	sub	sp, #16
 80007c0:	af00      	add	r7, sp, #0
 80007c2:	6078      	str	r0, [r7, #4]
 80007c4:	4b07      	ldr	r3, [pc, #28]	; (80007e4 <LL_APB1_GRP2_EnableClock+0x28>)
 80007c6:	6999      	ldr	r1, [r3, #24]
 80007c8:	4b06      	ldr	r3, [pc, #24]	; (80007e4 <LL_APB1_GRP2_EnableClock+0x28>)
 80007ca:	687a      	ldr	r2, [r7, #4]
 80007cc:	430a      	orrs	r2, r1
 80007ce:	619a      	str	r2, [r3, #24]
 80007d0:	4b04      	ldr	r3, [pc, #16]	; (80007e4 <LL_APB1_GRP2_EnableClock+0x28>)
 80007d2:	699b      	ldr	r3, [r3, #24]
 80007d4:	687a      	ldr	r2, [r7, #4]
 80007d6:	4013      	ands	r3, r2
 80007d8:	60fb      	str	r3, [r7, #12]
 80007da:	68fb      	ldr	r3, [r7, #12]
 80007dc:	46c0      	nop			; (mov r8, r8)
 80007de:	46bd      	mov	sp, r7
 80007e0:	b004      	add	sp, #16
 80007e2:	bd80      	pop	{r7, pc}
 80007e4:	40021000 	.word	0x40021000

080007e8 <LL_GPIO_SetPinMode>:
 80007e8:	b580      	push	{r7, lr}
 80007ea:	b084      	sub	sp, #16
 80007ec:	af00      	add	r7, sp, #0
 80007ee:	60f8      	str	r0, [r7, #12]
 80007f0:	60b9      	str	r1, [r7, #8]
 80007f2:	607a      	str	r2, [r7, #4]
 80007f4:	68fb      	ldr	r3, [r7, #12]
 80007f6:	6819      	ldr	r1, [r3, #0]
 80007f8:	68bb      	ldr	r3, [r7, #8]
 80007fa:	435b      	muls	r3, r3
 80007fc:	001a      	movs	r2, r3
 80007fe:	0013      	movs	r3, r2
 8000800:	005b      	lsls	r3, r3, #1
 8000802:	189b      	adds	r3, r3, r2
 8000804:	43db      	mvns	r3, r3
 8000806:	400b      	ands	r3, r1
 8000808:	001a      	movs	r2, r3
 800080a:	68bb      	ldr	r3, [r7, #8]
 800080c:	435b      	muls	r3, r3
 800080e:	6879      	ldr	r1, [r7, #4]
 8000810:	434b      	muls	r3, r1
 8000812:	431a      	orrs	r2, r3
 8000814:	68fb      	ldr	r3, [r7, #12]
 8000816:	601a      	str	r2, [r3, #0]
 8000818:	46c0      	nop			; (mov r8, r8)
 800081a:	46bd      	mov	sp, r7
 800081c:	b004      	add	sp, #16
 800081e:	bd80      	pop	{r7, pc}

08000820 <LL_GPIO_SetOutputPin>:
 8000820:	b580      	push	{r7, lr}
 8000822:	b082      	sub	sp, #8
 8000824:	af00      	add	r7, sp, #0
 8000826:	6078      	str	r0, [r7, #4]
 8000828:	6039      	str	r1, [r7, #0]
 800082a:	687b      	ldr	r3, [r7, #4]
 800082c:	683a      	ldr	r2, [r7, #0]
 800082e:	619a      	str	r2, [r3, #24]
 8000830:	46c0      	nop			; (mov r8, r8)
 8000832:	46bd      	mov	sp, r7
 8000834:	b002      	add	sp, #8
 8000836:	bd80      	pop	{r7, pc}

08000838 <LL_GPIO_ResetOutputPin>:
 8000838:	b580      	push	{r7, lr}
 800083a:	b082      	sub	sp, #8
 800083c:	af00      	add	r7, sp, #0
 800083e:	6078      	str	r0, [r7, #4]
 8000840:	6039      	str	r1, [r7, #0]
 8000842:	687b      	ldr	r3, [r7, #4]
 8000844:	683a      	ldr	r2, [r7, #0]
 8000846:	629a      	str	r2, [r3, #40]	; 0x28
 8000848:	46c0      	nop			; (mov r8, r8)
 800084a:	46bd      	mov	sp, r7
 800084c:	b002      	add	sp, #8
 800084e:	bd80      	pop	{r7, pc}

08000850 <LL_TIM_EnableCounter>:
 8000850:	b580      	push	{r7, lr}
 8000852:	b082      	sub	sp, #8
 8000854:	af00      	add	r7, sp, #0
 8000856:	6078      	str	r0, [r7, #4]
 8000858:	687b      	ldr	r3, [r7, #4]
 800085a:	681b      	ldr	r3, [r3, #0]
 800085c:	2201      	movs	r2, #1
 800085e:	431a      	orrs	r2, r3
 8000860:	687b      	ldr	r3, [r7, #4]
 8000862:	601a      	str	r2, [r3, #0]
 8000864:	46c0      	nop			; (mov r8, r8)
 8000866:	46bd      	mov	sp, r7
 8000868:	b002      	add	sp, #8
 800086a:	bd80      	pop	{r7, pc}

0800086c <LL_TIM_SetCounterMode>:
 800086c:	b580      	push	{r7, lr}
 800086e:	b082      	sub	sp, #8
 8000870:	af00      	add	r7, sp, #0
 8000872:	6078      	str	r0, [r7, #4]
 8000874:	6039      	str	r1, [r7, #0]
 8000876:	687b      	ldr	r3, [r7, #4]
 8000878:	681b      	ldr	r3, [r3, #0]
 800087a:	2270      	movs	r2, #112	; 0x70
 800087c:	4393      	bics	r3, r2
 800087e:	001a      	movs	r2, r3
 8000880:	683b      	ldr	r3, [r7, #0]
 8000882:	431a      	orrs	r2, r3
 8000884:	687b      	ldr	r3, [r7, #4]
 8000886:	601a      	str	r2, [r3, #0]
 8000888:	46c0      	nop			; (mov r8, r8)
 800088a:	46bd      	mov	sp, r7
 800088c:	b002      	add	sp, #8
 800088e:	bd80      	pop	{r7, pc}

08000890 <LL_TIM_SetPrescaler>:
 8000890:	b580      	push	{r7, lr}
 8000892:	b082      	sub	sp, #8
 8000894:	af00      	add	r7, sp, #0
 8000896:	6078      	str	r0, [r7, #4]
 8000898:	6039      	str	r1, [r7, #0]
 800089a:	687b      	ldr	r3, [r7, #4]
 800089c:	683a      	ldr	r2, [r7, #0]
 800089e:	629a      	str	r2, [r3, #40]	; 0x28
 80008a0:	46c0      	nop			; (mov r8, r8)
 80008a2:	46bd      	mov	sp, r7
 80008a4:	b002      	add	sp, #8
 80008a6:	bd80      	pop	{r7, pc}

080008a8 <LL_TIM_SetAutoReload>:
 80008a8:	b580      	push	{r7, lr}
 80008aa:	b082      	sub	sp, #8
 80008ac:	af00      	add	r7, sp, #0
 80008ae:	6078      	str	r0, [r7, #4]
 80008b0:	6039      	str	r1, [r7, #0]
 80008b2:	687b      	ldr	r3, [r7, #4]
 80008b4:	683a      	ldr	r2, [r7, #0]
 80008b6:	62da      	str	r2, [r3, #44]	; 0x2c
 80008b8:	46c0      	nop			; (mov r8, r8)
 80008ba:	46bd      	mov	sp, r7
 80008bc:	b002      	add	sp, #8
 80008be:	bd80      	pop	{r7, pc}

080008c0 <LL_TIM_ClearFlag_UPDATE>:
 80008c0:	b580      	push	{r7, lr}
 80008c2:	b082      	sub	sp, #8
 80008c4:	af00      	add	r7, sp, #0
 80008c6:	6078      	str	r0, [r7, #4]
 80008c8:	687b      	ldr	r3, [r7, #4]
 80008ca:	2202      	movs	r2, #2
 80008cc:	4252      	negs	r2, r2
 80008ce:	611a      	str	r2, [r3, #16]
 80008d0:	46c0      	nop			; (mov r8, r8)
 80008d2:	46bd      	mov	sp, r7
 80008d4:	b002      	add	sp, #8
 80008d6:	bd80      	pop	{r7, pc}

080008d8 <LL_TIM_EnableIT_UPDATE>:
 80008d8:	b580      	push	{r7, lr}
 80008da:	b082      	sub	sp, #8
 80008dc:	af00      	add	r7, sp, #0
 80008de:	6078      	str	r0, [r7, #4]
 80008e0:	687b      	ldr	r3, [r7, #4]
 80008e2:	68db      	ldr	r3, [r3, #12]
 80008e4:	2201      	movs	r2, #1
 80008e6:	431a      	orrs	r2, r3
 80008e8:	687b      	ldr	r3, [r7, #4]
 80008ea:	60da      	str	r2, [r3, #12]
 80008ec:	46c0      	nop			; (mov r8, r8)
 80008ee:	46bd      	mov	sp, r7
 80008f0:	b002      	add	sp, #8
 80008f2:	bd80      	pop	{r7, pc}

080008f4 <LL_EXTI_EnableIT_0_31>:
 80008f4:	b580      	push	{r7, lr}
 80008f6:	b082      	sub	sp, #8
 80008f8:	af00      	add	r7, sp, #0
 80008fa:	6078      	str	r0, [r7, #4]
 80008fc:	4b04      	ldr	r3, [pc, #16]	; (8000910 <LL_EXTI_EnableIT_0_31+0x1c>)
 80008fe:	6819      	ldr	r1, [r3, #0]
 8000900:	4b03      	ldr	r3, [pc, #12]	; (8000910 <LL_EXTI_EnableIT_0_31+0x1c>)
 8000902:	687a      	ldr	r2, [r7, #4]
 8000904:	430a      	orrs	r2, r1
 8000906:	601a      	str	r2, [r3, #0]
 8000908:	46c0      	nop			; (mov r8, r8)
 800090a:	46bd      	mov	sp, r7
 800090c:	b002      	add	sp, #8
 800090e:	bd80      	pop	{r7, pc}
 8000910:	40010400 	.word	0x40010400

08000914 <LL_EXTI_EnableRisingTrig_0_31>:
 8000914:	b580      	push	{r7, lr}
 8000916:	b082      	sub	sp, #8
 8000918:	af00      	add	r7, sp, #0
 800091a:	6078      	str	r0, [r7, #4]
 800091c:	4b04      	ldr	r3, [pc, #16]	; (8000930 <LL_EXTI_EnableRisingTrig_0_31+0x1c>)
 800091e:	6899      	ldr	r1, [r3, #8]
 8000920:	4b03      	ldr	r3, [pc, #12]	; (8000930 <LL_EXTI_EnableRisingTrig_0_31+0x1c>)
 8000922:	687a      	ldr	r2, [r7, #4]
 8000924:	430a      	orrs	r2, r1
 8000926:	609a      	str	r2, [r3, #8]
 8000928:	46c0      	nop			; (mov r8, r8)
 800092a:	46bd      	mov	sp, r7
 800092c:	b002      	add	sp, #8
 800092e:	bd80      	pop	{r7, pc}
 8000930:	40010400 	.word	0x40010400

08000934 <LL_EXTI_ClearFlag_0_31>:
 8000934:	b580      	push	{r7, lr}
 8000936:	b082      	sub	sp, #8
 8000938:	af00      	add	r7, sp, #0
 800093a:	6078      	str	r0, [r7, #4]
 800093c:	4b03      	ldr	r3, [pc, #12]	; (800094c <LL_EXTI_ClearFlag_0_31+0x18>)
 800093e:	687a      	ldr	r2, [r7, #4]
 8000940:	615a      	str	r2, [r3, #20]
 8000942:	46c0      	nop			; (mov r8, r8)
 8000944:	46bd      	mov	sp, r7
 8000946:	b002      	add	sp, #8
 8000948:	bd80      	pop	{r7, pc}
 800094a:	46c0      	nop			; (mov r8, r8)
 800094c:	40010400 	.word	0x40010400

08000950 <rcc_config>:
 8000950:	b580      	push	{r7, lr}
 8000952:	af00      	add	r7, sp, #0
 8000954:	2001      	movs	r0, #1
 8000956:	f7ff fef1 	bl	800073c <LL_FLASH_SetLatency>
 800095a:	f7ff fe19 	bl	8000590 <LL_RCC_HSI_Enable>
 800095e:	46c0      	nop			; (mov r8, r8)
 8000960:	f7ff fe24 	bl	80005ac <LL_RCC_HSI_IsReady>
 8000964:	0003      	movs	r3, r0
 8000966:	2b01      	cmp	r3, #1
 8000968:	d1fa      	bne.n	8000960 <rcc_config+0x10>
 800096a:	23a0      	movs	r3, #160	; 0xa0
 800096c:	039b      	lsls	r3, r3, #14
 800096e:	0019      	movs	r1, r3
 8000970:	2000      	movs	r0, #0
 8000972:	f7ff fe97 	bl	80006a4 <LL_RCC_PLL_ConfigDomain_SYS>
 8000976:	f7ff fe73 	bl	8000660 <LL_RCC_PLL_Enable>
 800097a:	46c0      	nop			; (mov r8, r8)
 800097c:	f7ff fe7e 	bl	800067c <LL_RCC_PLL_IsReady>
 8000980:	0003      	movs	r3, r0
 8000982:	2b01      	cmp	r3, #1
 8000984:	d1fa      	bne.n	800097c <rcc_config+0x2c>
 8000986:	2000      	movs	r0, #0
 8000988:	f7ff fe40 	bl	800060c <LL_RCC_SetAHBPrescaler>
 800098c:	2002      	movs	r0, #2
 800098e:	f7ff fe1d 	bl	80005cc <LL_RCC_SetSysClkSource>
 8000992:	46c0      	nop			; (mov r8, r8)
 8000994:	f7ff fe2e 	bl	80005f4 <LL_RCC_GetSysClkSource>
 8000998:	0003      	movs	r3, r0
 800099a:	2b08      	cmp	r3, #8
 800099c:	d1fa      	bne.n	8000994 <rcc_config+0x44>
 800099e:	2000      	movs	r0, #0
 80009a0:	f7ff fe48 	bl	8000634 <LL_RCC_SetAPB1Prescaler>
 80009a4:	4b02      	ldr	r3, [pc, #8]	; (80009b0 <rcc_config+0x60>)
 80009a6:	4a03      	ldr	r2, [pc, #12]	; (80009b4 <rcc_config+0x64>)
 80009a8:	601a      	str	r2, [r3, #0]
 80009aa:	46c0      	nop			; (mov r8, r8)
 80009ac:	46bd      	mov	sp, r7
 80009ae:	bd80      	pop	{r7, pc}
 80009b0:	20000434 	.word	0x20000434
 80009b4:	02dc6c00 	.word	0x02dc6c00

080009b8 <gpio_config>:
 80009b8:	b580      	push	{r7, lr}
 80009ba:	af00      	add	r7, sp, #0
 80009bc:	2380      	movs	r3, #128	; 0x80
 80009be:	031b      	lsls	r3, r3, #12
 80009c0:	0018      	movs	r0, r3
 80009c2:	f7ff fecf 	bl	8000764 <LL_AHB1_GRP1_EnableClock>
 80009c6:	2380      	movs	r3, #128	; 0x80
 80009c8:	029b      	lsls	r3, r3, #10
 80009ca:	0018      	movs	r0, r3
 80009cc:	f7ff feca 	bl	8000764 <LL_AHB1_GRP1_EnableClock>
 80009d0:	4b3b      	ldr	r3, [pc, #236]	; (8000ac0 <gpio_config+0x108>)
 80009d2:	2201      	movs	r2, #1
 80009d4:	2101      	movs	r1, #1
 80009d6:	0018      	movs	r0, r3
 80009d8:	f7ff ff06 	bl	80007e8 <LL_GPIO_SetPinMode>
 80009dc:	4b38      	ldr	r3, [pc, #224]	; (8000ac0 <gpio_config+0x108>)
 80009de:	2201      	movs	r2, #1
 80009e0:	2102      	movs	r1, #2
 80009e2:	0018      	movs	r0, r3
 80009e4:	f7ff ff00 	bl	80007e8 <LL_GPIO_SetPinMode>
 80009e8:	4b35      	ldr	r3, [pc, #212]	; (8000ac0 <gpio_config+0x108>)
 80009ea:	2201      	movs	r2, #1
 80009ec:	2104      	movs	r1, #4
 80009ee:	0018      	movs	r0, r3
 80009f0:	f7ff fefa 	bl	80007e8 <LL_GPIO_SetPinMode>
 80009f4:	4b32      	ldr	r3, [pc, #200]	; (8000ac0 <gpio_config+0x108>)
 80009f6:	2201      	movs	r2, #1
 80009f8:	2108      	movs	r1, #8
 80009fa:	0018      	movs	r0, r3
 80009fc:	f7ff fef4 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a00:	2390      	movs	r3, #144	; 0x90
 8000a02:	05db      	lsls	r3, r3, #23
 8000a04:	2201      	movs	r2, #1
 8000a06:	2101      	movs	r1, #1
 8000a08:	0018      	movs	r0, r3
 8000a0a:	f7ff feed 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a0e:	2390      	movs	r3, #144	; 0x90
 8000a10:	05db      	lsls	r3, r3, #23
 8000a12:	2201      	movs	r2, #1
 8000a14:	2102      	movs	r1, #2
 8000a16:	0018      	movs	r0, r3
 8000a18:	f7ff fee6 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a1c:	2390      	movs	r3, #144	; 0x90
 8000a1e:	05db      	lsls	r3, r3, #23
 8000a20:	2201      	movs	r2, #1
 8000a22:	2104      	movs	r1, #4
 8000a24:	0018      	movs	r0, r3
 8000a26:	f7ff fedf 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a2a:	2390      	movs	r3, #144	; 0x90
 8000a2c:	05db      	lsls	r3, r3, #23
 8000a2e:	2201      	movs	r2, #1
 8000a30:	2108      	movs	r1, #8
 8000a32:	0018      	movs	r0, r3
 8000a34:	f7ff fed8 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a38:	2390      	movs	r3, #144	; 0x90
 8000a3a:	05db      	lsls	r3, r3, #23
 8000a3c:	2201      	movs	r2, #1
 8000a3e:	2110      	movs	r1, #16
 8000a40:	0018      	movs	r0, r3
 8000a42:	f7ff fed1 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a46:	2390      	movs	r3, #144	; 0x90
 8000a48:	05db      	lsls	r3, r3, #23
 8000a4a:	2201      	movs	r2, #1
 8000a4c:	2120      	movs	r1, #32
 8000a4e:	0018      	movs	r0, r3
 8000a50:	f7ff feca 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a54:	2390      	movs	r3, #144	; 0x90
 8000a56:	05db      	lsls	r3, r3, #23
 8000a58:	2201      	movs	r2, #1
 8000a5a:	2140      	movs	r1, #64	; 0x40
 8000a5c:	0018      	movs	r0, r3
 8000a5e:	f7ff fec3 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a62:	2390      	movs	r3, #144	; 0x90
 8000a64:	05db      	lsls	r3, r3, #23
 8000a66:	2201      	movs	r2, #1
 8000a68:	2180      	movs	r1, #128	; 0x80
 8000a6a:	0018      	movs	r0, r3
 8000a6c:	f7ff febc 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a70:	2380      	movs	r3, #128	; 0x80
 8000a72:	0059      	lsls	r1, r3, #1
 8000a74:	2390      	movs	r3, #144	; 0x90
 8000a76:	05db      	lsls	r3, r3, #23
 8000a78:	2201      	movs	r2, #1
 8000a7a:	0018      	movs	r0, r3
 8000a7c:	f7ff feb4 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a80:	2380      	movs	r3, #128	; 0x80
 8000a82:	0099      	lsls	r1, r3, #2
 8000a84:	2390      	movs	r3, #144	; 0x90
 8000a86:	05db      	lsls	r3, r3, #23
 8000a88:	2201      	movs	r2, #1
 8000a8a:	0018      	movs	r0, r3
 8000a8c:	f7ff feac 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000a90:	2380      	movs	r3, #128	; 0x80
 8000a92:	00d9      	lsls	r1, r3, #3
 8000a94:	2390      	movs	r3, #144	; 0x90
 8000a96:	05db      	lsls	r3, r3, #23
 8000a98:	2201      	movs	r2, #1
 8000a9a:	0018      	movs	r0, r3
 8000a9c:	f7ff fea4 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000aa0:	2390      	movs	r3, #144	; 0x90
 8000aa2:	05db      	lsls	r3, r3, #23
 8000aa4:	2200      	movs	r2, #0
 8000aa6:	2101      	movs	r1, #1
 8000aa8:	0018      	movs	r0, r3
 8000aaa:	f7ff fe9d 	bl	80007e8 <LL_GPIO_SetPinMode>
 8000aae:	2380      	movs	r3, #128	; 0x80
 8000ab0:	031b      	lsls	r3, r3, #12
 8000ab2:	0018      	movs	r0, r3
 8000ab4:	f7ff fe56 	bl	8000764 <LL_AHB1_GRP1_EnableClock>
 8000ab8:	46c0      	nop			; (mov r8, r8)
 8000aba:	46bd      	mov	sp, r7
 8000abc:	bd80      	pop	{r7, pc}
 8000abe:	46c0      	nop			; (mov r8, r8)
 8000ac0:	48000800 	.word	0x48000800

08000ac4 <exti_config>:
 8000ac4:	b580      	push	{r7, lr}
 8000ac6:	af00      	add	r7, sp, #0
 8000ac8:	2001      	movs	r0, #1
 8000aca:	f7ff fe77 	bl	80007bc <LL_APB1_GRP2_EnableClock>
 8000ace:	2100      	movs	r1, #0
 8000ad0:	2000      	movs	r0, #0
 8000ad2:	f7ff fe0d 	bl	80006f0 <LL_SYSCFG_SetEXTISource>
 8000ad6:	2001      	movs	r0, #1
 8000ad8:	f7ff ff0c 	bl	80008f4 <LL_EXTI_EnableIT_0_31>
 8000adc:	2001      	movs	r0, #1
 8000ade:	f7ff ff19 	bl	8000914 <LL_EXTI_EnableRisingTrig_0_31>
 8000ae2:	2005      	movs	r0, #5
 8000ae4:	f7ff fcd0 	bl	8000488 <NVIC_EnableIRQ>
 8000ae8:	2100      	movs	r1, #0
 8000aea:	2005      	movs	r0, #5
 8000aec:	f7ff fce2 	bl	80004b4 <NVIC_SetPriority>
 8000af0:	46c0      	nop			; (mov r8, r8)
 8000af2:	46bd      	mov	sp, r7
 8000af4:	bd80      	pop	{r7, pc}
	...

08000af8 <timers_config>:
 8000af8:	b580      	push	{r7, lr}
 8000afa:	af00      	add	r7, sp, #0
 8000afc:	2001      	movs	r0, #1
 8000afe:	f7ff fe47 	bl	8000790 <LL_APB1_GRP1_EnableClock>
 8000b02:	4a14      	ldr	r2, [pc, #80]	; (8000b54 <timers_config+0x5c>)
 8000b04:	2380      	movs	r3, #128	; 0x80
 8000b06:	05db      	lsls	r3, r3, #23
 8000b08:	0011      	movs	r1, r2
 8000b0a:	0018      	movs	r0, r3
 8000b0c:	f7ff fec0 	bl	8000890 <LL_TIM_SetPrescaler>
 8000b10:	4a11      	ldr	r2, [pc, #68]	; (8000b58 <timers_config+0x60>)
 8000b12:	2380      	movs	r3, #128	; 0x80
 8000b14:	05db      	lsls	r3, r3, #23
 8000b16:	0011      	movs	r1, r2
 8000b18:	0018      	movs	r0, r3
 8000b1a:	f7ff fec5 	bl	80008a8 <LL_TIM_SetAutoReload>
 8000b1e:	2380      	movs	r3, #128	; 0x80
 8000b20:	05db      	lsls	r3, r3, #23
 8000b22:	2100      	movs	r1, #0
 8000b24:	0018      	movs	r0, r3
 8000b26:	f7ff fea1 	bl	800086c <LL_TIM_SetCounterMode>
 8000b2a:	2380      	movs	r3, #128	; 0x80
 8000b2c:	05db      	lsls	r3, r3, #23
 8000b2e:	0018      	movs	r0, r3
 8000b30:	f7ff fed2 	bl	80008d8 <LL_TIM_EnableIT_UPDATE>
 8000b34:	2380      	movs	r3, #128	; 0x80
 8000b36:	05db      	lsls	r3, r3, #23
 8000b38:	0018      	movs	r0, r3
 8000b3a:	f7ff fe89 	bl	8000850 <LL_TIM_EnableCounter>
 8000b3e:	200f      	movs	r0, #15
 8000b40:	f7ff fca2 	bl	8000488 <NVIC_EnableIRQ>
 8000b44:	2100      	movs	r1, #0
 8000b46:	200f      	movs	r0, #15
 8000b48:	f7ff fcb4 	bl	80004b4 <NVIC_SetPriority>
 8000b4c:	46c0      	nop			; (mov r8, r8)
 8000b4e:	46bd      	mov	sp, r7
 8000b50:	bd80      	pop	{r7, pc}
 8000b52:	46c0      	nop			; (mov r8, r8)
 8000b54:	0000bb7f 	.word	0x0000bb7f
 8000b58:	000003e7 	.word	0x000003e7

08000b5c <TIM2_IRQHandler>:
 8000b5c:	b580      	push	{r7, lr}
 8000b5e:	af00      	add	r7, sp, #0
 8000b60:	4b06      	ldr	r3, [pc, #24]	; (8000b7c <TIM2_IRQHandler+0x20>)
 8000b62:	681b      	ldr	r3, [r3, #0]
 8000b64:	1c5a      	adds	r2, r3, #1
 8000b66:	4b05      	ldr	r3, [pc, #20]	; (8000b7c <TIM2_IRQHandler+0x20>)
 8000b68:	601a      	str	r2, [r3, #0]
 8000b6a:	2380      	movs	r3, #128	; 0x80
 8000b6c:	05db      	lsls	r3, r3, #23
 8000b6e:	0018      	movs	r0, r3
 8000b70:	f7ff fea6 	bl	80008c0 <LL_TIM_ClearFlag_UPDATE>
 8000b74:	46c0      	nop			; (mov r8, r8)
 8000b76:	46bd      	mov	sp, r7
 8000b78:	bd80      	pop	{r7, pc}
 8000b7a:	46c0      	nop			; (mov r8, r8)
 8000b7c:	20000430 	.word	0x20000430

08000b80 <EXTI0_1_IRQHandler>:
 8000b80:	b580      	push	{r7, lr}
 8000b82:	af00      	add	r7, sp, #0
 8000b84:	4b09      	ldr	r3, [pc, #36]	; (8000bac <EXTI0_1_IRQHandler+0x2c>)
 8000b86:	681b      	ldr	r3, [r3, #0]
 8000b88:	1c5a      	adds	r2, r3, #1
 8000b8a:	4b08      	ldr	r3, [pc, #32]	; (8000bac <EXTI0_1_IRQHandler+0x2c>)
 8000b8c:	601a      	str	r2, [r3, #0]
 8000b8e:	2380      	movs	r3, #128	; 0x80
 8000b90:	00da      	lsls	r2, r3, #3
 8000b92:	2390      	movs	r3, #144	; 0x90
 8000b94:	05db      	lsls	r3, r3, #23
 8000b96:	0011      	movs	r1, r2
 8000b98:	0018      	movs	r0, r3
 8000b9a:	f7ff fe41 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000b9e:	2001      	movs	r0, #1
 8000ba0:	f7ff fec8 	bl	8000934 <LL_EXTI_ClearFlag_0_31>
 8000ba4:	46c0      	nop			; (mov r8, r8)
 8000ba6:	46bd      	mov	sp, r7
 8000ba8:	bd80      	pop	{r7, pc}
 8000baa:	46c0      	nop			; (mov r8, r8)
 8000bac:	20000430 	.word	0x20000430

08000bb0 <delay>:
 8000bb0:	b580      	push	{r7, lr}
 8000bb2:	4e02      	ldr	r6, [pc, #8]	; (8000bbc <delay+0xc>)
 8000bb4:	3e01      	subs	r6, #1
 8000bb6:	2e00      	cmp	r6, #0
 8000bb8:	d1fc      	bne.n	8000bb4 <delay+0x4>
 8000bba:	bd80      	pop	{r7, pc}
 8000bbc:	00001000 	.word	0x00001000
 8000bc0:	46c0      	nop			; (mov r8, r8)
	...

08000bc4 <fkl>:
 8000bc4:	b580      	push	{r7, lr}
 8000bc6:	b082      	sub	sp, #8
 8000bc8:	af00      	add	r7, sp, #0
 8000bca:	6078      	str	r0, [r7, #4]
 8000bcc:	687b      	ldr	r3, [r7, #4]
 8000bce:	681b      	ldr	r3, [r3, #0]
 8000bd0:	2b01      	cmp	r3, #1
 8000bd2:	d104      	bne.n	8000bde <fkl+0x1a>
 8000bd4:	4b48      	ldr	r3, [pc, #288]	; (8000cf8 <fkl+0x134>)
 8000bd6:	2101      	movs	r1, #1
 8000bd8:	0018      	movs	r0, r3
 8000bda:	f7ff fe21 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000bde:	687b      	ldr	r3, [r7, #4]
 8000be0:	3304      	adds	r3, #4
 8000be2:	681b      	ldr	r3, [r3, #0]
 8000be4:	2b01      	cmp	r3, #1
 8000be6:	d104      	bne.n	8000bf2 <fkl+0x2e>
 8000be8:	4b43      	ldr	r3, [pc, #268]	; (8000cf8 <fkl+0x134>)
 8000bea:	2104      	movs	r1, #4
 8000bec:	0018      	movs	r0, r3
 8000bee:	f7ff fe17 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000bf2:	687b      	ldr	r3, [r7, #4]
 8000bf4:	3308      	adds	r3, #8
 8000bf6:	681b      	ldr	r3, [r3, #0]
 8000bf8:	2b01      	cmp	r3, #1
 8000bfa:	d105      	bne.n	8000c08 <fkl+0x44>
 8000bfc:	2390      	movs	r3, #144	; 0x90
 8000bfe:	05db      	lsls	r3, r3, #23
 8000c00:	2140      	movs	r1, #64	; 0x40
 8000c02:	0018      	movs	r0, r3
 8000c04:	f7ff fe0c 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000c08:	687b      	ldr	r3, [r7, #4]
 8000c0a:	330c      	adds	r3, #12
 8000c0c:	681b      	ldr	r3, [r3, #0]
 8000c0e:	2b01      	cmp	r3, #1
 8000c10:	d105      	bne.n	8000c1e <fkl+0x5a>
 8000c12:	2390      	movs	r3, #144	; 0x90
 8000c14:	05db      	lsls	r3, r3, #23
 8000c16:	2120      	movs	r1, #32
 8000c18:	0018      	movs	r0, r3
 8000c1a:	f7ff fe01 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000c1e:	687b      	ldr	r3, [r7, #4]
 8000c20:	3310      	adds	r3, #16
 8000c22:	681b      	ldr	r3, [r3, #0]
 8000c24:	2b01      	cmp	r3, #1
 8000c26:	d105      	bne.n	8000c34 <fkl+0x70>
 8000c28:	2390      	movs	r3, #144	; 0x90
 8000c2a:	05db      	lsls	r3, r3, #23
 8000c2c:	2110      	movs	r1, #16
 8000c2e:	0018      	movs	r0, r3
 8000c30:	f7ff fdf6 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000c34:	687b      	ldr	r3, [r7, #4]
 8000c36:	3314      	adds	r3, #20
 8000c38:	681b      	ldr	r3, [r3, #0]
 8000c3a:	2b01      	cmp	r3, #1
 8000c3c:	d104      	bne.n	8000c48 <fkl+0x84>
 8000c3e:	4b2e      	ldr	r3, [pc, #184]	; (8000cf8 <fkl+0x134>)
 8000c40:	2102      	movs	r1, #2
 8000c42:	0018      	movs	r0, r3
 8000c44:	f7ff fdec 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000c48:	687b      	ldr	r3, [r7, #4]
 8000c4a:	3318      	adds	r3, #24
 8000c4c:	681b      	ldr	r3, [r3, #0]
 8000c4e:	2b01      	cmp	r3, #1
 8000c50:	d105      	bne.n	8000c5e <fkl+0x9a>
 8000c52:	2390      	movs	r3, #144	; 0x90
 8000c54:	05db      	lsls	r3, r3, #23
 8000c56:	2180      	movs	r1, #128	; 0x80
 8000c58:	0018      	movs	r0, r3
 8000c5a:	f7ff fde1 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000c5e:	687b      	ldr	r3, [r7, #4]
 8000c60:	681b      	ldr	r3, [r3, #0]
 8000c62:	2b00      	cmp	r3, #0
 8000c64:	d104      	bne.n	8000c70 <fkl+0xac>
 8000c66:	4b24      	ldr	r3, [pc, #144]	; (8000cf8 <fkl+0x134>)
 8000c68:	2101      	movs	r1, #1
 8000c6a:	0018      	movs	r0, r3
 8000c6c:	f7ff fde4 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000c70:	687b      	ldr	r3, [r7, #4]
 8000c72:	3304      	adds	r3, #4
 8000c74:	681b      	ldr	r3, [r3, #0]
 8000c76:	2b00      	cmp	r3, #0
 8000c78:	d104      	bne.n	8000c84 <fkl+0xc0>
 8000c7a:	4b1f      	ldr	r3, [pc, #124]	; (8000cf8 <fkl+0x134>)
 8000c7c:	2104      	movs	r1, #4
 8000c7e:	0018      	movs	r0, r3
 8000c80:	f7ff fdda 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000c84:	687b      	ldr	r3, [r7, #4]
 8000c86:	3308      	adds	r3, #8
 8000c88:	681b      	ldr	r3, [r3, #0]
 8000c8a:	2b00      	cmp	r3, #0
 8000c8c:	d105      	bne.n	8000c9a <fkl+0xd6>
 8000c8e:	2390      	movs	r3, #144	; 0x90
 8000c90:	05db      	lsls	r3, r3, #23
 8000c92:	2140      	movs	r1, #64	; 0x40
 8000c94:	0018      	movs	r0, r3
 8000c96:	f7ff fdcf 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000c9a:	687b      	ldr	r3, [r7, #4]
 8000c9c:	330c      	adds	r3, #12
 8000c9e:	681b      	ldr	r3, [r3, #0]
 8000ca0:	2b00      	cmp	r3, #0
 8000ca2:	d105      	bne.n	8000cb0 <fkl+0xec>
 8000ca4:	2390      	movs	r3, #144	; 0x90
 8000ca6:	05db      	lsls	r3, r3, #23
 8000ca8:	2120      	movs	r1, #32
 8000caa:	0018      	movs	r0, r3
 8000cac:	f7ff fdc4 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000cb0:	687b      	ldr	r3, [r7, #4]
 8000cb2:	3310      	adds	r3, #16
 8000cb4:	681b      	ldr	r3, [r3, #0]
 8000cb6:	2b00      	cmp	r3, #0
 8000cb8:	d105      	bne.n	8000cc6 <fkl+0x102>
 8000cba:	2390      	movs	r3, #144	; 0x90
 8000cbc:	05db      	lsls	r3, r3, #23
 8000cbe:	2110      	movs	r1, #16
 8000cc0:	0018      	movs	r0, r3
 8000cc2:	f7ff fdb9 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000cc6:	687b      	ldr	r3, [r7, #4]
 8000cc8:	3314      	adds	r3, #20
 8000cca:	681b      	ldr	r3, [r3, #0]
 8000ccc:	2b00      	cmp	r3, #0
 8000cce:	d104      	bne.n	8000cda <fkl+0x116>
 8000cd0:	4b09      	ldr	r3, [pc, #36]	; (8000cf8 <fkl+0x134>)
 8000cd2:	2102      	movs	r1, #2
 8000cd4:	0018      	movs	r0, r3
 8000cd6:	f7ff fdaf 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000cda:	687b      	ldr	r3, [r7, #4]
 8000cdc:	3318      	adds	r3, #24
 8000cde:	681b      	ldr	r3, [r3, #0]
 8000ce0:	2b00      	cmp	r3, #0
 8000ce2:	d105      	bne.n	8000cf0 <fkl+0x12c>
 8000ce4:	2390      	movs	r3, #144	; 0x90
 8000ce6:	05db      	lsls	r3, r3, #23
 8000ce8:	2180      	movs	r1, #128	; 0x80
 8000cea:	0018      	movs	r0, r3
 8000cec:	f7ff fda4 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000cf0:	46c0      	nop			; (mov r8, r8)
 8000cf2:	46bd      	mov	sp, r7
 8000cf4:	b002      	add	sp, #8
 8000cf6:	bd80      	pop	{r7, pc}
 8000cf8:	48000800 	.word	0x48000800

08000cfc <printSymb>:
 8000cfc:	b580      	push	{r7, lr}
 8000cfe:	b08a      	sub	sp, #40	; 0x28
 8000d00:	af00      	add	r7, sp, #0
 8000d02:	6078      	str	r0, [r7, #4]
 8000d04:	6039      	str	r1, [r7, #0]
 8000d06:	683b      	ldr	r3, [r7, #0]
 8000d08:	2b04      	cmp	r3, #4
 8000d0a:	d057      	beq.n	8000dbc <printSymb+0xc0>
 8000d0c:	683b      	ldr	r3, [r7, #0]
 8000d0e:	2b04      	cmp	r3, #4
 8000d10:	dc6c      	bgt.n	8000dec <printSymb+0xf0>
 8000d12:	683b      	ldr	r3, [r7, #0]
 8000d14:	2b03      	cmp	r3, #3
 8000d16:	d039      	beq.n	8000d8c <printSymb+0x90>
 8000d18:	683b      	ldr	r3, [r7, #0]
 8000d1a:	2b03      	cmp	r3, #3
 8000d1c:	dc66      	bgt.n	8000dec <printSymb+0xf0>
 8000d1e:	683b      	ldr	r3, [r7, #0]
 8000d20:	2b01      	cmp	r3, #1
 8000d22:	d003      	beq.n	8000d2c <printSymb+0x30>
 8000d24:	683b      	ldr	r3, [r7, #0]
 8000d26:	2b02      	cmp	r3, #2
 8000d28:	d018      	beq.n	8000d5c <printSymb+0x60>
 8000d2a:	e05f      	b.n	8000dec <printSymb+0xf0>
 8000d2c:	2390      	movs	r3, #144	; 0x90
 8000d2e:	05db      	lsls	r3, r3, #23
 8000d30:	2108      	movs	r1, #8
 8000d32:	0018      	movs	r0, r3
 8000d34:	f7ff fd80 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000d38:	4bbb      	ldr	r3, [pc, #748]	; (8001028 <printSymb+0x32c>)
 8000d3a:	2108      	movs	r1, #8
 8000d3c:	0018      	movs	r0, r3
 8000d3e:	f7ff fd6f 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000d42:	2390      	movs	r3, #144	; 0x90
 8000d44:	05db      	lsls	r3, r3, #23
 8000d46:	2104      	movs	r1, #4
 8000d48:	0018      	movs	r0, r3
 8000d4a:	f7ff fd69 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000d4e:	2390      	movs	r3, #144	; 0x90
 8000d50:	05db      	lsls	r3, r3, #23
 8000d52:	2102      	movs	r1, #2
 8000d54:	0018      	movs	r0, r3
 8000d56:	f7ff fd63 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000d5a:	e048      	b.n	8000dee <printSymb+0xf2>
 8000d5c:	2390      	movs	r3, #144	; 0x90
 8000d5e:	05db      	lsls	r3, r3, #23
 8000d60:	2104      	movs	r1, #4
 8000d62:	0018      	movs	r0, r3
 8000d64:	f7ff fd68 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000d68:	4baf      	ldr	r3, [pc, #700]	; (8001028 <printSymb+0x32c>)
 8000d6a:	2108      	movs	r1, #8
 8000d6c:	0018      	movs	r0, r3
 8000d6e:	f7ff fd57 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000d72:	2390      	movs	r3, #144	; 0x90
 8000d74:	05db      	lsls	r3, r3, #23
 8000d76:	2102      	movs	r1, #2
 8000d78:	0018      	movs	r0, r3
 8000d7a:	f7ff fd51 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000d7e:	2390      	movs	r3, #144	; 0x90
 8000d80:	05db      	lsls	r3, r3, #23
 8000d82:	2108      	movs	r1, #8
 8000d84:	0018      	movs	r0, r3
 8000d86:	f7ff fd4b 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000d8a:	e030      	b.n	8000dee <printSymb+0xf2>
 8000d8c:	2390      	movs	r3, #144	; 0x90
 8000d8e:	05db      	lsls	r3, r3, #23
 8000d90:	2102      	movs	r1, #2
 8000d92:	0018      	movs	r0, r3
 8000d94:	f7ff fd50 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000d98:	4ba3      	ldr	r3, [pc, #652]	; (8001028 <printSymb+0x32c>)
 8000d9a:	2108      	movs	r1, #8
 8000d9c:	0018      	movs	r0, r3
 8000d9e:	f7ff fd3f 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000da2:	2390      	movs	r3, #144	; 0x90
 8000da4:	05db      	lsls	r3, r3, #23
 8000da6:	2104      	movs	r1, #4
 8000da8:	0018      	movs	r0, r3
 8000daa:	f7ff fd39 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000dae:	2390      	movs	r3, #144	; 0x90
 8000db0:	05db      	lsls	r3, r3, #23
 8000db2:	2108      	movs	r1, #8
 8000db4:	0018      	movs	r0, r3
 8000db6:	f7ff fd33 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000dba:	e018      	b.n	8000dee <printSymb+0xf2>
 8000dbc:	4b9a      	ldr	r3, [pc, #616]	; (8001028 <printSymb+0x32c>)
 8000dbe:	2108      	movs	r1, #8
 8000dc0:	0018      	movs	r0, r3
 8000dc2:	f7ff fd39 	bl	8000838 <LL_GPIO_ResetOutputPin>
 8000dc6:	2390      	movs	r3, #144	; 0x90
 8000dc8:	05db      	lsls	r3, r3, #23
 8000dca:	2102      	movs	r1, #2
 8000dcc:	0018      	movs	r0, r3
 8000dce:	f7ff fd27 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000dd2:	2390      	movs	r3, #144	; 0x90
 8000dd4:	05db      	lsls	r3, r3, #23
 8000dd6:	2104      	movs	r1, #4
 8000dd8:	0018      	movs	r0, r3
 8000dda:	f7ff fd21 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000dde:	2390      	movs	r3, #144	; 0x90
 8000de0:	05db      	lsls	r3, r3, #23
 8000de2:	2108      	movs	r1, #8
 8000de4:	0018      	movs	r0, r3
 8000de6:	f7ff fd1b 	bl	8000820 <LL_GPIO_SetOutputPin>
 8000dea:	e000      	b.n	8000dee <printSymb+0xf2>
 8000dec:	46c0      	nop			; (mov r8, r8)
 8000dee:	687b      	ldr	r3, [r7, #4]
 8000df0:	2b09      	cmp	r3, #9
 8000df2:	d900      	bls.n	8000df6 <printSymb+0xfa>
 8000df4:	e113      	b.n	800101e <printSymb+0x322>
 8000df6:	687b      	ldr	r3, [r7, #4]
 8000df8:	009a      	lsls	r2, r3, #2
 8000dfa:	4b8c      	ldr	r3, [pc, #560]	; (800102c <printSymb+0x330>)
 8000dfc:	18d3      	adds	r3, r2, r3
 8000dfe:	681b      	ldr	r3, [r3, #0]
 8000e00:	469f      	mov	pc, r3
 8000e02:	210c      	movs	r1, #12
 8000e04:	187b      	adds	r3, r7, r1
 8000e06:	2201      	movs	r2, #1
 8000e08:	601a      	str	r2, [r3, #0]
 8000e0a:	187b      	adds	r3, r7, r1
 8000e0c:	2201      	movs	r2, #1
 8000e0e:	605a      	str	r2, [r3, #4]
 8000e10:	187b      	adds	r3, r7, r1
 8000e12:	2201      	movs	r2, #1
 8000e14:	609a      	str	r2, [r3, #8]
 8000e16:	187b      	adds	r3, r7, r1
 8000e18:	2201      	movs	r2, #1
 8000e1a:	60da      	str	r2, [r3, #12]
 8000e1c:	187b      	adds	r3, r7, r1
 8000e1e:	2201      	movs	r2, #1
 8000e20:	611a      	str	r2, [r3, #16]
 8000e22:	187b      	adds	r3, r7, r1
 8000e24:	2201      	movs	r2, #1
 8000e26:	615a      	str	r2, [r3, #20]
 8000e28:	187b      	adds	r3, r7, r1
 8000e2a:	2200      	movs	r2, #0
 8000e2c:	619a      	str	r2, [r3, #24]
 8000e2e:	187b      	adds	r3, r7, r1
 8000e30:	0018      	movs	r0, r3
 8000e32:	f7ff fec7 	bl	8000bc4 <fkl>
 8000e36:	e0f3      	b.n	8001020 <printSymb+0x324>
 8000e38:	210c      	movs	r1, #12
 8000e3a:	187b      	adds	r3, r7, r1
 8000e3c:	2200      	movs	r2, #0
 8000e3e:	601a      	str	r2, [r3, #0]
 8000e40:	187b      	adds	r3, r7, r1
 8000e42:	2201      	movs	r2, #1
 8000e44:	605a      	str	r2, [r3, #4]
 8000e46:	187b      	adds	r3, r7, r1
 8000e48:	2201      	movs	r2, #1
 8000e4a:	609a      	str	r2, [r3, #8]
 8000e4c:	187b      	adds	r3, r7, r1
 8000e4e:	2200      	movs	r2, #0
 8000e50:	60da      	str	r2, [r3, #12]
 8000e52:	187b      	adds	r3, r7, r1
 8000e54:	2200      	movs	r2, #0
 8000e56:	611a      	str	r2, [r3, #16]
 8000e58:	187b      	adds	r3, r7, r1
 8000e5a:	2200      	movs	r2, #0
 8000e5c:	615a      	str	r2, [r3, #20]
 8000e5e:	187b      	adds	r3, r7, r1
 8000e60:	2200      	movs	r2, #0
 8000e62:	619a      	str	r2, [r3, #24]
 8000e64:	187b      	adds	r3, r7, r1
 8000e66:	0018      	movs	r0, r3
 8000e68:	f7ff feac 	bl	8000bc4 <fkl>
 8000e6c:	e0d8      	b.n	8001020 <printSymb+0x324>
 8000e6e:	210c      	movs	r1, #12
 8000e70:	187b      	adds	r3, r7, r1
 8000e72:	2201      	movs	r2, #1
 8000e74:	601a      	str	r2, [r3, #0]
 8000e76:	187b      	adds	r3, r7, r1
 8000e78:	2201      	movs	r2, #1
 8000e7a:	605a      	str	r2, [r3, #4]
 8000e7c:	187b      	adds	r3, r7, r1
 8000e7e:	2200      	movs	r2, #0
 8000e80:	609a      	str	r2, [r3, #8]
 8000e82:	187b      	adds	r3, r7, r1
 8000e84:	2201      	movs	r2, #1
 8000e86:	60da      	str	r2, [r3, #12]
 8000e88:	187b      	adds	r3, r7, r1
 8000e8a:	2201      	movs	r2, #1
 8000e8c:	611a      	str	r2, [r3, #16]
 8000e8e:	187b      	adds	r3, r7, r1
 8000e90:	2200      	movs	r2, #0
 8000e92:	615a      	str	r2, [r3, #20]
 8000e94:	187b      	adds	r3, r7, r1
 8000e96:	2201      	movs	r2, #1
 8000e98:	619a      	str	r2, [r3, #24]
 8000e9a:	187b      	adds	r3, r7, r1
 8000e9c:	0018      	movs	r0, r3
 8000e9e:	f7ff fe91 	bl	8000bc4 <fkl>
 8000ea2:	e0bd      	b.n	8001020 <printSymb+0x324>
 8000ea4:	210c      	movs	r1, #12
 8000ea6:	187b      	adds	r3, r7, r1
 8000ea8:	2201      	movs	r2, #1
 8000eaa:	601a      	str	r2, [r3, #0]
 8000eac:	187b      	adds	r3, r7, r1
 8000eae:	2201      	movs	r2, #1
 8000eb0:	605a      	str	r2, [r3, #4]
 8000eb2:	187b      	adds	r3, r7, r1
 8000eb4:	2201      	movs	r2, #1
 8000eb6:	609a      	str	r2, [r3, #8]
 8000eb8:	187b      	adds	r3, r7, r1
 8000eba:	2201      	movs	r2, #1
 8000ebc:	60da      	str	r2, [r3, #12]
 8000ebe:	187b      	adds	r3, r7, r1
 8000ec0:	2200      	movs	r2, #0
 8000ec2:	611a      	str	r2, [r3, #16]
 8000ec4:	187b      	adds	r3, r7, r1
 8000ec6:	2200      	movs	r2, #0
 8000ec8:	615a      	str	r2, [r3, #20]
 8000eca:	187b      	adds	r3, r7, r1
 8000ecc:	2201      	movs	r2, #1
 8000ece:	619a      	str	r2, [r3, #24]
 8000ed0:	187b      	adds	r3, r7, r1
 8000ed2:	0018      	movs	r0, r3
 8000ed4:	f7ff fe76 	bl	8000bc4 <fkl>
 8000ed8:	e0a2      	b.n	8001020 <printSymb+0x324>
 8000eda:	210c      	movs	r1, #12
 8000edc:	187b      	adds	r3, r7, r1
 8000ede:	2200      	movs	r2, #0
 8000ee0:	601a      	str	r2, [r3, #0]
 8000ee2:	187b      	adds	r3, r7, r1
 8000ee4:	2201      	movs	r2, #1
 8000ee6:	605a      	str	r2, [r3, #4]
 8000ee8:	187b      	adds	r3, r7, r1
 8000eea:	2201      	movs	r2, #1
 8000eec:	609a      	str	r2, [r3, #8]
 8000eee:	187b      	adds	r3, r7, r1
 8000ef0:	2200      	movs	r2, #0
 8000ef2:	60da      	str	r2, [r3, #12]
 8000ef4:	187b      	adds	r3, r7, r1
 8000ef6:	2200      	movs	r2, #0
 8000ef8:	611a      	str	r2, [r3, #16]
 8000efa:	187b      	adds	r3, r7, r1
 8000efc:	2201      	movs	r2, #1
 8000efe:	615a      	str	r2, [r3, #20]
 8000f00:	187b      	adds	r3, r7, r1
 8000f02:	2201      	movs	r2, #1
 8000f04:	619a      	str	r2, [r3, #24]
 8000f06:	187b      	adds	r3, r7, r1
 8000f08:	0018      	movs	r0, r3
 8000f0a:	f7ff fe5b 	bl	8000bc4 <fkl>
 8000f0e:	e087      	b.n	8001020 <printSymb+0x324>
 8000f10:	210c      	movs	r1, #12
 8000f12:	187b      	adds	r3, r7, r1
 8000f14:	2201      	movs	r2, #1
 8000f16:	601a      	str	r2, [r3, #0]
 8000f18:	187b      	adds	r3, r7, r1
 8000f1a:	2200      	movs	r2, #0
 8000f1c:	605a      	str	r2, [r3, #4]
 8000f1e:	187b      	adds	r3, r7, r1
 8000f20:	2201      	movs	r2, #1
 8000f22:	609a      	str	r2, [r3, #8]
 8000f24:	187b      	adds	r3, r7, r1
 8000f26:	2201      	movs	r2, #1
 8000f28:	60da      	str	r2, [r3, #12]
 8000f2a:	187b      	adds	r3, r7, r1
 8000f2c:	2200      	movs	r2, #0
 8000f2e:	611a      	str	r2, [r3, #16]
 8000f30:	187b      	adds	r3, r7, r1
 8000f32:	2201      	movs	r2, #1
 8000f34:	615a      	str	r2, [r3, #20]
 8000f36:	187b      	adds	r3, r7, r1
 8000f38:	2201      	movs	r2, #1
 8000f3a:	619a      	str	r2, [r3, #24]
 8000f3c:	187b      	adds	r3, r7, r1
 8000f3e:	0018      	movs	r0, r3
 8000f40:	f7ff fe40 	bl	8000bc4 <fkl>
 8000f44:	e06c      	b.n	8001020 <printSymb+0x324>
 8000f46:	210c      	movs	r1, #12
 8000f48:	187b      	adds	r3, r7, r1
 8000f4a:	2201      	movs	r2, #1
 8000f4c:	601a      	str	r2, [r3, #0]
 8000f4e:	187b      	adds	r3, r7, r1
 8000f50:	2200      	movs	r2, #0
 8000f52:	605a      	str	r2, [r3, #4]
 8000f54:	187b      	adds	r3, r7, r1
 8000f56:	2201      	movs	r2, #1
 8000f58:	609a      	str	r2, [r3, #8]
 8000f5a:	187b      	adds	r3, r7, r1
 8000f5c:	2201      	movs	r2, #1
 8000f5e:	60da      	str	r2, [r3, #12]
 8000f60:	187b      	adds	r3, r7, r1
 8000f62:	2201      	movs	r2, #1
 8000f64:	611a      	str	r2, [r3, #16]
 8000f66:	187b      	adds	r3, r7, r1
 8000f68:	2201      	movs	r2, #1
 8000f6a:	615a      	str	r2, [r3, #20]
 8000f6c:	187b      	adds	r3, r7, r1
 8000f6e:	2201      	movs	r2, #1
 8000f70:	619a      	str	r2, [r3, #24]
 8000f72:	187b      	adds	r3, r7, r1
 8000f74:	0018      	movs	r0, r3
 8000f76:	f7ff fe25 	bl	8000bc4 <fkl>
 8000f7a:	e051      	b.n	8001020 <printSymb+0x324>
 8000f7c:	210c      	movs	r1, #12
 8000f7e:	187b      	adds	r3, r7, r1
 8000f80:	2201      	movs	r2, #1
 8000f82:	601a      	str	r2, [r3, #0]
 8000f84:	187b      	adds	r3, r7, r1
 8000f86:	2201      	movs	r2, #1
 8000f88:	605a      	str	r2, [r3, #4]
 8000f8a:	187b      	adds	r3, r7, r1
 8000f8c:	2201      	movs	r2, #1
 8000f8e:	609a      	str	r2, [r3, #8]
 8000f90:	187b      	adds	r3, r7, r1
 8000f92:	2200      	movs	r2, #0
 8000f94:	60da      	str	r2, [r3, #12]
 8000f96:	187b      	adds	r3, r7, r1
 8000f98:	2200      	movs	r2, #0
 8000f9a:	611a      	str	r2, [r3, #16]
 8000f9c:	187b      	adds	r3, r7, r1
 8000f9e:	2200      	movs	r2, #0
 8000fa0:	615a      	str	r2, [r3, #20]
 8000fa2:	187b      	adds	r3, r7, r1
 8000fa4:	2200      	movs	r2, #0
 8000fa6:	619a      	str	r2, [r3, #24]
 8000fa8:	187b      	adds	r3, r7, r1
 8000faa:	0018      	movs	r0, r3
 8000fac:	f7ff fe0a 	bl	8000bc4 <fkl>
 8000fb0:	e036      	b.n	8001020 <printSymb+0x324>
 8000fb2:	210c      	movs	r1, #12
 8000fb4:	187b      	adds	r3, r7, r1
 8000fb6:	2201      	movs	r2, #1
 8000fb8:	601a      	str	r2, [r3, #0]
 8000fba:	187b      	adds	r3, r7, r1
 8000fbc:	2201      	movs	r2, #1
 8000fbe:	605a      	str	r2, [r3, #4]
 8000fc0:	187b      	adds	r3, r7, r1
 8000fc2:	2201      	movs	r2, #1
 8000fc4:	609a      	str	r2, [r3, #8]
 8000fc6:	187b      	adds	r3, r7, r1
 8000fc8:	2201      	movs	r2, #1
 8000fca:	60da      	str	r2, [r3, #12]
 8000fcc:	187b      	adds	r3, r7, r1
 8000fce:	2201      	movs	r2, #1
 8000fd0:	611a      	str	r2, [r3, #16]
 8000fd2:	187b      	adds	r3, r7, r1
 8000fd4:	2201      	movs	r2, #1
 8000fd6:	615a      	str	r2, [r3, #20]
 8000fd8:	187b      	adds	r3, r7, r1
 8000fda:	2201      	movs	r2, #1
 8000fdc:	619a      	str	r2, [r3, #24]
 8000fde:	187b      	adds	r3, r7, r1
 8000fe0:	0018      	movs	r0, r3
 8000fe2:	f7ff fdef 	bl	8000bc4 <fkl>
 8000fe6:	e01b      	b.n	8001020 <printSymb+0x324>
 8000fe8:	210c      	movs	r1, #12
 8000fea:	187b      	adds	r3, r7, r1
 8000fec:	2201      	movs	r2, #1
 8000fee:	601a      	str	r2, [r3, #0]
 8000ff0:	187b      	adds	r3, r7, r1
 8000ff2:	2201      	movs	r2, #1
 8000ff4:	605a      	str	r2, [r3, #4]
 8000ff6:	187b      	adds	r3, r7, r1
 8000ff8:	2201      	movs	r2, #1
 8000ffa:	609a      	str	r2, [r3, #8]
 8000ffc:	187b      	adds	r3, r7, r1
 8000ffe:	2201      	movs	r2, #1
 8001000:	60da      	str	r2, [r3, #12]
 8001002:	187b      	adds	r3, r7, r1
 8001004:	2200      	movs	r2, #0
 8001006:	611a      	str	r2, [r3, #16]
 8001008:	187b      	adds	r3, r7, r1
 800100a:	2201      	movs	r2, #1
 800100c:	615a      	str	r2, [r3, #20]
 800100e:	187b      	adds	r3, r7, r1
 8001010:	2201      	movs	r2, #1
 8001012:	619a      	str	r2, [r3, #24]
 8001014:	187b      	adds	r3, r7, r1
 8001016:	0018      	movs	r0, r3
 8001018:	f7ff fdd4 	bl	8000bc4 <fkl>
 800101c:	e000      	b.n	8001020 <printSymb+0x324>
 800101e:	46c0      	nop			; (mov r8, r8)
 8001020:	46c0      	nop			; (mov r8, r8)
 8001022:	46bd      	mov	sp, r7
 8001024:	b00a      	add	sp, #40	; 0x28
 8001026:	bd80      	pop	{r7, pc}
 8001028:	48000800 	.word	0x48000800
 800102c:	080011c8 	.word	0x080011c8

08001030 <izthif>:
 8001030:	b580      	push	{r7, lr}
 8001032:	b082      	sub	sp, #8
 8001034:	af00      	add	r7, sp, #0
 8001036:	6078      	str	r0, [r7, #4]
 8001038:	687b      	ldr	r3, [r7, #4]
 800103a:	22fa      	movs	r2, #250	; 0xfa
 800103c:	0091      	lsls	r1, r2, #2
 800103e:	0018      	movs	r0, r3
 8001040:	f7ff f88a 	bl	8000158 <__divsi3>
 8001044:	0003      	movs	r3, r0
 8001046:	2104      	movs	r1, #4
 8001048:	0018      	movs	r0, r3
 800104a:	f7ff fe57 	bl	8000cfc <printSymb>
 800104e:	687b      	ldr	r3, [r7, #4]
 8001050:	22fa      	movs	r2, #250	; 0xfa
 8001052:	0091      	lsls	r1, r2, #2
 8001054:	0018      	movs	r0, r3
 8001056:	f7ff f965 	bl	8000324 <__aeabi_idivmod>
 800105a:	000b      	movs	r3, r1
 800105c:	607b      	str	r3, [r7, #4]
 800105e:	f7ff fda7 	bl	8000bb0 <delay>
 8001062:	687b      	ldr	r3, [r7, #4]
 8001064:	2164      	movs	r1, #100	; 0x64
 8001066:	0018      	movs	r0, r3
 8001068:	f7ff f876 	bl	8000158 <__divsi3>
 800106c:	0003      	movs	r3, r0
 800106e:	2103      	movs	r1, #3
 8001070:	0018      	movs	r0, r3
 8001072:	f7ff fe43 	bl	8000cfc <printSymb>
 8001076:	687b      	ldr	r3, [r7, #4]
 8001078:	2164      	movs	r1, #100	; 0x64
 800107a:	0018      	movs	r0, r3
 800107c:	f7ff f952 	bl	8000324 <__aeabi_idivmod>
 8001080:	000b      	movs	r3, r1
 8001082:	607b      	str	r3, [r7, #4]
 8001084:	f7ff fd94 	bl	8000bb0 <delay>
 8001088:	687b      	ldr	r3, [r7, #4]
 800108a:	210a      	movs	r1, #10
 800108c:	0018      	movs	r0, r3
 800108e:	f7ff f863 	bl	8000158 <__divsi3>
 8001092:	0003      	movs	r3, r0
 8001094:	2102      	movs	r1, #2
 8001096:	0018      	movs	r0, r3
 8001098:	f7ff fe30 	bl	8000cfc <printSymb>
 800109c:	687b      	ldr	r3, [r7, #4]
 800109e:	210a      	movs	r1, #10
 80010a0:	0018      	movs	r0, r3
 80010a2:	f7ff f93f 	bl	8000324 <__aeabi_idivmod>
 80010a6:	000b      	movs	r3, r1
 80010a8:	607b      	str	r3, [r7, #4]
 80010aa:	f7ff fd81 	bl	8000bb0 <delay>
 80010ae:	687b      	ldr	r3, [r7, #4]
 80010b0:	2101      	movs	r1, #1
 80010b2:	0018      	movs	r0, r3
 80010b4:	f7ff fe22 	bl	8000cfc <printSymb>
 80010b8:	f7ff fd7a 	bl	8000bb0 <delay>
 80010bc:	46c0      	nop			; (mov r8, r8)
 80010be:	46bd      	mov	sp, r7
 80010c0:	b002      	add	sp, #8
 80010c2:	bd80      	pop	{r7, pc}

080010c4 <main>:
 80010c4:	b580      	push	{r7, lr}
 80010c6:	af00      	add	r7, sp, #0
 80010c8:	f7ff fc42 	bl	8000950 <rcc_config>
 80010cc:	f7ff fc74 	bl	80009b8 <gpio_config>
 80010d0:	f7ff fcf8 	bl	8000ac4 <exti_config>
 80010d4:	f7ff fd10 	bl	8000af8 <timers_config>
 80010d8:	4b02      	ldr	r3, [pc, #8]	; (80010e4 <main+0x20>)
 80010da:	681b      	ldr	r3, [r3, #0]
 80010dc:	0018      	movs	r0, r3
 80010de:	f7ff ffa7 	bl	8001030 <izthif>
 80010e2:	e7f9      	b.n	80010d8 <main+0x14>
 80010e4:	20000430 	.word	0x20000430

080010e8 <SystemInit>:
 80010e8:	b580      	push	{r7, lr}
 80010ea:	af00      	add	r7, sp, #0
 80010ec:	4b1a      	ldr	r3, [pc, #104]	; (8001158 <SystemInit+0x70>)
 80010ee:	681a      	ldr	r2, [r3, #0]
 80010f0:	4b19      	ldr	r3, [pc, #100]	; (8001158 <SystemInit+0x70>)
 80010f2:	2101      	movs	r1, #1
 80010f4:	430a      	orrs	r2, r1
 80010f6:	601a      	str	r2, [r3, #0]
 80010f8:	4b17      	ldr	r3, [pc, #92]	; (8001158 <SystemInit+0x70>)
 80010fa:	685a      	ldr	r2, [r3, #4]
 80010fc:	4b16      	ldr	r3, [pc, #88]	; (8001158 <SystemInit+0x70>)
 80010fe:	4917      	ldr	r1, [pc, #92]	; (800115c <SystemInit+0x74>)
 8001100:	400a      	ands	r2, r1
 8001102:	605a      	str	r2, [r3, #4]
 8001104:	4b14      	ldr	r3, [pc, #80]	; (8001158 <SystemInit+0x70>)
 8001106:	681a      	ldr	r2, [r3, #0]
 8001108:	4b13      	ldr	r3, [pc, #76]	; (8001158 <SystemInit+0x70>)
 800110a:	4915      	ldr	r1, [pc, #84]	; (8001160 <SystemInit+0x78>)
 800110c:	400a      	ands	r2, r1
 800110e:	601a      	str	r2, [r3, #0]
 8001110:	4b11      	ldr	r3, [pc, #68]	; (8001158 <SystemInit+0x70>)
 8001112:	681a      	ldr	r2, [r3, #0]
 8001114:	4b10      	ldr	r3, [pc, #64]	; (8001158 <SystemInit+0x70>)
 8001116:	4913      	ldr	r1, [pc, #76]	; (8001164 <SystemInit+0x7c>)
 8001118:	400a      	ands	r2, r1
 800111a:	601a      	str	r2, [r3, #0]
 800111c:	4b0e      	ldr	r3, [pc, #56]	; (8001158 <SystemInit+0x70>)
 800111e:	685a      	ldr	r2, [r3, #4]
 8001120:	4b0d      	ldr	r3, [pc, #52]	; (8001158 <SystemInit+0x70>)
 8001122:	4911      	ldr	r1, [pc, #68]	; (8001168 <SystemInit+0x80>)
 8001124:	400a      	ands	r2, r1
 8001126:	605a      	str	r2, [r3, #4]
 8001128:	4b0b      	ldr	r3, [pc, #44]	; (8001158 <SystemInit+0x70>)
 800112a:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800112c:	4b0a      	ldr	r3, [pc, #40]	; (8001158 <SystemInit+0x70>)
 800112e:	210f      	movs	r1, #15
 8001130:	438a      	bics	r2, r1
 8001132:	62da      	str	r2, [r3, #44]	; 0x2c
 8001134:	4b08      	ldr	r3, [pc, #32]	; (8001158 <SystemInit+0x70>)
 8001136:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001138:	4b07      	ldr	r3, [pc, #28]	; (8001158 <SystemInit+0x70>)
 800113a:	490c      	ldr	r1, [pc, #48]	; (800116c <SystemInit+0x84>)
 800113c:	400a      	ands	r2, r1
 800113e:	631a      	str	r2, [r3, #48]	; 0x30
 8001140:	4b05      	ldr	r3, [pc, #20]	; (8001158 <SystemInit+0x70>)
 8001142:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8001144:	4b04      	ldr	r3, [pc, #16]	; (8001158 <SystemInit+0x70>)
 8001146:	2101      	movs	r1, #1
 8001148:	438a      	bics	r2, r1
 800114a:	635a      	str	r2, [r3, #52]	; 0x34
 800114c:	4b02      	ldr	r3, [pc, #8]	; (8001158 <SystemInit+0x70>)
 800114e:	2200      	movs	r2, #0
 8001150:	609a      	str	r2, [r3, #8]
 8001152:	46c0      	nop			; (mov r8, r8)
 8001154:	46bd      	mov	sp, r7
 8001156:	bd80      	pop	{r7, pc}
 8001158:	40021000 	.word	0x40021000
 800115c:	f8ffb80c 	.word	0xf8ffb80c
 8001160:	fef6ffff 	.word	0xfef6ffff
 8001164:	fffbffff 	.word	0xfffbffff
 8001168:	ffc0ffff 	.word	0xffc0ffff
 800116c:	fffffeac 	.word	0xfffffeac

08001170 <NMI_Handler>:
 8001170:	b580      	push	{r7, lr}
 8001172:	af00      	add	r7, sp, #0
 8001174:	46c0      	nop			; (mov r8, r8)
 8001176:	46bd      	mov	sp, r7
 8001178:	bd80      	pop	{r7, pc}

0800117a <HardFault_Handler>:
 800117a:	b580      	push	{r7, lr}
 800117c:	af00      	add	r7, sp, #0
 800117e:	e7fe      	b.n	800117e <HardFault_Handler+0x4>

08001180 <SVC_Handler>:
 8001180:	b580      	push	{r7, lr}
 8001182:	af00      	add	r7, sp, #0
 8001184:	46c0      	nop			; (mov r8, r8)
 8001186:	46bd      	mov	sp, r7
 8001188:	bd80      	pop	{r7, pc}

0800118a <PendSV_Handler>:
 800118a:	b580      	push	{r7, lr}
 800118c:	af00      	add	r7, sp, #0
 800118e:	46c0      	nop			; (mov r8, r8)
 8001190:	46bd      	mov	sp, r7
 8001192:	bd80      	pop	{r7, pc}

08001194 <register_fini>:
 8001194:	4b03      	ldr	r3, [pc, #12]	; (80011a4 <register_fini+0x10>)
 8001196:	b510      	push	{r4, lr}
 8001198:	2b00      	cmp	r3, #0
 800119a:	d002      	beq.n	80011a2 <register_fini+0xe>
 800119c:	4802      	ldr	r0, [pc, #8]	; (80011a8 <register_fini+0x14>)
 800119e:	f7ff f8c7 	bl	8000330 <atexit>
 80011a2:	bd10      	pop	{r4, pc}
 80011a4:	00000000 	.word	0x00000000
 80011a8:	08000341 	.word	0x08000341

080011ac <_init>:
 80011ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80011ae:	46c0      	nop			; (mov r8, r8)
 80011b0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80011b2:	bc08      	pop	{r3}
 80011b4:	469e      	mov	lr, r3
 80011b6:	4770      	bx	lr

080011b8 <_fini>:
 80011b8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80011ba:	46c0      	nop			; (mov r8, r8)
 80011bc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80011be:	bc08      	pop	{r3}
 80011c0:	469e      	mov	lr, r3
 80011c2:	4770      	bx	lr
