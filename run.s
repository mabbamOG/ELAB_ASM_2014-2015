.section .data
.global buffer_clean
.global codice_errato
.global codice_pretty
.global codice_dinamico
.global codice_emergenza
.global codice_failure
.global inserire_totale
.global inserire_totale_err
.global inserire_filesx
.global inserire_filedx
.global inserire_file_err
.global inserire_totali_diversi
.global stampa_bias
.global stampa_remainder
.global stampa_enter

buffer_clean: .long 0	# to avoid buffer problems when reading
codice_errato: .ascii "Codice errato, inserire nuovamente il codice: \0"
codice_pretty: .ascii "\n*************************************\n\n\0"
codice_dinamico: .ascii "Modalità controllo dinamico inserita!\n\0"
codice_emergenza: .ascii "Modalità controllo emergenza inserita!\n\0"
codice_failure: .ascii "Failure controllo codice. Modalità safe inserita!\n\0"
inserire_totale: .ascii "    Inserire il numero totale dei passeggeri a bordo: \0"
inserire_totale_err: .ascii "===> ERRORE! Il numero massimo di passeggeri per l'aereo e' 180\n\0"
inserire_filesx: .ascii "    Inserire il numero totale passeggeri per le file A, B, C: \0"
inserire_filedx: .ascii "    Inserire il numero totale passeggeri per le file D, E, F: \0"
inserire_file_err: .ascii "===> ERRORE! Il numero massimo di passeggeri per un'ala e' 90 (30 per fila)\n\0"
inserire_totali_diversi: .ascii "===> ERRORE! Somma totali file diverso da totale passeggeri\n\0"
stampa_bias: .ascii "\nIl bias del flap 0 e': \0"#' +17 is number
stampa_remainder: .ascii ".5\0"
stampa_enter: .ascii "\n\0"

.section .text

.global _start
_start:
call check_ext_params           # calling function to check external parameters
#---------------------END
xorl %eax,%eax
xorl %ebx,%ebx
incl %eax
int $0x80
