class Repellor extends Mover {
 
  float force;
  color c;
  Repellor(int r, PVector loc, color c) {// constructor
    super(r, loc, c);
  this.c = c;
    force = -1.5;
  }
  
  
  void render() {
    noStroke();
    fill(c);
    ellipse(loc.x, loc.y, radius, radius);
  }
  
  void update() {
      super.vel.add(super.acc);
      loc.add(vel);
      vel.limit(.9);
  }
  
  float getForce(){
    return force; 
  }
  
  void checkEdges() {
    if (loc.x > width) loc.x = 0;
    if (loc.y > height) loc.y = 0;
    if (loc.x < 0) loc.x = width;
    if (loc.y < 0) loc.y = height;
  }

}



