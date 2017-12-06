// Letter
//
// A class for representing a single character on the screen
// which will be deleted when a blast object hits it.
//
// code By Samuelle Bourgault, taken from Pippin's slide and alterred by me

class Letter {

  // Store the position and size of the character
  float x;
  float y;
  float w;
  float h;
  // Store the character this Letter represents
  char c;
  // Track whether the blast hit the specific letter 
  boolean hit;

  //the velocity of the string
  int vx = 1;
  int vy = 1;

  //determines if the string is off the screen
  boolean isOffScreen = (x + w/2 < 0 || x - w/2 > width);

  // Letter()
  //
  // Creates the obvious properties, constructs the size
  // of the character based on its properties derived from
  // the current font.
  Letter(char tempC) 
  {
    c = tempC;

    x = 0;
    y = 0;

    //boolean to check if it gets hit
    hit = false;

    // The width of the character is just its textWidth
    // The height of the character is taken to be the maximum
    // height of a character in this font (its ascent plus its descent).
    w = textWidth(c);
    h = textAscent() + textDescent();
  }


  // update()
  //
  // Checks whether the mouse is over the character and moves
  // the character based on where the mouse was in the previous frame.
  public void update() {   
    //make the string move
    x+=vx;
    //if the string is off the screen
    if (isOffScreen) {
      y +=1;
      x-=vx;
    }


    //checks if letter is shot, letter disspaears and doesnt shoot bullets anymore
    if (hit != true) {
      shootBlast();
      handleHit();
      display();
    }
  }



  void display() 
  {
    text(c, x, y);
  }


  // setPosition()
  //
  // A setter for setting the position of the letter.
  // A Letter Setter.
  void setPosition(float tempX, float tempY)
  {
    x = tempX;
    y = tempY;
  }

  //check if letter got hit by bullet
  void handleHit() {

    for (int i = 0; i < allBlast.size(); i++) { 
      allBlast.get(i).display();

      if (allBlast.get(i).collide(this) && (allBlast.get(i).isPlayerShoot)) {
        allBlast.remove(i);
        SCORE +=1;
        hit = true;
      }
    }
  }

  //shoot random bullets
  void shootBlast() {
    if (random(0, 100) < 0.15) {
      allBlast.add(new Blast(x, y, false));
    }
  }
} 