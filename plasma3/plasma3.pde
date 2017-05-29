// Boiler plate
// version: 0.1 - NH

Boolean showfps=true;
String fps="";

float v, t;
int x, y;

void setup() {
  //frameRate(60);
  size(480, 320);
  smooth();
  //colorMode(HSB);
  t=0;
}

void draw() {
  loadPixels();
  for (y=0; y < height; y++) {
    for (x=0; x < width; x++) {
      v=0;
      //vertical bars
      v += sin(x/30.74 +t);
      //Circles
      v += sin(dist(x, y, width/2, height/2)/7.74 + t);
      v = map(v, -1, 1, 0, 255);
      pixels[x + y * width] = color(0, v/2, v);
    }
  }
  updatePixels();
  t=t+0.09;
  if (showfps==true) {
    if (frameCount % 60 == 0) {
      fps="fps "+ int(frameRate);
    }
    textSize(12);
    fill(200, 200, 0);
    text(fps, 0, 13);
  }
}