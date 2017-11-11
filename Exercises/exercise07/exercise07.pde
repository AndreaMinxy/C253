
import processing.sound.*;
// The SoundFile class comes with the library, it allows us to store
// a sound in a variable (similar to PImage storing an image)
//defining the array of tones
SoundFile [] tone = new SoundFile[5]; 

//the number of frames per beat, taken from Pippin's powerpoint
int framePerBeat = 100;

void setup(){
  //background size
  size(600, 500);
  
  //go through the array and check every box
  for (int i = 0; i < tone.length; i++) {
    // We can use the i variable to work out which filename to use!
    tone[i] = new SoundFile(this, "tone0" + (i+1) + ".wav");
  }
  
}

void draw(){
  //color the background grey
  background(#CEC8C8);
  
  //if the mouse is in the top left corner, play the first tone
  if(mouseX < width/4 && mouseY < height/4 ){
    tone[1].play();
 }
}

void mouseClicked(){
  
   
}