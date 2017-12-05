class Blast {

  // Default values for speed and size
  int SPEED = 15;
  int SIZE = 10;

  // The location of the blast
  float x;
  float y;

  // The velocity of the blast
  float vy;


  //check wich blast is being shot
  boolean isPlayerShoot;

  //setting up the constructor
  Blast(float _x, float _y, boolean _isPlayerShoot) {
    x =_x;
    y = _y;
    vy = SPEED;
    isPlayerShoot = _isPlayerShoot;
  }

  boolean update() {

    if (isPlayerShoot) {
      //get the blaster moving up
      y -=vy;
    } else {
      //get the blast moving down
      y+=vy;
    }

    if (y > width || y <0) {
      return true;
    }

    return false;
  }

  boolean collide(Shield shield) {
    println("check");
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > shield.x - shield.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < shield.x + shield.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > shield.y - shield.HEIGHT/2);            
    boolean insideBottom = (y - SIZE/2 < shield.y + shield.HEIGHT/2);

    // Check if the ball overlaps with the letters
    if (insideLeft && insideRight && insideTop && insideBottom) {
      println("collison");
      return true;
    }
    return false;
  }

  boolean collide(Letter letter) {
    println("hit");
    // Calculate possible overlaps with the letters side by side
    boolean insideLeft = (x + SIZE/2 > letter.x - letter.w/2);
    boolean insideRight = (x - SIZE/2 < letter.x + letter.w/2);
    boolean insideTop = (y + SIZE/2 > letter.y - letter.h/2);            
    boolean insideBottom = (y - SIZE/2 < letter.y + letter.h/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      return true;
    }
    return false;
  }
  
  boolean collide(Hero hero) {
    // Calculate possible overlaps with the letters side by side
    boolean insideLeft = (x + SIZE/2 > hero.x - hero.SIZE/2);
    boolean insideRight = (x - SIZE/2 < hero.x + hero.SIZE/2);
    boolean insideTop = (y + SIZE/2 > hero.y - hero.SIZE/2);            
    boolean insideBottom = (y - SIZE/2 < hero.y + hero.SIZE/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
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