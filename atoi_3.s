.section .text
.global atoi_3
.type atoi_3, @function

atoi_3:             #get 1 or 3 parameters to read from EDI. put the 3 numbers into EAX,EBX,ECX. EDX 1 for SUCCESS or 0 for ERROR. ***EDI must be 1 or 3!!!
#SANITIZE
pushl %ebp
movl %esp,%ebp
pushl %esi
#********
decl %edi            #need for storing how many numbers are read. MUST be 1 or 3!
pushl %edi
xorl %esi,%esi

atoi_3_start:
call getch          # get a character from buffer...
cmpl $48,%ebx               # make sure first character is a NUMBER, to check i start with a number everytime, even after spaces
jl atoi_3_fail              # ...
cmpl $57,%ebx               # ...
jg atoi_3_fail              # ...
#FIRST NUMBER
subl $48,%ebx
movl %esi,%eax
movl $10,%ecx
mull %ecx
addl %ebx,%eax
movl %eax,%esi
number_loop_3:
call getch                  # put 1 character into EBX (and set EDX to 1)
cmpl $48,%ebx               # make sure it's a NUMBER
jl space_loop_3             # ...
cmpl $57,%ebx               # ...
jg space_loop_3             # ...
cmpl $180,%esi              # just in case the number is too big....
jg number_loop_3
#NUMBER:
movl %esi,%eax
movl $10,%ecx
mull %ecx
subl $48,%ebx
addl %ebx,%eax
movl %eax,%esi
jmp number_loop_3

space_loop_3:
test %edi,%edi
jz enter_loop_3         # it's time for the end
cmpl $32,%ebx           # we sure it's a SPACE?
jnz atoi_3_fail

pushl %esi              # save number onto stack
decl %edi
xorl %esi,%esi          # reset ESI
jmp atoi_3_start

enter_loop_3:
cmpl $10,%ebx           # we sure it's an ENTER?
jnz atoi_3_fail

movl -8(%ebp),%edi
test %edi,%edi
jz enter_loop_1        # check if we only need to read 1 number...

movl %esi,%ecx
popl %ebx
popl %eax
jmp atoi_3_end

enter_loop_1:
movl %esi,%eax
jmp atoi_3_end

atoi_3_cleanbuf:
call getch
atoi_3_fail:
#####CLEAN BUFFER
cmpl $10,%ebx
jnz atoi_3_cleanbuf    #put into clean buffer function
##################
xorl %edx,%edx        # admit failure
atoi_3_end:
#SANITIZE, in case of wild pushls
movl -4(%ebp),%esi   #needed because of edi....can't pop edi before i need to
movl %ebp,%esp
popl %ebp
#*******
ret
