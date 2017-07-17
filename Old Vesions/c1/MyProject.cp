#line 1 "E:/sc/linefollower/c1/MyProject.c"







sbit LDR_L at portB.b7;
sbit LDR_R at portB.b6;

sbit LDR_L_dir at trisB.b7;
sbit LDR_R_dir at trisB.b6;


sbit MotorL at portB.b0;
sbit MotorR at portB.b1;

sbit MotorL_dir at trisB.b0;
sbit MotorR_dir at trisB.b1;
#line 31 "E:/sc/linefollower/c1/MyProject.c"
void ioConfiguration(void) ;
void initialValues(void) ;
void mainCode (void);
void followedCar (void);
void leftCar (void);
void rightCar (void);
void stopCar (void);






void main()
{
 ioConfiguration();
 initialValues();
 mainCode();
}



void ioConfiguration(void)
{
 LDR_L_dir =  1  ;
 LDR_R_dir =  1  ;

 MotorL_dir =  0 ;
 MotorR_dir =  0 ;
}


void initialValues(void)
{
 stopCar (void) ;
}


void mainCode (void)
{
 while (1)
 {
 if ((LDR_L ==  0 ) && (LDR_R ==  0 ) )
 {
 followedCar (void);
 while ( (LDR_L== 0 ) && (LDR_R==  0 ) ) ;
 }
 else if ((LDR_L ==  0 ) && (LDR_R ==  1 ) )
 {
 RightCar (void);
 while ( (LDR_L ==  0 ) && (LDR_R ==  1 ) ) ;
 }
 else if ((LDR_L ==  1 ) && (LDR_R ==  0 ) )
 {
 leftCar (void);
 while ( (LDR_L ==  1 ) && (LDR_R ==  0 ) ) ;
 }
 else if ((LDR_L ==  1 ) && (LDR_R ==  1 ) )
 {
 StopCar (void);
 while ( (LDR_L ==  1 ) && (LDR_R ==  1 ) ) ;
 }

 }
}




void followedCar (void)
{
 MotorR =  1  ;
 MotorL =  1  ;
}

void leftCar (void)
{
 MotorL =  0  ;
 MotorR =  1  ;
}

void rightCar (void)
{
 MotorL =  1  ;
 MotorR =  0  ;
}


void stopCar (void)
{
 MotorL =  0  ;
 MotorR =  0  ;
}
