/* Minimum working example */

package vexriscv.plugin

import spinal.core._
import vexriscv._
import spinal.lib._

class CustomRegFilePlugin extends Plugin[VexRiscv]{
    object IS_SREGLOAD extends Stageable(Bool)
    object IS_SREGSTORE extends Stageable(Bool)
    object REG_READ0 extends Stageable(Bits(8 bits))
    object REG_READ1 extends Stageable(Bits(8 bits))
    object REG_READ2 extends Stageable(Bits(8 bits))

    override def setup(pipeline: VexRiscv): Unit = {
        import pipeline.config._

        val decoderService = pipeline.service(classOf[DecoderService])

        decoderService.addDefault(IS_SREGLOAD, False)
        decoderService.addDefault(IS_SREGSTORE, False)

        decoderService.add(
        	// Special Register Load instruction
        	// I-type, but we only need a small immediate, so use R-type
            key =   M"0000000--000-----111000000101011",      
			//        |F7   ||IMM||RS1||3||RD ||OPCODE|
            List(
                IS_SREGLOAD                     -> True,
                IS_SREGSTORE                    -> False,
                REGFILE_WRITE_VALID             -> False,    //Enable reg file write
                BYPASSABLE_EXECUTE_STAGE        -> True,   //Notify the hazard management unit whether the instruction result is accessible in the EXE stage 
                BYPASSABLE_MEMORY_STAGE         -> True,   //Same as above but for memory stage
                RS1_USE                         -> True,    //Notify hazard management that this instr. uses RS1..
                RS2_USE                         -> False,    //RS2...
                RSD_USE                         -> False     //and RSD values
            )
        )
        decoderService.add(
        	// Special Register Store instruction
        	// I-type but we only need a small immediate, so use R-type
            key =   M"0000000--00000000110-----0101011",      
			//        |F7   ||IMM||RS1||3||RD ||OPCODE|
            List(
                IS_SREGSTORE                    -> True,
                IS_SREGLOAD                     -> False,
                REGFILE_WRITE_VALID             -> True,    //Enable reg file write
                BYPASSABLE_EXECUTE_STAGE        -> False,   //Notify the hazard management unit whether the instruction result is accessible in the EXE stage
                BYPASSABLE_MEMORY_STAGE         -> False,   //Same as above but for memory stage
                RS1_USE                         -> False,    //Notify hazard management that this instr. uses RS1..
                RS2_USE                         -> False,    //RS2...
                RSD_USE                         -> False     //and RSD values
            )
        )
    }
	
	
    override def build(pipeline: VexRiscv): Unit = {
        import pipeline._
        import pipeline.config._
		
		val global = pipeline plug new Area {
            val registers = Vec(Reg(UInt(8 bits)) init(255), 9)
        }
		
        execute plug new Area {
            import execute._
           
           val rs1 = input(RS1).asUInt
           
           insert(REG_READ0) := global.registers(0).asBits
           insert(REG_READ1) := global.registers(1).asBits
           insert(REG_READ2) := global.registers(2).asBits
           
           
           /* When uncommented, this code causes issues*/
           /*
           when(input(IS_SREGLOAD)){
               global.registers(0) := rs1(31 downto 24)
               global.registers(1) := rs1(23 downto 16)
               global.registers(2) := rs1(15 downto 8)
           }
           */
        }
        memory plug new Area {
            import memory._
            when(input(IS_SREGSTORE) && arbitration.isValid){
                output(REGFILE_WRITE_DATA) := input(REG_READ0) ## input(REG_READ1) ## input(REG_READ2) ## B"h00"
           }
        }
    }
}


/* Full example */
/*
package vexriscv.plugin

import spinal.core._
import vexriscv._
import spinal.lib._

class CustomRegFilePlugin extends Plugin[VexRiscv]{
    object IS_SREGLOAD extends Stageable(Bool)
    object IS_SREGSTORE extends Stageable(Bool)
    object REG_READ0 extends Stageable(Bits(8 bits))
    object REG_READ1 extends Stageable(Bits(8 bits))
    object REG_READ2 extends Stageable(Bits(8 bits))

    override def setup(pipeline: VexRiscv): Unit = {
        import pipeline.config._

        val decoderService = pipeline.service(classOf[DecoderService])

        decoderService.addDefault(IS_SREGLOAD, False)
        decoderService.addDefault(IS_SREGSTORE, False)

        decoderService.add(
        	// Special Register Load instruction
        	// I-type, but we only need a small immediate, so use R-type
            key =   M"0000000--000-----111000000101011",      
			//        |F7   ||IMM||RS1||3||RD ||OPCODE|
            List(
                IS_SREGLOAD                     -> True,
                IS_SREGSTORE                    -> False,
                REGFILE_WRITE_VALID             -> False,    //Enable reg file write
                BYPASSABLE_EXECUTE_STAGE        -> True,   //Notify the hazard management unit that the instruction result is NOT accessable in the EXE stage 
                BYPASSABLE_MEMORY_STAGE         -> True,   //Same as above but for memory stage
                RS1_USE                         -> True,    //Notify hazard management that this instr. uses RS1..
                RS2_USE                         -> False,    //RS2...
                RSD_USE                         -> False     //and RSD values
            )
        )
        decoderService.add(
        	// Special Register Store instruction
        	// I-type but we only need a small immediate, so use R-type
            key =   M"0000000--00000000110-----0101011",      
			//        |F7   ||IMM||RS1||3||RD ||OPCODE|
            List(
                IS_SREGSTORE                    -> True,
                IS_SREGLOAD                     -> False,
                REGFILE_WRITE_VALID             -> True,    //Enable reg file write
                BYPASSABLE_EXECUTE_STAGE        -> False,   //Notify the hazard management unit that the instruction result is NOT accessable in the EXE stage 
                BYPASSABLE_MEMORY_STAGE         -> False,   //Same as above but for memory stage
                RS1_USE                         -> False,    //Notify hazard management that this instr. uses RS1..
                RS2_USE                         -> False,    //RS2...
                RSD_USE                         -> False     //and RSD values
            )
        )
    }
	
	
    override def build(pipeline: VexRiscv): Unit = {
        import pipeline._
        import pipeline.config._
		
		val global = pipeline plug new Area {
            val registers = Vec(Reg(UInt(8 bits)) init(255), 9)
            
        }
		
        execute plug new Area {
            import execute._
           
           val rs1 = input(RS1).asUInt
           
           switch(input(INSTRUCTION)(24 downto 23)){
               is(B"00"){
                   insert(REG_READ0) := global.registers(0).asBits
                   insert(REG_READ1) := global.registers(1).asBits
                   insert(REG_READ2) := global.registers(2).asBits
               }
               is(B"01"){
                   insert(REG_READ0) := global.registers(3).asBits
                   insert(REG_READ1) := global.registers(4).asBits
                   insert(REG_READ2) := global.registers(5).asBits
               }
               is(B"10"){
                   insert(REG_READ0) := global.registers(6).asBits
                   insert(REG_READ1) := global.registers(7).asBits
                   insert(REG_READ2) := global.registers(8).asBits
               }
               is(B"11"){
                   insert(REG_READ0) := B"hF0"
                   insert(REG_READ1) := B"hF0"
                   insert(REG_READ2) := B"hF0"
               }
           }
           
           
           when(input(IS_SREGLOAD)){
               switch(input(INSTRUCTION)(24 downto 23)){
                   is(B"00"){
                       global.registers(0) := rs1(31 downto 24)
                       global.registers(1) := rs1(23 downto 16)
                       global.registers(2) := rs1(15 downto 8)
                   }
                   is(B"01"){
                       global.registers(3) := rs1(31 downto 24)
                       global.registers(4) := rs1(23 downto 16)
                       global.registers(5) := rs1(15 downto 8)
                   }
                   is(B"10"){
                       global.registers(6) := rs1(31 downto 24)
                       global.registers(7) := rs1(23 downto 16)
                       global.registers(8) := rs1(15 downto 8)
                   }
                   is(B"11"){
                       assert(
                           assertion = input(INSTRUCTION)(24 downto 23) != B"11",
                           message = "Can't input into fourth row!"
                       )
                       
                   }
               }
           }
        }
        memory plug new Area {
            import memory._
            when(input(IS_SREGSTORE) && arbitration.isValid){
                output(REGFILE_WRITE_DATA) := input(REG_READ0) ## input(REG_READ1) ## input(REG_READ2) ## B"h00"
           }
        }
    }
}
*/
