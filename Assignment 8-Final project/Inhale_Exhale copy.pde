//Author :Veena
//Respiratory belt machine
//I have got most lines commented out


import processing.serial.*;
Serial myPort;        // The serial port
float xPos = .5;         // horizontal position of the graph
float inByte = 0; // mapping position


float[][] radii;
float nX, nY, yY; 
float masterX, masterY; // xPosition , yPosition on the screen
int models; //initializing models variable (animations it has to make in the whole sketch)
float nRadius, outRadius; //inner and outer radius of the drawing from the center
int degs; //initializing degree varaiable
float inBetween, totaldrawsketchs; // number of times it draws the sketch, inBetween starts from zero again
int circleNumber; // number of circle movements in the whole sketch

void setup() {
  
  size(1200, 600);//size of the canavas
  
  // print value in the serial port
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[7], 9600);
  myPort.bufferUntil('\n');
  
  degs=360; //rotation of the circle in 360
  nRadius=1.300; //inner radius of the circle
  outRadius=300;//outer radius size of the circle
  totaldrawsketchs=100; //number of times it draws the sketch
  background(#FFFFFF); //background color white
  models=500; //number of animation movements it makes
  radii = new float[models][degs]; //create new animations (movement in the visual) with 360 degree movement
  doSetupModels(); 
  masterX=0;//x position from the canvas where the sketch starts drawing
  masterY=height/2; //y position of height from the canvas where the sketch starts drawing
  strokeWeight(0.2); //size of the stroke
  fill(255, 4); // fill color
}
// number of animations it has to make in the sketch when radii is mapped to the z position
void doSetupModels() {
  for (int i=0;i<models;i++) {
    float[] ptLine = new float[degs];
    float zz=inByte; // mapping it into the incoming data from serial port
    radii[i]=doNewCircle(zz, zz-1); 
  }
}

void draw() {
  if (masterX>2100)//if x position is less than 20 it stops drawing
  {
    masterX=-225;// position of the x in the canvas
    circleNumber=5; // number of circles it draws along with the 360 degree drawing for the whole sketch
    inBetween=0; //values fromLow to toLow 
    noLoop(); // don't draw if it goes below O
  }
  if (inBetween<totaldrawsketchs && circleNumber+1<models) {
    float[] hybridCircle = new float[degs]; //draws a new circle before the animation
    hybridCircle=doInterpolate(radii[circleNumber], radii[circleNumber+1], inBetween/totaldrawsketchs); //starts the animation by first starting from a circle
    doSimpleOutline(hybridCircle); // starts as a simple outline
    inBetween++;
  } 
  else {
   if (circleNumber+1<models) {
   circleNumber++;
   inBetween=0;
    }
  }
}
   
 float[] doInterpolate(float[] cOne, float[] cTwo, float beFLEX) // mix circle and 360 angle animation lines together 
 {
   //function to draw inbetween two shapes
 float[] ptLine = new float[degs];
 for (int j=0; j<degs;j++) {
 ptLine[j]=coslerp(cOne[j], cTwo[j], beFLEX); // lerp(start, stop, amt)
 }
 return ptLine;
}
  //once in a while starts the sketch by drawing a circle first
  void doSimpleOutline(float[] myCircle) {
   masterX=masterX+0.3; // xpoition when it draws a circle
   doDrawCircle(int(masterX), int(masterY), myCircle);
   if (masterX > width) {
   masterX = 0;// xposition
  }
}
 //The lerp function is convenient for creating motion along a straight path 
 float coslerp(float val1, float val2, float amt) {
  amt = map (cos(amt*PI), 1.0, -1.0, 0, 1.0); //  amt parameter is the amount to interpolate between the two values where 0 equal to the first point,1.0 is very near the first point
  return lerp(val1, val2, amt); //lerp(start, stop, amt)
}


// draws stripes like drawing in the sketch
  void doStripes(int xPos, int yPos, float[] ptRad) 
  {  
     pushMatrix(); //makes the current transformation into a matrix stack (saves the current coordinate and create over it)
     translate(xPos, yPos); //function allows the sketch to transform x and y position
  // the function below overlaps all the lines drawn in the sketch
  for (int j=0;j<degs;j=j+1) { 
    float rj=radians(j); // initializing
    float xA=sin(rj)*ptRad[j]; //Xpos= sin value * radii of the lines drawn in the sketch
    float yA=cos(rj)*ptRad[j];// Ypos= cos value * radii of the lines drawn in the sketch
  }
  popMatrix(); //restores the current coordinate system
}

// draw the sketch with respect to the incoming data from serial port
void doDrawCircle(int xPos, int yPos, float[] ptRad) {  
  pushMatrix(); //saves the current coordinate system to the stack
  translate(xPos, yPos); //translates the x and y position as the loop begins again
  rotate(radians(frameCount*0.1)); //number of rotations per frame (tried to make it slow so the user can see the movement)
  color col = color(map(inByte, 0, 500, 0, 255), 34, 255); //mapping color
  stroke(col); //based on the given color mentioned in the previous line
  beginShape(); //start drawing the shape 
  for (int j=0;j<degs;j=j+1) { 
    float rj=radians(j);
    float xA=sin(rj)*ptRad[(j)]; //Xpos= sin value * radii of the lines drawn in the sketch
    float yA=cos(rj)*ptRad[(j)]; // Ypos= cos value * radii of the lines drawn in the sketch
    vertex(xA, yA);
  }
  endShape();//stop drawing shape
  popMatrix(); // restores the prior coordinate system
}
 // draws newCircle only when there is more than the given degree
float[] doNewCircle(float nXstart, float nYstart) {
 float[] theCircle = new float[degs];
 for (int i=0+int(frameCount/1);i<degs+int(frameCount/1);i++) //number of rotations per frame in the new position 
 {
  nX=sin(radians(i))*nRadius+nXstart; // new x positin starts 
  nY=cos(radians(i))*nRadius+nYstart; // new y postion starts 
  theCircle[i]=map(noise(nX, nY), 0, 1, 0, outRadius);
  }
 return theCircle; 
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    inByte = float(inString);
    println(inByte);
    inByte = map(inByte, 0, 700, 0, 500);
  }
}
