;;****************************** ATIVIDADE PRATICA IV **************************
;;******* PRATICA 4 - ACENDE LEDs D6, D8, D10 e D13 QUANDO PRESSIONA   BOTAO RB0
;;                    ACENDE LEDs D7, D9, D11 e D14 QUANDO LIBERA      BOTAO RB0 
;;******************************************************************************
;; Descricao:

;;   Esse codigo demonstra como acender os LED acima descritos ao 
;;   se pressionar ou nao o botao de interrupcao RB0.
;; 
;; Configuracao do teste:

;;     MCU:             PIC16F877A
;;                      http://www.microchip.com/wwwproducts/en/en010210
;
;;     Ext. Modulo:     SIMULADOR KIT SENAI PIC 16 (Vers�o 3.3)
;;                      https://github.com/LePoloni/Simulador-KIT-SENAI-PIC16
;;                      
;;      SW:             MPLAB IDE v7.00
;;                      http://www.microchip.com/mplab/
;; Autor:

;; ****** RU 3326662 GILBERTO OLIVEIRA JUNIOR
;; ****** CURSO: ENGENHARIA DA COMPUTACAO
;; ****** ESCOLA SUPERIOR POLITECNICA UNINTER - BRAZIL 
;; ****** Date : feb 2023 
;;********************* Defini��o do processador *******************************
;
	#include p16F877a.inc 
	__config _HS_OSC & _WDT_OFF & _LVP_OFF & _PWRTE_ON 
;
;;************************** Mem�ria de programa *******************************
	ORG     0 			;Posiciona o ponteiro para o endere�o 0x0 de mem�ria

	RESET 				;Bloco de RESET do microcontrolador
	NOP             
	GOTO   SETUP 		;Pula para o marcador SETUP
;;***************************** Interrup��o ************************************
	ORG 	4 
	
;;*************************** Declara��o de vari�veis ************************** 
	DELAY 	 EQU 0x20
	VEZES 	 EQU 0x21
		
;;*************************** Configura��es ************************************
SETUP					 ;Bloco de configura��o do microcontrolador
	BSF     STATUS,RP0   ;Aciona o Bank1 de mem�ria
 	MOVLW   b'00000000'  ;Carrega '00000000' no registrador W
 	MOVWF   TRISA        ;Configura PORTA como sa�da
 	MOVLW   b'00000000'  ;Carrega '00000000' no registrador W
 	MOVWF   TRISD		 ;Configura o PORTD como sa�da       
 	BCF   	STATUS,RP0   ;Retorna para o Bank0 de mem�ria
 	BSF  	PORTA,5		 ;Coloca 5V, nivel l�gico 1 no pino RA5; Enable dos LEDs	
 	BCF 	PORTB,0      ;Reseta o RB0, colocando-o como entrada do BOTAO 0
	
;;*************************** Programa principal ******************************* 
LOOP 					 ;Bloco do principal do programa  
	CLRF	PORTB		 ;Limpa o PORTB
	BTFSC	PORTB,0		 ;Testa se o botao RB0 esta pressionado (GND) 
	MOVLW 	b'10101010'  ;Sim, botao pressionado; acende os LEDS D7,D9,D11 e D14
	BTFSS	PORTB,0		 ;Testa se o botao RB0 nao esta pressionado (5V)
	MOVLW 	b'01010101'  ;Nao, botao nao esta pressionado;
						 ;acende os LEDS D6, D8, D10 e D13
    MOVWF 	PORTD		 ;Envia o conte�do de W para o registrador PORTD colocando  
						 ;n�vel logico alto (+5V) pinos correspondentes do PORTD	
	GOTO LOOP			 ;Manda o programa pular para o inicio do bloco LOOP
						 ;mantendo o programa em execu��o eterna

;;*************************** Rotinas de Delay  ********************************** 

PERDE_TEMPO				 ;Procedimento que for�a o PIC a perder tempo(delay)
	MOVLW d'1' 			 ;Para gravar no PIC utilizar 80(simulador SENAI use 1)
 	MOVWF VEZES
 	
LOOP_VEZES
 	MOVLW d'1' 			 ;Para gravar no PIC utilizar 255,(simulador SENAI use 1)
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

	END					 ;Marcador de �ltima linha do programa
