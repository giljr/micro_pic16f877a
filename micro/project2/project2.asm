;****************************** ATIVIDADE PRATICA II *************************
;*******            PRATICA 2 - ACENDER O DISPLAY DE 7 SEGMENTOS     *********
;*****************************************************************************
; Descricao:
;   Esse codigo demonstra como Acender o primeiro digito do  
;   Display 7-Segmentos para formar o numero 2, correspondende ao 
;   último dígito do meu RU
; 
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
	MOVLW b'01011011' 	;Carrega '01011011' no registrador W para formar o numero 2 no 7SEGs
	MOVWF PORTD			;Envia o conteúdo de W para o registrador PORTD colocando  
						;nível logico alto (+5V) os respectivos pinos do PORTD (RD7 -> RD0)
	GOTO LOOP			;Manda o programa pular para o inicio do bloco LOOP
						;mantendo o programa em execução eterna
	END					;Marcador de última linha do programa
