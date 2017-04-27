Final Project brief:

- This project is an extension of my thesis to test how people would respond 
to any instant visual feedback combined with simple interactions to make their mundane 
action of breathing into an interesting one. It is more of an experimental test to see 
people feel motivated in response to an instant visual feedback system. 

- Why does it have to be immediate visual feedback?
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

- Describe how, from a technical point of view, your choice of hardware and software achieves that goal 
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

- Accurate schematic


		
