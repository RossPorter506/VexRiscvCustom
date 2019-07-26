.globl _start
_start:

#define r_type_insn(_f7, _rs2, _rs1, _f3, _rd, _opc) \
.word (((_f7) << 25) | ((_rs2) << 20) | ((_rs1) << 15) | ((_f3) << 12) | ((_rd) << 7) | ((_opc) << 0))

#define SREG_LOAD(_dest, _rs1) \
r_type_insn(0b0000000, (_dest << 3), _rs1, 0b111, 0b00000, 0b0101011)

#define SREG_STORE(_rd, _src) \
r_type_insn(0b0000000, (_src << 3), 0b00000, 0b110, _rd, 0b0101011)

#define col0 0
#define col1 1
#define col2 2

// Test 1
// Sotre initial value in special regs into a general purpose register
    li x28, 1
    li x1, 0xFFFFFF00 // default value in register is 255 = 0xFF
    SREG_STORE(2, 0)

    bne x1, x2, fail
    
    j pass

fail: //x28 => error code
    li x2, 0xF00FFF24
    sw x28, 0(x2)

pass:
    li x2, 0xF00FFF20
    sw x0, 0(x2)



    nop
    nop
    nop
    nop
    nop
    nop
