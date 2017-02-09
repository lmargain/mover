int maxBoids = 200;
Boid[] boids;
Attractor a;
Repellor rep;

void setup() {
  frameRate(60);
  boids = new Boid[maxBoids];
  size(1920, 1080);
  background(60, 25, 36);
  a = new Attractor(30, new PVector(width/2, height/2), color(0, 255, 0));
  rep = new Repellor(30, new PVector(width/2, height/2), color(255, 0, 0));
  loadBoids();
  
}

void draw() {
  //background(60, 25, 36);
  fill(20, 20, 40, 22);
  rect(0,0,width, height);
  for (int i = 0; i< maxBoids; i++) {
    boids[i].run();
  }
  a.run();
  rep.run();
}

//  Load array of boids with Boid objects
void loadBoids(){
  for(int i = 0; i < boids.length; i++ ){
    int r = (int)random(12,25);
    color c = color((int)random(20, 100), (int)random(50, 200), (int)random(100, 255));
    int x = (int)random(width);
    int y = (int)random(height);
    PVector l = new PVector(x, y);
    boids[i] = new Boid(r, l, c);
  }
  
}


