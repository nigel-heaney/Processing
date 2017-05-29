// Boiler plate
// version: 0.1 - NH

Boolean showfps=true;
String fps="";

float dist;
float maxdist;
float x;
float y;
float r;

void setup() {
  //frameRate(60);
  size(640, 400, P2D);
  noSmooth();
  //frameRate(5);
}

void draw() {
  background(0);
  for (x = 0; x < width; x=x+20) {
    for (y = 0; y < width; y=y+20) {
      dist = dist(x,y,mouseX,mouseY); 
      r = dist -20 * 0.16;
      stroke(255);
      noFill(); //fill(50, 50, 150);  //nofill, nice wireframe effect
      ellipse( x, y, r, r);
    }
  }
  if (showfps==true) {
    if (frameCount % 60 == 0) {
      fps="fps "+ int(frameRate);
    }
    textSize(18);
    fill(200, 200, 0);
    text(fps, 0, 20);
  }
}