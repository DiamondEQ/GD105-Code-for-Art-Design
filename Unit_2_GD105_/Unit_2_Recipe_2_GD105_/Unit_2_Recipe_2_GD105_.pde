void setup(){
  size(700, 700);
  background(0);
}

void draw(){
  
  
  stroke(255,255,0);
  strokeWeight(1);
  line(random(width), random(height), 0,0);
  
  stroke(255,0,0);
  strokeWeight(1);
  line(random(width), random(height), 350,0);
  
  stroke(255, 0, 255);
  strokeWeight(1);
  line(random(width), random(height), 700,0);
  
  stroke(255);
  strokeWeight(1);
  line(random(width), random(height), 350,350);
  
  stroke(0,0,255);
  strokeWeight(1);
  line(random(width), random(height), 700,700);
  
  stroke(0,255,255);
  strokeWeight(1);
  line(random(width), random(height), 350,700);
  
  stroke(0,255,0);
  strokeWeight(1);
  line(random(width), random(height), 0,700);
  
  stroke(255);
  strokeWeight(1);
  line(random(width), random(height), 350,350);
  
}
