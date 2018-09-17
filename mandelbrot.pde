int steps = 15;

float value;
float anchorx,anchory = 0;
float zoom = 1;
float mx,my;

boolean detail = false;
int max_iterations;
float frame = 0;

void update(){
  if(detail)max_iterations = 1000;
  else max_iterations = 100;
  loadPixels();
  for(float y = 0; y < height; y++){
    for(float x = 0; x < width; x++){
      
      float a = (x-(width/2))/(zoom*100) +anchorx;
      float b = ((height/2)-y)/(zoom*100)+anchory;
      
      float z = 0;
      float zi = 0;
      float temp = 0;
      
      int iterations = 0;
      while((sq(zi)+sq(z) < 4)&&(iterations<max_iterations)){
        temp = sq(z) - sq(zi) + a;
        zi = 2*z*zi + b;
        z = temp;
        iterations++;
        //a = +z-zi;
        //b = -z+zi;
      }
      pixels[int(x+y*width)] = color(iterations%127,iterations%63,iterations%255);
    }
  }
  updatePixels();
}


void setup(){
  size(1200,800);
  anchorx = 0;
  anchory = 0;
  
  noStroke();
}

void draw(){
  background(0);
  
  mx = anchorx + (mouseX-(width/2))/(100*zoom);
  my = anchory + ((height/2)-mouseY)/(100*zoom);
  
  update();
  fill(255);
  ellipse(mouseX,mouseY,5,5);
  fill(255,0,0);
  text("z="+mx+"+"+my+"i",mouseX+5,mouseY);
  text("zoom = " + floor(zoom) + " = 2^" + int(log(zoom)/log(2)),0,20);
  
}