
import processing.sound.*;
// The SoundFile class comes with the library, it allows us to store
// a sound in a variable (similar to PImage storing an image)
//defining the array of tones
SoundFile [] tone = new SoundFile[5]; 


void setup(){
  //background size
  size(600, 500);
  
  for (int i = 0; i < tone.length; i++) {
    // We can use the i variable to work out which filename to use!
    tone[i] = new SoundFile(this, "tone0" + (i+1) + ".wav");
  }
  
}

void draw(){
  background(#CEC8C8);
  
  //if(mouseX < width/2){
 
//}
}

void mouseClicked(){
  
   tone[2].play();
}