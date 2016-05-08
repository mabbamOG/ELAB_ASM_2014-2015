.section .text
.global check_ext_params
.type check_ext_params, @function

check_ext_params:		#gets the program's external parameters and checks for errors
movl $3,%esi            # used to store COUNTER for recheck function!
cmpl $4,4(%esp)		    #verify there are 3 (real) parameters
jnz check_fail
check_start:
xorl %eax,%eax
xorl %ebx,%ebx
xorl %ecx,%ecx
movl 12(%esp),%edx	  # move first param into EAX
movb (%edx),%al
subl $48,%eax
movl 16(%esp),%edx	  # move second param into EBX
movb (%edx),%bl
subl $48,%ebx
movl 20(%esp),%edx	  # move third param into ECX
movb (%edx),%cl
subl $48,%ecx
call params_check
ret
check_fail:
call recheck
ret
