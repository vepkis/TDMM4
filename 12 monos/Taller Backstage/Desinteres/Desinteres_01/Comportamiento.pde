class Comportamiento
{

  BolitaReactiva [] bolitas= new BolitaReactiva[20];
  BolitaReactiva boli;


  Punktum p= new Punktum ();
  Comportamiento()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i]= new BolitaReactiva();
    }
    boli= new BolitaReactiva();
  }


  void dibuja()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i].dibuja();
    }
    boli.dibuja();

    if (p.getExiste())
    {
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistancia(p.getPosXY()[0], p.getPosXY()[1]);
        bolitas[i].evaluaAvance(p.getPosXY()[0], p.getPosXY()[1]);
      }

      boli.evaluaDistancia(random(width), random(height));
      boli.evaluaAvance(random(width), random(height));
    }
    if (p.getExiste()==false)
    {  
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistanciaDos(bolitas[i].getPosXY()[0], bolitas[i].getPosXY()[1]);
        bolitas[i].evaluaRegreso();
      }

      boli.evaluaDistanciaDos(boli.getPosXY()[0], boli.getPosXY()[1]);
      boli.evaluaRegreso();
    }

    p.creaPunktum();
  }

  void mousePressed()
  {
    p.setPosicion(mouseX, mouseY);
    p.setExiste(true);
  }

  void keyPressed()

  {
  }
}//cierra clase Comportamiento
