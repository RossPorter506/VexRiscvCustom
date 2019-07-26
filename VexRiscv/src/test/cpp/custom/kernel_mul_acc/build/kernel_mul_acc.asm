
build/kernel_mul_acc.elf:     file format elf32-littleriscv


Disassembly of section .crt_section:

00000000 <_start>:
   0:	00100e13          	li	t3,1
   4:	0000002b          	0x2b
   8:	0000002b          	0x2b
   c:	0000002b          	0x2b
  10:	0000402b          	0x402b
  14:	0000402b          	0x402b
  18:	0000402b          	0x402b
  1c:	000020ab          	0x20ab
  20:	000000ab          	0xab
  24:	000000ab          	0xab
  28:	06009663          	bnez	ra,94 <fail>
  2c:	00200e13          	li	t3,2
  30:	00100093          	li	ra,1
  34:	0000002b          	0x2b
  38:	0000002b          	0x2b
  3c:	0000002b          	0x2b
  40:	0010402b          	0x10402b
  44:	0010402b          	0x10402b
  48:	0010402b          	0x10402b
  4c:	000020ab          	0x20ab
  50:	000000ab          	0xab
  54:	000000ab          	0xab
  58:	02009e63          	bnez	ra,94 <fail>
  5c:	00300e13          	li	t3,3
  60:	00100093          	li	ra,1
  64:	00900113          	li	sp,9
  68:	0010002b          	0x10002b
  6c:	0010002b          	0x10002b
  70:	0010002b          	0x10002b
  74:	0010402b          	0x10402b
  78:	0010402b          	0x10402b
  7c:	0010402b          	0x10402b
  80:	000020ab          	0x20ab
  84:	000000ab          	0xab
  88:	000000ab          	0xab
  8c:	00209463          	bne	ra,sp,94 <fail>
  90:	0100006f          	j	a0 <pass>

00000094 <fail>:
  94:	f0100137          	lui	sp,0xf0100
  98:	f2410113          	addi	sp,sp,-220 # f00fff24 <pass+0xf00ffe84>
  9c:	01c12023          	sw	t3,0(sp)

000000a0 <pass>:
  a0:	f0100137          	lui	sp,0xf0100
  a4:	f2010113          	addi	sp,sp,-224 # f00fff20 <pass+0xf00ffe80>
  a8:	00012023          	sw	zero,0(sp)
  ac:	00000013          	nop
  b0:	00000013          	nop
  b4:	00000013          	nop
  b8:	00000013          	nop
  bc:	00000013          	nop
  c0:	00000013          	nop
