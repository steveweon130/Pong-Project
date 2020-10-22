//Pong Project
//Steve Weon
//1-2a
//Oct, 15, 2020 ~ Oct, 21, 2020

//Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer leftsound, rightsound, wallsound, scoresound, bgsound;

//Colors
color pink = #FF0F53;
color green = #558A67;
color lightPurple = #BF9A82;
color brown = #45201E;
color darkblue = #003049;

//Fonts
PFont pixel;

//Mode Framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//Entity Variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld, vx, vy; //ball
boolean pauseon, AIon;

//Scoring
int leftscore, rightscore, timer, scoreblink, winnerblink;
boolean leftgoal, rightgoal;

//Keyboard Variables
boolean wkey, skey, upkey, downkey;

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  //Sound
  minim = new Minim(this);
  leftsound = minim.loadFile("leftpaddle.wav");
  rightsound = minim.loadFile("rightpaddle.wav");
  wallsound = minim.loadFile("wall.wav");
  scoresound = minim.loadFile("score.wav");
  bgsound = minim.loadFile("bg.mp3"); // https://www.youtube.com/watch?v=_dIixq6Y15Q&list=PLJvmvIVC7FtA0YHExWefOKFEf811KRHtd&index=2
  
  //Volume
  leftsound.setGain(-30);
  rightsound.setGain(-30);
  wallsound.setGain(-30);
  scoresound.setGain(-30);
  bgsound.setGain(-30);
  
  //Font
  pixel = createFont("Pixel.TTF", 100);
  
  //Initialize Paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //Initialize Ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  vx = random(-3, 3);
  vy = random(-3, 3);
  
  //Initialize Score
  rightscore = leftscore = 0;
  timer = 100;
  leftgoal = rightgoal = false;
  scoreblink = winnerblink = 0;
  
  //Initialize AI
  AIon = false;
  
  //Initialize Pause key
  pauseon = false;
  
  //Initialize Keyboard Variables
  wkey = skey = upkey = downkey = false;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
