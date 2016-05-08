.section .text
.global getch
.type getch, @function

getch:                      #put read char into EBX, get char from buffer through interrupt
decl %esp
##########
movl $3,%eax                #start READ
xorl %ebx,%ebx		        # EAX=3 EBX=0 default
movl %esp,%ecx              #writing into esp
xorl %edx,%edx
incl %edx
int $0x80                   #end READ
movb (%esp),%bl             # get read char into EBX (only first 8 bits)
###########
incl %esp
ret
