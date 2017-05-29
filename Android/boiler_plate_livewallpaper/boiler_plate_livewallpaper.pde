Boolean showfps=true;
String fps="";

PImage pg;
float col;
int x,y;

void setup() {
  //size(640, 400);
  fullScreen(P3D);
  colorMode(RGB);
  smooth();
  pg=createImage(width/4, height/4,RGB);
  frameRate(24);
}

void draw() {
  background(0);
  pg.loadPixels();  
  for (int x = 0; x < pg.width; x++) {
    for (int y = 0; y < pg.height; y++) {
      col=random(255);
      pg.pixels[x + y * pg.width] = color(col,col,col);
    }
  }
  pg.updatePixels();
  
  //scale up
  scale(4);
  image(pg, 0, 0);
 
  if (showfps==true) {
    if (frameCount % 60 == 0) {
      fps="fps "+ int(frameRate);
    }
    textSize(22);
    text(fps, 0, 18);
  }
}