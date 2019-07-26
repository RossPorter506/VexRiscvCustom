
build/mul_acc.elf:     file format elf32-littleriscv


Disassembly of section .crt_section:

00000000 <_start>:
   0:	00100e13          	li	t3,1
   4:	00000093          	li	ra,0
   8:	060000b3          	0x60000b3
   c:	1a009063          	bnez	ra,1ac <fail>
  10:	00200e13          	li	t3,2
  14:	00000093          	li	ra,0
  18:	00000113          	li	sp,0
  1c:	062080b3          	0x62080b3
  20:	18009663          	bnez	ra,1ac <fail>
  24:	00300e13          	li	t3,3
  28:	010200b7          	lui	ra,0x1020
  2c:	30408093          	addi	ra,ra,772 # 1020304 <pass+0x102014c>
  30:	00000113          	li	sp,0
  34:	00000193          	li	gp,0
  38:	062081b3          	0x62081b3
  3c:	16019863          	bnez	gp,1ac <fail>
  40:	00400e13          	li	t3,4
  44:	06e00213          	li	tp,110
  48:	00a00093          	li	ra,10
  4c:	00a00113          	li	sp,10
  50:	00a00193          	li	gp,10
  54:	062081b3          	0x62081b3
  58:	14419a63          	bne	gp,tp,1ac <fail>
  5c:	00500e13          	li	t3,5
  60:	00001237          	lui	tp,0x1
  64:	a5a20213          	addi	tp,tp,-1446 # a5a <pass+0x8a2>
  68:	03800093          	li	ra,56
  6c:	02f00113          	li	sp,47
  70:	01200193          	li	gp,18
  74:	062081b3          	0x62081b3
  78:	12419a63          	bne	gp,tp,1ac <fail>
  7c:	00600e13          	li	t3,6
  80:	0bebc2b7          	lui	t0,0xbebc
  84:	20128293          	addi	t0,t0,513 # bebc201 <pass+0xbebc049>
  88:	000020b7          	lui	ra,0x2
  8c:	71008093          	addi	ra,ra,1808 # 2710 <pass+0x2558>
  90:	00005137          	lui	sp,0x5
  94:	e2010113          	addi	sp,sp,-480 # 4e20 <pass+0x4c68>
  98:	00100193          	li	gp,1
  9c:	062081b3          	0x62081b3
  a0:	10519663          	bne	gp,t0,1ac <fail>
  a4:	00700e13          	li	t3,7
  a8:	00100093          	li	ra,1
  ac:	00200113          	li	sp,2
  b0:	061080b3          	0x61080b3
  b4:	0e209c63          	bne	ra,sp,1ac <fail>
  b8:	00800e13          	li	t3,8
  bc:	00100093          	li	ra,1
  c0:	00600113          	li	sp,6
  c4:	061080b3          	0x61080b3
  c8:	061080b3          	0x61080b3
  cc:	0e209063          	bne	ra,sp,1ac <fail>
  d0:	00900e13          	li	t3,9
  d4:	fe200293          	li	t0,-30
  d8:	ffa00093          	li	ra,-6
  dc:	00600113          	li	sp,6
  e0:	00600193          	li	gp,6
  e4:	062081b3          	0x62081b3
  e8:	0c519263          	bne	gp,t0,1ac <fail>
  ec:	00a00e13          	li	t3,10
  f0:	000012b7          	lui	t0,0x1
  f4:	88c28293          	addi	t0,t0,-1908 # 88c <pass+0x6d4>
  f8:	fe600093          	li	ra,-26
  fc:	fac00113          	li	sp,-84
 100:	00400193          	li	gp,4
 104:	062081b3          	0x62081b3
 108:	0a519263          	bne	gp,t0,1ac <fail>
 10c:	00b00e13          	li	t3,11
 110:	1f400293          	li	t0,500
 114:	03200093          	li	ra,50
 118:	00b00113          	li	sp,11
 11c:	fce00193          	li	gp,-50
 120:	062081b3          	0x62081b3
 124:	08519463          	bne	gp,t0,1ac <fail>
 128:	00c00e13          	li	t3,12
 12c:	00200093          	li	ra,2
 130:	00200113          	li	sp,2
 134:	00200193          	li	gp,2
 138:	00200213          	li	tp,2
 13c:	00200293          	li	t0,2
 140:	00a00393          	li	t2,10
 144:	062081b3          	0x62081b3
 148:	065201b3          	0x65201b3
 14c:	06719063          	bne	gp,t2,1ac <fail>
 150:	00d00e13          	li	t3,13
 154:	00200093          	li	ra,2
 158:	00200113          	li	sp,2
 15c:	00200193          	li	gp,2
 160:	00200213          	li	tp,2
 164:	00200293          	li	t0,2
 168:	00e00393          	li	t2,14
 16c:	062081b3          	0x62081b3
 170:	065201b3          	0x65201b3
 174:	062081b3          	0x62081b3
 178:	02719a63          	bne	gp,t2,1ac <fail>
 17c:	00d00e13          	li	t3,13
 180:	00200093          	li	ra,2
 184:	00200113          	li	sp,2
 188:	00200193          	li	gp,2
 18c:	00200213          	li	tp,2
 190:	00200293          	li	t0,2
 194:	01600393          	li	t2,22
 198:	062081b3          	0x62081b3
 19c:	065201b3          	0x65201b3
 1a0:	062180b3          	0x62180b3
 1a4:	00709463          	bne	ra,t2,1ac <fail>
 1a8:	0100006f          	j	1b8 <pass>

000001ac <fail>:
 1ac:	f0100137          	lui	sp,0xf0100
 1b0:	f2410113          	addi	sp,sp,-220 # f00fff24 <pass+0xf00ffd6c>
 1b4:	01c12023          	sw	t3,0(sp)

000001b8 <pass>:
 1b8:	f0100137          	lui	sp,0xf0100
 1bc:	f2010113          	addi	sp,sp,-224 # f00fff20 <pass+0xf00ffd68>
 1c0:	00012023          	sw	zero,0(sp)
 1c4:	00000013          	nop
 1c8:	00000013          	nop
 1cc:	00000013          	nop
 1d0:	00000013          	nop
 1d4:	00000013          	nop
 1d8:	00000013          	nop
