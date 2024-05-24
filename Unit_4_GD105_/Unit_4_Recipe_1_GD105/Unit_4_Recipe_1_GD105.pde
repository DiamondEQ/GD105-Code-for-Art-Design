import java.util.Collections;
ArrayList<TextWord> textWords;
ArrayList<TextWord> backgroundWords;
ArrayList<TextWord> shuffledTextWords;

void setup() {
  size(800, 750);
  textWords = new ArrayList<>();
  backgroundWords = new ArrayList<>();
  shuffledTextWords = new ArrayList<>();
  
  // Creating TextWord objects for each word
  String[] words1 = {
    "Now", "I", "done", "grew", "up", "'round", "some", "people", "livin'", "their", "life", "in", "bottles,",
    "Granddaddy", "had", "the", "golden", "flask,", "Backstroke", "every", "day", "in", "Chicago,",
    "Some", "people", "like", "the", "way", "it", "feels,",
    "Some", "people", "wanna", "kill", "their", "sorrows,",
    "Some", "people", "wanna", "fit", "in", "with", "the", "popular,", "that", "was", "my", "problem."
  };
  String[] words2 = {
    "I", "was", "in", "the", "dark", "room,", "loud", "tunes,", "lookin'", "to", "make", "a", "vow", "soon,",
    "That", "I'ma", "get", "fucked", "up,", "fillin'", "up", "my", "cup,", "I", "see", "the", "crowd", "mood",
    "Changin'", "by", "the", "minute", "and", "the", "record", "on", "repeat,",
    "Took", "a", "sip,", "then", "another", "sip,", "then", "somebody", "said", "to", "me,"
  };
  String[] words3 = {
    "N****", "why", "you", "babysittin'", "only", "two", "or", "three", "shots?",
    "I'ma", "show", "you", "how", "to", "turn", "it", "up", "a", "notch,",
    "First", "you", "get", "a", "swimming", "pool", "full", "of", "liquor", "then", "you", "dive", "in", "it,",
    "Pool", "full", "of", "liquor", "then", "you", "dive", "in", "it."
  };
  String[] words4 = {
    "I", "wave", "a", "few", "bottles,", "then", "I", "watch", "'em", "all", "flock,",
    "All", "the", "girls", "wanna", "play", "Baywatch,",
    "I", "got", "a", "swimming", "pool", "full", "of", "liquor", "and", "they", "dive", "in", "it,",
    "Po-pool", "full", "of", "liquor", "I'ma", "dive", "in", "it."
  };
  
  float x = 50;
  float y = 50;
  float textAreaHeight = 60;
  float textAreaTop = height - textAreaHeight;
  float wordAreaTop = 0;
  float wordAreaBottom = textAreaTop - 20;

  for (String word : words1) {
    TextWord tw = new TextWord(word, x, y);
    textWords.add(tw);
    backgroundWords.add(new TextWord(word, x, y, true)); // Add as background word
    x += textWidth(word) + 5;
    if (x > width - 100) {
      x = 50;
      y += 30;
    }
  }
 for (String word : words2) {
    TextWord tw = new TextWord(word, x, y);
    textWords.add(tw);
    backgroundWords.add(new TextWord(word, x, y, true)); // Add as background word
    x += textWidth(word) + 5;
    if (x > width - 100) {
      x = 50;
      y += 30;
    }
  }
  for (String word : words3) {
    TextWord tw = new TextWord(word, x, y);
    textWords.add(tw);
    backgroundWords.add(new TextWord(word, x, y, true)); // Add as background word
    x += textWidth(word) + 5;
    if (x > width - 100) {
      x = 50;
      y += 30;
    }
  }
for (String word : words4) {
    TextWord tw = new TextWord(word, x, y);
    textWords.add(tw);
    backgroundWords.add(new TextWord(word, x, y, true)); // Add as background word
    x += textWidth(word) + 5;
    if (x > width - 100) {
      x = 50;
      y += 30;
    }
  }
  // Randomize the locations of the non-background words
  for (TextWord tw : textWords) {
    if (!tw.background) {
      float newX = random(50, width - 100);
      float newY = random(wordAreaTop, wordAreaBottom);
      tw.x = newX;
      tw.y = newY;
    }
  }

  // Do not shuffle background words
  shuffledTextWords.addAll(textWords);
  Collections.shuffle(shuffledTextWords.subList(0, textWords.size())); // Shuffle only non-background words
}


void draw() {
  background(255);
  for (TextWord bw : backgroundWords) {
    bw.display();
  }
  for (TextWord tw : shuffledTextWords) {
    tw.display();
  }
  
  // Display artist and song information at the bottom of the canvas
  fill(0);
  text("Artist: Kendrick Lamar", width/2, height - 40);
  text("Song: Swimming Pools (Drank)", width/2, height - 20);
}

void mousePressed() {
  boolean wordPicked = false;
  for (TextWord tw : shuffledTextWords) {
    if (tw.contains(mouseX, mouseY) && !tw.background && !wordPicked) {
      tw.dragging = true;
      tw.offsetX = mouseX - tw.x;
      tw.offsetY = mouseY - tw.y;
      wordPicked = true;
    } else {
      tw.dragging = false; // Ensure other words are not dragged
    }
  }
}
void mouseReleased() {
  for (TextWord tw : shuffledTextWords) {
    if (tw.dragging) {
      for (TextWord bw : backgroundWords) {
        if (bw.contains(tw.x + textWidth(tw.word) / 2, tw.y + textDescent() / 2) && tw.word.equals(bw.word)) {
          tw.x = bw.x;
          tw.y = bw.y;
          tw.dragging = false;
          tw.fillColor = color(0, 255, 0); // Change color to green
          tw.interactable = false; // Set to non-interactable
        }
      }
      tw.dragging = false;
    }
  }
}

void mouseDragged() {
  for (TextWord tw : shuffledTextWords) {
    if (tw.dragging && tw.interactable) {
      tw.x = mouseX - tw.offsetX;
      tw.y = mouseY - tw.offsetY;
    }
  }
}


class TextWord {
  String word;
  float x, y;
  float offsetX, offsetY;
  boolean background;
  color fillColor;
  boolean interactable = true;
  boolean dragging = false; // Added dragging field
  
  // Constructor for regular words
  TextWord(String word, float x, float y) {
    this.word = word;
    this.x = x;
    this.y = y;
    this.background = false; // Regular words are not background words
    this.fillColor = color(0); // Default fill color
  }
  
  // Constructor for background words
  TextWord(String word, float x, float y, boolean background) {
    this.word = word;
    this.x = x;
    this.y = y;
    this.background = background;
    this.fillColor = color(0, 50); // Default fill color for background words
  }
  
  void display() {
    fill(fillColor);
    text(word, x, y);
  }
  
  boolean contains(float px, float py) {
    float tw = textWidth(word);
    return px > x && px < x + tw && py > y - textAscent() && py < y + textDescent();
  }
} 
