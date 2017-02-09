abstract class Mover {
  int radius = 0;
  color clr = color(0, 0, 0);
  PVector loc;  
  PVector vel;
  PVector force;
  PVector acc;
  boolean orbit = false;
  Mover(int r, PVector l, color c) {
    radius = r;
    loc = l;
    vel = new PVector (random(-1.6, 1.6), random(-1.6, 1.6));
    acc = new PVector (random(-.9, .9), random(-.9, .9));
    clr =c;
  }

  void run(){
    update();
    checkEdges();
    render();
  }
  void update() {
 
    
    vel.add(acc);
    loc.add(vel);
    vel.limit(2);
    acc.mult(0);
  }

  void render() {
    noStroke();
    fill(clr);
    ellipse(loc.x, loc.y, radius, radius);
    if(orbit){
    stroke(255);
    fill(150, 220, 50);
    line(loc.x, loc.y, a.loc.x, a.loc.y);     
    } 
  }

  void checkEdges() {
    if (loc.x>width) vel.x *= -1;
    if (loc.y>height) vel.y *= -1;
    if (loc.x<0) vel.x *= -1;
    if (loc.y<0) vel.y *= -1;
  }
}

