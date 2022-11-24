int appWidth, appHeight;
float startButtonX, startButtonY, startButtonWidth, startButtonHeight, roundCorners;
float pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
Boolean start=false, trueStart=false, pause=false;
color startButtonColour, pauseButtonColour, quitButtonColour, purple = color(127.5, 0, 255), lightBlue = color(150, 150, 255), blue = color(0, 0, 255), grassGreen = color(10, 90, 10), red = color(255, 0, 0), lightRed = color(255, 150, 150);
PImage backgroundImage;

void setup() {
  fullScreen();
  size(displayWidth, displayHeight);
  backgroundImage = loadImage("../Images/Landscape/grass_background.jpg");
  appWidth = width;
  appHeight = height;
  roundCorners = appWidth/100;
  startButtonX = appWidth/4;
  startButtonY = appHeight/4;
  startButtonWidth = appWidth/2;
  startButtonHeight = appHeight/2;
  pauseButtonX = appWidth/3;
  pauseButtonY = appHeight/3;
  pauseButtonWidth = appWidth/3;
  pauseButtonHeight = appHeight/3;
  quitButtonX = appWidth/20;
  quitButtonY = appHeight*2/5;
  quitButtonWidth = appWidth/5;
  quitButtonHeight = appHeight/5;
}

void draw() {
  if (start==false) {
    background(purple);
    fill(startButtonColour);
    rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight, roundCorners);
  } else {
    background(0);
    image(backgroundImage, 0, 0, width, height);
    if (pause==true) {
      fill(pauseButtonColour);
      rect(pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight, roundCorners);
      fill(quitButtonColour);
      rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight, roundCorners);
    }
  }
  //
  println ("start:", start);
  println ("pause:", pause);
  if (mouseX>startButtonX && mouseY>startButtonY && mouseX<startButtonX+startButtonWidth && mouseY<startButtonY+startButtonHeight) {
    startButtonColour=lightBlue;
  } else {
    startButtonColour=blue;
  }
  if (mouseX>pauseButtonX && mouseY>pauseButtonY && mouseX<pauseButtonX+pauseButtonWidth && mouseY<pauseButtonY+pauseButtonHeight) {
    pauseButtonColour=lightBlue;
  } else {
    pauseButtonColour=blue;
  }
  if (mouseX>quitButtonX && mouseY>quitButtonY && mouseX<quitButtonX+quitButtonWidth && mouseY<quitButtonY+quitButtonHeight) {
    quitButtonColour=lightRed;
  } else {
    quitButtonColour=red;
  }
}

void keyPressed() {
  if (keyCode==ESC) pause=true;
  if (keyCode==ESC) key = 0;
}

void mousePressed() {
  if (start==false && mouseX>startButtonX && mouseY>startButtonY && mouseX<startButtonX+startButtonWidth && mouseY<startButtonY+startButtonHeight) {
    start=true;
    pause=true;
  }
  if (pause==true && mouseX>pauseButtonX && mouseY>pauseButtonY && mouseX<pauseButtonX+pauseButtonWidth && mouseY<pauseButtonY+pauseButtonHeight) pause=false;
  if (pause==true && mouseX>quitButtonX && mouseY>quitButtonY && mouseX<quitButtonX+quitButtonWidth && mouseY<quitButtonY+quitButtonHeight) exit();
}
