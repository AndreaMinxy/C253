import processing.sound.*;

SoundFile tone;

void setup(){

  tone = new SoundFile (this, "15-Dont-Stop-Me-Now.mp3");
}

void draw(){
}

void mouseClicked(){
tone.play();
}