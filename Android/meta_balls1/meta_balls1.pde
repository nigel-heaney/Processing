Boolean showfps=true;
String fps="";

PImage pg;
Blob[] blobs = new Blob[2];


void setup() {
  //size(640, 360);
  fullScreen(P3D);
  colorMode(RGB);
  background(0);
  //frameRate(20);
  pg=createImage(width/4, height/4,RGB);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(pg.width), random(pg.height));
  }
}

void draw() {
  pg.loadPixels();  
  for (int x = 0; x < pg.width; x++) {
    for (int y = 0; y < pg.height; y++) {
      int index = x + y * pg.width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 10 * b.r / d;
      }
      //pg.pixels[index] = color(map(sum,0,500,500,0), 255, 128);
      //pg.pixels[index] = color(sum, 192, 255);
      //pg.pixels[index] = color(sum, 255, 255);

      //nice dull colors with glowing red orbs
      //pg.pixels[index] = color(sum, 255, map(sum,0,400,0,255));

      //white orbs glowing
      //pg.pixels[index] = color(map(sum,0,400,255,0), sum, map(sum,0,400,0,128));
      //pg.pixels[index] = color(sum, map(sum,0,400,255,0),255);

      //RGB - black orbs
      //pg.pixels[index] = color(map(sum,0,400,0,1), map(sum,0,400,255,128), map(sum,0,400,255,128));
      //nice green orbs, lots of incandecent glowing.
      pg.pixels[index] = color(map(sum,0,400,0,50), map(sum,0,400,0,100), map(sum,0,400,0,50));

    }
  }
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