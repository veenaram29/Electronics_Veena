### - Final Project brief:

This project is an extension of my thesis to test how people would respond 
to any instant visual feedback combined with simple interactions to make their mundane 
action of breathing into an interesting one. It is more of an experimental test to see 
how people feel motivated in response to an instant visual feedback system. 

### - Why does it have to be immediate visual feedback?
During my thesis research, I observed a user behavior. 
When we all book for a Uber or Lyft, how many minutes do you wait? We need a taxi in less 
than five to six minutes. Online shopping, we want our online transactions to be as quick as possible. 
If the browser takes extra few minutes, then you might even rethink on the purchase. That's the same 
while you refresh your browser too. Similarly, we can pick on a lot of examples to see how we are 
transforming into an instant zombie. Then you can question me why are you designing one? 
(It’s a separate question to debate whether instant feedback system is right or wrong) 
But I see the advancements in technology has some adverse effects based on how much we use them. 
That's the reason I wanted to test the instant visual feedback system as a way to motivate users behavior.

    My primary goal of the project was to build an interactive respiratory machine.
By which, I want my user to have an immediate visual feedback of their inhaling and 
exhaling pattern. We have witnessed apps or applications which will measure, track 
and detect our pulse rate, the number of steps we walked, etc. Although this way of 
showing effect oriented results is useful and motivating for users to resume their 
behavior, sooner or later it becomes void. So to make the exercise of breathing more 
fun and exciting i’m investigating instant visual feedback.  

### - Describe how, from a technical point of view, your choice of hardware and software achieves that goal 
In the technical aspect of my project, I required a simple sensor which will detect the movement 
of the diaphragm in recording the pattern of respiration (inhalation & exhalation) and convert into 
numerical data. The hardware in my project is a piezo electronic buzzer which can be used both to play 
tones and also detect tones. This simple electronic device generates a voltage when it's physically 
deformed by a vibration, sound wave, or mechanical strain. Therefore, I built a piezo electronic 
respiratory belt which goes around the diaphragm of our body. Where there is mechanical strain 
happening on the piezo due to inhaling and exhaling of air in the diaphragm. Then the Arduino 
sketch will read the piezo output using the analog read() command, encoding the voltage range 
from 0 to 5 volts to a numerical range from 0 to 1023 in a process referred to as analog-to-digital 
conversion, or ADC. And the conversion of analog to digital, is used to map the digital data to 
produce organic visual waveform in the processing sketch to create a pattern around respiration.

### - Accurate schematic
<img width="523" alt="schematic_respiratory belt" src="https://cloud.githubusercontent.com/assets/13222494/25495017/8c8b969e-2b30-11e7-9b29-d1207aa59b9d.png">

![circuit connection image](https://cloud.githubusercontent.com/assets/13222494/25495151/0e2eb3a2-2b31-11e7-8f98-2356a76119cc.png)

### - Parts list (major or unique parts, not LEDs, wire, etc.)
Required Items: (Arduino Uno -1)
1. Piezo electric buzzer -2.5 cm in diameter
2. Velcro strap - 60 cm long, 2.5 cm wide
![velcro strap](https://cloud.githubusercontent.com/assets/13222494/25791147/3b4c1380-3373-11e7-8f0e-0ac246a903d5.jpg)
3. Latex strip - 25 to 30 cm long, 2.5 cm wide
4. Copper Wire - 1 to 2 mm thick
5. Fast Curing Epoxy compound 
![pc metal epoxy](https://cloud.githubusercontent.com/assets/13222494/25791467/67cd8f04-3375-11e7-96e4-7394085a94b2.jpg)
6. Tools to cut wire - cutter, plyers, hammer etc.
7. Extra - scissors, stapler, extra conductive wires & crocodile clips 
Soldering - lead wire, soldering iron , safety glasses
![thingsrequired](https://cloud.githubusercontent.com/assets/13222494/25810900/5b0fca10-33c6-11e7-9bf8-6c767f51aedb.JPG)

### - Construction
Look into the youtube video for clear construction of the piezo electric respiratory belt.
https://www.youtube.com/watch?v=brTVT--qcwI

### - Pictures from overall project
![copperwire_cut in shape](https://cloud.githubusercontent.com/assets/13222494/25790706/d2ed0676-336f-11e7-877f-4a091a7e0f10.JPG)

![solderingcopperwiretopiezo](https://cloud.githubusercontent.com/assets/13222494/25790769/48be50da-3370-11e7-864a-4f6875540613.JPG)

![frontposition_aftersoldering](https://cloud.githubusercontent.com/assets/13222494/25790798/911143c4-3370-11e7-8c6a-c366932ca6b7.JPG)

![epoxyonthebackofthesensor](https://cloud.githubusercontent.com/assets/13222494/25810980/9d8698b0-33c6-11e7-8b0c-39a4ce10e933.JPG)

![velcrotolatex belt_stapled](https://cloud.githubusercontent.com/assets/13222494/25810807/19c74088-33c6-11e7-80f9-00bce08c3db0.JPG)

![whole circuit connection](https://cloud.githubusercontent.com/assets/13222494/25811067/d8bc1fc2-33c6-11e7-9650-d511cc4a8c9f.JPG)

![attached to the stomach](https://cloud.githubusercontent.com/assets/13222494/25791534/f8dc7d84-3375-11e7-8b94-60b843811d8d.JPG)

![analogreadingchanges_based on sensor](https://cloud.githubusercontent.com/assets/13222494/25791631/983fea5a-3376-11e7-8c6a-a42ae78be445.JPG)

![user testing_setup](https://cloud.githubusercontent.com/assets/13222494/25791719/01133d2a-3377-11e7-8c4d-35e97f0f688c.JPG)

A short video (cellphone is fine) of the operational project
Program(s) must be well commented
Each variable must have a meaningful name
Each section (function, code block, loop, whatever) must be explained
All unused variables and code must be removed (debugging code commented out may remain)




		
