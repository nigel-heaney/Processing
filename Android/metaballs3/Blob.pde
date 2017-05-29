class Blob {
  PVector pos;
  float r;
  PVector vel;

  Blob(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(2, 3));
    r = random(pg.width, pg.width * 1.5);
  }

  void update() {
    pos.add(vel); 
    if (pos.x > pg.width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > pg.height || pos.y < 0) {
      vel.y *= -1;
    }
  }
}