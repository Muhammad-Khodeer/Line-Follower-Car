
_main:

;MyProject.c,44 :: 		void main()
;MyProject.c,46 :: 		ioConfiguration();
	CALL       _ioConfiguration+0
;MyProject.c,47 :: 		initialValues();
	CALL       _initialValues+0
;MyProject.c,48 :: 		mainCode();
	CALL       _mainCode+0
;MyProject.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ioConfiguration:

;MyProject.c,53 :: 		void ioConfiguration(void)
;MyProject.c,55 :: 		LDR_L_dir = in ;
	BSF        TRISB+0, 7
;MyProject.c,56 :: 		LDR_R_dir = in ;
	BSF        TRISB+0, 6
;MyProject.c,58 :: 		MotorL_dir = out;
	BCF        TRISB+0, 0
;MyProject.c,59 :: 		MotorR_dir = out;
	BCF        TRISB+0, 1
;MyProject.c,60 :: 		}
L_end_ioConfiguration:
	RETURN
; end of _ioConfiguration

_initialValues:

;MyProject.c,63 :: 		void initialValues(void)
;MyProject.c,65 :: 		stopCar (void) ;
	CALL       _stopCar+0
;MyProject.c,66 :: 		}
L_end_initialValues:
	RETURN
; end of _initialValues

_mainCode:

;MyProject.c,69 :: 		void mainCode (void)
;MyProject.c,71 :: 		while (1)
L_mainCode0:
;MyProject.c,73 :: 		if ((LDR_L == white) &&  (LDR_R == white) )              //white on the two LDR
	BTFSC      PORTB+0, 7
	GOTO       L_mainCode4
	BTFSC      PORTB+0, 6
	GOTO       L_mainCode4
L__mainCode40:
;MyProject.c,75 :: 		followedCar (void);
	CALL       _followedCar+0
;MyProject.c,76 :: 		while ( (LDR_L==white) &&  (LDR_R== white) ) ;
L_mainCode5:
	BTFSC      PORTB+0, 7
	GOTO       L_mainCode6
	BTFSC      PORTB+0, 6
	GOTO       L_mainCode6
L__mainCode39:
	GOTO       L_mainCode5
L_mainCode6:
;MyProject.c,77 :: 		}
	GOTO       L_mainCode9
L_mainCode4:
;MyProject.c,78 :: 		else if ((LDR_L == white) &&  (LDR_R == black) )        // go Right case
	BTFSC      PORTB+0, 7
	GOTO       L_mainCode12
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode12
L__mainCode38:
;MyProject.c,80 :: 		RightCar (void);
	CALL       _rightCar+0
;MyProject.c,81 :: 		while ( (LDR_L == white) &&  (LDR_R == black) ) ;
L_mainCode13:
	BTFSC      PORTB+0, 7
	GOTO       L_mainCode14
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode14
L__mainCode37:
	GOTO       L_mainCode13
L_mainCode14:
;MyProject.c,82 :: 		}
	GOTO       L_mainCode17
L_mainCode12:
;MyProject.c,83 :: 		else if ((LDR_L == black) &&  (LDR_R == white) )         // go left  case
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode20
	BTFSC      PORTB+0, 6
	GOTO       L_mainCode20
L__mainCode36:
;MyProject.c,85 :: 		leftCar (void);
	CALL       _leftCar+0
;MyProject.c,86 :: 		while ( (LDR_L == black) &&  (LDR_R == white) ) ;
L_mainCode21:
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode22
	BTFSC      PORTB+0, 6
	GOTO       L_mainCode22
L__mainCode35:
	GOTO       L_mainCode21
L_mainCode22:
;MyProject.c,87 :: 		}
	GOTO       L_mainCode25
L_mainCode20:
;MyProject.c,88 :: 		else if ((LDR_L == black) &&  (LDR_R == black) )          // stop case
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode28
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode28
L__mainCode34:
;MyProject.c,90 :: 		StopCar (void);
	CALL       _stopCar+0
;MyProject.c,91 :: 		while ( (LDR_L == black) &&  (LDR_R == black) ) ;
L_mainCode29:
	BTFSS      PORTB+0, 7
	GOTO       L_mainCode30
	BTFSS      PORTB+0, 6
	GOTO       L_mainCode30
L__mainCode33:
	GOTO       L_mainCode29
L_mainCode30:
;MyProject.c,92 :: 		}
L_mainCode28:
L_mainCode25:
L_mainCode17:
L_mainCode9:
;MyProject.c,94 :: 		}
	GOTO       L_mainCode0
;MyProject.c,95 :: 		}
L_end_mainCode:
	RETURN
; end of _mainCode

_followedCar:

;MyProject.c,100 :: 		void followedCar (void)
;MyProject.c,102 :: 		MotorR = on ;
	BSF        PORTB+0, 1
;MyProject.c,103 :: 		MotorL = on ;
	BSF        PORTB+0, 0
;MyProject.c,104 :: 		}
L_end_followedCar:
	RETURN
; end of _followedCar

_leftCar:

;MyProject.c,106 :: 		void leftCar (void)
;MyProject.c,108 :: 		MotorL = off ;
	BCF        PORTB+0, 0
;MyProject.c,109 :: 		MotorR = on ;
	BSF        PORTB+0, 1
;MyProject.c,110 :: 		}
L_end_leftCar:
	RETURN
; end of _leftCar

_rightCar:

;MyProject.c,112 :: 		void rightCar (void)
;MyProject.c,114 :: 		MotorL = on ;
	BSF        PORTB+0, 0
;MyProject.c,115 :: 		MotorR = off ;
	BCF        PORTB+0, 1
;MyProject.c,116 :: 		}
L_end_rightCar:
	RETURN
; end of _rightCar

_stopCar:

;MyProject.c,119 :: 		void stopCar (void)
;MyProject.c,121 :: 		MotorL = off ;
	BCF        PORTB+0, 0
;MyProject.c,122 :: 		MotorR = off ;
	BCF        PORTB+0, 1
;MyProject.c,123 :: 		}
L_end_stopCar:
	RETURN
; end of _stopCar
