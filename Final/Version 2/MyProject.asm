
_main:

;MyProject.c,55 :: 		void main()
;MyProject.c,58 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;MyProject.c,59 :: 		initialValues();
	CALL       _initialValues+0
;MyProject.c,60 :: 		trisa.b3 = out ;
	BCF        TRISA+0, 3
;MyProject.c,61 :: 		porta.b3 = on ;
	BSF        PORTA+0, 3
;MyProject.c,62 :: 		mainCode();
	CALL       _mainCode+0
;MyProject.c,63 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioConfiguration:

;MyProject.c,67 :: 		void ioConfiguration(void)
;MyProject.c,69 :: 		LDR_L1_dir = in;
	BSF        TRISB+0, 4
;MyProject.c,70 :: 		LDR_L2_dir = in;
	BSF        TRISB+0, 5
;MyProject.c,71 :: 		LDR_R1_dir = in;
	BSF        TRISB+0, 3
;MyProject.c,72 :: 		LDR_R2_dir = in;
	BSF        TRISB+0, 2
;MyProject.c,77 :: 		MotorL_dir = out;
	BCF        TRISB+0, 7
;MyProject.c,78 :: 		MotorR_dir = out;
	BCF        TRISB+0, 6
;MyProject.c,79 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_initialValues:

;MyProject.c,82 :: 		void initialValues(void)
;MyProject.c,84 :: 		stopCar (void) ;
	CALL       _stopCar+0
;MyProject.c,85 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_mainCode:

;MyProject.c,88 :: 		void mainCode (void)
;MyProject.c,90 :: 		while (1)
L_mainCode0:
;MyProject.c,92 :: 		L = 0 ;
	CLRF       _L+0
	CLRF       _L+1
;MyProject.c,93 :: 		R = 0 ;
	CLRF       _R+0
	CLRF       _R+1
;MyProject.c,97 :: 		if (LDR_L1 == black)
	BTFSC      PORTB+0, 4
	GOTO       L_mainCode2
;MyProject.c,99 :: 		L = 1;
	MOVLW      1
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;MyProject.c,100 :: 		}
L_mainCode2:
;MyProject.c,101 :: 		if (LDR_L2 == black)
	BTFSC      PORTB+0, 5
	GOTO       L_mainCode3
;MyProject.c,103 :: 		L = 2;
	MOVLW      2
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;MyProject.c,104 :: 		}
L_mainCode3:
;MyProject.c,105 :: 		if (LDR_R1 == black)
	BTFSC      PORTB+0, 3
	GOTO       L_mainCode4
;MyProject.c,107 :: 		R = 1;
	MOVLW      1
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;MyProject.c,108 :: 		}
L_mainCode4:
;MyProject.c,109 :: 		if (LDR_R2 == black)
	BTFSC      PORTB+0, 2
	GOTO       L_mainCode5
;MyProject.c,111 :: 		R = 2;
	MOVLW      2
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;MyProject.c,112 :: 		}
L_mainCode5:
;MyProject.c,114 :: 		if (L > R)
	MOVLW      128
	XORWF      _R+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _L+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode13
	MOVF       _L+0, 0
	SUBWF      _R+0, 0
L__mainCode13:
	BTFSC      STATUS+0, 0
	GOTO       L_mainCode6
;MyProject.c,116 :: 		leftCar(void);
	CALL       _leftCar+0
;MyProject.c,120 :: 		}
L_mainCode6:
;MyProject.c,121 :: 		if (R > L)
	MOVLW      128
	XORWF      _L+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _R+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode14
	MOVF       _R+0, 0
	SUBWF      _L+0, 0
L__mainCode14:
	BTFSC      STATUS+0, 0
	GOTO       L_mainCode7
;MyProject.c,123 :: 		rightCar(void);
	CALL       _rightCar+0
;MyProject.c,125 :: 		}
L_mainCode7:
;MyProject.c,126 :: 		if (R == L)
	MOVF       _R+1, 0
	XORWF      _L+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode15
	MOVF       _L+0, 0
	XORWF      _R+0, 0
L__mainCode15:
	BTFSS      STATUS+0, 2
	GOTO       L_mainCode8
;MyProject.c,128 :: 		followedCar(void);
	CALL       _followedCar+0
;MyProject.c,130 :: 		}
L_mainCode8:
;MyProject.c,131 :: 		}
	GOTO       L_mainCode0
;MyProject.c,132 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_followedCar:

;MyProject.c,137 :: 		void followedCar (void)
;MyProject.c,139 :: 		MotorR = on ;
	BSF        PORTB+0, 6
;MyProject.c,140 :: 		MotorL = on ;
	BSF        PORTB+0, 7
;MyProject.c,141 :: 		}
L_end_followedCar:
	RETURN
; end of _followedCar

_leftCar:

;MyProject.c,143 :: 		void leftCar (void)
;MyProject.c,145 :: 		MotorL = off ;
	BCF        PORTB+0, 7
;MyProject.c,146 :: 		MotorR = on ;
	BSF        PORTB+0, 6
;MyProject.c,147 :: 		}
L_end_leftCar:
	RETURN
; end of _leftCar

_rightCar:

;MyProject.c,149 :: 		void rightCar (void)
;MyProject.c,151 :: 		MotorL = on ;
	BSF        PORTB+0, 7
;MyProject.c,152 :: 		MotorR = off ;
	BCF        PORTB+0, 6
;MyProject.c,153 :: 		}
L_end_rightCar:
	RETURN
; end of _rightCar

_stopCar:

;MyProject.c,156 :: 		void stopCar (void)
;MyProject.c,158 :: 		MotorL = off ;
	BCF        PORTB+0, 7
;MyProject.c,159 :: 		MotorR = off ;
	BCF        PORTB+0, 6
;MyProject.c,160 :: 		}
L_end_stopCar:
	RETURN
; end of _stopCar
