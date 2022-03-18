.data
  instruct: .asciiz "Enter 10 characters" #instructing the user to enter a string of 10 characters 
  .space 11 #allocating 10 bytes for the string b/c 1 character = 1 byte + the \n
.text
main:

#section for reading the characters from the string
addi, $v0, $0, 8 #system call code for reading a string in MIPS is 8
la $a0, instruct #a0 register set to the location in memory to which the computer will record the input
li $a1, 10 # setting the max number of characters that should be read in 
syscall 

#section for finding X, M and N
li, $t1,2992633 #loading my id to the register t1
li, $t2, 11 #loading the number 11 to the register t2
div $t1,$t2 #dividing my id number by the number 11
mfhi $t3 #storing the modulo portion to the register t3
li $t4, 26 #loading the number 26 to register t4
add $t5,$t4,$t3 #adding the modulo of my id and 26 and storing it in the t5 register
li $t6, 10 #loading the number 10 to the t6 register
sub $t7,$t5,$t6 #loading the value of N-10 to register t7





#syscall for ending the program
li $v0, 10 
syscall 
