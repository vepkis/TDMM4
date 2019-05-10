class Mundo
{

  Pelotita p= new Pelotita ();
  Espejo e= new Espejo();

  Mundo()
  {
  }


  void dibuja()
  {
    p.dibuja();
    funcionEvaluadora();
    e.dibuja();
  }


  void funcionEvaluadora()

  {
    if (  p.getMovPelotita()< p.getTam()*2.5)
    {
      e.setTam("crece");
    } else
    {
      e.setTam("nada");
    }
  }


  void mouseDragged()
  {
    p.mouseDragged();
  }


  void keyPressed()
  {
    e.keyPressed();
    p.keyPressed();
  }
}// cierra class mundo
