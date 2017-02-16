**Mock up - Tabla Instrument**
Things I did try to do over the week researching :

Step 1 -Tabla tones:  I got them downloaded in [SampleTones](http://sampleswap.org/home/downloads.php)
This is a good website to download tones - free of cost - Just register to download tones.

Step 2 - Used Makey Makey drum player app to test  - Bongos
[Drum player](http://makeymakey.com/bongos/)

Step 3 - Tried Arduino to test capacitive Sensor : Piano
#### include <CapacitiveSensor.h>
#### include "pitches.h"

#### define COMMON_PIN      2    // The common 'send' pin for all keys
#define BUZZER_PIN      A4   // The output pin for the piezo buzzer
#define NUM_OF_SAMPLES  10   // Higher number whens more delay but more consistent readings
#define CAP_THRESHOLD   500  // Capactive reading that triggers a note (adjust to fit your needs)
#define NUM_OF_KEYS     2    // Number of keys that are on the keyboard

// This macro creates a capacitance "key" sensor object for each key on the piano keyboard:
#define CS(Y) CapacitiveSensor(2, Y)

// Each key corresponds to a note, which are defined here. Uncomment the scale that you want to use:
int notes[]={NOTE_C4,NOTE_D4,NOTE_E4,NOTE_F4,NOTE_G4,NOTE_A4,NOTE_B4,NOTE_C5}; // C-Major scale
//int notes[]={NOTE_A4,NOTE_B4,NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5,NOTE_G5,NOTE_A5}; // A-Minor scale
//int notes[]={NOTE_C4,NOTE_DS4,NOTE_F4,NOTE_FS4,NOTE_G4,NOTE_AS4,NOTE_C5,NOTE_DS5}; // C Blues scale

// Defines the pins that the keys are connected to:
CapacitiveSensor keys[] = {CS(3), CS(4), };

void setup() { 
  // Turn off autocalibrate on all channels:
  for(int i=0; i<2; ++i) {
    keys[i].set_CS_AutocaL_Millis(0xFFFFFFFF);
  }
  // Set the buzzer as an output:
  pinMode(BUZZER_PIN, OUTPUT); 
}

void loop() {    
  // Loop through each key:
  for (int i = 0; i < 2; ++i) {
    // If the capacitance reading is greater than the threshold, play a note:
    if(keys[i].capacitiveSensor(NUM_OF_SAMPLES) > CAP_THRESHOLD) {
      tone(BUZZER_PIN, notes[i]); // Plays the note corresponding to the key pressed

   //  Serial.println(capacitiveSensor(NUM_OF_SAMPLES);
    }
  }
}

Step 4 - Tried FSR

code:
####int fsrAnalogPin = A0; // FSR is connected to analog 0
int LEDpin = 8;      // connect Red LED to pin 8 (PWM pin)
int fsrReading;      // the analog reading from the FSR resistor divider
int LEDbrightness;
 
void setup(void) {
  Serial.begin(9600);   // We'll send debugging information via the Serial monitor
  pinMode(LEDpin, OUTPUT);
}
 
void loop(void) {
  fsrReading = analogRead(fsrAnalogPin);
  int num=fsrReading/5;
  Serial.print("Analog reading = ");
  Serial.println(num);
// used by analogWrite (0-255) with map!
  LEDbrightness = map(num, 0, 1023, 0, 255);
  // LED gets brighter the harder you press
  analogWrite(LEDpin, LEDbrightness);
 
  delay(100);
}



Step 5 - Tried Playing tabla sounds in makey makey and SoundPlant

Question:
Is it okay to Makey makey instead of Arduino?
Can you give us some thoughts about using a "music maker Mp3 Shield"?
Some sample code to play with while using mp3 shield?
