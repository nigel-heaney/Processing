class Blob {
  PVector pos;
  float r;
  PVector vel;

  Blob(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(1, 2));
    r = random(pg.width, pg.width*8.5);
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

  //void show() {
  //  fill(0,0,0,6);
  //  noStroke();
  //  //stroke(0);
  //  //strokeWeight(1);
  //  //ellipse(pos.x, pos.y, r, r);
  //  //rect(pos.x, pos.y, r, r);
  //}
}