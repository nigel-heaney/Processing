// Boiler plate
// version: 0.1 - NH

Boolean showfps=true;
String fps="";

float v, c, cx, cy, t;
int x, y;

void setup() {
  //frameRate(60);
  size(480, 320);
  smooth();
  colorMode(HSB);
  t=0;
}

void draw() {
  loadPixels();
  for (y=0; y < height; y++) {
    for (x=0; x < width; x++) {
      v=0;
      //vertical bars
      v += sin(x/40.74 +t);
      //Circles
      v += sin(dist(x, y, width/2, height/2)/40.74 + t);
      //v += sin(dist(x, y, width/2, height/2)/10.74 + t);
      v += sin(dist(x, y, (128 * sin(-t) + 128), (128 * cos(-t) + 128)) / 40.74);
  
      //v += sin(sqrt(100*((width/2)*(width/2)+(height/2)*(height/2))+1)+t);
      v = sin(v * 5 * PI);
      v = map(v, -1, 1, 0, 255);
      pixels[x + y * width] = color(v, v, v);
    }
  }
  updatePixels();
  t=t+0.05;
  if (showfps==true) {
    if (frameCount % 60 == 0) {
      fps="fps "+ int(frameRate);
    }
    textSize(12);
    fill(200, 200, 0);
    text(fps, 0, 13);
  }
}