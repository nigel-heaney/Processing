Boolean showfps=true;
String fps="";

float d;
float maxdist;
float x;
float y;
float r;

int cx=width/2;
int cy=width/2;
int changex = 100;
int changey = 100;

void setup() {
  fullScreen(P2D);
  maxdist=dist(0, 0, width, height);
  noStroke();
  fill(0, 0, 0);  //nofill, nice wireframe effect
  frameRate(10);
}

void draw()  {
  background(255, 0, 0);
  for (x = 0; x < width+20; x=x+20) {
    for (y = 0; y < height+20; y=y+20) {
      d = dist(cx, cy, x, y); 
      r = d/maxdist * 99;
      ellipse( x, y, r, r);
    }
  }
  cx = cx + changex;
  cy = cy + changey;

  if ((cx >= width) || (cx <= 0)) {
    println("bingo");
    changex*=-1;
  }

  if ((cy >= height) || (cy <= 0)) {
    changey*=-1;
  }
  //if (showfps==true) {
  //  if (frameCount % 60 == 0) {
  //    fps="fps "+ int(frameRate);
  //  }
  //  textSize(22);
  //  text(fps, 0, 18);
  //}
}