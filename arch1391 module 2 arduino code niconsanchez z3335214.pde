//Processing Code for Window Control with Kinect
//This code starts the servo movement
//Use this code, then run the processing code to control servo direction
//referenced from http://www.arduino.cc/playground/Learning/SingleServoExample
//adjusted to suit my project
//edited by Nicon Sanchez z3335214


#include <Servo.h>

Servo servo1;


void setup() {

  pinMode(2,OUTPUT);
  servo1.attach(14);           //analog pin 0
  servo1.write (180);

  Serial.begin(9600);          //serial port
  Serial.println("Ready");

}

void loop() {

  static int v = 0;

  if ( Serial.available()) {
    char ch = Serial.read();

    switch(ch) {
      case '0'...'9':
        v = v * 10 + ch - '0';
        break;
      case 's':
        servo1.write(v);
        v = 0;
        break;
    }
  }



} 
