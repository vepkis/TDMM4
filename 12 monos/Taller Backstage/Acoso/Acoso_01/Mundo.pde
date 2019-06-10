class Mundo
{
  Narciso n;
  Acosadore a;

  float pA, pB, pX, pY;
  color farbe= RGB;
  Mundo ()
  {
    rectMode(CORNERS);
    n= new Narciso();
    a= new Acosadore();
  }

  void dibuja()

  {
    n.setPxPy(mouseX, mouseY);
    n.dibuja();
    a.dibuja();
  }


  void setRectangulito(float pA, float pB, float pX, float pY)
  {
    rect (pA, pB, pX, pY);
  }


  void estilo(int grosor_, boolean relleno_)
  {
    strokeWeight(grosor_);
    if (relleno_)
    {
      fill(farbe);
    } else {
      noFill();
    }
  }
}//cierra class Mundo
