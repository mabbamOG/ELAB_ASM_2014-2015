EXE= run
AS= as --32
LD= ld -melf_i386
FLAGS= -gstabs
OBJ= run.o check_ext_params.o params_check.o recheck.o safe_mode.o emergency_mode.o dynamic_mode.o print_bias.o print_string.o itoa.o atoi_3.o getch.o

$(EXE): $(OBJ)
	$(LD) -o $(EXE) $(OBJ)
run.o: run.s
	$(AS) $(FLAGS) run.s -o run.o
check_ext_params.o: check_ext_params.s
	$(AS) $(FLAGS) check_ext_params.s -o check_ext_params.o
params_check.o: params_check.s
	$(AS) $(FLAGS) params_check.s -o params_check.o
recheck.o: recheck.s
	$(AS) $(FLAGS) recheck.s -o recheck.o
safe_mode.o: safe_mode.s
	$(AS) $(FLAGS) safe_mode.s -o safe_mode.o
emergency_mode.o: emergency_mode.s
	$(AS) $(FLAGS) emergency_mode.s -o emergency_mode.o
dynamic_mode.o: dynamic_mode.s
	$(AS) $(FLAGS) dynamic_mode.s -o dynamic_mode.o
print_bias.o: print_bias.s
	$(AS) $(FLAGS) print_bias.s -o print_bias.o
print_string.o: print_string.s
	$(AS) $(FLAGS) print_string.s -o print_string.o
itoa.o: itoa.s
	$(AS) $(FLAGS) itoa.s -o itoa.o
atoi_3.o: atoi_3.s
	$(AS) $(FLAGS) atoi_3.s -o atoi_3.o
getch.o: getch.s
	$(AS) $(FLAGS) getch.s -o getch.o
clean:
	rm -f *.o $(EXE) core
