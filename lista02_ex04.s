.data
	entrada: .asciiz "\nDigite o salário atual: "
	saida: .asciiz "\nO novo salario é igual a: "
.text
main:
	#Recebendo o salário
	li $v0 , 4
	la $a0 , entrada
	syscall
	
	#Leitura do salário
	li $v0 , 5
	syscall
	add $s0 , $v0 , $zero 
	
	#Calculando o novo salário 
	mul $s1 , $s0 , 25
	div $s1 , $s1 , 100
	add $s2 , $s1 , $s0
	
	#Saída
	li $v0 , 4
	la $a0 , saida
	syscall
	li $v0 , 1
	add $a0 , $s2 , $zero
	syscall
	
