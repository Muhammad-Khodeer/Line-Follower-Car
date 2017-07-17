
_main:

;MyProject.c,50 :: 		void main()
;MyProject.c,52 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;MyProject.c,53 :: 		initialValues();
	CALL       _initialValues+0
;MyProject.c,54 :: 		mainCode();
	CALL       _mainCode+0
;MyProject.c,55 :: 		} // main application
L_end_main:
	GOTO       $+0
; end of _main

_ioConfiguration:

;MyProject.c,59 :: 		void ioConfiguration(void)
;MyProject.c,62 :: 		LDR_L1_dir = in;
	BSF        TRISA+0, 2
;MyProject.c,63 :: 		LDR_L2_dir = in;
	BSF        TRISA+0, 3
;MyProject.c,64 :: 		LDR_R1_dir = in;
	BSF        TRISA+0, 1
;MyProject.c,65 :: 		LDR_R2_dir = in;
	BSF        TRISA+0, 0
;MyProject.c,67 :: 		MotorL_dir = out;
	BCF        TRISB+0, 0
;MyProject.c,68 :: 		MotorR_dir = out;
	BCF        TRISB+0, 1
;MyProject.c,69 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_initialValues:

;MyProject.c,72 :: 		void initialValues(void)
;MyProject.c,74 :: 		stopCar (void) ;
	CALL       _stopCar+0
;MyProject.c,75 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_mainCode:

;MyProject.c,78 :: 		void mainCode (void)
;MyProject.c,80 :: 		while (1)
L_mainCode0:
;MyProject.c,82 :: 		if (LDR_L1 == black)
	BTFSS      PORTA+0, 2
	GOTO       L_mainCode2
;MyProject.c,84 :: 		L = 1;
	MOVLW      1
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;MyProject.c,85 :: 		}
L_mainCode2:
;MyProject.c,86 :: 		if (LDR_L2 == black)
	BTFSS      PORTA+0, 3
	GOTO       L_mainCode3
;MyProject.c,88 :: 		L = 2;
	MOVLW      2
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;MyProject.c,89 :: 		}
L_mainCode3:
;MyProject.c,90 :: 		if (LDR_R1 == black)
	BTFSS      PORTA+0, 1
	GOTO       L_mainCode4
;MyProject.c,92 :: 		R = 1;
	MOVLW      1
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;MyProject.c,93 :: 		}
L_mainCode4:
;MyProject.c,94 :: 		if (LDR_R2 == black)
	BTFSS      PORTA+0, 0
	GOTO       L_mainCode5
;MyProject.c,96 :: 		R = 2;
	MOVLW      2
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;MyProject.c,97 :: 		}
L_mainCode5:
;MyProject.c,99 :: 		if (L > R)
	MOVLW      128
	XORWF      _R+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _L+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode19
	MOVF       _L+0, 0
	SUBWF      _R+0, 0
L__mainCode19:
	BTFSC      STATUS+0, 0
	GOTO       L_mainCode6
;MyProject.c,101 :: 		leftCar(void);
	CALL       _leftCar+0
;MyProject.c,102 :: 		}
L_mainCode6:
;MyProject.c,103 :: 		if (R > L)
	MOVLW      128
	XORWF      _L+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _R+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode20
	MOVF       _R+0, 0
	SUBWF      _L+0, 0
L__mainCode20:
	BTFSC      STATUS+0, 0
	GOTO       L_mainCode7
;MyProject.c,105 :: 		rightCar(void);
	CALL       _rightCar+0
;MyProject.c,106 :: 		}
L_mainCode7:
;MyProject.c,107 :: 		if (R == L)
	MOVF       _R+1, 0
	XORWF      _L+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode21
	MOVF       _L+0, 0
	XORWF      _R+0, 0
L__mainCode21:
	BTFSS      STATUS+0, 2
	GOTO       L_mainCode8
;MyProject.c,109 :: 		followedCar(void);
	CALL       _followedCar+0
;MyProject.c,110 :: 		}
L_mainCode8:
;MyProject.c,111 :: 		}
	GOTO       L_mainCode0
;MyProject.c,112 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_followedCar:

;MyProject.c,117 :: 		void followedCar (void)
;MyProject.c,119 :: 		MotorR = on ;
	BSF        PORTB+0, 2
;MyProject.c,120 :: 		MotorL = on ;
	BSF        PORTB+0, 1
;MyProject.c,121 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_followedCar9:
	DECFSZ     R13+0, 1
	GOTO       L_followedCar9
	DECFSZ     R12+0, 1
	GOTO       L_followedCar9
	NOP
;MyProject.c,122 :: 		}
L_end_followedCar:
	RETURN
; end of _followedCar

_leftCar:

;MyProject.c,124 :: 		void leftCar (void)
;MyProject.c,126 :: 		MotorL = off ;
	BCF        PORTB+0, 1
;MyProject.c,127 :: 		MotorR = on ;
	BSF        PORTB+0, 2
;MyProject.c,128 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_leftCar10:
	DECFSZ     R13+0, 1
	GOTO       L_leftCar10
	DECFSZ     R12+0, 1
	GOTO       L_leftCar10
	NOP
;MyProject.c,129 :: 		MotorL = off ;
	BCF        PORTB+0, 1
;MyProject.c,130 :: 		MotorR = off ;
	BCF        PORTB+0, 2
;MyProject.c,131 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_leftCar11:
	DECFSZ     R13+0, 1
	GOTO       L_leftCar11
	DECFSZ     R12+0, 1
	GOTO       L_leftCar11
	NOP
;MyProject.c,132 :: 		}
L_end_leftCar:
	RETURN
; end of _leftCar

_rightCar:

;MyProject.c,134 :: 		void rightCar (void)
;MyProject.c,136 :: 		MotorL = on ;
	BSF        PORTB+0, 1
;MyProject.c,137 :: 		MotorR = off ;
	BCF        PORTB+0, 2
;MyProject.c,138 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_rightCar12:
	DECFSZ     R13+0, 1
	GOTO       L_rightCar12
	DECFSZ     R12+0, 1
	GOTO       L_rightCar12
	NOP
;MyProject.c,139 :: 		MotorL = off ;
	BCF        PORTB+0, 1
;MyProject.c,140 :: 		MotorR = off ;
	BCF        PORTB+0, 2
;MyProject.c,141 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_rightCar13:
	DECFSZ     R13+0, 1
	GOTO       L_rightCar13
	DECFSZ     R12+0, 1
	GOTO       L_rightCar13
	NOP
;MyProject.c,142 :: 		}
L_end_rightCar:
	RETURN
; end of _rightCar

_stopCar:

;MyProject.c,145 :: 		void stopCar (void)
;MyProject.c,147 :: 		MotorL = off ;
	BCF        PORTB+0, 1
;MyProject.c,148 :: 		MotorR = off ;
	BCF        PORTB+0, 2
;MyProject.c,149 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_stopCar14:
	DECFSZ     R13+0, 1
	GOTO       L_stopCar14
	DECFSZ     R12+0, 1
	GOTO       L_stopCar14
	NOP
;MyProject.c,150 :: 		}
L_end_stopCar:
	RETURN
; end of _stopCar
