//Processing Code for Window Control with Kinect
//This code controls the window to roll up or down
//referenced from http://www.arduino.cc/playground/Learning/SingleServoExample
//adjusted to suit my project
//edited by Nicon Sanchez z3335214


import processing.serial.*;        
boolean debug = true;         //Provide feedback


int squareLeft = 150;         //makes the servo go on way
int squareRight = 150;        //makes servo go the other way
int squareOff = 50;           //stops servo from moving
int spos= 90;                 //servo position
Serial port;                  // the serial port



void setup() 
{
  
  size(800, 600);           //size of the processing window
  noStroke();
  rectMode(CENTER);
  frameRate(100);
  port = new Serial(this, Serial.list()[1], 9600);   
  
}


void draw() 
{
  
 
  
  colorMode(RGB, 100);
  background(0.0);
  update(mouseX);                 //tracks the mouse position
  
  fill (204, 102, 0);             //displays the "up" side of sketch
  rect(100, 300, 600, 700); 
  
  fill (150, 50, 0);              //displays the "down" side of sketch
  rect(700, 300, 600, 700);
  
  fill(0);                        //displays the "off" button in the middle of sketch
  rect(375, 500, 100, 1000);
 

  line(width/2,0,width/2,height);  //text settings
  textSize(35);
 
  textAlign(CENTER);               //OFF
  fill(180, 0, 0);
  text("OFF",375,300); 

  textAlign(LEFT);                //CURTAIN DOWN
  fill(0, 10, 150);
  text("CURTAIN DOWN" ,450,350); 
  
  textAlign(RIGHT);                //CURTAIN UP
  fill(0, 10, 180);
  text("CURTAIN UP",300,250); 
   
}



void update(int x)              //this update is what controls the servo to move up or down
{
                                //Calculate servo postion from mouseX
  spos= x/4;                    //divides the window into 2 sections making it like a switch

                                //Output the servo position ( from 0 to 180)
  port.write("s"+spos);         //changes the direction of the servo


}


