.section .text
.global recheck
.type recheck, @function

recheck:                #counter is in ESI! handles incorrect code input and starts safe mode if needed
#eax,ebx,ecx,edx and edi not needed
test %esi,%esi
jz recheck_fail
decl %esi
leal codice_errato,%eax
call print_string
movl $3,%edi            #telling atoi i need to read 3 numbers...
call atoi_3
test %edx,%edx          # read OK?
jz recheck
call params_check
ret
recheck_fail:
call safe_mode
ret
