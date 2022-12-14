int appWidth, appHeight;
float startButtonX, startButtonY, startButtonWidth, startButtonHeight, roundCorners;
float pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
float exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight;
Boolean start=false, trueStart=false, pause=false;
Boolean left = false, right = false, up = false, down = false;
color startButtonColour, startButtonTextColour, pauseButtonColour, pauseButtonTextColour, quitButtonColour, quitButtonTextColour, exitButtonColour, exitButtonTextColour;
color purple = color(127.5, 0, 255), lightBlue = color(150, 150, 255), blue = color(0, 0, 255), grassGreen = color(10, 90, 10), red = color(255, 0, 0), lightRed = color(255, 150, 150), white = color(255, 255, 255), black = color(0, 0, 0);
PImage backgroundImage;
float playerX, playerY, playerSize;
float playerSpeedX, playerSpeedY, maxSpeed;

void setup() {
  fullScreen();
  size(displayWidth, displayHeight);
  backgroundImage = loadImage("Images/Landscape/grass_background.jpg");
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
  exitButtonX = appWidth*19/20-quitButtonWidth;
  exitButtonY = quitButtonY;
  exitButtonHeight = quitButtonHeight;
  exitButtonWidth = quitButtonWidth;
  playerX = width/2;
  playerY = height/2;
  playerSize = 32;
  maxSpeed = 10;
}

void draw() {
  if (start==false) {
    pause=true;
    background(purple);
    fill(startButtonColour);
    rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight, roundCorners);
    fill(startButtonTextColour);
    textSize(appHeight/9);
    text("Press Here to Start!", startButtonX, startButtonHeight*21/20);
  } else {
    image(backgroundImage, 0, 0, width, height);
    if (pause==true) {
      fill(pauseButtonColour);
      rect(pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight, roundCorners);
      fill(pauseButtonTextColour);
      textSize(pauseButtonWidth/3.75);
      text("Unpause", pauseButtonX, startButtonHeight*11/10);
      fill(quitButtonColour);
      rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight, roundCorners);
      fill(quitButtonTextColour);
      textSize(quitButtonHeight*49/50);
      text("Quit", quitButtonX, startButtonHeight*11/10);
      fill(exitButtonColour);
      rect(exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight, roundCorners);
      fill(exitButtonTextColour);
      textSize(exitButtonHeight/2.35);
      text("Exit Game", exitButtonX, startButtonHeight*21/20);
    } else {
      fill(255, 0, 0);
      square(playerX, playerY, playerSize);
    }
  }
  //
  println ("start:", start);
  println ("pause:", pause);
  if (start==false && mouseX>startButtonX && mouseY>startButtonY && mouseX<startButtonX+startButtonWidth && mouseY<startButtonY+startButtonHeight) {
    startButtonColour=lightBlue;
    startButtonTextColour=blue;
  } else {
    startButtonColour=blue;
    startButtonTextColour=lightBlue;
  }
  if (start==true && pause==true && mouseX>pauseButtonX && mouseY>pauseButtonY && mouseX<pauseButtonX+pauseButtonWidth && mouseY<pauseButtonY+pauseButtonHeight) {
    pauseButtonColour=lightBlue;
    pauseButtonTextColour=blue;
  } else {
    pauseButtonColour=blue;
    pauseButtonTextColour=lightBlue;
  }
  if (start==true && pause==true && mouseX>quitButtonX && mouseY>quitButtonY && mouseX<quitButtonX+quitButtonWidth && mouseY<quitButtonY+quitButtonHeight) {
    quitButtonColour=lightRed;
    quitButtonTextColour=red;
  } else {
    quitButtonColour=red;
    quitButtonTextColour=lightRed;
  }
  if (start==true && pause==true && mouseX>exitButtonX && mouseY>exitButtonY && mouseX<exitButtonX+exitButtonWidth && mouseY<exitButtonY+exitButtonHeight) {
    exitButtonColour=white;
    exitButtonTextColour=black;
  } else {
    exitButtonColour=black;
    exitButtonTextColour=white;
  }
  if (playerX + playerSize < 0) playerX = appWidth;
  if (playerX > appWidth) playerX = 0 - playerSize;
  if (playerY + playerSize < 0) playerY = appHeight;
  if (playerY > appHeight) playerY = 0 - playerSize;
}

void keyPressed() {
  if (pause==false) {
    if (keyCode==ESC) pause=true;
  } else {
    if (keyCode==ESC) pause=false;
  }
  if (keyCode==ESC) key = 0;
  if (key=='w' || key=='W') playerY -= maxSpeed;
  if (key=='s' || key=='S') playerY += maxSpeed;
  if (key=='a' || key=='A') playerX -= maxSpeed;
  if (key=='d' || key=='D') playerX += maxSpeed;
  if (key=='w' || key=='W' && key=='s' || key=='S') playerY += 0;
  if (key=='a' || key=='A' && key=='d' || key=='D') playerX += 0;
  if (keyCode==SHIFT) maxSpeed = 20;
}

void keyReleased() {
  if (keyCode==SHIFT) maxSpeed = 10;
}

void mousePressed() {
  if (start==false && mouseX>startButtonX && mouseY>startButtonY && mouseX<startButtonX+startButtonWidth && mouseY<startButtonY+startButtonHeight) {
    start=true;
    pause=true;
  }
  if (pause==true && mouseX>pauseButtonX && mouseY>pauseButtonY && mouseX<pauseButtonX+pauseButtonWidth && mouseY<pauseButtonY+pauseButtonHeight) pause=false;
  if (pause==true && mouseX>quitButtonX && mouseY>quitButtonY && mouseX<quitButtonX+quitButtonWidth && mouseY<quitButtonY+quitButtonHeight) start=false;
  if (pause==true && mouseX>exitButtonX && mouseY>exitButtonY && mouseX<exitButtonX+exitButtonWidth && mouseY<exitButtonY+exitButtonHeight) exit();
}
