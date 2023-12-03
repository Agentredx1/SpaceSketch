

int[][]stars;
PShape ship;
float tilt = .5;

void setup(){
  size(800, 500, P3D);
  background(0);
  
  stars = new int[100][2];
  for(int i = 0; i < 100; i++){
    int x = int(random(width));
    int y = int(random(height));
    stars[i][0] = x;
    stars[i][1] = y;  
  }
  ship = loadShape("ship.obj");
  ship.scale(200);
  ship.rotateX(radians(0));
  ship.rotateY(radians(0));
  ship.rotateZ(radians(0));
}

void draw(){
  frameRate(20);
  //background
  fill(0,20);
  rect(0,0, width, height);
  
  translate(width/2, height/2 + 100, 0);
  shape(ship);
}
