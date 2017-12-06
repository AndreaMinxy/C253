class Life{

//x and y postion
float x;
float y;

//width and height
float w = 10;
float h = 20;

Life(float _x, float _y){
  
  x = _x;
  y = _y;
  
}
void update(){
  
  
}

void display(){
    fill(#58FF80);
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, h);
}

//when the hero gets hit by bullets, a life bar will disappear to indicate how many lives are left
void loseLife(){
  //check the playerGetsHit variable
  for (hero.playerGetsHit =0; hero.playerGetsHit < 3; hero.playerGetsHit++){
  
  }
}
}