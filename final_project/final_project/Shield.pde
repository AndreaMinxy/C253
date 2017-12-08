class Shield {

  //shield positions
  float x;
  float y;

  //shiled "strength"
  int strength = 255;

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
    fill(shieldColor, strength);
    noStroke();
    rectMode(CENTER);
    rect(x, y, WIDTH, HEIGHT);
  }


  void handleBlast() {


    //check the list of dots and update thei movement and display their form
    for (int i = 0; i < allBlast.size(); i++) { 
      allBlast.get(i).display();
      //if the shield gets hit with a blast from the player, do nothing
      if (allBlast.get(i).collide(this)) {
        //if it's from an enemy
        if(allBlast.get(i).isPlayerShoot == false){
          strength-=20;
        }else if(strength > 0){
          strength+=20;
        }
        strength = constrain(strength, 0, 255);
        //if there's still some strngth left, make sure the bullets dissapear
        if(strength > 0){
        allBlast.remove(i);
        }
        
        
        
      }
    }
  }
}