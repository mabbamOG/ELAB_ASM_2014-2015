.section .text
.global safe_mode
.type safe_mode, @function

safe_mode:
leal codice_pretty,%eax
call print_string
leal codice_failure,%eax
call print_string
leal codice_pretty,%eax
call print_string
ret
