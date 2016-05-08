.section .text
.global dynamic_mode
.type dynamic_mode, @function

dynamic_mode:
leal codice_pretty,%eax
call print_string
leal codice_dinamico,%eax
call print_string
leal codice_pretty,%eax
call print_string

dynamic_mode_insert:
leal inserire_totale,%eax
call print_string
movl $1,%edi                    #telling atoi i only need 1 number
call atoi_3
test %edx,%edx                  # if fail, try again
jz dynamic_mode_insert
cmpl $180,%eax                  # if number too big, error
jg dynamic_mode_error
#OK
movl %eax,%esi#copy value
leal stampa_enter,%eax
call print_string
dynamic_mode_insert_filesx:
leal inserire_filesx,%eax
call print_string
movl $3,%edi                    #telling atoi i need 3 numbers
call atoi_3
test %edx,%edx                  # if fail, try again
jz dynamic_mode_insert_filesx   # if number too big, error
cmpl $30,%eax
jg dynamic_mode_error_filesx
cmpl $30,%ebx
jg dynamic_mode_error_filesx
cmpl $30,%ecx
jg dynamic_mode_error_filesx
#OK
subl %eax,%esi#start checking everything matches
subl %ebx,%esi#start checking everything matches
subl %ecx,%esi#start checking everything matches
pushl %eax#A
pushl %ebx#B
pushl %ecx#C

leal stampa_enter,%eax
call print_string
dynamic_mode_insert_filedx:
leal inserire_filedx,%eax
call print_string

movl $3,%edi                #telling atoi i need 3 numbers
call atoi_3                 #only here do i need to protect esi with this function
test %edx,%edx
jz dynamic_mode_insert_filedx   # if number too big, try again
cmpl $30,%eax#D
jg dynamic_mode_error_filedx
cmpl $30,%ebx#E
jg dynamic_mode_error_filedx
cmpl $30,%ecx#F
jg dynamic_mode_error_filedx
#OK
subl %eax,%esi#start checking everything matches
subl %ebx,%esi#start checking everything matches
subl %ecx,%esi#start checking everything matches
test %esi,%esi#TEST
jnz dynamic_mode_error_totali_diversi#if total does not match!!!
#ALL-OK
###END OF DYNAMIC MODE INSERT!
#esi,edi,edx not needed!
popl %edi#C
subl %eax,%edi#Z = C-D
popl %eax#B
subl %ebx,%eax#Y = B-E
popl %esi#A
subl %ecx,%esi#X = A-F
#START WITH BIASES
###ADD
addl %eax,%esi
addl %eax,%esi#x+2y
addl %edi,%eax
addl %edi,%eax#y+2z
###MULTIPLY BY 3
movl $3,%ebx
imull %ebx
movl %eax,%edi#BIAS2
movl %esi,%eax
imull %ebx#3(x+2y)
###DIVIDE BY 2
movl $2,%ebx
cdq # sign extend eax into edx. an alternative: use ax division by byte, and get result from al and remainder from ah
idivl %ebx
movl %eax,%esi#BIAS1
test %edx,%edx#check for remainder
jnz dynamic_mode_print#if remainder go print
#REMOVE REMAINDER!
leal stampa_remainder,%eax
movb $0,(%eax)#insert \0
jmp dynamic_mode_print

dynamic_mode_error:
leal inserire_totale_err,%eax
call print_string
jmp dynamic_mode_insert

dynamic_mode_error_filesx:
leal inserire_file_err,%eax
call print_string
jmp dynamic_mode_insert_filesx

dynamic_mode_error_filedx:
leal inserire_file_err,%eax
call print_string
jmp dynamic_mode_insert_filedx

dynamic_mode_error_totali_diversi:
leal inserire_totali_diversi,%eax
call print_string
addl $12,%esp#pop pushed values
leal stampa_enter,%eax
call print_string
leal codice_pretty,%eax
call print_string
jmp dynamic_mode_insert

dynamic_mode_print:#bias 1 in ESI, bias 2 in EDI.
#---B1
movl %esi,%ebx
call print_bias# print bias, handles bias number and  and bias (EBX)
leal stampa_remainder,%eax
call print_string
#---B2
movl %edi,%ebx
call print_bias
#---B3
notl %ebx            # invert sign of EDI
incl %ebx
call print_bias
#---B4
notl %esi            # invert sign of ESI
incl %esi
movl %esi,%ebx
call print_bias
leal stampa_remainder,%eax
call print_string
#---END
leal stampa_enter,%eax
call print_string
leal stampa_enter,%eax
call print_string
ret
