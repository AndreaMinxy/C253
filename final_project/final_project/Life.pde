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


}