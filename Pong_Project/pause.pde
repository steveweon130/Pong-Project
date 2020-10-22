void pause() {
  bgsound.pause();
  bgsound.rewind();
  fill(255);
  textSize(100);
  text("PAUSED", width/2, height/2);
  
  //Replay
  if (pauseon == false) {
    mode = GAME;
    bgsound.play();
  }
}
