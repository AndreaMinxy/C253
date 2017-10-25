// Rollie
// Rollie could change the color of the griddies
//rollie could change the size of the griddie
//


class Rollie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(0,0, 255);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Rollie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }
  
  //move the rollies
  void update() {
     int xMoveType = floor(random(-9,10));
    int yMoveType = floor(random(-9,10));
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
    /*If the x position is smaller than/bigger or equal to the screen width, add/subtract the 
    the width to/from the x position*/
     /*If the  position is smaller than/bigger or equal to the screen height, add/subtract the 
    the width to/from the y position*/
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }
  
  }
  
  //NEW: If the rollies collide with the griddies, make the
  //griddies bigger and change their colour
    void collide(Griddie griddie) {
      
       if (x ==  griddie.x && y == griddie.y){
         
         griddie.size *=2;
         griddie.fill =color(0,255,0);
       
       }
   
    }
    
    
   //display the rollies 
  void display() {
   
    fill(fill); 
    noStroke();
    rect(x, y, size, size);
  }
}