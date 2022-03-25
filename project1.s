.data
  instruct: .asciiz " " #instructing the user to enter a string of 10 characters 
  userInput: .space 12 #allocating 12 bytes for the string b/c 1 character = 1 byte plus 2 extra bytes
  newline: .asciiz "\n"
.text
main:

#displays " "
li $v0, 4
la $a0, instruct
syscall

# getting user's input as text
addi $v0, $0, 8 #system call code for reading a string in MIPS is 8
la $a0, userInput #a0 register set to the location in memory to which the computer will record the input
li $a1, 11 # i want to read 10 characters so I se a1 to 10+1
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
li $t3, 0

#create incrementing variable for loop
li $t0,0 #assigning the value 0 to register t0

addi $t4, $0, 48
addi $t5, $0, 57
addi $t6, $0, 65
addi $t7, $0, 87
addi $t8, $0, 97
addi $t9, $0, 119

begin:
#lb $t2, $t0($a0)

#changing the syntax of this line 
add $t2, $t0, $a0
lb $t2, ($t2)

#numbers 0-9 (greater than or equal to 48 AND less than or equal to 57)(between 47 and 58)
#letters A-W (uppercase) (greater than or equal to 65 AND less than or equal to 87)(between 64 and 88)
#letters a-w (lowercase) (greater than or equal to 97 AND less than or equal to 119)(between 96 and 120)

ble $t2,$t5,Pnumber #if the value of t2 is less than or equal to 57 go to possible number
ble $t2,$t7,Puppercase #if the value of t2 is less than 87 or equal to go to possible uppercase
ble $t2,$t9,Plowercase #if the value of t2 is less than or equal to 119 go to possible lowercase
bgt $t2, $t9, returnZero #if the value of t2 is greater than 118 go to return zero

Pnumber:
bge $t2,$t4,integer
blt $t2, $t4, returnZero

Puppercase:
bge $t2,$t6,uppercase
blt $t2, $t6, returnZero

Plowercase:
bge $t2,$t8,lowercase 
blt $t2, $t8, returnZero

integer:
addi $t2, $t2, -48 #subtracts 48 to get integer from 0-9
j sum

uppercase: 
addi $t2, $t2, -55 #subtracts 55 to get values from 10-32 for uppercase letters
j sum

lowercase:
addi $t2, $t2, -87 #subtracts 87 to get values from 10-32 for lowercase letters 
j sum

returnZero:
sub $t2, $t2, $t2
j sum

sum:
add $t3, $t3, $t2

#iterate the counter
addi $t0,$t0,1  

#check to see if the loop should stop
bne $t0, 10, begin

li $v0, 4
la $a0, newline
syscall


#print sum
li $v0, 1
move $a0,$t3
syscall 
 

#syscall for ending the program
li $v0, 10 
syscall 
