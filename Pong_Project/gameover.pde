void gameover() {  
  //Blinking
    winnerblink = winnerblink + 10;
    if (winnerblink == 300) winnerblink = 0;
    
  //Winner Display
  fill(255,255,0);
  textSize(40);
  text("PRESS ANYWHERE TO GO BACK", width/2, 500);
  textFont(pixel);
  if (leftscore > rightscore) {
    if (winnerblink < 150) {
      fill(255);
      text("PLAYER 1 WINS", width/2-2, height/2);    
      text("PLAYER 1 WINS", width/2, height/2-2);
      text("PLAYER 1 WINS", width/2+2, height/2);
      text("PLAYER 1 WINS", width/2, height/2+2);
      fill(pink);
      text("PLAYER 1 WINS", width/2, height/2);
    } if (winnerblink > 150) {
      fill(0);
      text("PLAYER 1 WINS", width/2-2, height/2);    
      text("PLAYER 1 WINS", width/2, height/2-2);
      text("PLAYER 1 WINS", width/2+2, height/2);
      text("PLAYER 1 WINS", width/2, height/2+2);
      text("PLAYER 1 WINS", width/2, height/2);
    }
  } else if (leftscore < rightscore && AIon == false) {
    if (winnerblink < 150) {
      fill(255);
      text("PLAYER 2 WINS", width/2-2, height/2);   
      text("PLAYER 2 WINS", width/2, height/2-2);   
      text("PLAYER 2 WINS", width/2+2, height/2);   
      text("PLAYER 2 WINS", width/2, height/2+2);   
      fill(green);
      text("PLAYER 2 WINS", width/2, height/2); 
    } if (winnerblink > 150) {
      fill(0);
      text("PLAYER 2 WINS", width/2-2, height/2);   
      text("PLAYER 2 WINS", width/2, height/2-2);   
      text("PLAYER 2 WINS", width/2+2, height/2);   
      text("PLAYER 2 WINS", width/2, height/2+2);   
      text("PLAYER 2 WINS", width/2, height/2);
    }
  } else if (leftscore < rightscore && AIon == true) {
    if (winnerblink < 150) {
      fill(255);
      text("AI WINS", width/2-2, height/2);   
      text("AI WINS", width/2, height/2-2);   
      text("AI WINS", width/2+2, height/2);   
      text("AI WINS", width/2, height/2+2);   
      fill(green);
      text("AI WINS", width/2, height/2);    
    } if (winnerblink > 150) {
      fill(0);
      text("AI WINS", width/2-2, height/2);   
      text("AI WINS", width/2, height/2-2);   
      text("AI WINS", width/2+2, height/2);   
      text("AI WINS", width/2, height/2+2);   
      text("AI WINS", width/2, height/2);   
    }
  }
}

void gameoverClicks() {
    mode = INTRO;
    leftx = 0;
    lefty = height/2;
    rightx = width;
    righty = height/2;
    ballx = width/2;
    bally = height/2;
    balld = 100;
    rightscore = 0;
    leftscore = 0;
    timer = 100;
    AIon = false;
    winnerblink = 0;
    bgsound.pause();
    bgsound.rewind();
    leftgoal = false;
    rightgoal = false;
}
