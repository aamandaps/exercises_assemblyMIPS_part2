.data
	entrada01: .asciiz "\nDigite o valor de A: "
	entrada02: .asciiz "\nDigite o valor de B: "
	entrada03: .asciiz "\nDigite o valor de C: "
	msg01: .asciiz "\nUMA RAIZ REAL"
	msg02: .asciiz "\nDUAS RAÍZES REAIS"
	msg03: .asciiz "\nNÃO EXISTEM RAÍZES REAIS"
.text
main:
	#Recebendo coeficiente A
	li $v0 , 4
	la $a0 , entrada01
	syscall
	
	#Leitura coeficiente A
	li $v0 , 5
	syscall
	add $t0 , $v0 , $zero
	
	#Recebendo coeficiente B
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura coeficiente B
	li $v0 , 5
	syscall
	add $t1 , $v0 , $zero
	
	#Recebendo coeficiente C
	li $v0 , 4
	la $a0 , entrada03
	syscall
	
	#Leitura coeficiente C
	li $v0 , 5
	syscall
	add $t2 , $v0 , $zero 
	
	#Calculando delta
	mul $s1 , $t1 , $t1 # b * b (b^2)
	mul $s2 , $t0 , $t2 # a *c
	mul $s2 , $s2 , 4   # ac * 4
	
	sub $s0 , $s1 , $s2 # delta = s0
	
	
	beqz $s0, saida01 # se delta == 0 , entao
	bgt $s0 , $zero , saida02 # se delta > 0 , entao
	
	j saida03 # se delta < 0 , entao
	
saida01:
	#Saída
	li $v0 , 4
	la $a0 , msg01
	syscall
	
	j fimse
	
saida02:
	#Saída
	li $v0 , 4
	la $a0 , msg02
	syscall
	
	j fimse
	
saida03:
	#Saída
	li $v0 , 4
	la $a0 , msg03
	syscall

fimse:

	
	
