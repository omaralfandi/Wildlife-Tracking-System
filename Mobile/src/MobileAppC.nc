#include "Msg.h"
#define NEW_PRINTF_SEMANTICS
#include "printf.h"

configuration MobileAppC {
}

implementation {
  components SerialPrintfC;
  components MainC;  
  components new AMSenderC(AM_RSSIMSG);
  components new AMReceiverC(AM_RSSIMSG);
  components new TimerMilliC() as Timer1;
  components new TimerMilliC() as Timer2;
  components ActiveMessageC;
  components MobileC as App;
  components RandomC;
  
  App.RadioControl -> ActiveMessageC;
  App.Boot -> MainC.Boot;
  App.Timer1 -> Timer1;
  App.Timer2 -> Timer2;
  
  App.Receive -> AMReceiverC;
  App.AMSend -> AMSenderC;
  App.AMPacket -> AMSenderC;
  App.Packet -> AMSenderC;
 
  App.Random -> RandomC;
}
