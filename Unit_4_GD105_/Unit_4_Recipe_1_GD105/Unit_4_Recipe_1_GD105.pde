ArrayList<DynamicText> words = new ArrayList<DynamicText>();

void setup() {
  size(800, 600);
  String poem = 
    "In Alcatraz, where pain is in constant tread, Lies the tale of the Mob of the Dead. Sal, Billy, Finn and The Weasel trapped, their fate unkind, Seeking escape, whatever way to find. " +
    "Within the prison, grim and cold, Electric chairs and secrets are bold. A plane to build, in parts it hides, Across the map, their fears will collide. " +
    "First the key, from Warden’s grasp, Then plane parts scatter across the map, a very daunting task. Unlock the doors and secrets with afterlife, Through its ghostly paths, they will be reasons to fight. " +
    "The Blundergat, a weapon that is a fearsome tool, And Hell’s Retriever, a tomahawk axe which need spirits to rule. Feed the Hounds with zombies slain, To wield the axe, in hellish bane. " +
    "Fly to the Golden Gate Bridge with the built plane, a hellish flight, into the face of undead in the darkest of nights. Electric chairing back to Alcatraz, they’re sent once more, In a cycle thats endless, for their fates to implore. " +
    "After three more plane flight filled with fuel, Steps to redemption requires volts, the four in pain, Must collect the logs after the codes in four, for the chance of the cycle to break or maintain. In Afterlife, their sins confess, To break the loop, or live in constant distress. " +
    "A map of dread, where terrors spread, In Mob of the Dead, where hope is bled. Easter egg’s tale, a ghostly game, To break the cycle, or live in eternal pain.";
  
  String[] wordsArray = splitTokens(poem, " ");

  float x = 10;
  float y = 70; // Adjusted initial y position for better readability
  textSize(16); // Set initial text size
  for (String word : wordsArray) {
    words.add(new DynamicText(word, x, y));
    x += textWidth(word + " ");
    if (x > width - 100) {
      x = 10;
      y += 30;
    }
  }
}

void draw() {
  background(0);
  textSize(24);
  fill(255);
  text("BO2 (Black Ops 2) MOTD (Mob Of The Dead) Poem", 10, 40); // Title text

  textSize(16);
  for (DynamicText word : words) {
    word.display();
  }

  // Add instructional text at the bottom
  textSize(14);
  fill(200); // Slightly lighter color for instructional text
  text("Drag and move the words around, to create your own poem that makes you proud. Good Luck", 125, height - 10);
}

void mousePressed() {
  for (DynamicText word : words) {
    word.checkIfPressed();
  }
}

void mouseDragged() {
  for (DynamicText word : words) {
    word.drag();
  }
}

void mouseReleased() {
  for (DynamicText word : words) {
    word.release();
  }
}

class DynamicText {
  String text;
  float x, y;
  boolean isBeingDragged = false;
  float offsetX, offsetY;

  DynamicText(String text, float x, float y) {
    this.text = text;
    this.x = x;
    this.y = y;
  }

  void display() {
    if (isBeingDragged) {
      fill(0, 155, 255); // Highlight the word being dragged
    } else if (isHovered()) {
      fill(255, 0, 0); // Highlight the word being hovered
    } else {
      fill(255, 165, 0); // Default color
    }
    text(text, x, y);
  }

  void checkIfPressed() {
    float textW = textWidth(text);
    float textH = textAscent() + textDescent(); // Accurate text height
    if (mouseX > x && mouseX < x + textW && mouseY > y - textH && mouseY < y) {
      isBeingDragged = true;
      offsetX = mouseX - x;
      offsetY = mouseY - y;
    }
  }

  void drag() {
    if (isBeingDragged) {
      x = constrain(mouseX - offsetX, 0, width - textWidth(text));
      y = constrain(mouseY - offsetY, textAscent(), height - textDescent());
    }
  }

  void release() {
    isBeingDragged = false;
  }

  boolean isHovered() {
    float textW = textWidth(text);
    float textH = textAscent() + textDescent();
    return (mouseX > x && mouseX < x + textW && mouseY > y - textH && mouseY < y);
  }
}
