sbt "runMain vexriscv.demo.GenFullCustom"

cd src/test/cpp/custom/custom_reg_file
make

cd ../../regression_mulacc
bash runTest.sh
