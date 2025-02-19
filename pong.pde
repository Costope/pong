// The names of the variables are german

float BalkenX = 0;
float BallX = 250;
float BallY = 200;
float BallSx = 100;
float BallSy = 100;
float score = 0;

void setup(){
  size(500, 500);
  noStroke();
  windowTitle("Pong");
  noCursor();

  BallSx = random(-5, 5);
  while (abs(BallSx) < 2) {
    BallSx = random(-5, 5);
  }

  BallSy = random(-5, 5);
  while (abs(BallSy) < 2) {
    BallSy = random(-5, 5);
  }
}

void draw(){
  background(0, 172, 230);
  textSize(12);
  textAlign(LEFT, TOP);
  text("BalkenX: " + BalkenX, 1, 10);
  text("BallX: " + BallX, 1, 20);
  text("BallY: " + BallY, 1, 30);
  text("MouseX: " + mouseX, 1, 40);
  text("MouseY: " + mouseY, 1, 50);
  text("BallSx: " + BallSx, 1, 60);
  text("BallSy: " + BallSy, 1, 70);
  text("Score: " + round(score), 1, 80);
  
  // Ball
  fill( #1f7da8 );
  ellipse(BallX, BallY, 40, 40);
  BallX += BallSx;
  BallY += BallSy;
  
  // Wände
  if (BallX - 20 <= 0 || BallX + 20 >= width) {
    BallSx = -BallSx;
  }
  if (BallY - 20 <= 0) {
    BallSy = -BallSy;
  }
  
  if (BallY + 20 >= 420 && BallY + 20 <= 470 && BallX >= BalkenX && BallX <= BalkenX + 100 && BallSy > 0) {
    BallSy = -BallSy;
    score += 1;
    
    BallSx = constrain(BallSx, -10, 10);
    BallSy = constrain(BallSy, -10, 10);
    
    if (abs(BallSx) < 10 && abs(BallSy) < 10){
      BallSx *= 1.06;
      BallSy *= 1.06;
    }
  }
  
  // Balken
  fill(#ffffff);
  rect(BalkenX, 420, 100, 50, 8);
  BalkenX = mouseX - 50;
  
  
  if (BalkenX > width - 100) {
    BalkenX = width - 100;
  }
  if (BalkenX < 0) {
    BalkenX = 0;
  }
  
  if (BallY >= 500 + 20){
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Game Over!\nScore: " + round(score), width/2, height/2);
    textSize(20);
    text("Press ENTER to play again.", width/2, height - 130);
    text("Press ESC to close the game.", width/2, height - 100);
    if (keyPressed == true && key == ESC){
      exit();
    }
    else if (keyPressed == true && key == ENTER){
      restart();
    }
  }
}

void restart(){
  BallX = 250;
  BallY = 200;
  BallSx = 100;
  BallSy = 100;
  score = 0;
  setup();
}
 
