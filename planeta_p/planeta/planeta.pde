import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
PShape rocket;
float ry;
PShape sun;
PShape sol2;
PImage suntex;

PShape tierra;
PShape tierra2;
PImage surftex1;
PImage cloudtex;

PShape mercurio;
PShape mercurio2;
PImage surftex2;

PShape venus;
PShape venus2;
PImage surftex3;

PShape marte;
PShape marte2;
PImage surftex4;

PShape jupiter;
PShape jupiter2;
PImage surftex5;

PShape saturno;
PShape saturno2;
PImage surftex6;

PShape urano;
PShape urano2;
PImage surftex7;

PShape neptuno;
PShape neptuno2;
PImage surftex8;

PShape pluton;
PShape pluton2;
PImage surftex9;

PShape anillosaturno;
PImage surftex10;

PShape anillourano;
PImage surftex11;

PShape anillosaturno2;
PShape anillourano2;


float camx = 0, camy = 0, camz = 0, scale = 1.0;

//PShape asteroide;
PImage surftex12;

cometa[] cometas = new cometa[200];
cometa[] cometas2 = new cometa[300];
int p;

void setup() {
  //size(1024, 768, P3D);
  fullScreen(P3D,1);
  cam = new PeasyCam(this, 2000);
  
  for ( int i = 0; i < cometas.length; i++){
    cometas[i] = new cometa((int)random(1100,1300),(int)random(-50,50));
  }
  for ( int i = 0; i < cometas2.length; i++){
    cometas2[i] = new cometa((int)random(6700,7200),(int)random(-50,50));
  }
  rocket = loadShape("rocket.obj");
  suntex = loadImage("sol.jpg");  
  surftex1 = loadImage("tierra.jpg");
  surftex2 = loadImage("mercurio.jpg");  
  surftex3 = loadImage("venus.jpg");
  surftex4 = loadImage("marte.jpg");
  surftex5 = loadImage("jupiter.jpg");
  surftex6 = loadImage("saturno.jpg");
  surftex7 = loadImage("urano.jpg");
  surftex8 = loadImage("neptuno.jpg");
  surftex9 = loadImage("pluton.jpg");
  surftex10 = loadImage("anillosaturno.jpg");
  surftex11 = loadImage("anillourano.jpg");
  surftex12 = loadImage("asteroide.png");

  
  noStroke();
  fill(255);
  sphereDetail(40);

  sun = createShape(SPHERE, 695.7);
  sun.setTexture(suntex);  

  tierra = createShape(SPHERE, 12.756);
  tierra.setTexture(surftex1);
  
  mercurio = createShape(SPHERE, 4.880);
  mercurio.setTexture(surftex2);
  
  venus = createShape(SPHERE, 12.104);
  venus.setTexture(surftex3);  
  
  marte = createShape(SPHERE, 6.794);
  marte.setTexture(surftex4);  
  
  jupiter = createShape(SPHERE, 142.984);
  jupiter.setTexture(surftex5); 
  
  saturno = createShape(SPHERE, 108.728);
  saturno.setTexture(surftex6); 
  
  urano = createShape(SPHERE, 51.118);
  urano.setTexture(surftex7); 
  
  neptuno = createShape(SPHERE, 49.532);
  neptuno.setTexture(surftex8); 
  
  pluton = createShape(SPHERE, 2.320);
  pluton.setTexture(surftex9); 
  
  anillosaturno = createShape(ELLIPSE, 0 , 0, 500, 500);
  anillosaturno.setTexture(surftex10); 
  
  anillourano = createShape(ELLIPSE,0, 0, 250, 250);
  anillourano.setTexture(surftex11); 
  
  anillosaturno2 = createShape(ELLIPSE, 0 , 0, 350, 350);
  anillosaturno2.setTexture(surftex10); 
  
  anillourano2 = createShape(ELLIPSE,0, 0, 350, 350);
  anillourano2.setTexture(surftex11); 
  
  asteroide = createShape(SPHERE, 8);
  asteroide.setTexture(surftex12); 
  
  tierra2 = createShape(SPHERE, 100);
  tierra2.setTexture(surftex1);
  
  mercurio2 = createShape(SPHERE, 100);
  mercurio2.setTexture(surftex2);
  
  venus2 = createShape(SPHERE, 100);
  venus2.setTexture(surftex3);
  
  marte2 = createShape(SPHERE, 100);
  marte2.setTexture(surftex4);
  
  jupiter2 = createShape(SPHERE, 100);
  jupiter2.setTexture(surftex5);
  
  saturno2 = createShape(SPHERE, 100);
  saturno2.setTexture(surftex6);
  
  urano2 = createShape(SPHERE, 100);
  urano2.setTexture(surftex7);
  
  neptuno2 = createShape(SPHERE, 100);
  neptuno2.setTexture(surftex8);
  
  pluton2 = createShape(SPHERE, 100);
  pluton2.setTexture(surftex9);
  
  sol2 = createShape(SPHERE, 100);
  sol2.setTexture(suntex);  
}


void draw(){
  background(0);
  estrella();
  tecla();
  
  scale(scale);
  rotateX(camx);
  rotateY(camy);
  rotateZ(camz);
  
  pushMatrix();
  //translate(width/2, height/2, -500);  //mueve el sol al centro
  
  pushMatrix();
  rotateY(PI * frameCount / 500); // rotacion del sol
  shape(sun);
  fill(255);
  textSize(200);
  textAlign(CENTER);
  text("SOL", 0, -730);
  
  popMatrix();

  pointLight(255,  255,  255,  0,  0,  0);  //sombra de mercurio
  rotateY(PI * frameCount / 200);  //rotacion de mercurio con el sol
  translate(0, 0, 753.6); //mueve la posicion de mercurio

  shape(mercurio); 
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("MERCURIO", 0, -20);

  popMatrix();
  
  pushMatrix();
  
  //noLights();
  
  
  //translate(0.75 * width,  0.6 * height,  50); 
  
  //translate(width/2, height/2, -500);  // mueve a la tierra de posicion
  pointLight(255,  255,  255,  0,  0, 0/*, -150*/); //sombra de tierra
  rotateY(PI * frameCount / 300); //rotacion de la tierra
  translate(0, 0, 845.3);
  shape(tierra);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("TIERRA", 0, -100);
  //shape(luna);
  popMatrix();
  
  //venus
  pushMatrix();
  noLights();
  
  //translate(width/2, height/2, -500);
  pointLight(255,  255,  255,  0,  0,  0); 
  rotateY(PI * frameCount / 150);
  translate(0, 0, 803.9);
  shape(venus);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("VENUS", 0, -20);
  
  popMatrix();
  
  //marte
  pushMatrix();
  noLights();
  
  //translate(width/2, height/2, -500);
  pointLight(255,  255,  255,  0,  0,  0); 
  rotateY(PI * frameCount / 200);
  translate(0, 0, 923.6);
  shape(marte);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("MARTE", 0, -50);
  
  popMatrix();
  
  //jupiter
  pushMatrix();
  noLights();
  
  //translate(width/2, height/2, -500);
  pointLight(255,  255,  255,  0,  0,  0); 
  rotateY(PI * frameCount / 250);
  translate(0, 0, 1474);
  shape(jupiter);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("JUPITER", 0, -160);
  
  popMatrix();
  
  //saturno
  pushMatrix();
  noLights();
 
  //translate(width/2, height/2, -500);
  pointLight(255,  255,  255,  0,  0,  0); 
  rotateY(PI * frameCount / 350);
  translate(0, 0, 2125.1);
  shape(saturno);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("SATURNO", 0, -140);
  
  
  rotateX(radians(110));
  //fill(255);
  //noFill();
  //stroke(255);
  //ellipse(0, 0, 500, 500);
  shape(anillosaturno);
  
  popMatrix();
  
   //urano
  pushMatrix();
  noLights();
  
  //translate(width/2, height/2, -500);
  pointLight(255,  255,  255,  0,  0,  0); 
  rotateY(PI * frameCount / 400);
  translate(0, 0, 3566.6);
  shape(urano);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("URANO", 0, -70);
  
  rotateX(radians(110));
  //fill(255);
  //noFill();
  //stroke(255);
  //ellipse(0, 0, 500, 500);
  shape(anillourano);
  
  popMatrix();
  
  //neptuno
  pushMatrix();
  noLights();
  
  //translate(width/2, height/2, -500);
  pointLight(255,  255,  255,  0,  0,  0); 
  rotateY(PI * frameCount / 540);
  translate(0, 0, 5200);
  shape(neptuno);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("NEPTUNO", 0, -65);
  
  popMatrix();
  
   //pluton
  pushMatrix();
  noLights();
  
  //translate(width/2, height/2, -500);
  pointLight(255,  255,  255,  0,  0,  0); 
  rotateY(PI * frameCount / 330);
  translate(0, 0, 6609.2);
  shape(pluton);
  noLights();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("PLUTON", 0, -20);
  
  popMatrix();

  pushMatrix();
  pointLight(255,  255,  255,  0,  0,  0); 
  for ( int i = 0; i < cometas.length; i++){
    rotateY(PI * frameCount / 50000);
    cometas[i].Pos();
    cometas2[i].Pos();
  }
  popMatrix();

  
  //translate(width/2, height/2, -500);
  rotateY(PI * frameCount / 110);
  noFill();
  stroke(255);
  //strokeWeight(1);
  rotateX(radians(90));
  
  ellipse(0, 0, 1507.2, 1507.2); 
  ellipse(0, 0, 1607.8, 1607.8); 
  ellipse(0, 0, 1690.6, 1690.6); 
  ellipse(0, 0, 1847.2, 1847.2); 
  ellipse(0, 0, 2948, 2948); 
  ellipse(0, 0, 4250.2, 4250.2); 
  ellipse(0, 0, 7133.2, 7133.2); 
  ellipse(0, 0, 10400, 10400); 
  ellipse(0, 0, 13218.4, 13218.4); 
  
  if (keyPressed && (key == 'Q' || key == 'q' || key == 'E' || key == 'e' 
      || key == 'A' || key == 'a' || key == 'D' || key == 'd' || key == 'W' || key == 'w' || key == 'S' || key == 's'
      || key == CODED)) keyPressed();
      
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {
    camz+=0.01;
  }
  else if (key == 'E' || key == 'e') {
    camz-=0.01;
  }
  else if(key == CODED) {
    if (keyCode == UP) {
      scale+=0.025;
    }
    else if (keyCode == DOWN) {
      if(scale>0.05) scale-=0.025;
    }
  }
  else if (key == 'A' || key == 'a') {
    camy-=0.01;
  }
  else if (key == 'D' || key == 'd') {
    camy+=0.01;
  }
  else if (key == 'W' || key == 'w') {
    camx+=0.01;
  }
  else if (key == 'S' || key == 's') {
    camx-=0.01;
  }
}
void tecla(){
  if (key == '1') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(mercurio2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Mercurio", 0, -750);
    text("Tamaño: 4,880 km.", 0, -710);
    text("Radio ecuatorial: 2,440 km.", 0, -670);
    text("Distancia al sol: 57,910,000 km.", 0, -630);
    text("Lunas: 0", 0, -590);
    text("Periodo de rotacion: 58,6 dias", 0, -550);
    text("Orbita: 87,97 dias", 0, -510);
    text("Temperatura media: 167° C", 0, -470);
  }
  if (key == '2') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(venus2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Venus", 0, -750);
    text("Tamaño: 12,104 km.", 0, -710);
    text("Radio ecuatorial: 6,052 km.", 0, -670);
    text("Distancia al sol: 108,200,000 km.", 0, -630);
    text("Lunas: 0", 0, -590);
    text("Periodo de rotacion: 243 dias", 0, -550);
    text("Orbita: 224,7 dias", 0, -510);
    text("Temperatura media: 480° C", 0, -470);
  }
  if (key == '3') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(tierra2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Tierra", 0, -750);
    text("Tamaño: 12,756 km.", 0, -710);
    text("Radio ecuatorial: 6,378 km.", 0, -670);
    text("Distancia al sol: 149,600,000 km.", 0, -630);
    text("Lunas: 1", 0, -590);
    text("Periodo de rotacion: 23,93 horas", 0, -550);
    text("Orbita: 356,256 dias", 0, -510);
    text("Temperatura media: 15° C", 0, -470);
  }
  if (key == '4') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(marte2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Marte", 0, -750);
    text("Tamaño: 6,794 km.", 0, -710);
    text("Radio ecuatorial: 3,397 km.", 0, -670);
    text("Distancia al sol: 227,940,000 km.", 0, -630);
    text("Lunas: 2", 0, -590);
    text("Periodo de rotacion: 24,62 horas", 0, -550);
    text("Orbita: 686,98 dias", 0, -510);
    text("Temperatura media: -55° C", 0, -470);
  }
  if (key == '5') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(jupiter2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Jupiter", 0, -750);
    text("Tamaño: 142,984 km.", 0, -710);
    text("Radio ecuatorial: 71,492 km.", 0, -670);
    text("Distancia al sol: 778,330,000 km.", 0, -630);
    text("Lunas: 63", 0, -590);
    text("Periodo de rotacion: 9,84 horas", 0, -550);
    text("Orbita: 11,86 años", 0, -510);
    text("Temperatura media: -108° C", 0, -470);
  }
  if (key == '6') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(saturno2);
    rotateX(radians(90));
    shape(anillosaturno2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Saturno", 0, -750);
    text("Tamaño: 108,728 km.", 0, -710);
    text("Radio ecuatorial: 60,268 km.", 0, -670);
    text("Distancia al sol: 1,429,400,000 km.", 0, -630);
    text("Lunas: 33", 0, -590);
    text("Periodo de rotacion: 10,23 horas", 0, -550);
    text("Orbita: 29,46 años", 0, -510);
    text("Temperatura media: -133° C", 0, -470);
  }
  if (key == '7') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(urano2);
    rotateX(radians(90));
    shape(anillourano2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Urano", 0, -750);
    text("Tamaño: 51,118 km.", 0, -710);
    text("Radio ecuatorial: 25,559 km.", 0, -670);
    text("Distancia al sol: 2,870,990,000 km.", 0, -630);
    text("Lunas: 27", 0, -590);
    text("Periodo de rotacion: 17,9 horas", 0, -550);
    text("Orbita: 84,01 años", 0, -510);
    text("Temperatura media: -209° C", 0, -470);
  }
  if (key == '8') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(neptuno2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Neptuno", 0, -750);
    text("Tamaño: 49,532 km.", 0, -710);
    text("Radio ecuatorial: 24,746 km.", 0, -670);
    text("Distancia al sol: 4,504,300,000 km.", 0, -630);
    text("Lunas: 13", 0, -590);
    text("Periodo de rotacion: 16,11 horas", 0, -550);
    text("Orbita: 164,8 años", 0, -510);
    text("Temperatura media: -220° C", 0, -470);
  }
  if (key == '9') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(pluton2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Pluton", 0, -750);
    text("Tamaño: 2,320 km.", 0, -710);
    text("Radio ecuatorial: 1,160 km.", 0, -670);
    text("Distancia al sol: 5,913,520,000 km.", 0, -630);
    text("Lunas: 1", 0, -590);
    text("Periodo de rotacion: 6,39 dias", 0, -550);
    text("Orbita: 248,54 años", 0, -510);
    text("Temperatura media: -215° C", 0, -470);
  } 
  if (key == '0') {
    pushMatrix();
    translate(0, -900, 0);
    rotateY(PI * frameCount / 300);
    shape(sol2);
    popMatrix();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Sol", 0, -750);
    text("Tamaño: 1,390,000 km.", 0, -710);
    text("Radio ecuatorial: 695,000 km.", 0, -670);
    text("Periodo de rotacion: de 25 a 36 dias", 0, -630);
    text("Temperatura media: 6,000° C", 0, -590);
  } /* coete
  pushMatrix();
  lights(); 
  translate(width/2, height/2 + 100, -200);
  rotateZ(PI);
  rotateY(ry);
  shape(rocket); 
  ry += 0.02;
  popMatrix();
  */
}