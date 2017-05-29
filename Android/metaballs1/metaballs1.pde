Boolean showfps=false;
String fps="";
float c=0;
PImage pg, img;
Blob[] blobs = new Blob[3];
int[] rmode = new int[14];
int[] gmode = new int[14];
int[] bmode = new int[14];
int chosen=0, r=50, g=100, b=50;
int fin=0;

void setup() {
  //size(800, 640, P3D);
  fullScreen(P3D);
  colorMode(RGB);
  background(0);
  frameRate(24);
  pg=createImage(width/4, height/4, RGB);
  img=loadImage("skull3.png");
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(pg.width), random(pg.height));
  }
  rmode[0]=50 ; 
  gmode[0]=100; 
  bmode[0]=50;
  rmode[1]=50 ; 
  gmode[1]=50 ; 
  bmode[1]=100;
  rmode[2]=100; 
  gmode[2]=50 ; 
  bmode[2]=50;
  rmode[3]=50 ; 
  gmode[3]=100; 
  bmode[3]=100;
  rmode[4]=100; 
  gmode[4]=100; 
  bmode[4]=50;
  rmode[5]=100; 
  gmode[5]=50 ; 
  bmode[5]=100;
  rmode[6]=50 ; 
  gmode[6]=100; 
  bmode[6]=150;
  rmode[7]=150; 
  gmode[7]=100; 
  bmode[7]=50;
  rmode[8]=100; 
  gmode[8]=50 ; 
  bmode[8]=150;
  rmode[9]=50 ; 
  gmode[9]=150; 
  bmode[9]=100;

  rmode[10]=10 ; 
  gmode[10]=50; 
  bmode[10]=100;
  rmode[11]=100; 
  gmode[11]=50; 
  bmode[11]=10;
  rmode[12]=50 ; 
  gmode[12]=10; 
  bmode[12]=100;
  rmode[13]=50 ; 
  gmode[13]=100; 
  bmode[13]=10;
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
      //pg.pixels[index] = color(map(sum, 0, 400, 0, 10), map(sum, 0, 400, 0, 200), map(sum, 0, 400, 0, 100));
      //pg.pixels[index] = color(map(sum, 0, 400, 0, rmode[chosen]), map(sum, 0, 400, 0, gmode[chosen]), map(sum, 0, 400, 0, bmode[chosen]));
      pg.pixels[index] = color(map(sum, 0, 400, 0, r), map(sum, 0, 400, 0, g), map(sum, 0, 400, 0, b));
    }
  }
  pg.updatePixels();
  scale(4);
  image(pg, 0, 0);
  blend(img, 0, 0, img.width, img.height*4, (width-img.width)/2, (height-img.height)/2, img.width, img.height, OVERLAY);  
  //blend(img, 0, 0, img.width, img.height, (width-500)/2, (height-500)/2, 500, 500, OVERLAY);  
  for (Blob b : blobs) {
    b.update();
  }
  if (frameCount % 2 == 0) {
    if (r < rmode[chosen]) { 
      r++;
    } else if (r > rmode[chosen]) {
      r--;
    } else {
      fin++;
    }

    if (g < gmode[chosen]) { 
      g++;
    } else if (g > gmode[chosen]) {
      g--;
    } else {
      fin++;
    }

    if (b < bmode[chosen]) { 
      b++;
    } else if (b > bmode[chosen]) {
      b--;
    } else {
      fin++;
    }
  }

  if ((frameCount % 160 == 0) && (fin >= 3)) {
    chosen=floor(random(rmode.length));
    fin=0;
    //r=floor(random(50,150));
    //g=floor(random(50,150));
    //b=floor(random(50,150));
    //for (Blob b : blobs) {
    //  b.newblob();
    //}
  }

  if (showfps==true) {
    if (frameCount % 2 == 0) {
      fps="fps "+ int(frameRate);
    }
    textSize(14);
    text(fps, 0, 18);
    text("r="+r+"/" + rmode[chosen] + " g="+ g + "/" + gmode[chosen] + " b="+ b + "/" + bmode[chosen] + " fin="+fin, 0, 48);
  }
}