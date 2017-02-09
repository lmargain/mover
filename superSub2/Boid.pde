class Boid extends Mover {
  boolean atrOrbit, repOrbit;
  
  Boid(int r, PVector loc, color c) {// constructor
    super(r, loc, c);
    atrOrbit = false;
    repOrbit = false;
  }

  void update() {
   // calc acc to atractor
    if (this.loc.dist(a.loc) < 250) {
      atrOrbit = true;
      acc = PVector.sub(a.loc, loc);
      acc.normalize();
      acc.mult(a.getForce());
    } 
    else {
      atrOrbit = false;
    }
   // calc acc to repellor
   if (this.loc.dist(rep.loc) < 250) {
      repOrbit = true;
      acc = PVector.sub(rep.loc, loc);
      acc.normalize();
      acc.mult(rep.getForce());
    } 
    else {
      repOrbit = false;
    }
    //update loc and vel
    vel.add(acc);
    loc.add(vel);
    if(vel.mag() > 8) vel.mult(0);
    // reset acc
    acc.mult(0);
  }

  void render() {
    noStroke();
    fill(clr);
    ellipse(loc.x, loc.y, radius, radius);
    if (atrOrbit) {
      stroke(0, 255, 0);
      fill(150, 220, 50);
      line(loc.x, loc.y, a.loc.x, a.loc.y);
    }
    
    if (repOrbit) {
      stroke(255, 0, 0);
      fill(150, 220, 50);
      line(loc.x, loc.y, rep.loc.x, rep.loc.y);
    }
  }
}

