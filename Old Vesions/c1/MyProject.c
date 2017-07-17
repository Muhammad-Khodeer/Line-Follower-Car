//line follower 1.                                 0
//Muhammad_Khodeer.
//10_2014.

//---------------------------------------------------------------Driver  -------------------------------->
//Inputs
//------ PORT--------->
sbit LDR_L at portB.b7;
sbit LDR_R at portB.b6;
//------ TRIS --------->
sbit LDR_L_dir at trisB.b7;
sbit LDR_R_dir at trisB.b6;
//Outputs .
//------ PORT--------->
sbit MotorL at portB.b0;
sbit MotorR at portB.b1;
//------ TRIS --------->
sbit MotorL_dir at trisB.b0;
sbit MotorR_dir at trisB.b1;

//The_Dictionary.
#define in 1
#define out 0
#define pushed 1
#define off 0
#define on 1
#define white 0
#define black 1

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
 LDR_L_dir = in ;
 LDR_R_dir = in ;

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
    if ((LDR_L == white) &&  (LDR_R == white) )              //white on the two LDR
    {
      followedCar (void);
      while ( (LDR_L==white) &&  (LDR_R== white) ) ;
    }
    else if ((LDR_L == white) &&  (LDR_R == black) )        // go Right case
    {
      RightCar (void);
      while ( (LDR_L == white) &&  (LDR_R == black) ) ;
    }
    else if ((LDR_L == black) &&  (LDR_R == white) )         // go left  case
    {
      leftCar (void);
      while ( (LDR_L == black) &&  (LDR_R == white) ) ;
    }
    else if ((LDR_L == black) &&  (LDR_R == black) )          // stop case
    {
      StopCar (void);
      while ( (LDR_L == black) &&  (LDR_R == black) ) ;
    }
    // else >>>>>>>
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