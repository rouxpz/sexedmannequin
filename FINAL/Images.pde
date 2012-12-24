class Images {
  PImage sexed;
  float a; //alpha value
  float decrease; //alpha decrease value;
 // boolean fade;
  
  Images (String filename, float tempA) {
    sexed = loadImage (filename);
    a = tempA;
    //fade = false;
  }
  
  void display() {
    tint(255,a);
    image(sexed,0,0);
  }
  
  void fade () {
    a = a-decrease;
  }
}
