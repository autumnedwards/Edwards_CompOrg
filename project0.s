.data #this section is where all data is stored to the memory
hello: .asciiz "Hello, @02992633" #inputting the string hello, @student id in the memory

.text #this section is where the MIPS code is used 

move $t0,$0 #assigning the value 0 to register t0
li, $t1,2992633 #loading my id to the register t1
li, $t2, 11 #loading the number 11 to the register t2
