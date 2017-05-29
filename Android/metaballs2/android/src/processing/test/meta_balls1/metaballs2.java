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

public class metaballs2 extends PApplet {

Boolean showfps=true;
String fps="";


PGraphics pg;
//PImage pg;
Blob[] blobs = new Blob[5];
float brightness;

public void setup() {
  
  //fullScreen();
  colorMode(HSB);
  pg = createGraphics(width/4, height/4,P3D);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(pg.width), random(pg.height));
  }
}

public void draw() {
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
      fps="fps "+ PApplet.parseInt(frameRate);
    }
    textSize(22);
    text(fps, 0, 18);
  }
}
class Blob {
  PVector pos;
  float r;
  PVector vel;

  Blob(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(2, 3));
    r = random(pg.width, pg.width * 1.5f);
  }

  public void update() {
    pos.add(vel); 
    if (pos.x > pg.width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > pg.height || pos.y < 0) {
      vel.y *= -1;
    }
  }
}
  public void settings() {  size(640, 360,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "metaballs2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
