class Mundo
{
  Frontera f;
  ZonaColor zC;
  BolitaLoca b;

  Mundo()
  {
    f= new Frontera();
    zC=new ZonaColor(f.getPuertas()[0][2], f.getPuertas()[0][1], width, height);
    b= new BolitaLoca(0, 0, f.getPuertas()[0][0], f.getPuertas()[1][3]);
  }


  void dibuja()
  {
    f.evaluaIngresante(mouseX, mouseY);
    f.dibuja();
    zC.dibuja();
    compBolita();
    b.dibuja();
  }

  void compBolita()
  {
    b.comportamiento();
  }


  void mousePressed ()
  {
    zC.mousePressed();
  }
}//cierra class Mundo
