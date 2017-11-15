
import processing.sound.*;
// The SoundFile class comes with the library, it allows us to store
// a sound in a variable (similar to PImage storing an image)
//defining the array of tones
SoundFile [] tone = new SoundFile[5]; 

//the number of frames per beat, taken from Pippin's powerpoint
int framePerBeat = 10;

//define the array list with the dot class
ArrayList<Dot> dots = new ArrayList<Dot>();

//defining the class
Dot dot;

void setup() {
  //background size
  size(600, 500);

  //color the background white
  background(255, 255, 255);


  //initilaizing the arguments
  dot = new Dot(mouseX, mouseY, color(0, 0, 0));

  //go through the array and check every box
  for (int i = 0; i < tone.length; i++) {
    // We can use the i variable to work out which filename to use!
    tone[i] = new SoundFile(this, "tone0" + (i+1) + ".wav");
  }
}

void draw() {

  //color the background white (over and over)
  background(255, 255, 255);

  //draw the circle in the center
  noFill();
  stroke(0, 0, 0);
  ellipse(width/2, height/2, 200, 200);

  //draw the circle in the bottom left
  noFill();
  stroke(0, 0, 0);
  ellipse(width/4, height-110, 100, 100);

  //draw the circle in the top right
  noFill();
  stroke(0, 0, 0);
  ellipse(width-100, height-height+100, 100, 100);


  //check the list of dots and update thei movement and display their form
  for (int i = 0; i < dots.size(); i++) { 
    dots.get(i).update();
    dots.get(i).display();
    //check the boundery boolean: if it's true set the replay boolean to true
    if (dots.get(i).checkBoundary()) {
      dots.get(i).replay = true;
    }

    //if the replay boolean is true, play the tunes based on the distance specified
    if (dots.get(i).replay == true) {
      if (dist(dots.get(i).x, dots.get(i).y, width/2, height/2) < 100) {
        tone[4].play();
        dots.get(i).replay = false;
      } else if (dist(dots.get(i).x, dots.get(i).y, width/4, height-110) < 50) {
        tone[2].play();
      } else if (dist(dots.get(i).x, dots.get(i).y, width-100, height-height+100) < 50) {
        tone[3].play();
      }
    }
  }
}


//when the mouse is pressed, create a new dot
void mousePressed() {
  dots.add(new Dot(mouseX, mouseY, color(0, 0, 0)));
}