void setup(){
  size(700, 700);
  background(0);
}

void draw(){
  
  noStroke();
  //fill(74,194,74);
  //circle(random(width), random(height), 10);
  //fill(0);
  //circle(random(width), random(height), 10);
  //fill(255);
  //circle(random(width), random(height), 10);
  
  stroke(0);
  strokeWeight(1);
  line(random(width), random(height), 0,0);
  stroke(255);
  strokeWeight(1);
  line(random(width), random(height), 350,0);
  stroke(255);
  strokeWeight(1);
  line(random(width), random(height), 700,0);
  stroke(0);
  strokeWeight(1);
  line(random(width), random(height), 700,350);
  strokeWeight(1);
  line(random(width), random(height), 700,700);
  stroke(255);
  strokeWeight(1);
  line(random(width), random(height), 350,700);
  stroke(255);
  strokeWeight(1);
  line(random(width), random(height), 0,700);
  stroke(0);
  strokeWeight(1);
  line(random(width), random(height), 0,350);
  
  //noStroke();
  //fill(74,194,74);
  //square(random(width), random(height), 10);
  //fill(255);
  //square(random(width), random(height), 10);
  //fill(0);
  //square(random(width), random(height), 10);;
  
}
