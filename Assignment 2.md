Build the circuit described in section Code 4: Sounds depending on different keys of the second Arduino Tone 
Resource in resources and verify that it works properly.

Code:
int button1=6; // button1 is connected to pin6 void loop()
int button2=7; // button2 is connected to pin7
int buttonstatus1=0; //variable to save the status of button1
int buttonstatus2=0; //variable to save the status of button2

void setup()
{
pinMode(button1, INPUT); //button1 is an input
pinMode(button2, INPUT); //button2 is an input
}

void loop()
{
buttonstatus1 = digitalRead(button1); //get status from button1 (HIGH or LOW)
buttonstatus2 = digitalRead(button2); //get status from button2 (HIGH or LOW)

if (buttonstatus1 == HIGH) //If button1 gets pushed..
{
tone(8, 100); //...output of a tone with a pitch of 100...
delay (1000); //...one second long...
noTone(8); //...than turn it off
}

if (buttonstatus2 == HIGH) //If button2 gets pushed..
{
tone(8, 200); //...output of a tone with a pitch of 200...
delay (1000); //...one second long...
noTone(8); //...than turn it off
}
}

Musical Intrument Example:

I have been lately interested in conductive ink /Electric paint. I find these 
kind of projects to be very interactive and fun to play with. So I would love to experiment with this material going forward.
But I don't want to constrain myself with this but at the same time keep myslef open to other ideas as well.
I also want to build more like a musical reminder system if possible in this class.
Which would be a convincing piece for my thesis. I am hoping to benefit the most of this class and enhance my skills over arduino.

[bare conductive](https://www.crowdsupply.com/bare-conductive/bare-conductive)
This example that I shared is more of a custom made interactive drum surface to play with.
I was also thinking of making a 4/4 dance floor which could be aen interactive surface for people to move over and play music 
at the same time.

[Conductive ink Instrument](http://cargocollective.com/carolacintron/instrument-o-02-2013-Conductive-ink-wood-and-electronic-components-8)
This could be an other example more of a painting with conductive ink. When you move an object over it you can play music.

Sensors:

Force sensitive resistor - Used to detect physical pressure such as pinching, squeezing, pushing, brushing
Photocells - Used to detect light/dark, breakbeams, simple object detection
Temperature - Used to determine environmental temperature
Tilt sensors - Used to detect motion/vibration and orientation.
PIR sensors - Used to detect motion activity such as animals or people
Thermocouple - Used for temperature measurements, usually those above 150°C
IR receivers - Used to detect IR signals from remote controls

Although this could be a general note on these sensors. For me personally Force sensitive resistor sounds new to me.
I haven't heard about it before. 
 
Although I have dealt with these sensors in class and other projects,the interesting thing to be noted was.
If you put too many photocells in closer proximity to eachother. Then the feedback from each one would be interfering with each 
other. Guess in that situation as we were taught in class as well based on the online resources we have , it states that having 
a delay between those sensors would be better to track each one separately.


