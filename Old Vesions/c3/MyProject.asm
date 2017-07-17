
_main:

;MyProject.c,50 :: 		void main()
;MyProject.c,52 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;MyProject.c,53 :: 		initialValues();
	CALL       _initialValues+0
;MyProject.c,54 :: 		mainCode();
	CALL       _mainCode+0
;MyProject.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioConfiguration:

;MyProject.c,59 :: 		void ioConfiguration(void)
;MyProject.c,61 :: 		LDR_L1_dir = in;
	BSF        TRISB+0, 1
;MyProject.c,62 :: 		LDR_L2_dir = in;
	BSF        TRISB+0, 2
;MyProject.c,63 :: 		LDR_R1_dir = in;
	BSF        TRISB+0, 3
;MyProject.c,64 :: 		LDR_R2_dir = in;
	BSF        TRISB+0, 4
;MyProject.c,66 :: 		MotorL_dir = out;
	BCF        TRISB+0, 5
;MyProject.c,67 :: 		MotorR_dir = out;
	BCF        TRISB+0, 6
;MyProject.c,68 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_initialValues:

;MyProject.c,71 :: 		void initialValues(void)
;MyProject.c,73 :: 		stopCar (void) ;
	CALL       _stopCar+0
;MyProject.c,74 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_mainCode:

;MyProject.c,77 :: 		void mainCode (void)
;MyProject.c,79 :: 		while (1)
L_mainCode0:
;MyProject.c,81 :: 		if (LDR_L1 == black)
	BTFSS      PORTB+0, 1
	GOTO       L_mainCode2
;MyProject.c,83 :: 		L = 1;
	MOVLW      1
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;MyProject.c,84 :: 		}
L_mainCode2:
;MyProject.c,85 :: 		if (LDR_L2 == black)
	BTFSS      PORTB+0, 2
	GOTO       L_mainCode3
;MyProject.c,87 :: 		L = 2;
	MOVLW      2
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;MyProject.c,88 :: 		}
L_mainCode3:
;MyProject.c,89 :: 		if (LDR_R1 == black)
	BTFSS      PORTB+0, 3
	GOTO       L_mainCode4
;MyProject.c,91 :: 		R = 1;
	MOVLW      1
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;MyProject.c,92 :: 		}
L_mainCode4:
;MyProject.c,93 :: 		if (LDR_R2 == black)
	BTFSS      PORTB+0, 4
	GOTO       L_mainCode5
;MyProject.c,95 :: 		R = 2;
	MOVLW      2
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;MyProject.c,96 :: 		}
L_mainCode5:
;MyProject.c,98 :: 		if (L > R)
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
;MyProject.c,100 :: 		leftCar(void);
	CALL       _leftCar+0
;MyProject.c,101 :: 		}
L_mainCode6:
;MyProject.c,102 :: 		if (R > L)
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
;MyProject.c,104 :: 		rightCar(void);
	CALL       _rightCar+0
;MyProject.c,105 :: 		}
L_mainCode7:
;MyProject.c,106 :: 		if (R == L)
	MOVF       _R+1, 0
	XORWF      _L+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode15
	MOVF       _L+0, 0
	XORWF      _R+0, 0
L__mainCode15:
	BTFSS      STATUS+0, 2
	GOTO       L_mainCode8
;MyProject.c,108 :: 		followedCar(void);
	CALL       _followedCar+0
;MyProject.c,109 :: 		}
L_mainCode8:
;MyProject.c,110 :: 		}
	GOTO       L_mainCode0
;MyProject.c,111 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_followedCar:

;MyProject.c,116 :: 		void followedCar (void)
;MyProject.c,118 :: 		MotorR = on ;
	BSF        PORTB+0, 6
;MyProject.c,119 :: 		MotorL = on ;
	BSF        PORTB+0, 5
;MyProject.c,120 :: 		}
L_end_followedCar:
	RETURN
; end of _followedCar

_leftCar:

;MyProject.c,122 :: 		void leftCar (void)
;MyProject.c,124 :: 		MotorL = off ;
	BCF        PORTB+0, 5
;MyProject.c,125 :: 		MotorR = on ;
	BSF        PORTB+0, 6
;MyProject.c,126 :: 		}
L_end_leftCar:
	RETURN
; end of _leftCar

_rightCar:

;MyProject.c,128 :: 		void rightCar (void)
;MyProject.c,130 :: 		MotorL = on ;
	BSF        PORTB+0, 5
;MyProject.c,131 :: 		MotorR = off ;
	BCF        PORTB+0, 6
;MyProject.c,132 :: 		}
L_end_rightCar:
	RETURN
; end of _rightCar

_stopCar:

;MyProject.c,135 :: 		void stopCar (void)
;MyProject.c,137 :: 		MotorL = off ;
	BCF        PORTB+0, 5
;MyProject.c,138 :: 		MotorR = off ;
	BCF        PORTB+0, 6
;MyProject.c,139 :: 		}
L_end_stopCar:
	RETURN
; end of _stopCar
