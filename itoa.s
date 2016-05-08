.section .text
.global itoa
.type itoa, @function

itoa: #prints %eax number
pushal                      ##### PUSHAL/POPAL IS GOOD PRACTICE!!!!
xorl %esi,%esi              # i=0
xorl %edi,%edi              # sign flag
test %eax,%eax              # check if number is negative
jns itoa_start
#STRIP out sign
notl %eax
incl %eax
incl %edi
itoa_start:
test %eax,%eax		        # if 0 is to be printed, do this, else jump to printing_loop
jnz divide_loop
addl $48,%eax
pushl %eax
incl %esi
jmp printing_loop
divide_loop:
test %eax,%eax              #check if eax == 0
jz sign_loop
xorl %edx,%edx              #edx needs to be zero for division. (dx+ax are concatenated...)
movl $10,%ebx               # for division
divl %ebx                   # eax/10.    edx<--remainder, eax<--result
addl $48,%edx               #convert integer to ascii
pushl %edx                  #sending remainder to stack
incl %esi                   # i++
jmp divide_loop
sign_loop:
test %edi,%edi
jz printing_loop
pushl $45
incl %esi
#-----
printing_loop:
test %esi,%esi		    #check if done printing
jz end_function
decl %esi
movl %esp,%ecx
movl $4,%eax
movl $1,%ebx
movl $1,%edx
int $0x80
addl $4,%esp
jmp printing_loop
end_function:
popal
ret
