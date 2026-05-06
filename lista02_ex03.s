.data
	entrada01: .asciiz "\nDigite o mês de nascimento: "
	entrada02: .asciiz "\nDigite o ano de nascimento: "
	entrada03: .asciiz "\nDigite o mês atual: "
	entrada04: .asciiz "\nDigite o ano atual: "
	saida: .asciiz "\nIdade em meses é igual: "
.text
main:
	#Recebendo mês de nasc
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura do mês de nasc
	li $v0 , 5
	syscall
	add $s1 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo ano de nasc
	li $v0 , 4
	la $a0 , entrada02
	syscall 
	
	#Leitura do ano de nasc
	li $v0 , 5
	syscall
	add $s2 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo mês atual
	li $v0 , 4
	la $a0 , entrada03
	syscall 
	
	#Leitura do mês atual
	li $v0 , 5
	syscall
	add $t1 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo ano atual
	li $v0 , 4
	la $a0 , entrada03
	syscall 
	
	#Leitura do ano atual
	li $v0 , 5
	syscall
	add $t2 , $v0 , 0 #Cópia do valor de v0
	
	#Convertendo para total de meses
	mul $s3 , $s2 , 12 
	add $s3 , $s3 , $s1

	mul $t3 , $t2 , 12
	add $t3 , $t3 , $t1
	
	#Idade
	sub $s0 , $t3 , $s3
	
	#Saída 
	li $v0 , 4
	la $a0 , saida
	syscall
	li $v0 , 1 
	add $a0 , $zero , $s0
	syscall	
	
	