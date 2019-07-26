
build/in_place_add.elf:     file format elf32-littleriscv


Disassembly of section .crt_section:

00000000 <_start>:
   0:	00100e13          	li	t3,1
   4:	00000093          	li	ra,0
   8:	000010ab          	0x10ab
   c:	06009463          	bnez	ra,74 <fail>
  10:	00200e13          	li	t3,2
  14:	00000093          	li	ra,0
  18:	00000113          	li	sp,0
  1c:	002090ab          	0x2090ab
  20:	04009a63          	bnez	ra,74 <fail>
  24:	00300e13          	li	t3,3
  28:	00a00213          	li	tp,10
  2c:	00a00093          	li	ra,10
  30:	000010ab          	0x10ab
  34:	04409063          	bne	ra,tp,74 <fail>
  38:	00400e13          	li	t3,4
  3c:	01e00213          	li	tp,30
  40:	00000093          	li	ra,0
  44:	00a00113          	li	sp,10
  48:	01400193          	li	gp,20
  4c:	003110ab          	0x3110ab
  50:	02409263          	bne	ra,tp,74 <fail>
  54:	00500e13          	li	t3,5
  58:	07900213          	li	tp,121
  5c:	03800093          	li	ra,56
  60:	02f00113          	li	sp,47
  64:	01200193          	li	gp,18
  68:	003110ab          	0x3110ab
  6c:	00409463          	bne	ra,tp,74 <fail>
  70:	0100006f          	j	80 <pass>

00000074 <fail>:
  74:	f0100137          	lui	sp,0xf0100
  78:	f2410113          	addi	sp,sp,-220 # f00fff24 <pass+0xf00ffea4>
  7c:	01c12023          	sw	t3,0(sp)

00000080 <pass>:
  80:	f0100137          	lui	sp,0xf0100
  84:	f2010113          	addi	sp,sp,-224 # f00fff20 <pass+0xf00ffea0>
  88:	00012023          	sw	zero,0(sp)
  8c:	00000013          	nop
  90:	00000013          	nop
  94:	00000013          	nop
  98:	00000013          	nop
  9c:	00000013          	nop
  a0:	00000013          	nop
