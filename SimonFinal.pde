

int[][]stars;
PShape ship;
float tilt = .5;

void setup(){
  size(800, 500, P3D);
  stars = new int[100][2];
  stars();
  background(0);
  ship = loadShape("ship.obj");
  ship.scale(200);
  ship.rotateX(radians(0));
  ship.rotateY(radians(0));
  ship.rotateZ(radians(0));
  for(int i = 0; i < 100; i++){
    int x = int(random(width) + 1);
    int y = int(random(height) + 1);
    stars[i][0] = x;
    stars[i][1] = y;  
    ellipse(x, y, 5, 5);  
   }
}

void draw(){
  frameRate(30);
  lights();
  directionalLight(255, 255, 255, -1, 0, 0);  
  beginShape();//background
  fill(0,20);
  rect(0,0, width, height);
  fill(255);
  endShape();
  stars();
  beginShape();
  translate(width/2, height/2 + 100, 0);
  shape(ship);
  endShape();
}

void stars(){

  noStroke();
  int startFrame = 20;
  int endFrame = 60;
  for(int i = 0; i < 100; i++){
    if(frameCount > startFrame && frameCount < endFrame){
      int x = stars[i][0];
      int y = stars[i][1];
      x = x - ((frameCount % width) - startFrame);
      y = y + ((frameCount % height) - startFrame);
      if(x < 0 || y > height){
        x = int(random(width) + 100);
        y = 0;
      }
      stars[i][0] = x;
      stars[i][1] = y;      
      ellipse(x, y, 5, 5);
    }else{
      ellipse(stars[i][0], stars[i][1], 5, 5);
    }
  }
}
