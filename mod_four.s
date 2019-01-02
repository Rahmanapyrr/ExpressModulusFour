#Write a MIPS program that
#Implements the following expression without using div.
#a= (x - y) % 4

.data
	num1: .space 100
	num2: .space 100
	prompt_: .asciiz "Please enter a number:  "
	
.text

.globl main
	main:
		addi $t2, $0, 0 	#initializing subtraction counter
		
		li $v0, 4			#prompting user for integer
		la $a0, prompt_
		syscall
		
	#getting variable x from user
		li $v0, 5			
		#la $a0, num1
		syscall
		
		move $t0, $v0 #$t0 = x
		
		
		li $v0, 4			#prompting user for integer
		la $a0, prompt_
		syscall
		
	#getting variable y from user
		li $v0, 5
		#la $a0, num2
		syscall
		
		move $t1, $v0 	#$t1 = y
		
	#.....................
		minus_y_from_x:
			addi $t2, $t2, 1
			addi $t0, $t0, -1
			bne $t2, $t1, minus_y_from_x 
			
	#$t2 is now the result of the expression (x - y)
	
	sub_loop:
		bge $t0, 4, subtract
		j Exit
		
		subtract:
			addi $t0, $t0, -4
			j sub_loop
		
Exit:
	li $a0, 10		#printing newline
	li $v0, 11
	syscall 
	
	move $a0, $t0
	
	li $v0, 1 #printing $a0
	syscall
	
	li $v0, 10 #exiting program
	syscall
	
jr $ra
		
