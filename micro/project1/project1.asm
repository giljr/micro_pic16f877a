;****************************** ATIVIDADE PRATICA I ***************************
;*******            PRATICA 1 - PISCA LED D6, LED D9 e LED D11           *****
;*****************************************************************************
; Descricao:
;   Esse codigo demonstra como piscar os LED D6, LED D9 e LED D11 em sequencia
; 
; Configuracao do teste:
;     MCU:             PIC16F877A
;                      http://www.microchip.com/wwwproducts/en/en010210

;     Ext. Modulo:     SIMULADOR KIT SENAI PIC 16 (Vers�o 3.3)
;                      
;      SW:             MPLAB IDE v7.00
;                      http://www.microchip.com/mplab/
; Autor:
; ****** RU 3326662 GILBERTO OLIVEIRA JUNIOR
; ****** CURSO: ENGENHARIA DA COMPUTACAO
; ****** ESCOLA SUPERIOR POLITECNICA UNINTER - BRAZIL 
; ****** Date : feb 2023 
;*********************  Defini��o do processador *****************************

	#include p16F877a.inc 
	__config _HS_OSC & _WDT_OFF & _LVP_OFF & _PWRTE_ON 

;************************** Mem�ria de programa ******************************
	ORG     0 			;Posiciona o ponteiro para o endere�o 0x0 de mem�ria

RESET 					;Bloco de RESET do microcontrolador
	NOP             
	GOTO   SETUP 		;Pula para o marcador SETUP
;***************************** Interrup��o **********************************
	ORG 4 
	
;*************************** Declara��o de vari�veis ******************************   
DELAY 	 EQU 0x20
VEZES 	 EQU 0x21
		
;*************************** Inicio do programa ***********************************

;*************************** Configura��es ****************************************
SETUP					;Bloco de configura��o do microcontrolador
	BSF     STATUS,RP0  ;Aciona o Bank1 de mem�ria
 	MOVLW   b'00000000' ;Carrega '00000000' no registrador W
 	MOVWF   TRISA       ;Configura PORTA como sa�da
 	MOVLW   b'00000000' ;Carrega '00000000' no registrador W
 	MOVWF   TRISD		;Configura o PORTD como sa�da       
 	BCF   	STATUS,RP0  ;Retorna para o Bank0 de mem�ria
 	BSF  	PORTA,5		;Coloca 5V, niv�l l�gico 1 no pino RA5 - Enable dos LEDs
;*************************** Programa principal **********************************
 
LOOP 					;Bloco do principal do programa         
	MOVLW b'00000001' 	;Carrega '00000001' no registrador W; acende LED D6 
	MOVWF PORTD			;Envia o conte�do de W para o registrador PORTD colocando  
						;n�vel logico alto (+5V) no pino 19 (RD0)do PORTD
	CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO; acende o LED D6
	MOVLW b'00000000' 	;Carrega '00000000' ou 0x00 no registrador W
	MOVWF PORTD			;Envia o conte�do de W para o registrador PORTD colocando  
						;n�vel logico baixo (0V) em todos os pinos do PORTD (RD7 -> RD0)
	CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados

	MOVLW b'00001000' 	;Carrega '00001000' no registrador W; acende LED D9
	MOVWF PORTD			;Envia o conte�do de W para o registrador PORTD colocando  
						;n�vel logico alto (+5V) no pino 22 (RD3)do PORTD
	CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds acesos

	MOVLW b'00000000' 	;Carrega '00000000' ou 0x00 no registrador W
	MOVWF PORTD			;Envia o conte�do de W para o registrador PORTD colocando  
						;n�vel logico baixo (0V) em todos os pinos do PORTD (RD7 -> RD0)
	CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados

	MOVLW b'00100000' 	;Carrega '00100000' no registrador W; acende LED D11
	MOVWF PORTD			;Envia o conte�do de W para o registrador PORTD colocando  
						;n�vel logico alto (+5V) no pino 28 (RD5)do PORTD
	CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds acesos

	MOVLW b'00000000' 	;Carrega '00000000' ou 0x00 no registrador W
	MOVWF PORTD			;Envia o conte�do de W para o registrador PORTD colocando  
						;n�vel logico baixo (0V) em todos os pinos do PORTD (RD7 -> RD0)
	CALL PERDE_TEMPO	;Chama o procedimento PERDE_TEMPO para poder visualizar os
						;leds apagados
	
	GOTO LOOP			;Manda o programa pular para o inicio do bloco LOOP
						;mantendo o programa em execu��o eterna

PERDE_TEMPO				;Procedimento que for�a o PIC a perder tempo(delay)
	MOVLW d'1' 		;Para gravar no PIC utilizar 80, no simulador SENAI use 1.
 	MOVWF VEZES
 	
LOOP_VEZES
 	MOVLW d'1' 		;Para gravar no PIC utilizar 255,  no simulador SENAI use 1.
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

	END					;Marcador de �ltima linha do programa
