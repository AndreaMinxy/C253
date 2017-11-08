
import processing.sound.*;
// The SoundFile class comes with the library, it allows us to store
// a sound in a variable (similar to PImage storing an image)
SoundFile [] tone;

// We load a sound by creating a new SoundFile and giving it the path to the file
  // Notice that sound file is in a subfolder called "sounds" - that's organised!
  tone = new SoundFile[5];
  
void setup() {
  
  size(600, 640);
  
  for(int i = 0; i< tone.length; i++){
 tone[i] = new SoundFile(this, "tone0" + (i+1) + ".wav");
  }
}
void draw() {
 background(255);
 

}