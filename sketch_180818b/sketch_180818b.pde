import processing.opengl.*;
float thetaCamera = 0.0;
boolean rotateCamera = false;
float sphereColor1 = 0;
float sphereColor2 = 0;
float sphereColor3 = 0;
int helixWidth = 120;
int helixLength = 800;
float z = 0.0;
float theta = 0.0;
float xLocation = width/2.0;
float yLocation = height/2.0;


void setup() {
  size(700,700,OPENGL);
  smooth();
  background(0);
  frameRate(30);
  camera(width/2.0, height/2.0, 800, width/2.0, height/2.0, 0, 0, 1, 0);
}

void draw() {
  lights();
  float eyeX = 800*cos(thetaCamera) + 350;
  float eyeZ = 800*sin(thetaCamera);
  thetaCamera += ((float)mouseY / 9600.0);
  if (rotateCamera == true) {
    camera( eyeX, height/2.0, eyeZ, width/2.0, height/2.0, 0.0, 0.0, 1.0, 0.0);
  }
  
  drawHelix();
}

void drawHelix() {
  z+=20;
  if (z <= helixLength) {
    theta += PI/12;
    float xCos = cos(theta);
    float ySin = sin(theta);
   noStroke();
   translate(helixWidth/2*xCos + xLocation,helixWidth/2*ySin + yLocation,z);
   fill(sphereColor1,sphereColor2,sphereColor3);
   sphere(12);
   
   translate(-helixWidth*xCos,-helixWidth*ySin, 0);
   fill(sphereColor2,sphereColor3,sphereColor1);
   sphere(12);
   
   stroke(sphereColor3,sphereColor1,sphereColor2);
   line(0,0,0,helixWidth*xCos,helixWidth*ySin,0);
  }
}

void mousePressed() {
  xLocation = mouseX;
  yLocation = mouseY;
  z = 0.0;
  theta = 0.0;
  sphereColor1 = random(185) + 70;
  sphereColor2 = random(185) + 70;
  sphereColor3 = random(185) + 70;
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <='Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  
  if (keyIndex == -1) {
    background(0);
  }
  else {
    if (rotateCamera == true) rotateCamera = false;
      else rotateCamera = true;
  }
}
