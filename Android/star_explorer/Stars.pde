class Star {
  float x, y, z, c, pz, l;

  Star() {
    x = random(-halfW, halfW);
    y = random(-halfH, halfH);
    z = random(halfW);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = random(halfW);
      x = random(-halfW, halfW);
      y = random(-halfH, halfH);
      pz = z;
    }
  }

  void show() {
    float sx = map(x / z, 0, 1, 0, halfW);
    float sy = map(y / z, 0, 1, 0, halfH);
    float r = map(z, 0, halfW, maxR, 0);
    float px = map(x / pz, 0, 1, 0, halfW);
    float py = map(y / pz, 0, 1, 0, halfH);
    pz = z;
    c=map(z, 0, 255, 255, 200);
    strokeWeight(maxR-1);
    stroke(c, c, c, 25);
    line(px, py, sx, sy);

    fill(c, c, c);
    noStroke();
    ellipse(sx, sy, r, r);
  }
}