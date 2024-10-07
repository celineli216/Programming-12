class Timer {
  int startTime;
  int curTime;
  int countTime;
  int elapsedTime;

  Timer(int t) {
    countTime = t;
    startTime = millis();
  }
  
  void start(){
    startTime = millis();
  }

  void show() {
    fill(0);
    textSize(50);
    text(curTime, 390, 100);
  }
  void act() {
    elapsedTime = (millis() - startTime)/1000;
    curTime = countTime - elapsedTime;
    
    if(curTime <= -1){
      curTime = -1;
      
    }
    



  }
  
}
