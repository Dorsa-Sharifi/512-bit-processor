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
- Memory :
![RegisterFile (1)](https://github.com/Dorsa-Sharifi/512-bit-processor/assets/119675151/413ae64e-8c02-4d06-9911-4d6dfd9fc7a3)
According to the code above, the memory module gets the inputs: clk, writeFlag, readFlag, addr, dataIn and returns a single output: dataOut.<br />
We define a memory with depth 512 and width 32 bits by: reg signed [31:0] mem [511:0].<br />
If the readFlag is set, we evaluate dataOut to the content of memory in the given address.<br />
If the writeFlag is set, we save a new given data into our memory in the given address.<br />
- ALU :
![RegisterFile (2)](https://github.com/Dorsa-Sharifi/512-bit-processor/assets/119675151/62fcb4d7-07d2-426d-a934-0d75b3cb8409)
In the ALU module, the code gets the inputs: opcode, A1, A2 and returns : dataOut. <br />
It's noteworthy that we do addition and multiplication using $signed which handles the operation in signed mode. <br />
- Processor :
![RegisterFile (3)](https://github.com/Dorsa-Sharifi/512-bit-processor/assets/119675151/d0b38986-fa45-4342-b99c-727159ec2df2)
In the Processor module we gather all instances of sub-modules and complete out circuit by connecting wires.<br />
The key point is the assignment :
```
assign answerOfAlu = answerOfALU;
assign registerDataIn = dataOut;
```
These two lines help us to monitor the inputs that are read or written in register and alu.<br />
# Authors
-[Dorsa Sharifi Ghombavani](https://github.com/Dorsa-Sharifi) , Student Number: 401170604
