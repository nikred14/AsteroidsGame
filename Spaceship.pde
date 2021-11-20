class Spaceship extends Floater {   
  public Spaceship() {
    corners = 16;  
    xCorners = new int[corners]; 
    xCorners[0] = -6;
    xCorners[1] = 0;
    xCorners[2] = 4;
    xCorners[3] = 2;
    xCorners[4] = 5;
    xCorners[5] = 13;
    xCorners[6] = 16;
    xCorners[7] = 19;
    for (int i = 0; i < 8; i++) {
      xCorners[15-i] = xCorners[i];
    }
    yCorners = new int[corners];
    yCorners[0] = 6;
    yCorners[1] = 16;
    yCorners[2] = 16;
    yCorners[3] = 5; 
    yCorners[4] = 2;
    yCorners[5] = 2;
    yCorners[6] = 5;
    yCorners[7] = 3;
    for (int i = 0; i < 8; i++) {
      yCorners[15-i] = -yCorners[i];
    }
    myColor = color(255);//75, 83, 32);
    myCenterX = sizeX/2;
    myCenterY = sizeY/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void hyperspace() {
    myColor = color(255, 255, 255, (255/fadeTime)*hyperspaceFade);

    if (hyperspaceFade == 0) {
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = Math.random()*360;
      int boarder = 10;
      myCenterX = Math.random()*(sizeX-2*boarder)+boarder;
      myCenterY = Math.random()*(sizeY-2*boarder)+boarder;
      e = false;
      e2 = true;
    }
    if (hyperspaceFade == fadeTime) {
      e2 = false;
    }
  }
  public void speedCap() {
    if (myXspeed == 0) {
      if (myYspeed > maxSpeed) {
        myYspeed = maxSpeed;
      }
      if (myYspeed < -maxSpeed) {
        myYspeed = -maxSpeed;
      }
    } else if (myYspeed == 0) {
      if (myXspeed > maxSpeed) {
        myXspeed = maxSpeed;
      }
      if (myXspeed < -maxSpeed) {
        myXspeed = -maxSpeed;
      }
    } else if (myXspeed*myXspeed+myYspeed*myYspeed > maxSpeed) {
      if (myXspeed > 0) {
        double direction = Math.atan(myYspeed/myXspeed);
        myXspeed = Math.cos(direction)*maxSpeed;
        myYspeed = Math.sin(direction)*maxSpeed;
      } else {
        double direction = Math.atan(myYspeed/myXspeed);
        myXspeed = -Math.cos(direction)*maxSpeed;
        myYspeed = -Math.sin(direction)*maxSpeed;
      }
    }
  }
  public void exhaust() { 
    
    fill(255, 192, 0);

    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);

    line(-15, 0, -25, 0); //center
    line(-15, 5, -20, 10); //right
    line(-15, -5, -20, -10); //left

    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    
  }
}
