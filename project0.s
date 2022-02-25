.data #this section is where all data is stored to the memory
hello: .asciiz "Hello, @02992633\n" #inputting the string hello, @student id in the memory

.text #this section is where the MIPS code is used 
move $t0,$0 #assigning the value 0 to register t0
li, $t1,2992633 #loading my id to the register t1
li, $t2, 11 #loading the number 11 to the register t2

#begin the process of finding 2992633 % 11
div $t1,$t2 #dividing my id number by the number 11
mflo $t3 #storing the whole number portion to the register t3
mult $t2, $t3 #multiply the whole number portion by 11
mflo $t4 #storing the low 32 bits to register t2
sub $t5, $t1, $t4 # 2992633 - 2992627 (final step of finding the mod) and storing it in register t3
#the process of finding the modulo which is the number of times the program runs is completed

startloop:
  	bgez $t0, $t5, exitloop #when t0 is greater than the modulus stop the loop
  	la $a0, hello #loading the address hello(which is the string that we implemented in the data section)
	  li $v0, 4 #through the system call 4 the address will print
	  syscall #this just means system call
	  addi $t0,$t0, 1 #incrementing the variable stored in register t0 
	  j startloop
exitloop:

li $v0, 10 #system call for exit
syscall 
