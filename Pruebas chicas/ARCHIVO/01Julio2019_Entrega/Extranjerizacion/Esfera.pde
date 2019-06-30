class Esfera {

  int pX, pY, radio;
  color c; 


  Esfera(int radio_, int px_, int py_, color c_) {
    pX=px_;
    pY=py_;
    radio=radio_;
    c=c_;
  } 


  void dibujar() {
    fill(c);
    ellipse(pX, pY, radio*2, radio*2);
  }    


  void mover(int px_, int py_) {
    pX=px_;
    pY=py_;
  } 


  int PosX() {
    return pX;
  }  

  int PosY() {
    return pY;
  }  

  int Radio() {
    return radio;
  }  


  color col() {
    return c;
  }  

  void setColor(color c_) {
    c=c_;
  }
}
