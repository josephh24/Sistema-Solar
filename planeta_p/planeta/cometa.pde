PShape asteroide;

class cometa{
  private float posX;
  private float posY;
  
  public cometa(float posX, float posY)
  {
    this.posX = posX;
    this.posY = posY;

  }
  
  public void Pos()
  {

    pushMatrix();
    translate(posX,posY);
    shape(asteroide);
    popMatrix();
  }
   
}