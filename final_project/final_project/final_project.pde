//Bi-Erasure Space Invaders

//Your wordlview and sexuality are at risk of becoming extinct! A group of aliens have come to try and
//steal your lifeforce and erase you from the face of the earth! Now only you, a brave and determined little
//bisexual, can stop them from destroying your way of life. Are you gonna let those binary conforming aliens
//tell who you can and can't like?

Hero hero;

void setup(){
  
  //size and colour of the background
  size(1000, 600);
  background(255);
  
  hero = new Hero(width/2, height/2);
}

void draw(){
  
  hero.update();
  hero.display();
}