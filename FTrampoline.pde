class FTrampoline extends FGameObject{
  

  FTrampoline(float x, float y){
    super(gridSize, gridSize);
    setPosition(x, y);
    attachImage(blueCobble);
    setRotatable(false);
    setStatic(true);
  }
  
  void act(){
    if(t1Access){
      setRestitution(4);
      attachImage(trampoline);
    }
  }//end act========
}//end FTrampoline============
