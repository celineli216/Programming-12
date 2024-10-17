Button start;

void intro(){
  background(255);
  startButton();
  startFunc();
   

  
}

void startButton(){
  start = new Button("START", 400, 300, 100, 50, blue, green);
  
  start.show();
  
}

void startFunc(){
  if(start.clicked) mode ++;
}
