//Artist:Piet Mondrian , Title: Composition with Red, Blue and Yellow, Year: 1930, link: https://www.thehistoryofart.org/piet-mondrian/paintings/
void setup() {
  size(400, 401);
}

void draw() {
  background(255);
  
  strokeWeight(12);
  point(90, 0);
  line(90,0,90,401);
  
  strokeWeight(11);
  point(0, 292);
  line(0,292,400,292);
  
  strokeWeight(13);
  point(363, 345);
  line(363, 400, 363,295);
  
  strokeWeight(18);
  point(366, 350);
  line(366, 350, 400,350);
  
  
  strokeWeight(26);
  point(0, 127);
  line(0,127,83,127);
  
  strokeWeight(0);
  fill(255,0,0);
  rect(96, -10, 400, 297);
  
  strokeWeight(0);
  fill(0,0,255);
  rect(0,298,85,200);
  
  strokeWeight(0);
  fill(255,255,0);
  rect(370,359,85,70);
}
