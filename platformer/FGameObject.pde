class FGameObject extends FBox {
  
  FGameObject(float w, float h) {
    super(w, h);
  }

  void act() {
  }//end act--------------------


  boolean isTouching(String n) {
    ArrayList <FContact> contacts =  getContacts();
    for (int i=0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }//end of check contacts===========
}
