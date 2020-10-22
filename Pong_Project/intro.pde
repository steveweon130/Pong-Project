void intro() {
  background(0);
  bgsound.play();
  
  //Center Line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, height);
  
  //Draw Paddles
  fill(pink);
  circle(leftx, lefty, leftd);
  fill(green);
  circle(rightx, righty, rightd);
  
  //Title
  textFont(pixel);
  textSize(150);
  fill(255);
  text("PONG", width/2-3, height*0.3);
  text("PONG", width/2, height*0.3-3);
  text("PONG", width/2+3, height*0.3);
  text("PONG", width/2, height*0.3+3);
  fill(0);
  text("PONG", width/2, height*0.3);
  
  //Single Player Mode
  stroke(255);
  strokeWeight(5);
  textSize(50);
  //Tactile
  if (mouseX > 150 && mouseX < 350 && mouseY > 300 && mouseY < 500) fill(255,255,0);
  else fill(0);
  rect(250, 400, 200, 100);
  fill(255);
  text("vs AI", 250, 400);
  
  //Double Player Mode
  //Tactile
  if (mouseX > 450 && mouseX < 650 && mouseY > 300 && mouseY < 500) fill(255,255,0);
  else fill(0);
  rect(550, 400, 200, 100);
  fill(255);
  text("vs P2", 550, 400);
  
}

void introClicks() {
  //vs AI
  if (mouseX > 150 && mouseX < 350 && mouseY > 300 && mouseY < 500) {
    mode = GAME;
    AIon = true;
  }
  
  //vs P2
  if (mouseX > 450 && mouseX < 650 && mouseY > 300 && mouseY < 500) {
    mode = GAME;
    AIon = false;
  }
}
