class Blast {

  // Default values for speed and size
  int SPEED = 15;
  int SIZE = 10;

  // The location of the blast
  float x;
  float y;

  // The velocity of the blast
  int vy;

  //setting up the constructor
  Blast(int _x, int _y) {
    x =_x;
    y = _y;
    vy = SPEED;
  }

  boolean update() {

    //get the blaster moving
    y -=vy;

    if (y > width || x<0) {
      return true;
    }
    
    return false;
  }
  
  boolean collide(Shield shield){
    println("check");
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > shield.x - shield.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < shield.x + shield.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > shield.y - shield.HEIGHT/2);            
    boolean insideBottom = (y - SIZE/2 < shield.y + shield.HEIGHT/2);

    // Check if the ball overlaps with the letters
    if (insideLeft && insideRight && insideTop && insideBottom){
      println("collison");
      return true;
    }
    return false;
  }
  
  boolean collide(Letter letter){
    println("hit");
    // Calculate possible overlaps with the letters side by side
    boolean insideLeft = (x + SIZE/2 > letter.x - letter.w/2);
    boolean insideRight = (x - SIZE/2 < letter.x + letter.w/2);
    boolean insideTop = (y + SIZE/2 > letter.y - letter.h/2);            
    boolean insideBottom = (y - SIZE/2 < letter.y + letter.h/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom){
      return true;
    }
    return false;
  }

  void display() {
    fill(#E828D2);
    noStroke();
    rectMode(CENTER);
    rect(x, y, SIZE, SIZE);
  }
}