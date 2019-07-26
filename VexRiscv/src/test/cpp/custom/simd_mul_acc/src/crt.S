.globl _start
_start:

#define r_type_insn(_f7, _rs2, _rs1, _f3, _rd, _opc) \
.word (((_f7) << 25) | ((_rs2) << 20) | ((_rs1) << 15) | ((_f3) << 12) | ((_rd) << 7) | ((_opc) << 0))

#define SIMD_MUL_ACC(_rd, _rs1, _rs2 ) \
r_type_insn(0b0000000, _rs2, _rs1, 0b000, _rd, 0b0101011)

//Test 1
//Zero check with zero reg (x0)
    li x28, 1
    SIMD_MUL_ACC(1, 0, 0)
    bne x1, x0, fail

//Test 2
//Zero check with regular regs
    li x28, 2
    li x1, 0x00000000
    li x2, 0x00000000
    SIMD_MUL_ACC(1, 1, 2)
    bne x1, x0, fail

//Test 3
//Multiply by zero
    li x28, 3
    li x1, 0x01020304
    li x2, 0x00000000
    
	//x3 output
	
    SIMD_MUL_ACC(3, 1, 2)
    bne x3, x0, fail

//Test 4
//Basic multiply
    li x28, 4
    li x1, 16 // Expected Result
    
    li x2, 0x02020202
    li x3, 0x02020202
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail

//Test 5
//Basic multiply
    li x28, 5
    li x1, 4 // Expected Result
    
    li x2, 0x01010101
    li x3, 0x01010101
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail


//Test 6
//
    li x28, 6
    li x1, 36 // Expected Result
    
    li x2, 0x03030303
    li x3, 0x03030303
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail

//Test 7
//
	li x28, 7
    li x1, 60 // Expected Result
    
    li x2, 0x01010101
    li x3, 0x0F0F0F0F
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail
	
//Test 8
//
	li x28, 8
    li x1, 20 // Expected Result
    
    li x2, 0x01020304
    li x3, 0x04030201
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail
    
//Test 9
//
	li x28, 9
    li x1, 0 // Expected Result
    
    li x2, 0xFFFF0101
    li x3, 0x04040404
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail
	
//Test 9
//
	li x28, 9
    li x1, 0 // Expected Result
    
    li x2, 0xFFFF0101
    li x3, 0x32323232
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail
    
//Test 10
//Overflow
	li x28, 10
    li x1, -56 // Expected Result
    
    li x2, 0x01010101
    li x3, 0x32323232
    
    // x4 output
	
    SIMD_MUL_ACC(4, 2, 3)
    bne x1, x4, fail
		
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
