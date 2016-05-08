# ELAB_ASM_2014-2015
il mio elaborato di assembly del corso di Architettura degli Elaboratori, anno 2014/2015, Universita' di Verona.

l'elenco dei file:
- `run.s` il main
- `safe_mode.s` `dynamic_mode.s` `emergency_mode.s` contengono le modalita' principali di esecuzione del programma, richieste dal proffe
- `itoa.s` e `atoi_3.s` servono per fare le conversioni da numeri a stringhe. atoi_3 ha un nome particolare perche' e' una funzione molto flessibile, ed e' la terza revisione di quella funzione nel mio codice ;)
- `recheck.s` `params_check.s` e`check_ext_params.s` servono per controllare il flusso dell'esecuzione e verificare che i valori letti seguano le specifiche
- `getch.s` `print_string.s` e `print_bias.s` sono funzioni di comodita' e mi sono servite per rendere piu' semplice la programmazione

Utilizzare il Makefile per la compilazione.
Compilatore `gas` linker `ld`.


_Per informazioni aggiuntive consultare [la mia relazione](RELAZIONE_ASM.pdf)_
