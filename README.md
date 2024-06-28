![13109418_5126636](https://github.com/Dorsa-Sharifi/512-bit-processor/assets/119675151/f5ad443b-4f27-421f-a0af-d908a8296f5f)
# 512-bit Processor
My Project is a 512-bits Processor that is capable of basic mathematical summation and multiplication, a register file containing four 512-bits arrays and a memory.
# Tools
- ModelSim
- Visual Studio Code
# Description
The processor is made of 3 main modules:
- Register file which contains 4 registers with capacity of 512-bits
- Memory which has the depth of 512 and width of 32-bits
- ALU which is capable of doing signed multiplication and addition
In the next part, we will explain each part precisely.
# Implementation Details
- Register File :
![RegisterFile](https://github.com/Dorsa-Sharifi/512-bit-processor/assets/119675151/8fe955f2-0770-4ddb-b67d-c59b7db2dab6)
As you can see above, the code gets the inputs: clk, reset, dataIn, writeFlag, addr1, addr2 and returns the outputs: dataOut1, dataOut2.<br />
If the reset flag is set, we evaluate all 4 registers to zero.<br />
If the writeFlag is set, we detect the number of register by using case statement and save the dataIn inside the required register.<br />
It is noteworthy that the content of required register is saved inside the outputs. The code is implemented in such way, so that we do the arithmetic operations in ALU simpler.<br />

# Authors
- [Dorsa Sharifi Ghombavani](https://github.com/Dorsa-Sharifi) , Student Number: 401170604
