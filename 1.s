# Q1: equacao de potencia

# funcao: GET_POWER

# argumentos:
	# P : s1, V : s2,  I : s3

# retornos:
	# f1, f2 (32 bits mais e menos significativos do resultado)

addi s1, zero, 0 # P
addi s2, zero, 5 # V
addi s3, zero, 1 # I
jal ra, GET_POWER # chamada de funcao
jal zero, EXIT

GET_POWER:

fcvt.s.w f0, zero # define f0 = 0

beq zero, s1, p # se P = 0, calcular P = VI
beq zero, s2, v # se V = 0, calcular V = P/I
beq zero, s3, i # se I = 0, calcular I = P/V

p: # caso de P = V * I

beq zero, s2, deadcase # conferir se alguma outra grandeza vale zero. caso positivo, retornar zero imediatamente
beq zero, s3, deadcase

mul s4, s2, s3
mulh s5, s2, s3  # o carregamento da parte superior do resultado da multiplicação é desnecessário nesse caso uma vez
				 # os argumentos I e V são carregados por imediato e o valor máximo desse campo não requer uso de 32
                 # bits para o resultado da multiplicação. 64 são usadados aqui por generalização, uma vez que esse
                 # pode não sempre ser o caso


fcvt.s.w f4, s4 # converte resultado de multiplicacao para PF
fcvt.s.w f5, s5

jal zero, return

v: # caso de V = P/I

beq zero, s1, deadcase # conferir se alguma outra grandeza vale zero. caso positivo, retornar zero imediatamente
beq zero, s3, deadcase

fcvt.s.w f1, s1
fcvt.s.w f3, s3 # converte argumentos de divisao para PF

fdiv.s f4, f1, f3 # passa resultado para intermediario de retorno
fcvt.s.w f5, zero # preenche registrador superior de 32 bits com zero

jal zero, return

i: # caso de I = P/V

beq zero, s1, deadcase # conferir se alguma outra grandeza vale zero. caso positivo, retornar zero imediatamente
beq zero, s2, deadcase

fcvt.s.w f1, s1 # logica identica ao caso anterior
fcvt.s.w f2, s2

fdiv.s f4, f1, f2
fcvt.s.w f5, zero

jal zero, return

deadcase:

fadd.s f4, f0, f0
fadd.s f5, f0, f0

return:

fadd.s f1, f4, f0  # passa resultados para registradores de retorno
fadd.s f2, f5, f0

jalr zero, ra, 0

EXIT:
