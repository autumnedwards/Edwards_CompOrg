.data
  instruct: .asciiz "Enter 10 characters" #instructing the user to enter a string of 10 characters 
  .space 10 #allocating 10 bytes for the string b/c 1 character = 1 byte
.text
main:

addi, $v0, $0, 8 #system call code for a reading a string in MIPS is 8
la $a0, instruct #a0 register set to the location in memory to which the computer will record the input
li $a1, 10 # setting the max number of characters that should be read in 
syscall 
