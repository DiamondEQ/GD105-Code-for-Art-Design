import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

float[] frequencies = {
  261.63, // C4
  277.18, // C#4
  293.66, // D4
  311.13, // D#4
  329.63, // E4
  349.23, // F4
  369.99, // F#4
  392.00, // G4
  415.30, // G#4
  440.00, // A4
  466.16, // A#4
  493.88, // B4
  523.25  // C5
};

boolean[] keysPressed = new boolean[frequencies.length];

void setup() {
  size(800, 600);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  sine = new SineWave(0, 0.5, out.sampleRate()); // Initialize with zero frequency
  sine.portamento(200);
  out.addSignal(sine);
}

void draw() {
  background(0);
  drawPiano();
}

void drawPiano() {
  int whiteKeyCount = frequencies.length;
  int blackKeyCount = whiteKeyCount - 1;
  int whiteKeyWidth = width / whiteKeyCount;
  int blackKeyWidth = whiteKeyWidth / 2;
  int blackKeyHeight = height / 2;
  int whiteKeyHeight = height;

  // Draw white keys
  for (int i = 0; i < whiteKeyCount; i++) {
    int x = i * whiteKeyWidth;
    fill(255);
    stroke(0);
    rect(x, 0, whiteKeyWidth, whiteKeyHeight);
    if (keysPressed[i]) {
      fill(255, 0, 0, 100);
      rect(x, 0, whiteKeyWidth, whiteKeyHeight);
    }
  }

  // Draw black keys
  for (int i = 0; i < blackKeyCount; i++) {
    if (i != 2 && i != 6 && i != 9 && i != 13) { // Skip indices to place black keys correctly
      int x = (i * whiteKeyWidth) + (3 * whiteKeyWidth / 4);
      fill(0);
      rect(x, 0, blackKeyWidth, blackKeyHeight);
      if (keysPressed[i + 1]) {
        fill(255, 0, 0, 100);
        rect(x, 0, blackKeyWidth, blackKeyHeight);
      }
    }
  }
}

void keyPressed() {
  for (int i = 0; i < frequencies.length; i++) {
    if (key == char('a' + i)) {
      keysPressed[i] = true;
      playSound();
    }
  }
}

void keyReleased() {
  boolean anyKeyPressed = false;
  for (int i = 0; i < frequencies.length; i++) {
    if (key == char('a' + i)) {
      keysPressed[i] = false;
    }
    if (keysPressed[i]) {
      anyKeyPressed = true;
    }
  }
  if (!anyKeyPressed) {
    sine.setFreq(0); // Stop sound when no keys are pressed
  }
}

void playSound() {
  for (int i = 0; i < frequencies.length; i++) {
    if (keysPressed[i]) {
      sine.setFreq(frequencies[i]);
      return;
    }
  }
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}
