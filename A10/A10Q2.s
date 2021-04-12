            .data
arrayA:     .space 64
arrayB:     .space 64
msg:        .asciiz "Result "
msgA:       .asciiz "Enter Elements of the array: \n"
            .text
main:       addi $v0, $0, 5
            syscall
            add $t0, $0, $v0
            la $t2, arrayA
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
            mtc1 $0, $f2
            li $t3, 2
loop:       addi $t1, $t1, -1
            addi $t2, $t2, -4
            lwc1 $f0, 0($t2)
            div $t1, $t3
            mfhi $t4
            bne $t4, $0, sublab
            add.s $f2, $f2, $f0
            j doanyway
sublab:     sub.s $f2, $f2, $f0
doanyway:   bne $t1, $0, loop
            li $v0, 2
            mov.s $f12, $f2
            syscall
            jr $ra