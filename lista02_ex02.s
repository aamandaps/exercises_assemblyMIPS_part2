.data
	entrada01: .asciiz "\nDigite um número para $s1: "
	entrada02: .asciiz "\nDigite um número para $s2: "
	saida01: .asciiz "\nValor atualizado de $s1: "
	saida02: .asciiz "\nValor atualizado de $s2: "
.text
main:
	#Recebendo valor de s1
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura do valor de s1
	li $v0 , 5
	syscall
	add $s1 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo valor de s2
	li $v0 , 4
	la $a0 , entrada02
	syscall 
	
	#Leitura do valor de s2
	li $v0 , 5
	syscall
	add $s2 , $v0 , 0 #Cópia do valor de v0
	
	#Efetuando a troca de valores
	add $s3 , $s1 , 0 # s3 = tmp
	add $s1 , $s2 , 0
	add $s2 , $s3 , 0 
	
	
	#Saída s1 atualizado
	li $v0 , 4
	la $a0 , saida01
	syscall
	li $v0 , 1 
	add $a0 , $zero , $s1
	syscall
	
	#Saída de s2 atualizado
	li $v0 , 4
	la $a0 , saida02
	syscall
	li $v0 , 1 
	add $a0 , $zero , $s3
	syscall
