Boolean showfps=true;
String fps="";

int ideal_fps=24;
float speed;
PImage img_port, img_land;
//Boolean tuned=false;

int maxR=5;
int halfW, halfH;
int detectChange=width;

Star[] stars = new Star[800];
int numstars=100;

void setup() {
  fullScreen();
  colorMode(RGB);
  background(0);
  noSmooth();
  //smooth();
  frameRate(ideal_fps);

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  img_port = loadImage("Milky1P2.jpg");
  img_land = loadImage("Milky1L2.jpg");
  //img_port = loadImage("milky1_blue_1080_portrait_new.jpg");
  //img_land = loadImage("milky1_blue_1080_landscape_new.jpg");
  speed=8;
  if ((width > 1919) || (height > 1919)) {
    maxR=10;
  }
}

void draw() {
  if (detectChange != width) {
    background(0);
  }
  if (width > height) {
    image(img_land, 0, 0, width, height);
  } else {
    image(img_port, 0, 0, width, height);
  }
  halfW=width/2;
  halfH=height/2;
  //pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < numstars; i++) {
    stars[i].update();
    stars[i].show();
  }  
  //popMatrix();

  //if ((frameCount % 20 == 0) && (tuned != true)) {
  if (frameCount % 20 == 0) {
    if (frameRate >= ideal_fps/2+2) {
      numstars += 50;
    } else {
      numstars -= 10;
    } 
    
    
    //else((frameRate > ideal_fps * 0.75) && (frameRate <= ideal_fps-3)) {
    //  numstars -= 10;
    //} 
    ////else {
    //  tunedCount++;
    //  if (tunedCount >= 10) {
    //    //tuned=true;
    //  }
    //}

    if (numstars > 800) {
      numstars=800;
      //tuned=true;
    }

    if (numstars < 100) {
      numstars=100;
    }
  }

  if (showfps==true) {
    if (frameCount % ideal_fps == 0) {
      fps="fps "+ int(frameRate);
    }
    fill(255, 255, 255);
    textSize(22);
    text(fps, -width/2, -height/2+118);
    text("#Stars " + numstars, -width/2, -height/2+140);
    text("ideal " + ideal_fps + "W/H" + width + "|" + height, -width/2, -height/2+170);
  }
}