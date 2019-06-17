class Mundo
{
  Cascabel c;
  Fantasmas f;
  Fantasmas []fant= new Fantasmas[4];


  float pA, pB, pX, pY;
  color farbe= RGB;
  Mundo ()
  {
    c= new Cascabel();
    f= new Fantasmas();
    for (int i =0; i< fant.length; i++)
    {
      fant[i]= new Fantasmas(f.pZonaX, f.pZonaY, f.pZonaTam);
    }
  }

  void dibuja()

  {
    //    c.setPxPy(mouseX, mouseY);
    c.dibuja();
    /*  f.dibuja();
     for (int i =0; i< fant.length; i++)
     {
     fant[i].dibuja();
     }
     */
  }
}//cierra class Mundo
