addi, x10, x0, 4 # n = 4

jal x1, FACT # int fact(int n)
jal x0, EXIT

FACT:

add x28, x0, x10
addi x29, x0, 2 # i = 2
addi x30, x0, 1 # res = 1

LOOP:

mul x5, x29, x30 # res*i
add x30, x0, x5 # res = res*i
addi x29, x29, +1 # i++
blt x29, x28, LOOP # while(i <= n)
beq x29, x28, LOOP

add x17, x0, x30 # return(res)
jalr x0, 0(x1) #

EXIT:
