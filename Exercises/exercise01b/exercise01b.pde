final color NO_CLICK_FILL_COLOR = color(250, 100, 100);                      
final color CLICK_FILL_COLOR = color(200, 20, 250);   //changed the color  
final color BACKGROUND_COLOR = color(250, 150, 150);    
final color STROKE_COLOR = color(250, 150, 150);        
final int CIRCLE_SIZE = 70;       //changed the size to 70                      
final int CIRCLE_SPEED = 10;          //changed the speed to 10                  

int circleX;            
int circleY;            
int circleVX;           
int circleVY;     

float red1 = random(0,255);  //added some random variables to change the colours
float green1 = random(0,100);
float blue1 = random(0,100);

float red2 = random(50,60);  //added some random variables to get different colour reactions
float green2 = random(20,230);
float blue2 = random(30,40);




void setup() {
  size(640, 480);                     
  circleX = width/2;
  circleY = height/2;                 
  circleVX = CIRCLE_SPEED;            
  circleVY = CIRCLE_SPEED;            
  stroke(STROKE_COLOR);               
  fill(NO_CLICK_FILL_COLOR);           
  background(red1,green2,blue1);   //the random choosing of shades is displayed
}

void draw() {

    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {  
    fill(CLICK_FILL_COLOR);  
    
  }                                                                
  else {                                                           
    fill(NO_CLICK_FILL_COLOR);  
     
  }
  rect(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);    //made it a rectangle imstead of an elipse      
  circleX += circleVX;                                     
  circleY += circleVY;                                     
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) { 
    circleVX = -circleVX;                                               
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) { 
    circleVY = -circleVY;                                                
  }
  }


void mousePressed() {    
  background(red2,green2,blue2);  
}

void mouseReleased(){   //added a mouse release command
  background(red1, green1, blue1);
}