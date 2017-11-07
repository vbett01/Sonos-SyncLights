# SyncLights - Sonos Speaker Challenge Fall 2017
## Project Description:
This program syncs the frequencies of a real-time playing audio file to a lighting system through an Arduino. This project was built for the Sonos Speaker Challenge at Tufts University during Fall 2017. 

The original implementation had a simple web interface coupled with the Matlab files in this repository, but we chose to put up only the implementation here. This code is intended as an example of a simulation of a digital signal processor that can be used in a speaker. 

The program makes a list of all the audio files in a directory, and plays them one by one. It applies a rectangular window (this is not the best window, but it provided a good enough dynamic range for the simulation) to produce an FFT-based spectogram. It then uses the power distribution in the spectrum of each block of time to light up bulbs with appropriate intensities.

For a demonstration of this implementation, please see the youtube video we submitted linked below.

## Team members:
1. Ashish Neupane
2. Bhushan Suwal
3. Vincent Bett      

## Video submission:
*[Youtube Link](https://youtu.be/cThJ6RuENPg)*

## Future Improvements:
- This project can be translated into a real life implementation in a couple of different ways: processing the signal in an app will require a translation into a less clunkier programming language like python, and processing the signal in hardware will require using digital signal processors inside the speaker. However, the general algorithm should not change too much. 

- The FFT-based spectrogram of the audio signal is generated using rectangular windows. This is not the best approach because of the high sidelobe levels. Blackman window with a 50% overlap offers an improvement with lower sidelobe peak and a good sidelobe falloff, but of course, computational power available in the implementation will influence the choice of window.


