
_main:

;linefollower.c,55 :: 		void main()
;linefollower.c,57 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;linefollower.c,58 :: 		initialValues();
	CALL       _initialValues+0
;linefollower.c,59 :: 		mainCode();
	CALL       _mainCode+0
;linefollower.c,60 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioConfiguration:

;linefollower.c,64 :: 		void ioConfiguration(void)
;linefollower.c,66 :: 		LDR_L1_dir = in;
	BSF        TRISB+0, 4
;linefollower.c,67 :: 		LDR_L2_dir = in;
	BSF        TRISB+0, 5
;linefollower.c,68 :: 		LDR_R1_dir = in;
	BSF        TRISB+0, 3
;linefollower.c,69 :: 		LDR_R2_dir = in;
	BSF        TRISB+0, 2
;linefollower.c,71 :: 		MotorL_dir = out;
	BCF        TRISA+0, 2
;linefollower.c,72 :: 		MotorR_dir = out;
	BCF        TRISA+0, 1
;linefollower.c,73 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_initialValues:

;linefollower.c,76 :: 		void initialValues(void)
;linefollower.c,78 :: 		stopCar (void) ;
	CALL       _stopCar+0
;linefollower.c,79 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_mainCode:

;linefollower.c,82 :: 		void mainCode (void)
;linefollower.c,84 :: 		while (1)
L_mainCode0:
;linefollower.c,86 :: 		L = 0 ;
	CLRF       _L+0
	CLRF       _L+1
;linefollower.c,87 :: 		R = 0 ;
	CLRF       _R+0
	CLRF       _R+1
;linefollower.c,89 :: 		if (LDR_L1 == black)
	BTFSC      PORTB+0, 4
	GOTO       L_mainCode2
;linefollower.c,91 :: 		L = 1;
	MOVLW      1
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;linefollower.c,92 :: 		}
L_mainCode2:
;linefollower.c,93 :: 		if (LDR_L2 == black)
	BTFSC      PORTB+0, 5
	GOTO       L_mainCode3
;linefollower.c,95 :: 		L = 2;
	MOVLW      2
	MOVWF      _L+0
	MOVLW      0
	MOVWF      _L+1
;linefollower.c,96 :: 		}
L_mainCode3:
;linefollower.c,97 :: 		if (LDR_R1 == black)
	BTFSC      PORTB+0, 3
	GOTO       L_mainCode4
;linefollower.c,99 :: 		R = 1;
	MOVLW      1
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;linefollower.c,100 :: 		}
L_mainCode4:
;linefollower.c,101 :: 		if (LDR_R2 == black)
	BTFSC      PORTB+0, 2
	GOTO       L_mainCode5
;linefollower.c,103 :: 		R = 2;
	MOVLW      2
	MOVWF      _R+0
	MOVLW      0
	MOVWF      _R+1
;linefollower.c,104 :: 		}
L_mainCode5:
;linefollower.c,106 :: 		if (L > R)
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
;linefollower.c,108 :: 		leftCar(void);
	CALL       _leftCar+0
;linefollower.c,110 :: 		}
L_mainCode6:
;linefollower.c,111 :: 		if (R > L)
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
;linefollower.c,113 :: 		rightCar(void);
	CALL       _rightCar+0
;linefollower.c,115 :: 		}
L_mainCode7:
;linefollower.c,116 :: 		if (R == L)
	MOVF       _R+1, 0
	XORWF      _L+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mainCode15
	MOVF       _L+0, 0
	XORWF      _R+0, 0
L__mainCode15:
	BTFSS      STATUS+0, 2
	GOTO       L_mainCode8
;linefollower.c,118 :: 		followedCar(void);
	CALL       _followedCar+0
;linefollower.c,120 :: 		}
L_mainCode8:
;linefollower.c,121 :: 		}
	GOTO       L_mainCode0
;linefollower.c,122 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_followedCar:

;linefollower.c,127 :: 		void followedCar (void)
;linefollower.c,129 :: 		MotorR = on ;
	BSF        PORTA+0, 1
;linefollower.c,130 :: 		MotorL = on ;
	BSF        PORTA+0, 2
;linefollower.c,131 :: 		}
L_end_followedCar:
	RETURN
; end of _followedCar

_leftCar:

;linefollower.c,133 :: 		void leftCar (void)
;linefollower.c,135 :: 		MotorL = off ;
	BCF        PORTA+0, 2
;linefollower.c,136 :: 		MotorR = on ;
	BSF        PORTA+0, 1
;linefollower.c,137 :: 		}
L_end_leftCar:
	RETURN
; end of _leftCar

_rightCar:

;linefollower.c,139 :: 		void rightCar (void)
;linefollower.c,141 :: 		MotorL = on ;
	BSF        PORTA+0, 2
;linefollower.c,142 :: 		MotorR = off ;
	BCF        PORTA+0, 1
;linefollower.c,143 :: 		}
L_end_rightCar:
	RETURN
; end of _rightCar

_stopCar:

;linefollower.c,146 :: 		void stopCar (void)
;linefollower.c,148 :: 		MotorL = off ;
	BCF        PORTA+0, 2
;linefollower.c,149 :: 		MotorR = off ;
	BCF        PORTA+0, 1
;linefollower.c,150 :: 		}
L_end_stopCar:
	RETURN
; end of _stopCar
