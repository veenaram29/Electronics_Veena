/*

 Read a pair of numbers separated by a comma from the serial port, presumably sent by an Arduino
 
 Use the first number to control the amplitude and the second number the frequency of a sine wave
 
 */

import processing.serial.*;    // Serial port for communication with Arduino
import ddf.minim.*;            // Minim library for generating sounds
import ddf.minim.signals.*;  // Minim library that provides sine wave
import processing.sound.*;
SoundFile file;
SoundFile file1;
SoundFile file2;

Serial myPort;        // The serial port
float freq;           // sine wave frequency
float amp;            // sine wave amplitude

Minim       minim;    // a Minim object
AudioOutput out;      // our audio output
SineWave sine;        // a function to generate the values of a sine wave

void setup () {
  // Open whatever port is the one you're using.
  // DON'T FORGET TO CHANGE THIS FOR YOUR COMPUTER
  myPort = new Serial(this, Serial.list()[1], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  minim = new Minim(this); // Instantiate the minim object

  // Connect the output of Minim to the audio output 
  // of my laptop
  out = minim.getLineOut(Minim.STEREO);  

  // create a sine wave oscillator
  // Frequency = 440 Hz
  // Amplitude = 0.5
  // Use the same sample rate as my output  
 // sine = new SineWave(440, 0.5, out.sampleRate());
  file = new SoundFile(this, "2.aif");
  file1 = new SoundFile(this, "3.aif");
  file2 = new SoundFile(this, "4.aif");

  //connect the sine wave generator to my audio output
  //out.addSignal(sine);
}

boolean play = false;
boolean play2 = false;
boolean play3 = false;

void draw () {
//  sine.setFreq( freq );
//  sine.setAmp( amp );

  if (play ) {
  //if (play && file.isPlaying() == 0) {
    println("playing file");
    file.play();

  }
   // if (! play) {
    //println("stopping file");
    //file.stop();
 //}

  if (play2 ) {

 // if (play2 && file.isPlaying() == 2) {
    println("playing file1");
    file1.play();
 }
 //else {
  // file1.stop();
// }
   
  //if (! play2) {
  //  println("stopping file1");
  //  file1.stop();
  //}

if (play3 ) {

 // if (play2 && file.isPlaying() == 2) {
    println("playing file2");
    file2.play();
  }
  // println(freq + ',' + amp);
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // println(inString);
    // trim off any whitespace:
    inString = trim(inString);
    // split the input string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(inString, ','));

    // if we have received all the sensor values, use them:
    if (sensors.length == 3) {
      if (sensors[0] >800) {
        play = true;
      } else {
        play = false;
      }

      if (sensors[1] >900) {
        play2 = true;
      } else {
        play2 = false;
      }
      
      if (sensors[2] >700) {
        play3 = true;
      } else {
        play3 = false;
      }
    }
    
    
    
    
    //amp = map(sensors[0], 0, 1023, 1, 0);
    //freq = map(sensors[1], 0, 1023, 110, 880);
  }
}


/*

 // Arduino code for arduinoMinimProcessing2Sensors.pde
 
 void setup() {
 // initialize the serial communication:
 Serial.begin(9600);
 }
 
 void loop() {
 Serial.print(analogRead(A0));
 delay(1); // Wait after each analogRead()
 Serial.print(',');
 Serial.println(analogRead(A1));
 delay(1); // Wait after each analogRead()
 }
 
 */