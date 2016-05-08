.section .text
.global print_string
.type print_string, @function

print_string:	            #print string, address in EAX
pushal                      ##### PUSHAL/POPAL IS GOOD PRACTICE!!!! (save esi)
movl %eax,%esi              # address now in ESI
print_string_begin:
cmpb $0,(%esi)
je print_string_end
movl $4,%eax
xorl %ebx,%ebx
incl %ebx
xorl %edx,%edx
incl %edx
movl %esi,%ecx
int $0x80
incl %esi
jmp print_string_begin
print_string_end:
popal
ret
