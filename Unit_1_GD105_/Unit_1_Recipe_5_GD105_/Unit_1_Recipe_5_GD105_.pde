//Album Name "Dark Side of the Moon", Album Artist:Pink Floyd
void setup() {
  size(400, 400);
}  
void draw() {
  background(0);
  
  // Draw the prism outline
  strokeWeight(0);
  triangle(200,100,300,300,100,300);
  fill(0);
  
  // Draw the prism
  strokeWeight(0);
  triangle(200,108,295,297,105,297);
  fill(255);
 
 //Draw white line that goes into the prism
  stroke(255);
  strokeWeight(7);
  point(0,220);
  line(0,220,149,200); 
  
  //Draw the trangle in the prism
  stroke(255);
  strokeWeight(7);
  triangle(147,202,249,208,233,175);
  //Draw the rainbow spectrum
  
  //Red
  stroke(255,0,0);
  strokeWeight(7);
  point(240,175);
  line(241,175,402,200);
  
  //Orange
  stroke(255,165,0);
  strokeWeight(7);
  point(243,181);
  line(242,180,402,206);
  
  //Yellow
  stroke(255,255,0);
  strokeWeight(7);
  point(247,190);
  line(245,186,402,212);
  
  //Green
  stroke(0,255,0);
  strokeWeight(7);
  point(250,196);
  line(250,193,402,217);
  
  //Blue
  stroke(0,0,255);
  strokeWeight(7);
  point(253,200);
  line(256,199,402,224);
  
  //Purple
  stroke(128,0,128);
  strokeWeight(7);
  point(255,206);
  line(259,207,402,232);
  
   // save the image
  if (frameCount == 1) {
    save("output.png");
  }
}
