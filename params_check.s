.section .text
.global params_check
.type params_check, @function

params_check:           #checks params in EAX,EBX,ECX, chooses dynamic_mode, emergency_mode, or recheck for failure
#edx,edi not needed.
cmpl $3,%eax
jnz params_emergency
cmpl $3,%ebx
jnz params_fail
cmpl $2,%ecx
jnz params_fail
call dynamic_mode
ret
params_emergency:
cmpl $9,%eax
jnz params_fail
cmpl $9,%ebx
jnz params_fail
cmpl $2,%ecx
jnz params_fail
call emergency_mode
ret
params_fail:
call recheck
ret
