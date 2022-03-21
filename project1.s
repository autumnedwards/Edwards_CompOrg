.data
  instruct: .asciiz "Enter 10 characters\n" #instructing the user to enter a string of 10 characters 
  userInput: .space 12 #allocating 12 bytes for the string b/c 1 character = 1 byte plus 2 extra bytes
  input: .asciiz "\nInput:" #used to display the input
  output: .asciiz "\nOutput:" #used to display the output
.text
main:

#displays "enter 10 characters\n"
li $v0, 4
la $a0, instruct
syscall

# getting user's input as text
addi $v0, $0, 8 #system call code for reading a string in MIPS is 8
la $a0, userInput #a0 register set to the location in memory to which the computer will record the input
li $a1, 11 # i want to read 10 characters so I se a1 to 10+1
syscall 

#displays "\ninput:"
li $v0, 4
la $a0, input
syscall

#displays the input values
li $v0, 4
la $a0, userInput
syscall

#finding X, M and N
li, $t1,2992633 #loading my id to the register t1
li, $t2, 11 #loading the number 11 to the register t2
div $t1,$t2 #dividing my id number by the number 11
mfhi $t3 #storing the modulo portion to the register t3
li $t4, 26 #loading the number 26 to register t4
add $t5,$t4,$t3 #adding the modulo of my id and 26 and storing it in the t5 register
li $t6, 10 #loading the number 10 to the t6 register
sub $t7,$t5,$t6 #loading the value of N-10 to register t7


#create a sum variable for adding the single- digit base N numbers 
addi $t3,$0,0

#create incrementing variable for loop
move $t0,$0 #assigning the value 0 to register t0

yes:
add $t3, $t3, $t2

no:
addi $t3, $t2, 0 #adds zero as the value if the blt is not satisfied 

#begin:
lb $t2, 0($a0)
#if the character is less than the the base N number then jump to yes
blt $t2, $t5, yes
#if the character is greater than or equal to the base number N the jump to no
bge $t2, $t5, no

lb $t2, 1($a0)
blt $t2, $t5, yes
bge $t2, $t5, no

lb $t2, 2($a0)
blt $t2, $t5, yes
bge $t2, $t5, no

lb $t2, 3($a0)
blt $t2, $t5, yes
bge $t2, $t5, no

lb $t2, 3($a0)
blt $t2, $t5, yes
bge $t2, $t5, no

lb $t2, 4($a0)
blt $t2, $t5, yes
bge $t2, $t5, no

lb $t2, 5($a0)
blt $t2, $t5, yes
bge $t2, $t5, no

lb $t2, 6($a0)
blt $t2, $t5, yes
bge $t2, $t5, no

lb $t2, 7($a0)
blt $t2, $t5, yes
bge $t2, $t5, no



#print sum
li $v0, 1
move $a0,$t3
syscall 
 

#syscall for ending the program
li $v0, 10 
syscall 
