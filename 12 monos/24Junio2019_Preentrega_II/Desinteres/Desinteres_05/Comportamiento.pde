class Comportamiento
{
  int cant=24;
  BolitaReactiva [] bolitas= new BolitaReactiva[cant];
  BolitaReactiva boli;
  Punktum p= new Punktum ();

  boolean [] guardaLlegada=new boolean [cant];
  int comodin=0, cual=0, cualDos= 0;
  float rotacion=0.5;
  Comportamiento()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i]= new BolitaReactiva();
      guardaLlegada[i]= false;
    }
    boli= new BolitaReactiva(random(bolitas[0].getTam(), width/2+bolitas[0].getTam()), random(bolitas[0].getTam(), height/2+bolitas[0].getTam()));
    boli.setPosXYPrevia(boli.getPosXY()[0], boli.getPosXY()[1]);
    boli.setPosXY(boli.getTam(), 0);
    boli.setIntColor(2);
  }


  void dibuja()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i].dibuja();
    }

    pushMatrix();
    translate(boli.getPPosXY()[0], boli.getPPosXY()[1]);
    rotate(radians(PI+rotacion));
    boli.dibuja();
    popMatrix();

    if (p.getExiste())
    {
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistancia(p.getPosXY()[0], p.getPosXY()[1]);
        bolitas[i].evaluaAvance(p.getPosXY()[0], p.getPosXY()[1]);
      }
      rotacion+=2.5;
    }
    if (p.getExiste()==false)
    {  
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistanciaDos(bolitas[i].getPosXY()[0], bolitas[i].getPosXY()[1]);
        bolitas[i].evaluaRegreso();
      }

      p.setCrono(0);
      rotacion+=2.5;
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
