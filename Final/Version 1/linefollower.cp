#line 1 "E:/sc/linefollower/final/c/linefollower.c"







sbit LDR_R2 at portB.b2;
sbit LDR_R1 at portB.b3;
sbit LDR_L1 at portB.b4;
sbit LDR_L2 at portB.b5;



sbit LDR_R2_dir at trisB.b2;
sbit LDR_R1_dir at trisB.b3;
sbit LDR_L1_dir at trisB.b4;
sbit LDR_L2_dir at trisB.b5;




sbit MotorR at portA.b1;
sbit MotorL at portA.b2;


sbit MotorR_dir at trisA.b1;
sbit MotorL_dir at trisA.b2;
#line 40 "E:/sc/linefollower/final/c/linefollower.c"
void ioConfiguration(void) ;
void initialValues(void) ;
void mainCode (void);
void followedCar (void);
void leftCar (void);
void rightCar (void);
void stopCar (void);



int L = 0;
int R = 0;



void main()
{
 ioConfiguration();
 initialValues();
 mainCode();
}



void ioConfiguration(void)
{
 LDR_L1_dir =  1 ;
 LDR_L2_dir =  1 ;
 LDR_R1_dir =  1 ;
 LDR_R2_dir =  1 ;

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
 L = 0 ;
 R = 0 ;

 if (LDR_L1 ==  0 )
 {
 L = 1;
 }
 if (LDR_L2 ==  0 )
 {
 L = 2;
 }
 if (LDR_R1 ==  0 )
 {
 R = 1;
 }
 if (LDR_R2 ==  0 )
 {
 R = 2;
 }

 if (L > R)
 {
 leftCar(void);

 }
 if (R > L)
 {
 rightCar(void);

 }
 if (R == L)
 {
 followedCar(void);

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
