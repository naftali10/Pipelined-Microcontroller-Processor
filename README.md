# Pipelined-Microcontroller-Processor
In-order single-pipeline processor, capable of executing 6 different operations.  
Available for running at: https://www.edaplayground.com/x/pPY9
___
## Architecture
Capable of excuting the following operations for two operands A and B:  
| Operation |	Definition |
| - | - |
| Load | Load A into register file | 
| Out |	Output a register's contents |
| Add |	A+B |
| Subtract |	A-B |
| Bitwise NAND |	~(A\*B) |
| Bitwise NOR |	~(A\|B) |
| Bitwise XOR |	A^B |
| SHFL |	Shift left A by the index of the least significant '1' in B |

More info at [this PDF](/docs/High-Level%20Architectural%20Specifications.pdf).
___
## Micro-architecture
![Processor's top level diagram](https://github.com/naftali10/Pipelined-Microcontroller-Processor/blob/main/Top%20Level%20Diagram.jpg "Top level diagram")
More info at [this PDF](/docs/Micro%20Architectural%20Specifications.pdf).
