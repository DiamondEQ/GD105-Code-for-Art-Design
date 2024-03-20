//Artist:Piet Mondrian , Title: COMPOSITION C (NO.III WITH RED, YELLOW AND BLUE), Year: 1930, link: https://www.thehistoryofart.org/piet-mondrian/composition-c/
//Canvas size
void setup() {
  size(350, 357);
}

void draw() {
  background(255);
  
  //Line #1
  strokeWeight(8);
  point(183, 0);
  line(183, 0, 183, 401);

  //Line #2
  strokeWeight(10);
  point(0, 159);
  line(0, 159, 373, 159);

  //Line #3
  strokeWeight(7);
  point(308, 354);
  line(308, 354, 308, 255);

  //Line #4
  strokeWeight(10);
  point(350, 256);
  line(0, 256, 350, 256);

  //Line #5
  strokeWeight(6);
  point(39, 356);
  line(39, 356, 39, 256);

  // save the image
  if (frameCount == 1) {
    save("output.png");
  }
}
