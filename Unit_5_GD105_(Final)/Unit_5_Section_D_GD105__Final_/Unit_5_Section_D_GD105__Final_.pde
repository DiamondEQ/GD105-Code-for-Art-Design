import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

float freq = 440;
float amplitude = 0.5;
float angle = 0;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  sine = new SineWave(freq, amplitude, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
}

void draw() {
  background(0);
  
  // Draw visual feedback based on frequency and amplitude
  fill(map(freq, 200, 1000, 0, 255), 100, 150);
  float radius = map(amplitude, 0, 1, 50, 300);
  ellipse(width/2, height/2, radius, radius);
  
  // Display frequency and amplitude
  fill(255);
  textAlign(CENTER);
  text("Frequency: " + nf(freq, 1, 2) + " Hz", width/2, height - 60);
  text("Amplitude: " + nf(amplitude, 1, 2), width/2, height - 40);
}

void keyPressed() {
  if (key == 'a') {
    freq = 261.63; // C
  } else if (key == 's') {
    freq = 293.66; // D
  } else if (key == 'd') {
    freq = 329.63; // E
  } else if (key == 'f') {
    freq = 349.23; // F
  } else if (key == 'g') {
    freq = 392.00; // G
  } else if (key == 'h') {
    freq = 440.00; // A
  } else if (key == 'j') {
    freq = 493.88; // B
  } else if (key == 'k') {
    freq = 523.25; // C
  }
  sine.setFreq(freq);
}

void mouseMoved() {
  // Change amplitude based on mouse position
  amplitude = map(mouseY, 0, height, 1, 0);
  sine.setAmp(amplitude);
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}
