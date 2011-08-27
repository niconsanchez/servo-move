// controls the servo via mouseover

// Use the included processing code serial library
import processing.serial.*;        


int gx = 15;
int gy = 35;
int spos=90;

float leftColor = 0.0;
float rightColor = 0.0;



void setup() 
{
  size(500, 500);
  colorMode(RGB, 5.0);
  noStroke();
  rectMode(CENTER);
  frameRate(100);



void draw() 
{
  background(0.0);
  update(mouseX); 
  fill(mouseX/4); 
  rect(100, 200, gx*2, gx*2); 
  fill(180 - (mouseX/4)); 
  rect(100, 200, gy*2, gy*2);
}

void update(int x) 
{
  //Calculate servo postion from mouseX
  spos= x/4;

  //Output the servo position ( from 0 to 180)
  port.write("s"+spos); 



}

