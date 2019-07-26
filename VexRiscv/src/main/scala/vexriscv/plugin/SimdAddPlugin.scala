package vexriscv.plugin

import spinal.core._
import vexriscv._
import spinal.lib._

class SimdAddPlugin extends Plugin[VexRiscv]{

  object IS_SIMD_ADD extends Stageable(Bool)

  override def setup(pipeline: VexRiscv): Unit = {
    import pipeline.config._

    val decoderService = pipeline.service(classOf[DecoderService])

    decoderService.addDefault(IS_SIMD_ADD, False)

    decoderService.add(
      key = M"0000011----------000-----0110011",

      List(
        IS_SIMD_ADD               -> True,
        REGFILE_WRITE_VALID       -> True, //Enable the register file write
        BYPASSABLE_EXECUTE_STAGE  -> True, //Notify the hazard management unit that the instruction result is already accessable in the EXECUTE stage (Bypass ready)
        BYPASSABLE_MEMORY_STAGE   -> True, //Same as above but for memory stage
        RS1_USE                   -> True, //Notify the hazard management unit that this instruction uses the RS1 value
        RS2_USE                   -> True
      )
    )
  }

  override def build(pipeline: VexRiscv): Unit = {
    import pipeline._
    import pipeline.config._

    //Add a new scope on the execute stage (used to give a name to signals)
    execute plug new Area {
      //Define signals to be used
      val rs1 = execute.input(RS1).asUInt
      val rs2 = execute.input(RS2).asUInt
      val rd = UInt(32 bits)

      rd(7 downto 0) := rs1(7 downto 0) + rs2(7 downto 0)
      rd(16 downto 8) := rs1(16 downto 8) + rs2(16 downto 8)
      rd(23 downto 16) := rs1(23 downto 16) + rs2(23 downto 16)
      rd(31 downto 24) := rs1(31 downto 24) + rs2(31 downto 24)

      when(execute.input(IS_SIMD_ADD)) {
        execute.output(REGFILE_WRITE_DATA) := rd.asBits
      }
    }
  }
}