# Q1: equacao de potencia

# P = V*I

# P : s1, V : s2,  I : s3
# retornos : a0, a1 (maximo 64 bits, portanto 2 registradores apenas)

# generalizar para ponto flutuante

addi s1, zero, 100 # P
addi s2, zero, 5 # V
addi s3, zero, 0 # I

beq zero, s1, P # se P = 0, calcular P = VI
beq zero, s2, V # se V = 0, calcular V = P/I
beq zero, s3, I # se I = 0, calcular I = P/V

P: # caso de P = V * I

beq zero, s2, deadcase # conferir se alguma outra grandeza vale zero. caso positivo, retornar zero imediatamente
beq zero, s3, deadcase

mul s4, s2, s3
mulh s5, s2, s3  # frequentemente desnecessario

jal zero, return

V: # caso de V = P/I

beq zero, s1, deadcase # conferir se alguma outra grandeza vale zero. caso positivo, retornar zero imediatamente
beq zero, s3, deadcase

div s4, s1, s3
addi s5, zero, 0

jal zero, return

I: # caso de I = P/V

beq zero, s1, deadcase # conferir se alguma outra grandeza vale zero. caso positivo, retornar zero imediatamente
beq zero, s2, deadcase

div s4, s1, s2
addi a1, zero, 0

jal zero, return

deadcase:

addi s4, zero, 0
addi s5, zero, 0

return:

addi a0, s4, 0
addi a1, s5, 0 # retorna em 2 regs
