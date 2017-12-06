class Shield {

  //shield positions
  float x;
  float y;



  //width and height
  int WIDTH = 200;
  int HEIGHT =30;
  //shield color
  color shieldColor;

  Shield(float _x, float _y, color _shieldColor) {
    x = _x;
    y= _y;
    shieldColor = _shieldColor;
  }

  void update() {
    handleBlast();
  }

  void display() {
    fill(shieldColor);
    noStroke();
    rectMode(CENTER);
    rect(x, y, WIDTH, HEIGHT);
  }


  void handleBlast() {


    //check the list of dots and update thei movement and display their form
    for (int i = 0; i < allBlast.size(); i++) { 
      allBlast.get(i).display();
      //if the shield gets hit with a blast from the player, do nothing
      if (allBlast.get(i).collide(this) && (allBlast.get(i).isPlayerShoot)) {
        allBlast.remove(i);
        
      } 
    }
  }
}