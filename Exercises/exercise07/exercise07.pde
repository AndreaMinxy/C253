
import processing.sound.*;
// The SoundFile class comes with the library, it allows us to store
// a sound in a variable (similar to PImage storing an image)
//defining the array of tones
SoundFile [] tone = new SoundFile[5]; 

//the number of frames per beat, taken from Pippin's powerpoint
int framePerBeat = 10;

void setup() {
  //background size
  size(600, 500);
  
   //color the background grey
  background(#CEC8C8);

  //go through the array and check every box
  for (int i = 0; i < tone.length; i++) {
    // We can use the i variable to work out which filename to use!
    tone[i] = new SoundFile(this, "tone0" + (i+1) + ".wav");
  }
}

void draw() {
  
 
  //call the painting function to draw circles over and over again
    paint();

  //constrain the mouse positions
  //int mx =constrain(mouseX, 0, width/4);
  //int my =constrain(mouseY, 0, height/4);
  
  println(mouseX);
  println(mouseY);
  
  //if the mouse is in the top rightt corner, play the first tone
  if (mouseX <= width/4 && mouseY <= height/4 ) {
    tone[1].play();
  } 
  //if the mouse is in the top left corner, play the second tone
  if (mouseX >= width/4 && mouseY <= height/4 ) {
    tone[2].play();
  }

  //if the mouse is in the bottom right corner, play the third tone
  if (mouseX <= width/4 && mouseY >= height/4 ) {
    tone[3].play();
  }

  //if the mouse is in the bottom left corner, play the third tone
  if (mouseX >= width/4 && mouseY >= height/4 ) {
    tone[4].play();
  }

  //if the mouse is in the middle, play the fifth tone
  if (mouseX == width/2 && mouseY == height/2 ) {
    tone[5].play();
  }
}

//draw a circle 
void paint() {
  
  ellipse(mouseX, mouseY, 20, 20);
  noStroke();
  
  //if the mouse is in the top rightt corner, paint first color
  if (mouseX <= width/4 && mouseY <= height/4 ) {
    fill(#EA1527);
  } 
  //if the mouse is in the top left corner, paint second color
  if (mouseX >= width/4 && mouseY <= height/4 ) {
    fill(#42E3D4);
  }

  //if the mouse is in the bottom right corner, paint thrid color
  if (mouseX <= width/4 && mouseY >= height/4 ) {
    fill(#B70EC4);
  }

  //if the mouse is in the bottom left corner, paint fourth color
  if (mouseX >= width/4 && mouseY >= height/4 ) {
    fill(#1210C6);
  }

  //if the mouse is in the middle, paint fifth color
  if (mouseX == width/2 && mouseY == height/2 ) {
    fill(#F7E839);
  }
  
  
}