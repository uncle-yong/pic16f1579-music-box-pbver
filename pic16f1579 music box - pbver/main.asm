
_timer1interrupt:

;main.c,30 :: 		void timer1interrupt() iv 0x0004 ics ICS_AUTO {
;main.c,32 :: 		if(TRISB.TRISB5 == 0) {
	BTFSC      TRISB+0, 5
	GOTO       L_timer1interrupt0
;main.c,33 :: 		if(c1CapDischargeCount > c1CapDischargeMaxTime){
	MOVF       _c1CapDischargeCount+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__timer1interrupt41
	MOVF       _c1CapDischargeCount+0, 0
	SUBLW      150
L__timer1interrupt41:
	BTFSC      STATUS+0, 0
	GOTO       L_timer1interrupt1
;main.c,34 :: 		TRISB.TRISB5 = 1;
	BSF        TRISB+0, 5
;main.c,35 :: 		c1CapDischargeCount = 0;
	CLRF       _c1CapDischargeCount+0
	CLRF       _c1CapDischargeCount+1
;main.c,36 :: 		} else
	GOTO       L_timer1interrupt2
L_timer1interrupt1:
;main.c,37 :: 		c1CapDischargeCount++;
	INCF       _c1CapDischargeCount+0, 1
	BTFSC      STATUS+0, 2
	INCF       _c1CapDischargeCount+1, 1
L_timer1interrupt2:
;main.c,38 :: 		}
L_timer1interrupt0:
;main.c,40 :: 		if(TRISB.TRISB4 == 0) {
	BTFSC      TRISB+0, 4
	GOTO       L_timer1interrupt3
;main.c,41 :: 		if(c2CapDischargeCount > c2CapDischargeMaxTime){
	MOVF       _c2CapDischargeCount+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__timer1interrupt42
	MOVF       _c2CapDischargeCount+0, 0
	SUBLW      150
L__timer1interrupt42:
	BTFSC      STATUS+0, 0
	GOTO       L_timer1interrupt4
;main.c,42 :: 		TRISB.TRISB4 = 1;
	BSF        TRISB+0, 4
;main.c,43 :: 		c2CapDischargeCount = 0;
	CLRF       _c2CapDischargeCount+0
	CLRF       _c2CapDischargeCount+1
;main.c,44 :: 		} else
	GOTO       L_timer1interrupt5
L_timer1interrupt4:
;main.c,45 :: 		c2CapDischargeCount++;
	INCF       _c2CapDischargeCount+0, 1
	BTFSC      STATUS+0, 2
	INCF       _c2CapDischargeCount+1, 1
L_timer1interrupt5:
;main.c,46 :: 		}
L_timer1interrupt3:
;main.c,48 :: 		if(TRISC.TRISC2 == 0) {
	BTFSC      TRISC+0, 2
	GOTO       L_timer1interrupt6
;main.c,49 :: 		if(c3CapDischargeCount > c3CapDischargeMaxTime){
	MOVF       _c3CapDischargeCount+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__timer1interrupt43
	MOVF       _c3CapDischargeCount+0, 0
	SUBLW      150
L__timer1interrupt43:
	BTFSC      STATUS+0, 0
	GOTO       L_timer1interrupt7
;main.c,50 :: 		TRISC.TRISC2 = 1;
	BSF        TRISC+0, 2
;main.c,51 :: 		c3CapDischargeCount = 0;
	CLRF       _c3CapDischargeCount+0
	CLRF       _c3CapDischargeCount+1
;main.c,52 :: 		} else
	GOTO       L_timer1interrupt8
L_timer1interrupt7:
;main.c,53 :: 		c3CapDischargeCount++;
	INCF       _c3CapDischargeCount+0, 1
	BTFSC      STATUS+0, 2
	INCF       _c3CapDischargeCount+1, 1
L_timer1interrupt8:
;main.c,54 :: 		}
L_timer1interrupt6:
;main.c,56 :: 		if(time_play_count > time_play) {
	MOVF       _time_play_count+1, 0
	SUBWF      _time_play+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__timer1interrupt44
	MOVF       _time_play_count+0, 0
	SUBWF      _time_play+0, 0
L__timer1interrupt44:
	BTFSC      STATUS+0, 0
	GOTO       L_timer1interrupt9
;main.c,57 :: 		time_play_count = 0;
	CLRF       _time_play_count+0
	CLRF       _time_play_count+1
;main.c,58 :: 		isUpdateNote = 1;
	MOVLW      1
	MOVWF      _isUpdateNote+0
;main.c,60 :: 		}
	GOTO       L_timer1interrupt10
L_timer1interrupt9:
;main.c,62 :: 		time_play_count++;
	INCF       _time_play_count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _time_play_count+1, 1
L_timer1interrupt10:
;main.c,65 :: 		TMR1 = 64536;
	MOVLW      24
	MOVWF      TMR1+0
	MOVLW      252
	MOVWF      TMR1+1
;main.c,66 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;main.c,67 :: 		}
L_end_timer1interrupt:
L__timer1interrupt40:
	RETFIE     %s
; end of _timer1interrupt

_init:

;main.c,69 :: 		void init() {
;main.c,75 :: 		OSCCON.SPLLEN = 0; // disable Software PLL.
	BCF        OSCCON+0, 7
;main.c,76 :: 		OSCCON.IRCF3 = 1;  // 8mhz -> 32mhz if PLLx4 set.
	BSF        OSCCON+0, 6
;main.c,77 :: 		OSCCON.IRCF2 = 1;
	BSF        OSCCON+0, 5
;main.c,78 :: 		OSCCON.IRCF1 = 1;
	BSF        OSCCON+0, 4
;main.c,79 :: 		OSCCON.IRCF0 = 0;
	BCF        OSCCON+0, 3
;main.c,80 :: 		OSCCON.SCS1  = 0;  // system clock select: internal osc.
	BCF        OSCCON+0, 1
;main.c,81 :: 		OSCCON.SCS0  = 0;
	BCF        OSCCON+0, 0
;main.c,84 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;main.c,85 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;main.c,86 :: 		LATA = 0x00;
	CLRF       LATA+0
;main.c,87 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;main.c,88 :: 		LATB = 0x00;
	CLRF       LATB+0
;main.c,89 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;main.c,90 :: 		LATC = 0x00;
	CLRF       LATC+0
;main.c,92 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;main.c,93 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;main.c,94 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;main.c,96 :: 		INTCON = 0x00;
	CLRF       INTCON+0
;main.c,98 :: 		RC6PPS = 0b0101; // PWM3_out
	MOVLW      5
	MOVWF      RC6PPS+0
;main.c,99 :: 		RC7PPS = 0b0100; // PWM2_out
	MOVLW      4
	MOVWF      RC7PPS+0
;main.c,100 :: 		RB7PPS = 0b0011; // PWM1_out
	MOVLW      3
	MOVWF      RB7PPS+0
;main.c,101 :: 		}
L_end_init:
	RETURN
; end of _init

_init_timer1:

;main.c,103 :: 		void init_timer1() {
;main.c,105 :: 		T1CON = 0x00;
	CLRF       T1CON+0
;main.c,106 :: 		T1CON.T1CKPS0 = 1;     // 1:8 prescale value.
	BSF        T1CON+0, 4
;main.c,107 :: 		T1CON.T1CKPS1 = 1;
	BSF        T1CON+0, 5
;main.c,108 :: 		TMR1 = 64536;
	MOVLW      24
	MOVWF      TMR1+0
	MOVLW      252
	MOVWF      TMR1+1
;main.c,109 :: 		T1GCON = 0x00;
	CLRF       T1GCON+0
;main.c,110 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;main.c,111 :: 		}
L_end_init_timer1:
	RETURN
; end of _init_timer1

_init_intr:

;main.c,113 :: 		void init_intr() {
;main.c,115 :: 		PIR1 = 0x00;
	CLRF       PIR1+0
;main.c,116 :: 		PIE3 = 0x00;
	CLRF       PIE3+0
;main.c,117 :: 		PIE1.TMR1IE = 1;
	BSF        PIE1+0, 0
;main.c,118 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;main.c,119 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;main.c,120 :: 		}
L_end_init_intr:
	RETURN
; end of _init_intr

_init_pwm1:

;main.c,122 :: 		void init_pwm1() {
;main.c,124 :: 		PWM1CON = 0x00;
	CLRF       PWM1CON+0
;main.c,125 :: 		PWM1CON.PWM1POL = 0;
	BCF        PWM1CON+0, 4
;main.c,126 :: 		PWM1CON.PWM1OE = 1;
	BSF        PWM1CON+0, 6
;main.c,127 :: 		PWM1CON.PWM1EN = 0;
	BCF        PWM1CON+0, 7
;main.c,130 :: 		PWM1INTE = 0x00;
	CLRF       PWM1INTE+0
;main.c,133 :: 		PWM1CLKCON = 0x00;
	CLRF       PWM1CLKCON+0
;main.c,136 :: 		PWM1CLKCON.PWM1PS0 = 1;
	BSF        PWM1CLKCON+0, 4
;main.c,137 :: 		PWM1CLKCON.PWM1PS1 = 1;
	BSF        PWM1CLKCON+0, 5
;main.c,138 :: 		PWM1CLKCON.PWM1PS2 = 0;
	BCF        PWM1CLKCON+0, 6
;main.c,139 :: 		PWM1CLKCON.PWM1CS0 = 0;
	BCF        PWM1CLKCON+0, 0
;main.c,140 :: 		PWM1CLKCON.PWM1CS1 = 0;
	BCF        PWM1CLKCON+0, 1
;main.c,143 :: 		PWM1TMR = 0;
	CLRF       PWM1TMR+0
	CLRF       PWM1TMR+1
;main.c,146 :: 		PWM1PH = 0;
	CLRF       PWM1PH+0
	CLRF       PWM1PH+1
;main.c,149 :: 		PWM1PR = 5000;
	MOVLW      136
	MOVWF      PWM1PR+0
	MOVLW      19
	MOVWF      PWM1PR+1
;main.c,155 :: 		PWM1DC = 2500;
	MOVLW      196
	MOVWF      PWM1DC+0
	MOVLW      9
	MOVWF      PWM1DC+1
;main.c,157 :: 		PWM1LDCON.PWM1LD = 1;     // Load Buffer.
	BSF        PWM1LDCON+0, 7
;main.c,159 :: 		}
L_end_init_pwm1:
	RETURN
; end of _init_pwm1

_init_pwm2:

;main.c,161 :: 		void init_pwm2() {
;main.c,163 :: 		PWM2CON = 0x00;
	CLRF       PWM2CON+0
;main.c,164 :: 		PWM2CON.PWM2POL = 0;
	BCF        PWM2CON+0, 4
;main.c,165 :: 		PWM2CON.PWM2OE = 1;
	BSF        PWM2CON+0, 6
;main.c,166 :: 		PWM2CON.PWM2EN = 0;
	BCF        PWM2CON+0, 7
;main.c,169 :: 		PWM2INTE = 0x00;
	CLRF       PWM2INTE+0
;main.c,172 :: 		PWM2CLKCON = 0x00;
	CLRF       PWM2CLKCON+0
;main.c,175 :: 		PWM2CLKCON.PWM2PS0 = 1;
	BSF        PWM2CLKCON+0, 4
;main.c,176 :: 		PWM2CLKCON.PWM2PS1 = 1;
	BSF        PWM2CLKCON+0, 5
;main.c,177 :: 		PWM2CLKCON.PWM2PS2 = 0;
	BCF        PWM2CLKCON+0, 6
;main.c,178 :: 		PWM2CLKCON.PWM2CS0 = 0;
	BCF        PWM2CLKCON+0, 0
;main.c,179 :: 		PWM2CLKCON.PWM2CS1 = 0;
	BCF        PWM2CLKCON+0, 1
;main.c,182 :: 		PWM2TMR = 0;
	CLRF       PWM2TMR+0
	CLRF       PWM2TMR+1
;main.c,185 :: 		PWM2PH = 0;
	CLRF       PWM2PH+0
	CLRF       PWM2PH+1
;main.c,188 :: 		PWM2PR = 8000;
	MOVLW      64
	MOVWF      PWM2PR+0
	MOVLW      31
	MOVWF      PWM2PR+1
;main.c,194 :: 		PWM2DC = 4000;
	MOVLW      160
	MOVWF      PWM2DC+0
	MOVLW      15
	MOVWF      PWM2DC+1
;main.c,196 :: 		PWM2LDCON.PWM2LD = 1;     // Load Buffer.
	BSF        PWM2LDCON+0, 7
;main.c,198 :: 		}
L_end_init_pwm2:
	RETURN
; end of _init_pwm2

_init_pwm3:

;main.c,200 :: 		void init_pwm3() {
;main.c,202 :: 		PWM3CON = 0x00;
	CLRF       PWM3CON+0
;main.c,203 :: 		PWM3CON.PWM3POL = 0;
	BCF        PWM3CON+0, 4
;main.c,204 :: 		PWM3CON.PWM3OE = 1;
	BSF        PWM3CON+0, 6
;main.c,205 :: 		PWM3CON.PWM3EN = 0;
	BCF        PWM3CON+0, 7
;main.c,208 :: 		PWM3INTE = 0x00;
	CLRF       PWM3INTE+0
;main.c,211 :: 		PWM3CLKCON = 0x00;
	CLRF       PWM3CLKCON+0
;main.c,214 :: 		PWM3CLKCON.PWM3PS0 = 1;
	BSF        PWM3CLKCON+0, 4
;main.c,215 :: 		PWM3CLKCON.PWM3PS1 = 1;
	BSF        PWM3CLKCON+0, 5
;main.c,216 :: 		PWM3CLKCON.PWM3PS2 = 0;
	BCF        PWM3CLKCON+0, 6
;main.c,217 :: 		PWM3CLKCON.PWM3CS0 = 0;
	BCF        PWM3CLKCON+0, 0
;main.c,218 :: 		PWM3CLKCON.PWM3CS1 = 0;
	BCF        PWM3CLKCON+0, 1
;main.c,221 :: 		PWM3TMR = 0;
	CLRF       PWM3TMR+0
	CLRF       PWM3TMR+1
;main.c,224 :: 		PWM3PH = 0;
	CLRF       PWM3PH+0
	CLRF       PWM3PH+1
;main.c,227 :: 		PWM3PR = 2500;
	MOVLW      196
	MOVWF      PWM3PR+0
	MOVLW      9
	MOVWF      PWM3PR+1
;main.c,233 :: 		PWM3DC = 1250;
	MOVLW      226
	MOVWF      PWM3DC+0
	MOVLW      4
	MOVWF      PWM3DC+1
;main.c,235 :: 		PWM3LDCON.PWM3LD = 1;     // Load Buffer.
	BSF        PWM3LDCON+0, 7
;main.c,237 :: 		}
L_end_init_pwm3:
	RETURN
; end of _init_pwm3

_updateNote:

;main.c,242 :: 		void updateNote() {
;main.c,243 :: 		while(1) {
L_updateNote11:
;main.c,244 :: 		cmd = songData1[songIndex];
	MOVLW      _songData1+0
	ADDWF      _songIndex+0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_songData1+0)
	ADDWFC     _songIndex+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVF       R1, 0
	MOVWF      _cmd+0
;main.c,246 :: 		if(cmd < 0x80) {
	MOVLW      128
	SUBWF      R1, 0
	BTFSC      STATUS+0, 0
	GOTO       L_updateNote13
;main.c,247 :: 		time_play = ( (songData1[songIndex] << 8) | songData1[songIndex+1] );
	MOVLW      _songData1+0
	ADDWF      _songIndex+0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_songData1+0)
	ADDWFC     _songIndex+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVF       R1, 0
	MOVWF      _time_play+1
	CLRF       _time_play+0
	MOVLW      1
	ADDWF      _songIndex+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _songIndex+1, 0
	MOVWF      R1
	MOVLW      _songData1+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_songData1+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	IORWF       _time_play+0, 1
	MOVLW      0
	IORWF       _time_play+1, 1
;main.c,248 :: 		songIndex += 2;
	MOVLW      2
	ADDWF      _songIndex+0, 1
	MOVLW      0
	ADDWFC     _songIndex+1, 1
;main.c,249 :: 		break;
	GOTO       L_updateNote12
;main.c,250 :: 		}
L_updateNote13:
;main.c,252 :: 		opcode = cmd & 0xf0;
	MOVLW      240
	ANDWF      _cmd+0, 0
	MOVWF      R1
	MOVF       R1, 0
	MOVWF      _opcode+0
;main.c,253 :: 		chan   = cmd & 0x0f;
	MOVLW      15
	ANDWF      _cmd+0, 0
	MOVWF      _chan+0
;main.c,255 :: 		if(opcode == 0x80) {// stop note here!
	MOVF       R1, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L_updateNote14
;main.c,256 :: 		switch(chan) {
	GOTO       L_updateNote15
;main.c,258 :: 		case 0: PWM1CON.PWM1EN = 0;
L_updateNote17:
	BCF        PWM1CON+0, 7
;main.c,259 :: 		break;
	GOTO       L_updateNote16
;main.c,260 :: 		case 1: PWM2CON.PWM2EN = 0;
L_updateNote18:
	BCF        PWM2CON+0, 7
;main.c,261 :: 		break;
	GOTO       L_updateNote16
;main.c,262 :: 		case 2: PWM3CON.PWM3EN = 0;
L_updateNote19:
	BCF        PWM3CON+0, 7
;main.c,263 :: 		break;
	GOTO       L_updateNote16
;main.c,264 :: 		default:
L_updateNote20:
;main.c,265 :: 		break;
	GOTO       L_updateNote16
;main.c,266 :: 		}
L_updateNote15:
	MOVF       _chan+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_updateNote17
	MOVF       _chan+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_updateNote18
	MOVF       _chan+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_updateNote19
	GOTO       L_updateNote20
L_updateNote16:
;main.c,267 :: 		songIndex += 1;
	INCF       _songIndex+0, 1
	BTFSC      STATUS+0, 2
	INCF       _songIndex+1, 1
;main.c,269 :: 		}
	GOTO       L_updateNote21
L_updateNote14:
;main.c,270 :: 		else if(opcode == 0x90) { // play note here!
	MOVF       _opcode+0, 0
	XORLW      144
	BTFSS      STATUS+0, 2
	GOTO       L_updateNote22
;main.c,271 :: 		isUpdateNote = 1;
	MOVLW      1
	MOVWF      _isUpdateNote+0
;main.c,272 :: 		switch(chan) {
	GOTO       L_updateNote23
;main.c,274 :: 		case 0:
L_updateNote25:
;main.c,275 :: 		c1CapDischargeCount = 0;
	CLRF       _c1CapDischargeCount+0
	CLRF       _c1CapDischargeCount+1
;main.c,276 :: 		TRISB.TRISB5 = 0;
	BCF        TRISB+0, 5
;main.c,277 :: 		PWM1PR = tuningWords[songData1[songIndex+1]];
	MOVLW      1
	ADDWF      _songIndex+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _songIndex+1, 0
	MOVWF      R1
	MOVLW      _songData1+0
	ADDWF      R0, 0
	MOVWF      R6
	MOVLW      hi_addr(_songData1+0)
	ADDWFC     R1, 0
	MOVWF      R7
	MOVF       R6, 0
	MOVWF      FSR0L
	MOVF       R7, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVLW      _tuningWords+0
	MOVWF      R4
	MOVLW      hi_addr(_tuningWords+0)
	MOVWF      R5
	MOVF       R3, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R4, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     R5, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      PWM1PR+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      PWM1PR+1
;main.c,278 :: 		PWM1DC = tuningWords[songData1[songIndex+1]] >> 1;
	MOVF       R6, 0
	MOVWF      FSR0L
	MOVF       R7, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R4, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     R5, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R4
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      PWM1DC+0
	MOVF       R1, 0
	MOVWF      PWM1DC+1
;main.c,279 :: 		PWM1LDCON.PWM1LD = 1;     // Load Buffer.
	BSF        PWM1LDCON+0, 7
;main.c,280 :: 		PWM1CON.PWM1EN = 1;
	BSF        PWM1CON+0, 7
;main.c,281 :: 		break;
	GOTO       L_updateNote24
;main.c,282 :: 		case 1:
L_updateNote26:
;main.c,283 :: 		c2CapDischargeCount = 0;
	CLRF       _c2CapDischargeCount+0
	CLRF       _c2CapDischargeCount+1
;main.c,284 :: 		TRISB.TRISB4 = 0;
	BCF        TRISB+0, 4
;main.c,285 :: 		PWM2PR = tuningWords[songData1[songIndex+1]];
	MOVLW      1
	ADDWF      _songIndex+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _songIndex+1, 0
	MOVWF      R1
	MOVLW      _songData1+0
	ADDWF      R0, 0
	MOVWF      R6
	MOVLW      hi_addr(_songData1+0)
	ADDWFC     R1, 0
	MOVWF      R7
	MOVF       R6, 0
	MOVWF      FSR0L
	MOVF       R7, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVLW      _tuningWords+0
	MOVWF      R4
	MOVLW      hi_addr(_tuningWords+0)
	MOVWF      R5
	MOVF       R3, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R4, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     R5, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      PWM2PR+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      PWM2PR+1
;main.c,286 :: 		PWM2DC = tuningWords[songData1[songIndex+1]] >> 1;
	MOVF       R6, 0
	MOVWF      FSR0L
	MOVF       R7, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R4, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     R5, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R4
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      PWM2DC+0
	MOVF       R1, 0
	MOVWF      PWM2DC+1
;main.c,287 :: 		PWM2LDCON.PWM2LD = 1;     // Load Buffer.
	BSF        PWM2LDCON+0, 7
;main.c,288 :: 		PWM2CON.PWM2EN = 1;
	BSF        PWM2CON+0, 7
;main.c,289 :: 		break;
	GOTO       L_updateNote24
;main.c,290 :: 		case 2:
L_updateNote27:
;main.c,291 :: 		c3CapDischargeCount = 0;
	CLRF       _c3CapDischargeCount+0
	CLRF       _c3CapDischargeCount+1
;main.c,292 :: 		TRISC.TRISC2 = 0;
	BCF        TRISC+0, 2
;main.c,293 :: 		PWM3PR = tuningWords[songData1[songIndex+1]];
	MOVLW      1
	ADDWF      _songIndex+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _songIndex+1, 0
	MOVWF      R1
	MOVLW      _songData1+0
	ADDWF      R0, 0
	MOVWF      R6
	MOVLW      hi_addr(_songData1+0)
	ADDWFC     R1, 0
	MOVWF      R7
	MOVF       R6, 0
	MOVWF      FSR0L
	MOVF       R7, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVLW      _tuningWords+0
	MOVWF      R4
	MOVLW      hi_addr(_tuningWords+0)
	MOVWF      R5
	MOVF       R3, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R4, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     R5, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      PWM3PR+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      PWM3PR+1
;main.c,294 :: 		PWM3DC = tuningWords[songData1[songIndex+1]] >> 1;
	MOVF       R6, 0
	MOVWF      FSR0L
	MOVF       R7, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R4, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     R5, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R3
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R4
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      PWM3DC+0
	MOVF       R1, 0
	MOVWF      PWM3DC+1
;main.c,295 :: 		PWM3LDCON.PWM3LD = 1;     // Load Buffer.
	BSF        PWM3LDCON+0, 7
;main.c,296 :: 		PWM3CON.PWM3EN = 1;
	BSF        PWM3CON+0, 7
;main.c,297 :: 		break;
	GOTO       L_updateNote24
;main.c,298 :: 		default:
L_updateNote28:
;main.c,299 :: 		break;
	GOTO       L_updateNote24
;main.c,300 :: 		}
L_updateNote23:
	MOVF       _chan+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_updateNote25
	MOVF       _chan+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_updateNote26
	MOVF       _chan+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_updateNote27
	GOTO       L_updateNote28
L_updateNote24:
;main.c,301 :: 		songIndex += 2;
	MOVLW      2
	ADDWF      _songIndex+0, 1
	MOVLW      0
	ADDWFC     _songIndex+1, 1
;main.c,303 :: 		}
	GOTO       L_updateNote29
L_updateNote22:
;main.c,305 :: 		else if(opcode == 0xf0) {  // stop playing score!
	MOVF       _opcode+0, 0
	XORLW      240
	BTFSS      STATUS+0, 2
	GOTO       L_updateNote30
;main.c,306 :: 		isPlaying = 0;
	CLRF       _isPlaying+0
;main.c,307 :: 		break;
	GOTO       L_updateNote12
;main.c,308 :: 		}
L_updateNote30:
;main.c,310 :: 		else if(opcode == 0xe0) {  // start playing from beginning!
	MOVF       _opcode+0, 0
	XORLW      224
	BTFSS      STATUS+0, 2
	GOTO       L_updateNote32
;main.c,311 :: 		songIndex = 0;
	CLRF       _songIndex+0
	CLRF       _songIndex+1
;main.c,312 :: 		time_play_count = 0;
	CLRF       _time_play_count+0
	CLRF       _time_play_count+1
;main.c,313 :: 		time_play = 0;
	CLRF       _time_play+0
	CLRF       _time_play+1
;main.c,314 :: 		break;
	GOTO       L_updateNote12
;main.c,315 :: 		}
L_updateNote32:
L_updateNote29:
L_updateNote21:
;main.c,316 :: 		}
	GOTO       L_updateNote11
L_updateNote12:
;main.c,317 :: 		}
L_end_updateNote:
	RETURN
; end of _updateNote

_main:

;main.c,319 :: 		void main() {
;main.c,321 :: 		init();
	CALL       _init+0
;main.c,326 :: 		delay_ms(350);
	MOVLW      15
	MOVWF      R11
	MOVLW      53
	MOVWF      R12
	MOVLW      81
	MOVWF      R13
L_main33:
	DECFSZ     R13, 1
	GOTO       L_main33
	DECFSZ     R12, 1
	GOTO       L_main33
	DECFSZ     R11, 1
	GOTO       L_main33
;main.c,328 :: 		init_pwm1();
	CALL       _init_pwm1+0
;main.c,329 :: 		init_pwm2();
	CALL       _init_pwm2+0
;main.c,330 :: 		init_pwm3();
	CALL       _init_pwm3+0
;main.c,332 :: 		init_intr();
	CALL       _init_intr+0
;main.c,334 :: 		isPlaying = 1;
	MOVLW      1
	MOVWF      _isPlaying+0
;main.c,336 :: 		init_timer1();
	CALL       _init_timer1+0
;main.c,338 :: 		while(1) {
L_main34:
;main.c,342 :: 		if (isPlaying == 1)
	MOVF       _isPlaying+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main36
;main.c,344 :: 		if (isUpdateNote)
	MOVF       _isUpdateNote+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main37
;main.c,346 :: 		updateNote();
	CALL       _updateNote+0
;main.c,347 :: 		isUpdateNote = 0;
	CLRF       _isUpdateNote+0
;main.c,348 :: 		}
L_main37:
;main.c,349 :: 		}
	GOTO       L_main38
L_main36:
;main.c,352 :: 		PWM1CON.PWM1EN = 0;
	BCF        PWM1CON+0, 7
;main.c,353 :: 		PWM2CON.PWM2EN = 0;
	BCF        PWM2CON+0, 7
;main.c,354 :: 		PWM3CON.PWM3EN = 0;
	BCF        PWM3CON+0, 7
;main.c,355 :: 		}
L_main38:
;main.c,357 :: 		}
	GOTO       L_main34
;main.c,358 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
