.globl _start
_start:

#define r_type_insn(_f7, _rs2, _rs1, _f3, _rd, _opc) \
.word (((_f7) << 25) | ((_rs2) << 20) | ((_rs1) << 15) | ((_f3) << 12) | ((_rd) << 7) | ((_opc) << 0))

#define MUL_ACC(_rd, _rs1, _rs2 ) \
r_type_insn(0b0000011, _rs2, _rs1, 0b000, _rd, 0b0110011)

//Test 1
//Zero check with zero reg (x0)
    li x28, 1
    li x1, 0
    MUL_ACC(1, 0, 0)
    bne x1, x0, fail

//Test 2
//Zero check with regular regs
    li x28, 2
    li x1, 0x00000000
    li x2, 0x00000000
    MUL_ACC(1, 1, 2)
    bne x1, x0, fail

//Test 3
//Multiply by zero
    li x28, 3
    li x1, 0x01020304
    li x2, 0x00000000
	li x3, 0x00000000
    MUL_ACC(3, 1, 2)
    bne x3, x0, fail

//Test 4
//Basic multiply
    li x28, 4
    li x4, 110 //Expected Result
    li x1, 10 
    li x2, 10
	li x3, 10
    MUL_ACC(3, 1, 2)
    bne x3, x4, fail

//Test 5
//Basic multiply
    li x28, 5
    li x4, 2650 // Expected result
    li x1, 56
    li x2, 47
	li x3, 18
    MUL_ACC(3, 1, 2)
    bne x3, x4, fail

//Test 6
//Large multiply
    li x28, 6
    li x5, 200000001 // Expected result
    li x1, 10000
    li x2, 20000
    li x3, 1
    MUL_ACC(3, 1, 2)
    bne x3, x5, fail

//Test 7
//Using same reg for all inputs
	li x28, 7
	li x1, 1
	li x2, 2	//Expected
	MUL_ACC(1, 1, 1)
	bne x1, x2, fail
	
//Test 8
//Back to back (B2B) MulAcc's
	li x28, 8
	li x1, 1
	li x2, 6	//Expected
	MUL_ACC(1, 1, 1)
	MUL_ACC(1, 1, 1)
	bne x1, x2, fail
	
//Test 9
//Signed multiplication
	li x28, 9
	li x5, -30	//Expected 
	li x1, -6
	li x2, 6
	li x3, 6
	MUL_ACC(3, 1, 2)
	bne x3, x5, fail
	
//Test 10
//Signed multiplication
	li x28, 10
	li x5, 2188 //Expected
	li x1, -26
	li x2, -84
	li x3, 4
	MUL_ACC(3, 1, 2)
	bne x3, x5, fail
	
//Test 11
//Signed Addition
	li x28, 11
	li x5, 500 //Expected
	li x1, 50
	li x2, 11
	li x3, -50
	MUL_ACC(3, 1, 2)
	bne x3, x5, fail
	
//Test 12
// More complex B2B MULACC
	li x28, 12
	li x1, 2
	li x2, 2
	li x3, 2 // (2*2)+2 = 6
	li x4, 2 
	li x5, 2
	li x7, 10 // Expected ((2*2)+2)+(2*2)) = 10
	MUL_ACC(3, 1, 2)
	MUL_ACC(3, 4, 5)
	bne x3, x7, fail
	
//Test 13
// More complex B2B MULACC
	li x28, 13
	li x1, 2
	li x2, 2
	li x3, 2 // (2*2)+2 = 6
	li x4, 2 
	li x5, 2
	li x7, 14 // Expected 
	MUL_ACC(3, 1, 2)
	MUL_ACC(3, 4, 5)
	MUL_ACC(3, 1, 2)
	bne x3, x7, fail
	
//Test 14
// B2B MULACC using output as input
	li x28, 13
	li x1, 2
	li x2, 2
	li x3, 2 // (2*2)+2 = 6
	li x4, 2 
	li x5, 2
	li x7, 22 // Expected 
	MUL_ACC(3, 1, 2) // x3 = 6
	MUL_ACC(3, 4, 5) // x3 = 10
	MUL_ACC(1, 3, 2) // x1 = (10*2)+2
	bne x1, x7, fail


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
