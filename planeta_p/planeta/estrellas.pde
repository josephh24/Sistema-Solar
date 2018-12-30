int i;
void estrella(){
  pushMatrix();

  for (i = 0; i<10; i++){
    fill(255);
    ellipse(random(10000), random(10000), 7, 7);
    ellipse(random(10000), random(-10000), 7, 7);
    ellipse(random(-10000), random(10000), 7, 7);
    ellipse(random(-10000), random(-10000), 7, 7);  
    
  }
  popMatrix();
    
}