.section .text
.global emergency_mode
.type emergency_mode, @function

emergency_mode:
leal codice_pretty,%eax#use pretty_print function?
call print_string
leal codice_emergenza,%eax
call print_string
leal codice_pretty,%eax
call print_string
ret
