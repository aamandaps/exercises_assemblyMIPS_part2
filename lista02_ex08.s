.data
	entrada01: .asciiz "\nDigite o valor da compra: "
	entrada02: .asciiz "\nDigite o valor da parcela: "
	saida: .asciiz "\nA quant. de parcela é: "
	erro01: .asciiz "\nInsira um valor válido, entre 1000 - 9999."
	erro02: .asciiz "\nInsira um valor válido, entre 100 - 500."
.text
main:
	#Recebendo o valor da compra
	li $v0 , 4
	la $a0 , entrada01
	syscall
	
	#Leitura do valor da compra
	li $v0 , 5
	syscall
	add $s1 , $v0 , $zero
	
	#Recebendo o valor da parcela
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura do valor da parcela
	li $v0 , 5
	syscall
	add $s2 , $v0 , $zero
	
	#Validação da compra
	bgt $s1 , 9999 , invalido01 # se s1 > 9999 , entao
	blt $s1 , 1000 , invalido01 # se s1 < 1000 , entao
	
	#Validação parcela
	bgt $s2 , 500 , invalido02 # se s2 > 500 , entao
	blt $s2 , 100 , invalido02 # se s2 < 100 , entao
	
	#Calculando quant. de parcelas
	div $s3 , $s1 , $s2 # quant = compra/parcela
	rem $t2 , $s1 , $s2  # resto
	
	bnez $t2 , entao # se resto != 0,entao
	
	#Saída se resto == 0
	li $v0 , 4
	la $a0 , saida
	syscall
	li $v0 , 1
	add $a0 , $zero , $s3
	syscall
	
	j fim
	
entao: 
	add $s3 , $s3 , 1

	#Saída se resto for maior que zero
	li $v0 , 4
	la $a0 , saida
	syscall
	li $v0 , 1
	add $a0 , $zero , $s3
	syscall
	
	j fim

	
invalido01:
	#Saída erro 1
	li $v0 , 4
	la $a0 , erro01
	syscall
	
	j main
	
invalido02:
	#Saída erro 2
	li $v0 , 4
	la $a0 , erro02
	syscall
	
	j main
	
fim:	
