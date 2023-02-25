//+------------------------------------------------------------------+
//|                                                    CARA v6.3.mq4 |
//|                                                        Hyena Hut |
//+------------------------------------------------------------------+
#property copyright "JBlanked"
#property link      "jblankedonthisbeat@gmail.com"
#property strict
#property show_inputs

#include <CustomFunctionsFix.mqh>
#include <CARAComponents.mqh>

//+------------------------------------------------------------------+
//| Inputs                                                           |
//+------------------------------------------------------------------+
enum enOnOff
  {
   Off  = 0,   //Off
   On  = 1,  //On
  };
  
  

// input settings

extern   string         workSETTINGS      = "======= WORKING PAIRS ======";    //---------------
extern   string         WorkingPairs      = "US30,ETHUSD,BTCUSD,USDCAD,AUDJPY,XAUUSD"; //Only these pairs will be detected (can't change):
extern   string         WorkingPairs2     = "NAS100,GBPJPY,CADJPY,EURJPY,NZDJPY"; //Only these pairs will be detected pt.2 (can't change):

extern   string         SETTINGS          = "======= ORDER SETTINGS ======";    //---------------
enOnOff        autoDetect        = On;   // Trade correlations on/off
extern   bool           uselotsize        = false; // Use lot size?
extern   double         lotSize           = 0.01; // Lot size for each correlation
extern   bool           usepercentrisk    = true; // Split same risk as manaul trade? (won't work for Nas, U30, or Gold)

extern   string         OTHER             = "======= MAGIC NUMBER SETTINGS ======";    //---------------
input    int            magicnumbbb       = 480815;  //Magic Number
input    string         orderComment      = "CARA v6"; //Order Comment


int magicnumbbb1 = magicnumbbb + 1;
int magicnumbbb2 = magicnumbbb + 2;
int magicnumbbb3 = magicnumbbb + 3;
int magicnumbbb4 = magicnumbbb + 4;
int magicnumbbb5 = magicnumbbb + 5;
int magicnumbbb6 = magicnumbbb + 6;

int magicnumbbb7 = magicnumbbb + 7;
int magicnumbbb8 = magicnumbbb + 8;
int magicnumbbb9 = magicnumbbb + 9;

int magicnumbbb10 = magicnumbbb + 10;
int magicnumbbb11 = magicnumbbb + 11;
int magicnumbbb12 = magicnumbbb + 12;

int magicnumbbb13 = magicnumbbb + 13;
int magicnumbbb14 = magicnumbbb + 14;
int magicnumbbb15 = magicnumbbb + 15;

int magicnumbbb16 = magicnumbbb + 16;
int magicnumbbb17 = magicnumbbb + 17;
int magicnumbbb18 = magicnumbbb + 18;

int magicnumbbb19 = magicnumbbb + 19;
int magicnumbbb20 = magicnumbbb + 20;
int magicnumbbb21 = magicnumbbb + 21;





int orderID;

string             ownerComment      = "Hyena VIP: "; //Owner Comment




//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

JBlankedInitVIP(magicnumbbb,480815,"CARA v6");
JBlankedBranding("CARA v6",magicnumbbb,string(expiryDateVIP));
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
JBlankedDeinit();

   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+

void OnTick()
  {
  
  
  
CloseOrdersNew(false,int(""),GetUS30(),magicnumbbb,magicnumbbb1);
CloseOrdersNew(false,int(""),GetNAS100(),magicnumbbb2,magicnumbbb3);
CloseOrdersNew(false,int(""),currXAUUSD,magicnumbbb4,magicnumbbb5);
CloseOrdersNew(false,int(""),currUSDCAD,magicnumbbb6,magicnumbbb7);
CloseOrdersNew(false,int(""),currETHUSD,magicnumbbb8,magicnumbbb9);
CloseOrdersNew(false,int(""),currBTCUSD,magicnumbbb10,magicnumbbb11);
CloseOrdersNew(false,int(""),currAUDJPY,magicnumbbb12,magicnumbbb13);
CloseOrdersNew(false,int(""),currNZDJPY,magicnumbbb14,magicnumbbb15);
CloseOrdersNew(false,int(""),currEURJPY,magicnumbbb16,magicnumbbb17);
CloseOrdersNew(false,int(""),currGBPJPY,magicnumbbb18,magicnumbbb19);
CloseOrdersNew(false,int(""),currCADJPY,magicnumbbb20,magicnumbbb21);



if(uselotsize && !usepercentrisk)
{

if(autoDetect)
{

DetectOrders4(false,int(""),GetUS30(),lotSize,ownerComment,magicnumbbb,magicnumbbb1,currUSDJPY,currUSDCAD,currUSDCHF,currUSDMXN,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD);
DetectOrders4(false,int(""),GetNAS100(),lotSize,ownerComment,magicnumbbb2,magicnumbbb3,currUSDJPY,currUSDCAD,currUSDCHF,currUSDMXN,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD);

DetectOrders4(false,int(""),currXAUUSD,lotSize,ownerComment,magicnumbbb4,magicnumbbb5,currUSDJPY,currUSDCAD,currUSDCHF,currUSDMXN,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD);

if(!CheckIfOpenOrdersByMagicNB(magicnumbbb,ownerComment) && !CheckIfOpenOrdersByMagicNB(magicnumbbb1,ownerComment) && !CheckIfOpenOrdersByMagicNB(magicnumbbb2,ownerComment) && !CheckIfOpenOrdersByMagicNB(magicnumbbb3,ownerComment))
{
DetectOrders4(false,int(""),currUSDCAD,lotSize,ownerComment,magicnumbbb6,magicnumbbb7,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD,currUSDJPY,"x",currUSDCHF,currUSDMXN);
}
DetectOrdersSameTrend5(false,int(""),currETHUSD,lotSize,ownerComment,magicnumbbb8,magicnumbbb9,currBTCUSD,currLTCUSD,currBNBUSD,currDOGEUSD,currXRPUSD);
DetectOrdersSameTrend5(false,int(""),currBTCUSD,lotSize,ownerComment,magicnumbbb10,magicnumbbb11,currETHUSD,currLTCUSD,currBNBUSD,currDOGEUSD,currXRPUSD);

DetectOrders4(false,int(""),currAUDJPY,lotSize,ownerComment,magicnumbbb12,magicnumbbb13,currEURAUD,currGBPAUD,"x","x",currAUDUSD,currAUDCHF,currAUDCAD,currAUDNZD);
DetectOrders4(false,int(""),currNZDJPY,lotSize,ownerComment,magicnumbbb14,magicnumbbb15,currAUDNZD,currEURNZD,currGBPNZD,"x",currNZDCAD,currNZDCHF,currNZDUSD,"x");
DetectOrdersSameTrend5(false,int(""),currEURJPY,lotSize,ownerComment,magicnumbbb16,magicnumbbb17,currEURAUD,currEURCAD,currEURCHF,currEURGBP,currEURNZD);
DetectOrders4(false,int(""),currGBPJPY,lotSize,ownerComment,magicnumbbb18,magicnumbbb19,currEURGBP,"x","x","x",currGBPAUD,currGBPCAD,currGBPCHF,currGBPNZD);
DetectOrders4(false,int(""),currCADJPY,lotSize,ownerComment,magicnumbbb20,magicnumbbb21,currAUDCAD,currEURCAD,currGBPCAD,currNZDCAD,currCADCHF,"x","x","x");      
}
}



if(usepercentrisk && !uselotsize)
{

if(autoDetect)
{

DetectOrders4(false,int(""),GetUS30(),lotSize,ownerComment,magicnumbbb,magicnumbbb1,currUSDJPY,currUSDCAD,currUSDCHF,currUSDMXN,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD);
DetectOrders4(false,int(""),GetNAS100(),lotSize,ownerComment,magicnumbbb2,magicnumbbb3,currUSDJPY,currUSDCAD,currUSDCHF,currUSDMXN,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD);
DetectOrders4(false,int(""),currXAUUSD,lotSize,ownerComment,magicnumbbb4,magicnumbbb5,currUSDJPY,currUSDCAD,currUSDCHF,currUSDMXN,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD);
if(!CheckIfOpenOrdersByMagicNB(magicnumbbb,ownerComment) && !CheckIfOpenOrdersByMagicNB(magicnumbbb1,ownerComment) && !CheckIfOpenOrdersByMagicNB(magicnumbbb2,ownerComment) && !CheckIfOpenOrdersByMagicNB(magicnumbbb3,ownerComment))
{
DetectOrders4(false,int(""),currUSDCAD,OrderLots()/8,ownerComment,magicnumbbb6,magicnumbbb7,currAUDUSD,currEURUSD,currGBPUSD,currNZDUSD,currUSDJPY,"x",currUSDCHF,currUSDMXN);
}
DetectOrdersSameTrend5(false,int(""),currETHUSD,OrderLots()/5,ownerComment,magicnumbbb8,magicnumbbb9,currBTCUSD,currLTCUSD,currBNBUSD,currDOGEUSD,currXRPUSD);
DetectOrdersSameTrend5(false,int(""),currBTCUSD,OrderLots()/5,ownerComment,magicnumbbb10,magicnumbbb11,currETHUSD,currLTCUSD,currBNBUSD,currDOGEUSD,currXRPUSD);

DetectOrders4(false,int(""),currAUDJPY,OrderLots()/6,ownerComment,magicnumbbb12,magicnumbbb13,currEURAUD,currGBPAUD,"x","x",currAUDUSD,currAUDCHF,currAUDCAD,currAUDNZD);
DetectOrders4(false,int(""),currNZDJPY,OrderLots()/6,ownerComment,magicnumbbb14,magicnumbbb15,currAUDNZD,currEURNZD,currGBPNZD,"x",currNZDCAD,currNZDCHF,currNZDUSD,"x");
DetectOrdersSameTrend5(false,int(""),currEURJPY,OrderLots()/5,ownerComment,magicnumbbb16,magicnumbbb17,currEURAUD,currEURCAD,currEURCHF,currEURGBP,currEURNZD);
DetectOrders4(false,int(""),currGBPJPY,OrderLots()/5,ownerComment,magicnumbbb18,magicnumbbb19,currEURGBP,"x","x","x",currGBPAUD,currGBPCAD,currGBPCHF,currGBPNZD);
DetectOrders4(false,int(""),currCADJPY,OrderLots()/5,ownerComment,magicnumbbb20,magicnumbbb21,currAUDCAD,currEURCAD,currGBPCAD,currNZDCAD,currCADCHF,"x","x","x");      
}
}



  }


