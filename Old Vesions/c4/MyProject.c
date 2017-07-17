//line follower 1.                                 0
//Muhammad_Khodeer.
//10_2014.

//---------------------------------------------------------------Driver  -------------------------------->
//Inputs
//------ PORT--------->
sbit LDR_L1 at portA.b2;  // left sensor 1 at pin A2
sbit LDR_L2 at portA.b3;  // left sensor 2 at pin A3
sbit LDR_R1 at portA.b1;  // right sensor 1 at pin A1
sbit LDR_R2 at portA.b0;  // right sensor 2 at pin A0
//------ TRIS --------->
sbit LDR_L1_dir at trisA.b2;
sbit LDR_L2_dir at trisA.b3;
sbit LDR_R1_dir at trisA.b1;
sbit LDR_R2_dir at trisA.b0;
//Outputs .
//------ PORT--------->
sbit MotorL at portB.b1;    //the left motor at pin b1
sbit MotorR at portB.b2;    //the right motor at pin b2
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
int L = 0;
int R = 0;
//

//--------------------------------------------------------Main_Application.------------------------>
void main()
{
 ioConfiguration();
 initialValues();
 mainCode();
} // main application

//-----------------------------------------------------Firmware_(Functions).------------------------>
//---------------  ----------------->
void ioConfiguration(void)
{
 //make this pins as inputs
 LDR_L1_dir = in;
 LDR_L2_dir = in;
 LDR_R1_dir = in;
 LDR_R2_dir = in;
 //make this pins as outputs
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
 delay_ms(50);
}
//---------------  ----------------->
void leftCar (void)
{
 MotorL = off ;
 MotorR = on ;
 delay_ms(50);
 MotorL = off ;
 MotorR = off ;
 delay_ms(50);
}
//---------------  ----------------->
void rightCar (void)
{
 MotorL = on ;
 MotorR = off ;
 delay_ms(50);
 MotorL = off ;
 MotorR = off ;
 delay_ms(50);
}
//---------------  ----------------->

void stopCar (void)
{
 MotorL = off ;
 MotorR = off ;
 delay_ms(50);
}