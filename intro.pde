void intro(){
  
  background(0);
  introScene.show();
  introButton.show();
  if(introButton.clicked){
    mode = 2;
  }
  //if(mousePressed) mode = 2;
}
