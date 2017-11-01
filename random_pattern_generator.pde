
int elementRate = 25; // distance between elements.
int hue = 0;
int radiusOfMouseGravity = 35;
int approximateNumberOfPoints;
int hueIncrement = 1; 

void setup() {
  fullScreen();
  //size(520, 520);
  background(50);
  strokeWeight(2);
  smooth();
  noCursor();
  frameRate(60);
  approximateNumberOfPoints = (int)(width*height/pow(elementRate, 2));
  
  colorMode(HSB, 3600, 100, 100);
}

void draw() { 
  
  background(50); // teststs
  for(int x = 5; x <= width; x += elementRate) {
    for(int y = 5; y <= height; y += elementRate) {
      drawPoint(x, y);
      changeColor();
    }
  }
}

void drawPoint(int x, int y) {
  //if (mousePressed) {
    int diffX = mouseX - x;
    int diffY = mouseY - y;
    if (abs(diffX) < radiusOfMouseGravity && abs(diffY) < radiusOfMouseGravity) {
      //strokeWeight(1);
      if (abs(mouseX - x) < elementRate && abs(mouseY - y) < elementRate) {
        beginShape();
        vertex(mouseX, mouseY);
        vertex(x, y);
        endShape();
      }
      if (random(1) < 0.01 && pmouseX - mouseX != 0) {
        beginShape();
        vertex(mouseX, mouseY);
        vertex(x, y);
        endShape();
      } else {
        strokeWeight(1);
        point(x, y);
      }
    } else {
      strokeWeight(1);
      point(x, y);
    }
}

int getOffset(int original, int difference) {
  if (difference < 10) {
    return difference > 0 ? 5 : -5;
  } else if (difference < 20) {
    return difference > 0 ? 3 : -3;
  } else if (difference < 50) {
    return difference > 0 ? 2 : -2;
  } else {
    return difference > 0 ? 2 : -2;
  }
  
}

void changeColor() {
  //if (hue < 3600) {
    stroke(hue % 3600, 100, 100);
    hue+= hueIncrement;
  //}
}

void mousePressed() {
  hueIncrement++;
}
  