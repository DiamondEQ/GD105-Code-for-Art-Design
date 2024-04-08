PImage LakerColors;
PImage TornPaper;
PImage KB;
PImage BM;
PImage Number8;
PImage Number24;
PImage Number24and8;
PImage MambaLogo;
PImage Trophy;
PImage Number5;
PImage Kobe1;
PImage Kobe2;
PImage NBAlogo;
PImage Lakerlogo;

void setup() {
  size(590, 725);
  LakerColors= loadImage("Purple and Gold BG.png");
  TornPaper= loadImage("TornPaper.png");
  KB = loadImage("KB1.png");
  BM = loadImage("KBNickName.png");
  Number8 = loadImage("Number 8's.png");
  Number24 = loadImage("Number 24'S.png");
  Number24and8 = loadImage("KB24&8.png");
  MambaLogo =  loadImage("Mamba.png");
  Trophy = loadImage("Trophy.png");
  Number5 = loadImage("5x.png");
  Kobe1 = loadImage("Kobe1.png");
  Kobe2 = loadImage("Kobe2.png");
  NBAlogo = loadImage("NBALogo.png");
  Lakerlogo = loadImage("LakerLogo.png");
}

void draw() {
  float scale = 0.22;
  background(255);
  image(LakerColors, 0, 0, LakerColors.width * scale, LakerColors.height * scale);
  image(TornPaper, 0, 0, TornPaper.width * scale, TornPaper.height * scale);
  image(KB, 506, 0, KB.width * scale, KB.height * scale);
  image(BM, 0, 0, BM.width * scale, BM.height * scale);
  image(Number8, 85, 0, Number8.width * scale, Number8.height * scale);
  image(Number24, 87, 637, Number24.width * scale, Number24.height * scale);
  image(Number24and8, 471, 88, Number24and8.width * scale, Number24and8.height * scale);
  image(MambaLogo, 95, 93, MambaLogo.width * scale, MambaLogo.height * scale);

  image(Trophy, 90, 143, Trophy.width * scale, Trophy.height * scale);

  image(Number5, 113, 417, Number5.width * scale, Number5.height * scale);

  image(Kobe1, 24, 140, Kobe1.width * scale, Kobe1.height * scale);

  image(Kobe2, 266, 331, Kobe2.width * scale, Kobe2.height * scale);

  image(NBAlogo, 224, 464, NBAlogo.width * scale, NBAlogo.height * scale);

  image(Lakerlogo, 258, 103, Lakerlogo.width * scale, Lakerlogo.height * scale);

  // save the image
  if (frameCount == 1) {
    save("output.png");
    
  }
}
