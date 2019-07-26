
build/simd_mul_acc.elf:     file format elf32-littleriscv


Disassembly of section .crt_section:

00000000 <_start>:
   0:	00100e13          	li	t3,1
   4:	000000ab          	0xab
   8:	12009a63          	bnez	ra,13c <fail>
   c:	00200e13          	li	t3,2
  10:	00000093          	li	ra,0
  14:	00000113          	li	sp,0
  18:	002080ab          	0x2080ab
  1c:	12009063          	bnez	ra,13c <fail>
  20:	00300e13          	li	t3,3
  24:	010200b7          	lui	ra,0x1020
  28:	30408093          	addi	ra,ra,772 # 1020304 <pass+0x10201bc>
  2c:	00000113          	li	sp,0
  30:	002081ab          	0x2081ab
  34:	10019463          	bnez	gp,13c <fail>
  38:	00400e13          	li	t3,4
  3c:	01000093          	li	ra,16
  40:	02020137          	lui	sp,0x2020
  44:	20210113          	addi	sp,sp,514 # 2020202 <pass+0x20200ba>
  48:	020201b7          	lui	gp,0x2020
  4c:	20218193          	addi	gp,gp,514 # 2020202 <pass+0x20200ba>
  50:	0031022b          	0x31022b
  54:	0e409463          	bne	ra,tp,13c <fail>
  58:	00500e13          	li	t3,5
  5c:	00400093          	li	ra,4
  60:	01010137          	lui	sp,0x1010
  64:	10110113          	addi	sp,sp,257 # 1010101 <pass+0x100ffb9>
  68:	010101b7          	lui	gp,0x1010
  6c:	10118193          	addi	gp,gp,257 # 1010101 <pass+0x100ffb9>
  70:	0031022b          	0x31022b
  74:	0c409463          	bne	ra,tp,13c <fail>
  78:	00600e13          	li	t3,6
  7c:	02400093          	li	ra,36
  80:	03030137          	lui	sp,0x3030
  84:	30310113          	addi	sp,sp,771 # 3030303 <pass+0x30301bb>
  88:	030301b7          	lui	gp,0x3030
  8c:	30318193          	addi	gp,gp,771 # 3030303 <pass+0x30301bb>
  90:	0031022b          	0x31022b
  94:	0a409463          	bne	ra,tp,13c <fail>
  98:	00700e13          	li	t3,7
  9c:	03c00093          	li	ra,60
  a0:	01010137          	lui	sp,0x1010
  a4:	10110113          	addi	sp,sp,257 # 1010101 <pass+0x100ffb9>
  a8:	0f0f11b7          	lui	gp,0xf0f1
  ac:	f0f18193          	addi	gp,gp,-241 # f0f0f0f <pass+0xf0f0dc7>
  b0:	0031022b          	0x31022b
  b4:	08409463          	bne	ra,tp,13c <fail>
  b8:	00800e13          	li	t3,8
  bc:	01400093          	li	ra,20
  c0:	01020137          	lui	sp,0x1020
  c4:	30410113          	addi	sp,sp,772 # 1020304 <pass+0x10201bc>
  c8:	040301b7          	lui	gp,0x4030
  cc:	20118193          	addi	gp,gp,513 # 4030201 <pass+0x40300b9>
  d0:	0031022b          	0x31022b
  d4:	06409463          	bne	ra,tp,13c <fail>
  d8:	00900e13          	li	t3,9
  dc:	00000093          	li	ra,0
  e0:	ffff0137          	lui	sp,0xffff0
  e4:	10110113          	addi	sp,sp,257 # ffff0101 <pass+0xfffeffb9>
  e8:	040401b7          	lui	gp,0x4040
  ec:	40418193          	addi	gp,gp,1028 # 4040404 <pass+0x40402bc>
  f0:	0031022b          	0x31022b
  f4:	04409463          	bne	ra,tp,13c <fail>
  f8:	00900e13          	li	t3,9
  fc:	00000093          	li	ra,0
 100:	ffff0137          	lui	sp,0xffff0
 104:	10110113          	addi	sp,sp,257 # ffff0101 <pass+0xfffeffb9>
 108:	323231b7          	lui	gp,0x32323
 10c:	23218193          	addi	gp,gp,562 # 32323232 <pass+0x323230ea>
 110:	0031022b          	0x31022b
 114:	02409463          	bne	ra,tp,13c <fail>
 118:	00a00e13          	li	t3,10
 11c:	fc800093          	li	ra,-56
 120:	01010137          	lui	sp,0x1010
 124:	10110113          	addi	sp,sp,257 # 1010101 <pass+0x100ffb9>
 128:	323231b7          	lui	gp,0x32323
 12c:	23218193          	addi	gp,gp,562 # 32323232 <pass+0x323230ea>
 130:	0031022b          	0x31022b
 134:	00409463          	bne	ra,tp,13c <fail>
 138:	0100006f          	j	148 <pass>

0000013c <fail>:
 13c:	f0100137          	lui	sp,0xf0100
 140:	f2410113          	addi	sp,sp,-220 # f00fff24 <pass+0xf00ffddc>
 144:	01c12023          	sw	t3,0(sp)

00000148 <pass>:
 148:	f0100137          	lui	sp,0xf0100
 14c:	f2010113          	addi	sp,sp,-224 # f00fff20 <pass+0xf00ffdd8>
 150:	00012023          	sw	zero,0(sp)
 154:	00000013          	nop
 158:	00000013          	nop
 15c:	00000013          	nop
 160:	00000013          	nop
 164:	00000013          	nop
 168:	00000013          	nop
