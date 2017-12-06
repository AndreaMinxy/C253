class Lives {

//x and y postion
float x;
float y;

//width and height
float w = 10;
float h = 20;

Lives(float _x, float _y){
  
  x = _x;
  y = _y;
  
}
void update(){
  
  
}

void display(){
  for(int i = 0; i < hero.lives; i++){
    fill(#58FF80);
    noStroke();
    rectMode(CENTER);
    rect(x - w*2*i, y, w, h);
  }
}


}