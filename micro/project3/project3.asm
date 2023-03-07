;****************************** ATIVIDADE PRATICA III  ***********************
;*******  PRATICA 3 - CONTADOR A ATÉ F NO DISPLAY DE 7 SEGMENTOS     *********
;*****************************************************************************
; Descricao:
;   Esse codigo demonstra como contar de A - F no primeiro digito do  
;   Display 7-Segmentos, sequencialmente.
; Configuracao do teste:
;     MCU:             PIC16F877A
;                      http://www.microchip.com/wwwproducts/en/en010210

;     Ext. Modulo:     SIMULADOR KIT SENAI PIC 16 (Versão 3.3)
;                      
;      SW:             MPLAB IDE v7.00
;                      http://www.microchip.com/mplab/
; Autor:
; ****** RU 3326662 GILBERTO OLIVEIRA JUNIOR
; ****** CURSO: ENGENHARIA DA COMPUTACAO
; ****** ESCOLA SUPERIOR POLITECNICA UNINTER - BRAZIL 
; ****** Date : feb 2023 
;*********************  Definição do processador *****************************

	#include p16F877a.inc 
	__config _HS_OSC & _WDT_OFF & _LVP_OFF & _PWRTE_ON 

;************************** Memória de programa ******************************
	ORG     0 			;Posiciona o ponteiro para o endereço 0x0 de memória

RESET 					;Bloco de RESET do microcontrolador
	NOP             
	GOTO   SETUP 		;Pula para o marcador SETUP
;***************************** Interrupção **********************************
	ORG 4 
	
;*************************** Declaração de variáveis ******************************   
DELAY 	 EQU 0x20
VEZES 	 EQU 0x21
		
;*************************** Inicio do programa ***********************************

;*************************** Configurações ****************************************
SETUP					;Bloco de configuração do microcontrolador
	BSF     STATUS,RP0  ;Aciona o Bank1 de memória
 	MOVLW   b'00000000' ;Carrega '00000000' no registrador W
 	MOVWF   TRISD       ;Configura PORTD como saída - Display de 7 Segmentos
 	MOVLW   b'00000000' ;Carrega '00000000' no registrador W
 	MOVWF   TRISE		;Configura o PORTE como saída       
 	BCF   	STATUS,RP0  ;Retorna para o Bank0 de memória
 	BSF  	PORTE,0		;Coloca 5V, nivél lógico 1 no pino RE0
                        ;Enable do ultimo Display de 7 Segmentos

;*************************** Programa principal **********************************
 
LOOP 					;Bloco do principal do programa         
	MOVLW b'00111111' 	;Carrega '00111111' no registrador W para formar o numero 0 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'00000110' 	;Carrega '01011011' no registrador W para formar o numero 1 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01011011' 	;Carrega '01011011' no registrador W para formar o numero 2 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01001111' 	;Carrega '01011011' no registrador W para formar o numero 3 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01100110' 	;Carrega '01100110' no registrador W para formar o numero 4 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01101101' 	;Carrega '01101101' no registrador W para formar o numero 5 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01111101' 	;Carrega '01111101' no registrador W para formar o numero 6 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'00000111' 	;Carrega '00000111' no registrador W para formar o numero 7 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01111111' 	;Carrega '01111111' no registrador W para formar o numero 8 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01101111' 	;Carrega '01101111' no registrador W para formar o numero 9 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01110111' 	;Carrega '01110111' no registrador W para formar o numero A no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01111100' 	;Carrega '01111100' no registrador W para formar o numero B no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'00111001' 	;Carrega '00111001' no registrador W para formar o numero C no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01011110' 	;Carrega '01011110' no registrador W para formar o numero D no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01111001' 	;Carrega '01111001' no registrador W para formar o numero E no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	MOVLW b'01110001' 	;Carrega '01110001' no registrador W para formar o numero F no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
    CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	GOTO LOOP			;Manda o programa pular para o inicio do bloco LOOP
						;mantendo o programa em execução eterna

;*************************** Rotina Delay **********************************
PERDE_TEMPO				;Procedimento que força o PIC a perder tempo(delay)
	MOVLW d'10' 		;Para gravar no PIC utilizar 80, no simulador SENAI use 1.
 	MOVWF VEZES
 	
LOOP_VEZES
 	MOVLW d'10' 		;Para gravar no PIC utilizar 255,  no simulador SENAI use 1.
	MOVWF DELAY 
	CALL DELAY_US 
	DECFSZ VEZES,5 
	GOTO LOOP_VEZES 
	RETURN
 
DELAY_US 
	NOP
	NOP 
	DECFSZ DELAY,1 
	GOTO DELAY_US 
	RETURN 

	END					;Marcador de última linha do programa
