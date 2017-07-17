#line 1 "E:/sc/linefollower/c4/MyProject.c"







sbit LDR_L1 at portA.b2;
sbit LDR_L2 at portA.b3;
sbit LDR_R1 at portA.b1;
sbit LDR_R2 at portA.b0;

sbit LDR_L1_dir at trisA.b2;
sbit LDR_L2_dir at trisA.b3;
sbit LDR_R1_dir at trisA.b1;
sbit LDR_R2_dir at trisA.b0;


sbit MotorL at portB.b1;
sbit MotorR at portB.b2;

sbit MotorL_dir at trisB.b0;
sbit MotorR_dir at trisB.b1;
#line 35 "E:/sc/linefollower/c4/MyProject.c"
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
 delay_ms(50);
}

void leftCar (void)
{
 MotorL =  0  ;
 MotorR =  1  ;
 delay_ms(50);
 MotorL =  0  ;
 MotorR =  0  ;
 delay_ms(50);
}

void rightCar (void)
{
 MotorL =  1  ;
 MotorR =  0  ;
 delay_ms(50);
 MotorL =  0  ;
 MotorR =  0  ;
 delay_ms(50);
}


void stopCar (void)
{
 MotorL =  0  ;
 MotorR =  0  ;
 delay_ms(50);
}
