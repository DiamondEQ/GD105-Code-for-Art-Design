//Artist:Piet Mondrian , Title: Composition with Red, Blue and Yellow, Year: 1930, link: https://www.thehistoryofart.org/piet-mondrian/paintings/

//Canvas Size
void setup() {
  size(400, 401);
}

void draw() {
  background(255);

  //Line #1
  strokeWeight(12);
  point(90, 0);
  line(90, 0, 90, 401);

  //Line #2
  strokeWeight(11);
  point(0, 292);
  line(0, 292, 400, 292);

  //Line #3
  strokeWeight(13);
  point(363, 345);
  line(363, 400, 363, 295);

  //Line #4
  strokeWeight(18);
  point(366, 350);
  line(366, 350, 400, 350);

  //Line #5
  strokeWeight(26);
  point(0, 127);
  line(0, 127, 83, 127);

  //Color #1
  strokeWeight(0);
  fill(221, 39, 35);
  rect(96, -10, 400, 297);

  //Color #2
  strokeWeight(0);
  fill(0, 92, 157);
  rect(0, 298, 85, 200);

  //Color #3
  strokeWeight(0);
  fill(226, 219, 105);
  rect(370, 359, 85, 70);

  // save the image
  if (frameCount == 1) {
    save("output.png");
  }
}
