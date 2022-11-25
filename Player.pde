class Player {
  Player() {
    playerX = width/2;
    playerY = height/2;
    playerSize = 32;
    maxSpeed = 10;
    playerSpeedX = 0;
    playerSpeedY = 0;
  }
  void update() {
    if (left==true) {
      playerSpeedX = -maxSpeed;
    }
    if (right==true) {
      playerSpeedX = maxSpeed;
    }
    if (up==true && down==false) {
      playerSpeedY = maxSpeed;
    }
    if (down==true && up==false) {
      playerSpeedY = -maxSpeed;
    }
    if ((left==false && right==false) || (left==true && right==true)) {
      playerSpeedX=0;
    }
    if ((down==false && up==false) || (down==true && up==true)) {
      playerSpeedY=0;
    }
    playerX += playerSpeedX;
    playerY += playerSpeedY;
  }
  void display() {
    fill(255, 0, 0);
    square(playerX, playerY, playerSize);
  }
}
