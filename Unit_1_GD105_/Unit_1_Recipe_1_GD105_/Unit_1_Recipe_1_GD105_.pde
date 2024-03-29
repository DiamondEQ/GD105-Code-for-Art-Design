//Artist:Piet Mondrian , Title: COMPOSITION C (NO.III WITH RED, YELLOW AND BLUE), Year: 1930, link: https://www.thehistoryofart.org/piet-mondrian/composition-c/
//Canvas size
void setup() {
  size(399, 392);
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
  line(0, 159, 399, 159);

  //Line #3
  strokeWeight(7);
  point(308, 354);
  line(308, 393, 308, 262);

  //Line #4
  strokeWeight(10);
  point(399, 256);
  line(0, 256, 398, 256);

  //Line #5
  strokeWeight(6);
  point(39, 392);
  line(39, 392, 39, 256);

  //Line #6
  strokeWeight(7);
  point(182, 374);
  line(182, 374, 308, 374);

  // save the image
  if (frameCount == 0) {
    save("output.png");
  }
}
