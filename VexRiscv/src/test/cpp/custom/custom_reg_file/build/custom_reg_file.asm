
build/custom_reg_file.elf:     file format elf32-littleriscv


Disassembly of section .crt_section:

00000000 <_start>:
   0:	00100e13          	li	t3,1
   4:	f0000093          	li	ra,-256
   8:	0000612b          	0x612b
   c:	00209463          	bne	ra,sp,14 <fail>
  10:	0100006f          	j	20 <pass>

00000014 <fail>:
  14:	f0100137          	lui	sp,0xf0100
  18:	f2410113          	addi	sp,sp,-220 # f00fff24 <pass+0xf00fff04>
  1c:	01c12023          	sw	t3,0(sp)

00000020 <pass>:
  20:	f0100137          	lui	sp,0xf0100
  24:	f2010113          	addi	sp,sp,-224 # f00fff20 <pass+0xf00fff00>
  28:	00012023          	sw	zero,0(sp)
  2c:	00000013          	nop
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
