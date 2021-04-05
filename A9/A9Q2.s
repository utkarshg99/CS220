            .data
arrayA:     .space 64
arrayB:     .space 64
msg:        .asciiz "Result "
msgA:       .asciiz "Enter Elements of A: \n"
msgB:       .asciiz "Enter Elements of B: \n"
            .text
main:       addi $v0, $0, 5
            syscall
            add $t0, $0, $v0
            la $t2, arrayA
            la $t3, arrayB
            add $t1, $0, $v0
            li $v0, 4
            la $a0, msgA
            syscall
loopA:      addi $t1, $t1, -1
            li $v0, 6
            syscall
            swc1 $f0, 0($t2)
            addi $t2, $t2, 4
            bne $t1, $0, loopA
            add $t1, $0, $t0
            li $v0, 4
            la $a0, msgB
            syscall
loopB:      addi $t1, $t1, -1
            li $v0, 6
            syscall
            swc1 $f0, 0($t3)
            addi $t3, $t3, 4
            bne $t1, $0, loopB
            add $t1, $0, $t0
            li $v0, 4
            la $a0, msg
            syscall
            mtc1 $0, $f2
            la $t2, arrayA
            la $t3, arrayB
loop:       addi $t1, $t1, -1
            lwc1 $f0, 0($t2)
            lwc1 $f1, 0($t3)
            addi $t2, $t2, 4
            addi $t3, $t3, 4
            mul.s $f4, $f0, $f1
            add.s $f2, $f2, $f4
            bne $t1, $0, loop
            li $v0, 2
            mov.s $f12, $f2
            syscall
            jr $ra