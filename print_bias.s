.section .text
.global print_bias
.type print_bias, @function

print_bias:                 # EBX is bias
leal stampa_bias,%eax
incb 18(%eax)               # handles bias number (for printing)
call print_string
movl %ebx,%eax
call itoa
ret
