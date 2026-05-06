.data 
	entrada: .asciiz "\nInsira um número: "
	saida_cent: .asciiz "\nCentena: "
	saida_dez: .asciiz "\nDezena: "
	saida_uni: .asciiz "\nUnidade: "
	erro: .asciiz "\nDigite um valor válido. "
.text
main:
	#Recebendo o número
	li $v0 , 4
	la $a0 , entrada
	syscall
	
	#Leitura do número
	li $v0 , 4
	syscall
	add $s0 , $zero , $v0
	
	bgt $s0 , 999 , invalido # se num > 999, entao
	blt $s0 , 100 , invalido # se num < 100, entao
	
invalido:
	#Saída do erro
	li $v0 , 4
	la $a0 , erro
	syscall
	
	j main
	