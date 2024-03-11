void setup(){
  // canvas size
  size(800, 800);
}

// this code block runs every frame
void draw(){
  // change background color
  background(255,255,255);
  
  // background design
  fill(0,0,0);
  stroke(0,0,0);
  triangle(800, 400, 800, 250, 400, 400);
  triangle(800, 800, 800, 550, 400, 400);
  triangle(400, 800, 550, 800, 400, 400);
  triangle(0, 800, 250, 800, 400, 400);
  triangle(0, 400, 0, 550, 400, 400);
  triangle(0, 0, 0, 250, 400, 400);
  triangle(400, 0, 200, 0, 400, 400);
  triangle(800, 0, 800, -450, 400, 400);
  
  // text position
  translate(width * 0.5, height * 0.5);
  textAlign(CENTER, CENTER);
  
  // main text
  rotate(frameCount * 0.05);
  fill(0,0,255);
  text("Lack of charisma can be fatal,", 0, 0);
  
  // blend text 1
  rotate(TAU * -0.01 * frameCount * 0.07);
  fill(255,0,0);
  text("Lack of charisma can be fatal,", 25, 25);
  
  // blend text 2
  rotate(TAU * -0.015 * frameCount * 0.09);
  fill(150,150,150);
  text("Lack of charisma can be fatal,", 50, 50);
  
  // blend text 3
  rotate(TAU * -0.02 * frameCount * 0.11);
  fill(0,255,0);
  text("Lack of charisma can be fatal,", 75, 75);
  
  // blend text 4
  rotate(TAU * -0.03 * frameCount * 0.13);
  fill(75,75,75);
  text("Lack of charisma can be fatal,",100, 100);
  
  
  
  // save the image
  if (frameCount == 1) {
    save("output.png");
  }
}
