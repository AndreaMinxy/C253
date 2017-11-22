class Shield {
  
  //defining the array list for the bullets/blasts
  ArrayList <Blast> allBlast = new ArrayList<Blast>();

  //shield positions
  float x;
  float y;

  //shield color
  color shieldColor;

  Shield(float _x, float _y, color _shieldColor) {
    x = _x;
    y= _y;
    shieldColor = _shieldColor;
  }

  void update() {
   
  }

  void display() {
    fill(shieldColor);
    noStroke();
    rectMode(CENTER);
    rect(x, y, 200, 30);
  }
  
  
/* void handleBlast() {
    //check the list of dots and update thei movement and display their form
    for (int i = 0; i < allBlast.size(); i++) { 
      if (allBlast.get(i).collide(Shield)) {
        allBlast.remove(i);
      }
      allBlast.get(i).display();
    }
  }*/
  //if the blast bulle hits the shield, the colour and the shape starts to fade
  
  /*if(dist(x,y, blastx, blasty < 20)){
  rgba
  }*/
  
  
}