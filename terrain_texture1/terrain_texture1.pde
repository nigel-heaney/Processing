int cols, rows;
int scl = 20;
int w = 400;
int h = 400;
float u,v,n;
float flying = 0;

float[][] terrain;

PImage img;

void setup() {
  size(500, 500, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  frameRate(14);
  img = loadImage("smiley.png");
  textureMode(NORMAL);
  //noLoop();
  lights();
}


void draw() {

  flying -= 0.05;
  //flying = 0;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }



  background(0);
  stroke(255);
  strokeWeight(1);
  noStroke();
  //noFill();

  translate(width/2, height/2+50, 00);
  //rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for (int x = 0; x < cols; x++) {
      u=map(x,0,cols,0,1);
      v=map(y,0,rows,0,1);
      vertex(x*scl, y*scl, terrain[x][y],u,v);
      v=map(y+1,0,rows,0,1);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1],u,v);
      //rect(x*scl, y*scl, scl, scl);
      //n=random(255);
      //fill(0, 0, n, 200);
    }
    endShape(CLOSE);
  }
}