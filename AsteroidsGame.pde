int sizeX = 500;
int sizeY = 500;
boolean w = false;
boolean a = false;
boolean s = false;
boolean d = false;
boolean e = false;
boolean e2 = false;
int fadeTime = 50;
int hyperspaceFade = fadeTime;

Spaceship bob = new Spaceship();
Star[]jim = new Star[200];
public void setup() 
{
  size (500,500);
  for (int i = 0; i < jim.length; i++){
    jim[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < jim.length; i++){
    jim[i].show();
  }
  bob.show();
  bob.move();
  
  if(w){
    bob.accelerate(0.4);
    bob.exhaust();
  }
  if(s){
    bob.accelerate(-0.3);
  }
  if(a){
    bob.turn(-5);
  }
  if(d){
    bob.turn(5);
  }
  if(e){
    hyperspaceFade --;
  }
  if (e2){
    hyperspaceFade ++;
  }
  bob.hyperspace();
  bob.speedCap();
}

public void keyPressed(){
  if(key == 'w' || key == 'W'){
    w = true;
  }
  if(key == 's' || key == 'S'){
    s = true;
  }
  if(key == 'a' || key == 'A'){
    a = true;
  }
  if(key == 'd' || key == 'D'){
    d = true;
  }
  if(key == 'e' || key == 'E'){
    e = true;
  }
}

public void keyReleased(){
  if(key == 'w' || key == 'W'){
    w = false;
  }
  if(key == 's' || key == 'S'){
    s = false;
  }
  if(key == 'a' || key == 'A'){
    a = false;
  }
  if(key == 'd' || key == 'D'){
    d = false;
  }
}
