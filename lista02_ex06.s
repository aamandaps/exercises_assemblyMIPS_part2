.data
	entrada01: .asciiz "\nDigite o primeiro número: "
	entrada02: .asciiz "\nDigite o segundo número: "
	msg01: .asciiz "\nSão iguais."
	msg02: .asciiz "\nSão diferentes, a ordem é: "
	virgula: .asciiz " , "
.text
main:
	#Recebendo o primeiro número
	li $v0 , 4
	la $a0 , entrada01
	syscall
	
	#Leitura do primeiro número
	li $v0 , 5
	syscall
	add $t1 , $v0 , $zero
	
	#Recebendo o segundo número
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura do segundo número
	li $v0 , 5
	syscall
	add $t2 , $v0 , $zero
				
	beq $t1 , $t2 , entao01 # se v1 == v2,entao
	j continua
	
entao01:
	#Saída msg01
	li $v0 , 4
	la $a0 , msg01
	syscall
	
	j fimse
	
continua: 
	bgt $t1 , $t2 , entao02 # se v1>v2 , entao02
	j senao
	
entao02:
	#Saída msg02
	li $v0 , 4
	la $a0 , msg02
	syscall
	
	#Saída em ordem
	li $v0 , 1 
	add $a0 , $zero , $t1
	syscall
	
	# imprime " , "
	li $v0 , 4
	la $a0 , virgula
	syscall
	
	li $v0 , 1 
	add $a0 , $zero , $t2
	syscall
	
	j fimse
	
senao: 
 	#Saída msg02
	li $v0 , 4
	la $a0 , msg02
	syscall
	
	#Saída em ordem
	li $v0 , 1 
	add $a0 , $zero , $t2
	syscall
	
	# imprime " , "
	li $v0 , 4
	la $a0 , virgula
	syscall
	
	li $v0 , 1 
	add $a0 , $zero , $t1
	syscall
	
fimse: