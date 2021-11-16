# TODO: reescrever comentarios para levar em conta ponteiros

# x10: v, x11: v_len, x5: i, x6: smallest_index

############################ args

addi x10, x0, 0 # v = &v[0] = 0
addi x11, x0, 5 # v_len = n of elements

############################# array filling

addi x5, x11, -1
slli x5, x5, 2
add x12, x10, x5 # x12 = &v[v_len - 1]

addi x5, x0, 2
sw x5, 0(x10)
addi x5, x0, 7
sw x5, 4(x10)
addi x5, x0, 5
sw x5, 8(x10)
addi x5, x0, 3
sw x5, 12(x10)
addi x5, x0, 1
sw x5, 16(x10)
addi x5, x0, 0
sw x5, 20(x10)


############################# Inicio de programa

addi x6, x10, 0 # smallest_index = 0
addi x5, x10, 0 # p = v

LOOP:

lw x7, 0(x5) # x7 = v[i]
lw x8, 0(x6) # x8 = v[smallest_index]

blt x8, x7, SWAP # if v[smallest_index] < v[i] goto swap

add x6, x5, x0 # smallest_index = i

SWAP:

lw x7, 0(x10) # aux = v[0]
lw x8, 0(x6) # x8 = v[smallest_index]
sw x8, 0(x10) # v[0] = v[smallest_index]
sw x7, 0(x6) # v[smallest_index] = aux

addi x5, x5, 4 # i ++

bge x12, x5, LOOP
