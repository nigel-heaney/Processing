Boolean showfps=true;
String fps="";


PGraphics pg;
//PImage pg;
Blob[] blobs = new Blob[5];
float brightness;

void setup() {
  size(640, 360,P3D);
  //fullScreen();
  colorMode(HSB);
  pg = createGraphics(width/4, height/4,P3D);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(pg.width), random(pg.height));
  }
}

void draw() {
  background(0);
  pg.loadPixels();  
  //pg.beginDraw();
  for (int x = 0; x < pg.width; x++) {
    for (int y = 0; y < pg.height; y++) {
      int index = x + y * pg.width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 10 * b.r / d;
      }
      brightness=255;
      //if (sum < 160) {
      //  brightness=0;
      //}
      pg.pixels[index] = color(sum, brightness, brightness);
    }
  }
  //pg.endDraw();
  pg.updatePixels();
  scale(4);
  image(pg, 0, 0);
  //updatePixels();

  for (Blob b : blobs) {
    b.update();
    //b.show();
  }

  if (showfps==true) {
    if (frameCount % 60 == 0) {
      fps="fps "+ int(frameRate);
    }
    textSize(22);
    text(fps, 0, 18);
  }
}