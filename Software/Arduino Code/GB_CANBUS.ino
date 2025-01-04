#include <SPI.h>
#include <mcp2515.h> //autowp MCP2515 Library

struct can_frame canMsg;
MCP2515 mcp2515(10); //CS Line on pin 10

void setup() 
{
  pinMode(14, OUTPUT);
  pinMode(15, OUTPUT);
  pinMode(16, OUTPUT);
  pinMode(17, OUTPUT);
  pinMode(18, OUTPUT);
  pinMode(19, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);

  mcp2515.reset();
  mcp2515.setBitrate(CAN_500KBPS, MCP_8MHZ); // change to MCP_16MHZ for prototype board
  mcp2515.setNormalMode();
}

byte MPH = 0;

void bitPrinter()
{
  for (int i = 14; i < 20; i++)
    {
     digitalWrite(i, bitRead(MPH, i-14));
    }

  digitalWrite(4, bitRead(MPH, 6));
  digitalWrite(5, bitRead(MPH, 7));
}


void loop() 
{
  
  if (mcp2515.readMessage(&canMsg) == MCP2515::ERROR_OK && (canMsg.can_id == 0xa0)) 
    {
      MPH = 0.62*(canMsg.data[4]);
      bitPrinter();
    }

}



