# x10: v, x11: v_len, x5: i, x6: smallest_index

# TODO:

# - ajeitar comentarios
# - ajeitar registradoras
# - testar mais vetores
# - ver se tem como declarar o vetor de forma mais interessante
# - implementar como chamada de funcao formal

############################# args

addi x10, x0, 0 # v = &v[0] = 0
addi x11, x0, 6 # v_len = n of elements

############################# array filling

addi x5, x11, -1
slli x5, x5, 2
add x12, x10, x5 # x12 = &v[v_len - 1] #### OK

addi x5, x0, -1
sw x5, 0(x10)
addi x5, x0, -10
sw x5, 4(x10)
addi x5, x0, 2
sw x5, 8(x10)
addi x5, x0, 4
sw x5, 12(x10)
addi x5, x0, 1
sw x5, 16(x10)
addi x5, x0, 23
sw x5, 20(x10)

############################# inicio de programa

LOOP1:

addi x6, x10, 0 # smallest_index = posicao inicial
addi x5, x10, -4 # p = posicao incial - 4

LOOP2:

addi x5, x5, 4 # p++, itera antes para validar ambos os loops

lw x7, 0(x5) # x7 = v[i]
lw x8, 0(x6) # x8 = v[smallest_index]

bge x7, x8, ENDTEST

add x6, x5, x0 # smallest_index = i

ENDTEST: blt x5, x12, LOOP2

SWAP:

lw x7, 0(x10) # aux = v[0]
lw x8, 0(x6) # x8 = v[smallest_index]
sw x8, 0(x10) # v[0] = v[smallest_index]
sw x7, 0(x6) # v[smallest_index] = aux

addi x10, x10, 4 # sobe uma posicao na ponta do array

blt x10, x12, LOOP1
