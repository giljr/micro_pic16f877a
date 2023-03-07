;****************************** ATIVIDADE PRATICA II *************************
;*******            PRATICA 2 - ACENDER O DISPLAY DE 7 SEGMENTOS     *********
;*****************************************************************************
; Descricao:
;   Esse codigo demonstra como Acender o primeiro digito do  
;   Display 7-Segmentos para formar o numero 2, correspondende ao 
;   �ltimo d�gito do meu RU
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
 	MOVWF   TRISD       ;Configura PORTD como sa�da - Display de 7 Segmentos
 	MOVLW   b'00000000' ;Carrega '00000000' no registrador W
 	MOVWF   TRISE		;Configura o PORTE como sa�da       
 	BCF   	STATUS,RP0  ;Retorna para o Bank0 de mem�ria
 	BSF  	PORTE,0		;Coloca 5V, niv�l l�gico 1 no pino RE0
                        ;Enable do ultimo Display de 7 Segmentos

;*************************** Programa principal **********************************
 
LOOP 					;Bloco do principal do programa         
	MOVLW b'01011011' 	;Carrega '01011011' no registrador W para formar o numero 2 no 7SEGs
	MOVWF PORTD			;Envia o conte�do de W para o registrador PORTD colocando  
						;n�vel logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
	GOTO LOOP			;Manda o programa pular para o inicio do bloco LOOP
						;mantendo o programa em execu��o eterna
	END					;Marcador de �ltima linha do programa
