Boolean showfps=true;
String fps="";


//PGraphics pg;
PImage pg;
Blob[] blobs = new Blob[5];
float brightness;
float rotx = PI/4;
float roty = PI/4;
float rotz = PI/4;


void setup() {
  size(640, 360,P3D);
  //fullScreen();
  colorMode(HSB);
  textureMode(NORMAL);
  pg = createImage(width/4, height/4,RGB);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(pg.width), random(pg.height));
  }
  noStroke();
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
  //scale(4);
  //image(pg, 0, 0);
  //updatePixels();
  pushMatrix();
  translate(width/2.0, height/2.0, -width + mouseX * 1.2);
  rotateX(rotx);
  rotateY(roty);
  scale(90);
  
  TexturedCube(pg);
  popMatrix();
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

void TexturedCube(PImage pg) {
  beginShape(QUADS);
  texture(pg);
  textureWrap(CLAMP);

  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
  
}