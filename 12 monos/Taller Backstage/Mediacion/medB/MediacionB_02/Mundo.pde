class Mundo
{


  Flipeador [] flipper= new Flipeador[2];
  EntradaSalida es;
  BolitaLoca boli;

  String etapas="inicio";

  Mundo()
  {
    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i]= new Flipeador ((width/3), (height/2)*i, width/3, height/2);
    }

    es= new EntradaSalida(width, height, 3, 1);
    boli= new BolitaLoca(0, 0, es.getTamXY()[0], es.getTamXY()[1]);
  }

  Mundo(float ancho_, float alto_, float cantW_, float cantH_)
  {
    float tamX=ancho_/cantW_;
    float tamY=alto_/cantH_;

    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i]= new Flipeador (tamX, tamY*i, tamX, tamY);
    }

    es= new EntradaSalida(cantW_, cantH_);
    boli= new BolitaLoca(0, tamX, 0, tamX);
  }

  void dibuja()
  {
    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i].setUserXY(mouseX, mouseY);
      flipper[i].dibuja();
    }

    es.dibuja();
    boli.comportamiento();
    boli.dibuja();
    recorrido();
  }

  void recorrido()
  {

    if (flipper[0].getCambia() && flipper[1].getCambia()==false && etapas=="inicio")
    {
      etapas="iterin_1";
    }

    // reducir el campo de rebote

    if (flipper[0].getCambia() && flipper[1].getCambia()&& etapas=="paso_1")
    {
      etapas="iterin_2";
    }




    if (etapas=="iterin_1" && boli.getPosXY()[0]> flipper[0].getLimites()[0]+(boli.getTam()*2))
    {

      etapas="paso_1";
    }

    if (etapas=="iterin_2" && boli.getPosXY()[1]> flipper[1].getLimites()[1]+(boli.getTam()*2) && boli.getPosXY()[0]>flipper[1].getLimites()[0])
    {
      flipper[0].setCambia(false);
      etapas="paso_2";
    }

    if (etapas=="paso_2" && boli.getPosXY()[1]> es.getLimites()[1][1]+(boli.getTam()*2) && boli.getPosXY()[0]>es.getLimites()[1][0]+(boli.getTam()*2))
    {
      flipper[1].setCambia(false);

      etapas="fin";
    }


    avance();
    //   println(flipper[0].getCambia()+"___etapas___"+etapas);
  }

  void avance()
  {
    if (etapas=="inicio")
    {
      boli.setLimitesNuevos(es.getLimites()[0][0], es.getLimites()[0][1], es.getLimites()[0][2], es.getLimites()[0][3]);
      println(es.getLimites()[0][0]);
    }

    if (etapas=="iterin_1")
    {
      boli.setLimitesNuevos(es.getLimites()[0][0], es.getLimites()[0][1], flipper[0].getLimites()[2], flipper[0].getLimites()[3]);
      println(flipper[0].getLimites()[3]);
    }    

    if (etapas=="paso_1")
    {
      boli.setLimitesNuevos(flipper[0].getLimites()[0], flipper[0].getLimites()[1], flipper[0].getLimites()[2], flipper[0].getLimites()[3]);
    }

    if (etapas=="iterin_2")
    {
      boli.setLimitesNuevos(flipper[0].getLimites()[0], flipper[0].getLimites()[1], flipper[1].getLimites()[2], flipper[1].getLimites()[3]);
    }  

    if (etapas=="paso_2")
    {
      boli.setLimitesNuevos(flipper[1].getLimites()[0], flipper[1].getLimites()[1], es.getLimites()[1][2], es.getLimites()[1][3]);
    }

    if (etapas=="fin")
    {
      boli.setLimitesNuevos(es.getLimites()[1][0], es.getLimites()[1][1], es.getLimites()[1][2], es.getLimites()[1][3]);
    }
  }

  void mousePressed()
  {
    for (int i= 0; i< flipper.length; i++)
    {
      flipper[i].mousePressed();
    }
  }
  void keyPressed()
  {
    if (key=='e')
    {
      etapas="esperando";
    }
    println(key);
  }
}//cierra class Mundo
