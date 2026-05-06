.data
	entrada: .asciiz "\n Digite o valor em real: "
	saida: .asciiz "\n O valor em dolar é: "
.text
main:
	#Recebendo o valor em real
	li $v0 , 4
	la $a0 , entrada
	syscall 
	
	#Leitura do valor em real
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Conversão
	mul $t1 , $t0 , 5
	
	#Saída
	li $v0 , 4
	la $a0 , saida
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t1
	syscall
	
