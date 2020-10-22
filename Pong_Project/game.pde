void game() {
  background(0);

  //Center Line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, height);
  
  //Scoreboard
  textSize(50);
  textFont(pixel);
  fill(pink);
  text(leftscore, width/4, 100);
  fill(green);
  text(rightscore, 3*width/4, 100);
  timer = timer - 1;
    
  //Draw Paddles
  fill(pink);
  circle(leftx, lefty, leftd);
  fill(green);
  circle(rightx, righty, rightd);
  
  //Move Paddles
  if (wkey == true) lefty = lefty - 7.5;
  if (skey == true) lefty = lefty + 7.5;
  if (AIon == false) {
    if (upkey == true) righty = righty - 7.5;
    if (downkey == true) righty = righty + 7.5;
  } else { //AI
    if (ballx > width/2) {
      if (bally < righty) righty = righty - 5;
      if (bally > righty) righty = righty + 5;
    }
  }
    
  //Draw Ball
  fill(lightPurple);
  circle(ballx, bally, balld);
  
  //Pause On
  if (pauseon == true) mode = PAUSE;    
  
  //Key Instruction
  if (timer > 0 && AIon == true) { //Single Player Instruction
    strokeWeight(5);
    stroke(255);
    textSize(40);
    fill(0);
    rect(150, 240, 50, 50);
    rect(150, 360, 50, 50);
    rect(width/2, 500, 300, 50);
    fill(255);
    triangle(150, 170, 175, 200, 125, 200);
    triangle(150, 430, 175, 400, 125, 400);
    text("W", 150, 240);
    text("S", 150, 360);
    text("PAUSE", width/2, 500);
  } else if (timer > 0 && AIon == false) { //Double Player Instruction
    strokeWeight(5);
    stroke(255);
    textSize(40);
    fill(0);
    rect(150, 240, 50, 50);
    rect(150, 360, 50, 50);
    rect(width-150, 240, 50, 50);
    rect(width-150, 360, 50, 50);  
    rect(width/2, 500, 300, 50);
    fill(255);
    triangle(150, 170, 175, 200, 125, 200);
    triangle(150, 430, 175, 400, 125, 400);
    triangle(width-150, 170, width-175, 200, width-125, 200);
    triangle(width-150, 430, width-175, 400, width-125, 400);
    text("W", 150, 240);
    text("S", 150, 360);
    text("PAUSE", width/2, 500);
    textSize(20);
    text("UP", width-150, 240);
    text("DOWN", width-150, 360);
  } else if (timer < 0) { //Move Ball
    ballx = ballx + vx;
    bally = bally + vy;
    leftgoal = false;
    rightgoal = false;
  }
  
  //Left Blinking after scoring
  textFont(pixel);
  if (scoreblink == 300) scoreblink = 0;
  if (leftgoal == true) {
    scoreblink = scoreblink + 10;
    if (timer > 0 && scoreblink > 150) {
      fill(255,255,0);
      text(leftscore, width/4, 100);
    } if (timer >= 100 && scoreblink < 150) {
      fill(0);
      text(leftscore, width/4, 100);
    }
  }
  
  //Right Blinking after scoring
  if (rightgoal == true) {
    scoreblink = scoreblink + 10;
    if (timer > 0 && scoreblink > 150) {
      fill(255,255,0);
      text(rightscore, 3*width/4, 100);
    } if (timer >= 100 && scoreblink < 150) {
      fill(0);
      text(rightscore, 3*width/4, 100);
    }
  }
  
  //Scoring
  if (ballx < 0) {
    if (rightscore < 3) {
      scoresound.rewind();
      rightscore++;
      ballx = width/2;
      bally = height/2;
      timer = 100;
      scoresound.play();
      rightgoal = true;
    } if (rightscore >= 3) mode = GAMEOVER;
  }
  if (ballx > width) {
    if (leftscore < 3) {
      scoresound.rewind();
      leftscore++;
      ballx = width/2;
      bally = height/2;
      timer = 100;
      scoresound.play();
      leftgoal = true;
    } if (leftscore >= 3) mode = GAMEOVER;
  }
    
  //Bounce Ball
  if (bally < balld/2 || bally > height-balld/2) {
    wallsound.rewind(); 
    vy = vy * -1;
    wallsound.play();
  }
  
  //Limit Paddles
  if (lefty < leftd/2) lefty = leftd/2;
  if (lefty > height-leftd/2) lefty = height-leftd/2;
  if (righty < rightd/2) righty = rightd/2;
  if (righty > height-rightd/2) righty = height-rightd/2;
  
  //Bounce Paddles
  if (dist(leftx, lefty, ballx, bally) <= balld/2 + leftd/2) {
    leftsound.rewind();
    vx = (ballx - leftx)/10;
    vy = (bally - lefty)/10;
    if (bally < balld/2) bally = balld/2;
    if (bally > height-balld/2) bally = height-balld/2;
    leftsound.play();
  }
  if (dist(rightx, righty, ballx, bally) <= balld/2 + rightd/2) {
    rightsound.rewind();
    vx = (ballx - rightx)/10;
    vy = (bally - righty)/10;
    if (bally < balld/2) bally = balld/2;
    if (bally > height-balld/2) bally = height-balld/2;
    rightsound.play();
  }
}
