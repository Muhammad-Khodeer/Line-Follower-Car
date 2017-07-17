#line 1 "E:/sc/linefollower/c3/MyProject.c"







sbit LDR_L1 at portb.b1;
sbit LDR_L2 at portb.b2;
sbit LDR_R1 at portb.b3;
sbit LDR_R2 at portb.b4;

sbit LDR_L1_dir at trisb.b1;
sbit LDR_L2_dir at trisb.b2;
sbit LDR_R1_dir at trisb.b3;
sbit LDR_R2_dir at trisb.b4;


sbit MotorL at portb.b5;
sbit MotorR at portb.b6;

sbit MotorL_dir at trisb.b5;
sbit MotorR_dir at trisb.b6;
#line 35 "E:/sc/linefollower/c3/MyProject.c"
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
 if (LDR_L1 ==  1 )
 {
 L = 1;
 }
 if (LDR_L2 ==  1 )
 {
 L = 2;
 }
 if (LDR_R1 ==  1 )
 {
 R = 1;
 }
 if (LDR_R2 ==  1 )
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
