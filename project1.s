.data
  instruct: .asciiz "Enter 10 characters" #instructing the user to enter a string of 10 characters 
  
.text
main:

addi, $v0, $0, 8
la $a0, instruct
li $a1, 10

