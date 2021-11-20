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
int maxSpeed = 3;
float maxThrustPower = 200;
float thrustPower = maxThrustPower;

Spaceship bob = new Spaceship();
Star[]jim = new Star[200];
public void setup() 
{
  size (500, 500);
  for (int i = 0; i < jim.length; i++) {
    jim[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < jim.length; i++) {
    jim[i].show();
  }
  bob.show();
  bob.move();

  if (w && thrustPower > 0) {
    thrustPower-=1;
   if (thrustPower > 0) {
      bob.accelerate(0.4);
      bob.exhaust();
      maxSpeed = 4;
    } else {
     thrustPower = 0; 
    }
  } else {
    maxSpeed = 3;
  }
  if (s) {
    bob.accelerate(-0.3);
  }
  if (a) {
    bob.turn(-5);
  }
  if (d) {
    bob.turn(5);
  }
  if (e) {
    hyperspaceFade --;
  }
  if (e2) {
    hyperspaceFade ++;
  }
  bob.hyperspace();
  bob.speedCap();
  thrustBar();
}

public void keyPressed() {
  if (key == 'w' || key == 'W') {
    w = true;  
  }
  if (key == 's' || key == 'S') {
    s = true;
  }
  if (key == 'a' || key == 'A') {
    a = true;
  }
  if (key == 'd' || key == 'D') {
    d = true;
  }
  if (key == 'e' || key == 'E') {
    e = true;
  }
}

public void keyReleased() {
  if (key == 'w' || key == 'W') {
    w = false;
  }
  if (key == 's' || key == 'S') {
    s = false;
  }
  if (key == 'a' || key == 'A') {
    a = false;
  }
  if (key == 'd' || key == 'D') {
    d = false;
  }
}

public void thrustBar() {
  noStroke();
  fill(255, 255, 255, 100);
  rect(20, 20, thrustPower, 30);
  if (thrustPower >= maxThrustPower) {
    thrustPower = maxThrustPower;
  } else {
    thrustPower+=0.25;
  }
}
