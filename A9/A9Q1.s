            .data
endmsg:     .asciiz " "
            .text
            .globl recur
recur:      slti $t0, $a0, 3
            bne $t0, $0, label
            sw $ra, -4($sp)
            sw $a0, -8($sp)
            addi $sp, $sp, -8
            addi $a0, $a0, -1
            jal recur
            lw $a0, 0($sp)
            sw $v0, 0($sp)
            addi $a0, $a0, -2
            jal recur
            lw $t0, 0($sp)
            add $v0, $t0, $v0
            lw $ra, 4($sp)
            addi $sp, $sp, 8
            jr $ra
label:      li $v0, 1
            jr $ra    
            .globl main
main:       li $v0, 5
            syscall
            add $t2, $0, $v0
            li $t3, 1
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