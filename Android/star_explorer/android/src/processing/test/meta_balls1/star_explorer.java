package processing.test.meta_balls1;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class star_explorer extends PApplet {

// starfield - live wallpaper of flying through space with nebula/galaxy as backdrop.

Boolean showfps=true;
String fps="";

int ideal_fps=24;
float speed;
PImage img_port,img_land;
Boolean tuned=false;
int tunedCount=0;
int maxR=5;
int halfW,halfH;
int detectChange=width;

Star[] stars = new Star[800];
int numstars=10;

public void setup() {
  
  colorMode(HSB);
  background(0);
  //noSmooth();
  
  frameRate(ideal_fps);

  for (int i = 0; i < 800; i++) {
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

public void draw() {
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
  //image(img_land, 0, 0, width, height);
  translate(width/2, height/2);
  for (int i = 0; i < numstars; i++) {
    stars[i].update();
    stars[i].show();
  }  

  if ((frameCount % 20 == 0) && (tuned != true)) {
    if (frameRate > ideal_fps-2) {
      numstars += 50;
    } else if ((frameRate > ideal_fps*0.5f) && (frameRate < ideal_fps*0.75f)) {
      numstars -= 50;
    } else if ((frameRate > ideal_fps * 0.75f) && (frameRate < ideal_fps-3)) {
      numstars -= 50;
    } else {
      tunedCount++;
      if (tunedCount >= 10) {
        tuned=true;
      }
    }
    
    if (numstars >= 800) {
      numstars=800;
      tuned=true;
    }
  }

  //if (showfps==true) {
  //  if (frameCount % ideal_fps == 0) {
  //    fps="fps "+ int(frameRate);
  //  }
  //  fill(255,255,255);
  //  textSize(22);
  //  text(fps, -width/2, -height/2+118);
  //  text("#Stars " + numstars, -width/2, -height/2+140);
  //  text("ideal " + ideal_fps + "W/H" + width + "|" + height, -width/2, -height/2+170);
  //}
}
class Star {
  float x, y, z, c, pz, l;

  Star() {
    x = random(-halfW, halfW);
    y = random(-halfH, halfH);
    z = random(halfW);
    pz = z;
  }

  public void update() {
    z = z - speed;
    if (z < 1) {
      z = random(halfW);
      x = random(-halfW, halfW);
      y = random(-halfH, halfH);
      pz = z;
    }
  }

  public void show() {
    float sx = map(x / z, 0, 1, 0, halfW);
    float sy = map(y / z, 0, 1, 0, halfH);
    float r = map(z, 0, halfW, maxR, 0);
    float px = map(x / pz, 0, 1, 0, halfW);
    float py = map(y / pz, 0, 1, 0, halfH);
    pz = z;
    c=map(z, 0, 255, 255, 200);
    //strokeWeight(maxR-1);
    //stroke(c, c, c, 32);
    //line(px, py, sx, sy);

    //fill(c, c, c);
    strokeWeight(0);
    fill(255);
    //noStroke();
    ellipse(sx, sy, r, r);
    fill(255,255,255);
    ellipse(0,0,50,50);
    fill(128);
    rect(50,200,50,50);
    
  }
}
  public void settings() {  fullScreen(P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "star_explorer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
