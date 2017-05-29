import peasy.*;

PeasyCam pCamera;

float radius = 50.0;
float rho = radius;
float x, y, z, u, v;

float phi;
int phiSteps = 20;
float phiFactor = HALF_PI / phiSteps;

float theta;
int thetaSteps = 20;
float thetaFactor = TWO_PI / thetaSteps;

PVector[] sphereVertexPoints;

PImage skin;


void setup() {
  size(400, 400, P3D);

  pCamera = new PeasyCam(this, 150);

  skin = loadImage("smiley.png");
  textureMode(NORMAL);
  noStroke();
}


void draw() {
  background(50);
  noFill(); stroke(255);
  //fill(200, 130, 0);

  // stage lighting
  directionalLight(255, 255, 255, -100, 100, -100);
  ambientLight(120, 120, 120);

  phi = 0.0;
  for(int p = 0; p < phiSteps; p++) {
    beginShape(QUAD_STRIP);
    texture(skin);
    theta = 0.0;
    for(int t = 0; t < thetaSteps + 1; t++) {
      x = rho * sin(phi) * cos(theta);
      z = rho * sin(phi) * sin(theta);
      y = -rho * cos(phi);

      u = (float)t / thetaSteps;
      v = (float)p / phiSteps;


      normal(x, y, z);
      vertex(x, y, z, u, v);

      x = rho * sin(phi + phiFactor) * cos(theta);
      z = rho * sin(phi + phiFactor) * sin(theta);
      y = -rho * cos(phi + phiFactor);

      u = (float)t / thetaSteps;
      v = (float)(p + 1) / phiSteps;

      normal(x, y, z);
      vertex(x, y, z, u, v);
    
      theta += thetaFactor;
    }
    phi += phiFactor;
    endShape(CLOSE);
  }
} 