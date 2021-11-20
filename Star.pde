class Star //note that this class does NOT extend Floater
{
  private int myX, myY, myColor, mySize;
  public Star(){
    myX = (int)(Math.random()*sizeX);
    myY = (int)(Math.random()*sizeY);
    myColor = color((int)(Math.random()*255));
    mySize = (int)(Math.random()*(sizeX/100));
  }
  public void show(){
    fill(myColor);
    noStroke();
    ellipse(myX, myY, mySize, mySize);
  }
}
