.data
  instruct: .asciiz "Enter 10 characters" #instructing the user to enter a string of 10 characters 
  userInput: .space 12 #allocating 12 bytes for the string b/c 1 character = 1 byte plus 2 extra bytes
.text
main:

#section for reading the characters from the string
addi, $v0, $0, 8 #system call code for reading a string in MIPS is 8
la $a0, instruct #a0 register set to the location in memory to which the computer will record the input
li $a1, 11 # i want to read 10 characters so I se a1 to 10+1
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

#section for loading bytes from the string to a specific register
lb $s0, 0($a0)
lb $s1, 1($a0)
lb $s2, 2($a0)
lb $s3, 3($a0)
lb $s4, 4($a0)
lb $s5, 5($a0)


#section for reading characters that are 0-9

readInt:


 
 



#syscall for ending the program
li $v0, 10 
syscall 
