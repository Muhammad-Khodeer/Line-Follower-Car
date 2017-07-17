//line follower 1.
//I-learn.
//10_2014.

//---------------------------------------------------------------Driver  -------------------------------->
//Inputs
//------ PORT--------->
sbit LDR_R2 at portB.b2;  //pin 8
sbit LDR_R1 at portB.b3;  //pin 9
sbit LDR_L1 at portB.b4;  //pin 10
sbit LDR_L2 at portB.b5;  //pin 11


//------ TRIS --------->
sbit LDR_R2_dir at trisB.b2;  //pin 8
sbit LDR_R1_dir at trisB.b3;  //pin 9
sbit LDR_L1_dir at trisB.b4;  //pin 10
sbit LDR_L2_dir at trisB.b5;  //pin 11


//Outputs .
//------ PORT--------->
sbit MotorR at portb.b6; //pin 18
sbit MotorL at portb.b7; //pin 1

//------ TRIS --------->
sbit MotorR_dir at trisb.b6;  //pin 18
sbit MotorL_dir at trisb.b7;  //pin 1

//The_Dictionary.
#define in 1
#define out 0
#define pushed 1
#define off 0
#define on 1
#define white 1   // logic 1 from sensor .. case white
#define black 0   // logic 0 from sensor .. case black

//function_Prototypes.
void ioConfiguration(void) ;
void initialValues(void) ;
void mainCode (void);
void followedCar (void);
void leftCar (void);
void rightCar (void);
void stopCar (void);

///////////////////////////////////
//Variables.
int L = 0;
int R = 0;
//none

//--------------------------------------------------------Main_Application.------------------------>
void main()
{

 ioConfiguration();
 initialValues();
 mainCode();
}

//-----------------------------------------------------Firmware_(Functions).------------------------>
//---------------  ----------------->
void ioConfiguration(void)
{
 LDR_L1_dir = in;
 LDR_L2_dir = in;
 LDR_R1_dir = in;
 LDR_R2_dir = in;
 
 


 MotorL_dir = out;
 MotorR_dir = out;
}

//---------------  ----------------->
void initialValues(void)
{
 stopCar (void) ;
}

//---------------  ----------------->
void mainCode (void)
{
  while (1)
 {
          L = 0 ;
          R = 0 ;



          if (LDR_L1 == black)
          {
                  L = 1;
          }
          if (LDR_L2 == black)
          {
                  L = 2;
          }
          if (LDR_R1 == black)
          {
                  R = 1;
          }
          if (LDR_R2 == black)
          {
                  R = 2;
          }
          ///////////////////////////
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
 //>------------------------------------------------------->
//--------------------------------------------------------- Motor Functions  ------>

//---------------  ----------------->
void followedCar (void)
{
 MotorR = on ;
 MotorL = on ;
}
//---------------  ----------------->
void leftCar (void)
{
 MotorL = off ;
 MotorR = on ;
}
//---------------  ----------------->
void rightCar (void)
{
 MotorL = on ;
 MotorR = off ;
}
//---------------  ----------------->

void stopCar (void)
{
 MotorL = off ;
 MotorR = off ;
}