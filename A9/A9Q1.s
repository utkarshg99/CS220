            .data
endmsg:     .asciiz " "
            .text
            .globl recur
recur:      li $t0, 1
            li $t1, 2
            beq $a0, $t0, label
            beq $a0, $t1, label
            sw $ra, -4($sp)
            sw $a0, -8($sp)
            sw $0, -12($sp)
            addi $sp, $sp, -12
            addi $a0, $a0, -1
            jal recur
            lw $a0, 4($sp)
            sw $v0, 0($sp)
            addi $a0, $a0, -2
            jal recur
            lw $t0, 0($sp)
            add $v0, $t0, $v0
            lw $ra, 8($sp)
            addi $sp, $sp, 12
            jr $ra
label:      li $v0, 1
            jr $ra    
            .globl main
main:       li $v0, 5
            syscall
            add $t2, $0, $v0
            li $t3, 1
            add $t4, $0, $0
            sw $ra, -4($sp)
            addi $sp, $sp, -4
loop:       add $a0, $0, $t3
            jal recur
            addi $t3, $t3, 1
            add $a0, $0, $v0
            addi $v0, $0, 1
            syscall
            li $v0, 4
            la $a0, endmsg
            syscall
            slt $t5, $t2, $t3
            beq $t5, $0, looplab
            j exitloop
looplab:    j loop
exitloop:   lw $ra, 0($sp)
            addi $sp, $sp, 4
            jr $ra