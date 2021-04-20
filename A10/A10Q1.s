            .data
array:      .space 48
result:     .asciiz "Found element at index "
failres:    .asciiz "Element was not found"
enter1:     .asciiz "Enter N "
enter2:     .asciiz "Enter K "
enterA:     .asciiz "Enter Array\n"
            .text
            .globl recur
recur:      slt $t0, $a2, $a1
            bne $t0, $0, fail
            add $t0, $a1, $a2
            li $t1, 2
            div $t0, $t1
            mflo $t1 # will store mid
            sll $t2, $t1, 2 # free to use
            la $t0, array
            add $t2, $t0, $t2 # stores address of A[mid]
            lw $t0, 0($t2) # stores A[mid]
            beq $a0, $t0, success
            slt $t2, $a0, $t0
            beq $t2, $0, great # A[mid] > key
less:       sw $ra, -4($sp)
            addi $sp, $sp, -4
            addi $t1, -1
            add $a2, $0, $t1
            jal recur
            lw $ra, 0($sp)
            addi $sp, $sp, 4
            jr $ra
great:      sw $ra, -4($sp)
            addi $sp, $sp, -4
            addi $t1, 1
            add $a1, $0, $t1
            jal recur
            lw $ra, 0($sp)
            addi $sp, $sp, 4
            jr $ra
success:    add $v0, $0, $t1
            jr $ra
fail:       li $v0, -1
            jr $ra
            .globl main
main:       li $v0, 4
            la $a0, enter1
            syscall
            li $v0, 5
            syscall
            add $t0, $0, $v0 # N
            xor $a1, $t0, $t0
            addi $a2, $t0, -1
            la $t2, array # array_pointer
            add $t3, $0, $t0 # loop_counter
            sw $ra, -4($sp)
            addi $sp, $sp, -4
            li $v0, 4
            la $a0, enterA
            syscall
loopA:      addi $t3, $t3, -1
            li $v0, 5
            syscall
            sw $v0, 0($t2)
            addi $t2, $t2, 4
            bne $t3, $0, loopA
            li $v0, 4
            la $a0, enter2
            syscall
            li $v0, 5
            syscall
            add $a0, $0, $v0 # K
            jal recur
            lw $ra, 0($sp)
            addi $sp, $sp, 4
            add $t3, $0, $v0
            slt $t0, $v0, $0
            bne $t0, $0, failprint
successp:   li $v0, 4
            la $a0, result
            syscall
            add $a0, $0, $t3
            li $v0, 1
            syscall
            jr $ra
failprint:  li $v0, 4
            la $a0, failres
            syscall
            jr $ra